Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dz4v7wTWh+buxV5bkfnQh5u0ZNU8LLDOpCZ4M3mCLY=; b=SOArfPgDMikuuzBM8zTsBHiW1g
	BeqKpOjoIDLl25IdjKNFUUdCaNdd1ufVdBgYu+do7F0J/G6pbw5i9cS6+sANwkKXW8hAzixiVVs21
	WeRgg113d69gjEDVhouKrWdNBOvPDYPg47BrjArW1Cz/gtgMkwRxXvjpnvo69+FOosWaPIl53mGAJ
	rp7pDSTcmUHBUXNMfZ5mO0pVegY3izI8JwijCox4FBg79hNuY+qF4V/mrxcB0is9yegb4/BBvkFk3
	TLdqnIEriwaPGok3Ivtut9gz7UndpTBcazmqSEAdvdkKsA+0kT2N9CEiZgrcJSkiTsdBARzjhLVG0
	KNyr20kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xxf-00000002nmR-1qx0;
	Sun, 20 Apr 2025 16:56:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XqG-00000002n2k-31zY;
	Sun, 20 Apr 2025 16:48:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so602311066b.3;
        Sun, 20 Apr 2025 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167707; x=1745772507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dz4v7wTWh+buxV5bkfnQh5u0ZNU8LLDOpCZ4M3mCLY=;
        b=jeoGAOG0dMLAM/ev8IfrhgBYVDNjZn6ND74/95zcnN83kaxzFsabQWK8s2QHlAaNHo
         OqoWmyANz4wkt6IwrU7LjWO8zVAPUMgVh3bOcXI9XuwdvzE5/30f3AwTZcpJDgg+W0Px
         ZRZlfAuGpZd3oxaFplytbGFpMVCP7opr03lLwwG2orbm9C2mt+r1mgNAyAlSpnaJ+esx
         6++0RdODdk3jYs1Z+8WvXMQEFjlR3aI8hzt5en+Z1IZCgA8+LT99DzqsdgubVWXNxfB2
         LRW6N4ngvz4Gcj8Oi0Kn4WsgXf3mlH1tIlzlU7nAlqOA5RvIg7rIZrURRlJnK9I4AtC3
         p+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167707; x=1745772507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dz4v7wTWh+buxV5bkfnQh5u0ZNU8LLDOpCZ4M3mCLY=;
        b=G2SXnW6xXEL+JgX5GSLZ9fSM3B1/ZOcLzTpDhFBrir48O8l0JFO72J5gbtod7C6K/E
         46VBdQszOJDp+0mJdWf349t8zQej7VZrFt4amZDD+AczNWPYC7N8NAXlsGb3TT2NVSrT
         lFndUjnId5VsZwlSdtQ3tEOd515MRl1MRHCuFpMZ1DIEV14v5iXlonxLkSiivcbgy9e6
         AxvtxsACoDztHa8niBN6O4QOPItx1GVo6Dm+Eeq/826wjdc6ecqVimmywRapDVi8otow
         UzbFRuQV2RU5avlcL6lswWb0ot5QIeN+SIIyI4Lusl2FTpyUDhWHlSpaLXX/LOXgNFLB
         TrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHUnRR2qLdAtAVRDuoFIIFtJQM5vItw8wS3gvHLHUKj/JDXe+xmreVkrA8Yl1mynCFYAZBk8x8LV1vEU6iP6sl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/N3/0hq7SAzblpzDDQUlV5dIkTBSWsXQHxnITBMN0G2ADsENe
	Ju+ag9aiEeIYou4OiT6G+9Y9fZS+FtXt8UVEQrfVXzW7ae8uxlvff+OzBQ==
X-Gm-Gg: ASbGnctflZmuerrA4/j3svdckt5ZpQnQUU0cDl1oSozRU6aoPEADs7W8cYrAgKjWnuM
	khZ5XgSzh/Itckl/bmechhWrQ3pYclk5nNka8dVZRH+r95KptwltpPYLNWVTANytMwPsYfuPrBS
	Ch0IEDJwLmSJFabKup7KJT+Ip0tGhGZsqk7rnOVC21vKbmKe9KM1mGO85rZkE0NbaIDLB3MOV4u
	R/qATyUYG2qEXl8cQ2OcCoyIYYJvQrOHIMSXzgVsiEYwtZzCV9DhsCvC1eMa+On/pnyjiJgvVc0
	JeGDLuXGhVJRjFIuqAaK/5oc3dRMHg3R7XQcBcmFa014HLi3FmAH75zcMahP2R3cGPOIELYAZH7
	ffHbR0lwzOIahcNaYckZWg0FNg4aQvQRjIKYdJtRHSvCTuGoZUAPLiIJPlNtyIyjVn0f9zrb5HZ
	hw
X-Google-Smtp-Source: AGHT+IEBFRcd9cWwhp7FQGAe1toZz54QqQETJ9/xJS0fRLA7xLURJChGI3PkKm/lnF/PunHA3BuHHA==
X-Received: by 2002:a17:907:7255:b0:acb:33ba:2889 with SMTP id a640c23a62f3a-acb74dd0838mr829185166b.41.1745167706321;
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/4] arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:48:00 +0200
Message-ID: <20250420164801.330505-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_094828_764070_BF32B967 
X-CRM114-Status: GOOD (  12.72  )
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

Device-tree expects absent clocks to be specified as <0> (instead of
using <>). This fixes using the FCLK4/FCLK3 clocks as they are now
seen at their correct index (while before they were recognized, but at
the correct index - resulting in the hardware using a different clock
than what the kernel sees).

Fixes: a526eeef9a81 ("arm64: dts: amlogic: gx: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index c4a9f855e5de..f69923da07fe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -741,7 +741,7 @@ mux {
 
 &pwm_ab {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -752,14 +752,14 @@ &pwm_AO_ab {
 
 &pwm_cd {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_ef {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 460c46cfad6a..bc52b9e954b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -811,7 +811,7 @@ internal_phy: ethernet-phy@8 {
 
 &pwm_ab {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -822,14 +822,14 @@ &pwm_AO_ab {
 
 &pwm_cd {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_ef {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0


