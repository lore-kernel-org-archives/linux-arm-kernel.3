Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB84C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jXme2m9WwXUPYkqUyJg8c9Omz6UIdvrbWwmPeVySRw=; b=E6ofN+MwNQoTUHY8IMnf4WPMJM
	M9I1U6HmV9DMzMBLDTqetJGrqb/wgDbvjnE9/nfHqklTABKU8i0eUUfUoDx3LIXwS+/pO3kqeVYCa
	AIPMqZwP6X9jIphbsmTOQAWj0x7XYo8MbYSPqZ2kvgWFG7NDf+sBLIN7AxtVFSH/Q8v2jYps1M+Uo
	sG+TN4gbBQJwGadGDbZUYpdggD2UgDQ9d4F41E25MjNiqZr3qRfXlS+SxBluQdn9z8llKRCiJbwsI
	jqPPDZ+4MO479847CSwbuL2d0qAcE0hBZC8fxRkTYkJqQuAoXR92LXf8zZ1xFq/mZczCWKmFgv4gG
	2pITPOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCyf-00000002KnA-0RSI;
	Wed, 30 Jul 2025 20:00:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrJ-00000002JZU-1eYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b7746135acso109150f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905184; x=1754509984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jXme2m9WwXUPYkqUyJg8c9Omz6UIdvrbWwmPeVySRw=;
        b=U1HfybI+VWDBemu87K+CYkw/KBtBG2qOXzZ5R8IjeTeck6HAG7hUyIZrAuQjLDCCjM
         oP0LXp8loBVXWn6wiRq5w/ScHb2o1+UtOMNcDOzwMejcGgshsfaKttL+aCyQUyQQbIFW
         avEdIzaF8miv9HlC1WnTQ2QxFbYKDoodmt1Sf3HBud3lIF6wm1sJMZgBk75S7l45mdVw
         6r/l65o9VCTdu4j4b9VdLne2MJ83IliVi9aEqboYAE2EaEarJx04IzG+KSLxaYKsBJ3y
         XBiVafsIOxyU2EeuHrjumJ5cHPV2g7znizRups06tz2ttyXFMJGp6yH+T4pEBSDKg0lO
         IEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905184; x=1754509984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jXme2m9WwXUPYkqUyJg8c9Omz6UIdvrbWwmPeVySRw=;
        b=Lcpnn8WwufMAJ23jUSNmeNsHm6wDbLU7Za34g1MHaQ3VNYktFpTrc4YdIILKYSuFpp
         lbGbpBDrPdnYq9xysTYN9QsoozNfTQi1ZSsKcL3LjeOmV3c/ngSlp4KiUkjj0+s8a5JA
         XOKVXJZnncCJbmgM4Bn/fDF5YpXUs7c/MY7TgbFs9BZFHM8NfEI6YbK6Hh/cuFqENMXW
         ECel0SZYg5xkGurHIMokr7DX/fwSFEdVWamblORHLF2fCGKmHNt0xYmbC9wuK7an2xsL
         pYikyQ2ELea33suJti+ZQ7oINV6G+BkjyM5iDEU+oT0ZvD4b1oUvvg/6qCF/awhspvH2
         pYxw==
X-Forwarded-Encrypted: i=1; AJvYcCWtBh8gspoNTVhlnG8db2OusvW7xHnVneKWN9D0G/eVfo8BcKzd37BdhKrq1GxTtTPGEJVdD5xODbbyYlED5fac@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9M2CPBMojiJ5BTUdqKzh0n2pjOhu4zlxkGqZA0GrWO6p0xPDA
	joJK5N+343RWuNiwVZazoBmBI5tchGEFqPkEg7WRl+8dvWdDZyO3HE/zpUrOK2f/rTU=
X-Gm-Gg: ASbGnctfR8nT2vDTxsmjbO6f1TlwgA2KitvhYMzA3sDjDiOx+FhRYbx/KoGvPRPcay0
	jpdFOJtRNhmV95iu4s1l7m1pqRuaRxs/L/yjR5wHH3obj6lzUfilJGUfsEu5ar/GmgwFRV/IIhn
	p5n5ILEAJD2GBxTiV297426wwnMlGpv7B0lpsbRLD63CkeOKtsQelg0jFtC4kXD3PMVO5g+ZwFU
	f+WLs6laQhVz5oETkB063TMufPJXML5uvtEJkPJ403bsW1GzBeeMo7OtKY24QWJbx+zxLHty4/W
	Rw7yKwNeRp3ngxmtjJd3zyZuezXizU257ec0+tD05Trl1NZ1fUxutFLu12u3zeAbBwyMA4j2d4i
	lyCTSZBpTVS65ErEKEjUtwEUMIgz2BuN9rKHpQJO6idWw8So5
X-Google-Smtp-Source: AGHT+IFtSLxvTO7Zv8ZiaAd380UqEdsX3oGvM4YuKiKowd0BLbRk/TMTPqH8Tyy/IqqXhQ9v3ow3cw==
X-Received: by 2002:a05:6000:144c:b0:3b7:9a5f:103f with SMTP id ffacd0b85a97d-3b79a5f10b2mr1077841f8f.4.1753905183837;
        Wed, 30 Jul 2025 12:53:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
Date: Wed, 30 Jul 2025 21:50:15 +0200
Message-ID: <20250730195022.449894-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125305_433015_015244C8 
X-CRM114-Status: GOOD (  11.11  )
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

Enable the timers STM0 -> STM3 on the s32g274-rd2

The platform has 4 CPUs and the Linux STM timer driver is per
CPU. Enable 4 timers which will be used, other timers are useless for
the Linux kernel and there is no benefit to enable them.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index b5ba51696f43..505776d19151 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -40,6 +40,22 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0


