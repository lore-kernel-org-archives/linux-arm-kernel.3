Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F84C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2a6dfSsGD/MmTbGKcRMsjqnnX+0xSYoSHnMVeczgVxc=; b=eYETBO7PMQtbUaxsQ4s/NLP9Ns
	JT2zcYvKYzm02HnwEUIs0YbHwFf0+mfGwhEd3/bLqc7wqtHdNRImeu4fLlOjuF2KaYpx/LoUIfulh
	WEnEzLgobE3HTxytLsHeZG3kSAPFWy7JwYUDc8oMZE26ALLkLho5l8D5cn/FLLIORhYfckfOJtzXh
	e6/GYXNtxc0W3P42Ez4S3+bzQvhC+uK7JmKEXe/q1nidzqV+qunG3XV9ugcWjWXR2U/N/ephp+/Mf
	wAcrp4mIaF/EzwEjTXml0KReysEzSA5D3GOJR2RUWUoPjkeY1a7gEnT3CAWRdN2tvQYiShW/DLy1Q
	hFa25pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPrL-0000000AT53-2A1W;
	Thu, 30 Jul 2026 12:27:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPrJ-0000000AT4m-1jbf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:27:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75D2260120;
	Thu, 30 Jul 2026 12:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AA71F00A3A;
	Thu, 30 Jul 2026 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785414452;
	bh=2a6dfSsGD/MmTbGKcRMsjqnnX+0xSYoSHnMVeczgVxc=;
	h=From:To:Cc:Subject:Date;
	b=AG5RHG4XD3dI3+Pzm2tS0JeeffHjlVhHTKycm5LvTenFIz1gz4+Da4jhXD3ivB+Nm
	 s9OkNBgMRI8kC7dmVNwPY7N6IztrqDaHLG2uxgkF61oEYzuSYCqTVgGEXI4k0d5Knc
	 H83X1EzqkQn6n7X7LUFXvjIkfSLXyLRCVhNxnOXf9I7hON1zZO8AhtJnY5VN21hjZj
	 NiYt5SGo6Z3PHQYzVzlmFF8qmtigPvHh9w7l/hIgFbr/4M87TmOkXIoE67Sc/kKQdl
	 q4y+IzvsYkxi0l2IbMMXJa+mXTT+U8UJigg0TZCEw7qedveYondN6oUQIbDPcHUZ2W
	 RjK6q/Ih4e3aQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
Date: Thu, 30 Jul 2026 14:27:22 +0200
Message-ID: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=chleroy@kernel.org; h=from:subject:message-id; bh=NgJogTZ8D2TsSvzSmrE4tRc1/6SYj6BMw9ra0XiPBuo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlO+s8WhX5UGzP0pRd70O3cVjna2rfmNCbL/jldnip7 MFtN40vdZSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJmE9jZHjAee76Sonl1fuk ucP/Rx/3lGF4K/FFwOTQ3/2qigax27YxMrxf1Z8Rsa0nXGa69JllhrUSYsdFFQwuB9v93ny9+ZJ ODB8A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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
Message-ID: <20260730122722.5PUA-BhUHISym4PetYjSA8-JctSYeHFUleOit0U77lg@z>

Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
proper platform driver") qe_add_gpiochips() was walking the device
tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".

After that commit the discovery is handled by the platform core,
therefore it is necessary to call of_platform_default_populate() on
the par_io node.

Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index a5e2d0e5ab51..02ca556c8db0 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/ioport.h>
+#include <linux/of_platform.h>
 
 #include <asm/io.h>
 #include <soc/fsl/qe/qe.h>
@@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
 	return 0;
 }
 EXPORT_SYMBOL(par_io_of_config);
+
+static int __init par_io_populate(void)
+{
+	struct device_node *np = of_find_node_by_name(NULL, "par_io");
+
+	if (!np)
+		return 0;
+
+	of_platform_default_populate(np, NULL, NULL);
+	of_node_put(np);
+
+	return 0;
+}
+arch_initcall(par_io_populate);
-- 
2.54.0


