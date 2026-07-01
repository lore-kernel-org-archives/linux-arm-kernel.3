Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqpG8fUz6FJIqGcUgu0aLyV6Ny8c0iIhvMW4sHx0yr4=; b=DlHvcuibCz19G1stktr+3WvOvS
	3KgjvpO+D8irwukW/j7p69m3C5HeLDjtEUfKMmeMgqYy7v8+sEft4HkszmpO/SfRKAIxb+Mthubdn
	+L8GmJycrdeeLjOlgjEK77iQM3GPQFaOZCvmGCLSEdvlkvOfbp0U72cTUlO0aQFENCTyYfF5u76ZD
	bcrnX1xHSURYcQniGMkz0B75ggx8DXsjqNZssQb4pQbrL7ErY8x2Ean4dHFvx9u9FOETyJMrPX9yE
	B174xr7mywlc+tA4yA0jJ78E+CsNX9gy+GldBmgCYHLdR52Lty1wjnpVUesT6TYZIRFTs/z6cMvm6
	qRRaSnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werpW-00000001H94-47ML;
	Wed, 01 Jul 2026 10:06:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werpU-00000001H81-41q2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:06:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4720f3bf164so861241f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900363; x=1783505163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqpG8fUz6FJIqGcUgu0aLyV6Ny8c0iIhvMW4sHx0yr4=;
        b=fi2jv7cJ/D7MHDdlV2ofDSNi8KaUYJr7GSkXehotkXPSO+kf/x41OPqjfbmwZwAGys
         bCnbgkA9WmcdstJcuOgsPoJ6BAac6IoE2zvSTNosp6m5f9pSkwGmQZRn+4fMnVVylaIC
         uW7ffoBrIP+uUyAOfD9Hsi4BvC4Fn7NxrGhKrkTAlI413W+zkEb49/A9qf2Sh+RPlk7R
         DFI+07KJIn6gjIRj4RMkFqYs15RhyQGVDNI0P1u8HhVKE5aWtVD5VFGKMk01BOpvxo4j
         4Bq6IOH9wyLYD021DcKz56HnNj9zUHwSL14KAImDY5rqWhlVcnQKG5wd+NW8MOctAD3V
         FyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900363; x=1783505163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqpG8fUz6FJIqGcUgu0aLyV6Ny8c0iIhvMW4sHx0yr4=;
        b=FEsnYv3edJp+HwONsXp5OB/bjjXXDzzYEGK9ZpRVOoFKW5NCKIKMjuNk10ElTGXny0
         IJoxc/wwtoYHQ1+pZj3/6Xdcv5QpYtB8CYl5pGQ/DbEkKExDL6Qumc1IhdwBp9mXJBgM
         yZWf8AKDJp+wns0OfjfbpW9mWdw0aDwiSRqUqW5ZPUme0metcapSYZkz2bZgOTnLSl4o
         TYtvhumJ2sdjs+RwDy5trQP7v/9YFBZXwZv/2AKfOJ3muffPs5efsXD04AzOUKHFUbX8
         Nh4UpqetzCj86VUc1TKgOclZcN2TnrnE2TdfXYQZBz3yv0t/v/Lu4AC2aqu5VQrARL2e
         Gp7A==
X-Forwarded-Encrypted: i=1; AHgh+RpFGLKJSupBKlScDCNXYQa05V+zzOaPoqCj8Fu8p4c1lYuQEgIna2O3GsdMeUvt2xr6rREkOwJ32yguoTx8JRqt@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtpRzkafnBh3F8gJGpD/2nLMK3iELxYR27np3Ve+wpeRgEe7B
	9Y+qi8rVPZtDGPMYcOdX2XsNEgPWp6YV229wTyrUeU4A6SCsoqrMzwcC
X-Gm-Gg: AfdE7clWJCpkxGod7+YufWoR5wPuoyaCLGz6P7CI3zEJSrGyQMZYBt1GT9nCV7SrGZo
	U2Q2k8lpPAxTNOJXnCivC0ufVxxkAzxWTNpiaBHuwWNxYGNomqfukuiwHt7T27vcnpmeFIhhQbd
	Mc4ajAOklmRGhlTfxyYBwbd+9xGZLBhtsijMzRvLcVJ4yGQuZw7QcJwHcULMW1z3O7+qLqPOLil
	tgdE34QA0AmGPcYltJNdy+b6aadiCH3rN5dSvfSWmn+ciSr7iWueuswSDZq6THorlsh0BmC3l+u
	cII7Uxi1gXsyXu4910qMgdyA08iqFIrWEm58kTwW0dzNTqJqodbJFgMnMtDbS96WFPOjSEB3Ihx
	3TIlQYKtVvW82RQmdvqHTbqfD+Lci/5YGzWuNS3+azKo8trjZFb0SDlji/iICQQeQ/pgZMtUXIM
	hyke3zIOFmOrFSO5fOn2ur9J2O+8oTc1pciKthn1SAOBvL5Cuxzmb9PCaY7nTArektlcEyWVwsc
	qN2JLkygVMlbobTF2mhD8Hilw==
X-Received: by 2002:a05:6000:186b:b0:472:28f2:506c with SMTP id ffacd0b85a97d-475dea255famr8072839f8f.13.1782900363045;
        Wed, 01 Jul 2026 03:06:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm13742935f8f.19.2026.07.01.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:06:02 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Wed,  1 Jul 2026 12:05:55 +0200
Message-ID: <71dbce373c16b9a251ca316fd90ef232ba106e76.1782898728.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782898728.git.stefano.r@variscite.com>
References: <cover.1782898728.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_030605_014238_CB06F67A 
X-CRM114-Status: UNSURE (   9.60  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..f96f3d31dac1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1322,6 +1322,12 @@ properties:
           - const: tq,imx8mp-tqma8mpqs            # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM
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


