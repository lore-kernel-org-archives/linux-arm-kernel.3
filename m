Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C775ACD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=; b=YezmvURGgjeh730RRCaisURyFA
	s3pGcOYKiG4bRHWt+XZoOCUNS9CPWw1iPY6Z6hJl0g/J7Ios1Bbj2ETClPmnqIEmsJ0xVLE+CDUtf
	M9SslC4Cw2YhYm2WGSVAGJrG5NldV84qL3aLKjQCzB/plIEOf9RFjY2adJ1zjv/KAiXLAbnR7TOWZ
	AkQzQRWXz59ZMJGyWtUKr8APU/02QEP0BDeDUj+CfMUHD3pddOn4Glfo+sHAgkrNjibUWinQxm7k6
	5BTkBIokpcoZMrM/2vaCHzdZhZvLYaYaaic/jLMWDYSWUTHv9jqyrIPvga8nOmvoH7inV7kFwe5Cv
	ez6ppLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt7N-00000005Fst-1gOQ;
	Tue, 09 Jun 2026 09:51:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt7I-00000005Fq9-3nPU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:51:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so43664975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998687; x=1781603487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=DGgfPmtxjI25U1Z05+iBDGtuvSi8Ywb9gJTCO74Pt+iJm0MJMtcRGKitN+G3083jsM
         G+1xJR+B66NcnfHeLTRk6dSfB5sHOSBDkfdQBldrGj89C5lzZynkhotZ8931CHv9BWBA
         kCtBOfbEFdBaHaFn+sd/UInfA2rKjLFR06bgj/HmxRoFDO6rPzEptnnoi87he4yU8XBi
         P2BV+JWAr7vTecFjQKagP1+uWUxn9TUkCgwq5OMzZEyPKPnwoq+OHhS9067eR1EONQk3
         7a2srgyZk6Gm0c8UHKGxSUUL6rC9VkGGWMNcHxKLyTtWmY0jBl5BWSgXbNFfk1biQfvV
         MgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998687; x=1781603487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=KnUwf3H/k9xbA8k0+VFpB6HfKGArkG4Q/nK5B4pdt7FZDjKdsokHL64CBDcJb+GJAX
         WSpnVgLSEuTJeCBAob8+KmK0xqrBnHrCV5IJbQie9fAkUbIzvur4mtS7unffJEQz4skw
         lsCHw7d6eHFH33lNk7Uiu/qFfyCmbAiNIeiqKMQa8zeZDs9+1n4tWNRnu8H03ZGeGyGS
         Ol/3YmDv87YFdJp8lMJLokf99BU7K/Q4ByYHirdOi5kA21bXIXPIrV3xQDXTlxQdZaqT
         zCppPIpEzcXEEAyvVw+ujyqQYQfnviyL6NYOkLELYi5qPW19UCveI/4dgaRwd2CNvjzf
         QDZA==
X-Forwarded-Encrypted: i=1; AFNElJ9Dmb6mTFLC7J93XZW03ZIfzfwb4wFeom3ih/FBWv788cPBU8qQKTDIjBXOPqPe/chPxnNOO9C0Fr784sePpUV5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96IjkFo/MRTArdF1E/eGO+Sk7YUkV9NuXxIPgP+OepcbUSBB+
	nvkt1OsZ69/N4an1hl2VuUsCQjtdlHKVP0gHnzMMLrRW5QmC7TYszhHd
X-Gm-Gg: Acq92OEfn45GwtmrExaJmJFJ7rbcjSeYpQDkYiSMIOGEKyyRFsZiBbcVWtFv1bWPqym
	3NAi4wOtzoxVM6tg7wzVsnaubriD4H4PBjpeasplqG18CV9e5eSC3k/5oF3jt3zF6aCUlC9gB6M
	+mVUerg/WMToOpq/f85/Jcx+C9joX5TNDVjN3txGsT61i8f9dgB3Qjpe6rWwpbpasTYg570kPov
	4rDWpZluEkMBPfBImPJ5orGx/uM7kio4eyu3YCC4XMCKvLxFxkmhKxJONoocxAJYF7LDZN8gNmJ
	AE3o2zOsPzwQcjR7qYW+Hw1852A44j5keYfheURH/kYifWh38gHn6BD2y4TUddsSLnoH6k5Y49B
	yXa5TaiiGsKAAnzqRWsMRAO5O4XKikw76v1Mnyd/t8ELmbw1LHju9S5HbXKexfm6RalSgWXR5+l
	l6oCbcfs02X7sZtkn83ObUZd9vszINE+3yWOtOFa4QnAjcFjTca+vFHx76WtispnbmvM3awnmo0
	2UGgM+ooGg9RFklzOxHFwSEJ5jRWJhUxxp2CP0crV4kJ0U=
X-Received: by 2002:a05:600c:83c3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490c25a21a9mr347442605e9.9.1780998686731;
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:51:18 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780998600.git.stefano.r@variscite.com>
References: <cover.1780998600.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_025128_960783_6590844E 
X-CRM114-Status: UNSURE (   8.82  )
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


