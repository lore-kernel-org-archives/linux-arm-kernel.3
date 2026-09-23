Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC875C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p89oVBps4S+T5LODrobO031ycfpG6AMkiYxzsZO2208=; b=a111BeFvGhEHbOZopGWVJGcNjO
	44bqY5nbP13LiwGKRgWYPvZlTDldjx7SGqSM7Fa2naR71tz76tSwudnxTEfS+Gn0L75lYWnQ3Q80N
	SMCb0wRAzMzUna2RuM2XqZH81CYu+llt7oz23BJ5EVXaXIvdtqbaIduhb0/LhCINjq1sRW0GGvQGK
	GJojW5HMRqfHwP2xxfZqpitATmHwVNTM7cW8jK+CnrDD+2UnG4klQYisWEevZ0je3wq3VKJIdaETV
	QzRGaEYqUCwFPNywxChX5i4kE2vlXKgwGsXLcy9RJE5VzBPTFGtN4n/uruCP6KYZaJuOlCr6XF+Cz
	S5S80K2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GoI-00000007KGM-0bCF;
	Wed, 23 Sep 2026 06:50:30 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GoE-00000007KEm-3PLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:50:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so2660415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790146225; x=1790751025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p89oVBps4S+T5LODrobO031ycfpG6AMkiYxzsZO2208=;
        b=KuNRIlJQvgD7vx78rISh1E/dFn+xzmGaZ3Q5z5c7ZI2MfqtuxprTukinu+Pwe9Zd0F
         LuVThG4UJYR4SL/EZSwjPuqz1+orM7+w/Q+OaVDGrrq7ZiG7uCYQgMB2fgkmPX2IsnQ3
         WSSms4r1zvDgVsHNmK+figEXLI+IjQbiAvLrsS+MimcJ+puipGBGJZ9oAaWUFF+u0/dJ
         7ohNjGzNSXbm6YEb+9J3N3oW7LERSI735MVfid3p2oQXQlsXVQjv4zhOF5cF7P2hm3ON
         m/+vRGZQoqLql6PNPXLml98G9PO96f7XOBNED0Y9U5UsOb6rBvi2HJUjb4smFyaDG1Kk
         1Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146225; x=1790751025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p89oVBps4S+T5LODrobO031ycfpG6AMkiYxzsZO2208=;
        b=AmD1pxuye8XM9CQpmwRW8hQGNa5atb2Vx+MQwxboaI0FqfwlXkbw79jUgevZ29GsJT
         OBPNQ5tN+hK2u0fLcGqL+9oyaU+YvpNxMeanL78PwAUUyLBeKZLFM730BZm+kE3eMOr/
         6DqLJRcGt9NX6iSJB4qVl6JdJ9L6FvwThdMuFo/4l7V/xpIIVc1pmYfBuzU8sM9aTBV1
         DzXiCl47Z69c6TOHpqn7DydDnfTzGq1zK8W0doJ7n86S5MJigwOa8RUEaY1c6AOvAmLs
         /xXYZ1QnmZufE2TXQaLsBaUnqBVG4S+g3qzgmlc0ZJc2adyNE5mX2zZzRYEwtXdin7Z6
         uwqw==
X-Forwarded-Encrypted: i=1; AKwUvBx5ObUNpX5HBGawfc/DUENToG2XIh25Dy7Luo8rUGawHpW0jE3jZqPJluTTNRo2VrYxJ4ktI7oVtK/TBJW9F+Q5@lists.infradead.org
X-Gm-Message-State: AFuF++lO0kcdc6fnnTP6xgpry0406mu/D4IiFIiJGwZoyk0yaOKqAJLj
	Hfvy7XFhS41iaWNEE2SRv5UWc6MWyJeqRw4Djwmw4CpMxUnQGB1V6WkN
X-Gm-Gg: AYBFou29FSV51vYH6CWuO5nbjBjIu2fCKDTvehH94sQtLrwGAJ6LS9lOtUHXp9YHWjQ
	4JoKY5tuAm9vTbWrH9gIerMWgkeyduK6YH8d8fftS9rRQvedmGNr5SqPhYVPuTn0c8WQUJOSDqd
	AvprBNDp5eUYWRUdh/L5jBqBn2xQWsPSKaIMaraqjTrONqiNhcjdSnhWmO2aD3f3J6B2R7RHnxg
	Ed7qZyfoRxH51+yvBMh3ZIO8lQniStKgzxZTJbI5gJXLOzPhVcXn1kP8BBuII1oXOzyGJSoLY02
	hMAleBxJbSk8+bDGWXv3BT0mkoxCUl0Vm1HPc4E3IXJHLJDtlkwHhnKVrI4wZeNIP4ayl7rKUrv
	HvYlqueeaw7DGNuytyVrYTzk3jHxdw1+/NbyiE6p14L/xbz8jox2oztF2V+A0V6UueKVli7fZFi
	WTUk9Ilfb/kQqrS3o+i0l+uz6dwOEvqYG2Ooir/OmqW9fDSt/ttQ8AlToLm3dUxbzBixj/JRLHr
	PE13E+1H+8bdV2XCaP3SJY8cL1IhHrDPBk0HAGORYk2mzZTLR7wauBfqLG8z0dHbEqiGIgCBA==
X-Received: by 2002:a05:600c:c48e:b0:49f:ce78:356a with SMTP id 5b1f17b1804b1-49fdeffdc94mr17172215e9.27.1790146224743;
        Tue, 22 Sep 2026 23:50:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde1e975asm57882535e9.14.2026.09.22.23.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:50:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brown Huang <brown.huang@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [RFC PATCH net v5] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Wed, 23 Sep 2026 08:50:14 +0200
Message-ID: <20260923065015.5999-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_235026_872835_642A9897 
X-CRM114-Status: GOOD (  19.38  )
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

From: Brown Huang <brown.huang@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

It's enough to try a second time for the TRTCM config to be actually
applied to make sure we are not in the middle of bucket handling as it does
operate on fixed time slot internally.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Brown Huang <brown.huang@airoha.com>
[ improve commit description, drop memory block, apply better loop logic]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v5:
- Drop memory block (not needed)
- Loop only 2 times
- Improve description
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memobry block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 21ac80bdd084..b164a78ddac9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3120,14 +3120,34 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	/*
+	 * HW might be in the middle of bucket handling and might
+	 * require an additional try to actually apply the new TRTCM
+	 * config.
+	 */
+	for (i = 0; i < TRTCM_CONFIG_RETRY_MAX; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 286f73e2e1e0..d270729e22ff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -184,6 +184,8 @@ enum trtcm_param {
 #define TRTCM_TOKEN_RATE_MASK			GENMASK(23, 6)
 #define TRTCM_TOKEN_RATE_FRACTION_MASK		GENMASK(5, 0)
 
+#define TRTCM_CONFIG_RETRY_MAX			2
+
 enum airoha_dma_map_type {
 	AIROHA_DMA_UNMAPPED,
 	AIROHA_DMA_MAP_SINGLE,
-- 
2.55.0


