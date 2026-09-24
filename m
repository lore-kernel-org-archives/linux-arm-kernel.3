Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E487C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wKZkkE2xLR0im7GAkRWZzs8Zs+Mbht27bASwGvGU3E=; b=srYQGNTnisP1+DaCmzirJK5h8s
	54i7YpXIuUtSaclDC+0HxpBrtXMNAHM4DWuu99F5Tpyin2uysaB8C9HPU1XLxhA4HKn0U2bte80O1
	5tiEU8ppXJIi2eNwmG8xLSOdxNVir94zCDSTN+6NNA/NoPnPcIxrPBUh177P1zD5Lj+JPkcZqDFp4
	TcsfOrBhGJ0sJoqkl1Nnm9p4N9UJEuEr8XnOV9ZZUsWBaY3x0qlznPiubiveRbWRGz9ocXXl6ozr+
	JzBK/l2yCuVyOQ2usllFRUawy/ImYuz9WuI1rPssN4+0nV47C4PqAzDeS9POSzadJwEzJfqxfdOaO
	eO8DJzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUu-0000000BoJ2-3fJG;
	Thu, 24 Sep 2026 17:44:41 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUs-0000000BoI1-263e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:39 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae721872so62251eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271877; x=1790876677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wKZkkE2xLR0im7GAkRWZzs8Zs+Mbht27bASwGvGU3E=;
        b=X1Qhuz1aBvHcFkwZqxKcAaqahJlTIC4Dx3gzVVS6h5KDG8YnJmnWh4i3Gaz/87Ljep
         HFPKmdx4BTPJ1M/+UNDyR5G2mP5IhVTiuzSFlYqwj+Yd31F9s2OkHO3FharVRPAHZpjw
         Of12PyN2o3mHC8PRoknBSfRohm3sTg4jhe8ReLWIb9ukNcuCr+MGXzAi5Nk5/XbvLezg
         8ejrikyWjJWR/NppeB8q448b2xYHmfZM/o9fC6MzhkPA24mk21U9aoluKtMqWqny4aqU
         8V6L5BFPRzciSr9w/XARVHz2vOxomQuJ/qYf8xF6bedQasNiMdURuytJis0VltTpZo4N
         XQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271877; x=1790876677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wKZkkE2xLR0im7GAkRWZzs8Zs+Mbht27bASwGvGU3E=;
        b=eqZ8KjGDgBmLsNjNtEdeifrb4IA3yUtV2TdUSP+s35meyGhrZCoNXHGTl3L8jWIN8D
         jWKoETyvqlPgC/vb9cdnGjSC9Q+j8vpO1ByuRWoEeOZVCdAbVvNyP6xWXdxOIN9T1Jcd
         4a1Y/zMZ9btvcQau7dUjYCud/E+qNezEdJN9eL4cUXCT/GYM5YDOs8PMwNc2WKxnEnb4
         ErGxlf9/G7CYGT9EhpOyMH+Qc2iIBrCt89b2gjm1ZH0MNrKD9Y4bTorUSSHOGHN72IPW
         oTNf3Rr5vX47h8orCu/Z2DcoLziDbqz7subDFYZkq7LarnLTECDIBykavvF3YQnZmbil
         3vEA==
X-Forwarded-Encrypted: i=1; AKwUvBzUVxyZ0xkcnKYZNxA31xrnm5+XGiWIyuCPbXiuZtcXac4QeI3fE/T4B69L3N7DPygXIBX9cdgb18XAszmGJYBR@lists.infradead.org
X-Gm-Message-State: AFuF++l/csgIPj1Ney7jr61sMvERvn42RNDVfIJW0Jj3KlQWSt0kXdGw
	rYpx/Gfsw1QSRB7aoiL69o3Pyt7L2jutjq3waLAAVu9AwAURrec/lHVD
X-Gm-Gg: AYBFou2YwSwFVWY5M9KBdi3Csta454k4/4S/oBfs87ksFLLxgVKnozMgQf/a3LoYwOK
	aN8vQEUTMmYUt6gpA3hQNcC46MkIKmQBOfbc8FzaG9hkTbTd6YWWLUXKI/TteqDaTGkL5b64nZ8
	vZub4fQyDkiJnZ1yHH6omQUNb2XZvDG76V9kf1RduCfv6Kf3dCnP+HL2BO9YChKwARVhxIJTb93
	LjpGka/GLshwjzD8dbuMQLuNw985qH0vCglzIPfXXUs7qm99BEXPhhEKCYqw69TJ0oNirhKSLHC
	j08lhXoBr2WEphuC8de4AS7e/oXRny7qS3rNWCbVVpR3hSWZJDdYsdVKL1hkfx682MHLAe0g4lw
	frbpNy2rOhV209CJQ0mJeeolhv2kTMOyisn6eB5rpiinLVCP2NtUHrNmgBzExdEcDIeB2Q8k+RB
	bpF/2db2AQ38vJhbtdY5llyq4alZS+DaZMsS27Gwfw84Nvla4EgnSp1tNcrFBlr7AGqATfBCRvC
	iWDvgM1kWMRwI7q45zXLBPhGUXIyVRKJSVE9MVSZmpM6TLvi+b+w6QZRtztVlBXp4QdfyAQZ1+/
	epPpWM279QRc+UNzUPxdEJLwXx46fj2Pxr7mU2FYDYixLYltKd6ux47MEq0YH38IABGVmQ0D6Ch
	kl51dRef2OFOPohh5Z0cmJg==
X-Received: by 2002:a05:6820:f005:b0:6b7:83d6:2924 with SMTP id 006d021491bc7-6d43f7a5ca3mr3335705eaf.39.1790271877265;
        Thu, 24 Sep 2026 10:44:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:31 -0600
Subject: [PATCH net v3 01/10] net: stmmac: unwind the WoL IRQ after a
 safety IRQ request failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-1-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104438_560288_903231F3 
X-CRM114-Status: GOOD (  13.55  )
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

The IRQ setup paths request the MAC IRQ, then the optional WoL IRQ, then
the common safety IRQ. If requesting the safety IRQ fails, cleanup must
release the WoL and MAC IRQs, but not the failed safety IRQ.

The REQ_IRQ_ERR_SFTY case instead frees the safety IRQ and skips the WoL
IRQ. Allocation fault injection during live XDP reopening reproduces a
"Trying to free already-free IRQ" warning and leaves the WoL handler
registered after the datapath resources have been released. A subsequent
open can then fail to request that still-owned IRQ.

Move safety IRQ cleanup before REQ_IRQ_ERR_SFTY and WoL IRQ cleanup after
it. This restores reverse acquisition order for both shared and MSI IRQ
setup, including unwind after failures in later per-queue IRQ requests.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..4f3d452c3503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3797,13 +3797,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

-- 
2.53.0


