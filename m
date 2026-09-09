Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89698C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=; b=DVEH9dbakanepp1BIW/ZdmrLlk
	eAcphnB0zhsfqUOqhlmqcH7NwIBhTU282uckr6A0KdfJkoXQ4SO1IXnXSmGBRzF/DMf2dt+eFOj/2
	aP5WVEM05A+qxLOCbL9I4KiPeEKVFIyxKKlJgTb3V+bAM60tUuLKTTVbFzrMGUSsVhkH8XsBP1tGV
	8EeeheD3RsAlZkJ5WJBJsGtVXmlkJ3TCqcjRRnmOBK4Gzrw9HfTF+PFiPTyINruwCCyDt+GIdI7Ce
	IDU37ypYOU9o+JJmkm+MrZb/oAlCE9S2+nRpIQAev1TvqJWKP6FLXor8GZ2kzvTx7Gw4ZSap7XNsl
	Pn4i4b1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3I-0000000Bv60-2zsj;
	Wed, 09 Sep 2026 14:13:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3F-0000000Bv3E-1NFz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=; b=XiiL5+bbchM3/6zP7jInnG1ChU
	P2inu33wfjL1Xmky9/mmL0n2KPWSoBYkr5rESMwa/PhCkbLx3RFY3KQpR1LynACuOBnefRsaBNLw6
	1JKKKKiYYYR/XWuveREB0R1Nr2hxUk98+XAeStWI9Ftz1kN577+aKlEaxX8+26NII2TMii11fXm69
	Z6EiEAMbYjW7JBr06bgW3CM2dz9oOiEmFEHuU7WXKYZVLBTNfg57WIp7XGUt/AXAXgYFl78sw+jl1
	CG91tkrgPgT1EkzLG2guUWHOLdPe4wQtXB/zlf03GekuLNWoUPLbkjjkyt9Wy1cEypUXAgwTDQDu+
	+N8V5qIA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4J3B-00000001Hdv-2u1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:13:24 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48449f62b93so844684f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963200; x=1789568000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=;
        b=Ur3S6uuxJVVDz4lzZlFHwqImyFJH6qc671pv15hhVplQrBAkYF6Pr9OHqtfK9yFDLZ
         M8sI51VGYmKVh5XBfO3ECtK4GY2W6YXUbbw7cAAXlDKQCTk3XpzzBcnXZBSlTn4eGH68
         fArrec9kDY/lDYtcKokmQtKYaUHPebrrMY36SOrwCKtczidlKkJdBhYYTm+avMBVqg83
         BMVAindbseTHWsdKmJ+n/QM3J7/10P6Ib9dvv5Y+yXIqnYohC5rbaBAhZuhVaonhHq/d
         5cQA0wGqs23k+Q/5Mc1ILW+eqtrFwRIHRuJ+G2lwqkIatKILiG93OS2UQ1TNE/S/uHcj
         LR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963200; x=1789568000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=;
        b=LmCCTHhbDthx/WupZs/8tEcabzDWOzdyG9RxyejSpahaSDkq0rrr80RnCsjQr2X/lf
         UxGSNfJoaG5h6TFxNj6E7NS+s3gk2oRT1vG4DitFUgzuc/JjzL4KrciMlJNfgThaNrN3
         c41zI9hmCtKTYaNq2nV7RRWjE2T3WEWFnYnf4L0lruTKxEs3X2j9DPVe5jAx7HkJw4H9
         c/JCRzK12fOcwMBQXTCZIIGYZ4AV2IqJTT+MAvR9rz9T7YiTGAkA0MOW1VkJizvAEIzN
         csyULeSlgH0zGr7un2ApTECHo2jwVAL4c9s4+MwHqlgnKKX/7WjP96+h/MxDBFTW5Pcj
         W7Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxkJVknUeY1F2so+OZGTVDqJ8mvJcOr2Y2tYb7tqjISuB0rMbo/+SxIKxRSBd0GTaE+XM0HArnLCb/ieUmy6V1l@lists.infradead.org
X-Gm-Message-State: AFuF++lkiR888lAZlsUWDNkLP+D1L525kvJ/bIf6NO4NGxcw/oo7u9A8
	CB8JlInVyemtpNDgLA42x4O0A4T3izp6fWBgmYdZkWQwPvM2UiXVE9Z6
X-Gm-Gg: AYBFou16D7Y9FRq8q9qTQGN81rsa+rlWWuiC7kQRykNfm9iU7QPVpGHAPqqVr/ZCB1m
	c5lmkcy2RXKuLikVChlXEwtK3X4jbUMR/uENBM1db6gOEEjlUERpxYyEzLWaYNyAZd4FoTooAc0
	WE+MDPrwV/aG8Q63vRM1Fy1vh1sWCFQWOordKor+N8xQA0Mg25E4YN5+915DEXozpngYQKOq+jl
	5VfoZX4wBirWpbFq8WsFsGTMSwHe2d0VkpheolOPzpud7H2TTPwUXvN0iqwFf0V3QTbK7jE/c4h
	AQGGY8rcskwb/hzEh9hMe39+gz0G7Hv5ZhCVxCcm+CJCmEbdjuo09bIg/cHfrXsVM9DDc63JMEw
	RQYP8q5naYjXjDJ0sMIjFD7xO9VzAOlxOlpjCYkAc+lL97ivcpo+e/k9Qk533gzs4xMgiG8NRPa
	075pL4o3qJlbwrKizhkDZD02IUUhZNVRo9rcHMF3rPYvnMtCTmE7zEwuJffbofNoIZh8Saebmla
	DHMGjLR003R7gixa2SytXvOmBSJ6+7rbsp3tpdJ6we5aw==
X-Received: by 2002:adf:e944:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-485a242f46cmr12481535f8f.16.1788963199968;
        Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 3/3] arm64: dts: broadcom: Add RTC to Raspberry Pi 5 B
Date: Wed,  9 Sep 2026 16:13:00 +0200
Message-ID: <20260909141300.1368790-4-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141300.1368790-1-sander.speetjens@gmail.com>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_151321_828560_C80461E1 
X-CRM114-Status: GOOD (  11.68  )
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

The Raspberry Pi 5 contains a RTC on a custom DA9091 PMIC that is accesed trought the firware mailbox.
This so we have a battery backed RTC, so the OS does not need network to get the time.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..5a82dd585f32 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -102,6 +102,13 @@ wl_on_reg: wl-on-reg {
 		startup-delay-us = <150000>;
 		enable-active-high;
 	};
+
+	rpi_rtc: rpi-rtc {
+		compatible = "raspberrypi,rpi-rtc";
+		firmware = <&firmware>;
+		status = "okay";
+		trickle-charge-microvolt = <0>;
+	};
 };
 
 &pinctrl {
-- 
2.55.0


