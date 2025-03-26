Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160D5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+nNwjWzuvNkREHvvhvrO0eWUH9hc78f5a/5U12q4Geo=; b=e6kfa+0y3VkvqdGwalCh84Ytcw
	vk37WHuWx1nyCn7aYPSIX+IK/atkixcDsbHAdDDhlP2pLhY1VMMX8ROoONF6HeF0hVSpqnhwg8VuK
	IE92F5va2XCPl/A+x4+pDJ1KxylMbKdG9hU3jqI9GaARxYTm/feLdeajYlIhDGISNbRXlr0eVUgb7
	scnSh19KCjuIrRYDHD1NalMdZmJt5ZGT9jaVXIBA/sgoBAZGhlNInkW+Uka4aLgpewd0jISx78JH1
	EUT63ezQTb7zIyXEaUb9B7XajFPy1aPma7YYiWivg7ihhp+Qzd51dcaB6Bvix2O3vHsP/4L2JBJ8+
	OE4ltTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV4v-00000009Ii9-1jya;
	Wed, 26 Mar 2025 18:02:13 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV23-00000009I2J-2mO2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:59:17 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 50A171140159;
	Wed, 26 Mar 2025 13:59:12 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 26 Mar 2025 13:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1743011952; x=1743098352; bh=+n
	NwjWzuvNkREHvvhvrO0eWUH9hc78f5a/5U12q4Geo=; b=dhLqSs8Dx4HmtnzqHo
	WT9tMYJ56QcYmspFLoPDJP06hKHaqRIQ6/enR5vOdotiY/FHC3tJSjiwQTtdKlCN
	spOUuinfHaGy5dojne5iqfDIeNj6XsPwmSij5c2OcsRsSRdW89PceEwip3wHxf71
	lZlqfu3qCLo0gt98HfWToYw1xfm0KV0M9eJ1RV3YwipuS8zg0ZBve+syMI+OJRiz
	3erSUATSafjPVnQ7ZCpDQH3mrsMTzjCogleolNt66f/reUttBNSyTNG6QWIjWkkw
	L0tnMhMA3G7KtiHvUMK6DAyyR51ojE+LTFiVukNGnwTKtRRVPS7SLB1tegcHchKp
	vomQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743011952; x=1743098352; bh=+nNwjWzuvNkREHvvhvrO0eWUH9hc
	78f5a/5U12q4Geo=; b=o1lA6Uqtp4ptLbg1ZvB2oPp5JENe4g71FlV5Oe12yMoU
	uwUNa1D3JMYVZo902OPblrpBqFbPqADOYZn/mMEfYX7FVOwVMiJVHIerHEcGefKP
	Dfqqc06ThvxKIP+A38iywCCniIluribv/lugfqA1bHVnX53huoH+AJq9jAW/pk20
	3DzHJ6YJlsGSN7MkYtv7atX0q9R8iH8mRbDcWDe+3Ls5uVVm64kcapgfA7KLCcOp
	AhC813FnORc577T8/OmQRzxoAK/2C1oT40vol4AC7rFUgAfsCp4VdNcjKj005s50
	JhWCvRgaywAvqlSuSOl7aJPvDvE6GxucGz9+u0oPMg==
X-ME-Sender: <xms:b0DkZ5ul_BsbNOD6BQRaIAfs7-BnGEqf2nXlVoEPa2iQ4zhXtpQWsw>
    <xme:b0DkZyfhNUTvWTeYYOsByAFrtR4abtQtvGPYwwBq7a529B43pOVpIHVe1LpoFf43u
    O9RZsRfuZO5cQZNYIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeiudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepffffffehuefgfefhudevgfelieejkedtffefieej
    tdfhvefgieeiveejueetfedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqd
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtse
    hlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:b0DkZ8w_jsxseN7UOMPTyF0-gD6ce-KOYK8NnkgDHnZklv_MLaKreg>
    <xmx:b0DkZwPe1eJMYCxfRUIDlYW1QLXCiR3LDN4PReguRdKRSljhsSJwqA>
    <xmx:b0DkZ5_9jTusg8zwzjNGItnYRFRbUWaijqrgqxjY8SMwXpOqKJ2ULw>
    <xmx:b0DkZwVzzB4q51t_t4xL1jO2iOJDlaXBZ7mehw9GxQqGoPSCFSRgvg>
    <xmx:cEDkZ0ZULJQ5O0lotlhr0XWi2MoyHu4QQguYbUC7BiSgkttNUbEeQW68>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B87142220073; Wed, 26 Mar 2025 13:59:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Mar 2025 18:58:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com>
Subject: [GIT PULL 0/4] SoC updates for 6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_105916_325727_5D2D592A 
X-CRM114-Status: UNSURE (   5.96  )
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

These are the majority of the SoC tree updates for 6.15, with a
handful of patches still waiting for a build regression fix.

There are a total of 658 non-merges patches from 165 developers,
the most active ones being:

     29 Nick Chan
     24 Sudeep Holla
     19 Krzysztof Kozlowski
     19 AngeloGioacchino Del Regno
     19 Alexander Stein
     17 Quentin Schulz
     16 Michal Simek
     15 Frank Li
     14 Ryan Wanner
     14 Rob Herring (Arm)
     14 Ahmad Fatoum
     12 Oleksij Rempel
     12 Ivaylo Ivanov
     10 Tudor Ambarus
     10 Markus Niebel
     10 Jimmy Hon

The overall dirstat that this time the largest updates are for
Apple's T2 BMC based machines, as well as boards with rockchip
and mediatek socs:

   0.1% Documentation/devicetree/bindings/arm/marvell/
   0.7% Documentation/devicetree/bindings/arm/
   0.1% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/firmware/
   0.2% Documentation/devicetree/bindings/soc/samsung/
   0.1% Documentation/devicetree/bindings/soc/
   0.1% Documentation/devicetree/bindings/sound/
   0.2% Documentation/devicetree/bindings/
   0.5% arch/arm/boot/dts/allwinner/
   0.1% arch/arm/boot/dts/amlogic/
   0.1% arch/arm/boot/dts/intel/ixp/
   0.7% arch/arm/boot/dts/microchip/
   0.2% arch/arm/boot/dts/nvidia/
   2.0% arch/arm/boot/dts/nxp/imx/
   0.7% arch/arm/boot/dts/nxp/mxs/
   0.1% arch/arm/boot/dts/renesas/
   3.8% arch/arm/boot/dts/st/
   0.8% arch/arm/boot/dts/xilinx/
   0.1% arch/arm/boot/dts/
   0.3% arch/arm/mach-at91/
   0.1% arch/arm/mach-shmobile/
   0.2% arch/arm64/boot/dts/airoha/
   0.3% arch/arm64/boot/dts/allwinner/
   0.2% arch/arm64/boot/dts/amd/
   0.6% arch/arm64/boot/dts/amlogic/
  22.0% arch/arm64/boot/dts/apple/
   1.2% arch/arm64/boot/dts/arm/
   1.4% arch/arm64/boot/dts/exynos/google/
   3.2% arch/arm64/boot/dts/exynos/
   8.2% arch/arm64/boot/dts/freescale/
   0.4% arch/arm64/boot/dts/marvell/
   8.0% arch/arm64/boot/dts/mediatek/
   0.2% arch/arm64/boot/dts/nvidia/
   3.0% arch/arm64/boot/dts/renesas/
  14.6% arch/arm64/boot/dts/rockchip/
   4.5% arch/arm64/boot/dts/st/
   1.1% arch/arm64/boot/dts/ti/
   2.4% arch/arm64/boot/dts/xilinx/
   0.1% arch/arm64/boot/dts/
   0.2% arch/riscv/boot/dts/
   1.4% drivers/firmware/arm_ffa/
   0.2% drivers/firmware/arm_scmi/
   2.6% drivers/firmware/samsung/
   0.2% drivers/firmware/smccc/
   0.1% drivers/irqchip/
   0.1% drivers/memory/
   0.2% drivers/reset/
   0.4% drivers/soc/apple/
   5.1% drivers/soc/mediatek/
   0.2% drivers/soc/qcom/
   1.0% drivers/soc/renesas/
   0.3% drivers/soc/samsung/
   0.1% drivers/
   1.2% include/dt-bindings/clock/
   0.6% include/dt-bindings/reset/
   0.1% include/linux/firmware/samsung/
   0.2% include/linux/

New SoC support this time is for variations of chips
from ST, Apple, Mediatek, and Microchip and AMD, as well
as the Morello chip from Arm.

      Arnd

