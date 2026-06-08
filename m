Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8EACD8CA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=; b=noP1BMstI1nsRbqiGiSTI5kL4p
	RCHs7l2zPTpC7LtRvY0N7xJuNWCz3pnaOMbM90sYnBSKbFdINnsmX7ZvwtiIula2gjr0knlAe5hoT
	s0co8k7v0Xswj9b3AbSUmkaSNxR7tiEL0aPog8CZOoH2e0JHGunOk7qCViaoPSv8mUgQbU2tApPIl
	wSGA7iHxKbsD6AMyWxa3rdDabblR4Hyxb6IuGnzliXPPkJZBPnjQHsxqaSYvZ5aLgj5+gfzGAqfuS
	OTsw2bXoIb7btAEIg70K8P2rjYluy8ijTOvjlNqCSJHI91EUFS+L0Q/EtK88AIeq5EAtahBlg2So7
	SaMk5aTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWjY-00000003FTm-3mWT;
	Mon, 08 Jun 2026 09:57:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWjU-00000003FRu-3yXu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:57:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3695384f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912643; x=1781517443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=hB9B2Ifd1X2hZIIxe3IGxlcqP7UlCKIIaCuApsxkySrxj4jGZBPK7KtsEkSOr2tzyZ
         e5xa+Hu/rfjIzv5W9smCuxLUSBbVq2bfaobRSrJYcCxMT0S2z7CXo8ETTm7yJ/0hCAAe
         /plUH4sV1qlrxWWp+1XjRiPnsrO5rWkBVL7maYfpFOrZPPJUFVRtzJNDoANDhRZ4yrWX
         /mefL4+FuWYFJICRWqrSDeWCys/aufVSoJQPmRifa8bU4iYw9el2KGAWUMUr3CHyR56/
         iJRapxbzJggXYuzyHB9owV7WRoEgnjdL3NrMnsNjczmgtpXv9uPIMX30XPvkDGF4vUUA
         AyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912643; x=1781517443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SVUY+NOvlcH+n94/oc1FbAAMp7coC/2Es0UWZ8xYLs=;
        b=b4F7hbJ+mmrR700m/F/1lQV4fGpgJSWlEB9ME2JPl0mneX27LeyxNf9jqRLpBAjIlv
         Q6FvAPo/QmCwcxUrssO0agxowkAKeR5f02TA328s4LbD2s9aHnJ0e14535iM57bamfZN
         +nUSlsdpiVfJqBXoDhJ1S/P13FnZ70dKVd+uHfuid5S60g7yNWxYCB6BwQujHE1hWt0q
         cnE203ITYbI5htkHEOAvq3jGxWXgY55k+NTCdviUC9v7suYo9R5i+7D4LvGGYgitf3HF
         onVRDjrtJlAV6kzrRpVSmMihLrZ0e5ofZbTlqNdOsNlfZKFZJpydD/BJCUkDLYxiMKLr
         qIew==
X-Forwarded-Encrypted: i=1; AFNElJ9g1bPzDJHb3XBYvYQDcLmeGhUUYDeGEAA74ucmS9oH3PdnzGKe5SB1JHJ46xls3r+b1eDHx2LFb90Tw2eTZBSu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+TGVEcbRM0Uo0dFST8s9ArwQ4EuIIzBjGndRnwlu1uHFGLXWg
	hQyiyFr56TxmqK4IH1xTAXbrPomzCfspPjvhYDHEnEwZ17UQXul7T0ct
X-Gm-Gg: Acq92OGc3IBgbcN3PcQKrVqQ7wxc9Q38QrOZK0HaIAUS4fw8a7ntPB89RzE4fljG1yE
	Q56NWIInrUX/E/H4ptYoQJGgkJmlZE6A+HcQtVbvMN+5KsCl6oZ9atzJgY0f3EPibXV6j1vdTG6
	JDFBF2HezWO1av80uuDRQhJngpysSSZqUat+hoOAfGyUWZi9gckiD9IXntCu5qVj6oAK1MHjqul
	gQ6p1CRvFhTBrB1Wd05hSm6azDbr9xVLLrCtDhGor0kATemMpXWPk0L2+sZ2Dw2Wq0XVkLBWTpN
	HZDOl59tsNlddAPtyM5KpPLApyAitmuZQYwbDao2NbpewA+/Kw0DbLRBptLmju4mUqv99FofJaI
	UWshBkVhAEDUyGYzf3CCLX4OIQ5kL4aIP/3bWA15YMqqfuMWxNQnQUJUtI/r7yX3ojn+TD9SCJg
	bXYSkIfYMErzc7kXTtWihIlxV9c3+9nDHmKYWErTL3jLOxJgJpW958mNLg5DqrEERK9r9CdO2G7
	hc0lnf9MtlDupwW0g+IEU8iuIl8dXzXjoMr1ri0w4GE2GY+
X-Received: by 2002:a5d:5f44:0:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-46030512855mr23767118f8f.28.1780912642817;
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:22 -0700 (PDT)
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:57:11 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912513.git.stefano.r@variscite.com>
References: <cover.1780912513.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_025725_022830_D97E1CFF 
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

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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


