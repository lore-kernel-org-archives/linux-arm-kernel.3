Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F72C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=548WZn/S4K7x40OmmUSfPZLeG/CfUSGzx/rlh6jbEuY=; b=Y3JoCwenNIfT4wwIdU6ySFUOo5
	OAk0TB88p4vkmvaHU2LE0S96eLoUBIJpBqcn3XEuYNemV6YgRmWNXwTAZR+qskh41yAeLAGrepnKs
	byd63cbTUzv0RHkavbowQWyTZVJ6aWKJF05KEUyJnA2X7qF+qgRKgC5jeIjUUYQqhuM/pJDpyC6cm
	GfCeDd2ay9heRsPQqaREK+euYtnJR7s4LLlWzcODkktOdf7z1iBNi5XJkDvhjGOZMEpfzOEMdg+1k
	A+nyc48MNudJ9V+WeEhXF6R4qAKEFsu+ansnmjJhR9m6U991Tqw9+s2SYRDDxFm7XgNqgyX3xRcJp
	1Y+DCXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkd4-0000000607R-3ol3;
	Sat, 10 May 2025 13:52:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkZ1-00000005zlH-10na
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 13:48:28 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-73972a54919so3068182b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 06:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746884906; x=1747489706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=548WZn/S4K7x40OmmUSfPZLeG/CfUSGzx/rlh6jbEuY=;
        b=FrLtpyYlMy5wuEKdNeJartNEjwatuOia44ZUnZt1z6QC96B3eJea2UBlOLIubT+cCc
         NjceWMAJFIT7nzA92ppzZQbh/uMfUEw7cC2DDc5f1J0EwdRCJQJAQnhhOVqvS1fMi0CU
         p4Le8NUhae0xVwT8hz58OhlCSc8zecdGdC9rg2PThMAAKmLGr/jKJyKKjCBUPmVAeav9
         MM68tGv2FLwcHB0veuWYZ107r2P5P65CEjcY14yDKNvqnZhh4gP01iHTuwVGUUwLmJMr
         dubdNbNBhHDwM/JugrCJ8PdkuzA7et8FsvQSop+NGGDtknlSgZ8MpMHyacZJVvkl/bot
         6IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746884906; x=1747489706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=548WZn/S4K7x40OmmUSfPZLeG/CfUSGzx/rlh6jbEuY=;
        b=e5U7+055Kim3XQ8yIxfWFcWP1s5v7TFhCMcttwqA19cvrFbs85ncgTGE4T888czM5W
         sic8BtZP5Ww5mEs02gtixlsp20V84J7pNkVeSGA4+3z1GBTzUtFle14qz11ay150tnYe
         sNsrOsFPxvIHsEEJNiyIUYkVzmMYZja+Q69sPSRTvRVkYiv/TkNSmxaTmBMeId7AWPzc
         vmZZy8+ct1q/INAz02hlAQvz0bqdfC0dQYg/xinq5j2VDHqzDv8cALJW5ja1JF+dwxrV
         NOQRArsXUwRZik9Z7u5fThRXYq/y+MUX4xXwDARaQqifM7NsDqgrLWHBCbFwjiW2O7Ov
         bB6g==
X-Gm-Message-State: AOJu0YyYSwbTeRAh/cztmVluvSYXYZGxW6RbeleBe1S1OmmxX9jHBOlb
	AO79q9mqJv4UcZ1tw2DDlz5F/WuQMGuFRtJw8GxDVXZDcOpf1Q6G
X-Gm-Gg: ASbGncs9wPhHs8MdjjQKz42kmEtzaKcYReYxuc52gxHnJDFB3DGPa1bhErhEBC5vB1R
	GsqPy7jT79D2Z67rGimb2OZ54myT/6kkU2DfMP/FD0jHr2f8Ej4iwqSa/Db57wAqZjB9TNkP1y+
	2zfN7eCeMeIEClNim5A2fJjdwYOxWwPSJ4Nga2Wjz3FD+Bs0UkhbHZZH9FI17Ohuz+sGz8EhbtK
	WY+EFgypX/BktxnBe+fLkZRQAzuoKqSqky06dpQzN6BB2oSeNVPpC26JhhCHcLfV2nQMzBzSFSW
	TFH/hWh76MYhRAHDmovc+QmRw4RXzrnGKmcqZptk6BSIcJ6V6v9kYwxOoeUDt3MoQ12jIZGG8EW
	c6NmIPnE7SAw2o3qr7s3Sjzii
X-Google-Smtp-Source: AGHT+IGe3B5B3RalliaBNkeqdqvGOp0m/hHLJIw4a+hcw50RwCHZe4bcxR3LB2IrWTuiOVsCyntcoQ==
X-Received: by 2002:a05:6a00:84e:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7423b3f138dmr9527488b3a.0.1746884906308;
        Sat, 10 May 2025 06:48:26 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([114.253.36.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773939fsm3360424b3a.62.2025.05.10.06.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 06:48:26 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: tariqt@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemdebruijn.kernel@gmail.com,
	irusskikh@marvell.com,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v2 1/3] net: atlantic: generate software timestamp just before the doorbell
Date: Sat, 10 May 2025 21:48:10 +0800
Message-Id: <20250510134812.48199-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250510134812.48199-1-kerneljasonxing@gmail.com>
References: <20250510134812.48199-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_064827_279767_0F5E5812 
X-CRM114-Status: GOOD (  11.57  )
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

Make sure the call of skb_tx_timestamp is as close as possible to the
doorbell.

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


