Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C19C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yrGZUILR/Wznyx7GjKoYB3FNEjyAnbdcouYLB2K4DOM=; b=PE5bn0G14o8/nxlGbvIT2hFSzQ
	P4UG21/xge/YkEYvvPUnl2Hn2yd5iMLgoQmoRPv+KGw0R1687x1w9/zchIcxUwkrJebTp5sXYg3fY
	DfxTp673Nve08fvC3aKZtufNsA8qB84sXoHpfhx/6vFL50r3hymAwjmfXcr+F9Ebyzfa+flyDH5Hq
	6ri0bFeW9fl2JknW4nxbA4RzRKKegjrA7YWkh/hAD/F3nFSeVba6jHVwlc5Vg89dc1S5P5LxYDsIm
	HoryG5AGjozfD9119XJL+Bh6bTPhGgW7VpiYEJ8WNYVxAJyQ4p0+QhJZ9rjpJ/PVx6GW09lnMVdwc
	KjZs41Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPtP-0000000ATNB-3YGk;
	Thu, 30 Jul 2026 12:29:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPtP-0000000ATMz-1mIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:29:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC135600B0;
	Thu, 30 Jul 2026 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB331F000E9;
	Thu, 30 Jul 2026 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785414582;
	bh=yrGZUILR/Wznyx7GjKoYB3FNEjyAnbdcouYLB2K4DOM=;
	h=From:To:Cc:Subject:Date;
	b=oZ6omnuYaaPVJph/8aNubaZUbqRB9sNViXWI/peGzrmT42iBUgCOgMxZL+XD86Fmk
	 wzxpMP+cnOXs40uO0p2/WXrnkXBmtfps6UkSHV19rZ/dUS4Lcx61qldgB7zZrgZnfA
	 /SifWtwBKqLGvv6Cmdcqkz2Pmvoc+3s8eGF3abRIJiBbfUip9BG26KGLzWE5OH7Zgw
	 IyhLp1ovVGOh/3goBNj4jcEFyr8Yw3oHyCt8vrZH4kJvyDI3e8Pf1oXpvXb+YqRxJa
	 KXEWBxePvzWYp2TIcLeRerbEwBfcr8ek3B0HzHqW5d1UgYQ3lhGOP8Xc1KKutr7zCX
	 jO74PgJVlpeEA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] soc: fsl: qe: properly scan GPIO nodes at startup
Date: Thu, 30 Jul 2026 14:29:36 +0200
Message-ID: <a1db12ef75bf881dd5fba893a37db0c8517eca1b.1785414349.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=chleroy@kernel.org; h=from:subject:message-id; bh=NMDDFmRLn2ji8YodQkBFhcITCr9QFapEu4TNHWLKe2M=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlO290uJFhuSzLIzP43g0DtulzRATNLjJ//efy733zP 7d/ldmXOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEeH4x/Hf6tC403eRHoNN1 7oCdt25YMRbvOmup90WJ+ZLW/wJv0zKGvwISf+4yZG3+oGVhOM8gcv1DKd2DbaeTTBoLTzyfYfY 9nxkA
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
v2: Use of_find_node_by_type() instead of of_find_node_by_name() as the "par_io" type is documented while the "par_io" name is not.
---
 drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index a5e2d0e5ab51..150913fce981 100644
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
+	struct device_node *np = of_find_node_by_type(NULL, "par_io");
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


