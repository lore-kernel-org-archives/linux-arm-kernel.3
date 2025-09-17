Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EBACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tq12pRtdmB+gysuIH+PKSklm1eoRKn+fCbhmqtPHAS4=; b=Lp0GlaxHQLXZE0xjklnv25Uumt
	dIzV/hvqmhVDdbpjDAMrGkmXJEQVGaofjjhnU5WifvNGFqxrQbM9haXs9CnrGxmeXyS2ZhA+iLtH6
	7GIL1cFlFZALKg59hQxDHkWXislnO4c/zSDgGaUv5TS0VkUHjxIuRxp9WwSUDVJXkJ5fswW/RIAbM
	YZfYPYXTnfwmzH9NP9eD/ndG744FbXnLFNOV48imZkqVbqCUZsgYelHo9iMf4nGU/opA2XENApWbP
	ibm+zJFv5oMPNT/u9yUVRnY0vCnhysKHAhYfdXy1YzWBXCeRUqW0SVLXJfOhmSCuVAlXED4LSK6j6
	0w2CHP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygpx-00000009pFf-1yDp;
	Wed, 17 Sep 2025 01:19:57 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygpt-00000009pE9-3voC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 01:19:56 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 32C25EC021D;
	Tue, 16 Sep 2025 21:19:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 16 Sep 2025 21:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1758071990; x=1758158390; bh=tq12pRtdmB
	+gysuIH+PKSklm1eoRKn+fCbhmqtPHAS4=; b=cSxkQ6vDx15lCbXzTIm0Itpmgt
	yVaXRaIldjPmanmt4MsdnmPdCRlyEpv4tw5FUpShxCHfCZDoEP7kKJt5sTOIgfGS
	xETJvdyoMiQxPdt4boPryw3ULU1LTCg+gmfL3iVishPKYNmPrgfy7OjYRpCjfowt
	w10Fap6mRI44EXJn0VXTNqLYRftpgmADm8a52SLOk9H2b1OYxBpSKbzKyhjqUOPO
	jOmJ14NfD0/JvK42koHbX4sqn1ooXY66E164p4u7cYkyOCCxciviYBIxvCv62wRl
	XBioLQjK3PMsS/AJUgxN6a+RoAJZvKSrIWRVwv+wbbY2VB9rpLPZ4mkSkktw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758071990; x=1758158390; bh=tq12pRtdmB+gysuIH+PKSklm1eoRKn+fCbh
	mqtPHAS4=; b=VEmzU1W2TzmOPv2GeDCK8r03AAu1VA3IVqjxclv2hhFf111whit
	RfYLj+svIAcgXPb1bxwjQOzIsOzZ4QMh5KvshXhdKgraE/RBG57l65fMAUl9olLj
	PHwbu6ckjYbpSysiEgOKLXH0HeMiCS4/aVBfbkhTTbohvNtC78DjKX77GdGkyKzA
	+o3TcCn/TZF/9yzdZtUipUt+oynlLWUO4XQG1isfi0qrX+QeGfH2iDDcP8TalYXa
	fc8SfCFKGWVcsNcyQgX7iAQbVCTG0Jh61v0gK195uTehN5hkHUdDWIeWhK3d00Gg
	yw4G5SfKEGykyIg/YTdvls+zvENgSlnKavg==
X-ME-Sender: <xms:tQzKaPK5oYnRblu_VxCZNh0wT7bX6sRTHJoZVgMaxGBmwPaTmmeK1A>
    <xme:tQzKaJ7oxrCr9d6EIfsNkb0MQXbS0R1UyhTu_4g5E2NG7ZsToIJ_TPqFKyu87qWUI
    WNij2Xn8kv8s4_eCio>
X-ME-Received: <xmr:tQzKaJffCqJ47n7xb0ZF43WdARhp6nzIOWSuug7RjHV-KvJqbi96HwiXpApUPFJkya0mHZ4GJNKbLtObA93fNaul9ImWk-LXo6DBSTsNGauwxTOq2CyvTzKrFrJAiSnfLh4_z8UYEDZlbo3L77sG6wLD_a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegvdduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforghthhgvficuofgt
    uehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrfgrth
    htvghrnhepgfeuvdetvdelgfdtvdektdevvedvfefhgeffudevvedtjeehtdfhgeetleeg
    ieelnecuffhomhgrihhnpehoiihlrggsshdrohhrghdpthhrrghvvghrshgvrdgtohhmrd
    gruhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprh
    gtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghvihgtvght
    rhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    gvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhtsehtrhgrvhgvrhhsvgdr
    tghomhdrrghu
X-ME-Proxy: <xmx:tQzKaEGy1Fv0oisVFKfjCKA9DnPEykoEn554_i-Fzx8aA8OJ7EZf7g>
    <xmx:tQzKaCQBL_E0u30SXNM-S9lDxub3TT0SZUZZMs5sVYHy6C4MbMpe-Q>
    <xmx:tQzKaCYEurLaMylrHUvFj7QR9LACPNuP7ad9cXp4cJ7asDIPFnXtvg>
    <xmx:tQzKaF2elxF53q4EEeNpBretzi1Sqc6r5mbG7wYWqT-ScQNY3b2yfg>
    <xmx:tgzKaGgHvKDqCouhv2KH5ebbAiF6gzzEnQSvGYkoLcI73uzQFqhSoquI>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 21:19:46 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v4 0/2] dt-bindings: embedded-controller: add binding for Ten64 board controller
Date: Wed, 17 Sep 2025 11:19:38 +1000
Message-ID: <20250917011940.9880-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_181954_573189_DD3CE9D6 
X-CRM114-Status: GOOD (  11.58  )
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

This series requires the "dt-bindings: mfd: Move embedded controllers to own
directory"[1] change which is in mfd-next for the 6.18 cycle.

Changes since v3:
- Move to the embedded-controller directory (which was created following
  the last submission)
- Remove the extra paragraph in the dt-binding description field
- Const'ify the I2C endpoint address (only one I2C address is implemented in
  hardware, 0x7e)
- Fix the description line of the fsl-ls1088a-ten64 patch (s/arm/arm64)

v3 series:
https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20250821061115.18254-1-matt@traverse.com.au/

More information on the board controller can be found here:
https://ten64doc.traverse.com.au/hardware/microcontroller/

There is no (presently) Linux kernel driver for this device, but
it is used by U-Boot for functions such as reading out the MAC 
and controlling some devices on the board.

[1] https://lore.kernel.org/all/20250825081201.9775-2-krzysztof.kozlowski@linaro.org/

Mathew McBride (2):
  dt-bindings: embedded-controller: add Traverse Ten64 board controller
  arm64: dts: ten64: add board controller binding

 .../traverse,ten64-controller.yaml            | 40 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  4 ++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml

-- 
2.45.1


