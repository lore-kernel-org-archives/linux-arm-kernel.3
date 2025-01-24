Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E07C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QPGwMWujuyUFGWQ2AiU4lgYGxPGOA3tum5c0rNS1aFg=; b=l3DVyR/wW0sPzAxaymy6A/As7l
	xFNt321OK/Z3qO5F47YtWg+wW1WMrEIaKcwEDCMTqH5bK590Z1eRdMA5zfX9KOPZP+C1HHKfZFWJW
	E/Sg/yFesDKy3lopEPzTR3Uqf2txe1HuRwUe27d0q7F68BNnfVtvC4+okSmg7RFxZncKLGzU6zsaH
	VgCueBSg1X/ViipjmLxNWfzyWltrceFqZPdIfBURCLJxqQaiRA2JkbPv34qBLNJkIZzZClrE9ttr1
	NsDua1k+pC5benXVY3w5kMVphZ+ouFYQFJmj3ch4urejVDxmMXYpkesbpqvYdw/cBBSZHrZyedQf3
	gg7DxraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLDC-0000000EuH2-3tSG;
	Fri, 24 Jan 2025 15:03:10 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLBr-0000000Eu9d-2UqI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:01:49 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4202B11400FC;
	Fri, 24 Jan 2025 10:01:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737730904; x=1737817304; bh=QP
	GwMWujuyUFGWQ2AiU4lgYGxPGOA3tum5c0rNS1aFg=; b=uurm+ATGl0FLyUMdmy
	hhqa68BeP30jH5+DFKLDn7zWXwIE9lr/r0FClSLXCU2xoknux/8yHjSVDfaM/IHz
	hp0fM+kSY7ShwDYx3ytKzICeO3v9KcIJpo29zde0FblryZcL/nxH1bKF6EPJHDHH
	VTxE3zKGG0tg46Gm2Mux0QrtFyZVqmHN5t8swb9BhBNmvQXM1OrCgcoUde/1hmg1
	7J+gVCcUXJ2SINkrJheBayOrMjjIBrJRgVgxiuYVgOgfhRHsLSRphGXR94fx6Lay
	/sGDHJIP2d+mMYDcWwJk5SCxMtFHrqLqwk66A4NU2T+vzeF7S/qGuyspjdSaveQ0
	2WIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737730904; x=1737817304; bh=QPGwMWujuyUFGWQ2AiU4lgYGxPGO
	A3tum5c0rNS1aFg=; b=SAcx9BIZsKuW7qFegVivLGGS0tMd72Nmk4XHZH+vpImV
	9Tffm763s7mLutZ118ge4q6OWp3r8nCCDmPnlsZfPY9Eczz7H30elw1QKZ89z+rH
	PfbPbX4PE4CocHq6yD9II54z+8gTm9NqlycDGDes97TXppCRK3hkEJzBILr5tQm5
	P1/rDrFVsXCGeonrKz7DGE0QZBW1pSbjgzCRAcx6QCQxqmIusjEXzENUKvpBvVaH
	dVejA5CGotzzlybfIL0qgcF/FXkyGpWPIWbyrtfQ7wQfN2/VCRtwwxFsha00zR0L
	HYE+7I7gZRjY3eRPsbfo2nQglN1iGOfHSUHU5kapnQ==
X-ME-Sender: <xms:V6uTZxEIJkpTq0Nnv5Cuz3RdzTwC886zEfda8HOm7tgt47i24imF4g>
    <xme:V6uTZ2XREjPDtqCRSkfsX9Ku4fOoSC660dbM23BHm1TTQyG3VcdH0YnUOg2WU-3RL
    qswBspf-8PFhD6squ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeffffffheeugfefhfduvefgleeijeektdfffeeijedt
    hfevgfeiieevjeeuteefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfh
    houhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhn
    vghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:V6uTZzI-oD2BJvWT5ZsIFmooUGntW6tB-zqrxl5BITlgGaK-o7A0WQ>
    <xmx:V6uTZ3HTFiyAl9IECETnSytqJ2rPZ8o4sgDt1kVCyJE0Az6fPzyMRA>
    <xmx:V6uTZ3VRH25ZxQUaYOHRDrGCmXkH12N74kFFi0IJWdP75nmbtwKU7Q>
    <xmx:V6uTZyNpRxVidMZyiR4zrIIU0ZwfWRLn5aMhkjSjAL7X7Vw6R6EK4g>
    <xmx:WKuTZySwOO2zCA603S0aFj3aj4PwdIoYfZUHAOD1Al4DllDiXsD1HSDy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A7F302220073; Fri, 24 Jan 2025 10:01:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:00:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 0/5] SoC changes for 6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070148_560186_120CA6EB 
X-CRM114-Status: UNSURE (   8.24  )
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

Hi Linus,

This is my set of branches for 6.14, a bit delayed.

There are 743 non-merge changeset overall, so it's one of the
smaller cycles for us. The Qualcomm updates make up about
half of the patches and the source lines, after they had
a few quieter releases.

Two new SoC platforms are added, the Blaize BLZP1600 and
the SpacemiT K1, so there is a branch for just those two.

There are also 11 other new SoCs in existing platform,
which are all part of the devicetree updates.

In the dirstat, the aspeed platfrom also sticks out, but
that is just a single devicetree file for a particular
complex machine.

   0.5% Documentation/devicetree/bindings/arm/
   0.6% Documentation/devicetree/bindings/clock/
   0.2% Documentation/devicetree/bindings/interconnect/
   0.3% Documentation/devicetree/bindings/
  13.0% arch/arm/boot/dts/aspeed/
   0.4% arch/arm/boot/dts/broadcom/
   3.0% arch/arm/boot/dts/microchip/
   0.2% arch/arm/boot/dts/nxp/imx/
   0.9% arch/arm/boot/dts/st/
   0.2% arch/arm/boot/dts/
   0.6% arch/arm/
   0.4% arch/arm64/boot/dts/blaize/
   0.2% arch/arm64/boot/dts/broadcom/bcmbca/
   0.4% arch/arm64/boot/dts/broadcom/
   2.1% arch/arm64/boot/dts/exynos/
   3.1% arch/arm64/boot/dts/freescale/
   5.6% arch/arm64/boot/dts/mediatek/
  47.4% arch/arm64/boot/dts/qcom/
   2.7% arch/arm64/boot/dts/renesas/
   9.4% arch/arm64/boot/dts/rockchip/
   0.5% arch/arm64/boot/dts/st/
   1.2% arch/arm64/boot/dts/ti/
   0.2% arch/arm64/boot/dts/
   0.9% arch/riscv/boot/dts/spacemit/
   0.5% drivers/firmware/qcom/
   0.4% drivers/memory/
   0.2% drivers/soc/imx/
   0.2% drivers/soc/qcom/
   0.5% drivers/
   2.0% include/dt-bindings/clock/
   0.2% include/dt-bindings/interconnect/
   0.4% include/

214 people contributed patches, the most active ones by
number of changesets are:

     40 Krzysztof Kozlowski
     29 Frank Wunderlich
     27 Dmitry Baryshkov
     23 Ricky CX Wu
     15 Stephan Gerhold
     15 Konrad Dybcio
     15 Chen-Yu Tsai
     15 Biju Das
     14 Krishna Kurapati
     13 Neil Armstrong
     13 Geert Uytterhoeven
     11 Prashanth K
     10 Claudiu Beznea

      ARnd

