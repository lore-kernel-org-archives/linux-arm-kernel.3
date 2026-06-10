Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9723DCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=; b=0joDxHJWrdonvLE7aXGDs/PCMr
	quqI+c+jQqm8Zeh+BBm7bkxv6cJMV9+xJFygsSjrfTk0rGIwFhZae3fxht1kp5xjRUnB6KBLGxBUR
	ZyNRn5PanniR0gvakYe+9Mp3ryPCqk87z3gBpPG6qBFMKeULAo0bqC+ehDYxoQi4raB9V03tN4/0i
	bCUDWkNM27iUWnJ3c74L58chzAIPVcvg5Fam0obAQH5n0EoDKZk1XSZaVkLF3+irrJqce57Wx1Ses
	G9eH8ntXo/A1DFOd0YB7GiaRKv/fKMbi+S2bk95Jo6kgZfdE2gBmCvds1PqtndiMlAvHfgY90oCAn
	02JGKRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEmA-000000079mD-013M;
	Wed, 10 Jun 2026 08:59:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEm7-000000079kE-0F8p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:59:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490cdae130cso20953865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081941; x=1781686741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=eY7IQd1gSULgW4w3IRndNlelo7jBhwZtLSyw324e7fz+hDmiNTb8T1CwZgBR7BSgXl
         P1kS8YQ72drbKfxbFo3JLtCJBQaXeMEii+O/fX1vj0C+mAKrCZ6utnzmiaNdSpyAEJ//
         lhKrRqubXHMjMBu4h06GUECLSZeE7w+QU41colY0FRtni2RAye6LOmP/22fhmzQGnGBq
         ddj0D+FQYJMjWIJCo2IbyOZd4HvcLkdUTRcz+tV/nvKFcUAze8CTndLd71+LxhbMXh9s
         eUZ+rOsLqpUxnz45fwUc/1gluRhmnQeU5C8n8z6N76eveLCtvo7LM7Q8qnwtZOLjLOqE
         gM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081941; x=1781686741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=cFq+S4G4vNFLamw9yHBNSMlBq0t3ohNwJoVzGQEzgKM1dT9uHIF15XUxDr3qfyAana
         6X3Hdr09VJK/BZ0pFs19oW8zXKq9nRwVTQgx5TlyCGvO7WLnhHVdjxIXTBaFNhNUdoZ0
         MxD3N+gWz0Gx7qDNbNNtuMZR1qjKcZp0a1XjhXM48iHHGslWh4kvVC2UV8/RFpH89Sd2
         mIpf7le0cipqgiuKlEYely4NJabATX+tprp4emuxQDZ5BAkYA1RmnhDB18DT66MCG3DR
         RIkU9upzLc26Lqr1q8dzjlcAqRQ5rUJbtwn9dH2QOutd+82eyhaF/erD6uTsB4hKUYpQ
         piSw==
X-Forwarded-Encrypted: i=1; AFNElJ9hDlgGifnUK+6NVyz4jmGKuK7QcZia61/5TylhtAxv6vtLM9tWvtItmYzeNUye6lwPCsBjM6015ySSxjorBtID@lists.infradead.org
X-Gm-Message-State: AOJu0YyYH3oUCgqlEvWI1s7EoWZUQTZhWIESGehkHRqbh/y/oxMcSOgd
	+2LYYd04ZwGKdjqAvAetEOJf4lLFfYYLYNujjFSFJOcL09j/PcDMKCmy
X-Gm-Gg: Acq92OHJUXKwQmqdq4Bxml0gaqQNUUUrvvoPylgfDphy7HVOBhmede7VoG/odmawFyI
	dzDbbNTQESzkkOiA8AmqcwdCBY8BTvUq/fNXEXnnf3/F04cwfTGYmdRYYF0LV/7DwYLsKkkDNaZ
	oYsCidvs+1bSLOtCt/ToRVo6wZXqBGMoJK4X0X9+yzuramhBDE3CiYbMhuQN1STGU/R+32BFHJQ
	f8gef8bypsKTeuLXcwvNXTCpsxeU6XNuhQ97KsWH0Ql2i2WCEtPIFRTS1nwagTB1yzswzUDbPSl
	9EhHTNLRJSTU2Cndk4CRMDIAsO1x45/leECgnYspLmup3PiZKlTdPIQz2qCWIlJvpNpqlTw8SZT
	NcUcZvt56BslI5dCOHDNxVkbCsLuI3SIfHQoHyuPwFyGL/CpK4t/cpcnmaMbKmWP77VYeuANgOm
	GSz4AOA8Xmi/gF2nm0553x12XJnpKpFnHJTbBGgWHreRhU+rrvahXVc8xdIGDEGgtWvYbrVAsIE
	uRRofdN7mmXm1ealoAl5x0gc/GgM8aPRRmRgHJi5ulDW2t2wZc0sqSFor0=
X-Received: by 2002:a05:600c:8b6a:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490c261b08fmr361705165e9.30.1781081940688;
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Wed, 10 Jun 2026 10:58:53 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781024557.git.stefano.r@variscite.com>
References: <cover.1781024557.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015903_113913_99446BBE 
X-CRM114-Status: UNSURE (   9.38  )
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

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..c942d3d06469 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3


