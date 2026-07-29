Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2CC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2a6dfSsGD/MmTbGKcRMsjqnnX+0xSYoSHnMVeczgVxc=; b=G19mZ/hT7vu2hO05E/m3+IzBUW
	udspyyZoCF3RL0uK2AUyiQrdEbnztsLHc8Lt7ElBLO9v3JRgorpSJ7a7Jc3Zru8STCEsOdpsDgIzX
	HGilnNN0cR7Nd7E9u4caXlmv3k9X2BHCQmNHWQ6BksIuqFwVPrQBo8jy/3A8OFFjcWjX88/o/OeKD
	jgKTpjlKxpQgSoBH9P/LUzWQ+pFcEfC5CnAidFMa8HhS0tTE5Fk61XLI0XYDbX8McWftOMWcOgKy9
	YPDrnC4kjZ7R3KgE6JAn/GlF+r/yAcVyjzyKVtRKVMLi38r9EXE//NBV4OGzXQlhzoAOoTDQxVxi/
	FIggGHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4zj-00000008DJx-2Q0n;
	Wed, 29 Jul 2026 14:10:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4zg-00000008DJ5-43wN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:10:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71D0B43997;
	Wed, 29 Jul 2026 14:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80AA1F000E9;
	Wed, 29 Jul 2026 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334248;
	bh=2a6dfSsGD/MmTbGKcRMsjqnnX+0xSYoSHnMVeczgVxc=;
	h=From:To:Cc:Subject:Date;
	b=jlVSKsPJxbWJgIMuaR/OiV6tuadN3sbcjFfTRBoZHuAH4K33MPi4BC2LzF6qDAAvb
	 vgXLyeSrD1e3yGit/7bvxzpQW3jQL8hJwowvFJlN+roD9qosyPDgBpbGaWtRsY4fH3
	 6h72h4NSptCiqrJhWoYEtId+MQNPn4DpfFCfOsj2vGjSCAg4h+RqE+Y85WSFg+ALw3
	 aCMRkEKa0e8FQtjBXBRDfmOsNjSLeggVX886wA/7Z2LdsT7ByWOOSogJIBiMjXq1qa
	 2kzptPAvfdbfXZq47h1o2p9kHYlaSyfzMdkIG/xhuyGJr0dM5059maReEgwJO/SF7W
	 UcmlI0zPTD5pQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
Date: Wed, 29 Jul 2026 16:10:36 +0200
Message-ID: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=chleroy@kernel.org; h=from:subject:message-id; bh=NgJogTZ8D2TsSvzSmrE4tRc1/6SYj6BMw9ra0XiPBuo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlcd57tCryodiepSm73odu47DO19S+MaE3X/DL7fBS2 YPbbhpf6ihlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATeVPOyLDGuqCbZRrPJqvK pS4iD46+Nt5ct5J3YfpXNQk1nqaLRY4M/52aF1vF2E02fJq5fv+pibo6k+5GTy76bpFX1rZimli JAhMA
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


