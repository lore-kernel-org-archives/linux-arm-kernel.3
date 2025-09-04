Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11EECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfJo2H6ZWSWCMA4g4gE9i482h+GrTxDw4eF5crseCrA=; b=VhFG4aOttXzq7lZXgtv/9mUka8
	O6iyKESzmCTHV/IXskpU6wJ/GZf+IN8YOo+lUenPHzJfupjtjY/TvrLr/d5x2s1HWpBjONblYHMQu
	KC8R18u5zU0Mj+y4oQGKItw0RFyDSek9VYdfyTwu4BD3hgREJZiOu45Fqu4yCCf5ICrXg5XXnnpRn
	ZqngwPQ4bX0Qr5vGtAe+ieXMxMdKgpM7ZtsqHKexW4B0aHcCjaJNDsRmlRH/qOmvsHvRnh4AqMwZo
	NPQnOlvh646E8/i9tOIgizxqfyC74xmAhK7v5nIHCveA1GU8xahktNigdSd7HKhB+9Lc1Jl42SdqU
	mqDrxslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM4C-0000000G3SC-46fo;
	Fri, 05 Sep 2025 02:20:45 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHZS-0000000EaQx-09nI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:32:43 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7fe9eea0d21so151956885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757021561; x=1757626361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfJo2H6ZWSWCMA4g4gE9i482h+GrTxDw4eF5crseCrA=;
        b=iotSsmma9UUfKLKAiNI9NdPGiYa1+rF+2GGkrboyIfpRrr822Au+OG9UuOHQzjce1Q
         YhCiN4P29iMzzIx7pmL7dJCF+00cCmZTGjEIVIcSi28JNJEyUpW4pM4RmcCHeN49nHuP
         Hzb8+DYaVDRCniFpytMO817FfV5Ud2YHC1ih+6lhwVxm01E7lGQZSDd9J3J/0rE0e5qz
         4mBC6KSqOD2O1xoK9EMTMTHDvc30XAn/H1GZwv4JK3eCWqNOI0dZRxX2CpiBcjXrXg60
         iQylSufNelbKolysKXMxT2PR/yHk1sNJSnxjaG0vQyZBoMcPkfIKD0Zsm6SC+uttTUMi
         mrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021561; x=1757626361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfJo2H6ZWSWCMA4g4gE9i482h+GrTxDw4eF5crseCrA=;
        b=q381LRoz8fASpPXo5a8//ZoFjuVtEQSuk+gCzauCPcWFZb02ZWEttyYAKxn+YSth6M
         sS+eXU3KePOItGTBqkpZDt5GPwLyBkBdZDF3CUBU4wNzE/bJSsm+SRYZXwEkm7pshDbP
         aR6fcUAPo23HWPhg0kSRzG7LpI5IyreLpxCBBywcpIq+SQiMwQZykRHkg4C8C5LR+uvs
         sT3IkLnM9tNTPJ9P/KNBiPbLvyd7T02Ff+YJolQBTJa1J4Gadj8l0PjUPMAV4Aj4stdf
         B0OyOvy58Phmi/ldGblWFR4W0C2jxXiVlknFV/FQ25jOEaNbfUSfYpya2pMtk7FRdU7w
         1Ecg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+IhPwa564/mdwTzKXCze2XC28nOz+SbfyAv3UtFi/xEvDThrLvF61R0LvRYYyG3JQimNXLd2nR9F4oManGB6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9wMTufz0WZviSp9eJkIT14M33/rnkw1kL3vEfJQo5WNd0xsVz
	2z0uZ7eKY7vi/PBOmIpS8IjvWMKnl/ZdxZuNQHHQ9C5gMrRzzAnpchYX
X-Gm-Gg: ASbGncs9lFZsS/2R1zcvnol9eFKf3mBLW0i+8ZeCQrblfVglB7ihcinMTKt4mY8xewR
	Pcpaou4IrAqXo5Nten5Pb8yCN/ODVhJOeL2KGLzcWVX/8Vf9oj8oXSgo3gCIt60EG+j2Bah5HxM
	lh9gyk+cjQnrndvg9M839pl1jPPiiSF8TmND1nBCRKrRmqnw5VBkx9zLBapcxIAFoFFqn6OnQQb
	exAmPhhVpCPK4KMSrQnhjuja6vg/d51cu49fEJeu+1iGEwRX3WFB+unegDySix3M6DjgMdsgVBU
	0tFZpTwj8J7MCc6K7/M+iLtYZYSYJwuuvOS0X95UGiEUnbfCajyVhwX6fEhxFr/rW67y+tANpBF
	EpRVzBiY7hLsZRX6aILtk3jUGo5Wk/c84TgjLMF1XgbsLnZFAgxthYUqf/TYXbWKx7QVofBGuwV
	CwuLzZow==
X-Google-Smtp-Source: AGHT+IEMDG3qKM9E64JDbZlvMNFIAoPif+QvGsq7rKH5NWkVKB/zLRQl4pUo2HCjzrKSkjRpxVTcMg==
X-Received: by 2002:a05:620a:a915:b0:800:e553:ba99 with SMTP id af79cd13be357-800e553c367mr2008621085a.11.1757021560966;
        Thu, 04 Sep 2025 14:32:40 -0700 (PDT)
Received: from archlinux ([2601:644:8200:acc7::9ec])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f635cbesm35473501cf.5.2025.09.04.14.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:32:40 -0700 (PDT)
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
Subject: [PATCHv2 net-next 1/2] net: thunder_bgx: check for MAC probe defer
Date: Thu,  4 Sep 2025 14:32:27 -0700
Message-ID: <20250904213228.8866-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904213228.8866-1-rosenp@gmail.com>
References: <20250904213228.8866-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143242_073442_C348701B 
X-CRM114-Status: GOOD (  13.46  )
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

of_get_mac_address supports NVMEM, which can load after the driver.
Check for it and defer in such a case.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 9efb60842ad1..a68dccb7c2da 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1471,6 +1471,7 @@ static int bgx_init_of_phy(struct bgx *bgx)
 	struct fwnode_handle *fwn;
 	struct device_node *node = NULL;
 	u8 lmac = 0;
+	int err;
 
 	device_for_each_child_node(&bgx->pdev->dev, fwn) {
 		struct phy_device *pd;
@@ -1483,7 +1484,9 @@ static int bgx_init_of_phy(struct bgx *bgx)
 		if (!node)
 			break;
 
-		of_get_mac_address(node, bgx->lmac[lmac].mac);
+		err = of_get_mac_address(node, bgx->lmac[lmac].mac);
+		if (err == -EPROBE_DEFER)
+			goto defer;
 
 		SET_NETDEV_DEV(bgx->lmac[lmac].netdev, &bgx->pdev->dev);
 		bgx->lmac[lmac].lmacid = lmac;
-- 
2.51.0


