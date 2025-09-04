Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B4ACA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP//4Q+uImYUL6/+8qHx67kUOU4MQKI9owsJGMxhBGo=; b=CzhA9n8SrvfL7zXo021n/U8rm2
	ZbCETmnxCxBcYdpx+R1T9yfTH9yLYQgo92iFpdQBq/7nDh4occNZDVPcB8qYERQymDGRcknHisBI1
	JBD7hNhU/nwJr+3SgBUHSyij6mp0AcKo37E98ThGg0cT7wzfoW+mJKO9rH+vcak9TaLttrz1CplPg
	vORAUqQ+rTYtoTM9k6txtacSeWHOVoWlxilm/es9NqMS6nx6TW0H/eME2LxOJFv9kUGk+f1MN2BzK
	rSEWo1X0WeikEv+BtNVB8wd/PAA4rWCvUxwSpgKzqS3Ptc4c3sr8uQDljykKL3O+B6nN0KuZy8G7N
	v1Vl5hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM4G-0000000G3Xi-0EgS;
	Fri, 05 Sep 2025 02:20:48 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHZU-0000000EaRR-0Elx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:32:45 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b5e35453acso8257461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757021563; x=1757626363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP//4Q+uImYUL6/+8qHx67kUOU4MQKI9owsJGMxhBGo=;
        b=c2jjJpBX2kYOZG/l0S/ryXkZqmr+zsZASIFbeX/TcjrvT3yMS+pWOlYOng88gusRtZ
         vNxTgFnqK7O5E3N6C/CDxu6aty48aPXTwPOm/IT5H1i8vBXGkdGgH0MDCqwzku0yskxc
         jRFyE8UE5VszaHuN4MLyGYZ2pUnZi3+5MhnQKN+b0rFQGxfzAjK04kHsW7dWIQOoRl3i
         AaZ+mdbyEXfNfKh477HIRC+KLHuF0PpLunjAonZ6e5+4Ezx9tyxLZE/YHMkoWsbG/fAS
         cPygKgvsCxpswYxoXhHQ0EE6mf/I4+VX0/orWBWDS7PtYdytAR9RtNFiXl6xgG5WLlXx
         iv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021563; x=1757626363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP//4Q+uImYUL6/+8qHx67kUOU4MQKI9owsJGMxhBGo=;
        b=MwJr+bBzG3GhNcWdqh0EnUhrZb6ASjFNintaNDUlQmIA+VwI7n4FU6hjO8GBZDDLoJ
         KFeB+/Eax5U7P9I4UHCr7zAbt/lEDhx7vgWcH7UzzRIzPtdwSjQ9Xhgx2Ll1zZC3rtEP
         KnRAEzXXBWcSpbTXPB6BIkYbjwu0RRWdSXmeabcQSg3NmM5FMdA7KqWDfyrgUyoifngm
         FRL+RY5S/8rJt+opne9vVjjE3w8o5b3y3lgjHYjSYLybzG2ErQ7CmEt17lmS81aKUdIB
         woTLm0wHTOZZXA2Pmw3smcz4FUuBXJPmGQ4IPsRPnojNPZgXZMO3GKh0wup+VV93JOiX
         B7+A==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZYzEjp5l6cGU5vMwjSRJr/XWETtP4LAmErMLZkMj3u85faCzxiiCsx6XNc1PbEBznf2AC+IHSrLN7L4otRTm@lists.infradead.org
X-Gm-Message-State: AOJu0YyfDIOHY/1mOm5xyZBSRiiU5ogFWwtzlem8XDieFntNOnBpy4Ot
	XjTWbC8e9zC4XqJL49c740KF2z0vI45+paRiI7uacWXxFfRLTQeMcouM
X-Gm-Gg: ASbGncvN32lIX+x9JAZUkzkgs+5hPo+sUIigmSM9JqctQXA+dBC8FCh1/vUikFexGgR
	hcRM0f/FAuODX5wwXwjTiCYOmempV6wQ9E9TQMBXIS3dfa77h9n4cqyHxuuZ6a1NCzbzo5OEPw5
	WhAVvTykt4BUTqj9Dn9aVm/r2e4lHuG97qRn/fFAZ1NFj0FiMRL2Ec/fvum+29HQ09McV0UP8Gw
	E/QDLAkfekeGwTTVP0k/uJaMuZ6SXCbvzNxCNcF25grEZPLwr/xTVxYmq8kdGcqlj4/9Ilxg1Fv
	OEENxxmykfrTcvGxy7zSEjMPUAfSMtBSw8bZpWb5oXEKUppnNSus7FczwdZs3wbKzp/kVoY4lfG
	52CXUY+Sx9p+vFW3MCakhVHJusAV9W1meTmZxx/PtehOCFA47gQ2drG4dheJmW39opnRsdiA=
X-Google-Smtp-Source: AGHT+IEqs7POj69pxkvZDjE95U6KYOVuVkDeoyFsTxqhrP/MM9ePnYC09WI0Yur0q2gFyWQ0dNfZrw==
X-Received: by 2002:a05:620a:461e:b0:7fc:797a:942a with SMTP id af79cd13be357-7ff2b0d77d8mr2309803585a.45.1757021562704;
        Thu, 04 Sep 2025 14:32:42 -0700 (PDT)
Received: from archlinux ([2601:644:8200:acc7::9ec])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f635cbesm35473501cf.5.2025.09.04.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:32:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 net-next 2/2] net: thunder_bgx: use OF loop instead of fwnode
Date: Thu,  4 Sep 2025 14:32:28 -0700
Message-ID: <20250904213228.8866-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904213228.8866-1-rosenp@gmail.com>
References: <20250904213228.8866-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143244_090474_1F0C0B57 
X-CRM114-Status: GOOD (  14.17  )
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

This is implemented under CONFIG_OF_MDIO, which already assumes an OF
node. Also the loop already checks to see if of_node is NULL before
proceeding.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/ethernet/cavium/thunder/thunder_bgx.c | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index a68dccb7c2da..06ca305de1b4 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1468,30 +1468,23 @@ static int bgx_init_acpi_phy(struct bgx *bgx)
 
 static int bgx_init_of_phy(struct bgx *bgx)
 {
-	struct fwnode_handle *fwn;
-	struct device_node *node = NULL;
+	struct device_node *node = bgx->pdev->dev.of_node;
+	struct device_node *child;
 	u8 lmac = 0;
-	int err;
 
-	device_for_each_child_node(&bgx->pdev->dev, fwn) {
+	for_each_child_of_node(node, child) {
 		struct phy_device *pd;
 		struct device_node *phy_np;
+		int err;
 
-		/* Should always be an OF node.  But if it is not, we
-		 * cannot handle it, so exit the loop.
-		 */
-		node = to_of_node(fwn);
-		if (!node)
-			break;
-
-		err = of_get_mac_address(node, bgx->lmac[lmac].mac);
+		err = of_get_mac_address(child, bgx->lmac[lmac].mac);
 		if (err == -EPROBE_DEFER)
 			goto defer;
 
 		SET_NETDEV_DEV(bgx->lmac[lmac].netdev, &bgx->pdev->dev);
 		bgx->lmac[lmac].lmacid = lmac;
 
-		phy_np = of_parse_phandle(node, "phy-handle", 0);
+		phy_np = of_parse_phandle(child, "phy-handle", 0);
 		/* If there is no phy or defective firmware presents
 		 * this cortina phy, for which there is no driver
 		 * support, ignore it.
@@ -1511,7 +1504,7 @@ static int bgx_init_of_phy(struct bgx *bgx)
 
 		lmac++;
 		if (lmac == bgx->max_lmac) {
-			of_node_put(node);
+			of_node_put(child);
 			break;
 		}
 	}
@@ -1528,7 +1521,7 @@ static int bgx_init_of_phy(struct bgx *bgx)
 			bgx->lmac[lmac].phydev = NULL;
 		}
 	}
-	of_node_put(node);
+	of_node_put(child);
 	return -EPROBE_DEFER;
 }
 
-- 
2.51.0


