Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0738CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 02:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=femDdU3dFkH7raXEEbWZr4vlRHUvSpacG7TxMcsMD0s=; b=CMp/rqNUCr9SnUk8dCs5/0Ov6i
	68+09jacGZE9+u7cx2J8uBZAZbgQuwMWaBzxsaEydckPM69hhvuON8rkHLVzuzCpcyJfArHNxXHF6
	PVpIynMP6zBOloY7Plo8fICDwveboFw9Fe/MdoFYec5G0FVtAgnM7/u51LjClQSLf6GtABdFs1GBv
	NT2U26myDs5z0Fkgiqf65BRr6IGkURv6t2HRA9Xoe22QxMh0dRViF1BwdV01SRsIzxEOmBXGKHRBV
	eyGAULj2U2ZKHjWm4PLmnVqvMvxN6udYAjSLmJJsIKw+wI4Y5Lvys2+qKplftJXOSE4CHa0JPxqP3
	IX1YV01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Mt-0000000CQ72-3NxL;
	Wed, 13 Aug 2025 02:37:35 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1KK-0000000CPwq-2yvI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 02:34:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 2632B1D000C0;
	Tue, 12 Aug 2025 22:34:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 12 Aug 2025 22:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755052493; x=
	1755138893; bh=femDdU3dFkH7raXEEbWZr4vlRHUvSpacG7TxMcsMD0s=; b=A
	2yULsunFUAB3b6nVq/Ees6h35xmAyJnc+LLS1FB+iKSLrDUor39eGGUW19h71ugN
	ITDO0zNuIAzGIbH43/bMqwDfYOok8AuIsQ3cfuEEp4oDA4JlL5J4dFsfnYoT4kuU
	AWtMZYtU19uiVaDPwl4GhsfRQql6AVCiGJJZrDLBHaVw3wjkqJ4gH+9FM5Yny5mY
	mXLZ7Fu52+q+K9E08XerR4yEdqjioniPmuazG9s7Sm54lEmTnqihvhwvkvxAm5iD
	6KXGgiJsHkd42uB4IVXPtmK4IcMcBXKyBTSacxHUeN5XSTnqpQKfttXcC3a1XzqE
	k+qGWUHKzSEAsm2mDDvJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755052493; x=1755138893; bh=f
	emDdU3dFkH7raXEEbWZr4vlRHUvSpacG7TxMcsMD0s=; b=YqCWnBDz0GiSMx8Gg
	+NhLEyo61nXCNk3AAG6SMGI9MVPB9WzeMktIvI9pm8Sa/pNJvIP5tuS374w3RdTB
	9JvaNozRw4HSWw75Z+lEFIKvcZ8R08rd7Skw4ONvR4H9FWkIm7eO56Gf71+mYFgI
	aj8PVNnNa8GC3hKEStAeTNr5MuR+V8o2jtcT/fOrOnAM0+RihG4+lO0w92SRTPLP
	SLJ7IGEXJ7igTn1IqB7aqjXULoyYsStMrrFCOCNrjFrnmuJNzfr1RWuLx4nsbu5J
	ihARnOcZs0aq9tXuOPw7CVqF/5atflFUH9N5vYdU+/BPpVd643hF4uEAg2XO0PSQ
	vWWzA==
X-ME-Sender: <xms:zPmbaCH9pTmsJ9xaH96ciuMUvmh5BL1oB554T8bMOqGJwQXCXG8jBw>
    <xme:zPmbaKG9RygxKiqgcIEGE4bfmRM_Rj_xT_UXaBmrmMfxXiENzXPecWtT7nRkjKoa4
    Yh2Q1l0EJFs757Tyf0>
X-ME-Received: <xmr:zPmbaN5DCjxUSinhtlhgn0sBC2luZRDhwyU44si64RMHGsQlZYGFK1mpr7rfntPYE01mV_LQSCDCf6XRXD4Gp7FyNXbVlgjOEvt8ZN_yqusQlMExc8im2NfQdUCISTiCvwleO_MeIBP0vCQlb8D3xpvibJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejtdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zPmbaHwuHmUSHXJB4RDa6tSj7ObawUWisH5Ee_F341VmIB99y7Jtrw>
    <xmx:zPmbaEPoeZuD8stlj2eGF4tkYdmUfjsqiXDBWrKGnkGiaKUVT5Cvwg>
    <xmx:zPmbaFlG2HKrNmWXbQXrPyfkWYy83Is7FbJWbp4y000BAIquorjHQg>
    <xmx:zPmbaBSg906xG1EN7JGkZtdOj354xYg5hBjEScKNCztYQhcUUJ0ysQ>
    <xmx:zPmbaI8M693S2Kvt_Rc4Elq3EoRZMb_GGXuzleRxLY5Wa06EFcGY9Dn1>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 22:34:49 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 0/2] dt-bindings: mfd: add Ten64 board controller
Date: Wed, 13 Aug 2025 12:34:33 +1000
Message-ID: <20250813023435.27776-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20230501064727.8921-1-matt@traverse.com.au>
References: <20230501064727.8921-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_193457_231616_543455EF 
X-CRM114-Status: GOOD (  10.22  )
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

Because the nature of the device-tree binding was very
simple (basically a device on the I2C bus with only an address/reg),
I had submitted it as a "trivial" device. 
I now understand that is not the right approach.

I have followed a similar approach to two comparable devices,
"gw,gsc" and "kontron,sl28cpld". Unlike these two devices,
there are currently no child "MFD" features available,
but it is possible there could be bindings for nvmem or other
functions in the future.

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230501064727.8921-2-matt@traverse.com.au/

Mathew McBride (2):
  dt-bindings: mfd: add Traverse Ten64 board controller
  arm: dts: freescale: ten64: add board controller binding

 .../mfd/traverse,ten64-controller.yaml        | 44 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  4 ++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml

-- 
2.43.0


