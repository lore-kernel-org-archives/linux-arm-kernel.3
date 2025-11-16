Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C4ECD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFF4qIvkAwehv5Tg/aWnvtUclSg9Yim0HrFAtniNGnY=; b=J1gIDSqfcO7Ba8a080OkMdGOif
	6wBvYUMLpUZmfilhloW+mY6dCb7hl2UR+usuQWOIwZr4z+Y4qB4UzeeuZ48xyy+3E5kzwChoCjutP
	CJsquZQS6p4yO5H0r63OEzakejr2zRJ8NSOrqm7QL8+9riBO83EEeeO7kBfNaDFMEMnouCEcRTpaW
	kVbUn857b0LlrU1Emi/Jy1Ysh9I1gCiMjMXESt/LGxco3rZLwOoEI6Tngk2XZlxISkwerpmuGmbf7
	OJ8Y9wTjL7X3Mt/Y2R8zhCfk1teCcClB9kGyrF9JAKudYRa5nVFDyyGIlYZ7WYDWp8W0T3gJ76SeS
	E/sqsAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgn-0000000EfFJ-2E9S;
	Sun, 16 Nov 2025 13:21:09 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgk-0000000EfBW-2QcW;
	Sun, 16 Nov 2025 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HFF4qIvkAwehv5Tg/aWnvtUclSg9Yim0HrFAtniNGnY=; b=uLGN+3BGEu68Q6BwLAPx9ma3Pw
	RLFQV8uLIgKsI4NtaOHnQxsKMVEGjwlrrOmjbK64KegiWERnqJh7rz2GWiBGCgmMpY0dksH6FmhlZ
	/0UMMLo1l/DyCcs/zpaF6GIOTLaIzoQNejeKB5Q761mCEYyqvRUDz0jisCPw98MwzA6ugefwsqGTK
	bzohRmZvMF2Uzibg5hU6s4P6WliQiDzE8z61DaJTJ/pxqH2chHCJKAw0rF3rB+nKz7qo3yunqbGLx
	cqi0kXDU95YPTGwDFJm0Q6apEp+u3BtX+R3q8ADdQf1y1K7s3tWLwsv3HhJc4JoS66QBPY0mwHwPq
	f3qvtMlg==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcgf-0000000FW4E-0Sdh;
	Sun, 16 Nov 2025 14:21:01 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
Date: Sun, 16 Nov 2025 14:18:51 +0100
Message-Id: <20251116131853.440863-5-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116131853.440863-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116131853.440863-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052106_840979_37BE6878 
X-CRM114-Status: UNSURE (   7.62  )
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

The sun4i TCON needs a reference to the D-PHY in order to support LVDS
on Allwinner D1s/T113.

Add phys and phy-names to DT bindings.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b91..52589341f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,6 +115,12 @@ properties:
           - const: edp
           - const: lvds
 
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: combo-phy
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.25.1


