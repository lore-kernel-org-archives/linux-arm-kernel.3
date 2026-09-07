Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC05C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcNiaU1Pu0fYnuKVksUMPGKiaVZ/+0i32gNFM+Xw3KU=; b=BqS4TC/XwDd7JxVGMvKn7oyQCJ
	8QlGTWdPUqCR1A5xbqkvcciNqMAWzUC+B/MbzY9OTjkFGgAzqR0uYMc2kj5Qu4oqHJPVcXuuGCfUl
	V9Jk1J0ObozoNc1toXFtIk6TnDAkZo4g/XNm+jEM5sUKEziiZvvejEticuUvx2uM4q9NMp8dc8p1s
	2FjQXZWyXEPUXOsRKLBZ+fcJcbi5Ktjhs16UYjSmdUV8y0iw4z4fE4bA1madEpUAHIzWdBNz7C/KA
	ICMD7n1NwjCDsFMoKWajpYTz4AVLgkJDRtlx4Fp9WbCdzg+vyvEixrp4p0XmAPqPGe0nfAIRh7H0u
	JwNjwd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Vtw-00000006Nfn-2XgQ;
	Mon, 07 Sep 2026 09:44:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Vts-00000006NfD-3Zz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAE491477;
	Mon,  7 Sep 2026 02:44:23 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 666C43FA7A;
	Mon,  7 Sep 2026 02:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788774267; bh=k+ZbtP+OlC9jgri1bEIickt96W2TjrZ516/39mX5lmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hliok3A/1oLgq1cUQeqFw4ouqt6gFxERSEv+duovcn7ndNW67WrVU2ZVW4y3HCu12
	 TIRCroRL/WvdPaWaeoF6OFmOTwD2bT3j599LB0XVzVmVEHtUAVD7KzC5Q+Z4SahYff
	 Rhw4/znkYP56Q/5oQHa6y+/FpbvKNHd79KgJSeq4=
Message-ID: <966b103e-dc9e-479a-ba6c-e8e6727e1bd7@arm.com>
Date: Mon, 7 Sep 2026 10:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904103131.627392-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260904103131.627392-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_024429_071149_F1E427DE 
X-CRM114-Status: GOOD (  30.90  )
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

Hi Fuad,

On 04/09/2026 11:31, Fuad Tabba wrote:
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
> what one guest writes reaches the next guest and the host. Nor can the
> kernel make the EL2 writes unconditionally: they trap to EL3 on the
> firmware the option exists for, and TRAPLOWER cannot be read below EL3.
> 
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Changes since v1, the first three from Ben Horgan's review:
>      - Put arm64.nompam under a new "Command line parameters" section.
>      - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
>      - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
>      - Drop "No functional change intended." from the commit message.
>     
>     Bradley Morgan's Reviewed-by on v1 is not carried over: both
>     paragraphs, the section heading and the commit message changed.
>     
>     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
> 
>  .../admin-guide/kernel-parameters.txt         |  3 ++-
>  Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..e6d543de3cde5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -575,7 +575,8 @@ Kernel parameters
>  			Set instructions support
>  
>  	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
> -			Monitoring support
> +			Monitoring support. Only for a machine that does not
> +			boot without it. See Documentation/arch/arm64/mpam.rst
>  
>  	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
>  			support
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 67fe515ed501c..e66b1359d1282 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -87,6 +87,31 @@ The supported features are:
>    MBWU monitors can be exposed to the user after support for more monitoring
>    scopes is added to resctrl.
>  
> +Command line parameters
> +=======================
> +
> +arm64.nompam
> +------------
> +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> +the MPAM system registers from the lower exception levels to EL3.
> +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> +Set it only on a machine that does not boot without it.
> +
> +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> +guests but no longer enables the traps that stop a guest from using it,
> +so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM

As you are listing registers, MPAMSM_EL1 can go here too.

Generally, I think this documentation change looks good now but holding off on a tag for the moment
in case anything comes up from your MPAM trapping change [1].

[1] https://lore.kernel.org/linux-arm-kernel/20260903160819.831518-1-fuad.tabba@linux.dev/

Thanks,

Ben

> +does not save or restore them, so what one guest writes is still there
> +when the next guest runs on that CPU, and when the host does. With MPAMEN
> +set, EL0 and EL1 requests then carry that PARTID and PMG.
> +
>  Reporting Bugs
>  ==============
>  If you are not seeing the counters or controls you expect please share the


