Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75852C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnqWMDDLX0zek73pfxqndK/i6Uy2ZObuxOwIQcQSRF8=; b=4UZ4TIpwdZKzQwuPKsRfmJkhqb
	P3siPiBnlsObBEZCs+JYY/UJliPIdR8j6YQpweXuuf5DSCnIOrYFxtXK/pFRzJ0/KKdXSGLlM+Ie8
	6XH/YVaPOMIrwrgYLpsmI6VGA9IRc31Uj2CX6j6sQUjFeDe/xF2Upl6WjJlWeL8OFL5IKfnKTnvJ8
	wps60Q6L/HAiDCllbJFBqLYmDIX4b/fgv8eY9osj07AsgsLqXGmlFfPQpuUiHnbh1HUcHvVGQiLs+
	8yHXF3bCLWuHzYM5i1cV1hDWDBmeVxoQoTVDazwFSq4iJ1jHdTE8FuKQsTnmWSR+nVelMJH45qlAe
	2UNlRolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsAq-0000000HEqM-3lxQ;
	Thu, 08 May 2025 03:43:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs1M-0000000HE0X-3QMH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:34:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22fa47f295aso1207745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675244; x=1747280044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnqWMDDLX0zek73pfxqndK/i6Uy2ZObuxOwIQcQSRF8=;
        b=gdDyagPyjOvLkpwyNPaN2zz1RrcmqFhjRbs25FHI8Ep4DLBFqi97XFaPebI9Hl0dFv
         tiMH1/VBDu3DTSfRPfP2OUPMhCttsnognPMgja7AyM4AMPXE3j7872OB2TUiZwLpVlaC
         DlUj5Bpk3VTszLyhRGYsb7ZmyrA9p8uhnQvcmxien7T1/MhZuwpJxKe29RAXOoMQsLV+
         b/c6fr6jvI3CbGMyyjT341iQx8cYTwgfQwJJPB25g2XnrPoBvwLRzTo6BN+xKgGJp7WO
         /y54A2zYtel5fDZ2VPSIzH3L6lKTJMWxrkMH/xwqJdlT4TI+sgxY56ekJRqnzf2ZLDpr
         s/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675244; x=1747280044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnqWMDDLX0zek73pfxqndK/i6Uy2ZObuxOwIQcQSRF8=;
        b=vaMlB5plMsDm8HyTNT55fTm3E6jvXsWW4HkzRFDoIXs0jP5SESnEO1oGRlTpauC7Yp
         HFLuy+xyWejz2HB6roN5Vp+19xNkNo1kfCKNYxcFHZPtcx5N8H3B6kuJ0DoFZSMTyErp
         9VFh0BP/fPg5ZfpXscgND97lN+KginZbYyv26RI+AO1cWRlSsbv3mPs1822sutTi1npD
         VKlL3h12i/V9YCh+1lXbBsaun0K7EyWeApYEG9jSonFQA9Wdc/T4akp2xjPqj68SfN/8
         y7Z7EtaRYzFE2gRpiAW5W0u0nzHzevylk16TLyBgSbiPXirav6XKEn0jjTEN9x6OmDKo
         4EOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXRbJIX78uXHmhAPhd2cvn2w1eV+HQCUCqDn8n2qG7MIIH5g1krifjVhjPFU0td4pdG000tfDepDWGxEfoxLEh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0yPSMfQUFCpLTlqAbPKJ+g5YFfOhctXmft3pbaGWIsKVGqC6M
	g++8fWCQpchHP7AsfJdhHfzmZXIdYwuCEZSoYRV5L8E5zM6ya81g
X-Gm-Gg: ASbGncsJVn2ppHNvzFqYdBqnFzNI716xiJkZLntyMjhNLhJ53QNe7ueu4f28AQ3QDHv
	/MdLUkJwJlNsltn9lgHVGFpUsbZODqxuR43roiOp1hXHYa7lRi34/XyPh5yXbJgrd2AWvgnaG+R
	55qFj+kxb6S0uCfG/nHX6x9BsNv0Kt6B1p8eSbAtyvYJP7TwPF4yooeGUP7jOlTW0RfYWYK7c4h
	tnnT0L9ON4L0Uudby36tn+U4k7YtHGZIo61T00IAz4JLfYfgyGaq17AJuaIAVQ2XHUyw53zPG6M
	a19VhDWWoJtCK1X+I3kwxRg5PPB66ACArhm+BX5IhiFwtcZ0Sh2sYjT+LAvU/tLHOvD4k8PRBSU
	xAcLXiH8lWutg
X-Google-Smtp-Source: AGHT+IHYy+mhyOHuKt40kiRvSHcNeUMG5kIZxit9o8bCQPyY6xTpD5PZVHoUSN9mxt07Kxvd/al06g==
X-Received: by 2002:a17:903:252:b0:224:1001:6787 with SMTP id d9443c01a7336-22e8560cf2bmr29009925ad.4.1746675243855;
        Wed, 07 May 2025 20:34:03 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:34:03 -0700 (PDT)
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
Subject: [PATCH net-next v1 4/4] net: lan966x: generate software timestamp just before the doorbell
Date: Thu,  8 May 2025 11:33:28 +0800
Message-Id: <20250508033328.12507-5-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_203404_854126_F5C7921A 
X-CRM114-Status: GOOD (  11.00  )
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
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 502670718104..e030f23e5145 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
 		}
 	}
 
-	skb_tx_timestamp(skb);
 	skb_push(skb, IFH_LEN_BYTES);
 	memcpy(skb->data, ifh, IFH_LEN_BYTES);
 	skb_put(skb, 4);
@@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
 		next_dcb_buf->ptp = true;
 
 	/* Start the transmission */
+	skb_tx_timestamp(skb);
 	lan966x_fdma_tx_start(tx);
 
 	return NETDEV_TX_OK;
-- 
2.43.5


