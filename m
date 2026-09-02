Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B79FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwSH+VPrwM/QWvKXvZ91GqgHP+dRw3S9kaAQ9v7NKL0=; b=DRBB5Y62Ol21kjsFpZ6VJcFL8n
	ufkTkGfSAJIibgOif+sQHw46JBWzpP1nOYt5k/tb42bKQ3nho/00hbGJDQ+NJGwYWsPQfCkeLQ4fw
	MfVfxnnbDfbqC4tdYpKnqs/ZOk/HAdS72G3Qt4c9VS4aPWB180ttBvt6kJVig7jksfsO5pbQOOn2I
	R4OMRMR7yHZVlSPaZL/swjCq+3WF2SlTR/+h8AeEln1aYMA5f4kpgROfHWrH/FZHPAl+HKvizr/pb
	6VwTZsBmsF/U38qjPYfsdkOjX/FezNnjvckhR77xQ87cQfYnsYAaRV9jYJvT50mPyYfX+1RQ22gIO
	NJ23AGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l0s-0000000Enea-47sf;
	Wed, 02 Sep 2026 13:28:27 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l0q-0000000Encl-0XGx;
	Wed, 02 Sep 2026 13:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788355694; x=1788960494; i=wahrenst@gmx.net;
	bh=BwSH+VPrwM/QWvKXvZ91GqgHP+dRw3S9kaAQ9v7NKL0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BpjNNJPwBK7lzk/nVWBfBg4N1K6KcrLF1iXJfRGV2YujG2lQwmJXFKnCrqamKv3n
	 16Jx2wt+uxlGJElTgQr9QIur0Djdpxax1GjjrMdSJiDFewGL3lMg+yeP5wlE0bZsz
	 NSmVXTsO+UusN0uWNqq733fUA8S7ai9czsmMebSLNNdm9/yGjDdfLqoP1JPZfRcC7
	 RzrI0fNeMg/vSxI5iHei0AE4rszYdZ3WurddS0ifoTI9Npysplp1p+OfDB4SJjlx6
	 QzucjTBi+N/EbZflcnfo6q5VNPim7f59kE/LynlnmHdpOgxoNwpsciMXHYZ//Hg05
	 hY/wqp4VtTmA1khKlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7Jza-1wwHMg1w9E-006u4I; Wed, 02
 Sep 2026 15:28:14 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aswath Govindraju <a-govindraju@ti.com>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 1/3] dt-bindings: arm: fsl: Add chargebyte Charge Control Y
Date: Wed,  2 Sep 2026 15:27:58 +0200
Message-ID: <20260902132801.22056-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132801.22056-1-wahrenst@gmx.net>
References: <20260902132801.22056-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZF8CgSyRbkpAOvc6r9rbMWEYoxcgijJuRPbgRyU/R0VbLwuL5kF
 HQbGaQvsnXE+jIOy9o90khmNPuMSaWWqi265Zz5XNk2Djk5hNRWl3Bmn2cI29IiyJjD/wC0
 RcqbHccdDPfZPtV13myLPNrZ2PjLUKEyzUaUXpxL85NgESjY46c2dYZ6gf9I7PWlXrk+WPu
 siIcBStJezWaRiKXkOOUQ==
UI-OutboundReport: notjunk:1;M01:P0:SVm2FY1/QC4=;IaTBvlpzd3fMWE0jW5cksmuEQ9V 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_062824_539259_0E7B52C5 
X-CRM114-Status: UNSURE (   7.88  )
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

Add device-tree bindings for chargebyte Charge Control Y board based on
the PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
=2D--
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentatio=
n/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..6d20703c25b4 100644
=2D-- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1665,6 +1665,7 @@ properties:
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
           - enum:
+              - chargebyte,imx93-charge-control-y # chargebyte Charge Con=
trol Y
               - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
               - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
=2D-=20
2.43.0


