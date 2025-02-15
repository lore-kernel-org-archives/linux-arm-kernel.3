Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1849C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phIRsO6XqHmxqB6De8SrY40EqRx+FKKQPhr8nHe0VsA=; b=mw3Jb/XA3v/fqyCDPAwr56SL6y
	ZIh+TlqP0aqgOuGAmBBS+O58wye2rpp6sgbt7T5f1kNYTteOSO+mXhtt3DZJW27T15tqDftS/RTOL
	TNLgE/fHy/nuVuEZUXz8xDOwJj/+EIxmGuk5iAPM79awqUvd1G1CHhypEImJ0oeQlYbW2TsDVo47L
	I9Ze5kVJmRC5AicHK5aj26a7lENi22ud8gOdJHG9+nV9k+wjXLDsm98q36Z4jfq6OQQJxC2ECUxyu
	zrXZN91SVqO5tRgR0pwqzoSlAl25TTnGrz5nUzy5am1c3PZ9p2KnfpgNIAsHaWd6dB7A7uRTcBByw
	gluj6XFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHS7-000000004EJ-3S0V;
	Sat, 15 Feb 2025 12:39:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHNt-000000003lc-0Quy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 12:35:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4396794c044so17597795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622899; x=1740227699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phIRsO6XqHmxqB6De8SrY40EqRx+FKKQPhr8nHe0VsA=;
        b=AYbIx4STqKnJJ1lWF3xiXDDBKWMrc8jt0J4MdtNI12JlU+66J2RtiihtvkJmSqnWC8
         StEJFtV7GKgLYJDP6zZMdHG+jyOv6RT/bt5E2ei+LIYIHHWiZA9GiRC0UC1umdAi0TmJ
         oJ7IdH0QhqVm+Wd2Sziomxe0CuACxV3rT2ZQBpChvF2pSi+J+Ackl0/C3LtjWd6hji+K
         aed4ewUN7OvmIhKq8jHSRroIFUGUWMu4yRSMycf2DcoCzmicNonifJqY5ecxK/DI9TMi
         juG4z9XGXcYjX+GEAjw1NsZYLboJyji9YwYceXGf60F7IZ8wG2DEpM5YwVavy1dy9/zG
         Ramg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622899; x=1740227699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phIRsO6XqHmxqB6De8SrY40EqRx+FKKQPhr8nHe0VsA=;
        b=J14Xzj3EoWZ4kYIuSWTxqa2mEBCZNb1bYB3SsU7UxrCMIAEPx7UlMIbIdIk5mR+d9z
         AqByAUoSfrl6QeO2SZp2EBKTY/Z9wPSWHzvO+F0ic++xk5L4CsvufhJJTzZxqOyLy0kh
         uOjJfXBydDqS1m/3ZMR5aH1hdmTv8TQypkUgxYCrPtrHy1OAoKBsfJ31QlFjeHq9vgtQ
         rZLM8bfQS2CLUNo0YS7G847NMND744N1u13s031EOoIrrCfbcY08rqHvbNNP2tfc7DNM
         HGi15Er7ykN7msnl9rrVW/UNQDRIxhGddmTLE4iuk0yhFxwpRSKVx/fjqq09TD/9GXtP
         FBWA==
X-Forwarded-Encrypted: i=1; AJvYcCVS/EzL2nRAt6RcuigrFNpqfOgnhOQe0ff84V09aJAm2Q0wDcfVLm/a6XNVGr/UjUA1yjOn7yh6bqpIJWLdePY6@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzyHqRZ0MqGG4m8Ww9T77eX3ntkONRx6yko8QCDUIpYqYPK8F
	v4nU11vOkb9GHOPiWWLuJ5viETOfVBjMpS4Q6i3Rt3yH4fMIhbhk
X-Gm-Gg: ASbGncvX/cgrmCUy/4+ubNlWFsTRxYp9A0JdRNn1Qj3/TtAemD4zRI6G7tQ94kcOlud
	brj+QlXcUQHM0cKD+gJrt9GY4Dgz0FsLCvWPB7zoqy2ngmoEzE/oxdVk8FxnJqRjCbbD74J81gA
	7wImLH2Zauz8QrKlIwjZj0sdS72mI7Z3FOoE0SUE90gVlqrW6dmCb6EUnWupRc/53R9/Wj/44zh
	NKRcLeQgNdTWnINhNJGSmUww4xAjqTPPJkkm+FQZz5H6uKZU8Akxx2Z0jDeV2AW7w8WZL8QzEDl
	x2slJdZIPOiBAOR4c8+GGqKYdmt8B4yUMJRqh70W5iqvMEXlnkwFVf2XYrBriGVlNHU=
X-Google-Smtp-Source: AGHT+IGSb0XPuCNo95g3E2dUCou2RLzKhqML/59MR9mGZKeN7VlnjsSXdwvSBFqgChgUtO9nZ6LgGA==
X-Received: by 2002:a05:600c:510e:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4396e6c4f57mr36871275e9.13.1739622899390;
        Sat, 15 Feb 2025 04:34:59 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:58 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 15 Feb 2025 14:34:53 +0200
Message-ID: <20250215123453.163434-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_043501_142049_ADD01A3B 
X-CRM114-Status: GOOD (  11.91  )
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

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae..aa22265c7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -177,6 +183,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0


