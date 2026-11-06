Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98AA606EE92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbF+tRjj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xj+HtoU5ASYrF7ntXB+HFaVy05RTHmxTs3AWF9oBtgA=; b=AbF+tRjjQfihw1
	nAi12EpFbY2VNZKnBS6p5Kqf4CDOprht+WPVJ8F+wowKeo1egPjqYLXMZ+a+oRIXqZmxvugCwfDOb
	kDVKrZMfxEL0eBt2D1EENTswa3+k5d1WOgTDIt/6G24OvRiQocSmahSXNiS5BDCpSHfb1XuO82JDS
	TaJ9fO7jY57eQ4lf+/F0fnkUSu8zktncnjp7RxppOqC801PBettmuVMCPtQ4RlJozG1cASoHdP6f0
	oW96hQlYEo52VlK39gF7I8u5JWV9NDWu84ChZmN7M0TmaTVwJ/u5VGjXHcmUh3ODTJuVVbBsEtJHB
	D8IP0MoPCbPNns8dgIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE2D-0000000BOQf-1WZk;
	Fri, 06 Nov 2026 07:06:49 +0000
Received: from out28-132.mail.aliyun.com ([115.124.28.132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE23-0000000BOLq-1UMQ;
	Fri, 06 Nov 2026 07:06:42 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07948652|-1;BR=01201311R141S20rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00727809-0.000392516-0.992329;FP=16537210185005860485|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033065158064;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jy2.94f_1793948792;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.94f_1793948792 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:34 +0800
From: Wang Xiaolei <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
Date: Fri,  6 Nov 2026 07:06:27 +0000
Message-Id: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_230639_541062_D4207A56 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the hand-written dt_free_map callback with the generic
pinconf_generic_dt_free_map() helper, which wraps
pinctrl_utils_free_map(). This drops the duplicated free loop and
handles both CONFIGS_PIN and CONFIGS_GROUP map types.

The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
The driver already selects GENERIC_PINCONF, so no Kconfig change is
needed.

Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 725e880ae086..69a92cd7bfe0 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -760,18 +760,6 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		irq, irq_type_names[pc->irq_type[offset]]);
 }
 
-static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-		struct pinctrl_map *maps, unsigned num_maps)
-{
-	int i;
-
-	for (i = 0; i < num_maps; i++)
-		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
-			kfree(maps[i].data.configs.configs);
-
-	kfree(maps);
-}
-
 static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
 		struct device_node *np, u32 pin, u32 fnum,
 		struct pinctrl_map **maps)
@@ -916,7 +904,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 
 out:
-	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
+	pinconf_generic_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
 	return err;
 }
 
@@ -926,7 +914,7 @@ static const struct pinctrl_ops bcm2835_pctl_ops = {
 	.get_group_pins = bcm2835_pctl_get_group_pins,
 	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
 	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
-	.dt_free_map = bcm2835_pctl_dt_free_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
 static int bcm2835_pmx_free(struct pinctrl_dev *pctldev,
-- 
2.34.1


