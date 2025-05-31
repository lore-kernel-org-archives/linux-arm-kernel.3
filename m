Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470D8C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2OWAw12JJ0u5E469a4fqtcOE7dGCErKVTCQFCBSYSA=; b=0OUBWdSA7Th9/nRVRosxnV+vz4
	ceO0G8w+JcBWFLApXF4qK9vQBk33l+kxJie0/6PKHqZtcGBeoVPlOKFXQBfJqDxwem4S2kBf2iAIG
	Ez3/HsabZ1QocBc16ZvpaYppPcL2bEz5rCK9oxcmBga+Lu3uO0QqECXEjaxXjyY+kju2FiNvBzo6L
	u1+IWXQI58bHOhrj/D7nQd8773xrl/rqIg+wjTOFt1XMmir0u60ef8c/lPvjI13zQEykh0IPRMu4I
	52n9w9Fl9NM4vb78WwHf1OW0zVlJP0gkSTK5v86gO3g72okuEWlveP0icQJ7/iPV7eKQ6vq1NvsGY
	SaO9aAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLI6I-00000003YVV-3GBv;
	Sat, 31 May 2025 09:01:58 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLI43-00000003YNx-3gsZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 08:59:45 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 013441380333;
	Sat, 31 May 2025 04:59:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 04:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1748681975; x=1748768375; bh=p2
	OWAw12JJ0u5E469a4fqtcOE7dGCErKVTCQFCBSYSA=; b=3bWKtsECNZBBINyxHb
	Yg/af0K6EOmegEQ00ktZZ6d+Cd8S9KN6wOmQq0SZsMSbUzIWkjgSOMxDaXs8fbct
	KqbkrgugaDLcU0rBOqr8/B+Q5RnSzOXNQMfP0wOZ7Zec8nufmNMpBS23OVC8NxWL
	+4QDygZVvLjRReCRqfqddUcYR/eAHVjtvo4/pP7AJxBX+gMMnzdjFepj0Og/qgyE
	mW9pBOuSr4NE+cQwQrSnWjyy+bLyuLAbxjMsJG983dCkiGezgCoIzkVP36v/72O/
	21ugfkBmL2IQN2NToXykdep47JxI/BSpmt5vBjbyjYIvkz0aKMZz4TvOrEyyNvKR
	2jYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1748681975; x=1748768375; bh=p2OWAw12JJ0u5E469a4fqtcOE7dG
	CErKVTCQFCBSYSA=; b=KkwGW0n1jMpMmFnUOjY+0uzOUboxNjb2ruo1iPJARwwB
	V2hlovINQUzE8pcqt4KDIoHyJs/Osg3XYuM2Wrqs8s4UuHWPefewrXS+zyUTwYRI
	bYsbI5spawBiNfPOx0oMBtON4+9STpxEoFpgpGLmFJLDdwWsY4aSYtwAWQz5accd
	6EpnPWXjB0eRVAO1Qe+Ar1REsdnWfGeFHyqFgsIJcB10IS81vniGExSseMWYdMKQ
	K0UFkjfC4mc6VHzGgTgYSirpeFt4wGMB4KJZ5uN3jhjhjZ4+QUuD//0jJ7rJEutQ
	xDZzXjxaoCABu7Lv4CqWqowu+gxgf1hEkSwQTwws7Q==
X-ME-Sender: <xms:98Q6aO8_CPwKy7ijfKw5fcwP8BDfRBXoLPBSPImaUEho1ks_Dns4GQ>
    <xme:98Q6aOsOPjPqhPJ2DobMEtRLpxhGsOW1ySduX0zUYvcATZ4z-WxxOPcFIUGYiiI6a
    JmJQ2VR7DpkBXZWvd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeffffffheeugfefhfdu
    vefgleeijeektdfffeeijedthfevgfeiieevjeeuteefvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvh
    grlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:98Q6aEDU1xSi2iUqgjUyh1SNtfZKhy5BDS5m6FnHWeICol_AGRK4VQ>
    <xmx:98Q6aGdLejjtIVQbHd0d0Xix2qtJzDwsHa8vwwBSIwMCLiCowy3pDQ>
    <xmx:98Q6aDNpCP1tVUgKZzbtgAv4Upz2kCKwkCL8bT_jlY4UgEPSYqB07g>
    <xmx:98Q6aAk5AwFW4HkJkPDX_e-Tjv6Z1vTHa6akHrCjSGlVMOXq89p_fA>
    <xmx:98Q6aHG5AhKlmrby7wrWsywVVqiGioZSh3eq7qVwbIIEKAt3GPFvU-lI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BB54700060; Sat, 31 May 2025 04:59:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 31 May 2025 10:59:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 0/5] soc: updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_015940_410685_9ADEB7D1 
X-CRM114-Status: UNSURE (   7.34  )
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

This is a fairly large update for the soc tree with 1125 patches,
mainly because a large part of the qualcomm changes came too late
last time. Other than that, there is not much interesting going
on. There are 65 new dts files for additional machines and 12 new
SoCs that are all similar to already supported ones. The sophgo
SG2044 SoC support comes in a separate branch to avoid a backmerge,
but it's also the largest one of the new chips.

The summarized dirstat is

   0.5% Documentation/devicetree/bindings/arm/
   1.6% Documentation/devicetree/bindings/
   0.4% arch/arm/boot/dts/broadcom/
   0.7% arch/arm/boot/dts/microchip/
   1.2% arch/arm/boot/dts/nvidia/
   0.7% arch/arm/boot/dts/qcom/
   0.4% arch/arm/boot/dts/renesas/
   1.3% arch/arm/boot/dts/st/
   1.2% arch/arm/boot/dts/
   1.2% arch/arm/mach-davinci/
   2.0% arch/arm64/boot/dts/allwinner/
   1.1% arch/arm64/boot/dts/amlogic/
   4.4% arch/arm64/boot/dts/exynos/
  15.7% arch/arm64/boot/dts/freescale/
   7.9% arch/arm64/boot/dts/mediatek/
   0.4% arch/arm64/boot/dts/nvidia/
  24.3% arch/arm64/boot/dts/qcom/
   2.4% arch/arm64/boot/dts/renesas/
  10.2% arch/arm64/boot/dts/rockchip/
   0.3% arch/arm64/boot/dts/st/
   6.6% arch/arm64/boot/dts/ti/
   1.2% arch/arm64/boot/dts/
   4.1% arch/riscv/boot/dts/sophgo/
   0.3% arch/
   2.6% drivers/firmware/arm_scmi/vendors/imx/
   0.7% drivers/firmware/arm_scmi/
   0.7% drivers/firmware/
   0.6% drivers/memory/
   0.5% drivers/platform/cznic/
   0.4% drivers/reset/
   0.6% drivers/soc/amlogic/
   0.6% drivers/soc/qcom/
   0.9% drivers/soc/
 939 files changed, 79999 insertions(+), 11861 deletions(-)

We had 264 contributors this time, and the most active ones
by number of patches are

     72 Krzysztof Kozlowski
     38 Dmitry Baryshkov
     30 Luca Weiss
     29 Konrad Dybcio
     24 Stephan Gerhold
     23 Wolfram Sang
     23 Neil Armstrong
     22 Heiko Stuebner
     19 Johan Hovold
     18 Rob Herring (Arm)
     17 Primoz Fiser
     16 Siddharth Vadapalli
     14 Francesco Dolcini
     14 Andre Przywara
     13 Chukun Pan
     13 Biju Das
     13 AngeloGioacchino Del Regno
     12 Judith Mendez
     12 Inochi Amaoto
     12 Dzmitry Sankouski
     12 Alexander Stein
     12 Abel Vesa
     12 Aaron Kling
     11 Adam Ford

One simple merge conflict came up in the drivers branch, where
a bunch of updates to the MAINTAINERS file clashed.

     Arnd

