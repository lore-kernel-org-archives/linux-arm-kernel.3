Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220CFCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu9JCVPAudNk1w3hXXh6HmFc7vzIsAZ5umos9e7k/Pw=; b=Msa0i9VkIlS65+VWfpK2DZ60pY
	38C8vQOcodXZ4UI4Crv7FKbB+pCy1ZOJX2dUZ9tWRBVSGiHUlW8MmQ9/n9EDuzHWXW8xNtSgBODbU
	bO0pWFVnpdeqMM1eWqbA2W1zUNRQTOH41bbLX0NCM2cd6tbp0dOJCTFrLJfhXp4/0MwQTLLpxhzJ5
	k13H1D9ZCqgnz2h1RuVbQaaAl7yarWj28aHdHuNYlTFS4Lk0ZM8b7dJnWjuz6uhwhkTYywbgMnMiI
	+XZ1j7ZwM3J7FtgkL3s+4DBGNqZKiW4o0XC5UkWFw/5+MPQeGGNYIqROOKCf+uK0quX+70ajGxutl
	Nd6gnM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zl-00000008txP-3Q1s;
	Tue, 09 Sep 2025 17:19:05 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyZa-00000007SJN-1HXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:39:51 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 324285951B;
	Tue,  9 Sep 2025 13:39:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 900C62002A;
	Tue,  9 Sep 2025 13:39:40 +0000 (UTC)
Date: Tue, 9 Sep 2025 09:40:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <20250909094028.3265b751@gandalf.local.home>
In-Reply-To: <aMAZMaZJ1_Eny5Ku@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-5-vdonnefort@google.com>
	<20250908193757.079aae76@gandalf.local.home>
	<aMAZMaZJ1_Eny5Ku@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 900C62002A
X-Stat-Signature: wfa3mdrmcbzi14spidjppaqea6aw3qp1
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+E8T0HTQskMKNFMQEhwq4iyvDU75kvHts=
X-HE-Tag: 1757425180-933823
X-HE-Meta: U2FsdGVkX1+Wwks7b6yVoepNeV7TOzWudjuaDH2HvpSyApAYLfX3FbQwoINlsSIJNvKZcFkkzCa70xLZ8yV4M3RgoVBTMxN5wkAN4Tvsgw8YtAsvBOUnzzaGQoIagJtU8jlbuWu7YwTn4neLH9QVlsUmEnxOFj+Ce+XWBl2YeuaS2Co2nBtPDT2dppC4tUtOJR/BNg+CfKupetaSNKi+SIEiMtMc+wVlYX5nkohak+WdMCO/O577kVmfRGQBv0yYCqWaEXG1hBinQi1qPSUlt1pVhygCIsWRDJWGDRHVLOLUYn/A+q+kGxNNxzOWFpeRPlmy68ip0z5ZjM1JDFzumCv8TLnOFVx7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063950_428546_C4316ECF 
X-CRM114-Status: GOOD (  14.93  )
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

On Tue, 9 Sep 2025 13:10:25 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> > I wonder if we should name the file "reset" to not be confusing to users
> > when they cat the file and it doesn't produce any output.  
> 
> My idea was to keep the exact same interface as the rest of the tracing. I could
> keep that /trace file for compatibility and add /reset?
> 
> "cat trace" could also just returns a text like *** not supported *** ?

If it's never going to be supported, I rather not add it. It not being
there is a sure way of knowing it's not supported. Just adding it because
the normal system has it is actually worse if it doesn't behave the same.

-- Steve

