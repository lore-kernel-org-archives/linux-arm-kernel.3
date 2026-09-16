Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE42FC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4v98lwch7T5H/ou+qD354RhYPj13iFINK/7BGkYYthQ=; b=06ryyrYN/jDUxrzaxzv1S16m/d
	lI1EQL099oCQNpwGaDSRWB32SCSJngQnZLq2yimFroHsl7qlzCbyckMU9s6m6cEqYMynX52Ve1QwD
	W46UVky19oLU75eM/J8DHty8ZjE3KWIeKf8su3xzFdeiYmhNdSakjMFJhszeelqG8ajmczK//jU2B
	c1fPaNy6ahpocZWEbHoJRM1E8Ot/Y40XY8wN687encQTpbgDOgtJyFonKjA2buI6uq/uLVpRICSIC
	6wM4HF7ZYZqUJqoLbCeuPEMXknFuZ56ktsBJ37sup0JZHrijLFCAFSaRLVJkWPiH1piuiUsPzFA02
	UxxgXFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wv5-0000000A7v3-1pbu;
	Wed, 16 Sep 2026 21:11:55 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuh-0000000A7gy-0BTz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:32 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593090;
	 b=MI7I4RP0S5001UmbN+vsU55rLMVCt3Im+UeULN4SFT7rsNWGvDdv51cTZQJYdiUGDqY/5Yn8he
	  8ym+cNF2pNzFluIaSo31BzGbbw7Qua+WIJ2/i8e1ioZetu4rnY4TE50lmPfBeV+3ZpXoLt9StH
	  NG+t81aTBBgYr+q3bcgjj597C5y6hcWaWv+Wi6FghWWz/ecYabZ4imd7cxv49rVYjze4mZZH59
	  arke58ezwTkidyjnm+q6gRCh40RJxt9cIReEB95Z0JLtHawdrXlo19CUqpahZorAB/BlnADqvI
	  mTMFj+kNyG0NruF4vm7LnywcD9SWaB7U3tYFhYCONMWIbg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593090;
	bh=gf3EQAJ4VfBmxjFUqtfvGealL0LGSZYcwzq8jUweQJY=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=p8rpk7Z2lFbPWLqoX1yUuKWRKfLa5A+4Vnlo1ERxTOjhLQAJJqdV/aTAkeUTL3oAIb9mpHTWqu
	  Br+5fQLfwSnLqePHAmwpd9slFGtfgvWSl1TmS4rGOt3XmL+RqnFctxpedZePikzIMzH6t7MlrP
	  6jZ8JPTceAldaMi/lh/fpYeY4XCqxB7SZ4VVr/OzkBB3m/gRNuXW0HKVq0dlX1mkGr3e2rnQhd
	  i6dYb2pKjikmAn8NP/2gwtjA3hsXYDn2Fd8pvwaVF+MqOM+UTSAhjeJ4FHtqhE1wO145uiD3mV
	  MECRGigDufcv3h9VQgikLXErGEIDMpDUvPhs2D7dJB+LRQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=4v98lwch7T5H/ou+qD354RhYPj13iFINK/7BGkYYthQ=; b=BFu9CRnX83491MPe1zz//xuBOm
	TBnnCF6M8dkpp6fISet+I4iERE0uUz8nYce4Pks5LOhamFUmcXDtUgLegD8meLX9PfYU4foSA6gFb
	4VQltJlP+Hryn7ZeVq44JR6s1LH5IhFgvl+UO4lhOBMdB8XKZmjk4jjiKEO5QXnc6uBc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuP-00000003Kx9-1KKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=4v98lwch7T5H/ou+qD354RhYPj13iFINK/7BGkYYthQ=; b=UX2aPUx3q6a3d2PqiqvbhB34cD
	pFGpJtQIvSaG8lyEhGEYFH9jVXavg9I1QynXUN8Hyv9l/V9G16u/Z7vn1i9YWxlNfYy29qFL2PT6u
	YK7I9EVRr0FheZTAU97Rgq6ghBm9M2U0K4y3DJQVC+cYBmomxoO8stx84dVqSjJdSL7I=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuL-0000000058P-08T9;
	Wed, 16 Sep 2026 21:11:09 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:50 +0200
Subject: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=francesco@valla.it;
 h=from:subject:message-id; bh=gf3EQAJ4VfBmxjFUqtfvGealL0LGSZYcwzq8jUweQJY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR/vWa6u3bL7gcDtjYayjBmN07c8S/E4NHeLvPJpJ
 12xa08WdZSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATuXiF4X+Yd+yHlK5n0pk3
 v3/ZdKJo0srTy+MP2Kbbu5jfMky40vmT4b+H2LI6W1nn9IMd3nyP1oeV7d0S2/loR0IJ25zwmWc
 +evMBAA==
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
X-SGantispam-id: 3a3c573115fbc3b9f80fe2d4fee1e906
X-AntiAbuse: ID - 3a3c573115fbc3b9f80fe2d4fee1e906
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuP-00000003Kx9-1KKX-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141131_097737_1C9AC5DA 
X-CRM114-Status: GOOD (  10.55  )
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

There is currently no way to report the VIRTIO_F_VERSION_1 using the
resource table alone, as the per-vdev feature array is limited to 32
bits.

Considering that the VirtIO 1.0 specification is now ~10 years old,
always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
it.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 74e0da970f1d..cfd66d9d1c9e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 
 	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
 
-	return rsc->dfeatures;
+	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
 }
 
 static void rproc_transport_features(struct virtio_device *vdev)
@@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	/* Give virtio_rproc a chance to accept features. */
 	rproc_transport_features(vdev);
 
-	/* Make sure we don't have any features > 32 bits! */
-	BUG_ON((u32)vdev->features != vdev->features);
+	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
+	if (WARN_ON_ONCE((u32)vdev->features !=
+			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
+		return -1;
 
 	/*
 	 * Remember the finalized features of our vdev, and provide it
 	 * to the remote processor once it is powered on.
 	 */
-	rsc->gfeatures = vdev->features;
+	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
 
 	return 0;
 }

-- 
2.55.0


