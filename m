Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B604ACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRlpnIBGwj1SV0Ga5VjzHGOxTmFxDYq9GyHuJwxd2xQ=; b=VHsc4dfiwX6dZ9rERP+FhQJ1DT
	iql1bpW697KzCzYaTmLQmBSgnojIupt38VI5w3P+Bkaw8e44Nc3jV1fEu60b/nv5iiOvp88ox3LNo
	vVxz2B3kkUBEVWuk1BII2VCUJezLVfFt6c52s8mlNwT0v69rHwMlTcYU4r3brpadz1UkXNtevooOk
	KW719yu3qnUbew4RW0QJnEIEua5MLs4ar1J8gV0l/68Xaa0twiGYR0fxtheTvkAcM4GfM83cWEoZ/
	Dq+KZnxPEkG552DvssPmuN9lBj4OUUZKZgRuu9WXZ46uH9xEKMoZelNFzGnum3eMuOHweEgH5N6J0
	3v4COtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7b-0000000FdaL-1Ej3;
	Thu, 21 Aug 2025 03:37:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uossr-0000000FHM6-0Zmy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:10:26 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 273FB1026;
	Thu, 21 Aug 2025 02:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734965;
	bh=th2PRuCatd86a+Pytbui/3QBHsiPNEur1r522M2FuVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdgFHiYcLLWr1Cy99ndodj3Kjn/XQzuCTdbwqkOhADNJdTCpagEqAV/wp68QJ+CkQ
	 FBbxhw2tcSQ9GX2pmUe9Yb1Wp8aR1PKPNnI2VBFVQHSuQP5n5yJfPb2RJDQ7EZdtrv
	 X23JqWYQX/+Fz9930kNNzFUPs2X00WJqb9FIi9Rg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/12] dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
Date: Thu, 21 Aug 2025 03:09:42 +0300
Message-ID: <20250821000944.27849-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_171025_330645_60C78B81 
X-CRM114-Status: UNSURE (   9.52  )
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

The CSI-2 receiver can be instantiated with up to four output channels.
This is an integration-specific property, specify the number of
instantiated channels through a new fsl,num-channels property. The
property is optional, and defaults to 1 as only one channel is currently
supported by drivers.

Using the compatible string to infer the number of channels has been
considered, but multiple instances of the same CSIS in the same SoC
could conceptually be synthesized with a different number of channels.
An explicit property is therefore more appropriate.

The only known SoC to have more than one channel is the i.MX8MP. As the
binding examples do not cover that SoC, don't update them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:

- Expand commit message
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index db4889bf881e..41ad5b84eaeb 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -68,6 +68,13 @@ properties:
     default: 166000000
     deprecated: true
 
+  fsl,num-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of output channels
+    minimum: 1
+    maximum: 4
+    default: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
Regards,

Laurent Pinchart


