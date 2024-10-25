Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD5FD0C5FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kE9FPbtpN1gptfSk3BViKriGQyJtWlX0djOx3GlUBlw=; b=LU4Gyax/ZifgTZypvsh97uqmth
	HTq9rfHLEerwqfqjQg6OiR5ENnR+x0Jus8m9BJc9NYt/KLVFTrtg+5qfPUxWNmD2ef3fUB+0EhZgG
	ifeS4jVODpBqN+FtnwZvbhpofGE52wfsmbpzj7guIaqCwah29Td/qgBHn1sKAMsVRude8Oda26sL4
	TzMuT93KvTAtcxV58l9W9N5e+1C4/lAEMTbBWVhhxuFLIZph8pZmGPdsy+oXvA1B9dRo7g2AjXcjx
	IHO+OyYCGRBM80xWvIRW9M7/1arRNrVLK+uk9TxJGk9EvtQ2fquG3AgugSwqsK+A42cEPs5gzCj2a
	fVOgl8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hrj-00000003PAG-0uy8;
	Fri, 25 Oct 2024 10:48:23 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgS-00000003NPh-350j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852592; x=1730457392; i=wahrenst@gmx.net;
	bh=kE9FPbtpN1gptfSk3BViKriGQyJtWlX0djOx3GlUBlw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nimaA2HazKryFAo61mBKF14k6YYiPaV7xQ1fZV9RdxaU30jeL9pwWRcjUVBnVhwr
	 HEPyanwkh25JNv/mqUtom6TV/ZHQfInbegDHUMAbLGSF0jNL7ufWSjB0R7G7cwnUM
	 40tyyHPgRYJxX7Dv8Asdo+2bjr3mPXAWg+tfd9MoIp5311149n8dfiJFis3hdRcE0
	 woWCsBJPmK6vQaoXSWpDweXkNrQbNmnXyIp+M26Isw40KiIeOzH/JXQraqhin+LTa
	 PPIV1EO3MFJOqR078ZlUj0ZJPFBJuuU5RSeh5xUnbm3ozhCujZ8KKG5XDRLh3/RoP
	 4YnEV50qeFQuL9zvvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1tM5Y72BwV-00RcC3; Fri, 25
 Oct 2024 12:36:32 +0200
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
Subject: [PATCH V5 3/9] mmc: bcm2835: Fix type of current clock speed
Date: Fri, 25 Oct 2024 12:36:15 +0200
Message-Id: <20241025103621.4780-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:unuppcKVWCelo/CPxApDW+wIc1GUoX5LJis6Za5+ejJZaHISsel
 IrRzfjqFWcMwDfIXZpLa+5lFhoBUfSvGs+EAIPExq8Swhcg/G+lOKK+sCLeIOlj3cDjrA9h
 IjTu4RRYIfyAfpffgtfG55gnPNU5ri2ZIGBLzasCgjtpy3YjxCWxikUpJ8x+bOOQ1ay58pn
 VLYdTXA8JOHka4KiQFdBw==
UI-OutboundReport: notjunk:1;M01:P0:Mki8rbRtU9I=;jGGeBqmE9YrFESl0962y8sxY9+4
 KRxp3OeEGgrFfERPShzSLCn4CQi73c6JOoQqGjCmjnaBso+sSd3JekCaBRULbxdNRGcI42LJV
 vW3ORJVwGYYiSRE6Lj9MUSOaLtFMQ0LbpP8Ek1GzChGPM0f+FOHQzGBEVXKYFZqrLHucy4OYC
 LKYHX43b5+1pILA4Vm9G34ZhfTGgj9KvUKt56wU15CQIp3oeJVF4mWVytFey+Ac0ZMZy+P9SQ
 S9HYLjSr8XuPE5Q3vqWm2NY8b6LtErxRPV8/9wgsOGkJVsuODydkZGXmE6um+lVGc0CaJZENf
 vhIInz5m+vSloowgZ41EDsFxVcKhcy2L5eOFt9p420KiWqtj/gK7btr3tJqgNOOhCV0jUEBh0
 jTI4068OPO1zPMSPchXJg7XVLYLuzPCUVdANo8xe0R26xwepxG8YyQahYiaptvwC+qZ0Non1E
 kUpeyeSMioJJtCX2KMuEMdr5XTW1AP/teLvE71Rnq6JLeNJEWmZdwiaS5hey9sz9TiZ396vC3
 4FJq4lZbsZ153EflsJoCAv+NSEywJ+3dcSsz4z+6E9oOh8EIMqLy4f9dQpa+p1u95v16CT7o3
 QcTRfUW/zkXdCjCmF8LBMNszXBGXuE9Grhfq2v7xExy3y9LDzdBUILZLAF6uVSs+gJ0vBTNAx
 3Pdoo25rcA3ponjBezNsunRlDQFkSrdWOtRdBu/Dp4s07w+trqJfAwF/JZTDrTqvGyObWiOgZ
 MQKZ4HPSF+9gjHuLKmeWvxH7+/A6DcRdJia1uxwJ/L6DlrTW8n1+uxzsLJZ/f0vGJaiKU6ogE
 o8sFCbk2+OAgqFZZ7nOBx/ng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033645_259496_5A72155F 
X-CRM114-Status: GOOD (  13.34  )
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


