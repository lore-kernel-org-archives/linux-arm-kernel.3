Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35793C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wonnX1qWAYlx3Skv1xUfzqEtU6WhqVwzV5FeMHblEWI=; b=VmTH9KQOAYc7uTmRbw/8sci4ax
	OCq/Ml5ePYy/mE/Mrlx1Huw0iT1gGdtNXEx+dvIABB5l5W3BCMIgg7+rcKqooSNaSPBZ9i58bsHYd
	+3R2GGRwspVhUyF9ecEcDS5DBtV7S5kMc0VanHwi/mIz1tmcENi25fL9vzTGWGMlinhYDNoJE+nOz
	eOZcb3VU5bBKBhvo1Dclt+v96/BOF9BuQufky555KJ9bA+PpkY2c8PDXKoosWWFPQs8lp7lC97aFH
	IKK5F2YMuXi25fMFWUpG7Er4S2hpKc3CF3HEOrZ13XJQ7j/8G0Z5aNXCP/N+6Lrg+X4Ufl745KqPi
	JGoy4OHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRuE-00000003pWL-2hIJ;
	Mon, 27 Jul 2026 20:26:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRuD-00000003pVt-0gCc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:26:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2720223a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785183992; x=1785788792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wonnX1qWAYlx3Skv1xUfzqEtU6WhqVwzV5FeMHblEWI=;
        b=WMhu7vzxoj35HqQ7v3zZ92FOWG+qdA0nUEt15oVBTaFDJcjKX/4Vt1iyVzRBbfz42f
         yJttP07fMaeEUkmvEclJ8t/bI8y9qdLvxbD9NTePukImS9pdPtqaJeiIWe/R316WmhZR
         69A4CU/bQ3GPwqlAfL+AKnov9QcjF3SI0gtaA+ysCLwInai5FN7ddPL9CAvFArSnK/4b
         lSgxzUoV/DsbKt/vb+nMRWKAql6D3GPkNnISbyqRcO6EYOHG+AzCAF5gHkqf8ADOAu5I
         Ynxn1X4JLU4X27nUG20lfAVkzu82ZtQGBhsMN1a/gS+HS6R9oHWeVWShy1iCZFXy/x3z
         T4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183992; x=1785788792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wonnX1qWAYlx3Skv1xUfzqEtU6WhqVwzV5FeMHblEWI=;
        b=LzLl5xtPLJSfctSbpiQfp9XkMJQBwMxr0C1qbnweTUxSYpTcCc17nRoatO++9oSW+O
         nfmvqKzTb5qcVs7NYnxsS20rLPAt6op9T7I98wHaGc7WZdDYwMKYvl/+oOiwZYjvzzPZ
         2l76sGa7Td9+mv9tDvXxq5F+HGGZMSU6OaCpd8KI3v3VQ1K0v/CsdDryxcVlzGv+AYuX
         clF3wjRlBexI30f5JEH6w6uZPyZIvyFHfVNwHg2eF6Itz2iRvl+ngld6hUBmRp1/ENOZ
         H113uKwhLS3l6Fv1mc1Emt78FloxYTVE1hj5xlxcvzo2RgnYu8NPETTncheRf3Up+4kj
         rTTA==
X-Forwarded-Encrypted: i=1; AHgh+RrRW+I1vTr8HTf/LviZZTaU/dsGaHkzN6wL5GEmutfHWfcTvVRw5OL3hCVh0Wtzit3PiP8WolVCKookhEcn7bal@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8s+yIWtajVA0iANTJbMKrEZrnuJZRKfq+T04iN9wIcSNc/Ltx
	HbvEeamE+NobFKXuYtn+MlDuNRtIlEjXmyGtirPUu8xApIApxHY/oUQT
X-Gm-Gg: AR+sD126i1LalQ/xkOZgPGlK9eC3jbTxNkzcVyq6bLXRbvS+oNmpD+inFlnaogHSG0p
	o6cMzC0sDOuZRD+ymZ3a3fHsyBscHrbPYHGZpu75J0fMhYTiILYF+KdCRwFvqACKfeCU0wQAHGX
	4SFTKa1hf/4XXH+m7KUnh86wBPV+cKIaUK92c9d1qO5rsjMIHXIGyxco4bdKXMyvXgQ4AnIn7wX
	JtVQ04NZzmUk0p5c3Gp9kehp/pVhSZFWu5GvhgkTP1Csnbas1P5lmvu6EPICGAWQGjFJ5mfZUrD
	J2GcNQUijBU86XdAoeiHbobBrtnzQLoqzXoSlwaugrNbAq+j45w3v1p8pI3Ko+sp+3FTKnRwkyU
	r0v9jqIx6u0cSZysk5Igs4707FjJng/bG9HWxQqt8vX6KDeh4tQ9Qwe90+zwGsPhWTMlzkjpaHA
	7BgW83q2cdWsWdTef9Qg0f0YQnhOMp7DQI8RZipDXNqemmM7GuR7k93VclGNlFv/62VdiLRzB/m
	7Kjmwh6rXDeONA50GbRE9tIFzrfmKbf0JeOEqBno/9VRlru2ibcEz9S2CsfbQWQkUsXWwt7V+pU
	Zs379cCcqzW/c58OJqHkpljTRUmxoC0XuJpe7ecToV9PTxoR
X-Received: by 2002:a17:90b:56c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38f64977d0amr708875a91.15.1785183992369;
        Mon, 27 Jul 2026 13:26:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc57ae17sm31145099eec.22.2026.07.27.13.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:26:31 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC9: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:26:30 -0700
Message-ID: <20260727202630.21572-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_132633_200472_E29883C9 
X-CRM114-Status: UNSURE (   9.70  )
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

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47189-tenda-ac9.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
index 3ac6cac541ca..8b2ad7683529 100644
--- a/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts
@@ -20,6 +20,16 @@ memory@0 {
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nvram@1eff0000 {
+		compatible = "brcm,nvram";
+		reg = <0x1eff0000 0x10000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
+
 	leds-0 {
 		compatible = "gpio-leds";
 
@@ -106,6 +116,16 @@ pcie0_chipcommon: chipcommon@0 {
 	};
 };
 
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&gmac1 {
+	nvmem-cells = <&et0macaddr 1>;
+	nvmem-cell-names = "mac-address";
+};
+
 &switch {
 	status = "okay";
 
-- 
2.55.0


