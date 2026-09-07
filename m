Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E66C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3G2fpMnHxfT6KHZD6xOx0AGQFY9wvoJVYEba4PDrt34=; b=c14rlbBWmLFHkSgGiSPhzEcBdZ
	vnncQpGGbpTPvNn9KAC7xEnQWH83mNeZsriccjyL4WnHuNo7prLKWy5sJ+LBE3tr9FNzi3VT6z36N
	vvslUJgtgtdf6nUlE5Tiu0USkBfhEeSs/vL3Vy656uNMYBG82Ehm78UzkYrFEkgGPa9YJqUUSqsEN
	XmkXYCvFT7Z2+5waa/G0XWgNR6KGejzw8ZQcwTtWb7Mp/hq40b8c36/HBC0zRwIjtjhumgiFig66q
	blr88Eq+EzJezAVQDGwKct7Gg1U6UEAPD9Csr/4M+3xfVJ7b8rzXfySJ8VyY1SbKM3rPdbJlyaXx1
	M+Ygs3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Nhz-00000005ern-0xfz;
	Mon, 07 Sep 2026 00:59:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Nhw-00000005erQ-3RXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 00:59:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8535a9be75eso2212135b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742776; x=1789347576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3G2fpMnHxfT6KHZD6xOx0AGQFY9wvoJVYEba4PDrt34=;
        b=hAR7FXgrt3HWDISnCUa0EZzNwTrP4rxpVJSkvyJzA2xGs5oo4SHvfBHXLBmxjd4fHg
         VdpdP3bMJoNemkQj9GasLgOPvh2jlnyYVw/fJwaMHhpA/Dpv6ADZ/PeG6i2DjQtd7AHY
         o9jFg6g1zGzsoaYfxJekYgJo6uY54XZnFjtabWlGs2FZwvG61Nj05OXNBQWiQSMs1H37
         eDxdNyOHYUh/MweHeSl/RK0NCwVBtE8mQrywg+Ie7pYXgvnxNSVE95ZSii0RTV/jn/Zn
         8HlDRwSvumXiawsh2Rjek51R6CZaW5e6gp/okwARb2AbJ18FOZgey4ijdGbLm00uKg8Q
         fGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742776; x=1789347576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G2fpMnHxfT6KHZD6xOx0AGQFY9wvoJVYEba4PDrt34=;
        b=j/pTy0bcBp22UWTxJXys8PJnfz9p23HEZlhQgTh04sM2qDMWY8yPl9wevw8Efm/hf8
         Xzvw0VeQ2WH9018oiVJnZ7z6au8LNC6BrJ8QuHlXatuKEuvr7SH8q5uSHTyYvKbzddIu
         tssUfpIl/FdHeyKBSmXiIDzuhp4Ao9K9SdS8exkypgO2Bw5F0snMwM6xn0CT452B53oL
         239bBtuIHYQpcCXrD6vDeXmTuynAAmLY8nLHnIL3iPPK8D5OI5pVv6JVTpFQqpcMslpB
         o9ekFfu2EMXHabngZTUobHTIg85LBTvv9j8zjAHuoGaK24d3mNeA2JMepdd10e4Alt2X
         UW0g==
X-Forwarded-Encrypted: i=1; AKwUvBwTMsW+JStCYvbwhtplURdzqupa++bhMYZmkDGJlQDACdhvq+oYBU0cRge88AKMMiM2dbhTyelBhuhtHb81j8V5@lists.infradead.org
X-Gm-Message-State: AFuF++k7ptOrCWhYKA3NgrApBbfJ2k84ot7joi4BSJ53bZrDvRKJ2dbi
	u2jLOfagphQnj2E0Y6unF92gil12ozCW9YEb1dL7YDkiFsY/3HUvITLj
X-Gm-Gg: AYBFou2dxlbQWJqMGmXctqoc28gvFnVzksDRLs1PhwG7f7H3kAS0e3B1DIie7DCvkc0
	ubBgu5rpxVmLUq/LE+Cijp0/fJMzgTnjdz4wnmRimWhkz277xBw6TPO9FfMPI6t+b83UEiU7XKJ
	ASwUS0/YLwtOmG0HPIl8EI61CLmCsU7PvNz4UhsQegxktqHTxpYKzydpHjxnlqm+8Xnu56XH1fp
	1LXsJ2TonEkJTSswVa2zKGuGanrGrxunsCWa7R7FJG8w/ODoGJJj3dkQwCmyK+eiCxQFevyt8eN
	noM+8G2HNJjgPvXZcqaWWMdqfN9CCCFOm3ybJJs5/nVjyN96S3h/WQ9n1eXvJxP7AonhTEjbqdZ
	H9MDfmJSYYzIB0p8EUSAS7W3xu9XzE6euB8fIA9pLD6rgye+QTNu4Bf0XIQqCtF3zEcfR6dJUkK
	ZaXkDEfOMBlQgXNXVmHKArwGaBgI4BNExeXvX0o43YsZCL4wTqjzXGqBi1h4vmdWD30W/ztoaL1
	hUSRAGs7PWMQ+OjwH+OBpI+Jr3Jp2juYY09d2f6eHlyp4BXFpdlo9UOsrpKtPdhP0aKHXiqA0/n
	nvS5s/MDnWaWI8P+X8CJIMtcEMHuljPwOYN2AA==
X-Received: by 2002:a05:6a00:440f:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-861684928fcmr27242447b3a.16.1788742775744;
        Sun, 06 Sep 2026 17:59:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861527382f0sm3628242b3a.24.2026.09.06.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:59:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Sun,  6 Sep 2026 17:59:33 -0700
Message-ID: <20260907005933.230766-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_175936_887412_10452520 
X-CRM114-Status: GOOD (  14.84  )
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

The PCA9655s on the ClearFog and Helios4 boards are
register-compatible with the pca9555, and the gpio-pca953x driver has
matched "onnn,pca9655" in its OF match table since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655").  OF matching is tried before the legacy I2C ID-table
matching that the old comment alluded to, so the restriction no longer
applies.  List the real part and drop the stale comment.

The I2C client is now named "pca9655" instead of "pca9555", but the
expander is otherwise identical.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase so it applies
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index f8a06ae4a3c9..4a61e9d1a2c0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -131,12 +131,7 @@ &i2c0 {
 	 * 15-SFP_MOD_DEF0
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655", "nxp,pca9555";
-		 * but you can't do this because of the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 39b2d4fa742c..bf6d70e2078b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -160,14 +160,7 @@ i2c@11000 {
 				 *  6-USB3 power
 				 */
 				expander0: gpio-expander@20 {
-					/*
-					 * This is how it should be:
-					 * compatible = "onnn,pca9655",
-					 *	 "nxp,pca9555";
-					 * but you can't do this because of
-					 * the way I2C works.
-					 */
-					compatible = "nxp,pca9555";
+					compatible = "onnn,pca9655";
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
-- 
2.55.0


