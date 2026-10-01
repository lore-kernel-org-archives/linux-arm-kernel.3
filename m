Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63066CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96cgtUmQY7pC2wD8g1aOKJCa2wlyYVy4lJ4KL8qZGNI=; b=kv1t5m9zwaJaz5rJVen3qcvN1R
	y7sNeGoyC01UR04xFhsGPoXPxvXeLaj9/SCN8PRb0WqEHVsrjM/oKQyBy0PMvSOqvQXqCPup3E2jY
	4a/fPm191PUNZ+kGqqsKP/OVCLDjE90C689WsUKf7WJjS4qmzD3kAf04x95hUgdkAsuLJTyjNJd0e
	PF5ZVOC31OyD92a87DEZl5yxQcMc9mTGiZS1XZ4o3lANsV2/wFHNqWdp+GBwDKEDReKKQrWNS0frO
	r5PWoEnVGDiasNL+FQKLlnp/OLJn0JEtI3qwHGo2lXzSSP1AfUp6xbQaXswZLxYP/c+WNSJjNMKfz
	f8PX/CnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AP-00000007i3B-4AzC;
	Thu, 01 Oct 2026 04:13:10 +0000
Received: from mail-oo2-x26.google.com ([2607:f8b0:4864:31::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AK-00000007i0i-1imx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:13:05 +0000
Received: by mail-oo2-x26.google.com with SMTP id 006d021491bc7-6de5d816853so33876eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790827983; x=1791432783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96cgtUmQY7pC2wD8g1aOKJCa2wlyYVy4lJ4KL8qZGNI=;
        b=CnC4vcdOJmnPYnmzndj2i7Uyny6t2ipnWAMCnEndw3bqnym9hPnOCWbAUGuKEVIPIo
         wI9mcv6fxz3xfiMu242Ucg5Mcc49evPhJi/Q+QoWum/nOlN1JQSgBm0sias+Wydq3dJc
         /8TKSHPFsFKnIp/vCdcBHe9doK6BYktwTj/Ov+5brTQ32R60gtBOxhSATh7QJqXBv3J8
         XiipdWIo9AFHULlwh2OhWZi3hIazIIO2/ZqftZxmNYdGbzWvYcrUdhq36oQbOwQYgGKd
         XvwzUN7M8RB++68oolCUwLvKtsQhyfU8oWNjV3MfqXrDQ4iXmgFIRn7sAxed3FqEZ0p1
         FPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790827983; x=1791432783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96cgtUmQY7pC2wD8g1aOKJCa2wlyYVy4lJ4KL8qZGNI=;
        b=I3DcJnybtxck+RVjCkx+MB0VxCAAZYJ0E7teOjTOKK70+8lFm4t7vJEgqAqmAXNarK
         NIkivxjczfBIHNQKIe4kjr0d2Eug9vbdIOVP6pkuGXHEwjaImZ2NeGFG/W/Nvrc4nCc+
         hGQYZ9K96g12OTFQtDAtZw6RtWgFOuhkf0oJCap9tpr/mBbg19AMyBAfW9miSrWrw7et
         xW9+zzrb1zoAX2sb5mxVoK+PTtOtRMvcX0m5Blgi8M3KR6OLpGy6Q6H3p2+XDxZwf3Ma
         gO7Ro2ASueM+2oW9QyYU3CJV1xW4OxiXS9+EWD2m8uMil67nf9uoWQ3Qu/XscTKCegs6
         77SA==
X-Forwarded-Encrypted: i=1; AKwUvBy1//U0rwCjVU/1kkWNkbAjK6YjMCs+7ZsdGlTKHjxAIk/xVeH758Ag4P3234abkzeWGBd5A3wzDgO3SSijS+kC@lists.infradead.org
X-Gm-Message-State: AFuF++lffQbk05EdaMJAPX7QRZ440lyMZSB7CKX8SSVlVFQAYTFmkHE4
	mFs1DQueRVmcXK6UibTg5D19tNybvR+x5kJbOPyfR4YkgrzZSN//l7UE
X-Gm-Gg: AYBFou2Uxc/GjFu2hhJwOlJ364vSTiTW4Cla1y5FalbH5N865qKdOn9NwICdPqgmnEb
	VobJl+JnoD2XHD1Mj7fxDiGOKkXV+nMg4PTo8UGhojbFp0wqH6Oitb/Rhoa9slQ0xc1eSmF40T2
	rQaSurBcacsaNUfb5JT/SgOp8ZBC5NMu6eN5Li883/e9FkG0B0Ae1usgErslk0n6NFpm7I20Sd3
	SKIm69eI8jOyZrT7L3NXBkv9E1XE0GNaAnIBKeHK75j9bRIxN7xkq5f1+QlplpIxbULeW8Gvolg
	bRhGBCHcMEP8eEndsmMgO0vPfIxrYjEh+gS1pmp7+/FZ4tPOt4IsaJn5k2mrw1sIUwFIC9knwHv
	2seOYmfNOKq3kwOKXcxGfTsb3crEvV6VB8LgsBG1VZp1RZcHrEsS5l5Tn6EKsFBSSKNVpzM9E9b
	jpVhEnF//2GifvhWTmQJK8DHmI5MEKFlFYgBpzUcgvwBapfftmrF5B0b64FTOCiJRImvjq+8YJP
	WY1J1hOe+shddV/8jcggQrILqbK3pahoHzQd22mipjbxmZLGvLvcWL5/Nz/R5Htih2alTxsfQmT
	nl3GK8qcUTbzNSc8WbNaBzk+hktF49MmktSRr8b58wh7henoNobU/lS8gW+D4L8GIgJc/SRvLte
	4ZvUUF26I5QsZ8cnC06lQxDxRXQBw9nw=
X-Received: by 2002:a05:6820:2911:b0:6d9:277d:79d2 with SMTP id 006d021491bc7-6dcf4c5ff47mr3589808eaf.41.1790827983279;
        Wed, 30 Sep 2026 21:13:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212af3c1ecsm1708657a34.21.2026.09.30.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:13:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:12:52 -0600
Subject: [PATCH net-next v4 4/4] net: stmmac: restore EST before starting
 DMA on open and resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-est-reapply-after-open-v4-4-9d4366587b73@gmail.com>
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
In-Reply-To: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_211304_479651_73FA085D 
X-CRM114-Status: GOOD (  14.76  )
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

From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

The core reset clears the MTL_EST registers while the cached TAPRIO
schedule remains installed. Reapply that schedule after timestamp
initialization in open and resume, advancing its base time by whole
cycles through the shared replay helper.

Move DMA start out of hardware setup and into its callers after EST
replay succeeds. An EST setup failure must not expose an active
datapath without its installed gate schedule.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e93f3238be1f..2104eaef8806 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
@@ -3779,8 +3780,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
 	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
 
-	/* Start the ball rolling... */
-	stmmac_start_all_dma(priv);
 
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
@@ -4200,12 +4199,22 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret)
 		goto ptp_error;
 
+	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
+	 * registers, so re-apply the taprio offload after PTP is up.
+	 */
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto est_error;
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
 
 	stmmac_vlan_restore(priv);
 
+	/* Restore the installed schedule before starting DMA. */
+	stmmac_start_all_dma(priv);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;
@@ -4224,6 +4233,7 @@ static int __stmmac_open(struct net_device *dev,
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+est_error:
 	stmmac_release_ptp(priv);
 ptp_error:
 	stmmac_stop_all_dma(priv);
@@ -8420,6 +8430,10 @@ int stmmac_resume(struct device *dev)
 	}
 
 init_coalesce:
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto error_stop_dma;
+
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
@@ -8427,6 +8441,9 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_vlan_restore(priv);
 
+	/* Restore the installed schedule before starting DMA. */
+	stmmac_start_all_dma(priv);
+
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
 

-- 
2.53.0


