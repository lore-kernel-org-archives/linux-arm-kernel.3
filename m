Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3E9C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCEMx2gqALfiJ0dobbqXt450/zYKugDTTzi6P0ffmes=; b=YFEIx4/YlHYp0y6CEXC+DH+MFp
	jBlBs3kQnZ2omaXVj+bwkwIri+eKo7ymEqSB18lAGMv6i0aoZW69jdXJgXS25yshDbIAhhmIpNpHT
	BXjKlObnOvU2IpWCV4aouy5/DXm5rFf5IVhf8BLWG+sUbo6cD7B/sCCxKxqGVtO7OyS3+Td/gZ2OB
	x6U4qC4+sICH2vN/NV04wGIft6ZMX5Vw865ZCNSjc+QFXSE3QgxuZL4fnD1wGefpRJE9GmI7wn8qA
	RSVDcJiPjSiqGGmpTGB/QrV+ajhZWRQ+i+M0JsCFJIM6l/sM95cf4dQo43hxe2w/ugB9laYtejUZD
	wEmhEbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wua-0000000A7cl-1dmG;
	Wed, 16 Sep 2026 21:11:24 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuV-0000000A7Y1-2fxS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:21 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593079;
	 b=Ata5LTllq8dktba0uV9K9nMGeL5cRwaTmQ5HdDDspHFrG/AclcrtoihI2eBcMQMecvnqyVmXOX
	  Sl/43PEU6jOR4ds8Yu8HGcY4YvD50eGX8MlYTtAi3jCNQQBaxdk56K3aw38wsRqoazfh7a/Ffj
	  bpnhDObVaGEF7dpE+vJpsQw0gvuZGwd7ofrxKMs2snOHvm9y++0tLFwDYIFNKf5aDjzVY9Hu+W
	  kWwvq2ahxlHcwbqK3UpXV+KKftThKGhq9WETecex3q1Tv+hEf/abMD8AhpdT0LVaTCaKcxa+uo
	  5S4rp57wYSCq++hW9QMshNMA3A+G/flNGiHKydHeggBswA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593079;
	bh=fnFloY2yfdzMxpk0tNVPh+UipC6nyWvGoOUQ3l9T4yA=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=mHcl+1iSnRQwO0xJfES/nXxRXByL3h0iyDsiaNl09HCyASSX0ulqLYbs8WkhFHJVox9WUOFRNU
	  7kfJxUJSrRtBLoNPbvq9cZoRevRhOPiqCJ6dYnQTn8CoHugc3wic6IM6pHqGKlzpMgZwhVU5/v
	  qrCKN2UiJg1u+yLAxgyybj4oHUvwIjnEE8+yKDhewAEBNt1CIcCnkNfRGmbPF3xfgt49YmsoXt
	  kzb090pHABYZcIhmXJXAS2gzpbpm4VzNbrF5bEax07YmAIFc1OnFr2mQA5VmEKjb9EC91GmazF
	  xlXysPU+o6dBZfHIMCRemLbb1ZXFoM3huHZdtD+70VHXjQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=GCEMx2gqALfiJ0dobbqXt450/zYKugDTTzi6P0ffmes=; b=rPD4oFnLtccsck5vWl7QwxPqQt
	BzcBaKtVtbpWTPcebumwbm1K2pSG6yQMdSBq4LwMg45dCY8VFaNZlcbr9YMoVz55qDcba+ihumAYZ
	njngbV8VD7naTVXkLCcJnxDXXOSBXZudKSD9oe/QOrK9N0Xr7pcIkrbwPj4GcogKdDu8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuM-00000009s3v-410s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=GCEMx2gqALfiJ0dobbqXt450/zYKugDTTzi6P0ffmes=; b=KY/vlcqNr5opulrkCK+q2x0Hl8
	YCHCWK8ha7HDUHo/1vbTpZUhoG/7lJqyafCnnhol0f4i+IyQmJrsaKFo39vdxSL9zBE5DrOru8daR
	xy2kKyzhyciyp9se4X+yTnnkVti/XP5BMb2nVe1+cKrHExO2lJm/eVvGe+hLUEjyHV5M=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuH-0000000058P-2R0w;
	Wed, 16 Sep 2026 21:11:05 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:48 +0200
Subject: [PATCH RFC 03/12] remoteproc: virtio: support dynamic number of
 vrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-3-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6080; i=francesco@valla.it;
 h=from:subject:message-id; bh=fnFloY2yfdzMxpk0tNVPh+UipC6nyWvGoOUQ3l9T4yA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR9ziFdNYVv6fsv5j1tuHp1Rc/CT4qvVArMX/Ljy8
 b3ex1MRsh2lLAxiXAyyYoosIetu3Nsz1/xb2gbGRzBzWJlAhjBwcQrARE5xMfyVkdqmpjx1f0yj
 XHDlt6W3/+ZEetkJds7byHSq4ENt5Uwrhr/ietOsC32PPVe8flZ+IQ/v7Udlub+03yrvzvvEfND
 s6yYmAA==
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
X-SGantispam-id: 41e4550d0bf4093ab78848cc09463985
X-AntiAbuse: ID - 41e4550d0bf4093ab78848cc09463985
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuM-00000009s3v-410s-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141119_878961_24A66B7B 
X-CRM114-Status: GOOD (  20.61  )
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

The number of vrings for each vdev has been fixed to 2 since the
introduction of multi-vdev support [1]; this is completely fine for the
rpmsg usecase, but can conflict with other virtio devices (CAN for
example requires 3 virtqueues, entropy only 1, network a variable number
and so on).

Remove the static vring allocation, transforming it to a flex array that
is allocated at vdev probe time; for the existent usecases (i.e.: mainly
rpmsg) this leads to no functional change, except the additional memory
used for the counter associated to the new array.

The maximum number of virtqueues is limited to 256 due to the uint8_t
value used inside the resource table to indicate the number of vring to
allocate; for this reason, no additional plausibility check is performed
on the number of vrings indicated by the resource table.

As a side effect, this also fixes the single virtqueue usecase, which
was apparently supported also before but for which the remove action
caused an error (because the remove action was trying to unmap also the
second vring, which was in fact not mapped).

[1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   |  7 -------
 drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++--------
 include/linux/remoteproc.h             | 10 ++++------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..b7d9957534bf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 {
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
-	struct rproc_vdev *rvdev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
 	struct platform_device *pdev;
@@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
 		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
 
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
-
 	rvdev_data.id = rsc->id;
 	rvdev_data.index = rproc->nb_vdev++;
 	rvdev_data.rsc_offset = offset;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 4dacd93bf238..74e0da970f1d 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -115,8 +115,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	void *addr;
 	int num, size;
 
-	/* we're temporarily limited to two virtqueues per rvdev */
-	if (id >= ARRAY_SIZE(rvdev->vring))
+	if (id >= rvdev->num_vrings)
 		return ERR_PTR(-EINVAL);
 
 	if (!name)
@@ -500,17 +499,20 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev_data)
 		return -EINVAL;
 
-	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	rsc = rvdev_data->rsc;
+
+	rvdev = kzalloc_flex(*rvdev, vring, rsc->num_of_vrings);
 	if (!rvdev)
 		return -ENOMEM;
 
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
+	rvdev->num_vrings = rsc->num_of_vrings;
 
 	ret = copy_dma_range_map(dev, rproc->dev.parent);
 	if (ret)
-		return ret;
+		goto free_rvdev;
 
 	/* Make device dma capable by inheriting from parent's capabilities */
 	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
@@ -524,13 +526,11 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rvdev);
 	rvdev->pdev = pdev;
 
-	rsc = rvdev_data->rsc;
-
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
 		ret = rproc_parse_vring(rvdev, rsc, i);
 		if (ret)
-			return ret;
+			goto free_rvdev;
 	}
 
 	/* remember the resource offset*/
@@ -566,6 +566,9 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	for (i--; i >= 0; i--)
 		rproc_free_vring(&rvdev->vring[i]);
 
+free_rvdev:
+	kfree(rvdev);
+
 	return ret;
 }
 
@@ -576,7 +579,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	struct rproc_vring *rvring;
 	int id;
 
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+	for (id = 0; id < rvdev->num_vrings; id++) {
 		rvring = &rvdev->vring[id];
 		rproc_free_vring(rvring);
 	}
@@ -585,6 +588,8 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	rproc_remove_rvdev(rvdev);
 
 	put_device(&rproc->dev);
+
+	kfree(rvdev);
 }
 
 /* Platform driver */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39..c3ba51fe9e54 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -319,10 +319,6 @@ struct rproc_subdev {
 	void (*unprepare)(struct rproc_subdev *subdev);
 };
 
-/* we currently support only two vrings per rvdev */
-
-#define RVDEV_NUM_VRINGS 2
-
 /**
  * struct rproc_vring - remoteproc vring state
  * @va:	virtual address
@@ -350,9 +346,10 @@ struct rproc_vring {
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
- * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
+ * @num_vrings: the number of vrings for this vdev
+ * @vring: the vrings for this vdev
  */
 struct rproc_vdev {
 	struct rproc_subdev subdev;
@@ -361,9 +358,10 @@ struct rproc_vdev {
 	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
-	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;
 	u32 index;
+	unsigned int num_vrings;
+	struct rproc_vring vring[] __counted_by(num_vrings);
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);

-- 
2.55.0


