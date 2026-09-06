Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D9C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV0ddBe1G6lnHl0VmNlWnqGTOHl+sj589sHA2fEtM3s=; b=yuB9JpNZtp6PGFYi9d8b9cwL2q
	pmlycFD4ypUZC2EwdHDdfsPWz3YFNi3sHO82Fx2qUvUSUCwzo41bt0yLWiMpGj1+OQEfzJGyJ7ktm
	YDxDT9CA9Dx4ndAD7vdaXobW3gg+tizWfHvNewtqHIxfV8DRAx0MZH/nadNNe2YFdTJy2wFL7rxSr
	fSSVYr6eXStWkfyyasAatAOViuzDL1TQKrefcDuYGTXeew7/h8C/cTLiKDplj1gi363XIwhBm714J
	U/X8I2RIU2JUKfxEVvjOWx7BYNCOSBeWpCff032y929yWnRvWvgD1gkPMXC7DNCzgAiAazorZuxkv
	EBWJOyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EHU-000000056qy-1AST;
	Sun, 06 Sep 2026 14:55:40 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EHQ-000000056qQ-18Nv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 14:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=uV0ddBe1G6lnHl0VmNlWnqGTOHl+sj589sHA2fEtM3s=; b=cfzT++pMCJhvsXG2ZlOoUdB04t
	pciqB5Qid3nmQU/rTXaNz6BpYA1y0lOGKz7/Bp39NHBe8rSJwSSIO5BCWwHO/0Si/1fBAoU4/VLF6
	LDVclT0xN6wvoC1iBGDECjbIvTFX858rh8CFD+7VqopnBF9KlMwTCgMAgdxVsNL+3KxEyhwdLkrxQ
	+vUrhcp/af6HsgZT2n8OZCXwB//HDxWxIplrT+42CncSTcNL3WSbgYh8L+JoK+FwFHQoEQRglfGst
	IK1Z0EE9q092SUEsOh3hYG0wbgQEBDClW5CGT+A/lVF8i8vVx4Z7lun5CVprgDHl7umwS3oUq9/Yh
	mz3Stptw==;
Received: from [191.32.245.236] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x3EHD-00Fevi-Ch; Sun, 06 Sep 2026 16:55:23 +0200
Message-ID: <9fd4a55c-82d4-f0f1-c42b-e67fa9965494@igalia.com>
Date: Sun, 6 Sep 2026 11:55:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 robin.murphy@arm.com, gshan@redhat.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net, Mark Brown <broonie@kernel.org>,
 Ryan Houdek <sonicadvance1@gmail.com>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
 <aoGIEEje1NIMTjyv@willie-the-truck> <aoLLf_iZq6DLNpLO@arm.com>
 <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com>
Content-Language: en-US
In-Reply-To: <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_075536_667996_ED64D69E 
X-CRM114-Status: GOOD (  18.58  )
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

On 17/08/2026 11:48, Guilherme G. Piccoli wrote:
> Hi Will / Catalin / all,
> first of all, thanks for your prompt responses!
> 
> I'm a bit confused on what "using the register" means here. We have 2
> ways of using it, IIUC:
> 
> a) Use it as it's already used today! On kernel space, this register is
> kinda free, right? Currently, it's used as the scratch, in the entry.
> But nothing prevents other usages, given that, as the final step of exit
> to EL0, it's restored to the value of the CPU id. So, AFAIU, it's fair
> use on kernel space with or without this patch.
> 
> b) Use as in "expose something else to userspace". Is it OK doing that,
> even the ARM specification mentioning
> 
> "Purpose
> Provides a location where software executing at EL1 or higher can store
> thread identifying information that is visible to software executing at
> EL0, for OS management purposes." ?
> 
> Or do you mean exposing **different information** than the pure CPU id,
> but still related with thread information?
> 
> Would it be better if we guard this usage with a Kconfig? Or as Ryan
> already said, prctl flag or another idea?
> 
> 
> Finally, I would like to reinforce / disambiguate things here (though
> Ryan already mentioned): rseq or vDSO **are not** valid resources for
> our use case. What we are really interested is in having this register
> filled with CPU id.
> Cheers,
> 

Hi Will / Catalin / others,

gentle ping on this one.

Could we implement it using a prctl flag or maybe Kconfig? Any other
ideas to move forward here?
Thanks again,


Guilherme



