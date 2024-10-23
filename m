Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC182D2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uiuJiInJUIv7ibp9q7xm1m4Q0qlEkTigyGQH0pLLlM=; b=hLkE9wqF/GyQ30E29CTRysJ9QQ
	NRfVhpHcZVfqvWMjuQpEpsjuJ7RTQkbGNhCBCnANpyZSMSWQP0xIewJtr4Sh6IgiHHyDncRX/QZnd
	UUmEhfuU2b8dgGplWmQdLr+4sm4kvPfz4fGxeKTlB5/tlPSfAavQrCOy9jw0ULeEH1EuxjSwhpjbV
	cMu2VGQHB+XdSH5j0wZptqG0m45Tr7sNYsQob2J/D5Sl9rDlKVe257FJLtVi+3ZqjRj4pnrskhe7k
	oYtrdErpchw50BaZ9ja2QYrjcOPcy1LaQZdUOdOzRhYcbqMo9oyV0ftuBmvbEvBrk1QNgtypNZGfq
	eKfOxeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WLp-0000000DUb8-3S5Q;
	Wed, 23 Oct 2024 08:04:17 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WHO-0000000DThC-0x92
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 07:59:43 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7B1691380499;
	Wed, 23 Oct 2024 03:59:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 23 Oct 2024 03:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670380; x=
	1729756780; bh=7uiuJiInJUIv7ibp9q7xm1m4Q0qlEkTigyGQH0pLLlM=; b=A
	48tOkZiYCPIAd6kkdh0Z2MsRUbhkWy+35vFA9tvZQjqd/4Ynhs+YI8Of8PJSDMAm
	gge4g9Sg7F665QkDj7jI0fRPI4M4vPkVeVvM3m7/QcesfuZGnotOIQMCSbYODIJN
	Cd8rSbBaLof3naXYRj3u3zgnwaE9W0V/9KuHjb9YrIP8oCFCWDowD8qqRlO098YW
	I8JZls8S4M571hTlwvUYv+i8Pg7HV6sj0rbfxyv5minGqTPimgizHG4WsHbgMILB
	hIwyMhQ1QCq94P9kzbpL/6k6vj12WK2xKu1qgKUhs8lbGQ3trBAy8Afn1Y6m55tC
	ajJ0LulvmfaJsVOWmSy8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670380; x=
	1729756780; bh=7uiuJiInJUIv7ibp9q7xm1m4Q0qlEkTigyGQH0pLLlM=; b=b
	xSw88tTvp9roxZcU09kNeMIjINrNr/Bn7XuDdWXSm8Ph92NAkZdm8n1SRdr5fK1c
	zC5JUxydz/4xYpZUf2swXlawk7azzbD4rhoaJxUoWidbSxF+X9A38TVV+bbrMrJ5
	vleOhM2Obp9ct/6hFwj4VB54sI2jCQIafEb9m9YRY6glz9HmpLPcc3xAnAtMALWS
	9l7IiMGCi+ms0s4O62l13HbZw2vu4HAIDq/SokFpT9e3knvMp7jDxXcKJyPoVaU8
	MzKWRQpG0+EfoD/7uhBBBpem5IVEIEFOF6IMik5j7zx3nfbY3NPh1DLym0LidOl/
	26bJ6jc5FDxA78n/gWJUg==
X-ME-Sender: <xms:7KwYZ3lsGwlf1ldtI-DQkdDCdMrKga1_rqxdzpH7KvMeC-2MnC2TKA>
    <xme:7KwYZ60BpLmnBRSB0GLTCULvPkRAPCRHGVtIDYDLoRGziKr4RWnNNsQEt-EDmIST4
    djG1sGYXwyYrzX9KA>
X-ME-Received: <xmr:7KwYZ9p8Mu0OsTzmLBNGHwgTXYrTjZkYduYG4ox3DJjCS_0eB4ExJOY9buj9WZy_miF9IdSWWrDyMRJt8cGW7nBGmCYu7PiEkMUdu91f-qaiVil3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7KwYZ_lwhsRpMoJfYKD6G5uoDZFbhPsd6JMER858rvEVJIAM8Rhe0A>
    <xmx:7KwYZ12Ujcas7UXGaiQHsdVX3T2Xe-uGhTjsaqUlj0WsucBqu8ZgNQ>
    <xmx:7KwYZ-tVNqqTH989abu7ocFLbLwmFK7dvxRmQT2azy7QwcRd7q0svw>
    <xmx:7KwYZ5VIlbttYASOiPEZrMD3HboPkdeu2JsTuOe6bpYLUDov5-FKug>
    <xmx:7KwYZ035UgUPFuo-JhIuRhRycUsLUqXzt_zfIvWJY_LSv41fMN_rmrRZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:36 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio codec binding
Date: Wed, 23 Oct 2024 20:56:58 +1300
Message-ID: <20241023075917.186835-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005942_359882_0F91AC9B 
X-CRM114-Status: GOOD (  12.18  )
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

The H616 has an audio codec compatible with the sun4i-a10 driver.

The codec is relatively cut down compared to some of the other Allwinner
SoCs and only has a single line-out route (relying on a separate digital
microphone IP block for input). HDMI and SPDIF audio are handled
separately by an audio hub IP block, which is not currently implemented
in mainline kernels. This requires some additional flexibility in the
DMA bindings.

Add compatible string and routing for the H616 audio codec, and update
the required DMA descriptions.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..v2:
- Remove PLL_AUDIO_4X clock from definition (defined internally but
  not used by driver and so not required in DTSI)
- Restrict TX-only DMA definition to H616

Changelog v2..v3:

- Fix missing - in H616 conditional binding reported by dt_binding_check.
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f7665..ebc9097f936ad 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun50i-h616-codec
 
   reg:
     maxItems: 1
@@ -40,14 +41,20 @@ properties:
       - const: codec
 
   dmas:
-    items:
-      - description: RX DMA Channel
-      - description: TX DMA Channel
+    oneOf:
+      - items:
+          - description: RX DMA Channel
+          - description: TX DMA Channel
+      - items:
+          - description: TX DMA Channel
 
   dma-names:
-    items:
-      - const: rx
-      - const: tx
+    oneOf:
+      - items:
+          - const: rx
+          - const: tx
+      - items:
+          - const: tx
 
   resets:
     maxItems: 1
@@ -229,6 +236,40 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - LINEOUT
+              - Line Out
+
+        dmas:
+          items:
+            - description: TX DMA Channel
+
+        dma-names:
+          items:
+            - const: tx
+
+    else:
+      properties:
+        dmas:
+          items:
+            - description: RX DMA Channel
+            - description: TX DMA Channel
+
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.0


