Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ADFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rszHqEmxDFDqxh5ImflN4RcHcjJXrDRxGzZ2ja7xDR4=; b=bdceik6zZbe61+Di6rQ73RiZZH
	6Xn9nPEW4wGz+IsJ6/nAdZROJdFKnDWFmULJ8YQ98344JZkSXa0Tjc9Y7AXRH02ihUDwGXb1QcNNh
	WJAQx3crQAnrWGQXvYarxhPtbzdrSh/n+iC08LyuxdRkCGUMHNJMUqXqoEI4yVJBdPmfgA/jctIGW
	fojREbdpeeaM4HbFpOyCSoezrh/+AyL4RSNtV0x85wIS0KtFiM0JbYffUFehpygvXI1SPp8ldZNar
	Ksv21p82MB71KL/iBhrMMG6HDrIHD6JWoLByuk/UaEBzOLRtyt5clmaH6I6Ii0UWyw7hZIC7Qww6d
	LFqRWAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6XX-0000000CT43-1DFV;
	Fri, 28 Feb 2025 20:00:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Ko-0000000CPS8-0vgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:47:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0D30E2529F;
	Fri, 28 Feb 2025 20:47:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln3qjrOqJsV5; Fri, 28 Feb 2025 20:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772064; bh=dU9rKZWKprX6jBcDruiShwDQmUw8LNa+ul4pwkRanVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B+EO3oCzi15xaiYhQcftMK0yRx0uS213axZpSCoUMztLQBgixmIBWz+qLFshy1KUu
	 XhJirD0JXBbPxeaoV7x+WS8b7Rz2go5LTXq3H93XIeZVB5duyRgIybr9NO4MiHkFFO
	 Q4putn6CQHRrfhFNCmu0DW/Pg0V2hBO0jzncprxMzIHq9kW3qIX3ypH13+Egeb75Y3
	 t8TVtg2QL7zPfEPUQ4EehSmAWF4Fei7V3wlR2VijRXOehPTssxeYfej3L+JAop56g0
	 iiqqGCN1FYvh13bnFVKS959sndmoHTqPrzUpFCjb8do1vjtC0N2n5p4BymlHHQ3LAi
	 GRhsGPQhlEt7A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:16:51 +0530
Subject: [PATCH v4 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=804;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dU9rKZWKprX6jBcDruiShwDQmUw8LNa+ul4pwkRanVQ=;
 b=texv3HfBqBwnfn8wOyz+zB/PtOL+oe445aSou8XN3LcXoqGyR/V4ktIG7b369GDcCpvJ7zgf0
 iBBFL038AI/A9/lZ8wtOCXMZ+e5WWPIyTff1ryKB+OarmhcZhYPgWXq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114746_413204_02C1A993 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 3f1a654c7e665bcccf6d1b779d2a6b90c8ec5625..345216fd3059ceac56de7b9ed401b5b42bba7ac7 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7870", 0xE7870000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },

-- 
2.48.1


