Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6422C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q94XCeSDxcErsrby+n8BAGLr925UXv5rqtA/MVkTbdA=; b=nvTyFr9OKSrsB5POS9SytEkyJR
	GJuGEp85/un9oN5hIBb+mYylAEyKZqbvJ4N+3UQvc+SchVeBJ6uVfGl92h3V5hlW8mIlf3bkb0A7z
	i6C4dBfY36xBRdiUBjQ1/F0TFIhdFcMj8HD0HrOyGiWVCmy6i6HNk2kjjGikTshYN2uuJWuUzfMa7
	dbUog5gQqXP2K2IpHnRQTh56rGstGp/+VtteGZ2cfdvte73VEu6G8ZRklp3Q4hAmFSyvpZz84KJp+
	YL/3Fd2+5NmteEo5Ddymru0R4YEzhJcLA1GMuBTo60+UL8G8S90N/kpAYwowFY6hXI/dyE9tX1WgL
	po43S5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3mJ-0000000E6Ih-2ie7;
	Fri, 14 Mar 2025 12:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3j7-0000000E5Xp-0kSE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:01:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF131424;
	Fri, 14 Mar 2025 05:01:28 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98BEB3F792;
	Fri, 14 Mar 2025 05:01:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:01:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Enforce whole word match for
 open/close tokens
Message-ID: <Z9Qah4N93Mhqr3-V@J2N7QTR9R3.cambridge.arm.com>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-3-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115162600.2153226-3-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050121_310122_1D38C37C 
X-CRM114-Status: GOOD (  18.91  )
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

On Wed, Jan 15, 2025 at 04:25:56PM +0000, James Clark wrote:
> Opening and closing tokens can also match on words with common prefixes
> like "Endsysreg" vs "EndsysregFields". This could potentially make the
> script go wrong in weird ways so make it fall through to the fatal
> unhandled statement catcher if it doesn't fully match the current
> block.
> 
> Closing ones also get expect_fields(1) to ensure nothing other than
> whitespace follows.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

In retrospect, this is what I should have wirrten originally. Thanks for
the fix!

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/gen-sysreg.awk | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 1a2afc9fdd42..f2a1732cb1f6 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -111,7 +111,7 @@ END {
>  /^$/ { next }
>  /^[\t ]*#/ { next }
>  
> -/^SysregFields/ && block_current() == "Root" {
> +$1 == "SysregFields" && block_current() == "Root" {
>  	block_push("SysregFields")
>  
>  	expect_fields(2)
> @@ -127,7 +127,8 @@ END {
>  	next
>  }
>  
> -/^EndSysregFields/ && block_current() == "SysregFields" {
> +$1 == "EndSysregFields" && block_current() == "SysregFields" {
> +	expect_fields(1)
>  	if (next_bit > 0)
>  		fatal("Unspecified bits in " reg)
>  
> @@ -145,7 +146,7 @@ END {
>  	next
>  }
>  
> -/^Sysreg/ && block_current() == "Root" {
> +$1 == "Sysreg" && block_current() == "Root" {
>  	block_push("Sysreg")
>  
>  	expect_fields(7)
> @@ -177,7 +178,8 @@ END {
>  	next
>  }
>  
> -/^EndSysreg/ && block_current() == "Sysreg" {
> +$1 == "EndSysreg" && block_current() == "Sysreg" {
> +	expect_fields(1)
>  	if (next_bit > 0)
>  		fatal("Unspecified bits in " reg)
>  
> @@ -206,7 +208,7 @@ END {
>  
>  # Currently this is effectivey a comment, in future we may want to emit
>  # defines for the fields.
> -(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
> +($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
>  	expect_fields(2)
>  
>  	if (next_bit != 63)
> @@ -224,7 +226,7 @@ END {
>  }
>  
>  
> -/^Res0/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Res0" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	expect_fields(2)
>  	parse_bitdef(reg, "RES0", $2)
>  	field = "RES0_" msb "_" lsb
> @@ -234,7 +236,7 @@ END {
>  	next
>  }
>  
> -/^Res1/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Res1" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	expect_fields(2)
>  	parse_bitdef(reg, "RES1", $2)
>  	field = "RES1_" msb "_" lsb
> @@ -244,7 +246,7 @@ END {
>  	next
>  }
>  
> -/^Unkn/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Unkn" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	expect_fields(2)
>  	parse_bitdef(reg, "UNKN", $2)
>  	field = "UNKN_" msb "_" lsb
> @@ -254,7 +256,7 @@ END {
>  	next
>  }
>  
> -/^Field/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Field" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	expect_fields(3)
>  	field = $3
>  	parse_bitdef(reg, field, $2)
> @@ -265,14 +267,14 @@ END {
>  	next
>  }
>  
> -/^Raz/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Raz" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	expect_fields(2)
>  	parse_bitdef(reg, field, $2)
>  
>  	next
>  }
>  
> -/^SignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "SignedEnum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	block_push("Enum")
>  
>  	expect_fields(3)
> @@ -285,7 +287,7 @@ END {
>  	next
>  }
>  
> -/^UnsignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "UnsignedEnum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	block_push("Enum")
>  
>  	expect_fields(3)
> @@ -298,7 +300,7 @@ END {
>  	next
>  }
>  
> -/^Enum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
> +$1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
>  	block_push("Enum")
>  
>  	expect_fields(3)
> @@ -310,7 +312,8 @@ END {
>  	next
>  }
>  
> -/^EndEnum/ && block_current() == "Enum" {
> +$1 == "EndEnum" && block_current() == "Enum" {
> +	expect_fields(1)
>  
>  	field = null
>  	msb = null
> -- 
> 2.34.1
> 

