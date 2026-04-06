Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DCFFB5168
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 22:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=; b=O3BtbCRgoGRqVeX5px+Dbz8xol
	9fj6nWNOltgCvhuad7sTKUT0A+tnbdvYVt6cWaW6l4Y+AlYVq3ffXgMt0rZlGkzBK2U2Z9lYz6U+S
	lKp2ET+xYo9GCCSP6PB6iM6SO47TGS1PjaNQ0CcOBwkUhHZGgtxEjbwAUxmKXpUfa98nvXsF5UZxB
	rfjrKWAJG4y3Xf5QaCldDICLDcKy+DTTz3uI7BT4SgUfOCKCulrU9NHEgdxJ+cUfLk8D/Yil+Yw0y
	Nonv9tErY7Ua3IBLM598JoZC6GKs98X4N0orRmFEp+s82MGAcrXG/jJuDeUJWp8g1+ImNh4AWuUhg
	XSvsCzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s5R-00000005YNp-2y7K;
	Mon, 06 Apr 2026 22:06:25 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s5P-00000005YN1-1qGv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 22:06:24 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-506bcb23a78so39666761cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513182; x=1776117982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=NjKdvHQUv5N1C/hL/2fI1uNesBABKS52L9Lp+YJYEt34WjOctiSM8Rkpwf8ZADkvPh
         pwS0iWZUMhHNet9X0YTpQ4nacIRh7fe2b5C6nMtEt1GFZoZ09zqd7PAXxbvmYYA5fYkx
         tVGf8wBGPTdRyBJkE3PBNMDrmb1ByoIrnLIA2QeXnaACgjedzXvBF59AAliLjuHtSIsr
         7KhbKzZx06LqJR0ZIuSmye9f5vfkWeAEns58ZCcGP+Iw6Enh2SZT0MPjjMXapOQnYbCn
         tfugR3CSFd4H88lI+0GCYV1z8ivHlyIV1dh4QTl1SGb/8OAPVY2xlHl53NMKb3iB9hEV
         Vvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513182; x=1776117982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=EsnPFzupeQ7CuQIQxFud+g8MnJhP6Asbas/wLlv3TXnla1VL7q6gkWkv010X6MAgO+
         yHKXGObMubih4G5LRGyGwWk5BjadTL0fqb0xH4wAHnV3///fB+El8jz05NXOfIJ5pf/+
         +j2DZzr6oWY7kRkK4ONhGujYGUJvJnZ6dC3o73UO4FGcFSj248e3fCe+LNoIuxc/utF2
         rau/x/COU1S2+8lSul7mIe5uqE6uPl1jj/IvNg77Zm2CwMrN6oHTt8FmpwyFkdQ+Iw0U
         UEl1dIZEViHiESEtys7Q1XkiV/m7yuogfSRlXVnxnLoxIyA2CzHW/0UpiUi0YWvylm1I
         DR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIuuVY2S5S7MCEzrDVwfmsgF7VfoGq7x9WsooLtOWSZIVRetqAX4GCZyiP8UKOiY7JCrKR6vGaEsc3dSasGvMs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3cwQ7TDCeV/AfUTY/CXQsQMisD/LfmvtM0ArBQFmm91Si7WBg
	vb3r4kUN9okrlI6KaCA/9Yoq+hwLaCwS3P3lqSsztNLWPxUROfayW7MN
X-Gm-Gg: AeBDieuYKBTz1UXJFP+QhprnsjNsKoCAlcpoXtfOXyDC4MkR6xu+lA16yMvrMFyD/PM
	OXGvR7abOeGZuPX1NWhgd76PhnBRZzAPkYwF8nrRfPu+XBhFI6TvFnOeW2P6GkvYGYYuDsKYObE
	7RVrKAlZvnhUA/wl5FBoQIqOhql/Sm4pZz9HLLj0pwHdpDFc4iwGMEtpyfx5ks2TareCbgu26k3
	Jwv7tTgYJvaeUPn1sDmyQRJWdyyurd51DcFTNdvdsXpgMvognngFAc7VLlb6xpTjEbhVJZuA+Ck
	bs4soRDHWp/o9AMEaq+ELeo4yVaAJyfApkkoBvOtFxmy74uyjCBOpuZcDMSWLOGIM62nz0KMHyB
	EwZTAvVoKMK/y4gGxWfRabOgaRpNUeo8xcAE0aSc1eqhnRl2a6RbZHdsNHUZ5ByQM4sHElXBnZC
	vek4gq9muwLSIfexBXUKmcds0VBgTgNZSHxHc2MEDdg06/yUofJLRgzi/mr3v/d+PyaA==
X-Received: by 2002:a05:622a:544f:b0:50b:29f0:299c with SMTP id d75a77b69052e-50d62b53f30mr220835751cf.60.1775513182026;
        Mon, 06 Apr 2026 15:06:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ab9acde896sm19775156d6.8.2026.04.06.15.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:06:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
Date: Mon,  6 Apr 2026 15:06:03 -0700
Message-ID: <20260406220603.101494-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_150623_476872_648131C8 
X-CRM114-Status: UNSURE (   9.41  )
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

USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
to do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index 0454423fe166..ad246f9a734a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -43,3 +43,7 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0


