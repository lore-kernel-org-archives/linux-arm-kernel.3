Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4255CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpFVhs6+HjJ1g/FK+Ybtom0Acim/YGoRKb1YJaVzEko=; b=nxv+JIliK2P+PWyOe0Jrx0IaT+
	bwkT0pKoPAauNwSx5NFfMtWc3gIt0njAVGn4PBX9KZ78uglJ1tYNPu3BDQuNjqud/eM7WinjzRmr/
	y9Ze6ntlOyeJcmM9ae0FCPNCfdem1goDqK6ECDx9kCAle5vP1AQ8McqFxWwh+TMKtGjgg39k5WoSa
	RdxcyKpdR3gTf1bMfoeHF1zVl6Kh8KBQNEiIUVgoGob4FWcXO1dML2Z/caziANqUxmP3LdebrqS/D
	hLJH3W8IvtMGD1u5VZsA1EAkg6v+IPwaSMpog0fno3LfzUN+lys0rtgrKRRdOEdAR/IJ1uJPT/V4w
	7aeJSU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryd6-00000005ipL-0kwd;
	Fri, 29 Aug 2025 12:54:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw8G-00000005HbW-452E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:14:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 847181758;
	Fri, 29 Aug 2025 03:14:47 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DEDD3F694;
	Fri, 29 Aug 2025 03:14:52 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:14:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v3 3/3] arm64: sysreg: Add validation checks to sysreg
 header generation script
Message-ID: <aLF9mSCs1B2gk8BU@J2N7QTR9R3>
References: <20250829095143.123476-1-tabba@google.com>
 <20250829095143.123476-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829095143.123476-4-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031457_150430_6311F3AA 
X-CRM114-Status: GOOD (  19.88  )
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

On Fri, Aug 29, 2025 at 10:51:43AM +0100, Fuad Tabba wrote:
> The gen_sysreg.awk script processes the system register specification in
> the sysreg text file to generate C macro definitions. The current script
> will silently accept certain errors in the specification file, leading
> to incorrect header generation.
> 
> For example, a Sysreg or SysregFields can be accidentally duplicated,
> causing its macros to be emitted twice. An Enum can contain duplicate
> values for different items, which is architecturally incorrect.
> 
> Add checks to catch these errors at build time. The script now tracks
> all seen Sysreg and SysregFields definitions and checks for duplicates.
> It also tracks values within each Enum block to ensure entries are
> unique.
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Fuad Tabba <tabba@google.com>

I wonder if it would make sense to treat SysregFields and Sysregs as one
group (both using defined_regs), so that we can catch:

	Sysreg	FOO_EL1	...
		...
	EndSysreg

	SysregFields	FOO_EL1
		...
	EndSysregFields

I have no strong feelings either way, so for this as-is OR for using
`defined_regs` for both:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/gen-sysreg.awk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index f2a1732cb1f6..bbbb812603e8 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -122,6 +122,10 @@ $1 == "SysregFields" && block_current() == "Root" {
>  	res1 = "UL(0)"
>  	unkn = "UL(0)"
>  
> +	if (reg in defined_fields)
> +		fatal("Duplicate SysregFields definition for " reg)
> +	defined_fields[reg] = 1
> +
>  	next_bit = 63
>  
>  	next
> @@ -162,6 +166,10 @@ $1 == "Sysreg" && block_current() == "Root" {
>  	res1 = "UL(0)"
>  	unkn = "UL(0)"
>  
> +	if (reg in defined_regs)
> +		fatal("Duplicate Sysreg definition for " reg)
> +	defined_regs[reg] = 1
> +
>  	define("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
>  	define("SYS_" reg, "sys_reg(" op0 ", " op1 ", " crn ", " crm ", " op2 ")")
>  
> @@ -284,6 +292,8 @@ $1 == "SignedEnum" && (block_current() == "Sysreg" || block_current() == "Sysreg
>  	define_field(reg, field, msb, lsb)
>  	define_field_sign(reg, field, "true")
>  
> +	delete seen_enum_vals
> +
>  	next
>  }
>  
> @@ -297,6 +307,8 @@ $1 == "UnsignedEnum" && (block_current() == "Sysreg" || block_current() == "Sysr
>  	define_field(reg, field, msb, lsb)
>  	define_field_sign(reg, field, "false")
>  
> +	delete seen_enum_vals
> +
>  	next
>  }
>  
> @@ -309,6 +321,8 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
>  
>  	define_field(reg, field, msb, lsb)
>  
> +	delete seen_enum_vals
> +
>  	next
>  }
>  
> @@ -320,6 +334,8 @@ $1 == "EndEnum" && block_current() == "Enum" {
>  	lsb = null
>  	print ""
>  
> +	delete seen_enum_vals
> +
>  	block_pop()
>  	next
>  }
> @@ -329,6 +345,10 @@ $1 == "EndEnum" && block_current() == "Enum" {
>  	val = $1
>  	name = $2
>  
> +	if (val in seen_enum_vals)
> +		fatal("Duplicate Enum value " val " for " name)
> +	seen_enum_vals[val] = 1
> +
>  	define(reg "_" field "_" name, "UL(" val ")")
>  	next
>  }
> -- 
> 2.51.0.338.gd7d06c2dae-goog
> 
> 

