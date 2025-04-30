Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19279C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qWc4isue4hFDy/D7OaeR7F5B3QTCc+RTpjYWzMnZSys=; b=JG8mzGOchwBmy02EiA8892lej2
	6v5+FACtLeZTfVe/aoA+OxEllmgpLFhXDbArsi6lYlzwjWJq1heJ2zCyeYYJ2z5W6RXnCofIMLmFP
	wgUG56BVH1zQXZS6VCU+F7TF5mGZJXQaF3js4NJwBPwe3CHpn6fzZQXJ6X8yDvA6JOWWHJ+fv67vK
	QPyidEFjr5UN/v4VlmPLDqQd2RpPwVTD5JDyG6aMntKZ0e3C+bPWX413Wf6IkQk2zlD9mYAxjDKDV
	sE+hYheHGoiE7WAg+pCtsQ2GEYSxvAlqc9cO4TBmXNFkaLx+Z4AXv3eCLgs5RYFSZ3KpM22sYAc7I
	XnRMAExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6zn-0000000Ctsl-3E6M;
	Wed, 30 Apr 2025 12:57:03 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6xq-0000000CtTu-18xe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:55:04 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5D2042540243;
	Wed, 30 Apr 2025 08:54:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 30 Apr 2025 08:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746017697; x=1746104097; bh=qW
	c4isue4hFDy/D7OaeR7F5B3QTCc+RTpjYWzMnZSys=; b=IpTYrnkDZfr1TughyM
	dCDN6nv1t2emyizbhDnal/4UO6xz9bKLWPc3yfzrel37YPXLdS7ToxgzFQCcZuTh
	3JkhVJgRTvft+pPfl1PPoTFCNHXB5cJybEj5Lx21yvW/yeMxEQEmZ9O8eHPgVclN
	9VVF2Z0O0dlPswTldOMw+Ljbb+JFBVP6i0fbETc4y7zZPskxcNP/pQMbibnCaJc+
	KCl/QAwA0M+RD3aLjHF7W9LIqXoymZBz0gwAeq9RNDdEMdkbIIcalxDfVjATAD3d
	gx5nQT4w8Xhm+/uCB/vigGghX4b4rsvHC1Y1bH+Eg6sJpwcO49aww173uZ+jiQB1
	1a1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746017697; x=1746104097; bh=qWc4isue4hFDy/D7OaeR7F5B3QTC
	c+RTpjYWzMnZSys=; b=rUFTkrMppAhi1MYn16KVWNcx0fV+PckM+m03D9JG0wjU
	I6Tp74I/rsFFIfr6EjsL6/NRTEauXChxLJ+eNyU176rCU94ut7I20PbTlOgx3PoR
	omzsl/cuZ0W6RwbRPU4Cytps/nMOfq0enly87HcmvjwgwWIVAYC4v0/o6gfsVfjF
	Uo2k7lL4vdSLq8BEQsY3u6bsizJryNcpH5Pj6BmbMzo/+8MSpzt/pc+7GVqwi7MZ
	86crSwSmA9S5WE3NuiAgo2HCIxRtgm9iIhbjUs0XSP90QSyaI55Kq3MMdVqxYOAC
	hKWb8i5JA+aLxKTVGlP/DtbgPa0Y/tRoCEJTgFyimw==
X-ME-Sender: <xms:oB0SaHHrBKBeElSfQSKQDbwqXpKGtXm6tni4xANrL4yRmZFew5AaDw>
    <xme:oB0SaEXhwd-nxgjHDyJqHLKu-OBo6DmekdTmt5vdPlAioCaAtJj7gRXYp9CuRcuM8
    6S1ES4mv6Soc-pV3sM>
X-ME-Received: <xmr:oB0SaJJA7e67m2ScmkMKMh2q8XoAf2EEmhOB8QGK7PkgQa-_rzu-Iu7oHEIEQvas2-QqmxsNfd1Qhc0N0LCytKtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrnhhivhgrnhhn
    rghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhg
    uhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuth
    hrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidr
    uggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oB0SaFEWg0ofivupDFQOpPdB9u9qIoeTtb8IYpRp3GGADYZ93xC_Kw>
    <xmx:oB0SaNUKzYzKF0BYaY97eY4K0d8yo0id64sCMTgnMQhGuy8xf5zdJA>
    <xmx:oB0SaAOXS16M4bjYe0rjl6k0alnV8OJQNh0vK94s_m1xTl9SE58UEA>
    <xmx:oB0SaM2PPVOMB-bTdxtuzSAGYflPej0TwxoOJyxYzQp3TXfScuqPmQ>
    <xmx:oR0SaFQ85yxc6_g9iq9mo9kp66BPvtRIDWfiy6La1ZC2By4Slb__oS0r>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Apr 2025 08:54:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Date: Wed, 30 Apr 2025 14:53:22 +0200
Message-ID: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_055502_923185_C2AD8477 
X-CRM114-Status: GOOD (  13.44  )
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

Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
frequency and pixel rate") the driver expects two specific
link-frequency settings 2-lane (445500000, 297000000) and 4-lane
(222750000, 148500000) operation. The driver fails to probe without
these exact settings.

Update the example in the bindings to match this to make it easier for
users to incorporate this sensor in their device tree descriptions
without having to read the driver sources when the driver fails to
probe.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index fa69bd21c8da..990acf89af8f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -136,7 +136,7 @@ examples:
             port {
                 imx290_ep: endpoint {
                     data-lanes = <1 2 3 4>;
-                    link-frequencies = /bits/ 64 <445500000>;
+                    link-frequencies = /bits/ 64 <222750000 148500000>;
                     remote-endpoint = <&csiphy0_ep>;
                 };
             };
-- 
2.49.0


