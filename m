Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F81C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5eqmItdiqDgX7CjizLUeEwLVr6uHe10suZ1UEaVY4w=; b=IAcRO66CIbMt/b+j09/6aXf68R
	GjP9gphAlMpUtr4gw1CoNBgm1BqKRxA+M8K2Jo2t3UxvTJona0J+kKGGhT+AIM64VKMHQi+l23/yQ
	vSC2vBydllr2ker6ICEXzDRmhG5+KP8VaNimd0Ly1csRSRlo2sUK2PSjQPh4XuDbhbONF+uWZif6w
	qMTvbQwfbhZNbyPxXdLKK6nkoTFMVCWOgaywgWz5pQGIYqcOAcfHr2OdTwc0alWt1dUqhTlgUmkTA
	EAE9hEWZ5U2VziW3uJlWJp0TfDP6ve6s/7Uh1HYGqhmxj4+9o2oTujpz+vPSLhfPcYCt4Wd+K0mmC
	uqXiHJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ERl-0000000Bm6Z-3jVz;
	Thu, 17 Sep 2026 15:54:49 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ERj-0000000Bm5j-1bK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=/5eqmItdiqDgX7CjizLUeEwLVr6uHe10suZ1UEaVY4w=; b=YmaOodryz8DoKi15HEuf0nffFA
	NtGMavtl+aHpTHHTJYpgkYSa9q7Ao4lCt3wp0+mxr7ULTZkQ5MQI6oUew16Ny4VyONqSBNk0jHFFr
	KNyG3zVSOLB3n/Db2Ibxe3rkjr568F7Vnw6D9ki/t8RgK+Hz848EI6MUKPNiBv8CKmy8CfH9t2cbw
	ViPypf3ylCmkh73ZeBrU/JMuexuMdqfcWU3xkxgGc68WKW2oAYM69BugmYwoArNUoVZp6vsaeJ/dk
	WF3HNNb0zqZ3KhcmVbjRmzoatTQ5UF8jfrurUdX2VcvTGJgdhIqOp0cuB1ew+CQ+TfKI1DHzekM9B
	adgZgDDg==;
Received: from [191.32.244.140] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x7ERX-003Y5s-I3; Thu, 17 Sep 2026 17:54:35 +0200
Message-ID: <99533216-664f-85fa-792b-6db7afd53df5@igalia.com>
Date: Thu, 17 Sep 2026 12:54:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 mark.rutland@arm.com, robin.murphy@arm.com, gshan@redhat.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net, Mark Brown <broonie@kernel.org>,
 Ryan Houdek <sonicadvance1@gmail.com>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
 <aoGIEEje1NIMTjyv@willie-the-truck> <aoLLf_iZq6DLNpLO@arm.com>
 <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com> <aqGnptkgxLEkqOfx@arm.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <aqGnptkgxLEkqOfx@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085447_422218_20B6333C 
X-CRM114-Status: GOOD (  24.59  )
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

On 09/09/2026 15:38, Catalin Marinas wrote:
> Hi Guilherme,
> [...] 
>>
>> I'm a bit confused on what "using the register" means here.
> 
> One example is Mark's patchset from 2020 you mentioned. While they were
> intended as a fast getcpu(), the idea for TPIDRRO was to hold some
> offset into a data structure rather than the raw smp_processor_id() (for
> future expansion, e.g. task pid). In the meantime we got rseq and never
> continued that series.
> 
> TBH, I think the Wine or FEX use-case is fairly narrow to give up on
> other potential uses for TPIDRRO.
> 
> [...] 
> It might be a thread or CPU specific value but without any guaranteed
> ABI to be read directly. Something to be used internally by the vDSO.
> 
>> Would it be better if we guard this usage with a Kconfig? Or as Ryan
>> already said, prctl flag or another idea?
> 
> No, that's bad ABI to depend on Kconfig or prctl() for different views
> of this register.
> 
>> Finally, I would like to reinforce / disambiguate things here (though
>> Ryan already mentioned): rseq or vDSO **are not** valid resources for
>> our use case. What we are really interested is in having this register
>> filled with CPU id.
> 
> Yes, and we have other parties interested in this register for more vDSO
> uses. IIUC, you'd not be able to use a getcpu() vDSO implementation
> either, so it won't help you.
> 
> Not really familiar with Wine but can it not implement
> GetCurrentProcessorNumber() using rseq? Or do you try to handle actual
> MRS directly? If the latter, any way to patch the instruction to a BRK
> and handle the trap? If it's on a fast path, can you branch to a stub
> that reads the rseq cpu id (offset from TPIDR) and branches back? You'd
> need one stub per MRS.
> 

Hi Catalin, thanks for your response! It covers all points, thanks for
detailing / explaining things.

Well, Wine cannot trap instructions like that, so in case an arm64
application is running on Linux and reads TPIDRRO, currently it gets 0
anyways. Nothing we can do from Wine side AFAIU.

I understand our use case isn't strong enough to lock this register's
ABI from your/Will's perspective, so we discussed internally and will
try to hold the patch downstream then.
Cheers,


Guilherme

