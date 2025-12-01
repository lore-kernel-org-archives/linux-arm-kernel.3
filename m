Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D2D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7olQJkRc4y8ZtsZKoLuuqyEd4qRhINko81csOamj94=; b=wcrwj17omP7Kw9k6Pw6riPlPIK
	v/t6S4MEUEvuZiRhJXniprEpxusxMjqxE7XuYEd9C/MyECVGoaiK6D49UuSv1VwOpU8Q548RE9FVF
	W4bE2Culs/teceWjd8E7s5Do6xWz4NEcChD2CuA44coxSAscNKXwh1e7hGJ3oEg4JfBJsBPKnOPT8
	hb4s76Qm3eo4kW7Tq4Q6L9z+eGJ0JJqyJ7GL/imXWF4Uo36cIXuIR79+zBd8B/0PCo70VbGsFtHoI
	KUCSz1fMuKU8mHZkzNRuryfI6/4hwipgpasYHecku5prF4v2y42eU1zMgRkNLUbTVPz+Xx8qB8INE
	j8Ejk7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2CG-00000003T0z-3TyS;
	Mon, 01 Dec 2025 11:36:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2CD-00000003T06-3kH5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:35:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775ae77516so41614305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 03:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764588954; x=1765193754; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7olQJkRc4y8ZtsZKoLuuqyEd4qRhINko81csOamj94=;
        b=Eahu5bf9VNw2+wGJ/0FV1hDX1CpKCsfk3Uda7daUt/Ii57n5GSNMNROpfvQ8GZdSfU
         I0GgG2GAcCoaM0EFsVkfAEW+R6R2zdjdtwXX4kkKZ90fcvPoFJw8ULUiw3Yzb5fgvLHV
         pez9Z7LHAHhudmlI+1ElPu98hRhwQRuU1ocSOYoETDGD//qN0OTzx67jm9KPDoremcTX
         1Vi2GyCiWwWygafduCga7j0B1VSsaTeDDn5L/C2st5qxMS6jaFPCIS9Y88wGXUAIhU9o
         jhvbzpMC/zyd0Or5t+/5gB4N5aOKd/LtPvVHvoKz1xTbV5hK+/jmzI3YA1Spfd5a3AXP
         bBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588954; x=1765193754;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7olQJkRc4y8ZtsZKoLuuqyEd4qRhINko81csOamj94=;
        b=Cz8l4U+lvg6Un1uplSICxQl+QEE00duGnzJLF1d8ivneTDZxYjP/avL0V9/YkIZIQT
         x1dxSrCMFn7zGVCoxI3yjjX0G+x07HdIA2EFfAomQQa2WeHk62HaPqHjGtPr+HgVCQQU
         7Bi8qXrAbRYmAB7Tee1BunALPJ+TABOVDauBYwatF29gsS9uohp/Rsr5Cc8gL6k+1L2a
         TAROCeaZWln6lhc6qBvLMMGi9kCFjHZuMP+u2quiLOaCOw5KNcU0tb9XrbBoJlK7/UUX
         dXv9IRf2flMreN3bATts01sKSBljzwm73ECfiygcM4T2rRuK5YUNAjwx+SwpksnCCao4
         j+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8VbUfZGmF5OZVXm0yom80xQZbFOoRyBk3lOzXkdvaHfXRlSz/nO6kyzONV3xGWjuJzHitkzD1LRTHUTNg/r86@lists.infradead.org
X-Gm-Message-State: AOJu0YzqoGLMjI+gDDN8JeaTKPP8hwauHi6NVCBE0n6WB8YulSGaq106
	mzlOzVlEVU6a564z4DgESKBToZmXUE5MlQNvl9wNilOoUQN0d6WLQne9LiN48JGZnd4=
X-Gm-Gg: ASbGncu5p8o7hVZFZQkcxydCUBjps1q2PB4uQpTB3bm8t3sC87JWh+nxMm30zL91wLM
	/1DYjIRKRmikzu/ghZzwuD2HmoGFbII+XwCcaQvRzz4ee3FEMJF965on6Iv0kz5fipotf41nab9
	iC+CnSBkRTrY6HK51ac5anDXd+DYcneeUX9JOCYtq+PGPYNbo9+cDsSsYemXAjbaPxPlpITlRL4
	PpS63cJFEMJBx9qT16uC9ywVPdN+s51GSiGPEhQhK6xP+XkHSvr/GNNRDHXI26ky04FFOf1eP8J
	gFxYwVjNjzSp/gIUe+p8MQH1ho1auUo1KWHi0zqD42YtdLQyEz0afr5Hzd6qkmc5nM0akCpAIXo
	XDK7AmINBdNk1cfqqohepvcrQz4lxQH9eL1MuH5vti8BBsfwTcQAzSIZzNJekq2lnYYVZ7w7DyR
	0DtpH7ZBoPD5O8bDgrBPbwI/ZTZXZEcHaiQmYw+WJohcc2kTRoRViPtnbb9LY0jJQ=
X-Google-Smtp-Source: AGHT+IGEmdMZ0R3tt5yY9NXh82qqcwbZBrGNS8WUEWJTg2IQ0I0mwwWROWpuFC9/qp0jUemfc1nANg==
X-Received: by 2002:a05:600c:1c20:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-477c1131d60mr402688025e9.29.1764588953844;
        Mon, 01 Dec 2025 03:35:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-92-99-175-128.alshamil.net.ae. [92.99.175.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47913870b38sm92507995e9.15.2025.12.01.03.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:35:53 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 01 Dec 2025 15:35:38 +0400
Subject: [PATCH v2] arm64: dts: rockchip: enable UFS controller on
 FriendlyElec NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIl9LWkC/3XMQQrCMBCF4auUWTuSGYgRV95DughJ2g7YpCS1K
 CV3N3bv8n/wvh1KyBIK3LodctikSIot+NSBm2wcA4pvDaxYE7HBaGNaBGeNr6Gg5oGdVkbRxUD
 7LDkM8j68R996krKm/Dn4jX7rP2kjJFSer560McTuPs5WnmeXZuhrrV9iQV6rqgAAAA==
X-Change-ID: 20251127-nanopi-m5-ufs-52f2c5070167
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=alchark@gmail.com;
 h=from:subject:message-id; bh=jit6SwpYSZg7MHOqsz1YeBvIKc+w2wXoHi7Wzy+qMew=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTq1vaybzo1+9jx0qZ1ee+ZUyuvfLn0yekVd+6CyGDre
 9FCHAtudZSyMIhxMciKKbLM/bbEdqoR36xdHh5fYeawMoEMYeDiFICJZBxn+F+o2aN9VcvO/P8J
 8y+OqYce/RHVeqN16r3RDe+Z3ZLN+jMZGX7Mu1lXHbDeUqW48E/atZTIR3KvWJXPLghN7jWIMK7
 JYwcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_033557_941650_05820E11 
X-CRM114-Status: GOOD (  10.44  )
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

The NanoPi M5 board supports pluggable UFS modules using the UFSHC
inside its Rockchip RK3576 SoC.

Enable the respective devicetree node and add its supply regulators.

Link: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.pdf
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Describe UFS supply regulators
- Add link to schematic
- Link to v1: https://lore.kernel.org/r/20251127-nanopi-m5-ufs-v1-1-0d28d157712c@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index cce34c541f7c..4f2930cff70a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -110,6 +110,24 @@ vcc12v_dcin: regulator-vcc12v-dcin {
 		regulator-name = "vcc12v_dcin";
 	};
 
+	vcc1v2_ufs_vccq: regulator-vcc1v2-ufs-vccq {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-name = "vcc1v2_ufs_vccq";
+		vin-supply = <&vcc5v0_sys_s5>;
+		en-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc1v8_ufs_vccq2: regulator-vcc1v8-ufs-vccq2 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vcc1v8_ufs_vccq2";
+		vin-supply = <&vcc_1v8_s3>;
+		en-supply = <&vdda_1v2_s0>;
+	};
+
 	vcc3v3_m2_keym: regulator-vcc3v3-m2-keym {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -906,6 +924,15 @@ &uart0 {
 	status = "okay";
 };
 
+&ufshc {
+	vcc-supply = <&vcc_3v3_s3>;
+	vccq-supply = <&vcc1v2_ufs_vccq>;
+	vccq2-supply = <&vcc1v8_ufs_vccq2>;
+	vdd-hba-supply = <&vdda_1v2_s0>;
+
+	status = "okay";
+};
+
 &usbdp_phy {
 	status = "okay";
 };

---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251127-nanopi-m5-ufs-52f2c5070167

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


