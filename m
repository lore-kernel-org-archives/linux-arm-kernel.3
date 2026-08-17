Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B521C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gBThyHru0i4E+ZzvCsRvUjwLIOQSie4fEFNF+loR8Q=; b=KeR6iSj7iiNZVk0XjAB9As8rDi
	yleGBPbu0D56bzUfcdZzEecE/WULp6jplupic/fmAshYTf+lP6EReHa2QWJtj/LPeKMCrzjRYz9e0
	73bcpWHQw4O9KFmVEDXFgU5C24a6nZ7dGEk7Rz9n2I1KGTKOrM+Lx6KZZ40SNoYGjK2b85igUC5rs
	kIGs9Jll7kiVPJWW75t/+mxJEcHeomnF1vO801GB/d6a/wU7bdFdENGbsU0a4LlafMpYJTkzE+NHA
	BITVT2q6zozPnbkhdUKVR0gBaKlXd1xg8oPJwKKK7P4N92k8kFm2Q+JKbeQfprf+7Rq+DbGypls+R
	oJlJ0D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxe-00000005y4M-1kh5;
	Mon, 17 Aug 2026 10:52:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxc-00000005y40-1QcI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:52:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a652535dcso1846972b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963975; x=1787568775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gBThyHru0i4E+ZzvCsRvUjwLIOQSie4fEFNF+loR8Q=;
        b=Ssvtr4XsN6OWtRCqsZCP4UD9gp2SgkAjDvPTdUoxTsAdmN4d/rmPdM1z6wBhx0xpbo
         UFUEelIaIaGXju7kJb1sJvaYnn28F3gIZAGbgNS3ObhPczove0rj8GltRSXPTGShg1oP
         uLgeCTrlorxVnX/lAZW76+mMgjmiqK9/5hjAyAfuf0uNFxzV+zeTkxNHlXEN18sZdjmk
         93KK02eI7s0yugapLQWFjP1GZg2UOoHPo6tVbRUiYYQ1mXTYE3bZ+I32l95XNd71bUEx
         WOn0imbBFeqab9R/yfW1FTxwkRC4HFT0e7TF4FH9ocpe5xto26baQuOA07NWT5nulqcg
         GS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963975; x=1787568775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gBThyHru0i4E+ZzvCsRvUjwLIOQSie4fEFNF+loR8Q=;
        b=j7zJ47ayGO5doaefd7HoIbNpJ9Ncs1m9o8Xq2SHSIALus+dK3XCw0oHadMD7enIdr8
         CH64vmEhB69pLumXemURUwidM/XpXYGAmTHcHI9DkdPTGxocBoHf4KSiRhsT5GT+UjyK
         boFS91kdkKDtDZDUTm4UWEvDxcMzSpEX70wWDdEEPJjt+8CE3Gp3vSEeAuENq3wKMzEa
         e7hWa8qeIdMLl8+eRvRkr2vz2rZdRmUCBc3DdqZCrGgHcXkHAoHCeTmpql8pUNTzr6R6
         FsjeznW9Bu/hdz2drbaIHrDjc1TIjDPhJI1n354ukh6HjwgeHWBeiXl4nOupx1JVYby8
         2rKA==
X-Forwarded-Encrypted: i=1; AHgh+RpO/N26ejqxPSK04111cOBl8b4FkH/lFUboqo+CpcA5TBJ0jimsuc/Cp9TB1/7BNBv0tRuwNxQhFglFjVf9RpIN@lists.infradead.org
X-Gm-Message-State: AOJu0YziTOu9VMqNsrcIm2eEWVBFMQX3sTZQcvSacusxdGFJdqxDaQNO
	Dst9q6hTJSK2kL/y1UvTrw0PnDQpB70fCj2wcv46gN6AVMNANcWwuNVA
X-Gm-Gg: AR+sD128fBxiHT1DeI/X6m0yolTHL1cATgLYIqZn3WvtEpXHcLvZApjdPt5hqkmgFHt
	lwD/RZw8Sa7rL3o3VZnULKhhoBPgd8OZ5S72oYQV+mYB1+/PG6difzjTF5gbGGdpSoSOebuDJbJ
	El3rcpOcOyELoBxjhv/cSaELj374ql9Skb+xCmrX1YDcd/hojmxiTyEkG0fmfJ8FcYd2C8af38B
	6Qx025FC3mnrE0UwiwSDJ621Eg9TIpCNoP8rRbnDiaAbgDU/gwdvq4GfjoW5WV22PHD0BXhNA+E
	EgVY9fUQoc/YYQzcwIMoZUHzIabjgb7qr00Vfa+vxRyaNcMwjfVlyMvm5S4xmHOdbkmU++zAILa
	5oO35NcOoe08beH6xePdAei8s7rHNCakltAvo3xcqnLdyCP8IPy0JYnEBLxiz3bgk6yzPp92ijP
	pSW+G2wfBCxua4m4VL3J4DlRqjD1+/9/aGDVSsbyJSFRZ+gDY+tar8L/mSzJ9o0se5Fp5Z8sGlc
	K44jX0lbtX3/nflgdzaW5zbm6lXTPhTTJmwXGH6+iefj0kVA+2z09f/x4FnI0aMjOVPpW3tZLo5
	kPPe
X-Received: by 2002:a05:6a00:b91:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851b03a12ecmr2971688b3a.14.1786963975460;
        Mon, 17 Aug 2026 03:52:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401ec98sm354846b3a.6.2026.08.17.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:52:54 -0700 (PDT)
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
Subject: [PATCH v3 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Mon, 17 Aug 2026 17:52:39 +0700
Message-ID: <20260817105241.63345-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_035256_385343_981E741E 
X-CRM114-Status: GOOD (  12.50  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..f92951422b2e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2972,6 +2972,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0


