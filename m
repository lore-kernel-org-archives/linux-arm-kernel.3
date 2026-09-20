Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B646C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=; b=JD7z3SvQZt7GLZJjln+t6oNEZ+
	onqroefOw2Dq2F/jmKyVEpPM/elXgV4eHpXX2poDuYFhxPdMvxbuhHzNWgxKMnARaGQe6y4PZP6Rd
	PROxP0+IwlXrE71PoQT3668AUbbLBbh8hg92XEjjgZzdDkv5XFWNvouU+kDjKUWEHhBgXgj4pUeCR
	EMAbgF60h2+cKpvJCvwKixNNpTctb0mUnh7KlPqMFblh9t1IU+EPcwwTGGnJEO4gTnnwcbH7aHtto
	Vac1jL5f12VJJJbPlqtWWQcPPmbIv/AwbvRS4yQJ3Onq6cOyWBYRTkhrL84x0Q3PV/TE7kBJitTpz
	AF5Vo/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NZg-00000000Kcz-1OcX;
	Sun, 20 Sep 2026 19:51:44 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NZd-00000000KcM-2oyu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:51:42 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-469fdb78b1cso1642089fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933901; x=1790538701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=IWXTukIH4VmQAJ8uRqfjqpV16BtC4ktBxHohmiVJt41k2Mn88I3aDPzgY6qedLg4Sq
         zTgcUb9d8QXb1KxDffTcLYNKdy/If/YFYXcFWYvVCHtktTofnm4bOj1KyRmb2XH9sIOp
         YwDuvT6lH6NKG2Mmtx3yOhjrAYlmC/23YXkjTzODrFjsAOC3g7d2W/V69fMMlcrC7Xf2
         kYMoNC9+PPNc+vrqfo9ivtT1iZuk0HE3jCGS0HbnBLyfUyCrsN91g9O/zTI5nld3TRXw
         6RetVbzPF8nbHEqEqNzlQoj9DepotgHe7QYz3Z9WV+JyQ5B1eSD6HEvQMtiVOsjdj7tP
         CXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933901; x=1790538701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=M4kh+C6vykVdQmDfnrgtO0df1r25vs1H9EUvgNxRVPa29q5zuhWtzCLF+rjO6LT3Ca
         mhmU5NN3k0dOY3xXtFoRUcXDrBdwYN/y9BB4LPt/QY3GhVd9Q41fKwvwF+IpyN+7GEQ3
         clp+SXXAKXgfHb8scWVEpLyZ44NtD3q/hsEetKQljKsdl4V0N9CHcsllDOzM2GAVd9wC
         Ykf1HUg7zr/5ODJUQpA2jFJkp8obcF/3i3nFu7neblk/1yToMMyDgrxGy0x7lvZXzQRV
         68nM8UiWWSkGl0cmKiHNDDGrWWRAUD/ucRy7kZS/km05UQl0/nQnMs1npAvjuHb3jqNG
         bpHA==
X-Forwarded-Encrypted: i=1; AKwUvBxwX+Dgzm3cZooquGqDW9peO4uFuq6oWVjhmyksmIDtpAABcbLX/0qpU/EtHLR4s17uPOxgEzOZAbHhc2nAf0mO@lists.infradead.org
X-Gm-Message-State: AFuF++kzdeyUBr4VkaDz7jghfW7s+tZz0zYGRpwqkpwuQNpx15JwFZYZ
	dV3MJj+Wn5pqIUL8PgGvf3ZeKaELHuHrNSL0oFhSFYYa7YW6sEcreoXpYknTY16o
X-Gm-Gg: AYBFou0Fv0KsuXTEO3DhM9DghUSydtmvcM1DgddvOJejfv8L76zm+XiOstPqYHdqlP+
	6nCiOPT7zQwhFaiNd4X48F8BlOHcHe5BXPcILdGXzWhixgbOnomZRyi7TlMCoyNZNa94ZE6RFRe
	kNVqk/2Jin3VFnUIqkJkI8gkis9DswrqPRXl9FPtkbhSGaLsu8tNB5QpMPZW+JWhrLifuIt0BWi
	E63M2Zbl3AELb83FYaQNbiuEpf6D6zjmkkj31FS4VA/PH5jwv+CiGwLW4s31dF3ubmW81UbsZ65
	98gjRlYh0XuDYtvB8EAehR/f+Y4M6+9HtO34qbzrTMTYzguVljXgrE3h4zlpMxZVUaOU1VWvalh
	65HL8rOM3S5oM/QyUAmoJahaUQHl7yMagTQ8fsSOBLOA3XVuInNMlvGAmeZ72s54znOLDevj+fJ
	U9ipJmABj3eCI3eTgZ88tfcgp+8LhHekBCHop+ZkJgCqtaPalQngdo4eiyGpFAuBRKVszqpmy4m
	r7wgWyebE7Z/wNLZgkNQpP/hCmf38pntaInHyeukRVhr8r8W1QtDYralZZhahAlvyIWyRlKUoKg
	RscYrG9t+AjZAV5hF65hu9GTVFEzl5Sk/krC9MWTB/pmK7N3EfphUk3WQr9DDknXJOhW8m54an5
	Ai7dcwbxVWidZN7aQUcSJ
X-Received: by 2002:a05:6820:1c8f:b0:6cd:3ffc:acf6 with SMTP id 006d021491bc7-6cd3ffcb603mr4885791eaf.70.1789933542612;
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:28 -0600
Subject: [PATCH net-next v4 2/6] net: stmmac: close the interface after a
 failed MTU reopen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-2-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_125141_724353_35113C1F 
X-CRM114-Status: GOOD (  18.37  )
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

An MTU change stops the data path and then reopens it using a newly
allocated DMA configuration. If reopening fails, the new allocation is
freed while the netdev remains up and priv->dma_conf retains copies of
the freed pointers. A subsequent close repeats NAPI disable and IRQ and
DMA-resource teardown. It can hang in napi_disable() or access resources
which have already been freed.

Track successful opens of the data path separately from the netdev's
administrative state. Clear that state when releasing the data path and
skip a second release after a failed reopen. Close the netdev through the
network core on the MTU error path, so the PHY attachment and runtime-PM
reference are released and the interface is marked down. A subsequent
open can then allocate fresh resources and retry normally.

Keep successful MTU changes on the existing path, retaining the PHY
attachment and runtime-PM reference. Allocation failures before stopping
the original data path still leave the running interface unchanged.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..363872ff00d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -281,6 +281,8 @@ struct stmmac_priv {
 	struct mutex lock;
 
 	struct stmmac_dma_conf dma_conf;
+	/* Paired __stmmac_open()/__stmmac_release(), serialized by RTNL. */
+	bool opened;
 
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..89b773370894 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4212,6 +4212,7 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->opened = true;
 
 	return 0;
 
@@ -4287,6 +4288,11 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
+	/* A failed MTU reopen has already released the data path. */
+	if (!priv->opened)
+		return;
+	priv->opened = false;
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -6212,6 +6218,10 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			/* Finish closing the PHY and PM state, but do not repeat
+			 * the data-path teardown after the failed reopen.
+			 */
+			netif_close(dev);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

-- 
2.53.0


