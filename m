Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0102CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVH7znTjFWA0bwu5sf/vJ2V8033VWhifM4UtG4Dd7PM=; b=Ou904xfmztJbiEQ/T8t0PYBkc+
	5OCwzwn58lAsrDRABt6FbqNLCufZ2E+6WF1QWM4BUXpis+A9fM35jTsmgdTn9n4BVM5daxp+QlQfN
	myvJ2szXCEnLKFC1yR0Av9y72BoKzaK7dsV1cEGx0Es7tkO+5laWuZpU9rC5xck2MyVW2NLPhAuZ5
	O3w1hH4uDNfSco/j09RvycOwawQgd/xyN2+UsUrTRrSiEXhI8ISjJO5JN7dw9jOvu2juasNIcjwQd
	enJwt0qC8F7ImMWjiCYVinie5k+k0tUFbN2NjqbgTLlFPEhmgplIaxFDhcZ3+FywI/V8I9Vcfmncr
	wFY0yCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSWz-0000000FjmY-3iqK;
	Tue, 16 Jun 2026 12:04:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSWv-0000000FjlH-42Pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:04:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c85b2139015so1449662a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611473; x=1782216273; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVH7znTjFWA0bwu5sf/vJ2V8033VWhifM4UtG4Dd7PM=;
        b=TbX+LvXi4fJbLtkqqXlXGpLtzOJ39y3meCht2sct5M9Wbh9MRwt6x48pC4+V6vqTkx
         01ltknDrRupvR3jUBQ5wqPVlwkkBjB67ZcznTD16v++rT2kEsRRwLdfs8rEqELSxexKV
         yIWRVrk0/wWUuto0HSfWR5rlSAtoT82fS7pZ+LsuKe6/HL9smNC2UOKF2YFlalgFFTOD
         uDqv83tNLQFvO4ot1IBX+aZvHA3EPGK1Bt7oh1C21tnPNFSaFJ3+rEJhxKKj1RNHpUaS
         4AdnvWQ+1y//F04241woIaF/gmphr3vi2/yD7YmCb4F0u2sAHiP52p/ID3N86SClJEI2
         raZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611473; x=1782216273;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVH7znTjFWA0bwu5sf/vJ2V8033VWhifM4UtG4Dd7PM=;
        b=LJVO4Mf49iW7me0rcfRmtqsPilQQR+R61uZMNrPLwhJYVqWsm5/s1uQNSoAOZ0m1vx
         2dt1IDEUPbjpzovnecnL+Jzs+Kicy8xmRKD3qwGw0Z1HdQQSErY7UAeb7v6nLh5vhOhv
         LMtztOWLU0RDrUIvWQwcdSrzCGkgTos10Zo9GXl6B7FixGD8x9BmauohOlnpVuFG5fgP
         G5lubpDrZepRCxl9RCzqk9aMNAy5sq/Xiz65KcjVo/bbESBKnTbybka/agrwTQyUWKen
         wlJrNGnmOkLhIa5Lx3goKcImHHH0GQrWoe53ioh3R0oPdxU92r8wmvPtHDLDgNn9m9RX
         nN0w==
X-Forwarded-Encrypted: i=1; AFNElJ+pIlIE8A2UCoIHSYYDxd/Aqq88cIOHB8EYHigzEOBwrWNznIiBjiR0Cvb8Dr64/IVD0thb0kqTFZ8Fy+ZsNh1q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy18ouP4KlPcJksDwwFH3WWyYkU+YInsMsIRik2YbL4x4J/Z2P3
	6eX7OLSuc3jCGc5d6xl+UF5FaTvOfItc0TiHg4RUr7paUR4ytzAD6b8B
X-Gm-Gg: Acq92OHUHwMM47pqE6McW6ObdRWGwLgmaRqH9vmzbUw8t5m2jDd9kuTJvOxV1/DX48G
	J5eYcY7njF1c2CiZAvMWHGoAdV40X2O4G7f3/CKi4RjEvQp+x7hYaZm9hU2/0eUIcqu4xi9GpYf
	+0BJY7S4si6LWduL37mx9RZKrBzzzdmxxP7lXFgXuwMOONksm9fZwu6PUBwIdc5wmerk1MdRfBp
	gDddDBnY4hqLwVsWbbmry++6yxfNyTPPMKwtPNPnGQgodp0OVrA0t7MucsFLLPbSDHMNfgcyQmV
	CcQ13G8Divkrhezvn/LxHMXESJraCo4BAlf/q5aYiXFzZYMgsXzd0daKFhaKPz1NIGObrP7krva
	28p3Y1b/XkPWSRcAQd6/hN2IkkwFFuPErrMpKq9ITTG94odvifsTQAEF/sbyP5DEzcLNO8vywHX
	uEiMyMn85PQuN6Xx5rOhAfsXE4U4Q=
X-Received: by 2002:a05:6a20:7285:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b7e49d08a6mr3763004637.37.1781611473094;
        Tue, 16 Jun 2026 05:04:33 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm11768400a12.13.2026.06.16.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:04:32 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: Stop TX queues on error path in airoha_dev_open
Date: Tue, 16 Jun 2026 18:50:39 +0800
Message-ID: <178161146875.2165143.7400860261990016053@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_050434_815663_9CBA9CA4 
X-CRM114-Status: GOOD (  11.70  )
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

In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
netif_tx_start_all_queues() has been called, the TX queues remain
started while the device configuration is incomplete. This leaves
the device in an inconsistent state where packets could be
transmitted before the VIP/IFC port configuration is complete.

Add netif_tx_stop_all_queues() call on the error path to properly
roll back the TX queue state.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..cf9c366907 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1715,8 +1715,10 @@ static int airoha_dev_open(struct net_device *dev)
 
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
-	if (err)
+	if (err) {
+		netif_tx_stop_all_queues(dev);
 		return err;
+	}
 
 	if (netdev_uses_dsa(dev))
 		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
-- 
2.51.0



