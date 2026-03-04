Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3395EF9016
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMoZu6JsfBdWs22IfsHWSodVPNZBAYSFrj3NGjYl6jo=; b=TxMCiisHBXITrMA/0L25y7r5W0
	meUetCtjWa1vx4tyzur2/RtLcP7sNUSaZCcWCE43ed+clthI+cfVvA2Q7xZ+oqFOyv9qWCqI5Fxbh
	13zuPMKebRSn5n8HH7/w/w60F7OjTnBaU3LPUvwcBoVkjBHbOg6Itzl17gTlyhSoSHO+bWN0VNXNQ
	HIlavUqy1+HMgQBt9xWlFBOcfrQ0tKUcXGT1Ss/GEB4ukxsLeFykh4G9071RUyAfg0P2w022xwst6
	zesex2m+/YYENLOwy/ObqE4XywKD83A9tS2sDp9ZD1mQPEJv+UxA05SKqUfXDG894KZoKJOEJflMs
	zJN9N76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpa4-000000007Mz-2UGy;
	Wed, 04 Mar 2026 17:00:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpa1-000000007I9-1ywZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:00:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48069a48629so75316935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643612; x=1773248412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMoZu6JsfBdWs22IfsHWSodVPNZBAYSFrj3NGjYl6jo=;
        b=lUSTV9ZDyDMeRLh/OyL8cZ/3VvSEjXHInJYHVt1tOxCCZ/ZSpy8OuxQxLsyhf6imdA
         NhP5GY++pqU/7pMBXdKvj1RCB+cztyxrLb6ZDjsxNqEqvqHSQGQsRBhNPBWvAyNN42NK
         Cdz6JsQw//hvKrnAbVazdKp1iA+Fd3jIiQuWleaDRuJREIoJf80eIvEfeZbFS0S791N1
         OTUQAMf1xRJbiDA/5LDrEHO8EfrhEr6qJ1TOQCPRF8hwo4g+GAm8OWBLbZYiYSO8RsQl
         PgYh0s910LknELLoab6wrEpgB+mKEoH9t1AU5abTBUGz3Ipln8yvbLJfSAh5QaDsJZOn
         JU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643612; x=1773248412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMoZu6JsfBdWs22IfsHWSodVPNZBAYSFrj3NGjYl6jo=;
        b=trrvCyUBNXjVfWtPfJRnkhxGfNFczRAZv/fY3ePWekhkSbwoyKXz84SwbvzmORsWGM
         qga65xXYGqXjFzCKb630vGyuvo03jXvBUVMaOx80OUWGOvnqfZW2oCa4dA3wpduLyA0v
         UJ9hKupeohClzXsRdK3av8CQ6eNQNmYTnbR35qSi4FmB47OaVIkZOTfGucCWUdcFWwxl
         Mo673JbuXCuFvW+WvN+lX1DPDg44WYsTEz2vou3yBgRjOhkdLq8SuiO19i6XHYuVHKaR
         BHHQQTfadmanYynKbvISbWxWyjrTs5hv97S4WT+Tjn1MurQLCDCLlMCEAjJIsNL0a6Gy
         lFMg==
X-Forwarded-Encrypted: i=1; AJvYcCXyfbDtDcObwZseZ9xDp5MWqv4Qd0E/XoQ9hwH29VMAMjTDxYxkeJOheL2nlKPtE0nt09WNzIBfSV8aG/73dTv8@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOkwKIqzdwkOFjiJUF4M5MLktAQcl5Q0bNujAOq6Xzpr5PWP8
	zKtIjQgIYoOI1z2BpA9GvX9ORtjMX7Ohf/174/IC2U6MhntwwfO/nxRt
X-Gm-Gg: ATEYQzw8zx3UpuQ6NSKRIAy/hAAE7SgLrXp8s7ddHHY7z6fwozVAfqJuhcoxrmB7G68
	lO5PD2/Qw63pivIdr0baqoh5HqoHePDLYT5WbXHWNavaact4r+Nbpe5DGnykavsLCfv54zOfslX
	dn0PA9yPZtgBIqN37gk3HuOvEdfRjgc1ohplzDDJdOcwQcxG5zNqVqSC3W1g2Zcyd2i9CmijvM2
	LK5xtYB5z6t8QHsU+qyQhMqsSzKsGIU/O14eFqkOzom0Sb1xnnNUve6cvnxLj07gPUcop1rhoSP
	Hygb5mvALHWPNyAyKmHzq7Kp57LH3Ldh4dvl13vnLC21eNMG/3/3+NJaamMcTVcgUQFk3aUeGZP
	KZGRzBCY5sppUbG3wCPUiX/JqDgrJNq/fq7gwhrk2bi0I+I3eibUmvle15gOXwHgJytX9Uv3lAj
	tHgt1m0DHEaNl2P+7wCxIwWekC8Idatu6MIZ6QU11KKF7ARhdE+FTLHTNLCFh0XhTgKOz6CIjzx
	Sjb/OvSLPBCynscFfAcxGLl5+yZzxhKfvXGdAGu
X-Received: by 2002:a05:600c:35ce:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-485198312d8mr54301665e9.2.1772643611400;
        Wed, 04 Mar 2026 09:00:11 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fc54sm69946295e9.10.2026.03.04.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:00:10 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Wed,  4 Mar 2026 17:59:53 +0100
Message-ID: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772642881.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772642881.git.stefano.r@variscite.com>
References: <cover.1772642881.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090013_542325_D941DC78 
X-CRM114-Status: UNSURE (   9.62  )
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

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..be2b88c3d9ee 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1545,6 +1545,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


