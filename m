Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D4B1094486
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BztVlr52jyDB/PMooczhe78cc61qz4qlqThyVP3NYvo=; b=O9Dv/pKnoZai6ttxAn0zYXa3k8
	ySDcoCT16kVSasGwGMRoj5Hk1xrySv8hZr/2Y44OtPqkaBCTtfh27u0tfL4b+O2PIjyO6cuMJcCaC
	sDA4TOw4RRo83ZVdBoSoB7WDDz4U1Lb4nSn8T5OBfwcB4LZH9cEYM6bv/2aDTZIJjsgUZELwc/LyR
	Sx6ojuR8yEz4AmcK15BLyewgAaqGgZHsLEO0LeMapYJL3SiQXtPkRfiomIUQ7Lt1jKzYNxtj4vFRp
	/yXh+AZ4dF4Dm79MXT4uXIS0w6VDXyuC8YjLqRBWcxNHYybMBy2TGGsgbXTO9bVmlCL0DReqcd+yE
	RuRtGUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3yaT-0000000Ec61-13Wn;
	Sat, 21 Mar 2026 15:50:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3yaQ-0000000Ec5X-2luu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 15:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16AAE442F7;
	Sat, 21 Mar 2026 15:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49918C19421;
	Sat, 21 Mar 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774108200;
	bh=kbn1WK1P0CLV3g9NxTzimggMcG6TtSf4XHKsAXdiH8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e9dAXYUDAsN9v4x1AadURqYSlSWa9Y7mxzZIDz25fB/CvA9Fyj7XD1b8lCM9cyKMb
	 F9rKRu8DkNZUirh+lv4LOJ/xxoxthjOn0mXZRo49DpIcI7mldLM7DvvygCk8RztYhv
	 d3Koaq1whNjtTUgG2lFGA6rfl0j3AqAiIQlxwwZeM2itrO1aQEDY6rdQayBSLFY4jV
	 KdQ+p/bWaAKz5+B1wT6Oz/LcZIZlM+DgBADkf6carn+i0Ct0isAYEjuwIxZYfTnf7C
	 +juQM6z2gUQ+iqOOkPzxxjzQnqohMQvNin2+WXg7FyqqK5FABtdD8feGRyz7b+oEYL
	 f89WoEbIKQ/Zw==
Date: Sat, 21 Mar 2026 15:49:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 3/4] iio: adc: aspeed: Replace mdelay() with fsleep()
 for ADC stabilization delay
Message-ID: <20260321154951.632ef7d9@jic23-huawei>
In-Reply-To: <ab0iDUp6t2LuGlAA@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
	<20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
	<ab0iDUp6t2LuGlAA@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_085002_748930_2E1A6ECA 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, 20 Mar 2026 12:31:41 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Mar 20, 2026 at 01:46:37PM +0800, Billy Tsai wrote:
> > The ADC stabilization delays in compensation mode and battery sensing
> > mode do not require atomic context. Using mdelay() here results in
> > unnecessary busy waiting.
> > 
> > Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
> > tasks while waiting for the ADC to stabilize.
> > 
> > Also fix a minor typo in the comment ("adc" -> "ADC").  
> 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> 
> I haven't suggested the idea, I only suggested to use fsleep() for the purpose.
Dropped the tag.



> 


