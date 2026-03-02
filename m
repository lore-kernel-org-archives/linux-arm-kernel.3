Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF23E9B356
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMnRhDEp9Ptd0SpYBrIdln+6K/ZJlKaMBCVTSYNm69A=; b=sNHLxPR+2NZRhgH8lPL3ttJxAl
	bBwbZx6Kud1RIMNPfMKc1WN0ql8f+Nd9G5m4fozbXvvt1FdbenYA2g0scfPLeN6EE4KPy89LVamJB
	kzglmtNoYBicMBLHKKMFDESvbkReTcqsgMrNAIVCAeejhjFKBnNt1DbVuIDk1gdR3Wcdwp6meE8cC
	fdaXF0EPoXN5nqq4Zy54B/q6b1ScXAXSOpCgrg9BvldWgDydPfSPiCH/f7XC+eel/k0irgK0uq8bq
	u9YcpnUVZXSDDqn69QQEXu659q55q64wGKz/qxNMXZKSjJQqgR1mdcnM+Eslg3ogB1+J+ar0QcV+P
	gQH6kZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Ki-0000000CgDJ-3toG;
	Mon, 02 Mar 2026 10:17:00 +0000
Received: from mx-relay04-hz1.antispameurope.com ([94.100.132.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Ke-0000000CgCt-3Ke0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:17:00 +0000
ARC-Authentication-Results: i=1; mx-gate04-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=AMnRhDEp9Ptd0SpYBrIdln+6K/ZJlKaMBCVTSYNm69A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772446595;
 b=n0Tmmf7EvQTvvsY890QEUGL6OHevqNaSEBycB5iTpEP+s5fAQt+irsRiYNPYXjTxMzr8D10L
 jLdTx/yhhdK3HhwvbfAObdPxme/jSAxzPJLuUa/spaY6PK6xajAYPvcWBBpamzADhbYW431bYCK
 AN6yCV/GdbJf03kuafjrxz+t1blc7hpt0q4t3brIDMw+TALEm5B+905FrMxRdj3bIz/Y/H440we
 1Ldgafvk3Tgc9K2I1a6AladlcqqTiy36U/hxJOocc4jhaHO9nYJNJasANznHcwJiFQ9gx97aRhb
 eZqgABi0bl0i2nLNagbhZiZo6LFzxBN5HF0FfJKzU7ptg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772446595;
 b=spFn6F2Nc3b7txNgY5GB6AQ78/+g+uOeMW7/Yuw3KGpbRGHFdTbkKUJjOhBxgjegjupHcvYH
 mUaelQ77qrjdCIo/9OOzO/FUgAzmcZOutNS1gydn8Zi5mARkWMHVGIggTJ+0GXM8R0m4sNAkPzx
 clygb/oFux318CHakBUmgss371D3/3AtrW9vwH31j8X98fk8+XNMPBfOSDAZsupNMLglNtJa1p9
 JRcTIjr3PiOg8SxV5saYh8aEBosnpQeSXIqXIx0VuKil7s72FkuZBZw/+obOODreMLqe97+GB4q
 VqyZP/7HPcshRe/vVCUWhIzMcUCIpbfC14y9ZTbbM7ZdA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay04-hz1.antispameurope.com;
 Mon, 02 Mar 2026 11:16:35 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D06D55A1244;
	Mon,  2 Mar 2026 11:16:10 +0100 (CET)
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Mon,  2 Mar 2026 11:14:58 +0100
Message-ID: <af87b54279e3d0b7dceccd2625f0ed7c5e06b83e.1772443991.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
References: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: nora.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay04-hz1.antispameurope.com with 4fPZZz5LXyzRvys
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4d4047286a7de5e590b3c07cf3114900
X-cloud-security: scantime:3.932
DKIM-Signature: a=rsa-sha256;
 bh=AMnRhDEp9Ptd0SpYBrIdln+6K/ZJlKaMBCVTSYNm69A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772446593; v=1;
 b=VZGDWyyieuuLxvfnSm3crd0eotrrBL9iTkcJuTZDOLEpVvC/h8HovGq7iPVPCtaUVoZLEtH/
 12+RAA83c5wwrUdGeW74P7dsDjIkBkYNNHt33U3ko+c11movNiMW6gLtFtlpQi4Q+HeVdQpG2Rh
 GAOoZtcpAMGCUCu70sb/newACVfdlw9Q54DHPjKLCh5rTVh1emYDWPaT7lKN1MBUGCNWnzPoLJH
 oTy5TkRWzElUJZZveCmgfkwK1NxAy1SNGyH7x0PhsIuR/kzUfje6h9I92gGkjcFcljYoLsV3r4h
 7cdEdeB8X2GYR1sm1V52xRlPAq5l6DS48wl2l6fPFg26g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_021657_095826_F68DA063 
X-CRM114-Status: GOOD (  10.02  )
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

The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
the matching reference/starterkit carrier board.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 85deda6d42920..f1b6ef98714f3 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -95,6 +95,13 @@ properties:
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
 
+      - description: K3 AM625 SoC on TQ-Systems TQMa62xx SoM
+        items:
+          - enum:
+              - tq,am625-tqma6254-mba62xx # MBa62xx base board
+          - const: tq,am625-tqma6254
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


