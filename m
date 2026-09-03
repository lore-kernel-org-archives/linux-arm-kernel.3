Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A2FC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2+e3ASxPa1Pu4nIzrOYxyMrQwXXAut+C2hJeXedW5o=; b=FWgVHWwBzqnnpKuZFxDLt/TqnY
	JqRjxrrouBv20SHPDSGxIXQzCJMIlUZUal/u4KmVbpumIKpFyyB7R/IUaOVshy6qlOTbdxLuikFZw
	Igl6h8SOsMz8vm8RYKv5Y0mT1sEYDcq3rcwFaNXAWOBS7q24+PUyzk8nfwVrIxSyDMS3Yt9zXPLvP
	WIsul9z8Oxm3xdHBMLW4dfzGwmeVZPtjGMjEKNd4MiIj/2HYpZeUzV7XWyvlpb1wGty2LWCQjnM0+
	ZW1op3lPCYEvYEuhitfh61M//L/1igwXACa8ksgbSdgAWd8QNGxElFXJjRFaTUZEh4qXfaF/mWV3f
	Oj9J/e0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24AT-0000000H0fu-0xEN;
	Thu, 03 Sep 2026 09:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24AP-0000000H0f9-40Zx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A2B1596;
	Thu,  3 Sep 2026 02:55:29 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC0663F7D8;
	Thu,  3 Sep 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788429333; bh=rYT2ngj/FwG91uxpynt3KrjHU3NlWy5URZZ6/mx9JVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UwhhZT6k7FMgAbxYwl0HA26uB6aszzFw7Y9VKMCeYl0sx492ifctABc2/3FO+G88F
	 Fh6EdVfFLhX0ORxarxS/kbO0C9re3LmmrI/V7ceQNdTurPX1ca5MzS+aEDG+q0mkuv
	 4jTvSiRRLrv3gP5CybPusumL7J0pLP0ZogVafpm4=
Message-ID: <cf59d824-80dc-446f-9b1b-ac9841a96a9d@arm.com>
Date: Thu, 3 Sep 2026 10:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mpam: Document when to set arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903084809.2027326-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260903084809.2027326-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_025534_155525_1E4965C9 
X-CRM114-Status: GOOD (  30.02  )
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

On 03/09/2026 09:48, Fuad Tabba wrote:
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has enabled MPAM, the EL2 trap controls are left unwritten, at
> reset values that are UNKNOWN, and KVM still hides MPAM from the guest
> but no longer enables the traps that stop a guest from using it. The
> kernel cannot restore the writes: they trap to EL3 on the firmware the
> option exists for, and MPAM3_EL3.TRAPLOWER cannot be read below EL3.
> 
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.
> 
> No functional change intended.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  3 ++-
>  Documentation/arch/arm64/mpam.rst               | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
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
> index 67fe515ed501c..67c8a95391171 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -87,6 +87,23 @@ The supported features are:
>    MBWU monitors can be exposed to the user after support for more monitoring
>    scopes is added to resctrl.
>  
> +arm64.nompam
> +============

This assumes that the reader already knows or can guess that arm64.nompam is a command line
parameter. Perhaps the section name can be 'Command line parameters' with a single 'arm64.nompam'
subsection underneath or all in the section name.

> +Firmware must enable MPAM at the highest implemented exception level and
> +leave the MPAM system registers accessible to the kernel, or trap the
> +accesses and emulate MPAM as disabled. Where it does neither, the CPUs
> +still advertise MPAM in the ID registers, the first kernel access to an
> +MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
> +for that firmware: it makes the kernel treat the CPUs as not implementing
> +MPAM, so no MPAM system register is accessed. Set it only on a machine
> +that does not boot without it.
> +
> +It is not a way to turn MPAM off. On a system whose firmware has enabled
> +MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and> +MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN.

Enabling MPAM at EL3 is separate from disabling traps. Setting MPAM3_EL3.MPAMEN to 1 means that the
values in MPAMn_ELx are used to determine the PARTID and PMG for CPU requests. At this point EL3 can
configure the PARTID and PMG for the different exception levels and MPAM can be used in the system
under firmware control. Setting MPAM3_EL3.TRAPLOWER to 0 is what enables EL2 to access the MPAM
registers without trapping and configure the traps for MPAM register accesses at EL1.

> KVM still
> +hides MPAM from guests but no longer enables the traps that stop a guest
> +from using it, so a guest may be able to choose its own PARTID and PMG.
>
Shouldn't this also mention that the MPAM_*_EL1 are not save restored and so if the traps aren't
enabled provide a side channel between guests.

Thanks,

Ben

>  Reporting Bugs
>  ==============
>  If you are not seeing the counters or controls you expect please share the


