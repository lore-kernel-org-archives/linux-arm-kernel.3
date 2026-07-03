Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RLRzA3ro3zl+cujzGRMZ9GCKdfl5rt1S6Cb2aE3ttA=; b=MIoXO1mzODJb7PIt11LMEMYoTI
	JWufxWoKwfvHlYV11hK+4CVBO6SHkjv3Bg5WQjx11dXAVVLPXvbrz8f16SlQwryCGUGmjYqkKU9FX
	aZpGWoBvViykrnt2/iZs5/QjRhuGResbJiM89NZEAwk/XYa0860WkvowxEupcjN0WNgM3zTzT94lS
	OAGL7HvjWTtYmF3yObUbIvR633CnhxhdkUxl2Tcq5EUPhA+oNmBtzKPhI9jVW3dl60eXmQNR1RNI9
	IdbnKptDnxwYVPFEH0720Oth9b5k/T30Vv1nOCZV/WQDKD6xG4BgKB5/Z8UJStREoXWF+Sejr6S4g
	BDkx1+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXV-00000006ONQ-3ZAS;
	Fri, 03 Jul 2026 08:46:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXT-00000006OGq-0F8W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b7612475so2652105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068381; x=1783673181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RLRzA3ro3zl+cujzGRMZ9GCKdfl5rt1S6Cb2aE3ttA=;
        b=B14opMuLFgA5H7y/oxE/f8ikizaV0o6iTeChdrpXBUyRNXZCBP8QjcR2lun2V9sdrE
         vQv4R1iM0zJvsUzO1/lJ+NFbHDLE11vli66c8WGJ0hihGamltGdG/A9AxCFuiVkNY9RX
         yrlQoCh2ENiEVcSuOt2PQcmJZXMoieZzXcigxjHACNrhK6YgxA4e9OmZZEqMSqJBkAGF
         Xae8b5yQUVEpSchwGsOKhiC9v4xzQaqoEy4za8T0aKSxQNtimFZNQx9BrbjAPod/uKxw
         xjIW5xa4O0vE8dmEEDitTqfMmNdcuCpkxFEKg6Hy+00NS9mjkdlD9oo5SnhYp9c/SVdM
         9cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068381; x=1783673181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RLRzA3ro3zl+cujzGRMZ9GCKdfl5rt1S6Cb2aE3ttA=;
        b=BX89ClRUsfi7y+5xB0YidKtqiWbmeR70kLo5a4D7W3xMDEjLRY5oUkH5IAI0tJsjBr
         /HigIQl1o51KvOJQVhe2vEhM4L1A5I+8W70Z43GwoYcIZKbpBq9NIfg8IZ5a5szgqu5H
         /rmTYNiGAnE4WSvVe65z71ZZTB/gV4MqlXPOg2q1t3nNiY6hafe91yIwT8mshWpRTOUC
         PkC2TMkcEu7+nDAaulo+KjDrHfRnxj+shT1gHE7MmKbcXLuaU7dmA6m0h7GKaIy8krvI
         81S7JFpy2KKvdH/7umt/An7gNH1tUpGlZoz2OKmAWAlx88O/m14/wN83oGuvU3QHfiPk
         i3yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GeFBUsZWKDcCXPQM3qWoP+5909NEENJtdTqfiWFd8sJgVbM/JusGfmFIAO9WKCeZUX8gVRPEJuo7OKBvO+6kx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw58dW8q6sukqyzngSi+tUr2lcmrsJP28Pe0qYi0ek9Dhv6CWA0
	BRnQ8rmZNUEJbirNHOFCxoFMgCGNKcwFxhKGW7ESFXFDAJ6UHcx344nV
X-Gm-Gg: AfdE7clGsiOQbW2yr/wEHXxfaMfNB3487Lnat7viljuMZNLKG0j1DtDkAAZQlOdFPS2
	NHEgspq4MdlYxOdYMpCyShzCYDxD58ceaLlYIBPxtboXwtBOn2j5VFoUZiEW2sZZWeywFxxN+5c
	I5WOg/H7lfbm2POY3CUW18JkVgQ+INoOKG+KldPPD21QCthx1XJetJVXNjT+sP+4a7kqrH2UdYD
	LE++KfN5zTE14a7VzO+OdLxLxhOXo5Lq8JIIpNWf8DWYk2u827qFteoc0QQX46qcz1IKP+a2fWQ
	vc4KecWusq4Tz+gQYlZBzgTloF/PPZh1XJaF6vwcieqYSJ1mQGB4OzDLMcoKBuWSK+GjF174UpL
	SmquHtct6nETXZJK1exuaLLr4GWs7QoVLpM5OVoH8+fnubN4IUrzSYj4Xz54Z+yP73lAhsXQ5X0
	bomJVznR477qELcO4U44f/gop8Azs1ss+KSL19XtnY40WC3RPUEZ3YKgotcBKrmMt1FfVJ7WCRO
	Il8EiNSI74T3cZiCscpiIQPZw==
X-Received: by 2002:a05:600c:2302:b0:492:46c3:c7dc with SMTP id 5b1f17b1804b1-493c2b50755mr81163285e9.14.1783068381013;
        Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:20 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
Date: Fri,  3 Jul 2026 10:45:59 +0200
Message-ID: <9223b0d0cadaa8a3340f8866b550d5155aa2b621.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014623_127251_ECFA07E7 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 4898018f030c..c98dca8e7889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -40,18 +40,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3


