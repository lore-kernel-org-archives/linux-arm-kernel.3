Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABA3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=; b=O11Vw1hx1WUhfVbrppwdFCa2NA
	PWUanErFolrR///OG0Qm1xMS+XmdO+WxMPGHZOd9XBFDwPznqlGRAjdoEWCeqlnAu8j3qNG+j8lpN
	Yd1k4M/Iun1s9o1FdtfkL1XOqHE1gps8N9gcMsgiEXQH3MFhnQfF5kA4RWVHHO5OZ0ghCRlj4noBx
	dchtgG+qNP8L6ylX6zxvcUAvRMC9TjfltQedv6xtUdGJ2xltJvTFE2/pyQv0PD1nucqvesf8shHfk
	L9ZsrYR7T5/JuWPvNLYHjv3087KxdAeMk73s5CiOwoFy2SzNWdx/jlqWidMbHbGUHgi29jUUts2J0
	hX5yuQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChJt-0000000BYLx-2Sr8;
	Sat, 25 Oct 2025 16:40:45 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChJr-0000000BYKz-2RxU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:40:44 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4eba67d4ae6so3132681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410442; x=1762015242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=;
        b=CPFOW/8GMX+eWHGaZGf7bLAKeaL9g82ud2G8u0bI3maVIRNiuN11W1Q/1quBi+QenD
         0oRR2qHbAuShU6HuQo7d68SOIyeC3sszTKthyonnkyIWVKssj9Xsp6sI97coXngIEyCn
         qBDvjKewfRriPU7lgsAy4wXSuM04DvQWclT2cQclG7Bpo2tMLw+p/udP8mS4zpoDub9h
         XwjlPCWiacPTWCQzZ7ToG0WzAetv1C/jDScE2olb4zle8Al4IZ5FQDW1zGcc9hZ7TuPj
         nL1meEkzX1AEMgt7sh8+PR+Ss6FGesgdD1dFiycBKI0IObP6pXnrE5epf9FaVgEuW9Vs
         QtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410442; x=1762015242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=;
        b=rd8gWrQuXAQkkiUekJFq/1ykcBati0JJkIgMjbZrcKzyy4e8AGcSiaWXR9Ex/aVWOJ
         czQL3LuzpLJ3IW1gkVEmfEYC/F4Lge+CYQ719Bf/a7VX+9nFh73mVlbrt94gkAoM6HqO
         uXab2n0GwMbP40+k7ZmeXX6NLaySYcwrnCWTkd0MOnJBZ2mcIGb8engRb4mpi3V5YAh7
         xoJy6BlSN7RDX5SHOgQQflB6kOutv4UWE9FY3c0NQs+IXKCSTDaoxkoo1Vh/cWasq5Zi
         L8dclPiasSiPsrIIHKOWd2dMajQ7hsuoolNvlKeBhjS5OREO5Ig1euvpb1PHg7wJ8IyN
         Qd1g==
X-Forwarded-Encrypted: i=1; AJvYcCVw+yJLGgLlASP+aNXq3moAi2ZNEXt84boxD0dP5Dad2K8iDNfMB9sHDM0Wx1nzVBEcWvibCGoLFlqXoliD8YE+@lists.infradead.org
X-Gm-Message-State: AOJu0YxPbVfVULgq35raD/Qls0wGhfYM8dMn8v081mYBaj37K4wIBNYm
	sQJLuHKL7sX2UA39glb/8pVCnIS8lEtB6ZYhdlPBz+GydcLBFbxv72gNqGmsFQ==
X-Gm-Gg: ASbGnctNhX/H8GdElrhoJktIU3uTu2yi8y3bhHFlhUS/VKg5PERZ6GlvuzonPRjQr5e
	PIv8LI2nlpQ/xQ54PT90qk8VQYqdIGeZ4zu/BbgaqXWigzICdHj9ULZ1o78uXS5jdQfJkHUU3nN
	Rva9AC+1V5os5+mro3bhCqc/Q/j81xnastpGC3ZRYQuuvpP6d97E9s5l1+z3ZYo696256Ou8a/6
	1GRmcgq/3NH2PbQ1eL/K7csKvXyk8RbmKC2+q0x3jGPM9jBq803JtQTgpxUYLTnUWby8QgSEh60
	bm7pfnONijs+x45/D2qstd0l08yrTHC/nF0ETtvdgCJEqizkra8iH9TzxgXRAFF0bDuVUemR3LY
	f41JE7uuXFxSL65gAUmTFemM8BkKFZeFgwkv04zcNrSrn41EXDnnriNLwT63dyI5lLDTbZsUBvO
	CoUyub7J4=
X-Google-Smtp-Source: AGHT+IFkeV9A6Ptus3JmqPV8qa6Aad4UN1X85QS76U9hx0IlT5Ln2gOuZnWRlM9bH9mA3BFWyYon/A==
X-Received: by 2002:ac8:7e84:0:b0:4e8:b793:1c3b with SMTP id d75a77b69052e-4e8b79325e2mr295994671cf.61.1761410442323;
        Sat, 25 Oct 2025 09:40:42 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37db728sm15162421cf.12.2025.10.25.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:41 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 06/21] mfd: prepare to generalize BITS() macro
Date: Sat, 25 Oct 2025 12:40:05 -0400
Message-ID: <20251025164023.308884-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_094043_619896_E629C68D 
X-CRM114-Status: GOOD (  10.48  )
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

In preparation for adding generic BITS() macro, add an #undef directive
for the existing BITS(). The following patches will drop it entirely.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/mfd/db8500-prcmu-regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 75fd1069372c..25d2d5966211 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -12,6 +12,7 @@
 #ifndef __DB8500_PRCMU_REGS_H
 #define __DB8500_PRCMU_REGS_H
 
+#undef BITS
 #define BITS(_start, _end) ((BIT(_end) - BIT(_start)) + BIT(_end))
 
 #define PRCM_ACLK_MGT		(0x004)
-- 
2.43.0


