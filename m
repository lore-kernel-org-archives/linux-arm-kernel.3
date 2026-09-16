Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6977DC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQVoOO/zbpaeb/l4qLVnNDj9e2y11NOFxhc+SjTbWPc=; b=YQGLtqc7C/NPIpI0ZVFv7MLZzc
	05zBdmSMqOS90fOI3oI9gHqL/P29P6689rErX8M2ebJejaTqShBHrFoFZf3oAaFJ6II+uBiGC3+dO
	f0ngN2Q/JuWzFcj48+Udbvdfo8KfIzPqA6TNpvU8XadDK3udZuaoffXld/a9aN4VkDUsaaN8o6fv7
	jq99q1nh/dnjhI5NirXmsS8W83Cg+MUIWSK17WIMwQvmnkjOcKU86ygeuz4EUOjwr5MazzYDKnB9P
	VgJOQyRiXMI4shGvcpNR7aE7x+UQkKrDW6p3zKyB0h8Gj7wRxkPIvHsewlhBkFZpOAR7MKSDbPSGX
	itKaljog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xUN-0000000AAef-3O0d;
	Wed, 16 Sep 2026 21:48:23 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xUL-0000000AAeE-0toc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:48:22 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789595301;
	 b=QrnvAMjjvYDGNTyVesna9k6F+Mu+9SaWHLwDU8wXlTKiOyj1x67ze1QHbT0IymNnsLzcwjc0Po
	  rjiOQ3Fa4aO+tkeZvPcIaOXjCHcNlTiWC4R27VymXu4uR7cp7//kgF2zYsw+OooarnyLej1rUp
	  sPv1JBdRm1O9EbPkqy34w+8O1OuxGddFH+cA501iyP3Uyp4FnlPlOLslIz00oAxpCYaR9tC05D
	  KRlP1Nd7xXVQidehkqs763uGGKm44ONCZr7oHKoJpVmsIXDedJVkuN4gs5vv/l+cXxEqhbs0XS
	  xkdg/0Ti6rRqHlBD09xH4MDiVRI+u8pOIRleZYrBj//lwQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789595301;
	bh=5RpInneuPFremFn6IGVocs0wamQaJJ0xuph/2qEoWFA=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=3krXm6+/SJluj/CF4PFIMcLiqQmbRnBY3NoRCQC7Jmjq/QxXP/j+BB4oicEdnC7JfCTewBGTMb
	  JSD3ZIw00O5T/Zk/1kW8O9usMXoz+A5r5iFpRnqWFeHsWCqK1k6HII7JT9UBuH32s/xOGiMOwN
	  AvRmmDP2BZM+N1VobrHGmBntHcqlRt0NtHDKXfQDChbQ0Qd7xSuTZ3iweuVvWvTj3GIuUiuZgr
	  JNZhVvCETGJUw8/8YorOivQSUTvaCSBRrHN1WsCm/+K3MvT4FzWNeydc4f0olIFaYMcm8xaU9R
	  sykIi0BMfs8w0CXXUzzupXHGrD4OOf/5DiJWs548ryXL7Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=VQVoOO/zbpaeb/l4qLVnNDj9e2y11NOFxhc+SjTbWPc=; b=MBKC4H05dtNSA1SzgovU8ZbgUi
	WRBPezjIj7y4ShRcsyjrjgc6R5es5n/iTUB1Ud2ojJWCZsG9qmqOziHnUPGNPUarSME8j+QhrbYHy
	YGujoZ84oKYtdfMlrvhInbGp20BDBPD49qKzI+wPYu8DBKrDhU6nk6wWJ2dHRjBdWLxI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6xUH-00000002c83-3qI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VQVoOO/zbpaeb/l4qLVnNDj9e2y11NOFxhc+SjTbWPc=; b=MHHs7zTH3GK9FTI1K2dcbUyBIT
	q8tRhi/NJvR6+MO+3GGTVwn4LCZW5XbeJmxYe9D9Lq8vxF5M/fOBQwiVxhs8TsYaaesL89Nn5n5cq
	JUnxSR/3+Oi+RGCv9er5Z/iFdQTYODXlOtZj2ds900oDRlRCqFN78TDGDtb/7iyCPubM=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuR-0000000058P-2urL;
	Wed, 16 Sep 2026 21:11:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:55 +0200
Subject: [PATCH RFC 10/12] remoteproc: imx_rproc: always use non-blocking
 mailboxes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-10-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5141; i=francesco@valla.it;
 h=from:subject:message-id; bh=5RpInneuPFremFn6IGVocs0wamQaJJ0xuph/2qEoWFA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ8wVjamH5pQ1v6rb3vpIv/4BI25fgUp/3Tvq67S2
 lLyqsWlo5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjIDn5GhhsL14SeifMKn6y0
 OHlJ0cy5U06pTpv6Q+yg5L5tIpvvSbsz/HfesCfDI8aMLb7s/dFPPNty3pi8nsi6e+nqVWtrf6V
 zPWEGAA==
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
X-SGantispam-id: 57fab85890f63aef5f5d1d76dabfed51
X-AntiAbuse: ID - 57fab85890f63aef5f5d1d76dabfed51
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6xUH-00000002c83-3qI1-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144821_515308_C62D5A6C 
X-CRM114-Status: GOOD (  15.37  )
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

Blocking mailboxes may lead to sleep during the kick operation, which
conflicts with some virtio devices (e.g.: virtio-can) that kicks their
virtqueues with spinlock(s) held.

Align to the behavior of all the other remoteproc drivers that use a
mailbox to perform the kick (i.e.: omap, st, stm32, ti_k3_*, xlnx_r5)
and move to a non-blocking mailbox here as well.

As a side effect of this modification, remove the close-reopen action on
the mailboxes during restart and shutdown.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/imx_rproc.c | 49 ++++++------------------------------------
 drivers/remoteproc/imx_rproc.h |  1 -
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..100440328f92 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -97,7 +97,7 @@ struct imx_rproc_mem {
 /* Linux has permission to handle the Logical Machine of remote cores */
 #define IMX_RPROC_FLAGS_SM_LMM_CTRL	BIT(0)
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
 static void imx_rproc_free_mbox(void *data);
 
 /* Forward declarations for platform operations */
@@ -444,7 +444,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -712,7 +712,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc, true);
+	return imx_rproc_xtr_mbox_init(rproc);
 }
 
 static int imx_rproc_scu_api_detach(struct rproc *rproc)
@@ -877,7 +877,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	queue_work(priv->workqueue, &priv->rproc_work);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -900,7 +900,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = tx_block;
+	cl->tx_block = false;
 	cl->tx_tout = 100;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
@@ -1223,22 +1223,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return priv->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_sys_off_handler(struct sys_off_data *data)
-{
-	struct rproc *rproc = data->cb_data;
-	int ret;
-
-	imx_rproc_free_mbox(rproc);
-
-	ret = imx_rproc_xtr_mbox_init(rproc, false);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
-		return NOTIFY_BAD;
-	}
-
-	return NOTIFY_DONE;
-}
-
 static void imx_rproc_destroy_workqueue(void *data)
 {
 	struct workqueue_struct *workqueue = data;
@@ -1285,7 +1269,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -1315,26 +1299,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
-	if (dcfg->flags & IMX_RPROC_NEED_SYSTEM_OFF) {
-		/*
-		 * setup mailbox to non-blocking mode in
-		 * [SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_MODE_RESTART_PREPARE]
-		 * phase before invoking [SYS_OFF_MODE_POWER_OFF, SYS_OFF_MODE_RESTART]
-		 * atomic chain, see kernel/reboot.c.
-		 */
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register power off handler failure\n");
-
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register restart handler failure\n");
-	}
-
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
@@ -1447,7 +1411,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..9a1400d0d081 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -16,7 +16,6 @@ struct imx_rproc_att {
 };
 
 /* dcfg flags */
-#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {

-- 
2.55.0


