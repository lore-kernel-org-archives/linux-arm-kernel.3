Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A22CD7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ffLbhXWfV1ZY5e3a0agdK2KLcuejXAOJM22evfKkX5M=; b=GMEIOcoVMxF8y4ndszh/GLkAD0
	g910x5BW2FRGiw4DhyV4F2hTxx9y0LCNPFEJCeqLWbM7kbzeMEOJBvaYHNHjukwY9Rhbya1mLXuyo
	bVYWOvqOu9US8zLbytlz6NrW6SMeJ5Ziw/KkLS5sQC6exR2tUq4nDCEmX3m9e6KDWr2xNB/5+Mb+3
	JuT/jklCAgNqWFMpmCt4Y+dvIANxcBXVrOj8jT9sem5a9PvDQg93ZrPGKXWZXPaWsdJfv45WRscMW
	rFT01BWELJk5oTXVgcXKaihpYpWvBNyffexCfUUHONhu2GopH/5B45ZNNtQJ5Lq3QKLcLxJIj+Isu
	pzBZq1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4tz-00000005xI3-3ZRj;
	Mon, 02 Dec 2024 11:47:43 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4t1-00000005xDK-1HyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733139998; x=1733744798; i=wahrenst@gmx.net;
	bh=ffLbhXWfV1ZY5e3a0agdK2KLcuejXAOJM22evfKkX5M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=f6PvWHbMsR7RbFYK5lEdlCBdi+iiwuaMtcsYIuOW1auGQAs77etl+G15t8rCi0sF
	 2K0NGWwR32J+H0bLj7m0vnrLaVrnEQs0HoVXNLvvSAvusFAaOx1YL1IOIuD0I3q49
	 4AZh799GdG/Ihc0MFS/yFnq7jNCG+rCZZmkVYSz8x+ng5eZj6VFvfMDTIc8wb6F+v
	 3YVk5jqwNMnI5zK4DUIWcf0GsWDBV9BhUNGtH5wagsCTus6T4iq6tgonCLm1aQetU
	 izgxpbkgZbgvYPULenXMPbRXIkoFh32BzIO6NdUZJyEcgFO0i6dCYFGABBDcZrlCy
	 1kEouQQXg9+XLNtoow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1tQM5j3hVG-005frH; Mon, 02
 Dec 2024 12:46:37 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V6] dmaengine: bcm2835-dma: add suspend/resume pm support
Date: Mon,  2 Dec 2024 12:46:27 +0100
Message-Id: <20241202114627.33401-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zKJIcHPKE3BE5onouobDEWkv0+AWV8gQeA0wvhVyfHohNlvpgVB
 hVY1zkXWiyTOY8xp7aC57ETtFfpIXUtmDDuS2qS6GOkU/tp/RTtk0L8AlJAXMI8hS83tdve
 nKkMY9W31LvUfVG59OwzhiOPeH4rKIIjJffbYF7a+X8narRNxUIjw4b1knD6fMkc5mjGItn
 JiBF8xTEX4iVErwUNfJEw==
UI-OutboundReport: notjunk:1;M01:P0:RRUChCbs2SA=;l964H4rfUnDHRORlfMVonlmYWUw
 4sW5ILzJp4xvfHTrNUuNFXwKmxs41M6rDkikPxHKlpLprkxDfnxMfhla4cRJ5jUKR/0wVK4Hz
 ZvyITRglHgsQ4BAZhiZKASdOJmxOiLElP6ft6j9IaIJqLQKxkIH4lMpR8goDT4Es/XDk8Zl13
 mPs4EIoer0XPbZ9Xj2gDbi3vjFStlQYPojRIFc0VQcUo7nVqOvJBhb6tTlFZ1irKnbBwGHO9m
 caHTgkyFHorLPW+8sxdHmvUktCOrm1rzvpFZLoxnQPRKwsIbq8lCI3B3rwLnFGL6RqIXUCsel
 QibkJgPVWvdqG4L2QRBRwk4gtFK3tAXesqCfsuiFy/u/AYMuNV5Qxvv57hp5OMPU4Oix95gW1
 pHVNSa3X0DoUAcS5jjBe93A2n014YGXKHGGKyCq5tUJHnl9ejThrQsVJHuJY0rT4r5LEV695C
 fzAXss76/OhqDSj6j/sqJ/bc0aCARO15d1KHvUMZLp4GE0H4OOe2Amtl6BkSC6SJEQJFfdgtv
 dMWWSf3JS8/bJhQtNQPnaCv2y+7HQkylWLjrD+Q2CqdIMXNNaYWjYzdgOFMj9m86NQ4foEAkq
 ssJJL5r8RtBoTIlIFmgvKsbHeVvCoBfprS/WNRHXMGbmDxkFtJnKZuWSwyjDBYb1e8ip5Hn+B
 2bdhOkb31hpL411x7hMYxwqu0j5RL9rffq/48pKdxsfoz0J+dSDou/Z4WHTsRS9ByR/g8Roga
 FNoydZ1VWAo+0oWAUBsBJ8tbW658YABeWo5WjkdzTrSOUBfUF/xKUcUCciS72zlDdp3KReLiZ
 wFmPkb6bzxMJTQBlq6lsuoc6S2kowHDcxGZTvH9XUj9ls+WD3vUyA+OEN02J+YBMFytPMZtWJ
 2CTdVXG3gIcP8Fm+T1EyX2sQC1I0DR5Z8UfOph00/uNBXh1h+3n2iuQGw1eitRB+/kgnB0kfp
 yGDdzGBiSRytyXVLPGMIlhHTd5k4xtOJYxq5HT8YxnoE8sEIEO3hsUlbibXlBmSPOtwbi0ptn
 mof/dh8csnsAoQ+JgObmniKfsVkZhYttpG4F5RgaJXPTwmTeZvL8IDBik8c1id4LyQnvKFBUL
 8OniqMi2K6YIxf8r95BD2qknrB1/Xh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_034643_627495_AC05DCD8 
X-CRM114-Status: GOOD (  11.29  )
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

bcm2835-dma provides the service to others, so it should
suspend late and resume early.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

 Changes in V6:
 - split out of series because there is no dependency

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 7ba52dee40a9..cf8a01a5b884 100644
=2D-- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_p=
handle_args *spec,
 	return chan;
 }

+static int bcm2835_dma_suspend_late(struct device *dev)
+{
+	struct bcm2835_dmadev *od =3D dev_get_drvdata(dev);
+	struct bcm2835_chan *c, *next;
+
+	list_for_each_entry_safe(c, next, &od->ddev.channels,
+				 vc.chan.device_node) {
+		void __iomem *chan_base =3D c->chan_base;
+
+		if (readl(chan_base + BCM2835_DMA_ADDR)) {
+			dev_warn(dev, "Suspend is prevented by chan %d\n",
+				 c->ch);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int bcm2835_dma_resume_early(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops bcm2835_dma_pm_ops =3D {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late,
+				     bcm2835_dma_resume_early)
+};
+
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
@@ -1033,6 +1062,7 @@ static struct platform_driver bcm2835_dma_driver =3D=
 {
 	.driver =3D {
 		.name =3D "bcm2835-dma",
 		.of_match_table =3D of_match_ptr(bcm2835_dma_of_match),
+		.pm =3D pm_ptr(&bcm2835_dma_pm_ops),
 	},
 };

=2D-
2.34.1


