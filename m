Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F38AC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OJJf0zimOPJzB7R6o40fNU2QqeDCYrBYo23IsRVzJQ=; b=EEau/8XbnpYlnhPMOgWwJ4FZu4
	VDQ6Xv/Qd5h9Sqh0x0QZJtnpbMgbmBhDBbHUg7HVInXJJ5+VLrdBZwmUaCXJyLJTpv7VD2bRgq9th
	+dT23da2Ft4G1tSYctvkg1r9nxPwXPTdJHFhC4GNdj1ilzh8+9V9H7QP5Ee0wtcCYOYFkc/JRYQF6
	dMRJnvEeSL2WnbDCgxkbO4lv9KTJ2WJdjDB957ZSeuzjnlmE2cPN4c+uqhtPwjkQ6jU91q/smV3ZI
	19/G+9lzqVeJU6adu24kKZnV+66fcOaQWwfcK2s3xq/DfpG0UrhhEYVO8G0PPUvC7pV/DBHpkjtD2
	xSCDKBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wua-0000000A7dL-2oBK;
	Wed, 16 Sep 2026 21:11:24 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuX-0000000A7aE-3TnD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:23 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593081;
	 b=nrzxzxhW37maonUh40ViJHiHedOZtRvE1Ng2ouokKWt6lAh8QhusSHjPOUw7QeIcLiAEIIlwkl
	  tIwnKnFmDa3wI9GRsVN7qCnjAh5XRHKtFG8yXzgrF87BDiWCHwaug092iz8SBE/eXdlpWWotB/
	  DnNaHto/88AiOYyWh2rlUImzngrAP0T7sVwPMUj1CA1hTa9cQYYf/Ul3lse8X5OHG8By97DGy3
	  yKwut3F5+Aj9Tdh2Zxf84LWR4JwyETK5WA5V2KfRvZQujnuN301MZ9xCEPbuRMB5KaRA3Y27i6
	  P0tVqsnImzOWU2YnmxC2p27U5VZwXuRg5wOmZUEMnXkW3Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593081;
	bh=UuqIVsdecwPwN8w0AomaFDbkgOyPw7g1ZVINhxzOqUI=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=iV7kDh1Gso+nWvRbKIj1sUbkJiJHQlU2LsdLZ/CsHwVZ6hY7tsoQa+7KYH4HVlDkdR7lJKfznP
	  osN1MQCxHjlw7ePHqqXHgZgfxmAFM7/S0atrOlvEYR61Kv/Ct5HMTrW55uJFn9fnWmHtgv5lZV
	  +MhDFvpwFJKV9lRsQVtjGwUc0a5K1Rls9K1uMTHEiKGOsNrp+kEwJCQWhpXh1Bs7Td+Kgi+3rK
	  Q85yyq+++IssIFX/jTEd6jzYXreJF1YJG6cSTw9S+7g4K7IFoX+7qP5QyCnPrjEOL6kfAt+wWI
	  aHvVLnPhxSLuXnOSL39sCTgSjsBxDFyUau8sRWwig+EEOw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+OJJf0zimOPJzB7R6o40fNU2QqeDCYrBYo23IsRVzJQ=; b=gh5K/dLJwkRw7QOLLlSJRGETOT
	CPF24Wrxfa1aVEIgvEa1hCcxB8Oq0ZkSopSlpbcJd6gHcEMGLdfWROU1Kn30P8GeuBRFIhPz4nBvF
	5hl/t65aE8YoRK5Ci17r14EJGkOUIdXavj9HyfuMgiMyX3wDNaUbb5Qm30JIg4VNOGzA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuU-00000002DUg-3lV2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+OJJf0zimOPJzB7R6o40fNU2QqeDCYrBYo23IsRVzJQ=; b=quUe1ey5u2pIYbtCFwfrE8myz5
	fnBxgNazPAjyLjs+WOdXYs5ld4gTIlY3Y5Vf7xwwvgkKd9QrrPJQjD5RaanYKGGr2J9KJqDVmWl99
	OXuwmh/5JQRAx5848Azec4sMkfDTUd0j71riHaq6CsJQkzmA+1ZqOyS1LdtV3Wbf8iho=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuQ-0000000058P-2gXw;
	Wed, 16 Sep 2026 21:11:14 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:54 +0200
Subject: [PATCH RFC 09/12] remoteproc: search for a fwnode during vdev
 registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-9-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=francesco@valla.it;
 h=from:subject:message-id; bh=UuqIVsdecwPwN8w0AomaFDbkgOyPw7g1ZVINhxzOqUI=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ9wxq3y7C77Wf/CNGGixZsHl/4lKDL+/cVsXn5An
 l0ucfWajlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAimy4yMhw67+EqF3HU6tj1
 9vXbfx2YV8Xx2fugMu9iq6jP5x6cP8PDyLDn1bXwOtvIsmtxix8eWfTqX+JPNo2ChSqTr58LNJc
 0MWQHAA==
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
X-SGantispam-id: 8323ae1975e2960a9d5fae845fd44d86
X-AntiAbuse: ID - 8323ae1975e2960a9d5fae845fd44d86
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuU-00000002DUg-3lV2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141122_066977_72F761C1 
X-CRM114-Status: GOOD (  11.62  )
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

The virtio subsystem already supports a fwnode describing a vdev; search
for a specific node during vdev registration and supply it to the
platform device that is being registered.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b7d9957534bf..e3ecc61cc1de 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -440,6 +440,29 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
 	if (rvdev)
 		list_del(&rvdev->node);
 }
+
+static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, int idx)
+{
+	struct fwnode_handle *group, *child;
+	u32 reg;
+	int ret;
+
+	group = device_get_named_child_node(dev, "virtio");
+
+	fwnode_for_each_child_node(group, child) {
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+
+		if (idx == reg)
+			break;
+	}
+
+	fwnode_handle_put(group);
+
+	return child;
+}
+
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -475,6 +498,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	struct device *dev = &rproc->dev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
+	struct platform_device_info pdev_info;
 	struct platform_device *pdev;
 
 	/* make sure resource isn't truncated */
@@ -504,8 +528,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	 * as device id, then we get duplication in sysfs, so need to use
 	 * PLATFORM_DEVID_AUTO to auto select device id.
 	 */
-	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
-					     sizeof(rvdev_data));
+	memset(&pdev_info, 0, sizeof(pdev_info));
+	pdev_info.parent = dev;
+	pdev_info.fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
+	pdev_info.of_node_reused = true;
+	pdev_info.name = "rproc-virtio";
+	pdev_info.id = PLATFORM_DEVID_AUTO;
+	pdev_info.data = &rvdev_data;
+	pdev_info.size_data = sizeof(rvdev_data);
+
+	pdev = platform_device_register_full(&pdev_info);
 	if (IS_ERR(pdev)) {
 		dev_err(dev, "failed to create rproc-virtio device\n");
 		return PTR_ERR(pdev);

-- 
2.55.0


