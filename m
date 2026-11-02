Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WYeQh90l;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bgz+yMfM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7aAbwd3bYb82jK+lqdIlaSeyPNIbeoyxMw+OMzIVIVo=; b=WYeQh90lT4O3ZVZa97DKn1CaLV
	NemKxW//+Qf22S+xXOPlWZGL8gX38e5CcfuxYnqDmAik4892AFyFMTiugSOOyx832UqJ1eIrmxwWA
	57+UMYAnaE2hT5y6I9qiGYTZo11oAv4waYIX8tXLJudGLaLy+Icy0v7VcTwaYjs/gV1tnxHhxIVLN
	fTmMZL2pa1zmC7GW/ysbtImPK5ep1yF7vPSOH2nrEC3UegrUFCSo0f5BaRjrIjcLpMz6jKMVUdacS
	PabBU4GSABYvnsR/tF5KSyCZcL0ENABVpgP5UPxJ1mDYCmgfxcWyffCLGZRu4wrpzIs5SfsCrCCDi
	eYLbWqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprK-0000000GFZS-2Fin;
	Mon, 02 Nov 2026 11:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprI-0000000GFYr-3Bos;
	Mon, 02 Nov 2026 11:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83ED6408CA;
	Mon,  2 Nov 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793617548;
	b=rWr11ZJBqEL0aGNXbaCGqseIREFRP3NOglvUsQABzxc/6iB8XCUOALuuPE0Tu3OvK4fe
	 9i2A0puCzuZFQAfyqnVXYyQ37FZ8ImZigtDEqoO+SOHfpbKU3yuRm5rHTqnfzjjUbZDsq
	 Lkm/D2oWXe0AzwcJ1wUPD63mxRLcb7wHWSGMPH9S4IogHZFoOKYql36qD+mVyEkZhCumD
	 HVinqFlQ1o5cKMS5ng2SZgVdWbOGjZ19NoDmHET9juEWo9wArlr5Rs3bKDf/1wRJaHX9A
	 Mv7PxUFCUeWiw58BQpI42Yo+OILw3bwqDDM7iYps9fewEHxGk3eH4lppZLiGGyVBl9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793617548;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7aAbwd3bYb82jK+lqdIlaSeyPNIbeoyxMw+OMzIVIVo=;
	b=ud887XKI/MIJbzrwKFedmdpfNph6Q4rmYIQv7mXB3Rp4Exz5865eH/q6hog2X+X6N5BT
	 /vkLAvEyhykOF+Wc0nuFCJ87yFW6RHzhb4ldh0ddoeo61nkfWiIyAkpfU+/MkhZVm4f0x
	 H0Zn5uIqd/y8V7TmEFzl3WvwQ1FdVyxk9dDT0WyoHzUVqP6HM1bdIJAVRs9Z34AYoQi+P
	 GM8CwdIoojBQsEsESvvAKd5s0nMsySQCHp4EiPBrpdSU1+FiaVwc3B22uyk5p6tGwMJkO
	 aTADDdiv1oaFPDu/ygMCQtAuN1D/WtxLR39ZzZrGqvqi01Xm4hpqNabYvy0x5sZN5rw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFC2A1F00A17;
	Mon,  2 Nov 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617548;
	bh=7aAbwd3bYb82jK+lqdIlaSeyPNIbeoyxMw+OMzIVIVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Bgz+yMfMV2FNBhZHScXdCUyeG127xsbdfJPJqpfqFYX1TR8qe5dipzpa72q1UuDJB
	 RZZNNlyRVcZ1QDyycJNh+cnQqX0oboT7jcqAMLsFBr14NF4OtnIvX9Pc4LW03tPAGi
	 LiOn/etAjkInA7jZxWvQ0MYl5aS0HTOYr4yf9zsDDGFFnvNuFeou9dc2tJ6I5/oQkL
	 JikHuwR5ydMsw3Dh/D34dEHsiQ+MinRE9vjhVbkkYGeP5OyyU7Ru9IgAYHKGlx0ZwW
	 PC8acOGAXTbF4FPRGLUsw+MrXQLNM0U/RNwSIAqVcfivq4+ypwGnvkO393p2APyWPV
	 zKyP8blQ7gKCg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 41F48464B1;
	Mon,  2 Nov 2026 11:05:47 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Date: Mon, 02 Nov 2026 19:05:40 +0800
Subject: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
In-Reply-To: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793617545; l=2417;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=VT+yxtCcLwOnlSZwmUk7jkYSPZwtcYrMQt3WmbKM8GU=;
 b=Zyyzgp93TKMyE6jcJva/Zq1NmI1BVjP38JPANbk3tdzRgiWllHITIyK7Vpovl9498mKkoLFEo
 6eEov0fXsgEDx8+q1wg0bmzZ1fVltozCJ9/WjtaU8Fp5N6bxJhAEyFW
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Junyi Zhao <junyi.zhao@amlogic.com>

Amlogic A9 SoCs integrate the Silvaco I3C IP with two controller
instances:

  - amlogic,a9-i3c for the EE domain, which takes two clocks,
    "pclk" and "fast_clk" like the NXP variants;

  - amlogic,a9-ao-i3c for the Always-On (AO) domain, which exposes
    only "pclk": its bus clock is generated by an internal divider
    located in the controller's own register space.

Allow both compatibles with the "silvaco,i3c-master-v1" fallback and
enforce the per-variant clock counts.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
 .../bindings/i3c/silvaco,i3c-master.yaml           | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 853092f75..de1fdec65 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -19,6 +19,8 @@ properties:
           - enum:
               - nxp,imx94-i3c
               - nxp,imx95-i3c
+              - amlogic,a9-i3c
+              - amlogic,a9-ao-i3c
           - const: silvaco,i3c-master-v1
 
   reg:
@@ -28,14 +30,14 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
+    minItems: 1
     items:
       - description: system clock
       - description: bus clock
       - description: other (slower) events clock
 
   clock-names:
-    minItems: 2
+    minItems: 1
     items:
       - const: pclk
       - const: fast_clk
@@ -72,12 +74,30 @@ allOf:
             enum:
               - nxp,imx94-i3c
               - nxp,imx95-i3c
+              - amlogic,a9-i3c
     then:
       properties:
         clocks:
+          minItems: 2
           maxItems: 2
         clock-names:
+          minItems: 2
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,a9-ao-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+          description:
+            The "ao" variant is the controller instance in the Always-On (AO)
+            domain, which has no separate bus clock and derives the
+            bus clock from an internal divider.
+        clock-names:
+          maxItems: 1
 
 unevaluatedProperties: false
 

-- 
2.42.0



