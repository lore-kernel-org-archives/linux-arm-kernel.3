Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BCFFD0060
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5okoGK4HOYT70Ij2zZZqq2yIlW9aGSZvFtA+KNZ5d8Q=; b=GfUtdg6DPR2opW28BBeSsYHI8g
	XVWpJqOSh9KV4wlmnPC4nV6YRyGaPxQhSY8wS+y7Y6+W1qzCko4NObtFdKNb8huZiz8Ak92V9CCHj
	BTpxZTRhT3OPCNzhxKRD2MHijdCks7RF8JvzSc3Bw67yYZKvTUVFZzxwOolhO9t1HYgxg4bX7L/Q6
	+6TjpNCcrIK6BZX5NipKzp0QDiPe+dl91AgoEn8F793/W8d0q7in23aSSPPvyOVh+pwrlJCG8oIR5
	eVuTwoHGyKVbxTm1t+HOuTsznaxGdrCaYjwtzhj7AP1cHtg/QeiNJlwPUJOhRHcoJtMrhVbiQdpqG
	EHCOMosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwg7d-0000000B7QL-3DeY;
	Sun, 01 Mar 2026 12:42:09 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwg7b-0000000B7Pf-2h5Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 12:42:08 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-94aca174532so988042241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 04:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772368925; x=1772973725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5okoGK4HOYT70Ij2zZZqq2yIlW9aGSZvFtA+KNZ5d8Q=;
        b=NktF523bMxQJaVYE6WWFHrq6OPesureXjfpLgqmtTT2TmEDmojZbFWin5smveTBYmF
         VHqSyGDWbANn730q1Kzb8c0ubVmWMUaAMjY37Qc5NoTiwiPxefmzIfn64fQ5UTNUftqt
         LjhBGMTAUciLfMHc0C5E8FJVq2U2E3W85fSHFHggmSDSfEQjyZY2AomEmT7u0OdyTy5p
         qpFGEuhy9HejvIIPwj3gBKaXY8ATIomrDcCFk+ajr0I5dSm9rTZFWXw9VvclnKtUq21r
         pVPsxSGVTGHBhYHQlbbALDXFekg6wXa0eUBBfmq5DqvInjP3yYWwPTLdhh9+VeiZ1euz
         0Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772368925; x=1772973725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5okoGK4HOYT70Ij2zZZqq2yIlW9aGSZvFtA+KNZ5d8Q=;
        b=FuXHDk/cfLseB2HxM0dWi9+BTFU1SCO2xZyOo5lmOepyyn5NNqHNb1Qg5xkkXwSnSY
         gNSpvZSuzuuA8dcb8TvTaifIQbIHu+wm8xQtDaHG9GaNA577TzeVRbYQs1XIqbD2YIzQ
         3tQjcM0W4SAYLlDsZI2uPC1dR0lpIZBnmC3xTe6lLngb8S9ihaCOAUDte388usIysU/J
         PxQmdwCoyBRfQLumEWBMGxG+HGk5myZCwg6qaqMWx/1rS8W4UVoK1HtKC3mnMLRfKp7o
         ya06yPSoWJ3d3kGL7+9W1IlFwfBDFbHCMgxF8Wb4YUCGpuFH2TeejBEpJOeF3z6ImHh2
         wjAg==
X-Forwarded-Encrypted: i=1; AJvYcCW13Vm4Am+3lH4G4QHuTOcs7plcuDevidUdaOcr49lyJFP4gA5JJsffpTBB9g++bpKg6bxUOXCSS2nk/pejoLYM@lists.infradead.org
X-Gm-Message-State: AOJu0Yze+eNb8jdwvGW5dk/taLcBYAczXXf+GHIWS2QoY4u9vBB05eeN
	dfYOeJ0B4zb/uUH8JxPk4/8C9H2gpb/KHjblYOPVkYEO6IBeEwPR5xaU
X-Gm-Gg: ATEYQzzqJn0wfP7XiBvIYEkwPzMd08MVuX/Q9B7ZyNdEBTJfYQ6V4ourJj7ryD6wNee
	4HeQltuAo+yaeA+ZGYV8P3s9zoYdB7Bsv4PBdmajtIQneYHiiuZNc69u8mhRPA7R5nHRO0LsdHF
	A9ikWYIWeOx/V8ucORET6y7AnPPp+Efe8hHDAvbA8v3if5aFyysTD/f1t4AvZfJoXeQSm74ZU5E
	Em1G2eCP7DiyrlENYBuKKTXymCE6j+3549MY7QT4fYoPItRNL/FDnJfeVZcZApsPlq8WWae6jQA
	6907UWOSLcR8FOhiFXtzK/5alD3lHNMmqXo/aif29n4ksmj8xVdqHgKho3HDlEeK9UL/bD+2zIn
	m7j8KzlwwMBfbDw+0zM2prFcaXuTicpWt0CJ/J8b2MAnRlMl8/SIXFU8hrJqhrGhbmVpHYTdaOS
	BXliXMIb5UfYeLUl9WopnbUMgq+YwfBzyiT/H//neIFHsdkuhMQ1gJWZpWOuIAjMVAppk=
X-Received: by 2002:a05:6102:418d:b0:5f5:6dc0:e50f with SMTP id ada2fe7eead31-5ff324b58f1mr3169537137.21.1772368925396;
        Sun, 01 Mar 2026 04:42:05 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:2168:1b6:3f93:373f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e845aabsm10495317137.7.2026.03.01.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 04:42:04 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
Date: Sun,  1 Mar 2026 09:41:56 -0300
Message-Id: <20260301124156.473862-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_044207_691282_B1C4F32E 
X-CRM114-Status: GOOD (  13.08  )
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

According to st,m41t80.yaml, the correct compatible for the RV4162 RTC
is "microcrystal,rv4162".

Fix it accordingly.

This fixes the following dt-schema warning:

rtc@68: failed to match any schema with compatible: ['rv4162']

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
index 10ce0554d4fc..a878a2632de0 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
@@ -94,7 +94,7 @@ adc@64 {
 	};
 
 	i2c_rtc: rtc@68 {
-		compatible = "rv4162";
+		compatible = "microcrystal,rv4162";
 		reg = <0x68>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c_rtc_int>;
-- 
2.34.1


