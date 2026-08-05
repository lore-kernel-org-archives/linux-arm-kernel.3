Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F3CC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5fOQxawDkoim8FshIMHFVqdsTrAaOqiHpnGvVYNAqY=; b=eLSXwuIx8mBbxJSIAm92DRzDnI
	LiqHNi7SHrPRr8b0Mfo3wiNgpPwtqvsCKpX6rF5Ct2uiJptLlGVmeU7wHKzBVqS7GBj5KwyLkIpI/
	j/HfVXwe1sgt3dHEKLMLKeEMCRME4xoNxmlFNYsi66BYeJyYY49+lVcBXXF/YpZ//g1DQvUFqIqVQ
	ZRlheW1Rl0YDjVRYfiO8WIrkVOZpTZLIEHYmZEEpexWTCLZU+3gJd6Jkpl7A4NPVWIUxTtw/ipKxB
	yDYkEHjZzSmF0pYmeEADl4jmVgM879bOHoHs18yRwXEm9OMZymEr9fnbbKAu4J9T2YkhtzRmncRbb
	o3GnRjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgxu-00000004R7s-2lGt;
	Wed, 05 Aug 2026 19:07:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgxr-00000004R7Q-3TUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:07:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caced6038eso2450665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956863; x=1786561663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5fOQxawDkoim8FshIMHFVqdsTrAaOqiHpnGvVYNAqY=;
        b=dspsiVH1RtMrqhWf70r8uCA+0LJ2sWcPuM0nEc2Fq6KZxTQNElGbwDR9t/a030C8vj
         VWE5oaqx4Y/w7JoHVv1iCH+NxkmQHK8iJ7YX7CIDWH3fmKYM+1+TCmMuUMsWaOanQUcj
         ahx70eOi99XvSkHQOKxrSBwe5PmWsBd+azRSHnwNCv0mveIvqbXy5IORWFQr2BZ2f4sw
         7bPAbPbVNlDHDsE3WdC/gz6QEjIV0Q9g7ANbSpfsAYyINSUZMPYSIzmKcRQ06yvrGAah
         ui93KA/lohA7S2urq8k1JA+yVshl2ZwDk85txxtkA2W1iFs0zLeq7jxV/qhvw8eO0nhP
         +rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956863; x=1786561663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5fOQxawDkoim8FshIMHFVqdsTrAaOqiHpnGvVYNAqY=;
        b=HoSuHXldio2z6I7TLzUNIW3nsinDXCvb6XPUlf3EMKMiM9MpCK08wzu6cD5Jj7aguv
         QvQZOM6gQRBE86n/9uaKVGC7z/ASSnBi5h6gSoonKCSE8i8/A7+1eAwd/Vb9PFV4fFCz
         KwK/mBW02rWxjQpZlI3Avju3ZH2tsFpDeuPV9WvtAERT9mVfjHivgWKXd3eqtCSkWqMS
         9y3+PEJMCccAiMKXDb9q8TOvMyAFvRXC61yhL7p03x7OjXB22CLfXIlHhejwRuLy6yte
         QCHiSGzUnle8EfYGXReiZ07f3Ie6vWux5/8HrVcZJwO+Jy3zoPYTMudvJLAkcYNPHCNn
         WGYA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/vodnU8o05GdQh/qJKSx08bKM38svAAY87G65qL9bWGN4khcxU0UkK9jS/DEkQSM+4MEVcbnMM2EbV2OcV2dv@lists.infradead.org
X-Gm-Message-State: AOJu0YzkjMWSFL8ykLGWx8WlTJkOSqxR7AxNgwG4VjM8wZrdMY7G/8SD
	PO1oneqYoKlLQhMC93j5/PHWn6mO59EbWcviWz5fI64p5n4OIhZGzyYv
X-Gm-Gg: AR+sD116ALAgkBHJdROQ931XhWqenZEUZF5vnuQzjf7a5zLKjdfw2S7xrokdFm7FWyq
	nKiPk3nMld0rbOs6zXorLs1tDFt6+myXzGrjPniITW2FnQKtyozQfh24yUgHiScoIOEJBc6EpF9
	nJf1/kcuTye6L4mjSJl7HFaQyJaIDYE2OBQgBdz8S7Ju3q+wk2cREjzEjs9pJQl1z+5945F86ld
	BwcWhdh21/AfEZuVWd0RwJuBhjI5dfXoFAgJOBDtzmw+iiH4ApPrISKHVAE3aDJooGoSWgovqkk
	l2xt91hRFBUH0b1mP3R9vj2PVhHhH5wOtBbIuFkGL9kX8CP9Vit0e7eD3I9wFTIthwSds/Sx0GS
	ooW83VNMbVfeoRO9cCAVGvIALOxPxCdO8k3Vuf4O3E4Bzx1V/jXpmJTHi6fKvG1xHPsZl7GATC0
	tH4d/1uZlQC4dzADF+kNWe93NzmIO7KTSt7t7uILx1yPU+sSTyTBaoABnPDv4AZrU+mdPqYnm7m
	8w81JUXzLwB2PbRa2eh0abFpfJPxC27uSimZQv/Gx5ziK/5aaDe5UsG/JRkmGJ7vlH9soMkOdxR
	Axq9yzrcTwaEkZnjAva3+M0JohuyIzJHSe1+UQ==
X-Received: by 2002:a17:903:2a88:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d0f185d64dmr17653165ad.2.1785956862798;
        Wed, 05 Aug 2026 12:07:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm20026995ad.39.2026.08.05.12.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:07:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM53573 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM53573: add phy-mode and fixed-link
Date: Wed,  5 Aug 2026 12:07:40 -0700
Message-ID: <20260805190740.8152-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120743_868974_21EDD6FA 
X-CRM114-Status: GOOD (  10.25  )
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

These are needed for CPU ethernet links for switches.

Fixes dtbs_check warnings:

switch@1e (brcm,bcm53125): ports:port@5: 'phy-mode' is a required property
switch@1e (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
switch@1e (brcm,bcm53125): ports:port@8: 'oneOf' conditional failed, one must be fixed:

'fixed-link' is a required property
'phy-handle' is a required property
'managed' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm53573.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm53573.dtsi b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
index 2c43be98090b..1dd2e984b1e9 100644
--- a/arch/arm/boot/dts/broadcom/bcm53573.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
@@ -226,6 +226,7 @@ port@4 {
 
 						port@5 {
 							reg = <5>;
+							phy-mode = "internal";
 							ethernet = <&gmac1>;
 
 							fixed-link {
@@ -236,7 +237,13 @@ fixed-link {
 
 						port@8 {
 							reg = <8>;
+							phy-mode = "internal";
 							ethernet = <&gmac0>;
+
+							fixed-link {
+								speed = <1000>;
+								full-duplex;
+							};
 						};
 					};
 				};
-- 
2.55.0


