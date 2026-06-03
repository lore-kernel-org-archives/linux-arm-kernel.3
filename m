Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F75CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=; b=taD8uONeaCQmWEu7MikagRy3By
	fix4rWSFMvLeSYdUzY47ZPvWt6mnhDP6HrE6kHfmQrqcntxPrlhbcwyRpIaG0XSQLu63zwRGExzpA
	DyMmz/RdHDYWEruf5acWDijX2gq9DNTkK3LmKVOcZgb+dTiFuT6JEkmuDWo2MQrK3wu2Fi4SIPg/X
	bAGrK3OqNVuet52BrkLQNwmEIUCx0Y/Wo6W0GAIbVwpy0UO6zP5Mw9d8fgEB/L9qWcZSh12bYwabr
	6Ui4yDaZpPqXwjAnhxLZkwzso18DeeyIjxBzXe1BpHWaRXOH5nka8gcyrhhGzOCvLGtxi6q+LNesw
	iiNML2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguY-0000000Eacg-0ADh;
	Wed, 03 Jun 2026 08:25:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguU-0000000Eaac-46TD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so19692635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475109; x=1781079909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=nTShsGAc9slqEiAtVpEgRA43TdRj9hkaUIpmHm9pjR4nL7fJkVDL6hEV2emD6GQKzw
         W45zARqjY5cjT9ryZta8B9+94P0E4v1YdTaZBPe2pMFLLNrAwA5m9CupUWLbjaLJyP8m
         PPhHdwb6DYwBQKP5EbGKe/MdAUEAgaJL1QrhAu3zYxPU72Ekwr2wrZm21IyoXdUvGSVP
         ORLnQSlq5miFGTkiDfqGSNZE4b1496UOHvh0plVBNwVK1ljqiVo6e25bRl3cQ53TgZYs
         en+KuPtTpOospZ1go9LLZRiDcbG00pThKaNpLzgJgX028E448hXi9UcOYIRIIlHyC2IW
         VEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475109; x=1781079909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=PhW98FYrKt7bgjTpmETOh42b3OknC5hxEHzttPpnYkYG2Cyqrwfnm2TrnOf+V365Xq
         w07whGHXI1ijc4ABRc2CwuhTwOFs/cFGQRI+NEoiKUtg48UDl554WauB++qZgwySvPiu
         ZhETcgcTZa1YZVusNLpECEDzI8lOjJ1aaIy7NR7SufvRb37PsYvDsQangLcOLPC2wvXE
         5Rse5EEfboCMDpcV5KWXrEARSivD6NOrDB69v90IEmTjjebTiwrJPtgdSiMRVB2GWzhv
         GKnG1tilwyd4ydKUJTPo8BPZME8CnHeVhlB0LUMeUZFos49uVbSrP5D4be+B55DXo+PI
         AHfA==
X-Forwarded-Encrypted: i=1; AFNElJ8Nl79KzzH1qMCIrwEopfC1+CGkbJ/qtbtkF5nVXxeUmHNva+jQncZ4meC3t9WZWxO0BBmv6VjdS0lWLXq+00nB@lists.infradead.org
X-Gm-Message-State: AOJu0YxaONz9fnd1u2+jIiEbu0Ib87Ng0UdPi67yYJ5WHoWeN7nWMIeP
	Cq2XYWD+Fnc4GGtTJzvxFNqomcEQN/F8XlQ5RSdUGISBiq/dVi3iqHGK
X-Gm-Gg: Acq92OG+u3x9vaY8Tcxg1PZeqcQlkClPUB/jkV36GwA0hHkXs/nvoAB7XfzQ9UKJKrn
	9e0kZbiUwTynDaLvaz1LhKvup9fpQLqUYizIlCX48mqtowpsfDWT4pwl7ypLg9z/gQV5UgdwNZo
	TK4sxspioRbVFnBMhMpD8ju/T70zUhkcdCXP4H8sbXjRlOxs69QBbEw+UIKN8udzgCuI0GYNRMY
	7q9HTWh7WPGtSavlsNErpZ23XeYeChSXo3SGgPLv6dTMOZ1XAslCWVmyxVALmdNZf628T+6br9c
	9Pg/T8pmpltPxCKuc/3cmmx4t2fE4/rGuhAHSh/U7Y/mT6T605cgwTfFKDYC+RmefKsw1ygxAJg
	QUiBWd9A+CkFLlnCH0Uy4GBFEOKjbkc/lOoeydc/GsTj9M+jM3p/BNWsrnsNUempl5zB3MNoM8/
	sVzeU0EJvzLvmw16HKaugXnBpxVdUjD+Txow3KGSlnM/yoUxb3c/rMawLIqHILW02ovhIO7j7Wx
	QlDthAu69JqY5jT9e+AYvU5O18G4DfuFNunjVwS0phWsgEpALM+1J4ix/k=
X-Received: by 2002:a05:600c:6211:b0:490:6e12:5418 with SMTP id 5b1f17b1804b1-490b5ed36b7mr40419825e9.23.1780475108995;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/5] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Wed,  3 Jun 2026 10:25:01 +0200
Message-ID: <95c0dbfea0536bc38cdc71d7451f99a3fa4aa08f.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012511_037522_9203B306 
X-CRM114-Status: GOOD (  10.41  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c736127c7115..77377127c18c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -305,6 +306,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -441,6 +448,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3


