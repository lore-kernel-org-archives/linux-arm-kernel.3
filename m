Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420B0C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=; b=ZYP/RUFDDa8kDdH3K+bYTWQsFG
	fdkYGWj2t4yyK8lltX6BiYYqL4XQe3KBtrXT5nyTrd20AV1DxKZ/lLv8wdGFmkq+n72w9Vrsr5GYG
	VENn6pvlhHiH5UOWH9Cx7eLf+lw3361N/0uFji+/1HAwSzZNj3CDZUHDcob70IbA6lSS+VWwMWGOM
	0gFiBh6uWlQ+sLvO1JY0jXW6RmI6CWFIJNRxV42krsZoRQ36wDc96v/iiSI2FbmqOWUZYHzfaH2RK
	bLj3wR4CTF7VCFiVEjKDDvDw50DhPXYrUrIo+bV7G7772p+++GFK3ARtpChCfh2s4I5lBgyKbeuEO
	EocgrKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs7h-00000005bEl-1KOi;
	Mon, 17 Aug 2026 07:51:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs7e-00000005bE9-3dWR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:51:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso15275635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786953063; x=1787557863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=;
        b=laHDzsSrq40dRqeTMQZeopZxOyY5HvOsQ2JPnk0cZyMAOCRL/mfXQcep/U3SmcUV+g
         IoOwETgH43d3g6/sF/LAgoHD7/h+3wcfHtVVEegUB17IZbKqIBr06jHSGri4cfTrraWL
         33B1/V/QPFcUi1KZlxUYXDlcWD6IFaSjPAw/OH4oSpIRHg1ZhVW76C1FhCg7eMZ/y3Mf
         lPcp/5N14txq3mPXm2Kzs2ZWgzK4oka45yb4tFrvUGCDWWiegy+rWrYsd3XqoF8sBSOL
         lFjIXPYS9gWLNsg0LKF4xXRlUm0UujgUR1F/5Ki4mFA8I6uTmJP6L9bSK/o0yZDY2Qve
         LJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953063; x=1787557863;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDeFtTnxMBvDDeM+UXcBJoOG/+TlVBVJ2Mo0e9wRHls=;
        b=chCMrJFqOx3PNi0C35jgr6HxgBwrIjVyEGftdH/VPKiIlKveGjguBG+s1PU4PN7aDB
         XI4Daa3mrcKCqR0M8kSvIwceAD7qGWtuYwsNwvEAmZeazTm9E2klXjAOpvxlpfDU/3S9
         xtof3H9aeSmDptmPbTqx01cASbMrc2yI98GkJqZ7a3Hi6qHH7xKp6YOt4br7r+qQWIjG
         ndfhmioGEPfd79g+XeAnS1IRUb23sXAZQaX2dqyVCdrdh9VuU+PhKrvOZ+KgA1Bf+el0
         vuLoL1ILuCHmFa7Zd1EtMC7znNwk41qg21/9FP2S3cf2Yq4zq1lmC+FK9eg4/rY6HXb5
         fsAw==
X-Forwarded-Encrypted: i=1; AHgh+RpqpV76e5JT8MSkW9Otf20whZ85/8JfOijuyAeKcBhBIDaTkYsi8B2/KGWImNMKrSx6qbsZiRTMWy+1j52h4LbH@lists.infradead.org
X-Gm-Message-State: AOJu0YxrVw1ff61yH2EzNvz3xyl1LrllIwXTvE7/xSGMXd+dXhb8+o3a
	hJh5XwECpTsJVPgaluEZgpE4VmvIJyyeuaVFzm9HHr9ypQoxfEUiAt/M
X-Gm-Gg: AR+sD10xhzbjG1wRd9NH757s6zHvNS0gJqslYmOu0QlyYuZh96qS8j+SraKPOpnY8oB
	Mg/PonbDiJxxW2t6ejd+Uy7JSM+VdL0uI7zsOs38c24Mile/sjwKTLxQKEjZyR+tfwT/b0xy76c
	jaV5B1JxB5EmY1+tajWnQ4ZA+hl5NmNyothdT044bhS2YLsQEDncrg4oojwLdZEWCrObdtGaCxO
	cCZP0XUQBuVksgCijNpBYeUolb2jknC04M+W4D8aSvWCxKvbkpCwuGNaduJA4SWIeJ50H7FUtQg
	kwva8Vj1JavKLaQVFWQ9/5tRVfSLziry3wc2KksCtT2LbqMZ71XggN0805aR4pRJbUfuL2fZIJB
	uA/5/8jZpGY8vae2a670pkix1roa3tr55rm/9U1ob8KvjogIY0iisLnR5c+BMhD8+EKEv4UDIjR
	TV05p3KcYLuJ5BKrGPO6/BEEdRAqdrK6WmpUD2PB6brwXzbEozqxkgx6HgCypnWla0ZCiheL1uN
	VOoQTYBK65i7yfJJWpJ+A9NgSW5WPkqt9M1UeQw6ngNathjtgPhaxWJ
X-Received: by 2002:a05:600c:3114:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-49987971986mr331622695e9.10.1786953063033;
        Mon, 17 Aug 2026 00:51:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d11f073sm22486255e9.15.2026.08.17.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:51:02 -0700 (PDT)
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
Cc: =?UTF-8?q?Leto=20Liu=20=28=E5=88=98=E6=B6=9B=29?= <Leto.Liu@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net v4] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Mon, 17 Aug 2026 09:50:39 +0200
Message-ID: <20260817075044.17691-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_005106_913643_3CF7F6C7 
X-CRM114-Status: GOOD (  14.45  )
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

From: Leto Liu (刘涛) <Leto.Liu@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Leto Liu (刘涛) <Leto.Liu@airoha.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memory block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 29 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 79418e682f71..302f8c432055 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2712,14 +2712,31 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	for (i = 0; i < 100; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		wmb();
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+		wmb();
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
-- 
2.53.0


