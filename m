Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F649D0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SJXJq2uX1cxKxMjslAAHJO+ZqjPnNq4UxpqnQBoZXU=; b=AzBU2hT5JUR+FFPMcrP7hA3xCV
	j7cJ0e2GhxWS7BalTURjjFpHwModrOfvcT4ETl+94BG3mL9dTaeU9jMY8Yos8Oqw+koj3nOICeY+A
	KCZU56/F5DNoN6WZzvt5ZAueJyi8gNf9/4AxHFQ7ZrQDTpK09Dt94mF/PfXo++0ju46bx1NyjDgna
	FE7U8f8Iy8Jdgavi4YJNt2gSQB8yPvQIcmVz/AXt8bOIhE3feqGbE4NVgWVuknQ/lbzQtNWEzf9Cv
	gLtqHIRyMl0Ngh7agmitXUfjGfUseC4KjDaJno1+RrBg2Z59kskuDveFE5RigmG3NnbIpuU0K7b9S
	5NJwzfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44Vt-00000001js9-1tmL;
	Thu, 24 Oct 2024 20:32:57 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IK-00000001iBg-0DUD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801127; x=1730405927; i=wahrenst@gmx.net;
	bh=7SJXJq2uX1cxKxMjslAAHJO+ZqjPnNq4UxpqnQBoZXU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KZLSTsDxZihnlXirdBa0AQQu2DSslmDJlLNVopdqTNhQm9XMLk63uuEmJ43pIIQw
	 wkf0+C/y3POcLDf2xE+Gj6SGf0JmoK8Spt7IJfZKEWkiEZOY3/J3c+zlKWTFXdG36
	 RxB4CnL2KZV3xvuSqw9PRCkEfetAKS6zoli0N5k/w6G6GoaPPxk41m2ywLTKIWQw3
	 aRGTkIqDoSZ+h1mtDD4utQAwEtY6YImjihsQyEcciR4vWYrs19aOOpGc+TzqRWBcR
	 pxr4JC7WMp+hsiqaXV5mPT+nq83ExA80OH2+i3ZOsD9KugyiW3Aq4vHghBCTL3H6k
	 PnfjK7K8zt5hv6TEnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1tGnkz0Eny-00Le1q; Thu, 24
 Oct 2024 22:18:47 +0200
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
Subject: [PATCH 5/9] mmc: bcm2835: add suspend/resume pm support
Date: Thu, 24 Oct 2024 22:18:33 +0200
Message-Id: <20241024201837.79927-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9TmHXDC8x1toKmQj5TL/zr1r9VxVKXQInUCA3JeqWfeBotHSHp8
 wLE1AA0+kLRoWZpFnsyE4ypCh+VDSSwImsj9NpzVERhwNkskidZqyV6e/pwYvPgtjXqqPIN
 dKF5Cw/6ZqzyERKBCWYhADUJLiDKe+wT6MTyi6A5+uNIl6WlpGZ+RY+ZFRdnWqfhJ1IdpNP
 J6BA6SqMbLqZ8lwtJFtow==
UI-OutboundReport: notjunk:1;M01:P0:bPTh4IaJ1/s=;DvZyp+ul50m2MoJpgBSYoErzoer
 AbfbZynkrtkr/VN3ylQefl5asCMF01gq+igg96KF6o8g7jl7bfNo8d0xBpVQ05s8QpmOLM2Oy
 CnmuA+QE+SRGFAhwFRd4+17v5FHfxOcbok9OczzdUDVdosuNY5hsVXa+cQ5o+tqdW1uY69ViY
 3/PbVKf8MBtIRQiyJmCOybn87kxd4kgM3Hj4YY4cEcncWh+WpLB3O+xj6kSbzeddMx+Dm2qC4
 yW02bi2qa/uOli5uTteIeCdNS5+1ULuFUPZ0bONegz0m/CaE4VRG/pA6N9J1gs0ncIpjE7qLM
 XQMHBcBkSiD5FNdqO886NQleDowz5/JkDVIKj5732IaAZdjGuPPgXwiUb1NtBLYh5Yiz3Gi3V
 K+jA+NDX7rAsrq2cVtEZGK8FL8ZEhW3DR4unOGEDHHpJE0FoVT8KUPwrDDGahIbK4r0RZChoq
 PN5FRDMXc8XjRy3GUEq5HK6oIgJ/tMpoeXoVOv1CKYuii67fvypFxO/7kg/XK94EsoD3wsD9K
 eCyW7ggaqih3cg5DiQ8CY3ea8zlGVe0FBl+enBhSKObYJF3oqVI/gJtIZZzcBf6HDgl1gr8MK
 6vmKR4Qh+bu9Uo0ulgIDyxCic49QrET8p9bPtTTGEkfoFI6pLvwq1mrioVtlp7NjI5RJUl49R
 KtPDKUgHARqf9J4m89h53uezA1DbUS0qdD1VukTzLZIl4QRch6HLpaDMGud7zwADQMTJ2Saj4
 6ZjmHrYPUTgnBSHLAQF+IyNbNX/xzkbdtfrM0yPqG3kGbkTmlQlAIexAgMQYUroEMbJjDCDEd
 PK8Alhu0VddmoeusWHwUv0mA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131856_572354_7B797A79 
X-CRM114-Status: GOOD (  11.97  )
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

Add a minimalistic suspend/resume PM support.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/host/bcm2835.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 107666b7c1c8..17c327b7b5cc 100644
=2D-- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1343,6 +1343,30 @@ static int bcm2835_add_host(struct bcm2835_host *ho=
st)
 	return 0;
 }

+static int bcm2835_suspend(struct device *dev)
+{
+	struct bcm2835_host *host =3D dev_get_drvdata(dev);
+
+	if (!host->data_complete) {
+		dev_warn(dev, "Suspend is prevented\n");
+		return -EBUSY;
+	}
+
+	clk_disable_unprepare(host->clk);
+
+	return 0;
+}
+
+static int bcm2835_resume(struct device *dev)
+{
+	struct bcm2835_host *host =3D dev_get_drvdata(dev);
+
+	return clk_prepare_enable(host->clk);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(bcm2835_pm_ops, bcm2835_suspend,
+				bcm2835_resume);
+
 static int bcm2835_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -1471,6 +1495,7 @@ static struct platform_driver bcm2835_driver =3D {
 		.name		=3D "sdhost-bcm2835",
 		.probe_type	=3D PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	=3D bcm2835_match,
+		.pm =3D pm_ptr(&bcm2835_pm_ops),
 	},
 };
 module_platform_driver(bcm2835_driver);
=2D-
2.34.1


