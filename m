Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC8D2E01E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcarJLQqgulfI8EpeTe+6HzOEIWfAKqhKRpGF+6S1vc=; b=IoB0m2JvwuTPVyXGqfTOPYtnR6
	N3hrnyRjamzoODo2MUuCXVdf0dqym6O1JM7+yp8IQefJlQRaQHZDjgAu7hnyYlGTY0KUB3iACCI4o
	SK4RCpXZxjAStN3htpFHyhxDxZ5Coqt+vb79DG5iM/lcW18AqvO1e4EF82bSTt2ni/ze8Zh9s+8pR
	x67eIi5j47XzR/BvU8LSdgwFGOVI25ulZ4iXHgWLTIKIwzO5WiJhwoNoBY07DflVUfYPWZUswMM8e
	V36rjaBQtbS0wVhEh+laGJft1fKSs7Xkln+aKFUgCMDKCQH96zIgoWX1OJWLTJU5gVaRvM6jYx42n
	TzUMbpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WfJ-0000000DYH8-3KNZ;
	Wed, 23 Oct 2024 08:24:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WU4-0000000DVxq-2iPe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:12:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTv-0004YT-3L; Wed, 23 Oct 2024 10:12:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-0010Hl-1Z;
	Wed, 23 Oct 2024 10:12:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-00FrPY-1N;
	Wed, 23 Oct 2024 10:12:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Oct 2024 10:12:31 +0200
Subject: [PATCH 4/4] nvmem: imx-ocotp-ele: set word length to 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-imx-ele-ocotp-fixes-v1-4-4adc00ce288f@pengutronix.de>
References: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
In-Reply-To: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729671158; l=1450;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=TDF4ZD9quQMr6fYXShZTAO/88aFocRLfhFV/zvO8TZE=;
 b=Z1RtZosGsmcHRf6t7dv8eE+gTAbA1O8/9iPJob1gBFvD0FwYioU/ZCMoj9ElB2t5Uk/++R21z
 dKSjq/YuRZ4AlXMOziffB6IgtqSDaG29ZmIDYHWRWBvSkIK5D36uKz4
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_011248_885081_23336D51 
X-CRM114-Status: GOOD (  17.45  )
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

The ELE hardware internally has a word length of 4. However, among other
things we store MAC addresses in the ELE OCOTP. With a length of 6 bytes
these are naturally unaligned to the word length. Therefore we must
support unaligned reads in reg_read() and indeed it works properly when
reg_read() is called via nvmem_reg_read(). Setting the word size to 4
has the only visible effect that doing unaligned reads from userspace
via bin_attr_nvmem_read() do not work because they are rejected by that
function.

Given that we have to abstract from word accesses to byte accesses in
the driver, set the word size to 1. This allows bytewise accesses from
userspace to be able to test what the driver has to support anyway.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 422a6d53b10ef..ca6dd71d8a2e2 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -153,7 +153,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
 	priv->config.reg_read = priv->data->reg_read;
-	priv->config.word_size = 4;
+	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
 	priv->config.read_only = true;

-- 
2.39.5


