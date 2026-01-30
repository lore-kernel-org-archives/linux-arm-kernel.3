Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E300E6BF01
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=; b=cuDu9rRe+CY5n6/is2U+GCKJis
	OQawKuv+iTXF8bj8Vl+dXoYwqT55vsU7l2b+OqJw88NomZg+bv+i8ORGUZaPFEWiZ4za84zkDtD4C
	k2yHuSqHeqIJmAYZCKtUeOYtzrnAGB8nbXQidRqMl8bg0qHdre78DXGGjTVkFRfUrJNmZHYEJ5odL
	OfJ+TzmynPXHVz66deks3c3mJGx5wC0PjdT9tqjisUzQpCu9QnHnS1DRLZ0bm5wpO42lhJ8f7k7or
	qOjZ5EK8HGU/bPzFs0/bbD42LxIxhwc49n8nltNhs/3N57Wi6+nARZECJtddKOQnVidH4lBxW1fcZ
	wP4x/Jjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmyg-00000001RnW-1qYj;
	Fri, 30 Jan 2026 11:47:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmyd-00000001RnB-1org
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:47:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b88593aa4dcso285941266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769773669; x=1770378469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
        b=FlxPFZUBxS8ApsOgixlmq+asCfB0ceeOXn6Gak5kIF4rAYnF+S24H350q7DzqRieoi
         J4AlQwmvmTaWlCC3P4D/5iQ1R1xnbGzOdlFkhvYbvWLoNtJjaCF2XvgyMNeb1u6/i87y
         qdS7ReGcsKiItTSauPwFzixhCRHK3WsJHY5ZAkXGPmRWaDxFsJiuIG1S6jDRgu3SP+03
         PAkVCBl3zkfc6aIgT5uXwkWiXoaT/113PMxaxvy0FrNhvtci4D8HseJrGsaIQ89H31Am
         XVw01+jTSOTmuUFO03nDq3wFVfSbKI8QExksWhfmEWKuZ7CVV1P4G5rNxB6TXmX/w4Bx
         so9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769773669; x=1770378469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
        b=rOOQWaO45k5UVtHVqM6NQO0nSlYdiBx6d+isWWd/6lhZeePVjvuDmwT7diusjmFdXt
         MVZ5pHW9NtgNUYdDQr0Gi2mUovmim0Mqh9HPGo/TUa/1F66Vwtf80M12dDtjl4TFxZYF
         Axzh0c7gB9Zj1JDecCX/6c3drOhpw+JnR69emHDZxVixUGceEwwYOTfhzCJkhM355+HW
         YZZVG9op53ka8ailycM8a8az9E0T8d7QX3+ZyrlD4sSry9BOO56fJ3fIxuJHNnfR/LlI
         4amnWkPHCPt4SlYpcfs/PbWmY+wDe+kZCSrC8vqjYiF1gWwCGqR7uBqGOXYcdmY87xBg
         NopA==
X-Forwarded-Encrypted: i=1; AJvYcCXG8PDp7JxiKFW1qrTC3okw49q4N2QhwDkeXuY9tkgyEN5+6DqMJIvBTTDUk1TzY19SPQnOY4ZZGC2Z+MdTU2sf@lists.infradead.org
X-Gm-Message-State: AOJu0YzWrFhy21Ak2ZDg4XVAaBea5ZdIhNE8roqsKud88NpYlITdU+rk
	h18WM6vALQvc8aflzJZs5Ad0XsCKqbrqw8cjrVeiqsHmzlrz4NAghJ7L
X-Gm-Gg: AZuq6aIbEkFRuuV3uz6UyFGHdF03cfDroIfVFDa3mFElSDNfzqkC/5G/Mk6gTUMIbkh
	iOrxHOJ2CVepPfstr9bPOBfwenPcvMsr0MivTIZx9hbk5LxyiNtfKUukuh/OKrVXJK9Hcwp6ves
	G0d6ZD0hxS6i1qY0DJpoDBKE0AvFGolY2H9XJPkoovy9buZz8uIxodcjr+HkSo/7SmXt7zeIlI2
	25pr1tKGl8rVAWvGP9Jt4mN+6FL9DWBVJJgAOEDk424huUc0CAC0XF8wGlo+ouNd2ENF5perJQy
	hAx57dzftbOwVfVuSGSIVMKH9hR79KzlPeRwmF5IuuBi7CVVE+nq3QWUGKR0lngjALi5VLoG+6e
	4FmFcM9S6Z7ahOns7QIgt9N8INSo19rTM67kttrMWnN7P1E5HaZcyDIY/PUdlVk5v+8lH3RcpJ2
	NG/sTGjqp8xMRfq89nSbDGlV9XScST1O3mXgg=
X-Received: by 2002:a17:907:7212:b0:b73:9280:2e7 with SMTP id a640c23a62f3a-b8dff71f572mr144266166b.34.1769773668637;
        Fri, 30 Jan 2026 03:47:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:47:48 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Fri, 30 Jan 2026 11:47:40 +0000
Message-ID: <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_034751_516252_06B5F110 
X-CRM114-Status: GOOD (  11.87  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0


