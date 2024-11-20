Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A980D743ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw22jCZoEwcjBnN6PMmaEAXVlXl4VGvOeXE3IOt4lBQ=; b=btyj/BNhdIEH2mFvp87qfgSKT+
	QmJLRIu/EjYwGCHJHgiWiEQert2Yl0Da0UXzMOK9a1RpodudLtatNafjN7sOmlTEnCdZUfplhzbKL
	wP2mjW6HzCNEdt3aggYUe/mjuwthliJ97SdaA30lMN+QPThamCVZxcFM65mKL6VxAJ89qEwDEIsz1
	f5WlJxGnI3HdItAYrSnSTPCfOjv3nQcYPX/xNlgmXXrFli5IKsnb2grM65xiG7Uivf1WlvGRHiwRN
	NM1/pTYDYmGkO2e63eEAkhbww+c0ENJODOV4xvbqLdSLxZO/sQqK+yEfnxigB7ehp3zQvxdgJVHkV
	DgeZA75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtkT-0000000GODB-1D7m;
	Wed, 20 Nov 2024 23:04:37 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtj8-0000000GNwq-2oWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:03:16 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0F38F1380258;
	Wed, 20 Nov 2024 18:03:14 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 20 Nov 2024 18:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732143794;
	 x=1732230194; bh=uw22jCZoEwcjBnN6PMmaEAXVlXl4VGvOeXE3IOt4lBQ=; b=
	QVIDEKoykCePUFIMau2BLuR/h6CXcPW3iPjwQ5CJ5JiP5goYY7rusWEgfey4ll4/
	BMxAYY86w4gFghoUDrUwHfuxCMrtOTgKc2BfM+oeRDS6KC5E9k/TyuX3vhCQ2mGy
	+z4NqKCK8Fq5DVKuiWJ2vy4tleJR6q9Dz5TGISDXBQ4HMAQstxybeif/l2KcMdj8
	zBwY5v9aDYWlmxROj3ChEXYAkEzjr0oQqJYM5Evg9SRV+kxq2EH1p0w9a2iJF6Xr
	mS8ZGNueiuK9C1pvklE7w7MWdIjK3/vzy90wkBOeC/T8kfBlByzPLbFoill5bSYM
	3c5QJLTJmm9KyqpKDLSUcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732143794; x=
	1732230194; bh=uw22jCZoEwcjBnN6PMmaEAXVlXl4VGvOeXE3IOt4lBQ=; b=n
	eYVqGiY5FThxgfSF9/JJudYQrtegp4os+CN4oxRGyCs1ANrUc50M/ynyKNhdGqrx
	m6ORtZJIiCS5XjAVjSdzkCOjpBQEKmthXS9JZKwHIUbZlgfaAQUnJ9e3te6wAxsk
	nTAqdIo20bLwT5p6xfVnLxyd4Wsp8JTF6mriZ3o0XuIu7Gx+zdz0IEyH675rFpZh
	VYiH4Z8q2EV4Y33najW2koX2tXYu7VFEkrYJsSaGNmQBJTQBmbPLlXCdwcv9rNwo
	4+JBUZV1eKZOUAGWapXYyKS2sOz/iOlCqWsnaLGctFzhmfFdkbqTlaNQHPh1AMI2
	SHCkFlSSkfUST+jhdAHVA==
X-ME-Sender: <xms:sWo-Z0uCJzowT7wwMiKnnv0du0X-N_SjlpdG00t1vIUMpEw11SzKiw>
    <xme:sWo-Zxf4-7DQKNjzEZR8CGda55Hx0N_5Bwcwnpk1lPNgvY3IwCl4PKx7N0iIPxEt8
    O57AlOMaa4Pw2NL5Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeehgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeefffelleduheehleejtdfhheegtdffhedtffeileeh
    keetffevtdegheduhfeiudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sWo-Z_yjwVr4KDvB_9vFLBQBR3dklP8tD9xEJNO7Z0egnYVD9Irv-A>
    <xmx:sWo-Z3Om-pbqlKu7vhb01kq6hOZTT88epZpnIdShIFE_rI-2H_0cdg>
    <xmx:sWo-Z0_1i-LzvTFOcR4evUM_37c027Mdb2stv9sDeGp_ksyu3EZdrw>
    <xmx:sWo-Z_UIt1shYvLxqB-eEtaHndgyln9jvmw1NA8DqMibs-fkx6YgTQ>
    <xmx:smo-Zza4Od35ggJaClJXMoxcbt9RYPzQAIDzqr0dB-YtcF8rDI7bfxbb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BC5522220071; Wed, 20 Nov 2024 18:03:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 00:02:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8eb10ff6-08f3-4efc-8839-1d7559bb8c6f@app.fastmail.com>
In-Reply-To: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
Subject: [GIT PULL 3/4] ARM: soc updates for 6.13
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_150314_780221_EBAFCB6B 
X-CRM114-Status: UNSURE (   9.53  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.13

for you to fetch changes up to 9c6cb0377534e77265ea673fd4834f858d5d1a6f:

  Merge tag 'imx-soc-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/arm (2024-11-12 23:14:50 +0100)

----------------------------------------------------------------
ARM: soc updates for 6.13

The SoC specific code updates for 6.13 are fairly minimal. One Broadcom
SoC model gains automatic configuration for the debug uarg as we have
on many other machines, the remaining changes are trivial cleanups.

----------------------------------------------------------------
Andrew Davis (1):
      ARM: imx: Switch to new sys-off handler API

Arnd Bergmann (4):
      Merge tag 'arm-soc/for-6.13/soc' of https://github.com/Broadcom/stblinux into soc/arm
      Merge tag 'samsung-soc-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/arm
      Merge tag 'zynq-soc-for-6.13' of https://github.com/Xilinx/linux-xlnx into soc/arm
      Merge tag 'imx-soc-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/arm

Florian Fainelli (1):
      ARM: bcm: brcmstb: Drop custom init_irq callback

Gaosheng Cui (3):
      ARM: samsung: Remove obsoleted declaration for s3c_hwmon_set_platdata
      ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio
      ARM: zynq: Remove unused zynq_slcr_init() declaration

Linus Walleij (1):
      ARM: bcm: Support BCMBCA debug UART

 arch/arm/Kconfig.debug                  | 12 +++++++++---
 arch/arm/mach-bcm/Makefile              |  1 +
 arch/arm/mach-bcm/board_bcmbca.c        | 31 +++++++++++++++++++++++++++++++
 arch/arm/mach-bcm/brcmstb.c             |  6 ------
 arch/arm/mach-imx/pm-imx6.c             |  6 ++----
 arch/arm/mach-zynq/common.h             |  1 -
 include/linux/platform_data/asoc-s3c.h  |  2 --
 include/linux/platform_data/hwmon-s3c.h | 10 ----------
 8 files changed, 43 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm/mach-bcm/board_bcmbca.c

