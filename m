Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC0BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSMK+0z+lciYSqTdZxGlttwhMX/+UOX3vxLx+gHanqI=; b=X3SV6cbhUdWKdZYuYn4uovIoPA
	KXgqNTvl2DsM4tWcxQ/5AJNWbLRF/eORu/cSRBX/8vFreDuFRFOxAuRPAqBEHChDj7IGtjnxigw3U
	hNxOpc6YpvujCg4taat16sYUyNnElrF7GUUJrQj9ctCaUBs+tTf7ZZlBB9zKsWn8u1y0LPwW202HL
	i+YXmF6W2sUe7wjJYhrkJY8imIq6bt/gi5D7lkCUVoyv+9+4I4+OI9zYZmDm2vD+6lfdTSobHlEtY
	EIDdNYtqeEprJMtUNq/5Co27Anc4o/pDCXBxrtRzY0AnAS/QWx4g6RPNrQqlkNALXO2jTkhN5soAw
	tTE/BlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoybq-0000000Fw2X-1lt7;
	Thu, 21 Aug 2025 06:17:14 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyWH-0000000FvIr-3sRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:11:31 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 79554EC0064;
	Thu, 21 Aug 2025 02:11:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 21 Aug 2025 02:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755756686; x=
	1755843086; bh=KSMK+0z+lciYSqTdZxGlttwhMX/+UOX3vxLx+gHanqI=; b=h
	AADwq7cznn8DbO8oiVt8MP9LUyLE9L2IbTxrVnaO0KJJcXqyQMT5EGM8MD960wxf
	4FKcKuIhMm6xIfO3wF/VwUKf0GQVD1fmgx8Os9mKXSKzTmkZ+h5kF86hpyhpiWwx
	O4U8JmdZPRS91WpQ/kb6/2ynM6Kh6L0hObi8A7A/cGe3LT78h4awgGwDHlKZNTQa
	uv8fQZAcSppAUgOblrrWymRNUAKIrz3L3lcCHtRfheKGGBiF1yTFqEObKuTtHCcB
	yTawsB00uZ5rNS7lC24R/m528w8RSyglqZ1TMhLfLug67j76oVFRUUf9NEAQQ+fp
	7w7ECTuptmJSpbcKSa9Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755756686; x=1755843086; bh=K
	SMK+0z+lciYSqTdZxGlttwhMX/+UOX3vxLx+gHanqI=; b=OzDBlRPBX+aXDKDMz
	o0cNRkI8ZgMIFTz1BL8fgoM+pKOQcWJ/+wL6QGO+2KHPIgVajakZWYYykqqikeNI
	DLmL2RuvwWnH/5fbcjwCIdSILUHvvfRyehg6WGgiH5RvaQ1XH6RnQGYKJJcCd01B
	zsiltqUqr6GbAaP3rSdnR1c3qnNUs1PMj8lGzRetYrC+lanpZaCazdEczajsiCeF
	GVtIcKjozCH8tBbvixEW+i5OLDalq5gGsXB+KfDZesN2vvRJ28NjR64YSTJtTGUr
	cSV3QFOBhS+FFx4UrSC2L5EmuB+jAMml7zsJXdQPBCIJqfsSO8gq4N/+C0YLnQFG
	ky2zg==
X-ME-Sender: <xms:jrimaCsIj0aakceg_Vsdv7cuhsgEMZaoBBJ77wlYXlbx0Q9CAZnlGw>
    <xme:jrimaONspODL0heJ7zmQDtS_y1CgUrQgRbbdJzR0adtimM2SQrY4QjKmaJwZhO9hM
    zenxs8TvddVzAibqxE>
X-ME-Received: <xmr:jrimaPguzs3PETGmbVWWtbNb1mubUbQByDw7sK69d-QfJGDaqLd7oSr_OKiFI0N7gxYV5GCcq-ncDAMX1r11H_NGiKJ1wqIn5U7UKe-FqJUheEIhjwQZhEw1kiZ8PqgG3LkEGVSzX5i5lNKzn0ow45NXyXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpefhteehkeektddvveejffetleevkeekfeehieffleeikeduveehtdfh
    keehhfffffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgrvhgvrhhsvgdr
    tghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrth
    htsehtrhgrvhgvrhhsvgdrtghomhdrrghu
X-ME-Proxy: <xmx:jrimaI6kusII9f0QZaesjlzRteveMzMJNpzqlN4Lw-pxiRgW1Yv6Aw>
    <xmx:jrimaO1ZxH0z84bYihH5ZWPZ0Bd64oMvl5H6l7jf1IoOTMUfNiI3cw>
    <xmx:jrimaLtnYeNWvz6s1DWcSjUdU2_wsO4OeyuU9eabwAH77Ik6YAwtVw>
    <xmx:jrimaM7isC_FooADj9JKQ8Ql8-yBGmQONuIf4YBWlY8XJltW6_Y6kw>
    <xmx:jrimaOlq-GttWL9x67ls388GfHg9AEfa_kbH2tfYS4oNY4qhDaob5xZp>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 02:11:23 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v3 0/2] dt-bindings: mfd: add Ten64 board controller
Date: Thu, 21 Aug 2025 16:11:13 +1000
Message-ID: <20250821061115.18254-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250813023435.27776-2-matt@traverse.com.au>
References: <20250813023435.27776-2-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_231130_632737_2F7A88AD 
X-CRM114-Status: GOOD (  11.64  )
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

This is a rework of a binding I submitted a while ago (2023)[1].

Because the nature of the device-tree binding was very simple (it is an I2C
device with no configuration parameters apart from the I2C endpoint address),
I had submitted it as a "trivial" device.  I now understand that is not the
right approach.

I have categorised the controller as a MFD device, following devices of
a similar nature, such as "gw,gsc", "google,chros-ec" and "kontron,sl28cpld".

Unlike these devices, there are currently no child "MFD" features available,
but it is possible there could be bindings for nvmem or other functions in the future.

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230501064727.8921-2-matt@traverse.com.au/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
Changes in v2 (2025):
  - Create dt-binding yaml file and categorise as an 'mfd' device
  - Removed the unrelated MMC controller fix, which will be submitted separately
  at another time

Changes in v3:
  - Fix typos and style issues in yaml and commit message
---
Mathew McBride (2):
  dt-bindings: mfd: add Traverse Ten64 board controller
  arm: dts: freescale: ten64: add board controller binding

 .../mfd/traverse,ten64-controller.yaml        | 45 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  4 ++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml

-- 
2.45.1


