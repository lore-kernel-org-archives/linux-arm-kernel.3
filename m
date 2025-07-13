Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34543C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kEQpD8b+HNVuLM3WhWFj3Mc99doFv2oNkxwhtYpkyNA=; b=QYygoREspLiOxLUFIAKaixG49L
	MM56A8DFZRozO2fNbCAqiKZpO3eNEvLAWCZTBZpULiNfFSKUSlEKtcY3TTgSEV6tIZTXqt4/FgzYS
	4ewIUpi0QM/PDK2wfvok6PSQOJmSO5Gw2OvmnPrCLHRRILiu82lueQw1L5xWAPPbRpNMRZJWdW+iO
	HtnG9i4RE9iJOyS+t1b9m3hIDYEehIx70t3/E1HmoC21Y4Pwif1z0LC7NS+oSaTuQR/nPcxVd1hYN
	BnMyUAKqtUc6R++7QK8soAFzu++7tGvy3EMdKPNUbk96mlvPwxDPGV6qImFzD7cD9OhSJ+pRi7JsS
	N/zxEGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaxfx-00000000Fc0-00US;
	Sun, 13 Jul 2025 14:27:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaxdY-00000000FQ7-1DFJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 14:25:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561607166aso2811695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752416703; x=1753021503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEQpD8b+HNVuLM3WhWFj3Mc99doFv2oNkxwhtYpkyNA=;
        b=Qzu51dKtnuMvGoms0NOJmry78lLB4YS/+GtY/uewO3joUeziH3K2KSZlf3Gs2lCJ/M
         zJGE3rGjst3PffrYjNF35l23F6rAsL74yTugGlOoE8kww0uuNS/nNS/Pgf5pR9srnwh9
         TGFvi3uLRMWuU4QD9kKve+ZFSoQiPtddUE3HQPZdEBldKDgdffrlKwRETIV8IAnw7ehI
         yn+KozoGZphndwioVCJnDp/3FRvYAJC3/v53q70Zy2jc62OMOk7ePBGY7CYTlKIoDiHq
         EvkSGfqJ1inuA05mWvpq//fvf4OEKVoOTLrFTTXl4aq1s6c7RkVOWu66w7CgAmcCtBtA
         wmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752416703; x=1753021503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEQpD8b+HNVuLM3WhWFj3Mc99doFv2oNkxwhtYpkyNA=;
        b=lZ4mfd0wxtWKbEYWwOFqyuONDxNISbmVrUGtGYlbq0Csrl9py+cvx/7tPZJ5XP1sbT
         lgRLBYAoEm2TFsK46KVBxQ3L02BH8XWLRAb8je1vL8Vnl5QIwz3mkmmoyMAXfwSkAyrB
         42g5CGNGYjTs0oDHZ6lrMC9wOcQE+lJTdCGAyref4dFrRWsj0ZFePWDZgkEY0s2jzRIF
         f73AIIIth5Ie187eGqIjw35SFslxz5JA0Q2coRSMSaBjSNHfZCdmpAf+Pqx63jQnyU5z
         CBxBP2jOH8rpD04Uo3cO0Rq0YOVTtOEHVs9+AJJ/Kp0RaZeMV1tNx+6MaYzHK3xsLPnb
         wplg==
X-Gm-Message-State: AOJu0Yzy+nnUNbRuiFKUjQ5jYNNCcT2+DYvUpDoDzdDxALWtRjd7cXxT
	VG0SANJ/XLjLGkeRA8l1Z2suHiN+/dgy/xATpzSVx/H4JgbOHrQnGDC+0G8oZw==
X-Gm-Gg: ASbGncut5PocDdsE7KBf6n3oZJu9CAeVjmZbyEnGR/61bytwlnIpVRQOG01aL6TGAYC
	aUgCeW/eX17mFgxR5F3c0+Xfc8j+Qhjf+XwMoT4PZtV4Pr3kiwjvz1wsFPzWi/wWpCrQFY6oS6U
	QvKVJlmAocEBUdVzBMhsllbZDOATvUktnpMICagPJJQmCt1pnlbLYsLyHahT2ZTfkZj5jyg0CY3
	K+wu3+Y/HqD5MgF4re+n2tZ1Zvp+x9e3I9o8E/NnLZdgeNIRwRwMr5gAEr8+axxlkNfN1pcvl3R
	03M8jIvoYndZrYpLs5niffBZdqq+TofEmEuxvHqmEzpa4z+q2d+C5Aqf4UUkas0/0vvN22KxvVd
	tT9qR5VNoIRJ/Ga4Zor7BTA==
X-Google-Smtp-Source: AGHT+IFrp/gF77QA5ekrhLRIDgGIcIeqfrGrvFNzk/J2w71kdPsQ+3QAHabP11bj4+Q72q5OjRK7lQ==
X-Received: by 2002:a05:6000:144b:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b5f351e561mr7575693f8f.5.1752416702720;
        Sun, 13 Jul 2025 07:25:02 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e1e1a5sm9714490f8f.74.2025.07.13.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 07:25:02 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: sti: rename SATA phy-names
Date: Sun, 13 Jul 2025 16:24:24 +0200
Message-ID: <20250713142424.41236-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_072504_325176_957F0ACE 
X-CRM114-Status: GOOD (  10.98  )
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

Stick to the documentation and rename both SATA phy-names properties to
what is expected.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 35a55aef7f4b..3e6a0542e3ae 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -669,7 +669,7 @@ sata0: sata@9b20000 {
 			interrupt-names = "hostc";
 
 			phys = <&phy_port0 PHY_TYPE_SATA>;
-			phy-names = "ahci_phy";
+			phy-names = "sata-phy";
 
 			resets = <&powerdown STIH407_SATA0_POWERDOWN>,
 				 <&softreset STIH407_SATA0_SOFTRESET>,
@@ -692,7 +692,7 @@ sata1: sata@9b28000 {
 			interrupt-names = "hostc";
 
 			phys = <&phy_port1 PHY_TYPE_SATA>;
-			phy-names = "ahci_phy";
+			phy-names = "sata-phy";
 
 			resets = <&powerdown STIH407_SATA1_POWERDOWN>,
 				 <&softreset STIH407_SATA1_SOFTRESET>,
-- 
2.50.1


