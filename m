Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B910BA456
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=; b=18MIp/0PTkjSk5pV1JH2aEDDuL
	1s1Oqvzfv3wfPZMjxoXcSjrIvJANglFmdKb43iXoXIVM9EGC/k12sDd2uDYaqsEmv6Nc77oLAWRHy
	0UFFgvNsbldcR02eM+GwiEgvmUM1CAvRnm/Sof8pJK7cXx3ZB8QetGYQ4TO6tJrWgFp+3TxjB0NPP
	l2nkT8B2o17tT8NHBS2X5WYegRKtwPW+PFo4oXsFmf1ecpQNihFef42P4dC2joXs1b0dKnrtKfJsk
	rRwhGHOf1B9OZuZtrpGZjJbTcV2O9aUVVEyxNGH90m7n4ogmqWXgKjX9gizXiiCfLr3r8q29QOBM1
	+pOG57/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63By-000000072PJ-0dRG;
	Fri, 27 Mar 2026 09:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bp-000000072NT-41Cb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=; b=KL+YmHuHIcAPV0c3CP2cS00tYr
	o/4e4/Et5tjE0YZUvQsXcxhu30aR0xtTB0s3osg41vw4H63xEG7xkvL7+mj4ONhHdVtuT3/o2IRQc
	D0HC5Ba8PZv3zHtX96MA1hTtyF6XCEM+/4jvXKorVWK4i8q1t6wCt+qYjfIiM1WnH8deb+aWX9g2u
	zrPrlYjvJy648TvjJF7l+evus0RRE+CRTKgVhiGZIMokI/vBOk07PLL/AERRj91UgIW2oYx6fFwfd
	20oOtW+x0/waUo/YCcvS1R6gbVXDBXxB2R46WV7XLH7HppF9EUuMKAQPfhxVN6QZ41Qhna4xUGcWQ
	Nfp+EooQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bm-0000000A2J2-3ZqP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:09:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so15162385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602549; x=1775207349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=W88ElmRXoVI5l6s9DuTVMe+7OEKGUNY6FuTY0uC6JaYv4UxV6wfwA6wMTkbf3zJiX8
         QHJeeye60zfTkbDmXp/toCEBE9UbFKmKZh/s6cx9nV8FRPR43rufTja6nbHaGIPm3vDA
         WNbB2enXuxoycmwZ+ImAJqNcd+qVJPtgjZqBlgBKveNWFS+xYxaIvXdbnQAm2Z1DNb6l
         33fWhRvaBG5BT7zVlE5C/MqIQu5oA6Jmswm3GSN3nRo/QQcoBraSf4KPRDM6yZjltOkb
         TaQGkLt+xLKgVmdVoh681onY1nJ/1bdS1zisbopPx0R/kItpfqJOvccEblaILJn9eysa
         MtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602549; x=1775207349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=FMmKS+xIeL0JX9lcy3sbH+lnYezsFNeGlx2PBlvsur1YsosFpLn189u+9+ZaP4XvgC
         aaPvhLfQzBAbfOGVJe7XC+VqKIG+MPAbh7FhtlAJ77mYy3S62IVzoIakFngl5W9Q78zt
         2f0r2tHxSQDRJT/PWtNQxjRjXTfRv8mnFgTDq8m/NsCBLgO+k3Bw55xKkVHnXhod9/v4
         ZfAGEhzQpjpTe24mvNCifE7AiNTjaG/7LMZTY550wxTVggss5XDtQ07AfMC21zsoeUsW
         vjLDviOybDPofeS4tIWuk+rVmEDwOIqtaCSM30LtqL9iMwvMUo1id36IVd6x4mScjPtc
         NjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVvglTs4WtgpiZev13nNYBTEGUcX7H2m/EcBb/xNSliuy8yHXb0wfEwSlQ8xvxhyWueJIyr8Jw/8BZI8CjuCJvz@lists.infradead.org
X-Gm-Message-State: AOJu0YyqoQvLJU52lUbCVnuwUQSaW7eunMDvFrOJMBU7h/hRnM22/re1
	K5i6+CNHh7NSiNmcSDN86wLU2+rB+8Tm+Rfmf5i/cjPrrsCFjOidtHfJ
X-Gm-Gg: ATEYQzwGO3dIMQPDb585lyP1sArwG2sJAQTFikXYq6gxhDQNYNME1A0it3orVjioO7A
	AhgZ2srakdAi1jZHKkP2T4MXMqIKiOlYJTMJzIimK6PzeNuNA71uWbjPBUzmoxAm+vYxNkFxgJZ
	bfN/lST/VKVQUtluGTQM1NPEgc6sEWSDXJYwTiMxl+jvRZRz2ssBece0gAj4kb17d4htjNqM/gL
	II1Kt+zH0XQvADt/Mf7J8RBHOKkbQbawqzggVD6W1E679zFpPqyh/MpyPzxbksdibMYohaZG0Oy
	m9SEJF0A066B22WTqbzQ5Qq0wn7KG7PKwPqnWbRj8T3+SnliWguIHtdshoM1AZgOB3NENsx5OrY
	45m8Y2PfIKRaJJQOTj1R+QJZz4Nl1bH86h+P6iHJr/WJWTxKCgxW5MCGOIce8pddwJ/S/zhVKGC
	a/EGMpofrPmU8Z84KbW7DhHkLIucgE6sC4i+eN46k4W0EKom46UsDanpJMi014R/A6sVZyXpzdR
	G5X0X3XjLvaOHkjWO/3i+0KY3lfpGqpAOWtS9VfrAYNmOvl
X-Received: by 2002:a05:600c:c8f:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48727d45a8emr27743245e9.5.1774602548846;
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Fri, 27 Mar 2026 10:08:54 +0100
Message-ID: <e87e34976e87ff22e0739fbf978ebeeffaad175e.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090911_175817_01294BCB 
X-CRM114-Status: UNSURE (   9.08  )
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

Add DT compatible strings for Variscite DART-MX93 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..77497a261fd5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1587,6 +1587,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite DART-MX93 based boards
+        items:
+          - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
+          - const: variscite,var-dart-mx93 # Variscite DART-MX93 SOM
+          - const: fsl,imx93
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


