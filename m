Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87564C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 01:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQOMBCaDoHlKYhc6z7ZAvpkcb/oHjnoCwkcWxtxbAbE=; b=U1khqqL7sR3rPECdHSxDt2d/ja
	tlFhZlSx3uEAegceSu/kZwFiRP0Cfj8psJF3LgxuO5cRTl0Hn0931JKf1fRGaTlpbARkFebZG5k9i
	d5v+XmRWbfD1ZTz8IaDsOsQubZP7sZt/rBalRXewX96JPR1NLTRF1DqUgsttsYZF51l826GKBKW/m
	5SlEU0/PC3SUPF1RhF2gsjzXlIkzrUpHu57yWWnXdsM5e4eKECMLSgohFl0QWMOUVXxDixOOk236W
	uUMy5mufkE3sC8f4Vu0vkiWVBr5bHIxb8Oj4zOfrarXy4cMwa1+2BT5TicgQ1tj2rg7k+lILDCzMO
	d4WTOmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMm2-0000000FUqJ-1IGj;
	Thu, 14 Aug 2025 01:28:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMjP-0000000FUGE-3s09;
	Thu, 14 Aug 2025 01:26:17 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e2e5d244cso510579b3a.0;
        Wed, 13 Aug 2025 18:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755134775; x=1755739575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQOMBCaDoHlKYhc6z7ZAvpkcb/oHjnoCwkcWxtxbAbE=;
        b=W5cnDbsi0IlJtttjvLIYX3wccK724op4Gn/B5NwSj9RxAWf89arQ2giNsS9v/RIoyg
         J6jtS8N0Q92veRvSez4xa0vipJusiCqEbrq6hEvujPL5FXW9oXrkOm7PZZINeqoZW30G
         9L5F4pZsFPfyO2N7zqSAXNoCX6L8IGid98gLcyEhM8CtoYE6G3fyQ+MBdOun5xIAS5zt
         5PURIoSkQ2sDS0UpsEmrxmZeumQCsCtVDprQ46OIMQ2BcFmR3w3tM7gRwhr+s8N0GzAE
         GzMmvsoBmOLqVk/S6A+I/d+GKvBaw8LuVfvjJpvLMppgHCADi23+MwnRzkeJfP8+GCEi
         3x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755134775; x=1755739575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQOMBCaDoHlKYhc6z7ZAvpkcb/oHjnoCwkcWxtxbAbE=;
        b=YFL2btbxJPJ9EXqHMra6ULxXeHGK0dQ+XeBnT2qXTFVnyiPmyfl9sih2GrST9TDZsQ
         O7UP9a00HbkeAn5h2tF8NiFuDT/Le0Onn1T5uNFT8ottUfDIuhLm0Dmm6CbSy+HQGdGl
         Frclb7a0v8uwqgfHDBnElhJ9Ha0UZ80jXivTbTkF3P+SGnXOXPHdVKpoSVPFN6fK2T+P
         N8gfvB2D3MPq6exiUbX4hTHUcrnpQ5kXndJR/3tOAR7sWjoYfjBP2cWQlHz7k84gs24f
         hbihvRp+G3ALTc7fy6IQy6ZKw2s6FEbkwhp6Fmp2eeWlghukbqWWl+VW4OmuPfHccjMI
         gxgA==
X-Forwarded-Encrypted: i=1; AJvYcCU9RoEeO8rqLj4rHOehk/kIxUWRrJ7pk6W116j9JDYL8gq3pQT3OyyZxpkBmDxFGEY9ZODKD62lZsQM002s9J83@lists.infradead.org, AJvYcCUs1DgLVqURMAVLLgkh8g05+sqOez9ddhtHHZD67curauxAzqLst+I1sM7QYGm8A17y6R5LzhTx0+UI8vCrwaU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1jb7US23l8z7kV9JRaz7rXhnMgCHe14NbITOvkQax7bDTT20R
	kzaAT3anuBUWQsX5I0kT1debNUemjS9JcqRSs0wmW3uSEjmFSsP8OoW3LvodwrvC3cM=
X-Gm-Gg: ASbGncvyxuoCnIRLjh3wvaZ14H3mQOkmQBbbS6GF97I58DISB3sJKQ9D3ej6c2rqrak
	Q82kR6lvrLKAcYjIhA/nMKeRaUvWUk2Hj+OAE/wKkzViEc9lqOh9DHDZhmrGFJSccFtt7wTqD1a
	GUHKIp7sGn7DBnG/+2DnpsPPnOo1kQQhVTFIfovjBQk/ylRWqTCVrteQzgfab9vRoikfjOXFSKG
	5/u1YkEGQ2nfLgtx2rwiwBsu+FSaBs8tbSLEFO1Sv9CplM5TjZynRap8cyt68P9nRRk2U6Bn2kW
	+MphgsbnvKuyO3XekWuAogUprqU4ZUnc8ODl3XJXTcsaPv6Ih66zFPkkUPn4aAgecDDxnGuBcxW
	gKsBaA4FJHedX
X-Google-Smtp-Source: AGHT+IEh+W8HKgLfDi5M/QKUU3nxoRXj22fu9X7Eskeo4rSZSdxEWF8Y0c8Z7alihJjJAt7Dsu1uZw==
X-Received: by 2002:a05:6a20:1611:b0:240:20d:47cc with SMTP id adf61e73a8af0-240bcfbda2emr1411418637.1.1755134774572;
        Wed, 13 Aug 2025 18:26:14 -0700 (PDT)
Received: from gmail.com ([223.166.85.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b424ca987desm23395786a12.40.2025.08.13.18.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:26:14 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v3 1/2] net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
Date: Thu, 14 Aug 2025 09:25:57 +0800
Message-ID: <20250814012559.3705-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_182615_964433_465D02F9 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Ensure ndo_fill_forward_path() is called with RCU lock held.

Fixes: 2830e314778d ("net: ethernet: mtk-ppe: fix traffic offload with bridged wlan")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v3:
 Reorder the patch to be first.
v2:
 New patch
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index c855fb799ce1..e9bd32741983 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -101,7 +101,9 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
 	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
 		return -1;
 
+	rcu_read_lock();
 	err = dev_fill_forward_path(dev, addr, &stack);
+	rcu_read_unlock();
 	if (err)
 		return err;
 
-- 
2.43.0


