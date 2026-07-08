Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763AFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3SacGhwSbkGS3qcaoGtvVjy4TybBKSuqQFODkWgiYfM=; b=QBEBBRmumWxDy2erQds4UywBfX
	1ro5bXFlyW7/jfDwaFxZ6/bQWDYk1hBvpkKRQqjBTPwulRKTl+HMY/83oBdcT1j9Lv3etcgrx6Uzj
	DJMPQjlDKsuF3SJGhzOaMBN/IIPni/C1njqe6zIkiOHB/wV1xI9C3u48+ZnHUUuojZcTKLVIil7/t
	qhbfb9r+jKt3GAXXcaO+QgN/sv6xxMcjsiwy06MjeIE7F1apZa9fxLZhYqmo24Dwl08Mf46DSzRIz
	/Krcl5hL2m2xpZJCO10a630IP58VxTlKrnG0gbJTKPsZe/i1idMWzdJinTWG1usQxw/Vg/j24ZKNy
	k83E03Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOUh-0000000Gjxm-30uY;
	Wed, 08 Jul 2026 09:23:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOUe-0000000Gjwq-2Ti0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:23:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad4170e8eso6160765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502580; x=1784107380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SacGhwSbkGS3qcaoGtvVjy4TybBKSuqQFODkWgiYfM=;
        b=simqDRkiB83Dpf7NvsV4rIB9roBEod45ebOwzCnGi0TNQtyRDEaew3ILsAz3W5pkjt
         sRxkRPCRDXI0yTzW30g3HUWDvTR0OnZdvaNQLwcsJHfrxZmTqJ9ByGiDa2WZtP2lmQZd
         4oRtJtUMeqmXYeFZfZIPmWckIFJwQLgffKXJP0s9uuchzl7gYSj7LFY95IxCXUOv4VpQ
         UkqWwWRw4v7JR0UHh/j8H4b69IBVcaZFsnTIogHq07nYunbjvE+aB0BUn1nH4mI3zSyg
         AOFQCmv66sa3/6gF1rqW7NEXhojif2j/tQd/k06Mnf67PYnWbaKOP2oEEf2s+dUts1sN
         9mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502580; x=1784107380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SacGhwSbkGS3qcaoGtvVjy4TybBKSuqQFODkWgiYfM=;
        b=aGd7Ldy10A5wJyrgfP1/4XvxTptZwkSGr55FE+ib8rEECVoehvfqoFMJCACBdKV6g8
         b+SM8Ij+rQdY3QasiwiMX6LhdAJlumxY9/binujMWRKk+dWjrUKzKpiMBySRwPP0WJVm
         3nEqG0hA50DCovmV/oeyO0cRdSGbohxmFwcpaKO+Iwm0T+meEv1q+1bTH7a1unHbi65G
         SHb32zQgSD30eKQwZqrXVNZZ4aQjyDSscQ0oL8Ey8jXUbm2yEHg6lEFdP+PO/8GbW0DP
         6V+X6gSiOHiiqdfyp+TMXaz7uLtPAAxIJDs6W7Fp8lopI9RCcQQvK9Ya7Udj8zvXWVMJ
         GCLw==
X-Forwarded-Encrypted: i=1; AHgh+RqORv870WAfCYMSi7Amaifb3IL47vXyKLvaq9IOjlnjENnHp2eFiY+n4D+GjDpvcowbuN9Bm1i1SvLSwTZK0V75@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2gF2ceH0FxjYabQA+UAsjbt7mH7tCKgvxuYxrakvco94zaNpD
	AMD2u5YfrOWoITniwV1ZdkhJPwgpHypr657OSNFpYFlSsMOy/f/eIKQm
X-Gm-Gg: AfdE7cnYnD9F+j26PyyABHjMWAsO1rZP0wKXJwGLVeqn6CjTP3/BkRTHwt57XGu8aJN
	+g8/xERoVAsOJ6RDXhyrSoe2PRLozJHinjdTDKuAVtsAYi/tMA+2yb+xYgS6TNaQc1hHuefI3j3
	6TKHT9ONiNpUm107TBYpbxUa9crU6vgR9gsSS8QNjylq7S+Ud/g6IV2ZZ6bO4nlz8gWoP6i9hL6
	BcvZID+lTvXLHq4J7PzFAYlFYjlrD6YDBg/LXToIanKjKYfdI6zH/WysOz/pj2yhHcKpMy3Jyor
	wlBS2Y0/LsSbG5fhN6W1FypgItzuFqonBz6inHVtqdnz/9+fYBAAu7i4WmX05F4Iraa+ZG68P1e
	KmP2hE8OHMZpxqX52DP+C/lv5VZVUC88n10SfjPvz9qz/wF1ILLc1RHfANHEDI8QUbOa+Wn/Cb/
	Irp2jKcg==
X-Received: by 2002:a17:902:cec2:b0:2cc:9179:32e with SMTP id d9443c01a7336-2ccea37df94mr17127855ad.10.1783502579629;
        Wed, 08 Jul 2026 02:22:59 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm24999735ad.45.2026.07.08.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:22:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Adam Ford <aford173@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pmdomain: mediatek: fix remaining %pOF after of_node_put()
Date: Wed,  8 Jul 2026 17:20:38 +0800
Message-ID: <20260708092038.741308-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_022300_659717_A7A19579 
X-CRM114-Status: GOOD (  13.93  )
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

scpsys_get_bus_protection_legacy() looks up several legacy bus
protection regmaps from device-tree nodes.

Two error paths put the device node before checking whether the regmap
lookup failed, but still pass that node to dev_err_probe() with %pOF on
failure. If of_node_put() drops the last reference, the later %pOF
formatting can dereference a freed device node.

Keep the node reference until after the error message has been emitted in
the infracfg and SMI lookup paths. Also drop the SMI node before
returning when the SMI phandle is missing.

Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps retrieval")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e1cfd4223473..f877d6694dd5 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1032,12 +1032,15 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 	node = of_find_node_with_property(np, "mediatek,infracfg");
 	if (node) {
 		regmap[0] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
-		of_node_put(node);
 		num_regmaps++;
-		if (IS_ERR(regmap[0]))
-			return dev_err_probe(dev, PTR_ERR(regmap[0]),
+		if (IS_ERR(regmap[0])) {
+			ret = dev_err_probe(dev, PTR_ERR(regmap[0]),
 					     "%pOF: failed to get infracfg regmap\n",
 					     node);
+			of_node_put(node);
+			return ret;
+		}
+		of_node_put(node);
 	} else {
 		regmap[0] = NULL;
 	}
@@ -1046,17 +1049,22 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 	node = of_find_node_with_property(np, "mediatek,smi");
 	if (node) {
 		smi_np = of_parse_phandle(node, "mediatek,smi", 0);
-		of_node_put(node);
-		if (!smi_np)
+		if (!smi_np) {
+			of_node_put(node);
 			return -ENODEV;
+		}
 
 		regmap[1] = device_node_to_regmap(smi_np);
 		num_regmaps++;
 		of_node_put(smi_np);
-		if (IS_ERR(regmap[1]))
-			return dev_err_probe(dev, PTR_ERR(regmap[1]),
+		if (IS_ERR(regmap[1])) {
+			ret = dev_err_probe(dev, PTR_ERR(regmap[1]),
 					     "%pOF: failed to get SMI regmap\n",
 					     node);
+			of_node_put(node);
+			return ret;
+		}
+		of_node_put(node);
 	} else {
 		regmap[1] = NULL;
 	}
-- 
2.43.0


