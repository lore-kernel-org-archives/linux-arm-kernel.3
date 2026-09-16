Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801FBC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyasnvLYTK4E6U/h+Yqi9jiKL9ObrEvgOlp1gRjyPL8=; b=Z6q9dYbT9nUXDZvJiILeBDR5TJ
	UnaD2TcXe/iNjq8E5q5qpZXeBMuj0yLjeesrFwhDtrVsX43cOoQD+qotTGdmKARgm51LZqWz973Wg
	TZkFIMZYJHgzI5MLMTGBkCMa0bmUWfEqeAZespIIPDxzHJ3Dhs7E6i5+7GoJ92YSstps9hgZ9KAll
	mZivqQx2gzs5Mfqu4o9thTSgU5N8m/XUdqfcAr3oKl8TLvHvQRTMOgCPSi1t/O4OO6YvltAbJRgCb
	tsmO9IOEye+vRnzr/Mrro1uRvOuAnJLYWPQx/hTO9OJ3ds487NEgh8rrYmt/e1y9x5pAXO2reFUhY
	joHz7lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuT-0000000A7Yy-2mP2;
	Wed, 16 Sep 2026 21:11:17 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuQ-0000000A7Y0-1gsi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:16 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789593074;
	 b=uzJTHVzpbQuHKusHZmadKgLCNC+suGKDoSISrJtVsyh6d1xvs/rfsEUsYf/c+QbkcffAV76Nvv
	  /vfcf0bncHLaWSfO5czQv6Mk29UEQSXIoFAQKrTeijsnZDYnP8D/I7ZwTb3gjeNQdx02BmTFvL
	  IJLj4xRdPeHfgPfUu7gVS1mT5n7kTj6QGz6n1NvCIPAwzHKz2PGRr7XuTOoHPkfVUwzufyRr56
	  AX7n9wDKcF7ESsMTTDeW8+LqQ6LsEsHdHEp99KVGIXFBF4xju6dC7LR+ZQBulvRSooJ/c2zEl+
	  P9kmZVwEQS1v3CLpyCD6SBAW42AAA77lGQGE7CMtyC+0aA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789593074;
	bh=4K/BQ7Jjv90QPg7ueeHHowYL8JOzF3baJD8cfzWYIS8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=p5eFmQlAqDEiP49M6rdgJEWtOwvh/iCP/rgZ+B3Kb4JAw+pHUnNSTtJ35Mf820A129WOPIoRqI
	  3jnx6dLYnZYZPOclWpjpbiQIlrHG4dYnaeYufDEEbhvHIhPeZeqrW3a8GMiPEBfUwd7wqESTIv
	  MiBqE4oxLNi78F494+vCMu9V7Ho9K79ZIJT295pFgSwdnattrSOeRBmiULtbmEpFScUm6DTpGI
	  CMlW5kE/jKL/+UV3G1t/UdRPHXjYECPD11Lej7zAUTUOyR+JUPrvSsPB4LVv/HrMIU4ScbVG0b
	  WP6ZkPoiug463sKfS5u/XRm/4IrWKXonle6ppnZ5gWYhUQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=JyasnvLYTK4E6U/h+Yqi9jiKL9ObrEvgOlp1gRjyPL8=; b=EQuE44gLftmEbFI5zjB7AVZtqs
	KIMn/NduzCC90i1bzBqg+Q4l/MbIHtrXuVblxbnYdXqxQd3CJHn7DkbPqcVCcS0wbeIP5Vb3SAATH
	qlwi3g4zmuAknZIHnCr1lm/bpWbIDVn3RBs1lUM42IFGez5WPlmdeLy8Rh+9WBQhoI1g=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuK-0000000BhgS-2XwJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JyasnvLYTK4E6U/h+Yqi9jiKL9ObrEvgOlp1gRjyPL8=; b=c4PgO7sraeZ6twB3Jr8Upwq0PK
	B2/pfEbBD85NwmHY2I4Upi28D1wuDMVDanGe/epoqjgEnx47pUUTnYLPnMR2byLBKXDyQY5S6LD+j
	DFBlfJPm0j00PG/wuV7P+OSnCFRfyeP1kB/PWJvKlaoyWgjOPjc5ii+zcjml9SWXgCEI=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuG-0000000058P-19pe;
	Wed, 16 Sep 2026 21:11:04 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:47 +0200
Subject: [PATCH RFC 02/12] remoteproc: virtio: replace commas with
 semicolons
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-2-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=francesco@valla.it;
 h=from:subject:message-id; bh=4K/BQ7Jjv90QPg7ueeHHowYL8JOzF3baJD8cfzWYIS8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR/rnMl8vO3aGtb6y/OEn2rxdJzzM7exMKm6tXLxC
 bm+JRlhHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBErhQz/E/gOxz30inzhpvu
 q8gfmlN569/ayrydfez+gmuS1/9uYD/H8L/+VLqCLMOmo7ota6dJelz//NBa0FQqtCDXx/c869Y
 9NzkB
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c71e4f5574f32a41212f86516b834fbc
X-AntiAbuse: ID - c71e4f5574f32a41212f86516b834fbc
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuK-0000000BhgS-2XwJ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141114_804868_5B2E411D 
X-CRM114-Status: UNSURE (   9.19  )
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

While not technically wrong, the comma at the end of an assignment
directive can lead to nasty bugs. Just replace the two occurrences with
semicolons.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 096bcba527c1..4dacd93bf238 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -433,8 +433,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->id.device = id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device = id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 

-- 
2.55.0


