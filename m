Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBACD0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kE9FPbtpN1gptfSk3BViKriGQyJtWlX0djOx3GlUBlw=; b=l+pVNVqh3TpsoUdjyyrX7LHZI2
	kP6U33gRxXI1tkyvm5+NHyD7HdhFDUUPueBpECEoedgFuNyHtBjvJ99vpSP1KnEvsxQfbkZ11B7B9
	J7guEeVthKiyZYoyFrKR13dXPFejCxikeDCA5HyQb1e8QwVZF+hmneNUS6Nl0kON/rAyNcZ4ydJDs
	cRRJKT6YOkDa5DNasag1GlPt10FGSPF0fkRlN/FcHAS0LihB64gHe/LjFxnqAB5t3EXX2/FNG5QQs
	4/nyC9xI4MUkNwBhMoU6TlMY7AqBLIM62j4rwumzpa8PyrSI/I9v2BxObALS8Vp9G2EW3+KSmS9XS
	kWvzrb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44UN-00000001jlO-3PhH;
	Thu, 24 Oct 2024 20:31:23 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IJ-00000001iBV-41Y3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801126; x=1730405926; i=wahrenst@gmx.net;
	bh=kE9FPbtpN1gptfSk3BViKriGQyJtWlX0djOx3GlUBlw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iizMTzz892WPd7YaLtaujj/lOy0cUqiiXP+tEw336uO6CZMXHbV4g32/L2EZo13g
	 ycMm1aSQa+ShVeLq6o7h2EUmtU6cdSpJES7tCSp/MU3m80X7/mOXOWbqhPLD/6hBH
	 sQBFLkkPQN3j8o68Spb0aTw0UBDZtqTr46ygYljc3uTWQucd2OeKkU6RA5mefcqAu
	 GrWPJchlOzqtzUWSXzioXOFN4REO0T8cLZvnYGU9ieU7CxaTLgCV2TRMAZ9znwzCF
	 FHhxBVEbH+XfEmWunQyHtji80hIEpSws+1yultzgOrOzgpG79Oh5TlfX86PmXluRR
	 jxntSTo4JfdGgdvy8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1tkEjD3kbO-00n1jq; Thu, 24
 Oct 2024 22:18:46 +0200
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
Subject: [PATCH 3/9] mmc: bcm2835: Fix type of current clock speed
Date: Thu, 24 Oct 2024 22:18:31 +0200
Message-Id: <20241024201837.79927-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZHnUj5N1ri1FpgNmvmUfKpJ9EiJQpv1kd+uvgbTIUstY1PSxrly
 8HeS+/FhbVxKaaRb8yQqTsJcZoJHeNKOf3U3evEWVJjhnGE8PNjuuYVdbuL70ociJQOLGm9
 caxShFkJTRZeEVpz1IlOnpJcVzDc7UBxGPcke2XHsrX4Zdh1pn1m2utJkd1Ne6JIcwFcexU
 YsE74od3LaP9yL3cMaOOg==
UI-OutboundReport: notjunk:1;M01:P0:7dNHSwoAxOw=;Ok3TtRcyjeVnY1CYGL21gL5LX4u
 pVP7Lzl6Oe4+cPYtXju8zUfZdE0pTqF58Q685nJlqCu2JWSvaCN2S19czG+V8Ms3fRgjZbcOn
 qdVL2O9+14D+IIsHjmOb9WYMXzNEUhwoos/V8PpFqqLsxHqaWGAp+OLM5Df5CHvpr2rAyOUYg
 1XWUWUXJFjoIRoW1XQL+GXtwBwsHypTRqwSGu1d+RJb+kTcuAwfil8fzR0XoPNVi9YsfT3fBa
 7ZC9/TqV5IF43qX8FersJSEpFduFvJSi3p0VKxENo4yFQLIRZ8ryIm40/1dNKovLgL06hFHA2
 Pn5lmCi5Z41ci+vIzH2Dl9hhE2gu6bWRPkhbRHzMmMeXczmo2G6Fk+OkoiZeh6Tu9fnw9AtHu
 Ud4tNzCj2ArdUpUNCO00kjqqxEgrZNYiEBThjMxKyQcphEz0rt1+75VMekALKYocyeS1HTk7O
 vI257JLeoXtln/Rz+cU2iBuVsPJrTNOFcQRODa6Na0CuqpGawb9JKtr8Uc1IaAAOXt+OShsGr
 yj4hJ5R0wK/zr47cu9rsIeSSc+5PDmeaTTbyNM/OMG9TQrnKH7BkP2VE8H2dgvJmQRzb2UVY5
 +rdxeoBr7SGI9n2JJgnrae4I1P5RY1JXI5f1u4nfz2CUQFtKTI5KA+xaPgacxWTAaI0Eghqn4
 8gDVPcCaPdnxVgTThrgHzgLOlcpvQn2zPaCTVSfrABivY6Wx/xDn0csGPZZAnYmYA3Cd4uYrE
 UAmAdIf/jAMFDB23WW3lmmLNvCUItAcGgPjV57+lO88mEeA55czVEHvpX4xPi0Bg3F1fa0mGn
 +rT5/+W06U9lT9ldU7qlla5w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131856_432087_9C1372DB 
X-CRM114-Status: GOOD (  13.90  )
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

The type of mmc_ios.clock is unsigned int, so the cached value
should be of the same type.

Fixes: 660fc733bd74 ("mmc: bcm2835: Add new driver for the sdhost controll=
er.")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/host/bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 35d8fdea668b..3d3eda5a337c 100644
=2D-- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -150,7 +150,7 @@ struct bcm2835_host {

 	struct platform_device	*pdev;

-	int			clock;		/* Current clock speed */
+	unsigned int		clock;		/* Current clock speed */
 	unsigned int		max_clk;	/* Max possible freq */
 	struct work_struct	dma_work;
 	struct delayed_work	timeout_work;	/* Timer for timeouts */
=2D-
2.34.1


