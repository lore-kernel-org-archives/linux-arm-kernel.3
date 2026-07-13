Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C5AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ5iHgXe68coNKsyjUEJY/KvBzACNRTOom6/ZK/yLLM=; b=NQW2taqrLo8u7YHijQ23O2P2I/
	kr4qe083VGFkLkxLbFVl7Hssryp2HoKNDe57QRH07auHLQL+AlsQlDO/a4WBaj7sVKZWvybzkaG37
	fq5ByoLbSo7a4CcdIZ9JFXw/TzQEOJuBJ7tCvZJLIp5AP1RyhzTtmV/3Vuxlg4d9mdGpkFMOrU/IE
	oZl40LPJ486u53Ncm1Ms3tSSCvgv4PR1RpDtSx3b/tkM8hRd5rSH9AKlcAupQvJKzPCmtjuQB6PIM
	Cpsqr8nHeScyMdcTSTBulv+vEB2W4UjZq9SEtnCu7awUb7CQCFI8zFok+6xd5X5oGqBp6dL48R7Zk
	+kOv6i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOg-00000008wiq-0axX;
	Mon, 13 Jul 2026 11:00:26 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOZ-00000008wea-1VlL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8454160043aso2886419b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940418; x=1784545218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ5iHgXe68coNKsyjUEJY/KvBzACNRTOom6/ZK/yLLM=;
        b=lds+ReexuRcDqaGgseBJQmH1nKX2HXGmATFI3q4p3o/A7m+y/b00/YQVc+MEavHH47
         NggScpUG/zrq6foysfrqkVrMvj1uGfF1OpDWXBRpamiiVLi7FmSM2OL8YmZyer+PM0SC
         9BuPdQmsEn9rXBj/ksscuoIaCWa0SynmKZYL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940418; x=1784545218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ5iHgXe68coNKsyjUEJY/KvBzACNRTOom6/ZK/yLLM=;
        b=B+KTUS79DjNDn8f92+JkLN9knJXm+193IkfiDMzASgxgWqzF0f1Eg4k4dc/8Yo9hP7
         NdNlFNHKuRSKbfBYaNjJRLxscwsN56TNm8apLgdzVQqiaYfg4Fzm0OHsCKKwtEs1dU+Q
         9qOKUIQaYe/AdU3Gli+VeKGltYdDcVIrxTmUavUHOMcwZshIwby/3qURT4IA8tOj+9i6
         6j7HOUzCds0ogq0dX37qTTohngaXGNxV6mmcfdYe1Qgzj0mRslEVDPdN/Ff/YbfabS84
         ef40YXR373uJwVQsFVnjPVZFhgKe0ZwJVjXQ/NmzZ8OaoPtL6s7gv9iOn1e9AQ+5S4ZR
         ng+A==
X-Gm-Message-State: AOJu0YyZMvYVqKrKZMaUpAOdQ8ND7Wg0kV+np6MaX6oVQxCL6ckj8KDY
	BDgkXU/Q6dSC+A1xZyNXxUmrVzxCMvLms3AO1uv6GHt9j+TaSd1Y5yAs29/TbwtMfvgKgTRXclZ
	SullE
X-Gm-Gg: AfdE7cmHBuH7VGr/BMD3nxsHZyO/0caNZCh4uUKRSsaMM1cUYUxPGWy0RAjOXvWw+xP
	FzE3FwS5+r/nxXy2WTEpxOLQQTCwpKAAwsltqT5TvPkaNUHL9kV/Q9NdyUX85mC7vRL6c0CHfBY
	FWmJ7asu7EiIhk8rNofQJcpX+/ya7J4X+h30AsKddCdplsuRdojrtg8GDtbXks5L1fojBl0bimr
	QiSSByZt7KjyB+e9AjU05bDb0U9KnRC6sPaQhKmSO64BHeDUguHZjVOR0t/nEeHrva+6vrl/CgR
	QwI/sRLZJOsJp7vmsWeIYsO2rDetWF0Tv6uYJYuk1w/JA6cxZIRpgvKaOLrw4RYYBgpOSguDdkH
	8Dk8+lONJA3+SSpAl7njkA1GocRG/snKaFF06EhV9mp0UoOZ07I66M2F+yf4qb20FCNJvpiBwo7
	mtRPFT1bLg0uiRAzwBEHjZrB9LtijEf5ay+xz6nyXmGogs2aI=
X-Received: by 2002:a05:6a00:b8a:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-8488965bcebmr7867993b3a.27.1783940418459;
        Mon, 13 Jul 2026 04:00:18 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:17 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/8] ARM: dts: mstar: unitv2: Add button
Date: Mon, 13 Jul 2026 19:59:45 +0900
Message-ID: <20260713105950.1346962-4-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040019_398707_AFE54035 
X-CRM114-Status: GOOD (  11.37  )
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

Add the front panel button as a polled gpio-keys device reporting
BTN_0.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-unitv2.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index 5e79819a070a..b5a282cd1a67 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -8,6 +8,7 @@
 #include "mstar-infinity2m-ssd202d.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -40,6 +41,17 @@ led-1 {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		button {
+			label = "button";
+			gpios = <&gpio SSD20XD_GPIO_GPIO2 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_0>;
+		};
+	};
+
 	reg_vcc_core: regulator-vcc-core {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_core";
-- 
2.53.0


