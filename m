Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62712D44C5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3QziLtppri025RUH9iC7KG4n81ulsbjnXMb8+qxeEw=; b=0qP6vC7tQvg4ryVACS6Sy9BSgh
	BCZHbpEI/ysAVeLjwZDi+vUdTvNVnwtjJJI3oOYEGolI53osrFVIVI/Q1v9285hIMY70ftXnXUE4Y
	+k3++V8aDZBT0jWzu8/yotGRHRhHafLExIFB1cAJeoZjZs29qRTYB96+PmGV+3bHUJyysVDLSFuLL
	uR085Op15+yIaqBjMkbvZN09kvKGVcvqu9MkOqy9sPXSvnbV8h82XvqszZzK6OzSU7Tb+n4GTPIuB
	QthD/tXli3AtRbL/ClyTadGxXFZWr/fFQp90BG+xe9DcvUIp0s3K9gX4w6hjQ1tIqVcCQFkFHhgHG
	A2QAllCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUa-0000000CVFZ-21bN;
	Thu, 15 Jan 2026 14:38:32 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUQ-0000000CV3t-1fFY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:26 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3ff4acb6eebso666802fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487901; x=1769092701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3QziLtppri025RUH9iC7KG4n81ulsbjnXMb8+qxeEw=;
        b=ZqwHb2qkGrDn78X/p9nEc/lTrwus9Wo4JSPhHNkMGd2iTfXFmCgIfNc7toxyP6uteh
         jJg0cbOzjuVaxhJkonfcZ1KXr2OzdjX6X5Y+G2NCv/t5f9vfyA0IRoBk50aScKtAgPli
         T50rkw2nfHaiaH8VF7/Vk9m2lw+LStG9x8onB8e1UGtjeyCgQBzS/3FFeP4xH3Dug/wd
         tTdK6g74YswLMsQFV2ObvD7uuXW+K8GRrL57AxVtK7QoGbbww2DjUhIRvIcYyJ4FDWcL
         nyCss9B+heA59MakRXY47jCCjuj15CGsAP0TM3HkDxbzWmdsLsqrsxc0R7tuGHVy9GsT
         LYWg==
X-Forwarded-Encrypted: i=1; AJvYcCXsINau6MOSq8fOjjM0C9v64gS7HBZWh/h6ZhGhUNyNwiyW9qT2Q184rknCkzhhYv/7Hs9YG+7p9k5bcIpAErCp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc7YRN6PX5gVoQ9BbNfJ/FCyR2KYUKfvmuTZYUvDJcALaPdREL
	hn+y6M28O1jaNPol/PiovVyCNXKuYlFZjQ37B4v5OCP3ZbywNUwsq1qo
X-Gm-Gg: AY/fxX7YemlBv56lIF+qhplfLhboyWe6Z4w69pkjp2mCqvGb7a+bIby9P1M0lYnhn3N
	4QkTL9F+YpuMTNqYfn6umWVb+hSe045Ip0YLPWgsYiwMpvS+4s+aPYHpUMJNYs97BGdqSxDtuzz
	SlX+cWTvHAbJq7fpL261c5RSd6WTsJ27nexx7jD0djhrOoXBAse/B3Id2PFAXCmwZaWSfiAdVmY
	ussqlX4RflpHiRaKVRweOmpvF3w47pl0SOC3ytSrBs6lII3JAYfgcwHXEBIz3X9CdSnFqB0PpWt
	TvInGN09vroabxW3yKQtqfuHkLw5Cde1ePIHiQWsFN6SzVw5bwLyPs6oj1COVQyJrz6lzrXnqUt
	jrISO+ClNQauaY2lTPVrMAPzK6r6LHRAI5m46TTb7y0dIDrCMkWCG341WbDeeJ4RapEopsbgpZb
	tY/w==
X-Received: by 2002:a05:6820:7508:b0:65d:1697:e6ce with SMTP id 006d021491bc7-6610068d279mr3919809eaf.23.1768487901584;
        Thu, 15 Jan 2026 06:38:21 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:74::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-404427177f0sm400425fac.9.2026.01.15.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:21 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:55 -0800
Subject: [PATCH net-next 8/9] net: macb: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-8-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=leitao@debian.org;
 h=from:subject:message-id; bh=EDM5owIVyL2DjajXDu3o5iZ+GCzD1U2tQZv0qOHfOAk=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvSl1e/Mq8M8IDjFCUaBOsQM77krGX3tiyP7
 UJQ2NGca2SJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 bTjfD/wMzBjLyL7mbyJwNKwc6wxg6I5YpP5F0V0MfH3hnmp955ZI8DFLIKq/u+nPJlokYB22aYt
 1Bplo+zYTfN+TGaRW6KNauxtNSk3BMTcqkeiTWWZ4SI13BT2RJWkI1x0pNcKsCDTy/jzwKVXUmH
 pZFIl2VCZP/VGdI90bGpuzJ2NCJX5OznIHaPnZUrsn3NWmViPkOxaKvchYbloRkbSONSAQPT5eH
 4XaveFvRvIWR8a6jhKCJwHvJ4z+ovYTCY4nQSEXt9Yb7plU9XNWh3jufYzDXv/gtbHdGhZZDxHJ
 2rgPBil9vZwKsxd99nkO3TwH/fQ+btPcSNDi7+bNovV9eGPzEa0GKHYNPIbvxbSppQ57nrQXOCX
 U8HHIZuBgGueWGZjo67G3GUZ+otCCqpD9X5Zkbiy4dLYoZOjAJdZPoFFvds34Pfoq7hd96IZe7D
 5Tn9iZXKP6RzqTskPCc1IwSgqO6hWUnkmrPArVr6yS7mgPf4Ed3TQWv9TjlqWcXN0/Rmvaz16Po
 uYu+x+fenatWmWeGgp5Vq71IelJuxVfwLYkrWbgF1ltF8+/lc51g/6Kv0WeVl6OXVRixs3En+RP
 fKnKPBRdciCbDxzoocETR6oC14LkfWfBT2KUEBpglwPpNa45J9T43hsUu2t55DfC44qRxs9/1yJ
 pIRQaqI/0N1tTeg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063822_473429_402D6C2E 
X-CRM114-Status: GOOD (  12.56  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/cadence/macb_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 2d5f3eb09530..8135c5c2a51a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3850,6 +3850,13 @@ static int gem_get_all_flow_entries(struct net_device *netdev,
 	return 0;
 }
 
+static u32 gem_get_rx_ring_count(struct net_device *netdev)
+{
+	struct macb *bp = netdev_priv(netdev);
+
+	return bp->num_queues;
+}
+
 static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 		u32 *rule_locs)
 {
@@ -3857,9 +3864,6 @@ static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 	int ret = 0;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = bp->num_queues;
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		cmd->rule_cnt = bp->rx_fs_list.count;
 		break;
@@ -3941,6 +3945,7 @@ static const struct ethtool_ops gem_ethtool_ops = {
 	.set_ringparam		= macb_set_ringparam,
 	.get_rxnfc			= gem_get_rxnfc,
 	.set_rxnfc			= gem_set_rxnfc,
+	.get_rx_ring_count		= gem_get_rx_ring_count,
 };
 
 static int macb_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)

-- 
2.47.3


