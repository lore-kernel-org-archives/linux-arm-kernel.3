Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A54C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bfi//4iBWflpifsqQu1VKkBu2tJTFizXLg4sdBHJQ0=; b=Sa72iIhdB726GkRNbbHj6K062+
	bTkz7+sSe+R8Cc2xVrwXgNxQmHng6QnVNKHpjL7S7NzfnNNt5IBye2U6K7KPJf/UzkxbiGeBkn/9q
	hOSwp3UmIVlxb7wn8HEEJfSumxaog9pfp2z5ObbRWpLNRE7LXm+nzDOF35I2DEWzT5zfPmwyKanqF
	M8SO3b14XBGD0ymxqpzXpRBdQBKER4BU9bevgE8UnK9ZWvqvyLAPG5wwH/MAzx/6uiiP1iHS03K8x
	re7QHcjfmd/AYstQ3pLzs0EqXVeAAndH08lW1C+R+qUOaWS0pvEP8lekVDUHciZvwcZx0Sw63Hq4T
	AgJZOqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuZ-0000000A7bl-46Rv;
	Wed, 16 Sep 2026 21:11:23 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuS-0000000A7Xz-19Wf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:17 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593076;
	 b=km8gc4XhRoTDYzQn7m7DMY5GKOLsiB+jIPIWFRKIZLMk2/+sdai/I7vsAj7vA9D+bAFf28WIrK
	  5jcNjHS9GeLRC+agMUlvdO77M7RCuHXbyTxrqgjhm61i3ZmIzE5bQeuxK6/+nlL0rYKD/i5YZM
	  l4iWsD7yhTLXPLxDdlhx19k+IusTerXnC8uo0Ij0aEEkSZmVKvDHgnqVCtnWFgPcX25YcXDroW
	  AeCCE/fd+NAFktUNZPlu9DXxDdckR+j1/O9CynrlB85zYsV8HMLQgBoan9Rz/gJDWs9ItlNtSw
	  zROCpeeVxQQGbdvUVbRP6ZsNFHp65K/UFccACp27vwT8rQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593076;
	bh=GA43VkbHqER01zDTwAx5YQK+oTAg4fjkEJYtZq+Av3o=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=oiUV0pnJwarrRLd/K5A+vpUiMPu1GlTBzSrOrCgVYmD/9bDNfF0gfF6RyuUfLEWjne/k91Ihbd
	  EcrDSupXQe4Fj0OycdXWJu1yPgmyZqioEXigdBxn0bmceQtasUSqzU1+e7UYIJs+v+ksOGLJJX
	  ajZerOferx1W0EBUJfiifE2PEa1QczkVirPOjyqCqrbhGRWkZ7G2WcVVE6OPYAWDzMxty0JmPf
	  Gpv93n8tIDwR96aeIx9GWflKKo0OeTtpgxYpz04+y5GNIMOahVtqlV5i8L+LdNPai2alnrHI+2
	  TFLAy9y4ygPV5z4put7k+nJ0HWr6rlDYNcJOGpbrTlNevg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=0bfi//4iBWflpifsqQu1VKkBu2tJTFizXLg4sdBHJQ0=; b=WsPrkEo3VuwE2BRdvPpxN7D8o6
	ojKiyBUcGJk1emQNBPW1xg+WBBhF/z3ddFfS4sRPJXWp3VoKgg+AQCAwNAtY7mcOiLpJeMYcimHDB
	QMfAOVEwvsadhp6oxCmwuQX2FDnRWjfcJIb0Tw57k43VeKOwDE9jNfG9Pvy02tJI1xSc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuJ-00000003Krp-3hvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=0bfi//4iBWflpifsqQu1VKkBu2tJTFizXLg4sdBHJQ0=; b=DF7q3DU5LJeHMMSDvxyO4rrxqW
	qWIJk0NYo14ZmYU2P9BItxIUY8RzG74/+He5UXGD5TLl4ACrA4C3gPumz/6Qd6OkYzpZxux31EAJe
	okiQCQ9cLa0eBFsEHDNyLCqWbqjF4gWzSGpfws9bJfsQIO6WsoEy8oSyY0Od73o7Ovyk=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuE-0000000058P-3bHV;
	Wed, 16 Sep 2026 21:11:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:46 +0200
Subject: [PATCH RFC 01/12] remoteproc: virtio: cleanup rproc_add_virtio_dev
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-1-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=francesco@valla.it;
 h=from:subject:message-id; bh=GA43VkbHqER01zDTwAx5YQK+oTAg4fjkEJYtZq+Av3o=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR8ft9qsOP/6zc0mqevMn+124n6Yp8jQ/WWyXeyha
 9Zb9s481FHKwiDGxSArpsgSsu7GvT1zzb+lbWB8BDOHlQlkCAMXpwBMxCCAkWGuxe+LPYcj5DpF
 F9gUGx7g2BFwMZmnVvqU2R2Nr1cusr9k+F9vfUM6/Nec806yHg8PmRe/Wqz192+OE3te+WPJ61v
 zNjIAAA==
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
X-SGantispam-id: 43cc3429c06fd47df5d3a037cebea75c
X-AntiAbuse: ID - 43cc3429c06fd47df5d3a037cebea75c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuJ-00000003Krp-3hvN-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141116_322045_03DD26A3 
X-CRM114-Status: GOOD (  10.68  )
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

There is no cleanup to perform in case an error occurs inside
rproc_add_virtio_dev, so remove the goto label and just return in such
cases.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..096bcba527c1 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -376,9 +376,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
-		ret = -EINVAL;
 		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Try to find dedicated vdev buffer carveout */
@@ -394,7 +393,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 								 mem->of_resm_idx);
 			if (ret) {
 				dev_err(dev, "Can't associate reserved memory\n");
-				goto out;
+				return ret;
 			}
 		} else {
 			if (mem->va) {
@@ -412,7 +411,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
-				goto out;
+				return ret;
 			}
 		}
 	} else {
@@ -431,11 +430,10 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	vdev->id.device	= id,
+	if (!vdev)
+		return -ENOMEM;
+
+	vdev->id.device = id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
@@ -447,13 +445,12 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (ret) {
 		put_device(&vdev->dev);
 		dev_err(dev, "failed to register vdev: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	dev_info(dev, "registered %s (type %d)\n", dev_name(&vdev->dev), id);
 
-out:
-	return ret;
+	return 0;
 }
 
 /**

-- 
2.55.0


