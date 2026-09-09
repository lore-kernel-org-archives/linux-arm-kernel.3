Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC84C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu0O0pJmWewYzRf0DSsVxXq14cBDmhqpv1Ta+hWpqN4=; b=Kt5tOXKAdngz+6fKgLezE/kUS7
	k3mWP8ETTjNpoNcN+6QJcYPWQ7NObLwHLhHfVlgsHvUEGZYO5FY1mIHY7+oVuCmTaCG3w+22vvXX0
	LlgF0or1a79fT77QpTLjwkIy40ulYfAgOpdhpOjNHrLHXGlVVPMUh8NW2KtHYlC3C69lcHYdmUtzV
	H0kt5yHPXUZEaDOGURlMBXBrDar3NNfayRUbDsXo8sjnym7T2CduGZO+xhCk4tdnXbXcxfZVUqs0b
	9HiY3vlYV/q/Jsv6d4MIijnmV6don18EaQdzRFB2/Go/gU6YPzeUcZqHJbLgO91BFZZxhcPn4JDJ2
	Tjppn15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AL6-0000000AlyP-0VMe;
	Wed, 09 Sep 2026 04:55:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AL2-0000000Alxg-33rd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:55:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d5cad1a6baso50864795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929712; x=1789534512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu0O0pJmWewYzRf0DSsVxXq14cBDmhqpv1Ta+hWpqN4=;
        b=NzFZCCakPyKAaS1ZNUhF2oQBvHTJ/WoBpOqoseCBGQZTxfvw2T15ARIMv5vPmjtije
         V4YTF96SDLGnwkk8/sB55JzW9NNYF0ZIqKYTegONf5mq+sswxXq+DJ30EfaRgP2w/bnr
         Ju6bCLeGgy6vLKiH3atv9+D0I4q+wpftpkaXF4X1kXNX3GJUaTHWUC3UbxB8Oqr+fbau
         ZF7H3jXzyDSnPq389EuNE6wXhdMbO8CXXwoX2WqD+CEaxSWsbUrKCkawW3ZyMMxYNKVc
         N7bShPSFBos1T+kmNTtp572miTBwvHKM/udyaUscTAr2bCJ+iQ+N38IeBFy/KB3hulEc
         4JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929712; x=1789534512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu0O0pJmWewYzRf0DSsVxXq14cBDmhqpv1Ta+hWpqN4=;
        b=Tpaysti0xHwVUJYbOYga95RRkR1sWJrcworQ9+CmNbIqGajt2A1/2yC6zun2HBCZc9
         GwV7fMyMOAKW9q91bFixFiMufShqfkLgUiYqrow3gAINnUShUDArvYnO09MWxk+qXhYu
         WJRa114h5iuT1jtOxqEbO+2cuFx9vkQQ+sJ0Jqq7awd8DvpxoJBFAFauB5Y7QuSgphiE
         t5S4J8xUDEBgKxOwdj72HLWwGww895nwBCfUh+pdptwGaOFkQ5hcj+NhQ5Qr6cIH3x3l
         BASN3sBHew/Cv4eVXaVRumBnsEC/OGy7FeeZoZynRKNahoBiAI5sln8uJP5yWssAxlwB
         wxnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi/ROg+30vn268BdqZr/3RMjjEjrQ44P62yguITEvR/1qKM1dC2uHt1IWbGucB867wYurckVPC2SbSdpm8oAPV@lists.infradead.org
X-Gm-Message-State: AFuF++nU++H3hw/P+PNTq4IoaOabSo10A5X5QNA6sOdMOS46yEtxUcHH
	GHDO8mg879o25PwHH2NpBu0zhySs3KaQNKJpcOs6h3dBXbgsI9/OuDON
X-Gm-Gg: AYBFou1/xWxQ6bRyOrWp35UTAZfHttbnyC3yQZCezLdjYOy4MrxKe0oiwPd6PyApHep
	Sq80yQUG9dCM5cUm4ZCDih6dr9RnMS9yKrap4b7/gbGHUaqWJAUJ9GbGz5RX+nvEmeQvmnIjjcp
	UVPLWb9mRqM7XkEWQBYwMrFMnftFS3gcI9vfmPscsCERE2wiN63P75h/hR1VZVLfm1FGODnPyfj
	N3dq/3wJhFa9ChqjaYAfk9CxbHC1+r78bo9wyl+/t4K6ZihAKFs9Ft0ar4I+VhEa3hCE9K/HWGW
	MyjQxL9o/l90ipBoiOgBcFmOLz3VANRwABbqAvJYkp+8axoSX0CJkWNYkPslKdR2TyId4Nl7wjF
	5xlV9GKiRuh8jyoiwyOvIV05leYvP2yBe2/ZW0rkmDiH9jV+FoZ+tJKXd0/qp55czD/LWBs4TM5
	qnrl6ym/Qc4/+KXqEN6byWGp/osaDAG/aF04OHR2VHRwS3PzBVEj4ckiTFnnNF4RbfNxSV1xiN1
	jl7kEnLogNONrojxB0Gd5kTeY11kee4M7gYd6hDU22WWdmq6nUasxgx/akt2Dnt58viUB/gX1zh
	Nv79NM+IIn9vRaI=
X-Received: by 2002:a17:902:ebc5:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2db1231f623mr518417745ad.5.1788929711582;
        Tue, 08 Sep 2026 21:55:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:11 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Wed,  9 Sep 2026 11:54:48 +0700
Message-ID: <20260909045450.16176-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_215512_797234_216185F0 
X-CRM114-Status: GOOD (  13.95  )
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

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..207aecb5f8b9 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2975,6 +2975,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0


