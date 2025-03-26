Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81940C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DpJ6VRMzKkbiSjucX4k613JgndFFXaW28hmKcfLsmU=; b=2IEgF2vQRIWPjfihL7b6aHP6/X
	27e0ZxWXv1EUpgXW4/aLyoUzSpU6lpevR/77Wpo1+64dx6dai3E9IRKRo2UHOySAuRtE/+q7eUDaz
	yfW7AqHloNTppKrOfWoK+oobrFFVXna7K1/mKhRjR+vLD/4juvkMS4aNATZma1BFuNdgBzvE1sVBI
	5mlX+CWDvZn8mORnHl4V0S6KHmeMzbnuMaM09p7c4iWH17RvPMMEDF/E3wVZnifeWb28eKqlmKr4Q
	bVv2dI14FXBPOMMnZTPqZktvdZ3TDAz/eaxgEJ1RukByXB5YfYwakfm/nCFivZaDnDT3sjq4FrNus
	xApns0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRIy-00000008cwi-2DUZ;
	Wed, 26 Mar 2025 14:00:28 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQwz-00000008aKR-1xNM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:37:46 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6feb229b716so63227167b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742996264; x=1743601064; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2DpJ6VRMzKkbiSjucX4k613JgndFFXaW28hmKcfLsmU=;
        b=Oasn56JsigPp6jq/czR4qJl9R0DnEotrqjaVtRYsHGWbsQ95nj5nDDkHCMU9twdbZn
         moO+pmU8N+zy0xTBp3PzwiUrtXmbCsCv6rYwlwUDMLRhnYgCfYodXqHG7yaLgns8vl52
         rNJegS73ViesRyB6mIaOXraZnI1q5uBEDzLd41wU5qRplw2uEbWmd7NF7mhui1O9mRQT
         O+yc/2AQhaumYFRnxX9KJhPDsjo+D0zBc7JRbknIUkRCaQnfULivGqvcxinGNPCvyN2c
         cKDY0z4PahtAsCVYfwfAbxZAZmj/rbREBvrfZ/bhkmylLyuruwU1U0vto54OLbJ8kUl4
         b6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996264; x=1743601064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DpJ6VRMzKkbiSjucX4k613JgndFFXaW28hmKcfLsmU=;
        b=jwIaFis57U8Cg0GLY0DSYBbbCNX0wL8Iy4uK7IOjZniN0gKMp/vTb8iOzzvKEx/u6P
         NTDmy6DHFPaJH4XJzShbdAMjWYlIa4OKA6eAmBVD7thMzKWwdOARtnLGN+rhVMDMwQXZ
         OAFLaNGbbPwDtJUN4S6a9G0nxYyTcMMSM4tkNgSJOB/h6OT/v0OcAv+K0elRJH2osX3c
         yjPFZljk20MYGoGDqLJUCmX/adP0pP51v214L+Sm5SPp1f/W3Vy+g5AtBa0mW8nl8Le5
         PcqIZlc4k/0vzqTB/do2uYNM2JTryE215EFpSsOJAezifRlvYyUcvZRnkokg/I+HMSeP
         tPew==
X-Forwarded-Encrypted: i=1; AJvYcCVGDBrr/odyhSJ4K+pHqw3q1g/SFgKkFHL2HTd5SfAcrICRAtoTuLcHci3UOhw2fQmnL8XRqz5/y2dOARj0c2iM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp9/bHahhj/vAbGscU27PcGlqxP2gyCb7oW6VkYts6FmA9BkYz
	PAwNnL6udgzMNij20nDOr7ruGYB57464jzGTG5KqGLVdggbwkHeh
X-Gm-Gg: ASbGncuJRU6T3r2yemrhj8XnL4T4UV78ZxkYYOnKse6xHswgT8czhY6FIPH11rRsNKL
	m2CaoP7u8NmgpzvbB6ou60bAF5S64REqiEJIfY7LIBcRCb0RTmZZBesEhqTEQ3/BIKXAll7Vih+
	LCwXC95Yro1t9Rn2/5hzm1zYAisc1d4REOlOlYu89pHM1KYR3s87D0Ck2pIoRZZHCcFFtoY84yg
	jW8/x5Lho621cd+QQOwt76iwWUUznzS9dZed6FS65qhOS93STydEUduyvZcqoQXQJ0ixQk2qETW
	NovAIUZitlbl6gSlVU5Eten1EYzqsm5nW4tUCuwdBibHZwzYPG8TswlY1YL//rhMYcVLbBlNDN2
	wCmP8
X-Google-Smtp-Source: AGHT+IGvirXrX547Pzmc+Y0plNP5+DHUQkHLaMvaNmdW4WCslAICEC1hYvTBWFyg2u5oqxcINUQj5w==
X-Received: by 2002:a05:690c:4507:b0:6f9:a3c6:b2e4 with SMTP id 00721157ae682-700bad19157mr281523847b3.37.1742996263675;
        Wed, 26 Mar 2025 06:37:43 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba88d538sm25142977b3.99.2025.03.26.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 06:37:43 -0700 (PDT)
Date: Wed, 26 Mar 2025 09:37:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 0/6] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z-QDHmrA9G0Erp85@thinkpad>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_063745_512571_2EE2DB65 
X-CRM114-Status: GOOD (  36.95  )
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

On Wed, Mar 26, 2025 at 12:59:55AM +0900, Vincent Mailhol via B4 Relay wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. For example:
> 
>   GENMASK_U16(16, 0)
> 
> will raise a build bug.
> 
> This series is a continuation of:
> 
>   https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
> 
> from Lucas De Marchi. Above series is one year old. I really think
> that this was a good idea and I do not want this series to die. So I
> am volunteering to revive it.
> 
> Meanwhile, many changes occurred in bits.h. The most significant
> change is that __GENMASK() was moved to the uapi headers. For this
> reason, a new GENMASK_TYPE() is introduced instead and the uapi
> __GENMASK() is left untouched.
> 
> Finally, I do not think it makes sense to expose the fixed width
> variants to the asm. The fixed width integers type are a C concept. So
> the GENMASK_U*() are only visible to the non-asm code. For asm, the
> long and long long variants seem sufficient.
> 
> This series does not modify the actual GENMASK(), GENMASK_ULL() and
> GENMASK_U128(). A consolidation of the existing genmasks will be
> proposed later on in a separate series.
> 
> As requested, here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>   add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
>   Function                                     old     new   delta
>   Total: Before=22781662, After=22781662, chg +0.00%
> 
> (done with GCC 12.4.1 on an x86_64_defconfig)

Applied, thanks!

> 
> --
> 2.43.0
> 
> ---
> Changes from v7:
> 
>   - Meanwhile, in commit db6fe4d61ece ("lib: Move KUnit tests into
>     tests/ subdirectory"), lib/test_bits.c was moved to
>     lib/tests/test_bits.c. Rebase onto Linus's master branch so that
>     this change is reflected.
> 
>   - Remove the note in the cover letter on the return type, instead
>     add an explanation in patch "bits: introduce fixed-type
>     GENMASK_U*()".
> 
>   - s/shift-count-overflow/-Wshift-count-overflow/g
> 
>   - Link to v7: https://lore.kernel.org/r/20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr
> 
> Changes from v6:
> 
>   - Split the series in two: this series leave any existing GENMASK*()
>     unmodified. The consolidation will be done in a separate series.
> 
>   - Collect some Reviewed-by tag.
> 
>   - Address miscellaneous nitpick on the code comments and the line
>     wrapping (details in each patch).
> 
>   - Link to v6: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Changes from v5:
> 
>   - Update the cover letter message. I was still refering to
>     GENMASK_t() instead of GENMASK_TYPE().
> 
>   - Add a comment in the cover letter to explain that a common
>     GENMASK_TYPE() for C and asm wouldn't allow to generate the u128
>     variant.
> 
>   - Restore the comment saying that BUILD_BUG_ON() is not available in
>     asm code.
> 
>   - Add a FIXME message to highlight the absence of the asm GENMASK*()
>     unit tests.
> 
>   - Use git's histogram diff algorithm
> 
>   - Link to v5: https://lore.kernel.org/r/20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr
> 
> Changes from v4:
> 
>   - Rebase on https://github.com/norov/linux/tree/bitmap-for-next
> 
>   - Rename GENMASK_t() to GENMASK_TYPE()
> 
>   - First patch of v4 (the typo fix 'init128' -> 'int128') is removed
>     because it was resent separately in:
>     https://lore.kernel.org/all/20250305-fix_init128_typo-v1-1-cbe5b8e54e7d@wanadoo.fr
> 
>   - Replace the (t)~ULL(0) by type_max(t). This way, GENMASK_TYPE()
>     can now be used to generate GENMASK_U128().
> 
>   - Get rid of the unsigned int cast for the U8 and U16 variants.
> 
>   - Add the BIT_TYPE() helper macro.
> 
>   - Link to v4: https://lore.kernel.org/r/20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr
> 
> Changes from v3:
> 
>   - Rebase on v6.14-rc5
> 
>   - Fix a typo in GENMASK_U128() comment.
> 
>   - Split the asm and non-asm definition of 
> 
>   - Replace ~0ULL by ~ULL(0)
> 
>   - Since v3, __GENMASK() was moved to the uapi and people started
>     using directly. Introduce GENMASK_t() instead.
> 
>   - Link to v3: https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
> 
> Changes from v2:
> 
>   - Document both in commit message and code about the strict type
>     checking and give examples how it´d break with invalid params.
> 
>   - Link to v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com
> 
> Link to v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com
> 
> ---
> Lucas De Marchi (3):
>       bits: introduce fixed-type BIT_U*()
>       drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
>       test_bits: add tests for GENMASK_U*()
> 
> Vincent Mailhol (3):
>       bits: add comments and newlines to #if, #else and #endif directives
>       bits: introduce fixed-type GENMASK_U*()
>       test_bits: add tests for BIT_U*()
> 
>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>  include/linux/bitops.h               |   1 -
>  include/linux/bits.h                 |  57 +++++++++++++++++-
>  lib/tests/test_bits.c                |  30 ++++++++++
>  4 files changed, 96 insertions(+), 100 deletions(-)
> ---
> base-commit: 2df0c02dab829dd89360d98a8a1abaa026ef5798
> change-id: 20250228-fixed-type-genmasks-8d1a555f34e8
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 

