Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8249D743ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 22:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xeOHpXlzAJD44WoT0DuFPbZEIKnuN7VOKl/I9OA3OcQ=; b=ySwfoGXZA8GYRa4oqRpQ+8Fzd4
	6HEM2ZVzdPBd99BJD61ruFqpcAV2aAjrBzU8UhbDG1mJRaVYy0mJpYV/xvf2ChmlKMzbRHaaHi8qp
	5c6jAlhOnGB2OSd1j2zB9pVfSyPDCLyPanXLx5bNg+Xc8ZL+7gNr9OT5HS/UUqtg5QIeElbaSeDCb
	X0OsYP5zs+ekG2SCI2MB79CfNXM01b+pG4mb+sYPewLS0bzMMmwrKPrPFfsYCkTZBfL6clGY38Ra6
	r4SLM0N6A1iL9blWTozKkK3vOvcLe6DCh7hhVp5vk1iY4jMUiZAVoauqtMiMMR3l1vkMXmPIsx2ue
	//iBfZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtfH-0000000GNNx-1YpX;
	Wed, 20 Nov 2024 22:59:15 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDteL-0000000GNLc-0aUL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 22:58:18 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B4B6A11400EA;
	Wed, 20 Nov 2024 17:58:13 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 20 Nov 2024 17:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1732143493; x=1732229893; bh=xe
	OHpXlzAJD44WoT0DuFPbZEIKnuN7VOKl/I9OA3OcQ=; b=H4yNQuaQ2j2CuaTNNo
	VgaIn0oq35XnNt3KdxrlCoMGJOdbtA5d5ZbguUtTIbAwrXiMs+lQZCpX2BoRNLyo
	xv0M4BmXpbBjUiDswJN+gfMcm6jv0pQPObsBvPzZ9dQWenI1mDXgM8Oe3biyPRkE
	N9QFW2yAG9LvTUV9KPNi2881sf1rwpS2IfEW/8mvkZlajVQoFfl9r7e4n2XFVh4/
	aAS7w/9XmM4i404Vzvob3cSPk2Df8caeS6Djl9L9jLfwn+iO8uZZafoOK4fRtQeB
	m6xQ16/SeVeYIi9ukkt3y96g3t/Z60ZCv09j6NGflskoUjEUOJb8NUx/zANSp/ez
	mxmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1732143493; x=1732229893; bh=xeOHpXlzAJD44WoT0DuFPbZEIKnu
	N7VOKl/I9OA3OcQ=; b=QAGB7CUhPbO502RxEZiQeaRBDysiqntvudgLdZaDxHo+
	A9ZV2QnNwL5MoSz4zcgGLadqd1qh3vGViXrviT5KrN0zhbAlUw6v3no3gdwL3Tj6
	n3bRvTqdx9ZcjnlIknTWUCevFkNxmPSRkVjOyFIDUHEGCn7KdHm+N3IsYf4WF3qs
	sF/4+cz4lQNaZVDGKWr/NAtaRnBayHRr8rKwq5oVpXsY0IrxYLNDL+RDMx7GTZF4
	EWp6BWBlpINek8hPB2wgSAGDN+Win2kYzNW+b6PjxkA1tFa4UIb7f/rz+tNkjaG+
	6R6Q0dxLgQxHTlhjwPwm+nx4IB5jh1ZGC1KIUIpY/w==
X-ME-Sender: <xms:hWk-Z1wGWmyq0jnK0nYtrYkvK4nnyDtG7YXbOAaHGd84XGwTlAYIug>
    <xme:hWk-Z1R50fDZbCHL_uby1cMkbA3Gpql6lSYnlpmnYEvJUZsUnWux1h7zVWDU4ap0L
    fZ71YaYA61VvS4H8Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeehgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkufgtgfesthhqredtredtjeenucfh
    rhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqe
    enucggtffrrghtthgvrhhnpeelveehkeffgfdtheekveehhfdtheefkefggeekheeuhffg
    heejteevgfdtuddvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhish
    htshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hWk-Z_V4AmXAYSjsWklDl99CZ-SU_kMp0lirRUX5ZrjcpoF56Dij9Q>
    <xmx:hWk-Z3gKeXeeamCe_HawyrCuTVg_DvYNc--dd5njSkBh6Dzpwet8nA>
    <xmx:hWk-Z3AJ1ZAXfWo74g_AGalaie9wqRSdBjmVDCULPahowE1w36wXXw>
    <xmx:hWk-ZwJBVmUd-w7XbM6jzD_q_ZhYC-NM-jMpg3W1NUlm6AAM0Do62w>
    <xmx:hWk-Z-MEcSte231BCKXp6Y6hn5nTJIc6NVOY4T1vjfSRxezlmT4an02M>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 77E822220071; Wed, 20 Nov 2024 17:58:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 20 Nov 2024 23:57:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
Subject: [GIT PULL 0/4] soc updates for 6.13
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_145817_655258_18D6BD7C 
X-CRM114-Status: UNSURE (   7.25  )
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

The SoC tree this time has a moderate 840 patches from 203
contributors. There is not much remarkable in there, overall
we have a lot of new SoCs and board files in the devicetree
updates, but not as many changes to the Snapdragon platform
as we've had most of last year.

The most active contributors by number of patches this
time were:

     32 Geert Uytterhoeven
     29 Krzysztof Kozlowski
     26 Marek Vasut
     26 Konrad Dybcio
     23 Frank Li
     22 Dmitry Baryshkov
     21 Fei Shao
     18 Wolfram Sang
     18 Fabio Estevam
     17 Manorit Chawdhry
     14 Andreas Kemnade
     12 Nick Chan
     12 Neil Armstrong
     12 Jo=EF=BF=BD=EF=BF=BDo Paulo Gon=EF=BF=BD=EF=BF=BDalves
     12 Ivaylo Ivanov

and the overall dirstat shows nxp, qualcomm, rockchip
and ti as the largest changes, with only NXP i.MX6
still seeing a lot of work on 32-bit boards.

   0.4% Documentation/devicetree/bindings/arm/
   0.5% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/soc/mediatek/
   0.2% Documentation/devicetree/bindings/
   0.2% arch/arm/boot/dts/allwinner/
   0.1% arch/arm/boot/dts/amlogic/
   1.9% arch/arm/boot/dts/microchip/
  17.7% arch/arm/boot/dts/nxp/imx/
   0.5% arch/arm/boot/dts/qcom/
   0.4% arch/arm/boot/dts/renesas/
   0.7% arch/arm/boot/dts/rockchip/
   0.2% arch/arm/boot/dts/st/
   0.3% arch/arm/boot/dts/ti/omap/
   0.3% arch/arm/
   0.2% arch/arm64/boot/dts/allwinner/
   0.4% arch/arm64/boot/dts/amlogic/
   3.0% arch/arm64/boot/dts/apple/
   4.5% arch/arm64/boot/dts/exynos/
   8.2% arch/arm64/boot/dts/freescale/
   2.1% arch/arm64/boot/dts/mediatek/
   1.0% arch/arm64/boot/dts/nvidia/
  12.6% arch/arm64/boot/dts/qcom/
   0.7% arch/arm64/boot/dts/renesas/
  19.6% arch/arm64/boot/dts/rockchip/
   0.1% arch/arm64/boot/dts/st/
  11.4% arch/arm64/boot/dts/ti/
   0.1% arch/arm64/boot/dts/xilinx/
   0.2% arch/riscv/boot/dts/sophgo/
   0.4% arch/riscv/boot/dts/thead/
   0.1% arch/
   0.1% drivers/firmware/arm_scmi/transports/
   0.2% drivers/firmware/arm_scmi/
   0.4% drivers/firmware/xilinx/
   0.8% drivers/firmware/
   0.4% drivers/misc/
   0.4% drivers/reset/amlogic/
   0.4% drivers/reset/
   0.5% drivers/soc/hisilicon/
   0.1% drivers/soc/imx/
   0.8% drivers/soc/mediatek/
   3.4% drivers/soc/qcom/
   0.1% drivers/soc/
   0.1% drivers/
   1.1% include/dt-bindings/clock/
   0.1% include/linux/soc/
   0.6% include/linux/

