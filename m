Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE8ED185C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLl2yTmIyk/u0fY0OTkeSRaVcVv4cgEfyMzNgksSQTs=; b=g3HoW2a4r6ZGLYVhwqa+UyRC5i
	s/vzOwJxhr2qYRBgTOz+csCN8dSW+5kON8HKWK8dJTDC1LmRoFS77R63rIrqbRuuHwFUpxj24ct/V
	kzDjNMTF73xV6KPwYXIb1FefTqgn+bm8DznCLcgh0R0B8vu5oZVcAMl+mCWdGTjG3TgCPKKKmmdSW
	A4dF2317f3R1hoUDscHYDoOQi9hxVArU/Np8yi1BSsHE/Bw4t3DptjTCUlFsUfG5HSYTd78t+dq+E
	joiCDX9Ifo3j0pcLEoYNqeFTnuVU50ZYcY2VqlI7NUx4bvHIJfFpVyrsYMU+73c61Yum5MjPSQYxE
	Hxyn1BpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoQ9-0000000Gt1L-17tW;
	Thu, 08 Jan 2026 11:43:17 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoQ6-0000000Gt0P-2LP9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:43:16 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c7545310b8so1674903a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 03:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767872593; x=1768477393;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLl2yTmIyk/u0fY0OTkeSRaVcVv4cgEfyMzNgksSQTs=;
        b=TVr6ALc0wKtyPeKEqSoxB+OmXMGeDdPMPrnWXVnu8LpmyoyUsHuqI9rOhQQTb4zXWS
         D4NKnTW8SCr32E3QPF+kODEVBwfrJHPq/x2zZWaJie5icsWdiWqvSnQR1M+UavNpW6d/
         6fpBQJHjPPX9RxBzuq1XRF6czUoGcwsQsKt5PYsKhxXHXO4vXFpa7GZ8YBGv/5qe3Gjk
         Ajcazqqnw+qYYt0IZXMwxDugD6hrtv+6J4vLZtLwAnJoBoNi2BRLN32qpEVPGS+K7uaJ
         oGx2oueJaJIwooNKGGvwcumla9mjZkSh+/nw3teSYT7wXOzik/8p/HyFXwVhaa5vO3n6
         1cYA==
X-Forwarded-Encrypted: i=1; AJvYcCUJt7aDtwh9uVNbJkcYbkOa17u05uym5wM/eMNiF7nlfOr+S3cQIXU0NZnC/GGXyG1xiCA95OeC4vDk5DbcUptz@lists.infradead.org
X-Gm-Message-State: AOJu0YyKgp+fTf6VfA9k83hbYVilvkp83ltdTtRXahGNka1FDO3wJn++
	wDCNYUJSPSR5b5XRrtzl9MD0VaywUxoa7vBmm7TA0Lp+edC88lqR7YUL
X-Gm-Gg: AY/fxX6nlWMTPWIPpZ1xXxg25x2SBZZWwf5/708h8/+dyWhQb+eTpm5qxCEjA6MzN+m
	eLoNJ6LifwRe5iUwgt240FyKHAfKYnXxmN8fvJosdHFvZhIlYY5XnaezDvBg/dmTR1nCoHYxm9L
	zVa5GWvZTUzj4QnOxne6H5cMVnn+DrL+cKX5ttpPVsZdSpEqYAutoo/5nXpQZW6Vw9ObbiVkE3A
	x8n0BiBEVb0CaoCInJCBHOiJWlFEZKQkJZBHiV1Szjum5+paW1PFZkKhHaC12AJXVDmz6KhnsVI
	/8pudsdloFN3zBIUnl5vAr07jKmUofJgZaDt8DyiWMla5Jw5ze70Ga+YwU89qLN+8mLL/6kst/s
	NmFe1h9YNzZspQWRD61rb/ONjH1BP+ZDrx8hNHajl+iq56TgD5BzRzofOhHUJwBTwlYtw8t6MjC
	q8nQ==
X-Google-Smtp-Source: AGHT+IHMFL4AvJOQLr+1gng3or268k0qffkqrhBJ29oEiScsZeINaFbiTYzQwVXPvQ6mp+IzqqnIIw==
X-Received: by 2002:a05:6830:3497:b0:7c7:53bc:54a7 with SMTP id 46e09a7af769-7ce50b8d191mr3288912a34.20.1767872592742;
        Thu, 08 Jan 2026 03:43:12 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47802551sm5246754a34.1.2026.01.08.03.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 03:43:12 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 08 Jan 2026 03:43:00 -0800
Subject: [PATCH net-next v2] net: stmmac: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
X-B4-Tracking: v=1; b=H4sIAEOYX2kC/3WNQQqDMBBFrxJmbYoJUcRV71GkxGSMU2hSJqlYx
 LsX7brr//57G2Rkwgy92IBxoUwpQi90JcDNNgaU5KEXoGvdKK21DCtTDPdcnuQ4SVOP1rWTs75
 roRLwYpxoPYU3iFhkxLXA8Fvye3ygK4fvYGfKJfHnbC/qfPzLLEoq6WvVWWVaY2xz9TiSjZfEA
 YZ937/b7rXEyQAAAA==
X-Change-ID: 20251222-gxring_stmicro-40bac6fcad86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=leitao@debian.org;
 h=from:subject:message-id; bh=8E1ysSUShJ8p6nlzz4eEEoUf1cDKgDwOfnAJUPcBZHs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpX5hPLU4cUiB//lWOugf+MGfu+cH0iHAC/Z9et
 5lX/HdKFiOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaV+YTwAKCRA1o5Of/Hh3
 bfCWD/9SXn9wXZKcp9wRbju5Q8fSyNgRaLkqW8m5h2LlEGgOqu/ilvXA9i5lX0JnbrP0/O1keli
 JUSr1cH4l5PpOmv286HitihXQvP7lt8bJoZcy5hltW0wLcb1K+/JWMFo1VzmdYsSCG92+qJwSCE
 PJbNgYaTga9E3FZ/aT7zzWhnzGc9Uqmw61WG6CGb5j3izsECWhanLtzE8DF/EZy9Aa38zyKL11u
 lXjQW5YNTcEq2Siny2CHUq7ASWTD1PHOOch+65QgCoORg/h/lt9x0KX5vyBM6EmRr8+m/tqY6JY
 /+wUcCJuY+e4CZt6RIroC36WXI3mi0sn4I39ck67tx4QKCP7tBhZWAi3BMdBOy9TVnCMJY7th9J
 K6kjKS9fGGPjJAfvMlZFPC7y4Lg4Z7GYjLLvvzswOEhUwreNwCX/blmjqoQoLMqS9Plx1AfQxDp
 CvzgnEZRgOuRaC0Z7CBq4Pe58i+hCOGKUffcPGTU5lI4+zfpu2LexEm/4ncw9D0SIEcs1FL2L3D
 Njeitufk7bAe/KWYISJ0krP8Hom1kf0zev/wz4BGBz5C5T5h3s5eeiHFB8GCFXblnAs8VP7J+lJ
 f0bAfn17p0Q0fYxyk61dOhFvjq4+RR34v2SQLSM3P3AgqSbvSJJSrv9GBv1lEzdcLe2/ThWPzmq
 1jcp/YE2frbDlew==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_034314_896069_6EF81879 
X-CRM114-Status: GOOD (  13.71  )
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

Convert the stmmac driver to use the new .get_rx_ring_count
ethtool operation instead of implementing .get_rxnfc for handling
ETHTOOL_GRXRINGS command.

Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
-EOPNOTSUPP for all other commands), remove it entirely and replace
it with the simpler stmmac_get_rx_ring_count() callback.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- no change from v1. Basically resending it now that net-next is open.
- Link to v1: https://patch.msgid.link/20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index b155e71aac51..c1e26965d9b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -914,20 +914,11 @@ static int stmmac_set_per_queue_coalesce(struct net_device *dev, u32 queue,
 	return __stmmac_set_coalesce(dev, ec, queue);
 }
 
-static int stmmac_get_rxnfc(struct net_device *dev,
-			    struct ethtool_rxnfc *rxnfc, u32 *rule_locs)
+static u32 stmmac_get_rx_ring_count(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = priv->plat->rx_queues_to_use;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	return priv->plat->rx_queues_to_use;
 }
 
 static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
@@ -1121,7 +1112,7 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.get_eee = stmmac_ethtool_op_get_eee,
 	.set_eee = stmmac_ethtool_op_set_eee,
 	.get_sset_count	= stmmac_get_sset_count,
-	.get_rxnfc = stmmac_get_rxnfc,
+	.get_rx_ring_count = stmmac_get_rx_ring_count,
 	.get_rxfh_key_size = stmmac_get_rxfh_key_size,
 	.get_rxfh_indir_size = stmmac_get_rxfh_indir_size,
 	.get_rxfh = stmmac_get_rxfh,

---
base-commit: 8e7148b5602321be48614bcde048cbe1c738ce3e
change-id: 20251222-gxring_stmicro-40bac6fcad86

Best regards,
--  
Breno Leitao <leitao@debian.org>


