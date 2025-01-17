Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D733AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 06:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6+Wm5CZdNlKmE1tVKo1ksQSIgVDbHTd1rV+5hkxZOM=; b=DAiN+0Ppu65F9ZE+Frm0SZHOLf
	edvg3iXFu/N7rKnZYsd7g5mSo6+/ommjb+e19+VPAXB2BtScxSRGSRx1Oclngr+XT0Kr5IeRLabW+
	Olo2wEcLe0ko0LDRCzaQ9Apt/gfOPJytNg0M0/U2rkAT4TMbW4HhJ4zn8fhsF00PF6FH/QyQV+cPZ
	TEKqH1olJU/nJqMcPshi4Nic9QOX3CA4a/qdDkx0dcNAMe7nsCph2aVWueVNHs2aqzPrOp5LDq/KG
	XiIM90gdcWuQnDHCxw52LeYzOIBoYNFoyXVA66VWar8+VNbuMdMIQ1LAh9NrO2HJpsvmcpavg5w/Z
	4xNjDBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfrf-0000000H7Rm-1oPo;
	Fri, 17 Jan 2025 06:29:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfqP-0000000H7Js-0gya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 06:28:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2165448243fso39527935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 22:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737095316; x=1737700116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6+Wm5CZdNlKmE1tVKo1ksQSIgVDbHTd1rV+5hkxZOM=;
        b=lUQeJqXvI2aF0lwpiVxEEhO2TdlnqnzlOrJHGzmm4zEbVqfApFxGceAamUrOXj+dKD
         GR13Q5b8qznKt7rrX3Owv4R+aod4yAhr9LRJtPm2IEVQ3B5VtEOKqVvFsoMxtn9PRuCh
         81a1+YVK4/SrLga3jS20cqJwPG+M/ksw6SQ5bDoQAqiUA/r58/xEijf0cBs3RFjrcxS/
         agOllW1imuP1NuCNKkp1IiALfDg7iIPIbpO9ZLdAXKyNLWW0kZxIXbX9OkOtRe55xU1n
         rG2aJQzpH/IO2JS6O9MUr4AtIim5krkHJ+H9d3VuxcW4KRYIhZ1FZfEYpUqQqKkGl/sZ
         py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737095316; x=1737700116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6+Wm5CZdNlKmE1tVKo1ksQSIgVDbHTd1rV+5hkxZOM=;
        b=pV1ObB50w+WybycxY4CeStKNUX+jtJN4onV3+QLkea6lxS6MGHbEW2rIJhiFcxJkEc
         OvnDDU/aK+06EoOHDcBCdWZFWn5xjBtNgz6Ad5eOtN9hiZ5jXGnV4tCTs/n4wBSkPhdo
         QMPoGfOcZLldfT7zKfYV6eM6EhsztVj2pUGV+gxAsvrP6ZkgT17b9rEgW75Ou9SY41CZ
         rbtpDbIp01UBCMH59a+x2xLWTCbOkDIziPfflnPidaSxmqj4z66Kcwli67kSUbmlpfFC
         x8e2S/lY99MY6HIFM6BvAkcP4+UATZpSMx6rPNGWkjYuXGP+ddkm7zHkW58ZVRchTFbI
         IUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRdIChcbVXROCke8bqNTKN2Iu3SqYtr24vUGJvMRyN0Ba6SOlV/aq73cYKjHqi/eybfoY7dJIof+AWDSULY6BP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/KLGicK8AeTj8gmhCIx2+mxVtDytMvsJkGUfzzpjDKFBWJ/Sz
	LYU0Dd4/lBD0f40XB6M12MwQo2b/vfseE6rgTfA5b9Vxw4jJWFBr
X-Gm-Gg: ASbGncvP3WlY6L1IGekVKiWk0MK7KF36zampi4CWA/8Gw0ltuBqlBOnzQ//fGaEBa5Q
	yUaHrCI4Vak5LBAEQxxWu0fwE+vQJjsqnwIYF0wGMZDM7URCrMvwXhvn6bZMoOafKPy16HBbowt
	H1TSp0txxmz9weRetgNm3P8nUOOvhFmJIigAsQ/7Hv1/tdsVcDmONVy2DT/1bEkxwQVPM9FLHqM
	ajbdInC0rEu7LG9eZtn2BJ1ZQT6j0902wJd82DNLMnHLNREWYQVkxFi24R6mr8PuD9Bug==
X-Google-Smtp-Source: AGHT+IHyjC1e6YwY9YHvuL+IbiKZAbT/cPRhYH50ITXRrN4vHsd3qn4TLfhYEAimdjDDwE5QqrH7dQ==
X-Received: by 2002:a05:6a20:8428:b0:1e1:9f57:eaaf with SMTP id adf61e73a8af0-1eb2144d54amr2419536637.6.1737095315722;
        Thu, 16 Jan 2025 22:28:35 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-a9be08a6186sm1018808a12.78.2025.01.16.22.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 22:28:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Drop redundant skb_mark_for_recycle() for SKB frags
Date: Fri, 17 Jan 2025 14:28:05 +0800
Message-Id: <20250117062805.192393-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_222837_202427_D3B3ACCD 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

After commit df542f669307 ("net: stmmac: Switch to zero-copy in
non-XDP RX path"), SKBs are always marked for recycle, it is redundant
to mark SKBs more than once when new frags are appended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d99ad77a8005..edbf8994455d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5644,9 +5644,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
 					priv->dma_conf.dma_buf_sz);
-
-			/* Data payload appended into SKB */
-			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		}
 
@@ -5656,9 +5653,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
 					priv->dma_conf.dma_buf_sz);
-
-			/* Data payload appended into SKB */
-			skb_mark_for_recycle(skb);
 			buf->sec_page = NULL;
 		}
 
-- 
2.34.1


