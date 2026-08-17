Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036EAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/B8tIPegnY1ix5z2/emLnUMnM5hsvaByPeUzupMv/Y=; b=XXRTWrma9GrZHMBOAv4kEH1NGC
	jPVBM4eHAdT0VV4B1h0fY6rfhmqaGiIEmX7S5CeCFVS23RJc1gBD0FOx/UyIHc1DBUBSgs9oTZnSI
	lN/aFRs3ZUJsEFQjMLz9RZI0tPhyV56CPKDMO1bYC8j1WrIo1VwwMl7IFWBuyQJlo5pOYH7ihbvZf
	8CCE2YBI5rz9+LpwTtoCcVOBP/VZurYPDfRhxJUj0DszC9mDRWE1v31p0KGx0m1Lpjy5kHygZUPw4
	n4AtZUg0uOzhhYU1Lp26LGZsEj2MJZbBrh1F3SxPTQ5Ygq9P5vI0bosnEWTXuxJhy197/fLkIo+/k
	rWbOrcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxj-00000005y5T-2AnX;
	Mon, 17 Aug 2026 10:53:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxh-00000005y4w-3eaW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:53:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3438513b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963981; x=1787568781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/B8tIPegnY1ix5z2/emLnUMnM5hsvaByPeUzupMv/Y=;
        b=ldFCT5ln1InrjZxKmk/jVejkwWzVJ7TmTq0D7ab6PyT1tx0o1UYaeIdrYVl3TRyEyg
         TJBNCZZEYlAc+fP031wAY8XK2Yd5sX6fd6NABNO/AOywNh6U7p5ejafD/X2TVeRyxk3A
         xAVETk/Up7QCP0NY5iXJHASjIvsBDr7KO+tpjJ/p4wAC8C/aqmK2jcp5u2MBXqjbPSK4
         Fr2fhTwo8lkoc0BCP3hhdwkio15X7G7zqA9MPsTx+wCPsFjhGA6w+vja/qIlLml7rhIH
         og8omJ9kTPosPUfisXEDWgrFuGfx4eb1A8Vrx7lQVGwOM2BHPnu3NYOd8il/7+IidkOy
         hpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963981; x=1787568781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/B8tIPegnY1ix5z2/emLnUMnM5hsvaByPeUzupMv/Y=;
        b=pmj98Rc3z5jVp0h3fhIKyER9AEwYPswRqphfXK3Pv67oDwDAg3PZU9cB8p0oPRJpbL
         hZ/J3ko3JTOOr/nqzOIV3WD8c+2Pu5n0BTnqXwpA83NJ9HIS355H/EvYwW0EfWRokosj
         Xo3WAUjfd+Z7D8SwdnZMIQhVqv6X+OYSo/GHUcvrSNubMRTfioteDILZEbzP/G/E5qdv
         en48GhLaOGBOSQS9SzKyMs+nkZQUkCWHgo6u3arsg6fKIw/janm8GeGj+SyiZb/jQ+1A
         8Ripy0q96VLy/gfrpjuTdj7YUCHtfLx2SnRWG7uNRLKNhoe/8cnOmC/of3UoXXSvFdXO
         PFlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRwUT2521XZIcacE+IzMFeD9jIvrfl17h2M2uVR18y9kZruNU5Nz3boA3nqA8Do2owz2Mafjlaj23WVxylA29r@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qPiFSpuTVJgkk8sg139GbG2jvD7nVB4nfny6RfJJRyd4qtuO
	W+S6AVasVnFnJVb7hGWXcEgNyiRDxHPlgWD5QqFINYXHnUcyQKCesXyr
X-Gm-Gg: AR+sD12qRM2fGPgMDebh5APxefCnI9ddM7JducptsK6vZbjkfnh8wXKmd2y8U4ds8LB
	7p09KUp4qoRRSaVYdC6LQQR0nm7fdkZQ2v1C8aMLbPWr2j9mtbD+ecMaBYBTBXtUPd7jjlc1VKh
	haKNwQgCOdmIFzwLlO30P+jJ1lLWOLO1xbEgG0zUrpUaFfgxoVY2w6tvjCZuWXuPFCAqdRu4DNo
	PUiR8X8P2994voUU4tjp6/IKm5U79ZNetwuakesUUup1Qmezb1a7t/c2Rjdv26vEK90KlLIRFN8
	2pJGSZ7bTcZuESUgmR/YGgh5kvMfKwWwak95HkFAm+2f6P68n4haniVael0DNwfH5pO+mIBIY5M
	Cm6Xwip7U6x+QmBOa3XijtL2OYgeOXs/iAyua12m6Hk8bqfwec9IcqKprCs0Je4WUFWZkkwNfyv
	9oqPTZ7rfL4Lk+ec818prDAyWT8AmfB9gPllgHE2ckioFbb3rJNOWFPb7uboyBi6xiXY5fxRsUT
	7c/KDiv6O8yeNSo5HyWgpF4jyXDrjKDo3HvFavkjzRZ0aSmw+KimEt8gvzcaVeLsHPkx8qUBz3g
	RwGPyTuswA==
X-Received: by 2002:a05:6a00:32c3:b0:848:5cf5:5040 with SMTP id d2e1a72fcca58-84fde1564c3mr23741397b3a.10.1786963980764;
        Mon, 17 Aug 2026 03:53:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401ec98sm354846b3a.6.2026.08.17.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:53:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Mon, 17 Aug 2026 17:52:40 +0700
Message-ID: <20260817105241.63345-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817105241.63345-1-phucduc.bui@gmail.com>
References: <20260817105241.63345-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_035301_937418_CFCCD51B 
X-CRM114-Status: GOOD (  14.29  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns
a non-zero interrupt number on success or a negative error number on
failure. Errors other than -ENXIO are handled before this check,
so -ENXIO is the only error value that can reach this point.

Check for a negative value instead of treating 0 as an undefined IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index f92951422b2e..50f88a38b6f6 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3049,7 +3049,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0


