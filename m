Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D7CCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=; b=F/NlQm5kiPKDRpLQuCn4J5zRBA
	HkcXEZOPycdTfUDiYQ2s/90uBSA6Tp0iqUaZHImN8tGiJciYXmRerbs5pfERy3Gblnwc9v/sbp9fW
	BO+mh1HS4ouhaeX2CvSk75rgiSffb95gHv/SS1JWv1kKR/LEf9vL+aheBKesm7Kcy9IUyMi2sOol1
	wMJFH+6AoSwghOuX2OSZ6zoq1S0XS9sZFtHbqvhfVhTRcNzRtVvH/QKYHwwVoiFko/oaeIgO+OU5N
	nqbWwAZ4hT2VKXN0a9DW8xCVjmsR1tSVpKtRD/TRujHXf4E8RNTk90qJPpHgv9aKGrTrlKym8gR7g
	6tJ8JRHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCqj-00000000qRt-1uuq;
	Mon, 28 Sep 2026 15:01:01 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCqh-00000000qR0-1AQB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:01:00 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso11321065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607657; x=1791212457; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=Eu9P2Ph2NkHSTPjyyHt7fpKbTDVn/+s9x7MYhLnRYlhfSFCNkg76FLEioupoAdoqeA
         Q78EUgc8NCA24U0Cip+WzOvfmDonX2qVYPLF3C8MXFtqmiWJsgnobxZRhqhsNY+SE3qU
         VtnVwI0m5csJaps0p+8pE7GIEYKpDfxMSlKrjlzajEArRevqPJhgyX6U3ugkEuVdiiJq
         tm/kLJkjG4lKyk19gaCU2hDt4KvsLEm/BjCjwMNB7p1TkywnjACbBqB+kz+624mfdvKy
         YVnRZDU3OcyPziGBSgLZEAsjJY54X0yjELDyOkJfJS+W6/lid3uQOdNqvrdBlGUIHADx
         +PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607657; x=1791212457;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=24hqiUNzw4wi5fmgEpWsrYpqHWb5/MwWOKb46/Pbfx7hp3GWvUFTkbEZuDLC2Kz00r
         jvaK2RpK+A9uG/1Kvqo76ZIK5hk++dCIeRKsmPccnJPnFYaVvmcVNt3vh2KosL9GPy++
         03oEsYG4unkpz6Ys1sEyPrSk9FHR+mNI+WwF7Sz7x8IV/qxSBAdVBCFyh4OObYavZEdB
         Rrt1ndOJzLJ5lkuQHAQc7irMXSKqdRwg7hWJj2mh/8yFkmV4zUix4pucl7P1CS7S1sl5
         04GRHpztRKvExKevHmtgWW/9FPJGtV+B5VY3Myd0M3JJBdYkiZbb38bFiEUD2GTfF3Ky
         GVYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvZoNzX+y2gnK6LuIuAXSC7rWT/01MbvnL+fPtbTYRS1bLKSoXhb4kY5eUT/1lc+9PbPwo2oBggK1IEqLjupRw@lists.infradead.org
X-Gm-Message-State: AFuF++kB6VNyJC2YHPMLF1VXYb0hwVpuf+jlYKvutgQ7yJoeckL/Ow4H
	b/oqvmUVR+EqIduomE0mz2JjUApwhPoSw7conPGvmC3lrNyer208I7wS
X-Gm-Gg: AYBFou1bUWpO1GJKT0rGfT4UJNRTS0hCk5TWwR5QHPhL6VHoMjMZzNajKHzfwriONSU
	LJzWvC63e8xA+h3LPTNDTvhwH3Zh4YYZlq/hAAz0H/AjM8mQCsRqurC0DoiGTp9K266k3jbDNzL
	OYDk5aSq4+cek2gCjb2vPwBnsjVEh/FwB1Wzo7PRAFINxPSSRlBrh6C1zfNJfuna8oE2MLDiwI0
	vuwFVU7/2oQLyefcxg08XYPCBCKj6bJYIvfuGsqzs4w8VUvmiMLuvt96wmSOQKW/8U7PtM4d8KI
	DItgSp6ZscsrPDb5vWCn1Qn90gQueTFRqBtnzs4xewhin/bvZGkTZsCsCXabRvMmwf9WX0DZXGw
	5bIubQAAKfugql8NfaY/ZR8QVodbpFRKH8YkG4Fe8C0Zf5I0tisA4KDOUa4oVERciD/dRJ2fPxB
	9SztsLBp8r5WhEnPdKFio7LljK50xJ7jm56JSZHbhzSDFtOpt/VbFonA7Nxu4NJYMy4jusa+kqa
	4CdnaJJUmVJN8odT24xx+Z0dSEwbRTSCvYOdq9sQyJHMw1Z+7ewjumHJfF3g1gF1X7DPPgs9GmZ
	9lHfSOF+AcpqqjWDMYyoDSBW9tD8VuX1SOHQzMd3TEMPhZjq
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr61722025e9.34.1790607655941;
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm151777245e9.15.2026.09.28.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 28 Sep 2026 17:00:46 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on
 Clover board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-imx95-aquila-clover-enable-lpi2c8-v1-1-9a9755acb8cf@toradex.com>
X-B4-Tracking: v=1; b=H4sIAB2BumoC/yXNQQ6CMBBG4auQWTsJHYNQr2JclPqrY2rBVggJ4
 e5WXX6b91bKSIpMx2qlhFmzDrHA7CrydxdvYL0Uk9RyqK10rM/FNuxekwbHPgwzEiO6PoDDqOI
 7RmvMvoE10gqVzphw1eX3OJ3/zlP/gH9/w7RtH2AAF+uFAAAA
X-Change-ID: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_080059_345428_030A9A94 
X-CRM114-Status: GOOD (  10.94  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable lpi2c8, which is used for the I2C_3_DSI1 signals on the Clover
carrier board. It was left disabled by mistake in the initial commit.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 365bce73eddd3..07bf53240958b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -197,6 +197,11 @@ &lpi2c5 {
 	status = "okay";
 };
 
+/* Aquila I2C_3_DSI1 */
+&lpi2c8 {
+	status = "okay";
+};
+
 /* Aquila SPI_1 */
 &lpspi6 {
 	pinctrl-names = "default";

---
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


