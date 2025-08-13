Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C183CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNEPtiVWNyz0k5hfirppPx2xAhRHwAbBlwAlyZNXQBs=; b=CXsNDvxxyGoHNe1HbeuJQzF1fu
	xiYuNYjIY2CiiAHpZH8l94YboiiOxSqBhnkNjMdYsMynpgJpSGC6jKgMd67MG6Y7+TcJl68ODw8ll
	5ONDIUGkzs0jRBDR3k+THoSOGeva9Xc9v7YPwkbQrt6CzmEXvHKf5+G/+3D2eNMcOlPgd7NdUm8v0
	L298TNigEDtkVtZlb9lK4P63p1l7twUwOcOXZZJfSQ64Mr4PP228EQLVwRFnzhKcL9RWqsrF40C6M
	U6RC8n536wsv7szn6LyQVE8EUr4K3i51Pumqcc4T0Cat/IaA+5FWyDtOaBAMYlFbHZGDv249Kw95H
	5UYvRWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0eD-0000000CMqG-38AL;
	Wed, 13 Aug 2025 01:51:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0bg-0000000CMRd-2JnH;
	Wed, 13 Aug 2025 01:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=ZNEPtiVWNyz0k5hfirppPx2xAhRHwAbBlwAlyZNXQBs=; b=gBbxYZN4joRlMGgpL50KzYqf+6
	YuaYqx9/JbtQqf1+n8uJ+ue4af5SCVdSCASwn63E+zvd/I5JBo2hYwxNOcgKmiDxMpMy0W7lGRrbZ
	k6XjD4t3wuo5Clqb84hBBKrhLfPFo8ijAL191ukrpMvYg471neDSuagmCojT4eDA+R+6t8IwxnMzQ
	CecFdQMW9VnvKsczNti+cfZhLG1ATWWuHoNCcJQfKWIIF/idSGn2M9kTZqcfC0A+TXt5kaKq4WBhN
	/cnyGs7dhdQwEFDfiEwTRoNbTn5LqqFm6xDHAG8KSh7hR/K7JDLPSi9yuwDjsOfLfhKw4q8IHGNDU
	OeurGMMA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0bb-0000000FwEc-2HwF;
	Wed, 13 Aug 2025 01:48:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31f255eb191so6278706a91.0;
        Tue, 12 Aug 2025 18:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755049720; x=1755654520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNEPtiVWNyz0k5hfirppPx2xAhRHwAbBlwAlyZNXQBs=;
        b=ThkXBktAyFXa9htUeqweMuysZEB9kYkwlx3zmfW85AqBRCwYp5KMxPx0xOfgT6YDSh
         Q1NjasOtukR5iGUvUwJk0IUFiCkF8I/iz8UExGrgzafD5H6XpRpQqNSwZ1mimenroALv
         6tp4vLoY11WnjHzgXRj0tPtYbItRd4pxKB+SWy/baEsG9WMXjH7Z4MJuxBM78vo5Gv6Y
         mdseORuiP77xLdRuqyrDwuyV271efUP4FUXrRvz9HafIG7nBF1GHkii92Q8eJQDE0oS/
         Z4CRBNDX+if0lCbg17IwA0lX3yvpB62bzE5pElA2rEczQgNq7JhxmHjg94SAdoyAmSTQ
         CveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755049720; x=1755654520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNEPtiVWNyz0k5hfirppPx2xAhRHwAbBlwAlyZNXQBs=;
        b=QtjosvNHS9hFKP8/ub6Jzk0Xg0TM9/eLT5hoYF3REtjXTjBXualmXEkBZsLdRm/5Fv
         FCAKNoR0dv8i4tNxOd2++oJlVwP9xbTDmOswpLhipavgksrMjUilnt0/YYcgeF0CZw09
         3n28s80RAV/ZT2EYVMpTGrPxfSRmN3cQoeMF4t78zN5ViX1uYreNxOmYZe0iOdpAskd2
         415smpyAgHWfKo7CRHyw4fUuSCy+2Ig16J+0XgZtKiGrO1PRJdGc9+r64Y4G89xSvbLK
         2Xv8h9u1T3p23kbDMPVoSZ0awiQ1DN6T5QXKjamqJm/ON9kwWGPNAfS1PVLQgP8RH6LK
         7DGA==
X-Forwarded-Encrypted: i=1; AJvYcCUAOJ9HR3EmSeghJ8hHvQCJIb7BQwoUXNrkkPYT6RBLHIs9P2xsXugEUVH2j1CrJwl1hlcj4sP5bUFyBP899iA=@lists.infradead.org, AJvYcCWSTSbw59bHSTRrupuBU4NDODcOQDVpz6rcSWX0R5beBCZXwvBdSdM1QhwG16uMvUMgNIJhNxhUtoiDC6sbv+3O@lists.infradead.org
X-Gm-Message-State: AOJu0YzmfxzRsmQOO3G1AGsQuJZ6vwXv/6L+TxhyFi+SjqQAgrxg0C9S
	k4PiqDepn8rFp73aqd4UpiHFrVzfrpxMBnnQaLFV6YwtDv8g5e+1ou8S
X-Gm-Gg: ASbGnctc6uUKcn87YpHjcz7OUbd3dc8SrGWsT2Agn/CP3J3BBBE8Zs/ime5FFMAZd8t
	dumBcjao7VbhIL98IUl6p//bTN/1p84No+WP6hDgn5C4ZBeO7Jau4u0h/mPjQcQGlADBmKqtHi+
	SjyqN4Ik83KrM5qC0YYX6TYEeMPGKEhaN9v7xH70mPC6OYNQbdBGME3pw3YkbTNvABxpz/s43ri
	1pPVJgF+jzmm3jkuXI2fnWUyW8COAylpAt+M2hzeE20t4Rs6nqJJ/baJiK/3wrTCzLIBMf7T6H4
	xraRj1WR9FuYHy2pcqk0Fu5juTwHl3o9HdPr8YnRW9+NWr2v2fLq52basvk5m6m4zqKqt2IFE3L
	03tWk0XgfqbT5Og==
X-Google-Smtp-Source: AGHT+IHiC1yym5R0/cDYZlkWZUsUpaQJz4hN+5buzIoy6vEiOa0/vzx/BS8PkkCS6nRqniff6QWxOw==
X-Received: by 2002:a17:90b:180d:b0:31e:cc6b:321f with SMTP id 98e67ed59e1d1-321d0e98677mr1783138a91.29.1755049719944;
        Tue, 12 Aug 2025 18:48:39 -0700 (PDT)
Received: from gmail.com ([223.166.85.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db52e0sm449652a91.17.2025.08.12.18.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 18:48:39 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
Date: Wed, 13 Aug 2025 09:48:18 +0800
Message-ID: <20250813014819.262405-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813014819.262405-1-dqfext@gmail.com>
References: <20250813014819.262405-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_024843_739245_096F1F95 
X-CRM114-Status: UNSURE (   9.86  )
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
v2: New patch

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


