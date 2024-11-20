Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5ACD743EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tOl6rSvZsKNggveupEMbGpTcJr/+iEv+wbu7ZX4M4o=; b=I+tFG0dYMnbaZlUvWexirAa3g5
	gRDSr3VIWIz+vRRsahLNTnuq7oGD0ytCdg77GJHIAwPcvNcbAHOjClOf4/WuLuqXi+7NLeaMOXV0A
	5FrKs7Mdc9vx+cOKj9xE6q8Oroh6pMT5WwofmRaY9v4ierIkLDzO7oJyLnW9JDMJTDWyVbRZL0lSB
	3zEtN3d8ISm2iR3YMtwnIuTtgNgcZCyxtg6sBuvroqaOIZOKURll6adtaIDxedk4BcL4pSj/s8hDT
	FaPE4HZ870pgapcLUsxIgtWxX/gw9WgEE50RrDgMtUZm/xd/58fhHJEf0yOfiSKRykxSsCajh7ez0
	5EZkmARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtjY-0000000GO2g-2TzY;
	Wed, 20 Nov 2024 23:03:40 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtiZ-0000000GNoJ-0nPu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:02:40 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8CFDF114011B;
	Wed, 20 Nov 2024 18:02:38 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 20 Nov 2024 18:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732143758;
	 x=1732230158; bh=+tOl6rSvZsKNggveupEMbGpTcJr/+iEv+wbu7ZX4M4o=; b=
	BDqfMPB5gVL4POujedGPXgY+5Y3bsnsa4FDbFT6CRgvc0/dEMvyGogMIbarOHSeO
	AkKnLyYCiijMGSJ4aTGuw897UdvartOSY9i4mQETG3dHiC7SbL72h/kRHfdb87eR
	CYkYpvJTmphLDu5mZZx5Q4C8eMo3pg5Dt4rjNDrw9BFQGOWCchDeXHSmS/3nH7PO
	ZnTQ6h8elOn/hlykdTWZMNjxMYByLH4Hv3lf/qQ+d7jNjRBqExaPem43B2m6HXkg
	dhKsiP5sK2CR6/7Px0CNKiivI8PrVsFwbAur7QYBg34P1XcTPlPV7FuqAh5wto1h
	Q2hvzgxkbgNgoG1pkfN4iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732143758; x=
	1732230158; bh=+tOl6rSvZsKNggveupEMbGpTcJr/+iEv+wbu7ZX4M4o=; b=s
	1Mr92xGe+iXUCQ1Qj34DDZgtI3DceVGrIPK5xYsgdya7DQoRMQIaJcwYfM6A8jjj
	BB3TZboeF/st/fYPWqxfivXktK7nVgBaAYtblD5YLGImpbFey6/edXRct14RO6ay
	mQ45NXbR3AMpgNiv6+0eaMAzUnbKd2CPfw0x7GOi43vI7X/Tq1fzj+YZpdpaTncA
	XqJtnhTeAQ1AcjDswTtyXNVRXlsRIubPIl7dy6/ZSCrP34LZ3j1H1HGLLvhnxmoW
	CvbYeiyAbaw8bJ/8SKUD2a2vlru1CtcH7HbC7KvqTFpneDfpBgfujCe/e76sZVgU
	kGGu8o9yV8q64rvYP3CLw==
X-ME-Sender: <xms:jmo-Z7ZvmHoQVGNG7n7yQszewy3JzP_5JZSmBnAR61ojQbXLiZN1Hw>
    <xme:jmo-Z6YwAz9fhnXj1F_DVsxs9snxvKDT6Atgbt-JaOxpo_0khsfhW39rh6ZkniVuS
    zMkvQY3tFp7cQ8Wf44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeehgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeefffelleduheehleejtdfhheegtdffhedtffeileeh
    keetffevtdegheduhfeiudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jmo-Z98yeXYdC44bOs3Km_vOlSVrvdg-MwauVfuG3iFUUkNZpls0dg>
    <xmx:jmo-ZxpvxuEqO1fsM254RFPEYpxQ7lWrx431rhkUFL9dtcjbpi5P9w>
    <xmx:jmo-Z2puip3eGCITk9fdwCC8cxny7CLUkQRQw_EwEnXsLxNL0bp2yg>
    <xmx:jmo-Z3TbwqkhrJy_LoCl0KgRP2gEYv-DGHQZ05HuFJSG_M9i2mcS5A>
    <xmx:jmo-Z5W715FPWEsO6kZwPw1z6Mu_UrBmDrSJ8sXoKnUlAP_F_DsmsLLy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 54DFE2220071; Wed, 20 Nov 2024 18:02:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 00:02:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <77eaecac-c423-494d-91f0-e08322fbb0d8@app.fastmail.com>
In-Reply-To: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 6.13
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_150239_301106_35032E84 
X-CRM114-Status: UNSURE (   8.14  )
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

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.13

for you to fetch changes up to de6dff2090ddfa74ae53e3e52243a9b9f3ff8526:

  Merge tag 'at91-defconfig-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig (2024-11-13 22:49:50 +0100)

----------------------------------------------------------------
soc: defconfig updates for 6.13

As usual, a few newly added device drivers get enabled in the
arm32 multi_v7_defconfig and arm64 defconfig as well as a few of
the SoC specific config files.

The main visible change is the inclusion of (reduced) debug info
by default in the 32-bit defconfig.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

Arnd Bergmann (6):
      Merge tag 'arm-soc/for-6.13/defconfig' of https://github.com/Broadcom/stblinux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'imx-defconfig-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'renesas-arm-defconfig-for-v6.13-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'at91-defconfig-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig

Claudiu Beznea (1):
      arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3

Florian Fainelli (1):
      ARM: multi_v7_defconfig: Enable debugging symbols by default

Mihai Sain (1):
      ARM: configs: at91: enable PAC1934 driver as module

Taniya Das (1):
      arm64: defconfig: Enable sc7280 clock controllers

Wadim Egorov (1):
      arm64: defconfig: Enable PCF857X GPIO expander

 arch/arm/configs/at91_dt_defconfig   | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 arch/arm/configs/multi_v7_defconfig  | 3 +++
 arch/arm/configs/sama5_defconfig     | 1 +
 arch/arm/configs/sama7_defconfig     | 1 +
 arch/arm64/configs/defconfig         | 6 ++++++
 6 files changed, 14 insertions(+)

