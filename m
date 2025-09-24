Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69171CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpJzLeRv3JvJ6Rn4+qItSuKPl8oje1EaG6ybTvv5B8g=; b=jWBuAReI8l71nmnkyfFnbxH/io
	K5LKHy4jNWQJTxJYDt9ip3d7Z5av1FJVwjI0RfdVkKCfHV23PQF6jNVSzPEyGu1qMrsD+jfnPI4+j
	qk2cYnVtRIm/fyItwqNmiq/W4Wi7aipZN9GPaVZndSypt55bnsPJ0iWXwMFNJqIxeYXTCHK3zrBZb
	IqlcBqw9klnNyF92OT51wzwXx7soyQle5lVqr/l1QvlC3qCwcYXeVqzBUZP0hGOwyTHAJ8i/l/uU2
	PpThbBg7kSSK5tF0yyahlhdH0tScbGtcdVqfpM02xd5oDNtIdyt/eVK1WrhapyPnZIkIZsv2sDkqf
	PGy1IIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RK8-00000001BmF-30LJ;
	Wed, 24 Sep 2025 15:22:28 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RK6-00000001Bjl-1VPo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:22:27 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-8b0055cbd0fso396619739f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758727345; x=1759332145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpJzLeRv3JvJ6Rn4+qItSuKPl8oje1EaG6ybTvv5B8g=;
        b=AE6O6eQgp8uK0B66w61uJvBAHW0GYjqqENvD2gF8BQ3yV61Abf6phe7FBzmwxdeE1D
         jzPzbk99b8TdbVf6R+L0mq2YTpIs95+7j6KzoGmHrpEg2cs5z1s62Uyd1UmCbcKAg5nD
         1IQO65Si8o9YYeK8ZeLdKo4iKdGTAPw2K8Cug87YZ0Vjsv98lMu1zDWsd2k9aHfXpq3O
         sy4BZDCxZ+Q+nRMgVYMB+qR82APONtKxtXNLEtexMcDdBRRRcrUhjkNffo7Z1IBAROLN
         SDaLrm1zb976crG9zUUMdgrDUI/7REazTU1IgFwWB4wPGWetS/OqoNiKvFLV7dzXvwnF
         Z23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727345; x=1759332145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpJzLeRv3JvJ6Rn4+qItSuKPl8oje1EaG6ybTvv5B8g=;
        b=hV9XaGAROZMbGrnjURMyoUTcfGen+qEPrpj1WxxLn17ON/bg6XaAr1WMg1uJhchYGT
         ypsCKN54BrzX11CNHwjV5OFqFK3CH97revk9zn2VA5E2kXDoHTQKYIDsKUSJHdQGJryC
         asoVrxQIU1DUtCryEqPQ6NGv5TGFf4k8TirZRAHYgEgHiYQ0MXC7vhGVBXPv9pyi2ia8
         hUUNwTQMmRWiUmmau4Nsuc482WeINTm78J8BV9iScR+w0UW8SK1jAEK79NLefmypYSmR
         +dA95D2PpK6SAJY9EwgjddpPyHJ6XY0FUnTDQPOkmSTB02xh9F9HNsNkOnx0eNaBpSIR
         z5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWkXN+uXzXECnZ/ubeOov8xCH5sYz1FIO9FrIkUQRdONfJs1FRpmv59ZFEOPDJlbHJ6Wn2q2MJoWTh2KNDs/6lr@lists.infradead.org
X-Gm-Message-State: AOJu0YyTHll53p6766PVZTmfMGO39pKR+iJDby6bwQWJ/Q8aithQVjH1
	rgNpBqsxZbazci6EX4n20xceecAPhjWFsy8B9pLRWt7mvUV4MEL+MZya
X-Gm-Gg: ASbGnctAGmnKQKU7qilvu4DZRoiLvaP85x2cYGMUcRpWKU5oX0R29MmSNgERB7Dbs4S
	95iYBReAPU4NmizcBSjG0+MQGNaE8k3CHWk/1rOoAYGPu6L4frxa4s//S+uqVPmhl4SuAOj2JPi
	V5FVjQIBVN6opzri1c4VKXphrYF8p3oWbAHBL5q3/n5AuFLDqh/nTCnZwK0WMy1XzNyNwmVkYwQ
	pSlO+WYGni0ZFqCV/Nl56/dVssw9GOdTZruBIY7XSUA/KoZk0Hc+/4bZd0NUrpHueeg/mjWGnbB
	nrQqxMQOB+uTONFGML/0Ubq4gPHqzdHQUd7V+aKO3bCgDN0k6m8/Ndh70lqZrbaFCWNBa3p14cb
	t4W2jHmVDsZtE8Bm1mUG7xOzIgFA=
X-Google-Smtp-Source: AGHT+IGIwXjPAbpzXy2+r7fwj/06ZO4SrCKju2WlzvWmjdH68NQxMQU95BaeD2UiUHkahmoqPGREIw==
X-Received: by 2002:a05:6e02:228f:b0:3e5:4e4f:65df with SMTP id e9e14a558f8ab-42581e0fb6emr107166725ab.9.1758727344790;
        Wed, 24 Sep 2025 08:22:24 -0700 (PDT)
Received: from orangepi5-plus.lan ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56150787e91sm2786797173.51.2025.09.24.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:22:24 -0700 (PDT)
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
Subject: [PATCH net-next] net: stmmac: Convert open-coded register polling to helper macro
Date: Wed, 24 Sep 2025 23:22:17 +0800
Message-ID: <20250924152217.10749-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082226_400556_80EF0C16 
X-CRM114-Status: GOOD (  13.59  )
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

Drop the open-coded register polling routines.
Use readl_poll_timeout_atomic() in atomic state.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 28 ++++---------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..9e445ad1aa77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -135,7 +135,6 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 static int config_addend(void __iomem *ioaddr, u32 addend)
 {
 	u32 value;
-	int limit;
 
 	writel(addend, ioaddr + PTP_TAR);
 	/* issue command to update the addend value */
@@ -144,23 +143,15 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present addend update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+				!(value & PTP_TCR_TSADDREG),
+				10, 100000);
 }
 
 static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 		int add_sub, int gmac4)
 {
 	u32 value;
-	int limit;
 
 	if (add_sub) {
 		/* If the new sec value needs to be subtracted with
@@ -187,16 +178,9 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time adjust/update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSUPDT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+				!(value & PTP_TCR_TSUPDT),
+				10, 100000);
 }
 
 static void get_systime(void __iomem *ioaddr, u64 *systime)
-- 
2.43.0


