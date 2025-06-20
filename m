Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iemo//66rGggfhMsVrvcGWLgvsP6AIerLHEFJXsGHqE=; b=rtKGbwtnl3tzIq4OQFSv2IIGT3
	n36w8EheWIHpiogZRdHq4YXpPSM6u7GB02pnIcKaMAs4/4zpdSPTRAzBl79FbBkh5kR454mQmLQtI
	Yxz2qLiyHCbflzHVIR0cYk/i/0ujzFNY1XCJBNQSuNaGcalrjpiQeHHGogB1BejBnYHcs2QNNRn8c
	4pwg9AAu9+c1YpHvsHDttHszh6NWGGiL8MlvRw4uNeHQJ2jgQcNvYe259pbSoWTk5Hr6Vgp0KV/ys
	qqsUDh5Jo21uhsZ5lTMmhySJPmpnxEve/6Owt1mXxKi5JwLuLCol71B5OesiZf7JhE/ITqxTShKWh
	Edgbz2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQZh-0000000EX6C-2XGb;
	Fri, 20 Jun 2025 01:29:49 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQXR-0000000EWwZ-3iZc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 01:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ie
	mo//66rGggfhMsVrvcGWLgvsP6AIerLHEFJXsGHqE=; b=NoZcchrTVa7ylagmGp
	10DCENAV5t5AdQUraRYv0/832vC7XNiZLVYGPoJNFCx2mHGwgy4k6o7BdgByZCe7
	Y5GUcT1qcydPv87OTVOqXMhRIbP3r/51fL7637uWfl4V/ZCwY1ezkqurkJOmuyLq
	2xxTEmb0EiyjiM8bch+IEEe4Q=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCX4izzuFRoCzlJAg--.49566S2;
	Fri, 20 Jun 2025 09:27:15 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: linus.walleij@linaro.org,
	wens@csie.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
Date: Fri, 20 Jun 2025 09:27:08 +0800
Message-Id: <20250620012708.16709-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620010345.11247-1-chenyuan_fl@163.com>
References: <20250620010345.11247-1-chenyuan_fl@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCX4izzuFRoCzlJAg--.49566S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw45KF45JF17Xr1UJw45GFg_yoW8Xryfpa
	1fGry5Ar4rJF4Sg3y3A398WFy3Gan7JrW5G3Wj934Yvrn8Arn5XF15KFWjyw4DCrWrXr1S
	vF4DA3429F1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAR6UUUUUU=
X-Originating-IP: [116.128.244.171]
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiJxJyvWhUsxR6wQABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_182730_334644_79C20C7A 
X-CRM114-Status: GOOD (  10.78  )
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

From: Yuan Chen <chenyuan@kylinos.cn>

In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinctrl_map
array, the function returns -ENOMEM directly without freeing the previously
allocated *map buffer. This results in a memory leak of the original kmalloc_array
allocation.

Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
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


