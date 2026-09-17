Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB42AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z6Uv0MBPHRxJn3q9ecu1jaMLqeT/tzm70P/Da9cR4fo=; b=JTy5fyHohTz3kcTvUNb0I1jC7H
	VDZBQVBHlO0qOAjak1yaUfZuJtSe0ZJvtueoT0IOtmZrfTKB0/WKrkoyG/fmLRfM5/qCk6W6JGRNH
	AcbUFXQWpKMLRiDm5HOdhV2USDy2OaAaxeUbMKuaw6xWLEkEaK4dcBnzW7ZjRewHfklzjqILcUTC0
	z6V6L11g0QAcVFqMlOY1uEL1s02RQYZJwY4Zt9VIQ73J7KXB2eVcPlLNYP4eaYiG0xeMZe5eos/D5
	3pAzc8nzaZb87jZyF7YmlYLor8ZoU3kyWCd0stqcR+AIdoZfCdVniVFuX/PoCQ+Zha/oNv+Syuz5Z
	iiVf4VxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JRY-0000000CXwp-3GnP;
	Thu, 17 Sep 2026 21:14:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JRW-0000000CXwK-2zQT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5827040B02;
	Thu, 17 Sep 2026 21:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397351F000FF;
	Thu, 17 Sep 2026 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679694;
	bh=z6Uv0MBPHRxJn3q9ecu1jaMLqeT/tzm70P/Da9cR4fo=;
	h=From:To:Cc:Subject:Date;
	b=ZTSAyFSBNE93q+2kIPs80MBLp5GGHB1IAFjyRc16Xr6F4KMBEQLwBlHxxE0SfaGdV
	 +afw5tP9DpaDQKkJyZZ5fYNAfIUufQqP52tgV2nmvRxxd+Dj3XEjtHjRSxXwPzKqlQ
	 8d+T+T2W3dtof7em/wr+K1aRBWrYtPGaJWATy6eU/O7+Inin1iFKgf07+a2ZpVrT6p
	 JnzX9D/6prapuYtRc4rwmT3OpbzwCCFQLEL/TITxu6Jpupj+GbHquYn2B9U/a4qkVt
	 S2As3vOHwrGXqspw5BpTdk69/VVt3kkI0Q5ZfqKospRhzZM8QmZJkMH4oK6NkuvrgN
	 87JTiCfJ3FXTQ==
From: Kees Cook <kees@kernel.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] pinctrl: s32cc: Remove const from groups allocation type
Date: Thu, 17 Sep 2026 14:14:53 -0700
Message-Id: <20260917211452.i.365-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=kees@kernel.org; h=from:subject:message-id; bh=nNUPdVbUz/MbD5kNmfUpDCXi15TcB5OTYzbdnwH119o=; b=owGbwMvMwCVmps19z/KJym7G02pJDFlrInx4dkaXu7ZN+eW9pmP7w8n3nwlGveXz1Z3LKG4ua Bnyste3o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCIbOBkZjmj1RvDHv97xUuXt 55WBN/vXhdw9cf316nbRzU6H3714vp6RYZZXmfuyNTfmBQn4XFnAdCSq0ecso7CVaR9j6oSDsz4 8YwUA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

From: Kees Cook <kees+treewide@kernel.org>

In preparation for making the devm_kmalloc family of allocators type
aware, we need to make sure that the returned type from the allocation
matches the type of the variable being assigned. (Before, the allocator
would always return "void *", which can be implicitly cast to any
pointer type.)

The assigned type is "const char **", but the converted allocation type
would be "const char * const *", as the size was taken from
"*func->groups", whose type "const char * const" is const qualified. As
there is no general way to remove const qualifiers, take the size from
the assignment target instead. No change in allocation size results.

Build tested ARCH=arm64 allmodconfig with GCC aarch64-linux-gnu 16.1.0:
drivers/pinctrl/nxp/pinctrl-s32cc.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
---
Cc: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-gpio@vger.kernel.org>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 4b40770a38b7..9c4ebae22674 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -825,7 +825,7 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 				     "No groups defined in %pOF\n", np);
 
 	groups = devm_kcalloc(info->dev, func->ngroups,
-				    sizeof(*func->groups), GFP_KERNEL);
+				    sizeof(*groups), GFP_KERNEL);
 	if (!groups)
 		return -ENOMEM;
 
-- 
2.34.1


