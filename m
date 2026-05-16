Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B470CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4D9TU4wbPOxf81ZEi+B2KAXSsg/gQY5aGIg2JGwQSM=; b=O4R4QzhT9yafMXRXg35Mnnt0sU
	cspcniHQ1TZg9wLd88KX4OY1Qu/t+qpQPuMjb3qDN+joyVPx4G99DOR8F6EWGe3Bbve8hSOMMk0Nv
	hjdzgHWLCrZwOds823koAw3MdHJG6a+6pDQMyLY4yDrcBr2P+kOJCazhDQXcdznYgVFCeX/8tZT44
	2iIHVfcwCnUsBwJ0aK9ja+rOK/Sj+Z0K2ZuePycpHmkorz6mBafZJTjauVnSY4vUS0CZfaoORK3Oa
	jP1kJNOpX5FctNJd13gBtLFD/ME8z/U66MgfVdsa3fqCJ+OiwxYMxg3gfBTMet+c5vKYQyzK1u75r
	9mVyqOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOE8p-0000000AiD3-0ciJ;
	Sat, 16 May 2026 12:29:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOE8n-0000000AiCX-0bY6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 12:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0E564016C;
	Sat, 16 May 2026 12:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD63C19425;
	Sat, 16 May 2026 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778934551;
	bh=ID6AvTJI1rntp7uaS48ci1VkqVXb8TdUA/KgD6Y/23g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sWnapfEbTF3GZ2MS8DWLt9k70GuNIxNGz8KniodbJ2KnhB8AHjLdSCuTqTeNUD/zX
	 8FFGB+SttcoSQN6WqDQ/WnL0ATbbg6accy08owaJLxc6GQXV2hg+KX7sl+y8GbI7WP
	 4cGHZLnsQC1VTnf4MUEc+4xjss1bImA+S3ZH8a8Ek7Pyt2ty/YAQ0vVwJfd9/U9MWd
	 As5zi6t8KO9oYvcKemwQjkitN5qLsb5/awUxcM/pMTqmIXOqqFCeAzT4VA0mWrStzC
	 QnKekUy64mXLWdgz2QgdPrS0UJ5i+E6mvLelYpi1TPFocXFCteuJAF1A0q3m2OtJ9W
	 1i8vxf2XeIqoQ==
Date: Sat, 16 May 2026 13:29:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Salih Erim <salih.erim@amd.com>
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
 anand.ashok.dumbre@xilinx.com, andy@kernel.org, conall.ogriofa@amd.com,
 dlechner@baylibre.com, manish.narani@xilinx.com, michal.simek@amd.com,
 nuno.sa@analog.com, Jonathan.Cameron@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 0/3] iio: adc: xilinx-ams: refactor alarm handling to
 table-driven design
Message-ID: <20260516132902.30edeaa7@jic23-huawei>
In-Reply-To: <0ae1a3d0-cc51-4d5f-997c-04d3114121ca@amd.com>
References: <20260513003503.339418-1-guilherme.bozi@usp.br>
	<0ae1a3d0-cc51-4d5f-997c-04d3114121ca@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_052913_205428_59B566E0 
X-CRM114-Status: GOOD (  13.60  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 14 May 2026 02:21:37 +0100
Salih Erim <salih.erim@amd.com> wrote:

> Hi,
> 
> On 5/13/2026 1:31 AM, Guilherme Ivo Bozi wrote:
> 
> > v3 -> v4:
> > - Removed unnecessary 'event < 0' check for type e32  
> 
> Thanks for addressing the feedback.
> Tested on ZCU102 Rev1.0. Driver probes successfully with no errors.
> 
> For the series:
> Reviewed-by: Salih Erim <salih.erim@amd.com>
> Tested-by: Salih Erim <salih.erim@amd.com>
> 

Given I think the 1st patch is a defensive fix rather than one we
actually expect to ever see (and I don't want to delay the other two),
I've applied the whole series to the testing branch of iio.git.

Once I've caught up with the review backlog and the bots have finished
playing with it, I'll push that out as togreg which gets picked up for
linux-next.

Thanks,

Jonathan

> Salih
> 


