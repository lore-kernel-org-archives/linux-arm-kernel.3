Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21323C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=; b=w+3UPlBGymcEgbdpLhNccclqUe
	LPX2Sszlba4vp4x9tlRWPRzCPv9LauuaMWM/+6JM/f4/fx+MEDOB1zrU5nbplFJkHxOpbOJZ5WTJk
	ycFHoYyW4dt7CQgD4CoAyMQHKhtCr+z0D9u2swgBEi+hsutKBEoOt8gG9qIISq6HCmf9gFWMSARka
	TctN8zOxun3/7wZWmgVsZ0IIuS4BWMEGgyfhRH3JKgBmOABLQhaOCGGZtS6Wm2e1jwXzivKdwOs0n
	hojKNCtzzA9mUD+2VtB8woaBjBFosDuKZq4ab7AIPVlRFr4aYFCQ8qLZvETDAbWDBmMpnrZrJziCT
	vpMB8JSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdk-0000000B2it-2lcX;
	Tue, 14 Jul 2026 06:29:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdd-0000000B2bZ-1XOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:29:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cedda2ce6fso10473775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010544; x=1784615344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=Fs9KMkks5plCwZCvC+EABiV5yR8GFicLF+2yMl1JTzzcg2EyftRS9E+Op8QN05o7fn
         8YownAS7uzuyU84L+O2yXGjOIClEdOcg4QUkfEdppBhsMG9G+b02D967Ru6A6T1m7+Yy
         pm7krtx6QEIRKiq2a2WjyBgYoYaccFpRxB0qf8Hgpg1WNpmiXqHA1flHVjsFIZy+UVDa
         WuBzOLa8LeYa1rPRq/m9UVRDog43DdMhdEce3xmjUdrEiscXd35ziOJOFrweEw56tIiG
         Zu4vTVuv148DL0BwzS87hDar0Xa1btyu5uUx2AZAbHT675yGNy2EMpAHqNeyEZ6r+EwZ
         +ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010544; x=1784615344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=JuFAB0aMa0JOANQ1vCeUB+MtOlYIMLmZtgjv1cKAtWsBoAVDWQ5ua4QNYsSdnAZZrg
         eQtf28yflLUehzN62lgL7XzGfcPlOWjMsToycXahHpZa7ir/EOx4Ox1q3RBM/yj9fzcj
         pqDvIJpYPaKNt4Aqu9hX93JeWSJPAhRgdF+A+NjchTDelA7xI/FyM84c+PDBDDZDYzQI
         1ZZyBHCJIWIG4xKiN2+QPLzw0eAGoqIOsDoRiTBQHEPSMbERNkQF2jWEolDsJOZoglmu
         F5qN6Vp1hKAiBRBqL9iqI06RqPK79EyqyFs84htjteyfKGRYaOEp9tLwuRRsUNZSTtUO
         fcrw==
X-Forwarded-Encrypted: i=1; AHgh+RombtN8sM19qCpxMz4tM04l7igH5BJzqx1Uvc+iqlKLE8M2pB/vPPFjGLSfezOWKvB/UqaJOP76JZA3H/k2DSwC@lists.infradead.org
X-Gm-Message-State: AOJu0YzfhCN3OXtprYd/ltdiOB9a5fnDa9Nw2vOUZ4Vw59TJHWUY2Wpe
	0zQawB97K/SnSIBLFqMKGT7NFnVR7kSnk9xHlVBkyQUzgQLaUFJEUv2R
X-Gm-Gg: AfdE7clUS6dvOwhUhymsc0ckePfIJt7LzqLSG+9qrUswT0E40KQYaLfa9YtVmy+MTSQ
	XpFvfzynGrEOfalJm6RRTWIMODTfIEabN78piUOKoCtHzRcfGqNODCSaU6M2tokTc5bEfvtdyLB
	GGDMWfzAFYraTS8/nSjaArQs2VcCGzFFuVrnO8/ub08n8eXsyYy9oVCbMOO6aIRgUHTc16lYwpQ
	QsmLJMAX0DsfZ5m5xHEENkpgL7WrkYnNPS/1K0ApGF5toFwMA4u4FMiMlsSt+7zwdY7ZcLCjDrX
	/IwbXwkRJzgRrBgM3ZSfpRqb1pNdYw+lbv1F2oqyu8NOU4/yPmPhr3uPzJ5Y7EkxcUsU7ZvCnDw
	x0fYj87Uty8Yf6uxEIBpFknuxsdFu+rabDG5zpu34mbefnauIDbG5Sgq7FC0qlBZnxFno84G2ln
	WcoPgOL6B+Y2xCYPMiweFifJLAlsLTTxayc7IPOoRYTYFl6pfSuHe65A6gLNs9JRsJUd15P/DCw
	uWh1e7z0/JMtVCis8J2GeskXeCd/gXad7gI9qsOqw2wQCHoavzFbBi8JC0UGzQ7yByV6m84Dpk=
X-Received: by 2002:a17:903:2287:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2cef147707cmr10986445ad.37.1784010544425;
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:17 +1000
Subject: [PATCH v2 10/12] arm64: dts: apple: t8103: jxxx: Add
 device-specific SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-10-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl7zHTaZSaZSWk1LzK5M9+9gUtqhoXtnysHTQ5ur
 7ew+FXQMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOqtLgz/dM/OEVGzm6gcofrprBqvrVaN02PfjgS5pY0XxErE1y8KYvhfwbJ9f7X
 GNjOjyOLULWcflAkK/bfJmiTM8Wnr069i5UYsAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232905_415054_3B22C2A7 
X-CRM114-Status: GOOD (  10.09  )
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

Add the device-specific hwmon sensors for select T8103-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 52965258200d..1212852251e0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -74,3 +74,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 52f63ae7a58d..1d074b9e6018 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -132,3 +132,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 9eb2825d25dc..f8b2b1637b9d 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -54,3 +54,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Left-front";
 };
+
+#include "hwmon-laptop.dtsi"

-- 
2.55.0


