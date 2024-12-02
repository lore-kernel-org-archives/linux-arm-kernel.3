Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA5D7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6Vj0hCbBvBxMgPqXY6HmGEIry+Qf9KZ1ErjboCvYyM=; b=OUoc6xR/p0NdKQHml1jjP2OUrk
	eOGxjP1hjaFWT/oZYuMPrng4is9AU7/ut1ntF9mZsj4LZFYMhvBrSUMm9DJxXNvIDTgziU4d+Yr5w
	Ng/Vo6YiGZIWh9R5zEB4kO0f6REh7GQTQy7pGStfN/WNk9o6EI55ylzodI0CiC6LyOE0Ne0d0QVKJ
	cF94OS396lAXTtDo/ZmzfZ5ksjnA+yQJLCY7A+ZoTRWtjFU1jmfwAid4A2V4c2FYrKYGURz+FP554
	IXSJC3EsAx8/8aQQMFmoQhAoaIWe8aVEsjsgyU3HLaFMWjcB+Si38jj/l3UzjXDc95iY+8jXto5bg
	RDJfVa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI55m-00000005yn1-1Mr6;
	Mon, 02 Dec 2024 11:59:54 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI54m-00000005ygP-2q12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733140716; x=1733745516; i=wahrenst@gmx.net;
	bh=E6Vj0hCbBvBxMgPqXY6HmGEIry+Qf9KZ1ErjboCvYyM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hM2wP2YCS9ZzJAm6iiqC2tpsWb/Nt5ZJoWFBwYs1wvFax0jfelLxVZcrOH4e1w76
	 e7Z6crOPqQhE/RO4x6nUfs1y/gCbhTT/I1hAFTFuNnjnrDU2C6/XuDEz4XdH4HYRT
	 E+SHbddYh4ECT/GTPI6n22/OG2yNjh1qUzo+L224QaY22rTE40mRSPvxYPr1v7a7y
	 A7+pRDLM89nR60eJq04EFm4Q7/auOAOktBKnChlQIr1NSYrnYPNdHuUzipfeg6E1y
	 aVOUT7pfbb0uX+IbcSPXahKY9mEd7i9paZC86qEZGOsgbLveWsWY3Z7bl+AGZK9PX
	 0Cjy26QosPN0nJYw2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1tHXNC2Nyo-00ERHx; Mon, 02
 Dec 2024 12:58:36 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-hwmon@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] hwmon: raspberrypi: add PM suspend/resume support
Date: Mon,  2 Dec 2024 12:58:32 +0100
Message-Id: <20241202115832.33628-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4rcELiEtzF/R0LBcJKhDhLIB6nDD43PeR6s7NT2YUxnyohPiISn
 okAAPJ512tDaRSIWkz3EYvcohXjXQ7wI/9fVCtzapwlRKvWvrN/v9MH0gX2YfsYyFCMeBFf
 Ab7jwQ7XztCDW/xmWglu/Vac+8dytBshaP5T/0RVNEOil1e4m5TuDs+VArORtG2bFlnZBtG
 La0js/SfHZMw/b6qtljxg==
UI-OutboundReport: notjunk:1;M01:P0:i4alPr9HwcA=;V0F5HEyJvk6bRqy7s8ING59aUTI
 JwItXAQ8LzeEQ3/AOzx34X7DMz9bW9LmrNePCsYJw5zupgAUg5uo5ldOQYZTUcElFhTptL3Ip
 h+lmf281F68lF1yMpNJ5G+3+wByRVvdDeqPXm9xc0qJfobdG53JqoFfwY2B32nQvzWDJL1+6r
 3rW96nyt67OQPugJUOoH8uZiov/x/gJTZ7ilqyGB3yfbQAY9gF3DYvMSFQypVwCBRQ122fz7l
 h8DypcsaGC968uRYcet3Op7ADe0Zrs4Ya99NyflGIwMQLqJnSx4FWzI9y7iolJ5Hh33tWA/fU
 44seauBuae2HqdDv0ZbsdSgFeQiegdMnhzOMonTWwdjo/cAV+kZBQgiTabgfF68gklq1a9eBD
 jkGiL5KLztknxutjTxrwdItClt/H5PprZ0rHAZewNiB/Ehn7QoSeBl/HPEMAZLvLrwZTjF9IU
 9xrIAcFwA26jDAbk9AoLdYE/EhWsYlSNq5I5KjejyzmXazlbd0nooQ4Ys+PGnd82OVPSdZ3I7
 RM8wSev/loQd1iZGVtFwRgoKRlHDjiiNhnL4Rg4c8YtTc297mV2XjlzQ3bbOHsDVnV9PCFiZG
 KBw4ZsKxkbcn5h34nXT845XwV9Yrn3iINgI0aWpiOEK29aw5JfENCQIXfcoVK8KhOI61OCnMZ
 s0NS6DfeaWUczLZ4WAqDn5irZnbcSrm2XC63hI1O9DGZy8n2+NzBgrLswOZ9j/r9zEY5J7KX3
 DQkYei21wf+OGIeNKmfNN8ZdKkQ5lJbkHiYNGzLnsj7+ZpPQDq0wpJve8fEWVr5VIX0am9yJm
 z3NSLYeg1HBAq2zhHUsCxpzO8JYDMcTxGzSh75WTiS4OgQZzNnxRCMjXoyVcLIMQnVuLgT5U3
 qZD9yGC+iJh+Tu+TrYA2do0yiKiflX/+soE/+XzYIsGQOUUehQKRykdu+3i4JCjV6e4CfuH39
 gUjbrJS4e7Ss2+KJn+LMmxbl5UQ4TwlvdyFyKu5A8qidh9yq2LSM6MbmrEPrSTRWlueg21/U7
 5HKpFzDsgt6Gp+G+sqXuIudZ7llW1ydPpODID0TBYmb9WpkftQr2klqSCE59/vu+vQCEPDIFH
 yXiQrTKUpN7aC3vrfO0MIvloW4TqgP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035852_995173_6C5D346E 
X-CRM114-Status: GOOD (  10.52  )
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

Add suspend/resume handler in order to stop firmware polling
during s2idle. This was just waking-up the system without a real
benefit.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/hwmon/raspberrypi-hwmon.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi=
-hwmon.c
index 10ef1e1f9458..a2938881ccd2 100644
=2D-- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -128,10 +128,32 @@ static int rpi_hwmon_probe(struct platform_device *p=
dev)
 	return 0;
 }

+static int rpi_hwmon_suspend(struct device *dev)
+{
+	struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&data->get_values_poll_work);
+
+	return 0;
+}
+
+static int rpi_hwmon_resume(struct device *dev)
+{
+	struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
+
+	get_values_poll(&data->get_values_poll_work.work);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rpi_hwmon_pm_ops, rpi_hwmon_suspend,
+				rpi_hwmon_resume);
+
 static struct platform_driver rpi_hwmon_driver =3D {
 	.probe =3D rpi_hwmon_probe,
 	.driver =3D {
 		.name =3D "raspberrypi-hwmon",
+		.pm =3D pm_ptr(&rpi_hwmon_pm_ops),
 	},
 };
 module_platform_driver(rpi_hwmon_driver);
=2D-
2.34.1


