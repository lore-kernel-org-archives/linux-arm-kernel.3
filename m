Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F033F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbWje8jtSbs28s3XAcmxk2M8mDrL47UcrxrFU/WYo9U=; b=yEsFGgzw4umSJMrfJXhDfpp6hz
	BSb5r73e/YCQZgeX/yqJSj441kuB2k6zaOtXKSCV8ZPLBHLGQ6VgkFSd4O/9AaRY+2wVW4ChpaXL9
	6myE4DEEdiKUThVwKBFMNdf614H4rdCPcQKmBczsXwNnjPKHx657/vBXSSfPxY3Ffmv/XIMPwBlT0
	MUTyiMseAUrPPjaSwZH8NHR+TJoyUHFVnZT1wEcrqYi11mtDZFDYy4QOSf9vIES4nooG2uLbC9nxS
	I2dOhPVaox59jlrPIRpIcgWHfmWNabbb784IBvjWLDDfORt59oIDdfGuVZX2jBpKKwgr8jebjEpix
	dPbgeLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9H-00000006uxj-3tVw;
	Mon, 20 Apr 2026 12:54:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9A-00000006us4-15jj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:54:41 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E290B2688;
	Mon, 20 Apr 2026 14:53:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689581;
	bh=496Ou4r/BPNoALXAdud1c1PRkHtqfBUZ0zjiIeQJ4pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y9X7gBcdfDUC1wgT875qXur0+vJlDgYPfD2fM7+DjpPPbEzDCiuSYC6iW0BLIxMeK
	 6yjuISn/y+TJ3EctL1qW/DIBqa19E4W4HNoyM86k3x3fEQm5fopdimf3EU70KLkd55
	 WVrxQN3bR/QNF7AfmklJmPERfX+xSQGaLVygnsEQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:11 +0300
Subject: [PATCH 04/15] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-4-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=496Ou4r/BPNoALXAdud1c1PRkHtqfBUZ0zjiIeQJ4pw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIEE4ecTPwz7D5WJfCugnkyTMg+2tfZAPycp
 a+p7muijlyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiBAAKCRD6PaqMvJYe
 9SX0D/964x59MD+9qCvn3QOnB2w6FHsfngZ66LYiZxoxDZ6ssPfjSnLVqY3ITfBa5p2aTltDn/5
 Sb+G9HEjVs4Lfydl3mTo1nWwK5TfiT+2Kqg783BZ9NZXtUKyUWCEkNUKm3ZmfSOTQRwGxNK0Gnr
 XmTuR+l5c+Owv9EUZH1Qp9Xs4I1O33dICduvk5Qo82Kh1PkjsID0OguWTRi7LRztDCplr4MsaHm
 G7w9SAUb7Ossh/tA94iKlw0D8h+2UgB/Sy3vsreJjzbTdMwFU9Ryu7wzF3Yvx7ldWTh4uG/4/Ms
 KnrYRTxMOvBSunXa7d0vOb0FX82ZHt8eBmJfYyMcLaFlhZe/1hAFIwVH83B5DA/CZNuBOwvVPKl
 UBjW4kslB5Zf0yk5h7OWlPwUpO1W64p6GZhd1q0yTYQsSA3JTZ87Jt83lh9xRdZrvFv0+QMV9gL
 rJyGLju2ffuqB5s/tupbAj/9xz0wldgwqjaCdwANy+wxon+g1O202UJ2gxvkTUJznxxpjuUPtz3
 dz4kXzqfeGN4JMU8XtHNY0eVAWS848Qq+xtM5O1elRR7dYswXZtxLeSBnIiItfzTq4pODgOFESF
 HycqSbjlwNCxhZAbEk28ROo9L6TAiGcnc5Vdtv/sjis/NYChNeK58n0OALsOHgJBeXjo/Vl2XmM
 9cfeil6BFktAxQw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_055440_480424_1D2C53FA 
X-CRM114-Status: UNSURE (   8.26  )
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

On some SoCs the OLDI blocks belong to the same power-domain as the main
DSS block, but on some more recent SoCs the OLDI blocks have a
controllable power-domain.

Add the power-domain to the DT binding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
index 8203ec5e5bb3..61c3eb0a0776 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -29,6 +29,10 @@ properties:
   clock-names:
     const: serial
 
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
   ti,companion-oldi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.43.0


