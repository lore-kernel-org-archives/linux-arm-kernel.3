Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9F3D0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+14rsoDnpAU5TPVahAWZNaZb+eP4NYQnwXlsAb9tek=; b=M7KMQY0ROG4myK1/x8CywdxDAS
	Fj0toWOEXfVczhkfM1DSx7+vBY/GSCpyLqKQAxKTHCTA4rUW3Rcke6KQpydw7ty/FJAyo/Ueo7rMS
	onZos1ue3/jpHHwteRwzlYzQBHShoDZq9F5LI2S+WkuZnkymxWCpZBQ6Pw1mO1h0d8ezsYThG16X0
	Xp99ZaCo2NwtKe8waj/6h/SYjlsQWR0FJqbuHl5ZbDo7p/erwlsEL+I7vZLoEWJVCPdkRzC3hXVqB
	qebUT4BREAVycTYBGxmdV+tWJYDCEfXCTaeLFoPANLrDuANLG1I27JFvfO6CofVIr3taV0HNJu8Ac
	53ZiVV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44XQ-00000001kC8-2sqy;
	Thu, 24 Oct 2024 20:34:32 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IJ-00000001iBI-3q13
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801125; x=1730405925; i=wahrenst@gmx.net;
	bh=v+14rsoDnpAU5TPVahAWZNaZb+eP4NYQnwXlsAb9tek=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UgcDTyOU5bSh/Of79AnlYW2C8G6v/KE/0uWp3LwaS+2sqDjpsumWPc1ecW20OIax
	 hHzduJZHohBslNz6BdvpvcK4W7qpIptZIMKMxo4sq1mpFodYQnzt8f/Ibe3D5owFl
	 OwYmfZGZEOVtfXT/lFQxy/+CkCg8jm0zPlV0waE5jHxjFLfycWr2Bga76xhFpkcWy
	 9w3bUncR87f7knGrWygBhXOoKY639eSmDMjX2poe0/crWdFdmBeN3u6EVKFT5ILZ0
	 sAQrsVY8T8lkxHM0eYqnQefxySVZ9F8dr4cio4TqeUvO4ntN9U6rvsUyJnQt46i0l
	 amzgo/brHTx8pWC2Bg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Vi-1twyC43LRo-010j8C; Thu, 24
 Oct 2024 22:18:44 +0200
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
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/9] Revert "usb: dwc2: Skip clock gating on Broadcom SoCs"
Date: Thu, 24 Oct 2024 22:18:29 +0200
Message-Id: <20241024201837.79927-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PoFhx6WkBPUO7pLARqsqywTbLY7iieU0MH5b7d0DdfFeMyOazVo
 Mu56Lc1LhP+2/40RmxDhm0iBfV4aj2TJaNQdfgZCBspp9FgEHwaA7cUDn2tWA4ak5i9qNuA
 Rn1Fzj45z2VgnIuahh4hiksqiW9DaE/bxVdC6RB4z89CtXfzfZ9pu/wZX/yxxB03AQL21AF
 jk25RXvuolTepHkR+oNiA==
UI-OutboundReport: notjunk:1;M01:P0:I8zVc3auTtg=;cId+YZnZj+DctB2DlOUivtlkeoa
 ducXA7FUpTt0qSb2hc9U6KaZToeZhHSNStRCCMf1Cye1+c08UFvOpPa4wPj8aExUhmSzA4R44
 0vRxuTayMSDIy+BMxp+LO8xCYemeOK1LTOq24TELfudNbwMV2NJRoK+O4/JTAJ5RJ9msAt9r/
 80/Qn/H74CcArXtceabruOXR/mBIldWMm5VdcQ9yIacwatdoqkmVLn8XDXc1gQrOA294BXeOw
 y9arKXpEgB3Q4MTxqg5R0FfQetMjR6OhfI/69JYz0xOSy/sAJcFyHrW50kZt2KvG0EmQWCjKr
 roknfVV4Tz02lH1pFj4s2mvp8Z4l73eDWL56LF2RWRk2knT33iNcIYWFzwKbCRYRkRJ1DUiUY
 LLWpIA3hLYFvfsj2f1oSrh2+BwgGShutOafeGXHy8/+wuMe/a6jtnjMwoTzLmULWPF6Sv90Dx
 127L1SNJq02h0dOeb0uno78azOCDngx/Wp3ZnvnlqdB0FvNTbsWaC/OXE15FV4/Vvd8VtMUsM
 kNJQOvmn1YqPa2mkWVV7nhaMRC7g/AssBXjYX7ob+qM4T7WWjARm4WTptbp+d/BUo62RS40dN
 i0YiU1dyIbxIV5vb3NwAUjx/Q/tLLFKliS+jCPNaew9dv3TvtgGgKYJT6eP8rE3Xc1bybD5z1
 304Dcr13+RulTZ05w3YkilQ3ZIeUpWFrMU1aQJo3Mq4gaPa6lYu9fEbM/g4ky2nGGoBfJ2FBx
 63mjKnGCcnCQxX/zrxTNsg7eXkdLUD/TDdzOnIlXmR35OKaGE0bsBSF8Q6mO9MZxGNkJQw7hq
 BxPPXRpw/eCjR8O0nt8IVPYA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131856_444657_5A8DDB01 
X-CRM114-Status: GOOD (  10.03  )
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

The commit d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
introduced a regression on Raspberry Pi 3 B Plus, which prevents
enumeration of the onboard Microchip LAN7800 in case no external USB devic=
e
is connected during boot.

Fixes: d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/params.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 68226defdc60..4d73fae80b12 100644
=2D-- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -23,7 +23,6 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg *hsotg=
)
 	p->max_transfer_size =3D 65535;
 	p->max_packet_count =3D 511;
 	p->ahbcfg =3D 0x10;
-	p->no_clock_gating =3D true;
 }

 static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
=2D-
2.34.1


