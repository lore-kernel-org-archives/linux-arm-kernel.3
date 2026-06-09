Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B9ECD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=; b=g4H0cCKYR1cUQ0BExrWEzFnpBK
	rQQwpXeDzCPktCXGDDYXxQui90+q3ooom8aApNYlMqIqMe/g+GGxl4ymykliDv5I5omTTrFw8pRmh
	NshU/x70ThQymm6Ml7kBmSoZkvwgzJpf/SVw8UVADotovcdIuFZJnMhivA5qRI03I1i0HN3v6Dq/9
	0MSWgicKCTMWULtf51ro9NVGRUhn+uu4ShLOxV+QCwAPN5GSiCWU9R/l+J94K3l9Z35jFyJQJdRBU
	6PAL+Aw2o6fahifER2ygb79EOx0W0fschFjZ3taYTSvbp5wDVDUpJkeZ4YtdsqvQEFHJzpLKN8ny+
	ODifC0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsHT-000000057jS-2JPQ;
	Tue, 09 Jun 2026 08:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsHS-000000057iP-0OTE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=; b=b40zfk6JgYvaUnKFl1leCuk7pq
	DtIUvKTFrN2OTZ9wZrdu5B96F22A/kGe5pCltJ+yOzXEgztOGRsHLBz03I/1b0x6rEy3z1A1kjkYp
	gglraOl4Sg3UKq1Kv2uRTVHuXWokZQ/B5DeCWsiNYUlOrKs2Dk8TEalVtrpL1jmjltMmMKu2NIr4S
	P07ZUaPVNKCDpyB/7cnnB3j5ean/xYkFR7grUGajRly9a5eKZe9eX8SJ/1JRcQbuuDaxol281uS4m
	mfLN+kiDcN+TirkBaf7jcFW/HWEvsAC/kcmqvDxnyp06EiUgF/mtFbOmOSxw6DgcZFZu+R9Vqb5GE
	zolpGLrw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsHN-00000002D5D-33HW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:57:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2558584f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995468; x=1781600268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=nGgNwEVIIeT6Yz96A3/UI4ahDLiG9i5s6ZZMKyJ1LK5blsNFBEkWbBUSK+6uUs20n2
         sM94SFaprPRvVf/LDjZhe76XKk2lAZZGz5jXTlNjq95D2vfYH3pmPf4IsDPMJSpzhRu2
         FGLf+gqAxMKJF/KZ/SyhBdehha9iVSDOeKyB5RULDHEfKFXC5suzvKLOuJzuwWCNEe+6
         sl66wGaUMI+p16YUm7xuMOahio0CqL9m7v/HNxqXbi+X2kPQsMVnfU4YeVxjXi8Lzt3A
         0RVlHjkjVZklFBJC1YXN3AMe4R0Vexjuyys1iBAOSJ38IYyMkpXavIahV+z0DhgRGHgN
         2kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995468; x=1781600268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=klk/0n22nSFDI+Tz6ZhbieLc43dNyhfVgJGQUEgfkvUeyftYafUS9EI7NR1EP7Xp3P
         8R1KfujEGUaqvBHaLgmE3MK6t+xKRpOXjTXX4y9tEGOYfGs+yu/T5Em0b803/mJGQZ75
         uV8bTXGL4WXSwzx7BB35mPJ73OVuc+HsmBd+amR2/NIIPklg9a95VaHgRue2MmuPlpf9
         Sdg58pAgmoRZrLe9ZrUAeRl1pNlgwdsAHsxYCPGdB/aVMNqIpTUDnqYjJ4uAVt7BPsyC
         0YSJoykRO5u0zEjCrWhFSkx/HOszTJHH7YY9oHjfjYlOJrBCJOmxMopmWiaUbekrmDSd
         iSRw==
X-Forwarded-Encrypted: i=1; AFNElJ/7YX/oVGYNRYS/dr48M79ig0mrPvhfZn0HX7kz9XslcBEDfj8xsB+Yns2vg4uC04nsjyLfDDwkIaUQcQwsqiot@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb7vCoaqimVR5c+3iQNineIfM1OP0D/xEl2RqMT0h7LJ9DYdUk
	B3see5M1WQ0ofSJT0phzoBJUc7fVmm762HOk097yHBvKxCKQQhXKkdqe
X-Gm-Gg: Acq92OEWa5qlRZDm2OZIA4XVsxpARqKk7LsN02apnpDmz0uUrmaOaTEMuvRa5P+xFiY
	dSDAWq0Uk5tnYDLTSgsXPIm/UzIZY50uBtKE0gUTjo8ghVcNTStHMYEZH1Cyh7o+4lXx52A1Nvu
	O24hUSNG5kW3yCKUcfkhI2alEnamxruAczKDNmdQs8DVZz6Ap8rzDAQEvWQkQRQIPqqsqMzPW2N
	0acDVB+/9U8ks4jX4QbkLicP0CfJFhTxdxyOUBPXYqSf5e6DR2Y2xbaharD25ssoQ04qKRq8Ilr
	Aq3cfleqoJEIJsVC8rR1cIbnL/jpNrupsk13KIaCzjMXrsjO75PZdADZ0JscEz7sdjiz1dldiBa
	61GomT21P5gkqHrrbYMNuG2jYIvCefUeFFyCC8Hm/NkbpqWZw9Pw28BgCss2qpkU3nFn/nxuFes
	RTsGYsC9J+P/Fn2LZbPZxK/VNpE4QF3DZW8Q5PSrhYsNBcsFt71H2B4FpyGaY3/fz1rhAPz1DIF
	D3LCy30tunJz5gRFH4XV53NtVGc0xMXRnEPW3TibYBIN50=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr300911285e9.14.1780995467635;
        Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:46 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 10:57:38 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995368.git.stefano.r@variscite.com>
References: <cover.1780995368.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095750_119197_5232FD4C 
X-CRM114-Status: UNSURE (   8.92  )
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

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


