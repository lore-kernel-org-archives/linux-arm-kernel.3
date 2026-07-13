Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94cpyEMhcdSe2ohP7oq7+bzKPvYKsok5hBaiL3mdPJY=; b=fdB0LPgHK7ykgnE7vacIz6+EAn
	iSe1WF50S8kLkX8p/dorJmSyNvNW3p8yOVAMKQXQJd/84DSFXtG6UZHz1z1XBIjgGvj8rckp6Xnoy
	piYD6qMlpv0ZK3OAo94je1Ktdlzl1OCbPDUvMZIHE2eMON8hTjDsc3XN29F1WD+aS+HD7c/4qnSjH
	xqQ4hqqUbJFuXcunvb1v1VU8NgbHiuRjGxcVHpN1BNIt507QkOy/AWxLJCuJblX8+/sPSELzM6b4n
	KWxM2I91Qmq2YswyByOaTr+dj9FsI6sOSqH9UArQlC94KyoqSb37R1jApzPePcqFC/qYHUWpHT/HQ
	4DFg+Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEP0-00000008x16-43k6;
	Mon, 13 Jul 2026 11:00:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOk-00000008wm1-0qlk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1666685b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940429; x=1784545229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94cpyEMhcdSe2ohP7oq7+bzKPvYKsok5hBaiL3mdPJY=;
        b=X+/4CvtmJvYu1+VfA4YMdGE5eHE06oebSQaovT9u/8sQcfwc+i3EArq+WmqhQw+b9r
         RJAyZ/hwAHegBGf/ieC2MzEaRiBnZWWJrshtX7fyiC+afxmlFkU0aKFQgfKSci9uN4+R
         Ij1CiQ9u9LAJr4J/L8DeSsYWvaP85oomUEa48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940429; x=1784545229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=94cpyEMhcdSe2ohP7oq7+bzKPvYKsok5hBaiL3mdPJY=;
        b=iP/lwJbrDAKBKaxzdmEHhsuuwNU+kpiDTlsi5To5ARhrpvHOPCIWz+rZ5+SQ+MjlyQ
         2y4gp5Km0pAAk1DNDJMfT9Nlcx4hYUZk23GgP3GDZd1tpEpOOziq5Ue8a1RiIuKN0oum
         8OIn8Zu9I+C/hfQRsH+Dravd6rZTWXJvN0uwcyhbZrwBeFJtbmxnKFn4iR4PJTTRcAA+
         vhYKHHuk5yojSwjunqpHperlWxT7Xj6+hc7dDVtGYLQJjQZ47Qe9PAoTxITDAXVacYqq
         BljgssQYzLzf3l7xxLjhBfjT2yeXIZaGVQAnXGcCVPGMwPmI+yOcC9kz0LZyQtZgdErt
         Iuuw==
X-Gm-Message-State: AOJu0Yy6n98jfYOWUnpQaxuzIqjiN49quETkwIGy1NN+yY2ePquE3Uzh
	Xa8Uxgn//2Z2I+NGTRewN97lrOKLQVKPj/kUkUq5FUNZwWHTjwBtOUlvrhGT40eKIhAbehzoPqy
	oAi7y
X-Gm-Gg: AfdE7ck4+LVERRq8vot9FLFYhwlgJCiTvEGL0QpXl1i5Lu9t48Jxbn8OcGzDp6Imviv
	t1JjEP0sRRsnnFEyIRB2eGX4Je5AJZmoamprZmEuY3hJOa3vYSu9mHSVOcpdLHi9wtpKPoaU+by
	14YHh6xXkBeoQbbmVr15yPWtUkWu//eJ/Yi7C7hdovwVyFg5reHnVx65L5fiPr2QhFZZ3wkvtac
	/9WT9wX+OWlRyu6jpzykSSlBJGikWSjxwtAUNqbV1OgjEzdIH+n0ctXJeOwdCfAgTwEVZd5RawH
	F3BRPGOsb90nvxv47SIExIbzjkSoT9ZQpcZ9eL1oO1l7pgjAHv2bOnADRAe0uv2+MgtfeCqBtTR
	q3Rdq0Auzce9KkM7B3bjCbZ4MuX1u+hzh3LpBcDarg3leY4X8qU0VhDYRsDsFQe4FPCqOA/LBGd
	msDWObYNLnAtPY75Pjt6M4K/mV8Q==
X-Received: by 2002:a05:6a00:a117:b0:848:2f84:735 with SMTP id d2e1a72fcca58-8488990b6fdmr7963546b3a.72.1783940429150;
        Mon, 13 Jul 2026 04:00:29 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:28 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 8/8] ARM: dts: mstar: ssd201htv2: Add SD card supply regulator
Date: Mon, 13 Jul 2026 19:59:50 +0900
Message-ID: <20260713105950.1346962-9-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040030_274935_0D2FDD03 
X-CRM114-Status: GOOD (  10.90  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add the fixed regulator that supplies the SD card slot on the ssd201htv2.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
index 5d81641414a2..9f0ce16a0874 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "SSD201_HT_V2";
 	compatible = "honestar,ssd201htv2", "mstar,infinity2m";
@@ -18,6 +20,14 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_sd_vdd: regulator-sd-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "sd_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &pm_uart {
-- 
2.53.0


