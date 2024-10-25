Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CBD0C5FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIb/0BVQLAIWTGsSf2exEUrI6S97uVc10LsFQOB7HdM=; b=qIljRz1dIBUY0HmNX3uGS3rzmK
	VXYB1c2jOS7jwnt8phg9cQDbuZY8yU7jaVOPh2DCVVlu0lSVIrvDBkZw+Ptg+neCyJwdHiuVy67Je
	ldaisBZJZvK3jqrRmvBgtwXj3P/kn+0F9wFZqz+gXEswtwkC2DsXiALJRnobpoEdej0+8TgrZHF0F
	mvz7Y8Td0ncUlHiJNt2+QAvBudJ0YHK33rYvf3OcDJAyuHK0zmtUQ03IvDOJu/4zgDhEwj9LWqnQN
	8jfNi7qxTh235HSDnBzR8XVEMePcqbGxh2bw2JQN4Ww+zUanVsxWQE3itqmMPfbq2LD3GzOoRaypn
	cxh0nHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hun-00000003PYk-2qHp;
	Fri, 25 Oct 2024 10:51:33 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgS-00000003NR7-3hdN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852596; x=1730457396; i=wahrenst@gmx.net;
	bh=EIb/0BVQLAIWTGsSf2exEUrI6S97uVc10LsFQOB7HdM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q/qrI70695V/9bTDqyidpR3DqN7SvtuI9udN3qlYdVTHhjTe3pdXukCgXVr4eSZT
	 oVpVSWvm9Ht8gJZWw6h3QFcW/FmIZvn6x1IdOeioU5edI3X9axkQUaZ7MR3YgJWAr
	 zx6prtedcexgJh39RlANFrBey61daP9eSO6kyYmiDdSpdYj3E5KxY+EI3YfqL0qCf
	 B5FAXvAWQc6+wmANqG2oK83TG/NapT1C7OwePVWRlDh4bK5uvTLsWMsEUJJDdI42e
	 PDpB87erwL4DhJEMrtWAEMgZV2OmisPUU2T9IXxSzIhyeJimpVfAFdK0+1uGor7M9
	 lIyWrRTn32WWWWA19w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1tcWVM2Kx2-00mIdc; Fri, 25
 Oct 2024 12:36:36 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V5 9/9] ARM: bcm2835_defconfig: Enable SUSPEND
Date: Fri, 25 Oct 2024 12:36:21 +0200
Message-Id: <20241025103621.4780-10-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SXjQg6GNw0ZSmSHqCIeG/A2AkVfM9T0ww/zGck0+NtQOedM3JmX
 nhvnTRKK+Jjft6MtlKRLW/DprsGs2O6qwPDtcV7LmsT3VHJU2mvgDnoWKG0zD4F9S4r+ID5
 y96ms+DyCXFaM6Gi5sBPfDPI5dY2bBqgdan7D2XSLY4t6Tqe5hKlJ7GM/BV2pqsol2Vd6nF
 UVibuxzjEiygkJgZnD+RQ==
UI-OutboundReport: notjunk:1;M01:P0:l56zcNjiEFw=;7BA/2Q97vKnLVe4tWhxMXYjl5WO
 Vf2oL5llpTDWf8MMu9SWofNzQf00yjoNfDRWjsvmbB2kSd2mfqFBGvWS+jobK6SYQENAU1GFv
 E7gqHgJAGhKJAt/rRfh6ye7918d1iY+U6vWOnntYrG3EZa5tPHeHrSf7NOrxPicSds48iRbLp
 vlODfPnpmOxdJ0i0zGVig/ePbLUQq4bgCKTofjkbvSLQ6B8a89bskm6TAF27lav+yDu0/Q274
 7IRz8Lmqengc83zCrSgBNXGVMhF8hicywRZGtIFwLkowDcLV9wVLgSabxW7Vo7cJNviWWK6IY
 TcH4MpqCX7elZEHVdQQpkvxhaKq/l6hcKalsfVKs8dDzEverWVdhnY4WZDw+9mKOxmpLVLvI2
 IP/wpO0YsYmsB2LIq3zJwHMZNOeab8EJmmK+pBwpBHovOFIETtV5zv/xvwbwctN78nw/MkIGY
 Y+twbeMLVUmzBNKzW3aicYfxswcjucU/Q1+wvb6wy7wTsEWWwq3cNI6aEc+T0vUHwIxIhZsvh
 qm/l3gQD/KHna78N7aKm6eXugMekG5JxmkqplrP5q2dhDf8esJgup8JnyqknyBtw8ICJc6+57
 qmpk3EZ2ul6gZ6Rooe7wpwFQJ0/BMTkfcE3YtaJBZ4gAo2ibh5ysM1SP/qLaJ0a534K7ago3R
 66F+hWNXMva7K2+GU0V6jDxSMGEG18oGYRQtP9scz74H1ctu7pbv2aib6pFZlsIxrWvc5MI49
 QKF+weCWt7mRfrAUZex0E8GSHrQ0BaI80FgHvdi06pu4LAWmj82B98YdVIJGMIAxjmhTm8UgU
 iSWTw800/7Xf2LzAuNtCGITg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033645_697303_F3F6FD74 
X-CRM114-Status: UNSURE (   8.87  )
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

Since the Raspberry Pi supports Suspend-To-Idle now, this option
should be enabled. This should make power management testing easier.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 arch/arm/configs/bcm2835_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835=
_defconfig
index b5f0bd8dd536..97632dee1ab3 100644
=2D-- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -38,8 +38,6 @@ CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
 CONFIG_CPUFREQ_DT=3Dy
 CONFIG_ARM_RASPBERRYPI_CPUFREQ=3Dy
 CONFIG_VFP=3Dy
-# CONFIG_SUSPEND is not set
-CONFIG_PM=3Dy
 CONFIG_JUMP_LABEL=3Dy
 CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
=2D-
2.34.1


