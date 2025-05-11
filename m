Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76BC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmymoOtnayYm+djs4rT1y9StT3GuYbOed9q3JI0dnYo=; b=Ebd2MLVbzDHLk77jW1NWXJMA7M
	Pzbe5nC3WL/yKZkmI1WudnFjr5LCmUJiVsBq//xy7o7AWgw+qziS0KDrDPOtAUnAFSAzE4yhfTN6G
	iYEosjs3w2f/+BkQwCeegDOlBna0hTkVBWWCt5/a++U3OpCotqIrk+X8lUEOsfERjCEDzfBun2Wka
	OQxtVFWCnsyr0IQlCzcvS7rpH7huCsVmzGeqa35o51efqsORsEeSxxIUPYa1DhQEy3+A7jzxcpdoP
	ZSob0yPdtBrG9LDtYKVP4sW2n74nOm6htZ+Jz3RVzf4Ts1iEq6BL7L7TDrc6U6//YdbhSd1jugA4g
	bYn60Hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8gW-00000007SAd-3cCY;
	Sun, 11 May 2025 15:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XA-00000007LXD-09WP;
	Sun, 11 May 2025 14:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gmymoOtnayYm+djs4rT1y9StT3GuYbOed9q3JI0dnYo=; b=dwzmyjhSve6y7rpQw4tQuNg4/P
	tSXKAqOb0fzqh/rwvK0KiezIJAKDDa/DVKZlc3sKPcW84HYYyMQ2QqdENZBBYvDjgJ4nR//lKNgen
	Vfpe0YR6pHC4TpeFXC38TtnkZwS/qUGLAN0ckqaqRF1RCEJMhOD8CRsl0fq1let+pOS5eveH3MFFt
	XYUG0pi9+h5e/Nw6QgxO6LJj0nDCbWzQ4V7OsqYeVwL5LZV79TF976ZBYF4IpLlzRhIgjplj2h+Ei
	l0zDcywI3F9kG+Ca1aENz6a0r/mAqFFE8tx6/wBosuKJQSz6Xmr3AMSB3+hb+T9JJv9bZL7PBanAJ
	TI8eRRsw==;
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7X5-0000000Gcgp-2bdo;
	Sun, 11 May 2025 14:20:02 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id C1A7060208;
	Sun, 11 May 2025 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmymoOtnayYm+djs4rT1y9StT3GuYbOed9q3JI0dnYo=;
	b=a1ljSSE1eNYNAy4rA1cHI0DQA4mB/tq/0matKE/aI7ogzY6otz9Uqi5f9ifNDpB5+NxjAz
	qbKfrKDkn554j/qUh0GLuyJRFdtBQKmCItTC7SCARgI5Yg0dJei2alZ52VmNB6PBiOnh2M
	IcG1ME+25IP+tqndtWr74BZ6uEOglZw=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id A8BA8100500;
	Sun, 11 May 2025 14:19:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for mt7988
Date: Sun, 11 May 2025 16:19:18 +0200
Message-ID: <20250511141942.10284-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8900cc97-8796-486b-b6d7-bfa5648f2213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_151959_930668_BCABFFA4 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add own dsa-port binding for SoC with internal switch where only phy-mode
'internal' is valid.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index ea979bcae1d6..bb22c36749fc 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -186,6 +186,18 @@ required:
   - reg
 
 $defs:
+  builtin-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-6]$":
+            if:
+              required: [ ethernet ]
+            then:
+              properties:
+                phy-mode:
+                  const: internal
+
   mt7530-dsa-port:
     patternProperties:
       "^(ethernet-)?ports$":
@@ -292,7 +304,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
     then:
-      $ref: "#/$defs/mt7530-dsa-port"
+      $ref: "#/$defs/builtin-dsa-port"
       properties:
         gpio-controller: false
         mediatek,mcm: false
-- 
2.43.0


