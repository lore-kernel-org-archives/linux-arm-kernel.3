Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F4606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y3J9AYx+;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Japwh3Kf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3R/yD9txiKhDcdkpR168UOWMiy5EvmjNi1jSQMpyTg=; b=y3J9AYx+nUy5lOoVbBEnCL5/oe
	F7DKKjBFWRAIIejs75v3lecXY3Qfo41xtt5y9KpHUnG0EKrQNgv0R+0a05NL3vFW5AMtgpAqOEJLy
	P/YBg1Ol+5oCiZ5wpHV8+EGCLsglZxGn/t/dZPcKWUOUZ1G7kgQK3Y4Q1sHC1kXHt/fN8pCLAHvVc
	8jUcRZHCxwha+3mxiZYF93j32vqvX3ij4LIObPBpJCU003K8ZPW+uILjXWeQRZ0Ijw9uz6++pezlL
	eb1dHDQsTjb9umZ23cRb6hQr9p3df9q2koz2QFFtDZa01ZXoTu70bZmCOG02T5S2VtjwZ2GcU1wI/
	QZs4tyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6HF-00000009IOI-3sHq;
	Tue, 20 Oct 2026 09:37:01 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6HA-00000009IIw-2bmj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=J3
	R/yD9txiKhDcdkpR168UOWMiy5EvmjNi1jSQMpyTg=; b=Japwh3Kf6G0uYqhpEZ
	LW22YhLSZ2jVThdBByZYXRcWi3i6HfE2WMHbfKFjnAUR3BMGCGbcO40RrlEv0gsg
	/5ENuYM4Xo8AJp0E7SN1jD6Mc1g3sM//+IWoFF5pkXCQJroBAPQtemaAynYbC3/m
	d+mdgDB36u9gDcoklHYl8Xfeg=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S3;
	Tue, 20 Oct 2026 17:36:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/3] bus: imx-aipstz: reject devices without match data
Date: Tue, 20 Oct 2026 17:36:33 +0800
Message-Id: <20261020093637.1654161-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020093637.1654161-1-yaojiale02@163.com>
References: <20261020093637.1654161-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3_4ImNtdqupV5Aw--.29320S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr1ftrWfur45ZryxXr4rAFb_yoWfKwc_uF
	Z5XFyxZF15CF1Dtw1rt3ZxZ3yakr1Iqrn7Xr4xtasaq347Zw1fXrZ3XFWrCrZ7u3WIyFZ8
	Gry7ZF4fuwnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8qhF7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wkoYmrXNimKSwAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023657_089398_76A82C42 
X-CRM114-Status: GOOD (  10.03  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platform driver_override can bind a device to this driver without a
matching OF entry. In that case, of_device_get_match_data() returns
NULL and imx_aipstz_apply_default() dereferences it.

Reject devices without match data before applying the default
configuration.

Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/bus/imx-aipstz.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 83371e5b35a2..9f74cbcd47ff 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -61,6 +61,8 @@ static int imx_aipstz_probe(struct platform_device *pdev)
 				     "failed to get/ioremap AC memory\n");
 
 	data->default_cfg = of_device_get_match_data(&pdev->dev);
+	if (!data->default_cfg)
+		return -ENODATA;
 
 	imx_aipstz_apply_default(data);
 
-- 
2.34.1


