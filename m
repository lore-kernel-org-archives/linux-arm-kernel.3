Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC14AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9PbCBeYrjMCQcLqiK0rrcTZpvoHc8nVJtPBf73C6pc=; b=TZPalM40ZlaO81a6x6JzR+P521
	diLAnZsfRbFqS6NQ29EDWEb3DLg4R2hgvSk+6KgXZgZsYmek9dCggEFSNODg+25zgF8r87qc6goRE
	u+kgEbEEuokncdy1luOTwNXi3H+LmbbtPT/B6MivqzNGzyrR1nBwEGR95wyOVtzP/P3Wmbh3DFAUa
	kwzgkL5vSxPt2zYNNylPb/nCsHkx385bi0jkXodx/3HoNzdkEqO1C896dlA2/vt8v/s4W6/v025L/
	uuvOHcDJh1cKzYL4s6WG6jdG52+G6PR2YJhJNH6zJd1MGkG2Ivk9nOeaNyLU3QwyLMc6PXGVQV0EQ
	7xOjn7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRt-00000002TOy-1FXe;
	Mon, 07 Jul 2025 12:59:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl1D-00000002Qcj-2QhX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 12:32:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A0B168F;
	Mon,  7 Jul 2025 05:32:08 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1328A3F694;
	Mon,  7 Jul 2025 05:32:19 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:32:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tamas Kaman <tamas.kaman@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper-aarch64 PATCH] Enable GCS if it is present in the
 HW
Message-ID: <aGu-TFbj2mJ2t7Tf@J2N7QTR9R3>
References: <20250707095430.3821373-1-tamas.kaman@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707095430.3821373-1-tamas.kaman@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_053223_657896_7DA36281 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Tamas,

Usually we'd have a commit log here, mentioning and documents referenced
(e.g. ARM ARM, booting.rst), and any interdependencies (e.g.  other
features that might need to be enabled first).

On Mon, Jul 07, 2025 at 11:54:30AM +0200, Tamas Kaman wrote:
> Signed-off-by: Tamas Kaman <tamas.kaman@arm.com>
> ---
>  arch/aarch64/include/asm/cpu.h | 5 +++++
>  arch/aarch64/init.c            | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index ac50474..9d6f0fc 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -70,6 +70,7 @@
>  #define SCR_EL3_ECVEN			BIT(28)
>  #define SCR_EL3_TME			BIT(34)
>  #define SCR_EL3_HXEn			BIT(38)
> +#define SCR_EL3_GCSEn			BIT(39)
>  #define SCR_EL3_EnTP2			BIT(41)
>  #define SCR_EL3_RCWMASKEn		BIT(42)
>  #define SCR_EL3_TCR2EN			BIT(43)
> @@ -125,6 +126,7 @@
>  #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
>  #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
>  #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
> +#define ID_AA64PFR1_EL1_GCS		BITS(47, 44)


The two new definitions above look right to me per ARM DDI 0487 L.a
sections D24.2.163 and D24.2.88.

>  #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
>  
>  #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
> @@ -133,6 +135,9 @@
>  #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
>  #define ID_AA64SMFR0_EL1_FA64		BIT(63)
>  
> +#define HCRX_EL2			s3_4_c1_c2_2
> +#define HCRX_EL2_GCSEn			BIT(22)

This looks a bit suspicious, given it wasn't mentioned earlier, and
given we don't poke this for anythign else so far.

More on that below.

> +
>  /*
>   * Initial register values required for the boot-wrapper to run out-of-reset.
>   */
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index cb24f4e..f815e6a 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -118,6 +118,13 @@ static void cpu_init_el3(void)
>  	if (mrs_field(ID_AA64PFR1_EL1, MTE) >= 2)
>  		scr |= SCR_EL3_ATA;
>  
> +	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
> +		scr |= SCR_EL3_GCSEn;
> +		unsigned long hcrx_el2 = mrs(HCRX_EL2);
> +		hcrx_el2 |= HCRX_EL2_GCSEn;
> +		msr(HCRX_EL2, hcrx_el2);
> +	}

As a general policy, the boot wrapper avoids RMW sequences, and
initializes all bits in registers to specific values, so this doesn't
look right.

We genreally follow a pattern of accumulating control bits with a final
write, e.g.

	unsigned long ctrl_x = DEFAULT_VALUE_X;

	if (featute_exists(a)) {
		ctrl_x |= CTRL_X_ENABLE_A;
		...
	}
	...
	if (feature_exists(b)) {
		ctrl_x |= CTRL_X_ENABLE_B;
		...
	}
	...
	msr(ctrl_x_el3, ctrl_x);

... but for HCRX_EL2, we haven't done that for any other features (e.g.
FPMR, MOPS). Either that's a latent bug, or  we don't need to initialize
HCRX_EL2 here.

Can you describe why you're initializing HCRx_EL2.GCSEn? e.g. are you
trying to boot a kernel at EL1?

Thanks,
Mark.

> +
>  	if (!kernel_is_32bit())
>  		scr |= SCR_EL3_RW;
>  
> -- 
> 2.34.1
> 

