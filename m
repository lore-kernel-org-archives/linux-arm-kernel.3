Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F02C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGvbCVQtorwpWG15UFM2tqk4BSvFGG2eWntXtTW2Lrg=; b=VUxk56Boyb/fMJQaejvKOWdKjV
	Vi6LGM+frV1244Yg97Ck/FrZfj7P6YDu8RPmx2NJwKw/JmBe1hUVniotZ8W+vI3DxSDXRAM6M1OVd
	u5nIOkqAmRyA0jVD+fmnQRAFrdtnl9NtGrUBiwq2IuVhxOqgn40rX6tR16bKGNKW2Ja+dSNVTBBgB
	5dkDuWz0ntqz3RBTMrdxmqAsiCetZsHIuL1KozB0xC7Enf2Bag/gGfB3hxocUoXPhB3XSAKe6uMNC
	fyaMflWZMuCqc5H+tp1c4FuljxbX9wkgYt/z1/DmIGI2dCghLmlpm88oKwqO4nvLBtOfF79WFaljR
	qLisM3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs50-0000000HEQZ-3Lc9;
	Thu, 08 May 2025 03:37:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs19-0000000HDwp-2bkx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:33:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22c33677183so5896895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675231; x=1747280031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGvbCVQtorwpWG15UFM2tqk4BSvFGG2eWntXtTW2Lrg=;
        b=Ahr8+vdJ/7ehA2L/AOWw5cxwoBGib7WEIwY4HbVBHXS2QpcdKdewRrLVQwrdCdpWp9
         nGGNUW+mze5cLlVgHVMqKW/F5yZF6Na3lnxU8kTyx9NGTH5GcHvBsVzmllbcmH7uikH6
         hsIBwrSxH8vDQ0JAoQjLC2NHeN3sz9vgT0/KThJFBRVtQGbHYH4J7/4V3gknp5jO/9Fw
         gabFBVKxx1Adc9e+j7LmtZ3v/xYMTtxA+rACm2HutY+hQpahHDwlKB2uuv1EF/LsZ0dP
         eGYWbnwAQ4VRuVs78tyisdD59U0SHQNbnNXtZpD/WIuIosgoA/kcEA43sT/OMcPpQvVk
         y6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675231; x=1747280031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGvbCVQtorwpWG15UFM2tqk4BSvFGG2eWntXtTW2Lrg=;
        b=cN0oKFHPZlFQ+tqpTmMY5go4vadxL1DJ8JwZMAKoT+5PR6SGC6F23lqEzJ1lSbPzF/
         4KFOPihjMq5K25MNMrsCp/SS57C/qEgh64UcHymI6k1+qMuDCka3Y3RcMQaE/yhF47lo
         HnzV0cxlPsAaSpGhRQZo5JsaQB44m2ClaWANz8ocXZkVrXFcHx+cc986KSltnz8+b4ze
         abbXh1koBQ7nVrN7VI88IraGbKMjRsqbUwdg1j7XsTwYXyKNoIKe1f8/RySd9lqaKJvq
         x9Uhc9nm7AkMTJPtiVx1T/ARcrv37TpHhVqddzF5m8uq3FTJAJncJj6IYbyRWgHCN9qk
         jByQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5yb67mHUOiiAlzlzYiCDOYkSQPlp3+MG9ICfKvh6olm1nLKBx6mneYQ42KbnoC9ZIMvnLU3edIpW8aN1/rzdD@lists.infradead.org
X-Gm-Message-State: AOJu0YxAT74I4PTiosL4qn/4Bnja0e9NP38sQe7wTLxpT8gXCDvxvvEP
	fUoZyBBR9TjT9oI6+Pti0W/BQX92utoA12NzpLqQrYU682+1kbyY
X-Gm-Gg: ASbGncu0zoywyoK6zGf37w3S9IB3iojEoHGzJ/IQetowL9jkU7jh0QWhEAsSLZaYvw6
	QWWdfb4v6z3oZFqJLWZVs0i9q03DjZPJhqMwnjOPKX4bOjhActdHhwypwp+HiTX8x82OuJV77GL
	NeEJPrp+zu4M/YI3bZO7WZv3LQd7cDvk09NwP40hYoOUZXVRWpHtS6rscjgFR38Eax6HXkVtBUn
	fMcq3CSpbnIZ04gCP4MKh3DMw0divPoio3lbWKXuhl9N5p+R8W7z8yu8ePK3Tjp4BgkWqbSdarJ
	/7vZmWJmDydXmX05eXkjBS9hx66s3jGkC9/Dv0A0gtdsKugCIRyJZUBLWZNGfku6bK46Ntmidx0
	SSPU0gwZYe0HHHCleZx57y6k=
X-Google-Smtp-Source: AGHT+IGM1d3vMyoJVzz7bHiOOLFntriOtcga4Tmp07QYCN7v6+1I5ai0Z52Kyi4KuEEHu9Zu2ZDSHg==
X-Received: by 2002:a17:902:ca89:b0:22e:7971:4d30 with SMTP id d9443c01a7336-22e79714f4bmr32012585ad.39.1746675230673;
        Wed, 07 May 2025 20:33:50 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:33:50 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com,
	andrew+netdev@lunn.ch,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sgoutham@marvell.com,
	willemb@google.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v1 1/4] net: atlantic: generate software timestamp just before the doorbell
Date: Thu,  8 May 2025 11:33:25 +0800
Message-Id: <20250508033328.12507-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_203351_659667_6E336875 
X-CRM114-Status: GOOD (  11.36  )
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

From: Jason Xing <kernelxing@tencent.com>

Make sure the call of skb_tx_timestamp as close to the doorbell.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_main.c | 1 -
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_main.c b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
index c1d1673c5749..b565189e5913 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_main.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
@@ -123,7 +123,6 @@ static netdev_tx_t aq_ndev_start_xmit(struct sk_buff *skb, struct net_device *nd
 	}
 #endif
 
-	skb_tx_timestamp(skb);
 	return aq_nic_xmit(aq_nic, skb);
 }
 
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index bf3aa46887a1..e71cd10e4e1f 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -898,6 +898,8 @@ int aq_nic_xmit(struct aq_nic_s *self, struct sk_buff *skb)
 
 	frags = aq_nic_map_skb(self, skb, ring);
 
+	skb_tx_timestamp(skb);
+
 	if (likely(frags)) {
 		err = self->aq_hw_ops->hw_ring_tx_xmit(self->aq_hw,
 						       ring, frags);
-- 
2.43.5


