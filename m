Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D5FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MxhYj/TCLftR3RtPNjj7inhN0NiI4tVG0507jQCqhRg=; b=m/Io8esAy9pNMPBqiRmaFM06/J
	7kCWgaA1mhM+4X7vd9vzctXXCNVglmAO80QxB+rRZ5URN/UPY6AMV3qo0/Ed3XdWn3dPwlXH6tEw7
	1lsU9hs3Q6HqzzYtWUD2NI6xCu0PXo3anEtV7Y5PQNr3RvSqZSBQ9p9bgNM20/5KJH7NksoCI0g32
	o7llN+BrjqtgDeClwwie6tWrTUndGQQMx98bQntbRQtnZvqqRhq8Kc+BeZwfyoODUpC+jfbMpub3+
	rwYXC6lkz6IUzeuRIWedlPUjgtY20LF/1RxuxvoBsdREavStF4sIT0BwQzMkgfVpUNgXikf/chix0
	KY1NoQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JRR-0000000CXuV-2lU6;
	Thu, 17 Sep 2026 21:14:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JRR-0000000CXuB-00ZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:14:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 737D0600AA;
	Thu, 17 Sep 2026 21:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4501F000FF;
	Thu, 17 Sep 2026 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679688;
	bh=MxhYj/TCLftR3RtPNjj7inhN0NiI4tVG0507jQCqhRg=;
	h=From:To:Cc:Subject:Date;
	b=O+Eku6Em6poaJSB+sJt9uhb0C/4prcjcv161Wyqsr62B3JIG6XlEpC69XlQzXYInQ
	 pjWOXBEPX3YChNbCnQeJI15HwHSpK8PfCu6kLiYwQk5d2XtxAGJHtaX0I2cv8GQlSs
	 zcAmXl2I8kqD6GWbcskNi52ZUXBuWHo96GuK8GO+QqlGJ89jGDnb7UBKV8RmHMlB9L
	 pAa3Xdwjd33KS0O25/0AouaLQPVjqj9QtLLW+eFGmcDFzzfKB6qZtkXGKcnjUw/kLM
	 jzjr5xf7hFw7KXAIJpjZ9n/KuJOw+SMY11h6RH7YZ4yzcwLuVcEMbVgOV6mC9Uw5Ed
	 k6usDEUHuTp8w==
From: Kees Cook <kees@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] pinctrl: imx: Remove const from group_names allocation type
Date: Thu, 17 Sep 2026 14:14:47 -0700
Message-Id: <20260917211446.i.153-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=kees@kernel.org; h=from:subject:message-id; bh=SI/CPd6XS8ei4Q7rFs30/ZmKJ1M1jnctDK7KU6kGplE=; b=owGbwMvMwCVmps19z/KJym7G02pJDFlrItwsPm22mrBI0vl9duYClhDJq0/zi9zaT+pJfeX0n ZpiJdvTUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJEntYwMDxe/5a8U8g0zrjf8 +jyEbWqRs0wg+9c9SdXcH187qKk7MDI0NpnenPJNNSvtmgNDddMbV88qxn8hfFPvTvy/7ce5ZaF cAA==
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

Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
drivers/pinctrl/freescale/pinctrl-imx.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
---
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: <linux-gpio@vger.kernel.org>
Cc: <imx@lists.linux.dev>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..c11d220d982a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -600,7 +600,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	}
 
 	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
-				   sizeof(*func->groups), GFP_KERNEL);
+				   sizeof(*group_names), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
-- 
2.34.1


