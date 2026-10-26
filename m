Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10660606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V3xwyCcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bkr7NxOTzxC5Z0kfnHtPBn5MNEZeRCbawudmN91sFJM=; b=V3xwyCcvcq+w1k
	FmrX3lk8PMniwTFjj2il40v6aw7pXcKAh0kChFATxAcbPjjXgUGyL2tYBdmK+7Q/+WYaXBIJw5hn0
	qIIpa1gl/bdAQxXvoB4/Q2wwqAPQYUKXKm8zrlGhc1Bm55HaewHebUjT1D1+nWr1D6XfFhei2Y2xe
	pfAlNHKxjHC7ISCtPxrqFbAr/vp58Ar0Do9Cg3o1/AkMgTeY0rit6qi0YYzviODrasbPNcJwzBTz7
	VdtehXLOB1pV3FMoCrI29msrwnQ3PQegvYUeyQ8KWQ5jLDDoUdW+JAOqB4eWhPqr2MlNQ/DePAb+I
	vg+SV1hre/0caZMgMObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM75-00000002iCk-35iL;
	Mon, 26 Oct 2026 14:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM6y-00000002iAK-2xJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C185F600CB;
	Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75FA1F01825;
	Mon, 26 Oct 2026 14:55:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/11] dt-bindings: pwm: renesas,pwm-rcar: Add support for R-Car X5H
Date: Mon, 26 Oct 2026 15:55:18 +0100
Message-ID: <388ee68e120ba73e675ad78fe0b1cbd89b061831.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document support for the Pulse Width Modulation (PWM) module in the
Renesas R-Car X5H (R8A78000) SoC.

R-Car Gen5 enlarged the PWM output cycle and high-level period fields
from 10 to 24 bits.  While the added register bits have initial states
of all-zeroes, and thus look compatible with previous generations, the
register bits may have been modified before Linux boots.  Hence no
fallback to renesas,pwm-rcar is included.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/pwm/renesas,pwm-rcar.yaml        | 61 ++++++++++---------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
index 2fe1992e29088c9a..424ca1e2df15354c 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
@@ -11,34 +11,39 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,pwm-r8a7742   # RZ/G1H
-          - renesas,pwm-r8a7743   # RZ/G1M
-          - renesas,pwm-r8a7744   # RZ/G1N
-          - renesas,pwm-r8a7745   # RZ/G1E
-          - renesas,pwm-r8a77470  # RZ/G1C
-          - renesas,pwm-r8a774a1  # RZ/G2M
-          - renesas,pwm-r8a774b1  # RZ/G2N
-          - renesas,pwm-r8a774c0  # RZ/G2E
-          - renesas,pwm-r8a774e1  # RZ/G2H
-          - renesas,pwm-r8a7778   # R-Car M1A
-          - renesas,pwm-r8a7779   # R-Car H1
-          - renesas,pwm-r8a7790   # R-Car H2
-          - renesas,pwm-r8a7791   # R-Car M2-W
-          - renesas,pwm-r8a7794   # R-Car E2
-          - renesas,pwm-r8a7795   # R-Car H3
-          - renesas,pwm-r8a7796   # R-Car M3-W
-          - renesas,pwm-r8a77961  # R-Car M3-W+
-          - renesas,pwm-r8a77965  # R-Car M3-N
-          - renesas,pwm-r8a77970  # R-Car V3M
-          - renesas,pwm-r8a77980  # R-Car V3H
-          - renesas,pwm-r8a77990  # R-Car E3
-          - renesas,pwm-r8a77995  # R-Car D3
-          - renesas,pwm-r8a779a0  # R-Car V3U
-          - renesas,pwm-r8a779g0  # R-Car V4H
-          - renesas,pwm-r8a779h0  # R-Car V4M
-      - const: renesas,pwm-rcar
+    oneOf:
+      - items:
+          - enum:
+              - renesas,pwm-r8a7742   # RZ/G1H
+              - renesas,pwm-r8a7743   # RZ/G1M
+              - renesas,pwm-r8a7744   # RZ/G1N
+              - renesas,pwm-r8a7745   # RZ/G1E
+              - renesas,pwm-r8a77470  # RZ/G1C
+              - renesas,pwm-r8a774a1  # RZ/G2M
+              - renesas,pwm-r8a774b1  # RZ/G2N
+              - renesas,pwm-r8a774c0  # RZ/G2E
+              - renesas,pwm-r8a774e1  # RZ/G2H
+              - renesas,pwm-r8a7778   # R-Car M1A
+              - renesas,pwm-r8a7779   # R-Car H1
+              - renesas,pwm-r8a7790   # R-Car H2
+              - renesas,pwm-r8a7791   # R-Car M2-W
+              - renesas,pwm-r8a7794   # R-Car E2
+              - renesas,pwm-r8a7795   # R-Car H3
+              - renesas,pwm-r8a7796   # R-Car M3-W
+              - renesas,pwm-r8a77961  # R-Car M3-W+
+              - renesas,pwm-r8a77965  # R-Car M3-N
+              - renesas,pwm-r8a77970  # R-Car V3M
+              - renesas,pwm-r8a77980  # R-Car V3H
+              - renesas,pwm-r8a77990  # R-Car E3
+              - renesas,pwm-r8a77995  # R-Car D3
+              - renesas,pwm-r8a779a0  # R-Car V3U
+              - renesas,pwm-r8a779g0  # R-Car V4H
+              - renesas,pwm-r8a779h0  # R-Car V4M
+          - const: renesas,pwm-rcar
+      - items:
+          - enum:
+              - renesas,pwm-r8a78000  # R-Car X5H
+          - const: renesas,rcar-gen5-pwm
 
   reg:
     # base address and length of the registers block for the PWM.
-- 
2.43.0


