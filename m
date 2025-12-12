Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D6ED59D8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9sFZwm6P/eTEW8HSDvzBFG/JtDhhHz6uY5r4w0vG+u4=; b=l14ivYQxxYoMqNBJV0diUNNNYM
	XRwXqxmFwgmHF46jrRcEcxYd/yTATNRsApVGo+DmWf7q1u5uefMRxQ79JxIejBsNOZFknCrcDvipQ
	RPDkGMZjNWRn+bgRa9lFT+pgUMuWAymQXNzXi5kCX9B4Hs6k3d0odYffM94LjfJzHbGEzuvyuGWIi
	ZGvhIp5jhE8nr3b8QjGjVFMLpXKHg4650Gka8a56LojWXf02PKpNIwU8JLszH1kI3KsXjharWX5O7
	yNN7DbtsIExKoO4fFI4wWK15boY6Uwh+tlGtmCD4aEH3JOmz7ppHxGvE9A7QEL8zXbtc54Bs5z3NM
	62nivAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA88-000000015Gi-0IUj;
	Fri, 12 Dec 2025 20:52:48 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA85-000000015GE-0nuM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:52:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6492e25cd7eso2486113a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765572763; x=1766177563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sFZwm6P/eTEW8HSDvzBFG/JtDhhHz6uY5r4w0vG+u4=;
        b=jiS/bqhKU7vOwP/TLHh0wz1zO4Cjorhnn4iEJ820Q6Y25vo8hZw7/AMCAxZmleUD1T
         5kqcC+6GiqKSVX1AQeRzUb1dIL7+mBxMzjEaoo4cRtSUeA2hALoA5shwmIIkvbyk392x
         Ek+20HwAjhhvko1E1k60nAzB8HxB19J9xHrMOPDRYEjpXCUh7bwied6OnHDcWrGZLGKe
         KVDlyiKcQCxs7Xte4KfklIpXjuAJx6hJoBmkD7IVTOC+snPoLQlVwTLDLWrHKMYKUJEh
         xydK4+ZVYkFaDBgz182XDKgKolbFhnhaxSkxBlUglTV+8PrwhVMv+kv6rtsiV3zcpA5F
         phkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765572763; x=1766177563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sFZwm6P/eTEW8HSDvzBFG/JtDhhHz6uY5r4w0vG+u4=;
        b=jxQkk12SyyhE2KzV2///mFAd05/xGk4pUKEKryumPKidftq2Lz7IDypsF0QPIFfRVE
         LA7vEtyoYrh7qkFP4H019+7AwVqiiL6vAbUW4vaITWbPr2fOrur51HYvkstyG/L4FvVA
         S0AfToLnmPHXg97qXv1SePaJoFvwhPANF5+esuQD9XVCBOyIEdZGxhB46tGOzE7xH7nb
         1Nz9ZSk4m/V7xJaPy0UVhq2Iksp1i3BVbOSdJ5B5XwlF+7eOchW5hJLdC8A4YuG8xvki
         QZncycB6gUDxxjFvLmbGDI/uUECcTmSydaLqmZAzOP3pXDZTJPhMyZ31qyOOf05n/r1U
         vz0w==
X-Forwarded-Encrypted: i=1; AJvYcCXBQaLVqLBbEoSB+oXcL1zBcrPlUK/yovcy7ylDZQ7AS7yb9z/LxtYgmrThlyXDo/wwePQUV50T8c2MySqO3hx1@lists.infradead.org
X-Gm-Message-State: AOJu0YyPH5nHNV1sRbXA0rZwCrttsJQgW2enzeGiZZBWD6b48J4sfZ41
	y1shbiZ8GrUnJyL+BMqfRkJOnSAaO2wR2W9E8hEZTS6esTaXiFEaoYCl
X-Gm-Gg: AY/fxX4zYmOp2BJPXd3GaETHg4Gz21lExziaTjj7QDaoz91ogkGOMj1A3KgYIl6ap4q
	fbzQ8hZe90hl0t6GONlrWLw+f4WiHzrVNId6Ddz/VS/fU5P3hZ4Scb44h5O1qygZ2vkjz1zAD3E
	C0Mf0mTIvW58cydYNPHnSqWAsNLhCKh1Mp087wB+MVORtEIuVVLuO9gfV6sW3shNiiPZJ+DO9wS
	V/AQk7c9PCBGiKSA6Vmy/8McuztTDYyOyr7asir79jO1zyS3V6/PnjjYIDmtzPB8P/dj/8uzfvF
	UvclXNzpejVAW+wpr1+klCRuKp++bsXy8fjKSi9vqWzLJh6Sak/fVVuBP9v4MWkq4Ri3N6WkljC
	ouypnp6SILgnyUTPqhgySNmHGdjE6dADzjCf4anxEhlBcu371KJgRycNxxxqoUHAMmimc5K/o8H
	D9X+aCKqmxtCMbDBY=
X-Google-Smtp-Source: AGHT+IGauNGo93h3WEI/GJLU8tPuFP6dTz6xspdiaMF5oCtj94YYZxyDSgzm2KKKpYumZ6r/xvEekg==
X-Received: by 2002:a05:6402:3133:b0:640:e7bc:d3ce with SMTP id 4fb4d7f45d1cf-649875a5929mr4355420a12.11.1765572763049;
        Fri, 12 Dec 2025 12:52:43 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:1401:37b6:6a29:b0c5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982227ba1sm6260075a12.33.2025.12.12.12.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 12:52:41 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] arm64: hw_breakpoint: warn on invalid breakpoint length
Date: Fri, 12 Dec 2025 21:52:30 +0100
Message-ID: <20251212205230.84606-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_125245_244960_40DD2D81 
X-CRM114-Status: GOOD (  12.54  )
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

Some tools (e.g. perf) incorrectly assume that breakpoints should be
sizeof(long), but this is wrong for AArch64 where breakpoints must be
4 bytes. Add a warning when we silently fix up the parameter so tool
developers can get notified.

This addresses the FIXME comment by adding diagnostic output rather
than breaking existing tools by returning -EINVAL.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/hw_breakpoint.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..4d31842e5d91 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -475,11 +475,13 @@ static int arch_build_bp_info(struct perf_event *bp,
 				return -EINVAL;
 		} else if (hw->ctrl.len != ARM_BREAKPOINT_LEN_4) {
 			/*
-			 * FIXME: Some tools (I'm looking at you perf) assume
-			 *	  that breakpoints should be sizeof(long). This
-			 *	  is nonsense. For now, we fix up the parameter
-			 *	  but we should probably return -EINVAL instead.
+			 * Some tools (e.g. perf) incorrectly assume that
+			 * breakpoints should be sizeof(long). This is wrong
+			 * for AArch64 where breakpoints must be 4 bytes.
+			 * Warn the user and fix up the parameter.
 			 */
+			pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d,
+				fixing to 4 bytes\n", hw->ctrl.len);
 			hw->ctrl.len = ARM_BREAKPOINT_LEN_4;
 		}
 	}
-- 
2.43.0


