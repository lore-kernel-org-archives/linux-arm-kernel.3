Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74846D74959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWr+UUbXH8lnMLmy8eSvjMvYSmy75x4Or0Lzgqe9VF0=; b=TKax95/LtEvm/1/Um5fvS5U5xy
	y3t6RqlQYDFE+PL7ZnaKb3oEB6y041EYEsfqKAUIoZDNrvrVdpCaZ4pRTlRJhc4O+fQB1GOzeuvd0
	6EayjTkathwe6ovTybLWAoQUrOq6ZHFS1ZwgpoDThBSFzrhWprrmoSfm1ftgPCfCwWURW3p/7wzrn
	mC8KkAc4wmHrhtX59JkTWccTQ3utndxyCUVzqXnDJ/nwLHvhDnD1pcHRKF46oAZiulXcnnnkNcoiT
	lG+2pBw7YLrWgihiW6u+Osh+cu85m4NvxE6oZjV2qV0mDFcF4z61BDfrF7WMxEEratiy8gKmCbc4H
	iFJJnwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UqR-00000003cpA-0fJj;
	Thu, 31 Oct 2024 13:04:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6US4-00000003YPR-3cQb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:39:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e983487a1so671415b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378340; x=1730983140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWr+UUbXH8lnMLmy8eSvjMvYSmy75x4Or0Lzgqe9VF0=;
        b=PdfUBpdShpyd2/am1SoIWqpx3ynqFRXR3d5j5SMifpq/+uwH3FDRnPsVOszyqBFL7k
         M6I68mIfo9nnRIDK1WyAZfCQQ+C78MxOrgDRskyMXzZzddy7L2RYEwW6FgaqW6FEkWcC
         SIhrrooUVUQtQ349pw1pVco9iJJ6D9S50Aru9s1wPHiUao8zVb2FxFeGfOYbGQP5jTjQ
         6SuGcOUm2Jz30mK22dVlzZYHvZ2uZTUIEdChYgGQ1+Xgt2Zt699a56oRTqILud/G0roA
         kt2X8kvPzPK2GMnUvsts2YnEpNnP19qOxKDHoLTOI9odDW5iOaNHQb6WFiDtu8Xck4xs
         /2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378340; x=1730983140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWr+UUbXH8lnMLmy8eSvjMvYSmy75x4Or0Lzgqe9VF0=;
        b=mOhQD6zRiFGwtb+SFdK8OWZBAHTJ76BorTvMCqlAtdD/WB91evX8ag+VaNTl7QyDqx
         ATXWddtZLiY+ciJ/GAb0OejBLVkGfCQqcBIseo0IH1q2ScblQSRneSNCSMolF4ihLIen
         zEumrzCFAaslGr5EMhxtr9yN+6to2UgsecKVkPFef4c+E4fKX2feWlBwnaRa79jo5GxN
         /JhHDfQk8L20U/SYm683CR+Dix1t0BnqjR2PvE55iBV4HoIgHOKeUi7HP/JXYm9fH8mQ
         fzP03ORvTYoTfFLA9VsvhbU9uXMQ1gJOvsb3Sg/Q1JLoJ1xDNcOHTQ9Wh4iQAW7UEzrD
         rVVg==
X-Forwarded-Encrypted: i=1; AJvYcCUreyhFbemyCvOU0PCCichat5Y1Ju4KbXPYav1seOOVeHuo60vCWWGsH+VsI7WaeVksROydau4xNT5JWSVq+eOT@lists.infradead.org
X-Gm-Message-State: AOJu0YzNFWFJWj9Gh/irex4NbFf0KO9kUddh1Stpd4870VV6QmBevKhq
	q/r9DGmDsD+vbNN8OGOHRGAbR4cftcxIHRAMHDn1Ld/+Y7sJ4UJWzBsabA==
X-Google-Smtp-Source: AGHT+IGBmQcF+qVYl01bmlNc+GnbWq0Wjs3/vOJvZ50iXD5Wd6bwcRVM5avpNRM6Y+vslybR47mm4w==
X-Received: by 2002:a05:6a20:c998:b0:1d9:857a:585c with SMTP id adf61e73a8af0-1db91d89bc3mr3170917637.19.1730378340154;
        Thu, 31 Oct 2024 05:39:00 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:38:59 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v7 5/8] net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
Date: Thu, 31 Oct 2024 20:37:59 +0800
Message-Id: <4c19d46ee5f6d4229e86eb6195295cf8916b4c09.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053900_925156_B2D9C302 
X-CRM114-Status: GOOD (  12.80  )
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

netdev_get_num_tc() is the right method, we should not access
net_device.num_tc directly.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index fe0877ef5f4f..f07972e47737 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -304,7 +304,7 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 {
 	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	u32 num_tc = ndev->num_tc;
+	int num_tc = netdev_get_num_tc(ndev);
 
 	if (!pclass)
 		goto update_mapping;
-- 
2.34.1


