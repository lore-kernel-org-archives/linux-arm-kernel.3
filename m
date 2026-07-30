Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06A1C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpFqMZCjWkR/Kv/Bt+x9+L7z+qRlcnkkcM/HgKfv9kA=; b=gZc5FJfe+WNX1zKbufgPLE4a7g
	0k9PPeo68qavDZWyVJLEm4TABEz5L+iIAYkiM2sjWh47mCJsDMzJCYCbNbQpJF+d7F0jdOqD0wdwS
	Ee8DvhRN0UQJS8WC8wTBnLuRywg4uO6mrIlDIt7Dl6kBRIeDqE+LkmzR8JUV3mQVFH4GC15vIB05I
	MbWn6f9M7wmUMr4gSYWNzcFuYmv9Y7GMbnYr48XJ7Y0kZMcaSZ8brFJSAVOZvhEwywzuwziATtvi3
	oEWBh5tiJqSfmn3kt7+HF4oKeUhkDSsPGmZ/PgW0QXxM/RJ4NOhibsmtMZiJrUDxyeY+MXrBQGPMq
	uzIyVKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNvb-0000000ABCY-1B0e;
	Thu, 30 Jul 2026 10:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNvY-0000000ABBp-2b6J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:23:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC3D01688;
	Thu, 30 Jul 2026 03:23:41 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5281C3F86F;
	Thu, 30 Jul 2026 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785407025; bh=uH4MR0Zg/NqoAeMyBzzpHF9m5BvkJlfRvuhGQocyqtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCO9sUzhXc9haZg1Qh0zm54Xivj09WSrUfF6UjjIxzLY50xh5kVrMAMUYaj/bFryo
	 XNvD7U3kyHyxD1YE4NriBO0KT1NdXv3fJRU+o0YklQLBII5K7Y15AQXiwr6ksXhne7
	 QjQ1OlmuHkisD+t2uSD9v8Y2uGny5nuAJ/2hTX7c=
Date: Thu, 30 Jul 2026 11:23:34 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v4 01/29] arm64: sysreg: Emit RESx/UNKN values for
 Mapping/Fields definitions
Message-ID: <amsmJo0gsaj5DAJd@J2N7QTR9R3.cambridge.arm.com>
References: <20260730071022.296811-1-maz@kernel.org>
 <20260730071022.296811-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730071022.296811-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032348_703864_F4123961 
X-CRM114-Status: GOOD (  20.80  )
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

On Thu, Jul 30, 2026 at 08:09:54AM +0100, Marc Zyngier wrote:
> The sysreg file is using the Mapping or Fields qualifiers to indicate
> that a given encoding is only a mapping to a particular register (or
> an instance of a more generic register definition).
> 
> As a result, we don't output any definition, and instead expect
> the canonical definitions to be used.
> 
> This works rather well for individual fields, but creates problems
> for macros that refer to more generic classes of bits such as RESx.
> 
> Relax the above rule by emitting the RESx and UNKN values for Mapping
> and Fields qualifiers as well.

It might be worth stating a bit more explicitly, something like:

  Emit RESx and UNKN values for Mapping and Fields qualifiers as well,
  defining these in terms of the RESx and UNKN values for the canonical
  Sysreg or SysregFields definition.

  For example, the following defintion:

  | Sysreg FOO ...
  | Fields BAR
  | EndSysreg
  
  ... will generate:
  
  | #define FOO_RES0	(BAR_RES0)
  | #define FOO_RES1	(BAR_RES1)
  | #define FOO_RES0	(BAR_UNKN)

Regardless of the above, the patch looks reasonable to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/gen-sysreg.awk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 86860ab672dc7..53844f5c5e525 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -228,7 +228,7 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
>  }
>  
>  # Currently this is effectivey a comment, in future we may want to emit
> -# defines for the fields.
> +# defines for the fields. We do emit RESx and UNKN values in any case.
>  ($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
>  	expect_fields(2)
>  
> @@ -239,9 +239,9 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
>  	print ""
>  
>  	next_bit = -1
> -	res0 = null
> -	res1 = null
> -	unkn = null
> +	res0 = $2 "_RES0"
> +	res1 = $2 "_RES1"
> +	unkn = $2 "_UNKN"
>  
>  	next
>  }
> -- 
> 2.47.3
> 
> 

