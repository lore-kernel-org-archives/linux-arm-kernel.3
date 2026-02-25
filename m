Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DCEFD45FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=; b=z5G0lMbrEBcMhEOvkoM8I19/cG
	UPsn6lgVZ3SCqiHf6ASbOG3KnwHX/2dCcP/Pw/ta2HrnVo6alNfmRqhtXP56u6CawTuJyQb8HXvvN
	Anb0uzcT9PDRXAcUheCYjczPC4tnxp4HiGYAQoA4ZJFbv+NXFLFv49gPd41/j8G+cfKIlH8n5CTb2
	qrcZTJ1Hlccd8EXHWY2/mpJkliSsPcojcPE3PHXT/IlRVy1VH74l01khkIIGHDyXr+qCMjfzTh59c
	EYuwnD77iI259W9p1e1XNpFg1Uy3BOVz7JqfHFwkQzwhYcrkDjW39V83oZC9n7eu3cB7x6WXMgq8d
	sf0SEfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzy-000000052Rz-1mPH;
	Wed, 25 Feb 2026 23:08:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzs-000000052Q2-2MVT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 23:08:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ab232cc803so780275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 15:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772060928; x=1772665728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=;
        b=kEUQvQxkWbPfcmlbfZUbqLW6IxsHLQVr7SCFaKPQNIH54PSyBW9SIGtMrKnGQ+sMsB
         Ugt98C7gZhkcjqYqwuhY+Kp/SWuAtqB9EfZRbZ2q9tPTZSKAeLobscxpk8yGafQ3V+2u
         CUbBSwBgbC/rh1+l/nIaVbmHH37rMPmI0+Wo6L62qdLbz3V1aNKboPJBu6F4xSB6/tYr
         sW/jaP5HIC2wdBHGVHMhxnbNBW59fM1sHt1oCBwrZFRTWGIAEYgNGMcqWrfwjejsu2eo
         3ghigYVVr17c2FNAq0G0B1lSz+sUW+0fXArxWv2rygu4ABTbnPaswPet+GBrPhAICC4t
         3sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060928; x=1772665728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=;
        b=N3BHePXpZEOEJ52NbdGwXeI9rX3OyHzB4asLz5seUaf0Ut+/HSt0QMMQDL1FZFVdqg
         WZMIHf1lOFXhluKiQ8Hmp2+RtDtz7VEvXwYhWp390L9b6cB53JnOgaJJyyWqonl4ItLn
         VgSqPm+KhttLN8eN/7/2JUtux1mVby5O3vz1IgDKegsdXIenYS0KmagkdIwX6NWK9bks
         Twi9zeWbVqGe1VHKWUGW52I3LwnW7dlqQlHqfKf/zX3jPRQDEnhy3sSDiOKf/WqHozmZ
         NJc/8qEs+vIf7FKNkxNq763EUyVWeMQJU4maS45AiKnVqD1sbnK75CwJ/E0DixtqNalY
         Ujcg==
X-Forwarded-Encrypted: i=1; AJvYcCVit+tcjxZADhciUyjl9A3/uu3ad6+1hgfrZ1RcbVrsHf5nUj/tF4sY0i607mHYd9iHK9FgEjQd0GYG6m6DDh/K@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvs+blux71fuqpnhkMweNSJfxhVIDvpSkfmf7YJRSWOgpMNNvG
	qniXqRcRl/LVT51oY+OqLFxOh8wfiSSJ8iQokMucfPGV9TJa75Yw28S7
X-Gm-Gg: ATEYQzxLqbn71vu0UPKaIKoodGBiSB/y6YBJf+tHHQxK0U4SfsgD+hg9aRpnxXfE8Ru
	jjafc/Iu9Yh2Hxqm22YS4kgQg9/0CnOlY41TCmTWZC/79pT6Qg/d40YcI3vu1vd9LUHJLthVIys
	pOxY4IZgCS37SHOhj0hINdhT4KpNXn4r5FGeTeDOPCPE+oAqfT9ZWaFLYBkUBXAHJ1e6EGSlW4A
	mHn0nVTX88eSkU/ZfqQBg99dv2YG1M19MTwJ/u80wbGHDv0FdoNr6ANhjAkZ/lHW7sDulN+mpdr
	EyTvoB4hNDkwUlfs2PHI9b0gHDp5AuDL/vtI132nceurAcWxwhsdd3TtXlpNiT2S/h91BKc+Qvw
	z6vm7gAhIaRald+UN6j4GND+D8JwAl2qUHY+ENJMseW4hLXjtGDp18/0aSZ3/DrPYKAevwuiS7x
	nISGOY42JPwwPN7Cjx5mWuY2Yato6314X0XU+X288BtYCMkID/q8sAow==
X-Received: by 2002:a17:902:d2d2:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2ade99bd62bmr22422605ad.15.1772060927685;
        Wed, 25 Feb 2026 15:08:47 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm3378285ad.19.2026.02.25.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:08:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/4] ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
Date: Wed, 25 Feb 2026 15:08:24 -0800
Message-ID: <20260225230827.21715-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225230827.21715-1-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150848_601749_EC094225 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

The MAC address from the stock firmare is offset by 1. Define it
properly to avoid having to override it in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 2ba5adf2b7e7..7c6ad7787945 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -25,6 +25,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -70,6 +74,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.53.0


