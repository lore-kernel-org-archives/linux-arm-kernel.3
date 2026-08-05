Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BAC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=; b=xZ+ZY1PVX7fCxHpPncnMsGPwuw
	EaBX/DS6xhahPNfqeSyi7bdmeJLsdeTIeNvoWF1pULTPj9db6ebuYppBMDZyIZebieedqnMdonAuk
	h4kWSLw5o3osfQBnGwRnsgfi+wYig73xvyjc+Kla+UGAuaJumIJu+2EHtKxs0vAqHE5pT85PCWzXT
	j1tRM1v+wC0OFbGYxr9bKpcjyJWe77CG3dj05TuV7uY1cbwXEco5ITJ2d1v5uc3FCgXS5Fweh8GJX
	f8QWtC82AiISXZy/ycflzMHMZBhCKQtIBXeyiiwm1S3bvjire0l2Z3HJE+FYkUwrzN7Q/wzijfHmh
	aK0rLeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXO7-00000003Z5B-1cJ3;
	Wed, 05 Aug 2026 08:54:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXO4-00000003Z3c-1u5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:54:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dDW02132439
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Su6pUumKgpP8taWCBv6778
	NBns5sO908kIeSqx2hTLE=; b=DGYpQORbLV3qXFfNsqspPQqIkAFOt00/0xAP9d
	agsIb914lZk1Hj3166ybKWN/ikTZKrM1bX9SyuiKA5OXwMsBhyrRvHyv3RTMmzFM
	ejSfW+jnxJ7gGv/atQabfzZEzF9J6CB7QTcuTYypGbEYGWPcCGCFD+kWyhoYkNNj
	mJax7/F2D6eXfSUKB+yRcX0CRzO7IYNFDgidL/82IHT+r+Ysfx//AbWCUam6mPIj
	1pOlPsYzOu26mx4kpvQ3R5AZ3GbuyIya2+aB2dzqtO9Zzec5K1zjjhG00c/j6+X/
	Al2RIwMwc2Dyv8WRuEnKLWkbwSRWVcYUIk4IcposEvs9joNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56bneh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:54:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso12324711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785920047; x=1786524847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=;
        b=R5aL4rGzhDtJTOM1IW68geSYT+6zVYV8C/jZfe2QpSdDlkQhd1zs+B00CpTlkjuwcv
         2Npkt9ux9qW2Y41JAhXmSm6UaoJExdqR5OxVjJV87SfRmyIgAXEybJswH2AGe02TrI68
         nhZQcyaVEqHePhF0maRYSx/t5bK1VOMPlOyeG4rgPluSqbX648esA5Lic3148ZpCtpK1
         /Vu4ZFo8h8jd9EXuhzJumT4VCfkipKjYxy9tWUMkSEvxK5bri9Yfzs0M17h7C2Lu+yQ/
         KGp0Vjv3mjwzUsYWsJSFTe4G2XpTllxoEawPMxza6ajLGL8llvHyET8c2h0PzRr83sZL
         cjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920047; x=1786524847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=;
        b=BxniYqi/eZFczbMb8VqaFsLRcSQZrR/voRqggj8qEZwMuApa2oRaFD5whYXV2YLBo5
         mM2I9yEjdbh6Wc08S7Z3N8fnX655JafuPRcsRpXRKFh1c0ESwTzHA809tMn4GpAhjEyG
         NXlAFLHAyn0vAzLmqR2HX8qgIQ6a1xbVqpH6MjFUA7PL6QlN1rGUu+RvGshXFXIY1ZR9
         DENtGq7ulBajMc7wPwjPSK2SGzJzdpHZYRdUlsmP6tsCohV9hWsgmfoAKvMkzK4LLQD8
         obK8sB7mGsQ6PqykxLtlAnT7I3rGaMzCmRLmIO2pDDKprdJ1/9t6ztdb60+6pMOxav/t
         lm+w==
X-Gm-Message-State: AOJu0YwGwxsZhoEh9MeIpN+JAy1eQcnAUQY6ITvDpg/x2PG9o3cUBeQ6
	aVkCgy+ML457X6y6PKJ/WKceIaJ+ixfran8XEKHIWLFraQ3hojvBQBUSxxxLoY3iPiUAYwoC+Jw
	zVDJorAP5QrOiB/wEWXFoR+oh0te5K5E+tdbNquT/vXqKvNRZxuGWvDTAE3TfetlvGAH8nk5U87
	ObOQ==
X-Gm-Gg: AR+sD10kkY/p1yV4DbzJihxhrjaKHbgeli8TEt7Bc4new3KogxLIG6PJuj71vcLD9Wo
	hJsFj1rCSMr/BiZsRpRD7j+QEfhz7sduOTV5gbTjluGwRJ44atQpH7JlhEY0cpvl0bONON/f6Iq
	EfYpFOpsNDm7FON7F9bqNQeet8ZOYFBdsMaArkkOq2px0YjiMvmzMBHSFkhIsxwoSYpHO9m6XbZ
	Me7KHsi3xQmmdcC4ksV/xUCX9KOqsuCaecUdIWY7Yx7q38EAiLit/Pff/iPvHXpd1TC0fRA9N6M
	gvIn2L20qlErI/HDJjOUvcrf5rgjMpFSbL5Qt/0v2p0TabX8URxahYEQy3C8+BgiTubYAWLwj2P
	M3rd+2BAGKJWDMsE=
X-Received: by 2002:a05:622a:5c07:b0:51c:1a46:9148 with SMTP id d75a77b69052e-52ce61934eamr55890361cf.34.1785920046799;
        Wed, 05 Aug 2026 01:54:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:51c:1a46:9148 with SMTP id d75a77b69052e-52ce61934eamr55890001cf.34.1785920046322;
        Wed, 05 Aug 2026 01:54:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfda556sm82948865e9.5.2026.08.05.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:54:05 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 10:53:09 +0200
Subject: [PATCH nf-next] net: pass net_device_path_ctx to
 dev_fill_forward_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-dev_fill_forward_path-ctx-arg-v1-1-f2873d941755@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAAwK/InruQGk2lXykSotnogkTZBBsQ/
 97Q41zmgkTClODdXCB0cuI9VjwfDcyriwsh+2poVWvUoHr0dNrA22bDLl8n3h4urzjngk4WfGl
 tjO560tMA9TiEApf//4EYMFLJMN73D1GnxCN4AAAA
X-Change-ID: 20260805-dev_fill_forward_path-ctx-arg-73366345e3b8
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA2OSBTYWx0ZWRfX0MQ3KgaJfEIg
 c49avOEoyy6Bkr3UpfR7fhwA0pJKxOfTI2MlNT0uwLFG++5V6Z2PUn6/1gWfntTbQ9igkY03tRF
 ZVF+jBoJ0jLZ/wXdEqXlCpIRYSx3Rk17iJ80SGx3Bzg3ix9XgtxjN4PjT4Leh4yLEBkny/dYL3U
 45MWukA8yzQwO8N4DaXJzwhTWMhVFDTRHcM37uDX0gT9Jtrg76lAr5hPwZIMjuUt+Q2dJOTdc6d
 piunHFvdKDzlbpb9z8PkCgPn0KJb6qaToEw7GZpuCPq0csOI2++ZMfs9HZWzCysYH/XSE0fqy43
 i8N/8A2uEQNMSEN4REcG/4e+7NCLb7usywM/SScGiREXqQ5EB/k/u/li+FDAScVMBHfP4bS6rtH
 K0Z1VBLKPVGUZwh4I5jz6izzas9k1D3AYxgARqcZ+LHyacWxcvSpkiQql2lb+vXZsCx+Otmdw5a
 0M59GpQusMqwzgkqE+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA2OSBTYWx0ZWRfX9kCjZZ1ScAbe
 G4Y2/+fKFvCNRvWR8675AlRdk4sz0k/xOIAqofbs8t29jKSeuWIAitBbQ3W6YUIRBIevu9PR8q9
 xFUhdJB9wvfx1Q22ZMX/IVfeGWbIXos=
X-Proofpoint-GUID: bNGvL2-Hn_rS4VfKtaLJOdOvxXZWuT_B
X-Proofpoint-ORIG-GUID: bNGvL2-Hn_rS4VfKtaLJOdOvxXZWuT_B
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72fa2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xc6HxeBLMKpXFN7qBEQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_015408_652228_A060994D 
X-CRM114-Status: GOOD (  21.91  )
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

Refactor dev_fill_forward_path() to take a struct net_device_path_ctx
pointer instead of a (dev, daddr) pair, so the caller can build and
populate the context up front and keep it after the forward path walk.

This allows additional fields (e.g. vlan and ether_type) to be carried
in the context and shared with ndo_fill_forward_path implementations,
instead of being reconstructed on the stack inside the core helper.

Update the mtk_ppe_offload, airoha_ppe and nf_flow_table_path callers to
allocate and fill the context before invoking dev_fill_forward_path().
The network topology resolution behaviour is unchanged.

This is a preliminary patch to enable HW flowtable offload for IPv4
over IPv6 tunnels.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c        |  7 ++++++-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  7 ++++++-
 include/linux/netdevice.h                       |  2 +-
 net/core/dev.c                                  | 18 +++++++-----------
 net/netfilter/nf_flow_table_path.c              |  7 ++++++-
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 33ddf0d07855..53183a132100 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -283,14 +283,19 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 				    struct airoha_wdma_info *info)
 {
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct net_device_path *path;
 	int err;
 
 	if (!dev)
 		return -ENODEV;
 
+	ether_addr_copy(ctx.daddr, addr);
+
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(&ctx, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index cc8c4ef8038f..1ec46784f018 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -92,6 +92,9 @@ static int
 mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_info *info)
 {
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct net_device_path *path;
 	int err;
 
@@ -101,8 +104,10 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
 	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
 		return -1;
 
+	ether_addr_copy(ctx.daddr, addr);
+
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(&ctx, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 8db25b79573e..d2f545016f7f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3425,7 +3425,7 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(struct net_device_path_ctx *ctx,
 			  struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index c1c1be1a6962..e2c9fe3f7a7b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,41 +750,37 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(struct net_device_path_ctx *ctx,
 			  struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
 	stack->num_paths = 0;
-	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
-		last_dev = ctx.dev;
+	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
+		last_dev = ctx->dev;
 		path = dev_fwd_path(stack);
 		if (!path)
 			return -1;
 
 		memset(path, 0, sizeof(struct net_device_path));
-		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
+		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
 		if (ret < 0)
 			return -1;
 
-		if (WARN_ON_ONCE(last_dev == ctx.dev))
+		if (WARN_ON_ONCE(last_dev == ctx->dev))
 			return -1;
 	}
 
-	if (!ctx.dev)
+	if (!ctx->dev)
 		return ret;
 
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
 	path->type = DEV_PATH_ETHERNET;
-	path->dev = ctx.dev;
+	path->dev = ctx->dev;
 
 	return ret;
 }
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 98c03b487f52..b9df7453f762 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -50,6 +50,9 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 {
 	const void *daddr = &ct->tuplehash[!dir].tuple.src.u3;
 	struct net_device *dev = dst_cache->dev;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct neighbour *n;
 	u8 nud_state;
 
@@ -72,7 +75,9 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		return -1;
 
 out:
-	return dev_fill_forward_path(dev, ha, stack);
+	ether_addr_copy(ctx.daddr, ha);
+
+	return dev_fill_forward_path(&ctx, stack);
 }
 
 struct nft_forward_info {

---
base-commit: a23b36233d4103def55dc8cf65698106d0bd1e62
change-id: 20260805-dev_fill_forward_path-ctx-arg-73366345e3b8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


