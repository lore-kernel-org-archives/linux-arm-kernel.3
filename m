Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC89CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 02:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLLDCAsceokNY+xwokpVffSC3XQbfRGpIBX8r0xpvd8=; b=OgiipTV98RTtj3Tlt21CFFurkr
	s1vGiMRyK/oPv4AHfYSXTmtWpC6HCg81UA+rvraszsZl4SaIhAFCm5ggwq73RkOAhibTNHSIMKeeT
	0Guv1MkPhZ4BplGaF1CAJRwsmTAS1vSIcF7FGydCCFtclKeowr44mjoPDtzggQHHcgi6xaam4gkDE
	2MK7qJDoXaFvTacsd4e6nKe1rtFWHAAlz4dCNrV20l8yN7ZQOhaJ90eHij0tkm4Q8ugp7wNc/RHPk
	9XXVbn05pR6wCBRH4w4Y1XbjhHj/t9bN+Abt5+ita/ppfTKwlZd3kU/bjtOhZFlez3IJpGVCZeGuF
	4UV4nW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdsP-00000003OWO-22zW;
	Thu, 08 Oct 2026 02:28:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdsN-00000003OVQ-0tlB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 02:28:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e812e2b31bso755425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426534; x=1792031334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLLDCAsceokNY+xwokpVffSC3XQbfRGpIBX8r0xpvd8=;
        b=oPQh2U9rdLdZfyLaxQJKzGrGLmzMNx9zJam/5iaglIrkuPHdJPTdXc/hpq0Mxa9rbd
         FQcyE4DyJCBb4yEm2rqInXrb0B0YpWnvNVAD6m0BXybxhRbS3icHEP2iADLXf44N2fj5
         Enho3x1IV0BaWOjyI4uG7IWAoMu5i6RVBFCgD8a/1ceAhHAS6ZVjB7f2j+E328JNMtd1
         a5tO8kKachB9isHIUox7inGcFSH0oG9sO9DfUJzkoPHlvbxxPHlE1iakT9SuxmtdViJ5
         eNwTMhHbYZNTXNtnB4UCG9r2Km+jcVP5cDAwHfPS6upWSmtXJXJ96LcTbwMD+rEZdNdK
         hJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426534; x=1792031334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLLDCAsceokNY+xwokpVffSC3XQbfRGpIBX8r0xpvd8=;
        b=rTUWLcuaQCsABbltU1DLBkkaGai1EnsQ5GWLb7OIEtX5HUYABhcSEYuev10R14UgGR
         qOOl36D0CSxCxyE+QFuHenw65Qb4eyiD8d4dJBC3b7KiRf9UMmOuQI/k7T6dPGOtCFtt
         /kN/98ZvFhSbUASxOh9lL3d6t3gNN3rl1D9Q6jKk52hYuV/x37Iti0/vEgqeVuCdbvb3
         Bq3gYYN0CsTAriOKjnnmIus9IeDXSv6yCN4gN+zUfXyjWMs6qBEW1UBLEA/n/anVOZ5X
         wYnLZ2RtziaTCyKMeVQh9OLVTKAfeRCs6USnw3icD+d8UmBbPHiA3IuPEBQEF0mhJsb2
         Mprg==
X-Forwarded-Encrypted: i=1; AKwUvBwQERziuePshiHzSCGSdC434diSA8BQ8FU7Jkoy2o86AqS+jrfpOBfuYgbBVcTwRZ2gPB9U2/LIb8w87IVTerDR@lists.infradead.org
X-Gm-Message-State: AFq9FYJWq+BixbUa9PeK6Mi0158sxVNsSCJxC8gpKYBz9a2hS+6qNSaA
	pKQx27tk/JgKxpANubotRufqMEbmM/r/t+0M6hZsRocMh9eqXP5JRp98
X-Gm-Gg: AYBFou3HLqVIhJ3Ixy2ste2HIaDkP8t4I/yEfceDFpJN8+DWVtRQx5t/E8W63vOFR7R
	6i7DzRF/TyHkDyNQFyAq5GnyUrknOyAuCXTuwwDDuWRhYBVOonz0zuewQ0J+fY1v7ejjuXElj/c
	WXW1GVLUnpPWYKH5f+wl3Kg5/hkAJ62fWszE1z08QeeIBtL00nTAURemXc39YOeYpnftivjF0oy
	MpqghL9NX0SHFiKQ2linGccEzs4XCF/qpasJMYeg+T9aJBqZtnUbEI101b4r1Sj+zBRMgwChtyF
	WpUWWDhXVoseqGpJPQLkTbW9YKwP3MBeYXlsu6POaaOKl/7vBIUSeuWHnh8bHtNX+WfLfxBpN9j
	BSlZy1V9Jc8ysLXvdJfwGswgkdzvHU+WSG7YWsTss+wVDSriyfigR/t0DrCdmQWEnycdMYimX++
	VQgNvFnEUcCYcN6676UomPVZaNzbmyGGpmnkqqAULqL8aU6+sDCfQOgUkoEbk8PFgHkkt0dbFBk
	h8R0FKDL6Buip+ZW87dBiQQnQ==
X-Received: by 2002:a17:903:2b0e:b0:2e8:1361:e50c with SMTP id d9443c01a7336-2e81361e68bmr3508025ad.4.1791426534123;
        Wed, 07 Oct 2026 19:28:54 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:53 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 03/10] net: ethernet: actions: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:45 +0800
Message-ID: <20261008022656.3592191-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_192855_249900_CE17D82B 
X-CRM114-Status: GOOD (  13.80  )
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

owl_emac_probe() calls owl_emac_phy_init(), which connects the PHY,
before netdev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/actions/owl-emac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 0a08da799255..2538275a1e57 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1552,6 +1552,8 @@ static int owl_emac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	netdev->netdev_ops = &owl_emac_netdev_ops;
+
 	ret = owl_emac_phy_init(netdev);
 	if (ret) {
 		dev_err(dev, "failed to initialize PHY\n");
@@ -1563,7 +1565,6 @@ static int owl_emac_probe(struct platform_device *pdev)
 	netdev->min_mtu = OWL_EMAC_MTU_MIN;
 	netdev->max_mtu = OWL_EMAC_MTU_MAX;
 	netdev->watchdog_timeo = OWL_EMAC_TX_TIMEOUT;
-	netdev->netdev_ops = &owl_emac_netdev_ops;
 	netdev->ethtool_ops = &owl_emac_ethtool_ops;
 	netif_napi_add(netdev, &priv->napi, owl_emac_poll);
 
-- 
2.53.0


