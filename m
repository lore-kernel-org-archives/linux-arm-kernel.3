Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D84C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LumgnO4S4DUT0JPPfynUWlM5dL2e4zVogtlv7ouhtw=; b=ER4eOpo27OgRAzUgO7o1Ue3xSY
	FATZ9wpPRCw7ZuqH6W80F7sFeDpEmdH52U5p86U05XUMjUfa+qh9jShIEa8PI6yKEiIif8elYA034
	+1gyHZV4ZjBvINcLIwHbkVuoR8gDDfHpSf/j/NDroM3dUn7PbLuhSqhPsX3c70tINED7UB+PwiH1l
	wl51SSLZe00zwdxx9Chu4gKkd0sJY7VjWmSm+jFoFH6J493C7/RRn5RZ7rZhVgKTpssRCwTDKHeIt
	jxCR1oei24vhJOuUNkoU32ioS3J885VKbrONyFHehmVVNjeV3QgXfyVTvAaXr8qeb4/yTWvwjCObP
	OvF5aS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujK5T-0000000DDTt-0d1b;
	Tue, 05 Aug 2025 16:00:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJ1i-0000000D4O0-2UFv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:52:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28E1012FC;
	Tue,  5 Aug 2025 07:52:19 -0700 (PDT)
Received: from [10.1.26.194] (unknown [10.1.26.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAD9C3F673;
	Tue,  5 Aug 2025 07:52:25 -0700 (PDT)
Message-ID: <b4ba5c9c-fc9c-435b-9110-1014127bef05@arm.com>
Date: Tue, 5 Aug 2025 15:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 0/4] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 akpm@linux-foundation.org, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <985f9d53-ea5e-4da0-9427-106a58be7f26@arm.com> <aJIXmIgCGlWlHDNK@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aJIXmIgCGlWlHDNK@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_075230_677739_342DB891 
X-CRM114-Status: GOOD (  16.73  )
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

On 05/08/2025 15:39, Catalin Marinas wrote:
> On Tue, Aug 05, 2025 at 09:16:31AM +0100, Ryan Roberts wrote:
>> On 05/08/2025 09:13, Ryan Roberts wrote:
>>> This is a new version built on top of Yang Shi's work at [1]. Yang and I have
>>> been discussing (disagreeing?) about the best way to implement the last 2
>>> patches. So I've reworked them and am posting as RFC to illustrate how I think
>>> this feature should be implemented, but I've retained Yang as primary author
>>> since it is all based on his work. I'd appreciate feedback from Catalin and/or
>>> Will on whether this is the right approach, so that hopefully we can get this
>>> into shape for 6.18.
>>
>> I forgot to mention that it applies on Linus's current master (it depends upon
>> mm and arm64 changes that will first appear in v6.17-rc1 and are already merged
>> in master). I'm using 89748acdf226 as the base.
> 
> It's fine as an RFC but, for upstream, please rebase on top of -rc1
> rather than a random commit in the middle of the merging window. Also
> note that many maintainers ignore new series posted during the merging
> window.

Yeah understood - I'm going to be out from Saturday for 2 weeks so thought it
was better to post an RFC now hoping to get some feedback so I can repost
against -rc3 when I'm back and have a chance of getting it into v6.18.


