Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCaiF0dqbp4bwhlBinjrBKomV700hQl+mu+AYigkmoo=; b=eGZcimGn0j1sWqHu5OS4iEh8iu
	Eu+sfKWxz4qLwBQIxnojVpGmEFZEmN5oz0TaY3+s/fppYYYgkc/xxrsQ1KD2RhebhdVW92B2rP8yL
	4C/izS5IiTL3fYFA/FHsz87D6znw1JaSdRB3Bh7TimU1030b5Ic3HV4BvrjZriHh9lxbQhmUsvNwK
	UmFOK6TV8NQ+gMOpBa6ZR4nszRlxQlLL8VvCXpp5CfvXaxXUJpVY4T5J5YREpHWpHZ8WO+EntKO1j
	uGHNIGV6r9RvuUgYl9zdlDF81aun9JnOlAJDGrIhfA7e0XfCm2wnEidMkCxjisyUbJagHyiWUxWvv
	79MFUpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3ot-0000000GLNM-2Wm7;
	Fri, 14 Feb 2025 22:05:59 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3m8-0000000GKrT-3luj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:03:10 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 30B04254016F;
	Fri, 14 Feb 2025 17:03:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Feb 2025 17:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570587; x=
	1739656987; bh=uCaiF0dqbp4bwhlBinjrBKomV700hQl+mu+AYigkmoo=; b=s
	H28oRQD6s1zNuVS12lanjr9OjwABjGom6Klmh7VlRguzl3zedexO7k296u0fYrtg
	2JUHlICGJJ5mZKqmcrjdiaukDaSc85zYmeMrHcifhhoRSMV0PzQiEvRUaMZ8bk6i
	9itS7TOaqSwQDZpldO3Qrta9ypDl/pCpK155SF9EDjR7ilW+86rrO5BPWurBd10D
	y9/N82okwwyH4iPuLgemrzy+L8nyGP5LSrAv7IVEq42kgqtQEIR4mtnK/MNLvon4
	lTsa1hSf62EdSMZtgLjOtQs4UgoUkgMT41ZyU9jyeN7Cc/Bu89ETwxoYj/fpR+Rb
	6LAqGe4Yxb2AnhYb/x+ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570587; x=1739656987; bh=u
	CaiF0dqbp4bwhlBinjrBKomV700hQl+mu+AYigkmoo=; b=rlPDzohnzWFPy+6Ky
	uMltyrq1QtSGMf2HOWKsajsj6W4RCj4ZujkOIaxJUYkJ9tuDd2jXJ6qSiBMlyUvB
	nZHmxvd7H8y+oOgakimd2skx4WM4JdtS+hr3uXpaszSWjRMt+x5Sz+goGzmDA/wJ
	gBz9UtKgjRm2ayPiqCjuI3OkqA58sjxbN6wfv+F9u1Kwr0pXFyLKvtIF2OqdZXXO
	ftAnIlrYznYFOnA39HBaGds/7hyxrKuYiqXuyM76akBYkAb5sjSRqIi3qvUlveXb
	wTA/TOPZg0GU1a1SOB1jzhCnot34Fx0zkAf2mfymxBiquuTRbrD6/tl7d2wVtxW2
	0A5sg==
X-ME-Sender: <xms:mr2vZ2n9V0aSYKgouCnSPKa_JKN_hPeQSbNgSy0Oc9H2A5sAON9B5Q>
    <xme:mr2vZ91X5fPT-vTHCnAfmxJAb9uxkEXcbIuW52cX6j_XSVCNzC8qZF7LxGUIVwCfM
    DqWv9cMQ51DxPGY8g>
X-ME-Received: <xmr:mr2vZ0pPs4IHMizTPWRVDZtMLTY7QF2Nxc1zeVUDbthGUPekWSbtt8SXOcsMS0YGOq7nhTXDSgD3HNLpcbJJqGWIlOEo_Zc4hyQPIwxIZipl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
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
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:mr2vZ6mqsEg_3CuQjNPEpaUTsGMIsHMdnCmeKQRrR9-HV6jrAE2sCQ>
    <xmx:mr2vZ01EnMp4ht_FPyaZ0zxjvvaUe47XyUvZF1k4mzzjdEwjW_94cQ>
    <xmx:mr2vZxvfyOcEEZxx3Lzgx1jPLrleQr4T5rUp4CBNrQeAOHoNL83BYQ>
    <xmx:mr2vZwXSerK5mBWmWTmgnDvz_FiRqkoHryq1WIFuqRELPkj1sN65yA>
    <xmx:m72vZ31RyidI5HiD2gu5BZ0ZHdPxJ3dEHm3wMdyH-oBR34bzxG4BN48i>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:02 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Date: Sat, 15 Feb 2025 11:02:23 +1300
Message-ID: <20250214220247.10810-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_140308_998956_23912CE6 
X-CRM114-Status: GOOD (  10.20  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Devices integrating Allwinner SoCs may use line-out or headphone jacks
with jack detection circuits attached to a GPIO. Support defining these
in DTs.

A number of Anbernic devices featuring the H700 SoC use this mechanism
to switch between a headphone jack and an internal speaker, so add these
to the allowed routing items.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

--

Changelog v1..v2:
- Remove vendor prefix from hp-det-gpios

Changelog v2..v3:
- Add Reviewed-by tag
---
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ccae64ce30719..b4eca702febc7 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -102,6 +102,10 @@ properties:
     maxItems: 1
     description: GPIO to enable the external amplifier
 
+  hp-det-gpios:
+    maxItems: 1
+    description: GPIO for headphone/line-out detection
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -251,8 +255,10 @@ allOf:
         allwinner,audio-routing:
           items:
             enum:
+              - Headphone
               - LINEOUT
               - Line Out
+              - Speaker
 
         dmas:
           items:
-- 
2.48.1


