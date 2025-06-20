Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798ECC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 01:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/2XLIJnNinS9+K18/3lu/lVK35HJN1wS4il3Erb/Fo=; b=d0aIgtl0RRFd2H3VCdcbveWxYc
	JhMdmcOpWs5U5HSsKH3GmFhP2RAFzMDxIKvTBiR6622+eK9ANcX5zU1vz9WdUoE/ruSmV1uDDye2U
	EREdqgel+EqGZrMZUyDx+6kTXOfChih7TYdQ9UcVcIv40DoQz5KqzP5D2H7EV84flZIyQ/YgwEXh2
	igJdChDPIl+gBc/3+RMSDwKUoLlGt3OUnQTU0s804HR2IpzjCbVavNTVjIuo6nCHPyA7ngJBrGhlS
	Sgw5DmOfO/GzHTl5ELkFfRdwXaq9TIkF2dE8nYlOGZBkmRVeANvH2efJZn2w5VNbqoqR8W+lwgF8e
	I8hktGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQD5-0000000EVq6-27Fl;
	Fri, 20 Jun 2025 01:06:27 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQAq-0000000EVhz-3qoJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 01:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8/
	2XLIJnNinS9+K18/3lu/lVK35HJN1wS4il3Erb/Fo=; b=S2aHwtrPdIB5hr7uA+
	v2AOZf1lXUj73jKH/JRl7oJY9VIaz2wpvyfFIMUmQZehwkTlMBKHiSlgPivcRpma
	oXoLMXd9J1QyUMbOaOqh1FJa//L9Rr8dAOaM+QvjwA6ij+MCZLnUTueve4Cpjaw5
	A/oJpP6S/wFYOzt+bs5/foHUY=
Received: from 163.com (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHrIF3s1Ro7thPAQ--.27905S2;
	Fri, 20 Jun 2025 09:03:53 +0800 (CST)
From: chenyuan <chenyuan_fl@163.com>
To: linus.walleij@linaro.org,
	wens@csie.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	chenyuan <chenyuan@kylinos.cn>
Subject: [PATCH] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
Date: Fri, 20 Jun 2025 09:03:45 +0800
Message-Id: <20250620010345.11247-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAHrIF3s1Ro7thPAQ--.27905S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw45KF45JF17Xr1UGF48JFb_yoW8Xryxpa
	yfGry5Ar4rJF4Sg3yay398ZFy3Gan7J3y5G3Wj934Yvrn8Arn8Xr15KFWjyw4DCrWrXr1S
	vF4DA3429r1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEL0e9UUUUU=
X-Originating-IP: [116.128.244.171]
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiUQxyvWhUp3X19gAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_180409_494347_AD651504 
X-CRM114-Status: GOOD (  10.52  )
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

From: chenyuan <chenyuan@kylinos.cn>

In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinctrl_map
array, the function returns -ENOMEM directly without freeing the previously
allocated *map buffer. This results in a memory leak of the original kmalloc_array
allocation.

Fix: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
Signed-off-by: chenyuan <chenyuan@kylinos.cn>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daa..d63859a2a64e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -408,6 +408,7 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	const char *function, *pin_prop;
 	const char *group;
 	int ret, npins, nmaps, configlen = 0, i = 0;
+	struct pinctrl_map *new_map;
 
 	*map = NULL;
 	*num_maps = 0;
@@ -482,9 +483,13 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * We know have the number of maps we need, we can resize our
 	 * map array
 	 */
-	*map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
-	if (!*map)
-		return -ENOMEM;
+	new_map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!new_map) {
+		ret = -ENOMEM;
+		goto err_free_map;
+	}
+
+	*map = new_map;
 
 	return 0;
 
-- 
2.25.1


