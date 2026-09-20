Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8C1C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aFq2H0KJohvHytlOdYBRSeWux+yzT03AinuuVRvEmM=; b=I1bvBQUphJ2nh9bE8Fsbpp4DLU
	LCmgmNGNSG6qzq029WqVotPn94vLh4FHBogMCNe6h6iRHApDdDIBvx8rfLEop9NMLxy/4jNOhCcMq
	FrG71HwOLV2U4kCnEXMDgaZvG6dGaOgt85galk3GSuib3Uf43xGdXp5GQTTZxSbLAdoTr5GAZlzLr
	AdVfwPUXurlyYg0/+3pVcgR0qchqhyrk7ObGOMjavo2wgb1ehfu3u6KWltXriQRcovj4Av0G4alr2
	/m6kEZp57rFJyvc23LjT0uxPi3nwMprtu1OmnPDCXkWas1z8HaNoMc53I+UTjtPrWr/1iubFNnFbd
	W3eR5Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NU0-00000000Jq2-13Mw;
	Sun, 20 Sep 2026 19:45:52 +0000
Received: from mail-oa2-f12.google.com ([74.125.231.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTt-00000000Jnu-3fXL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:45:47 +0000
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so2834419fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933544; x=1790538344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aFq2H0KJohvHytlOdYBRSeWux+yzT03AinuuVRvEmM=;
        b=kxpAp98RaO67ZTB/XXaobErnPPYI/FA50VkbvqrHf83pVoYENBqPnvMDF1TbqOCyqL
         mMhG5b9smeovB0mkAcXu7O6HF3IUxh7PS9wZCZY86iDiSy8401VBJo15eSIm39Pu7Alo
         Txlxp+9WDevv5zAOd4PcVy5meEWpYHM8pTS8ul3leDN5IAkyGbezB3cT+dHWoCgYX5D6
         7RtqTbCgCllchhaoodZZMOvXXeAJ4ri2rBXTrFiWubVznfwCkZHGomHrxcH13hxUsDHC
         vpxy/gWQNDEe+VCIucPsYq9ZvIWd74Tq3OW6MejuJGCe4NKkdspNVSYR7FmYGNk7/8tp
         BXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933544; x=1790538344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aFq2H0KJohvHytlOdYBRSeWux+yzT03AinuuVRvEmM=;
        b=j3EBGc8zH48sE6xYyGS1tqnS8fkoBOLkWcevU8ZFoH1GuFqNivBPo8IuAV1OSZtClo
         NvRwgIljvTeNSFRAnZgQUJ0DkYXKlkMbe07T2i5mtBfYtZB3AbCNCzugxY7oEPMKAPWU
         rZGPsS5r985jLn2Bn245vHN/HtifHWtiGF3MAkXy9nZOSWjXWPhJq1eRlXUgvxZCjGKt
         rnI0PFdtn/vtHfsd8BcSObAfhUMxUF8uLy+wvGz8VQ4bTmyBl69c386574KIxvTxJIOO
         NdQ1Ke51eAwo9llULjh9+D8EoCA+sTxfIBEyArASda9bNiS6a7SzfbcBO5xNE9NPL+Kz
         4CKw==
X-Forwarded-Encrypted: i=1; AKwUvBzxF/YdZiMBVu39UWmEjwxgGW4ZeNcQ1OpU5aioruF6+5mGHF7fO0UhnzwGERE9wgZr7eYG0rbdMSJNA9xqMr97@lists.infradead.org
X-Gm-Message-State: AFuF++nzmUkAOc2gZIkVqP153jgzIQtTajbzfitu3E5IKRRbkCYOlB/1
	GTLQtoVhNEL2kSZ4n5AEtE/WaxvVALt3YTlRoFyU7wmgt3DvET3i9wgI
X-Gm-Gg: AYBFou2mpzV04poehNubjIVxIt6gkgpqcc8PIUZ+BePaOxUi3AEwjmYAZtAUh5/cwEw
	5RPbtHC1RDDf+kABkb+rzQjXdKynJpiJvXL0ggAeH6hJijzGDYdFAevWCHU2RWd6sxvQP6wumAg
	NUGuK9EOuKLPgNm+QHNY/0dTY1hS3WVaTemUNog9oMrlbNc+lDejp50itKCWrupkusjDa7FAJ8/
	rlqaB69hQuxp3CHxski7YRQyZMrl2DCImHTLX+DW2bingTpuKlQcq6/07As0PNJXP+r88qoQTcK
	Ko7HIRaL4jedqxrM27Tu+lCVL5kE7hUIb5vxrn1hEshlztAI1Eea/KKVMeUfNhHpM+eM+3Hpr7O
	qefoO/EvIocYc24b3nPp+cJjz4Zcd3yqt/23vzE1ALGrTdF3umr+TqB0SqL0zj+g80dIEXfftxk
	4lC6BwoTAYcA5fOKFWpU61XWDhgTgw4f6NN+lhHCa+DrqDPJsHSKo/bxB+c3sf4ANn6ktRo6g+P
	JX7jQA6KbFxwtDVDJ+7a4d3tPTVb//Q87XPm6E0a7PHtKf8CfjixsuK/KSjN0GZbFTyx2j3V6lV
	UcJdYju8iZehxebw7wcyRbsGcRxT1u/fTCh+xrrf9efW47z24DkWdxJTUoFmT1d7BAsHUjOLg+L
	ybO/rJMoG0eF727VXGqD0
X-Received: by 2002:a05:6870:c205:b0:42c:49c7:a499 with SMTP id 586e51a60fabf-486e4ceaa22mr8316127fac.3.1789933544510;
        Sun, 20 Sep 2026 12:45:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:29 -0600
Subject: [PATCH net-next v4 3/6] net: stmmac: close the interface after
 failed hardware resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-3-8347dfe2eb7d@gmail.com>
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
X-CRM114-CacheID: sfid-20260920_124545_934933_45C22422 
X-CRM114-Status: GOOD (  15.65  )
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

System suspend disables NAPI and suspends phylink but retains the IRQs
and DMA resources. If hardware setup fails during resume, the interface
remains administratively up with NAPI still disabled. Closing it later
calls napi_disable() a second time and can hang indefinitely.

On hardware-setup or timestamping failure, stop DMA and disable the MAC,
then release the suspended data path without repeating NAPI disable.
Stop phylink directly from its suspended state rather than restarting
the link on hardware which failed to resume. Drop the driver mutex
before teardown, retaining RTNL across cleanup and network-core close.

Close the netdev to detach the PHY, release its runtime-PM reference and
clear its administrative state. Reattach the now-down netdev so a later
open can allocate new resources and retry. Preserve the original resume
error and leave successful resume unchanged.

Fixes: 6896c2449a18 ("net: stmmac: Check stmmac_hw_setup() in stmmac_resume()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 89b773370894..18630ae62316 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4283,7 +4283,7 @@ static int stmmac_open(struct net_device *dev)
 	return ret;
 }
 
-static void __stmmac_release(struct net_device *dev)
+static void __stmmac_release(struct net_device *dev, bool napi_disabled)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
@@ -4296,7 +4296,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
+	/* Suspend has already disabled NAPI when hardware resume fails. */
+	if (!napi_disabled)
+		stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
@@ -4335,7 +4337,7 @@ static int stmmac_release(struct net_device *dev)
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
 
-	__stmmac_release(dev);
+	__stmmac_release(dev, false);
 
 	stmmac_legacy_serdes_power_down(priv);
 	phylink_disconnect_phy(priv->phylink);
@@ -6212,7 +6214,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 			return PTR_ERR(dma_conf);
 		}
 
-		__stmmac_release(dev);
+		__stmmac_release(dev, false);
 
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
@@ -8415,7 +8417,7 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto error_unlock;
+		goto error_stop_dma;
 	}
 
 	if (priv->ptp_enabled) {
@@ -8454,9 +8456,13 @@ int stmmac_resume(struct device *dev)
 error_stop_dma:
 	stmmac_stop_all_dma(priv);
 	stmmac_mac_set(priv, priv->ioaddr, false);
-error_unlock:
-	stmmac_legacy_serdes_power_down(priv);
 	mutex_unlock(&priv->lock);
+	/* Release the suspended data path before ndo_stop(), which must not
+	 * disable NAPI or free these resources a second time.
+	 */
+	__stmmac_release(ndev, true);
+	netif_close(ndev);
+	netif_device_attach(ndev);
 	rtnl_unlock();
 
 	return ret;

-- 
2.53.0


