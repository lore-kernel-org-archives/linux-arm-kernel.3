Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUq/PWSOM6Jgkh8a1Vg6y06uVsWzXgd/e9CTRW/3aLI=; b=K9z0RQisOCQIMQpF7DpQghn76w
	pwMHSf74KPcj4FmKqMXk5HWHqizpUDU5lRwkq+gmgBQtToVqaknQJzmAlY5XNIQx2C5HbXK3LKujc
	av3rf0bwH8eRjeS0T4vkpIKO6Cks+xcnqItrM6hkp6zu+tg3nxV5wvYBsFq1CbSO8UjyWL2cP4Y/s
	wnpTgKBS25msD5dN7fYHVNyiq2hXwthBsIohO923MEDGFFidDGV79/srNvMb1q0UDYfY9QqhP78Oz
	ISm4NUku+dIfkdhJl1EktcXdcdvcOB6BmqXwXUGF0zE0lbVBDANu+8AwRCDZ43md9TPtdvijg3iJz
	cJrzK1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBm4-0000000EqZK-1qkW;
	Fri, 10 Jan 2025 09:57:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBib-0000000EpRJ-34z2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:54:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21628b3fe7dso30897835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502857; x=1737107657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUq/PWSOM6Jgkh8a1Vg6y06uVsWzXgd/e9CTRW/3aLI=;
        b=Ljt7krhlDDa4wi511Vvak9VpK+S76Stq/2b8PB9Xa4WJrVe4UyhhnYSIiOXh1EVLHj
         5RLTEeUQUr/PxWpHxz6/7ZN2hrcSXsi9qcJiG3NVH/FrcoetFs0K5ioxyYEvEvBC/I0q
         yazrQ3SNDtkSwIcap8ozWtUpcV+Y4IolPrESniKXsUbSlffqpPWDcC7HzYvmaR/Ikzi4
         AUFY30n2/UKtSwFiq9TBQG91eUt66AkQmLFAMnBJpRAyIZ34QjDYLHbQtpMR6uE34v+s
         1P3xou2NlIyLJjSvlk2HejrYhlOmqKva7kC5dwW8GDKF0FU1twG1ksYwvmDTKEZQ3XhT
         Zd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502857; x=1737107657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUq/PWSOM6Jgkh8a1Vg6y06uVsWzXgd/e9CTRW/3aLI=;
        b=GFjCaaV3bfiJ7Edn8+yi+pKUUPK8HAO2kQdwj+a+QxETjL1fSKeu9ewA1y5tOu4Do9
         m8pnr0P3O5mJIXjjN3kD3s+2hJFmtgsNHmMuFiDEaQBXDwVrbaO6Z9C83vSjSrn5qdlO
         HbBCjLDuf14Z1c/EAb0DMLL8hf4w1IRpqDX9LFpof8Ceplo/UTVOI3nfxKG7V7L0n50M
         oLOYpfWPS+xg6JNl8NrjJkjb5nlh4D7t5km5GbjpQPNtmgO0Wtvoi6/OPm8xaw9O0aLs
         l3e+aOb0U/pHC3QEP5J7fPEu1rczWlqIhkljjqoMY2HLcRKxreUTIHV7gMq47jFYUSmn
         v+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtg/DXqGJwhe6rZLTF0PbMoZR2vO1IfvKoZ8xyIPzDJG2way9srJW6PzkIuLKR6D2HhC7T6kgPZKb/kXT1/nJn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Cw+k0dyJDezpBDxwLWJ+tgKDd7Z8+UJTJYTf1G1U92VIcVPY
	nPhKAGRQZ8qNSO4IktzLvyjgBKdDryGHxfRtQ6T7NDI7yV2AR5HY
X-Gm-Gg: ASbGncutr6mgSLJ2GFRYJDG8j+rK8PWAUIO3vmey34Kh0zmSB31kMVplOcJ2o5OAXOn
	xwRcFPLZHjXw5RIuufhpCtPMWuIWoCQNj2bhpS6wpnaYarnf0UUEijOrERdSgqfvcdgY5P1CRDH
	PboDP2MzU/sxQVRht2kIGJORG3o+FGkz0LBMDUvXR5UCRUY1/1Udjus7OVyKjqmtCzOFd5/Yt7/
	kXGxP/fTME3Aq09mg2b7nSwyYurSbri9lIXDUCpFjfF3aiQJEHkcaphR6ZHbHXvmp2EYg==
X-Google-Smtp-Source: AGHT+IHNOyExXpjKEAJvj5VF4TsAcm/8iRdMra6jEOVD+0OivVdVmbGUe1wn2Z9fO5OhUfPCMwcgdA==
X-Received: by 2002:a05:6a00:91cb:b0:72a:bc54:84a5 with SMTP id d2e1a72fcca58-72d21f296edmr12960201b3a.6.1736502856641;
        Fri, 10 Jan 2025 01:54:16 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:54:16 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1 2/3] net: stmmac: Set page_pool_params.max_len to a precise size
Date: Fri, 10 Jan 2025 17:53:58 +0800
Message-Id: <4bfc67ece5ef615ce65972173f5256f10ea27f9a.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015417_769694_A0D649DC 
X-CRM114-Status: GOOD (  14.84  )
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

DMA engine will always write no more than dma_buf_sz bytes of a received
frame into a page buffer, the remaining spaces are unused or used by CPU
exclusively.
Setting page_pool_params.max_len to almost the full size of page(s) helps
nothing more, but wastes more CPU cycles on cache maintenance.

For a standard MTU of 1500, then dma_buf_sz is assigned to 1536, and this
patch brings ~16.9% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, from 2.43 Gbits/sec increased to 2.84 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 43125a6f8f6b..c1aeaec53b4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2038,7 +2038,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
 	pp_params.offset = stmmac_rx_offset(priv);
-	pp_params.max_len = STMMAC_MAX_RX_BUF_SIZE(num_pages);
+	pp_params.max_len = dma_conf->dma_buf_sz;
 
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
index 896dc987d4ef..77ce8cfbe976 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
@@ -4,7 +4,6 @@
 #ifndef _STMMAC_XDP_H_
 #define _STMMAC_XDP_H_
 
-#define STMMAC_MAX_RX_BUF_SIZE(num)	(((num) * PAGE_SIZE) - XDP_PACKET_HEADROOM)
 #define STMMAC_RX_DMA_ATTR	(DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
 
 int stmmac_xdp_setup_pool(struct stmmac_priv *priv, struct xsk_buff_pool *pool,
-- 
2.34.1


