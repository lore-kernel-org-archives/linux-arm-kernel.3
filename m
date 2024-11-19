Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07ED6206A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85S0Wgk4R14tSlRD4buKO5TXxTAg6c1gFU6+LoW44DQ=; b=prnmWDg+ZT2JQpm7c5kmiTKyrD
	nDkYFf3Loa5qkDkQghE+pKF056GkJR4G5Y02z0AXU1u6Q3Kfr2U8SZqNiy76ZvYx/J/KawIG4eXh/
	ZZyi81GBXk34JGB8JWK2JsqaPU/TKf96+YqMpttsqns5AjrG0IIiYcne51lv1GReWaz4j0Ncec0dD
	cQ89PaOgMQEPxBe5TaofGHIx7II+0OFAMbVGjyZHjU4CS+37rAYgzFXG989HOqVBSo0mQo7hsOclO
	N4qV9yIUTOD3LrcVJFuJBR8kz3JEiHJ+fVSEPN2B8Ccvczh35u2n3hZbW0e9ctr4EnbmKm2REBWMi
	f0ddKGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLUO-0000000C3lQ-0CCW;
	Tue, 19 Nov 2024 10:29:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKX-0000000C13R-0CWc;
	Tue, 19 Nov 2024 10:19:34 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa2099efdc3so965772066b.1;
        Tue, 19 Nov 2024 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011572; x=1732616372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85S0Wgk4R14tSlRD4buKO5TXxTAg6c1gFU6+LoW44DQ=;
        b=FdNuR1sMJKTaZQyZGl3sFkcn6aoK066rsL3W/zsEbjfttEws4V8RvtqaGcx4ZKxEiz
         pxQb/l1h5ganc/vPxpGv0F3AvImXfWGybwxFhllg3oog+/2HQoA0j1aHEiYeWnu1tjK/
         QiTp9z0ZedtAMlDIerEfIYZX9lqL451k83sytL/0hsYhn9A9X1L21vs/8S+8J6f45PNx
         EY/Ykcb1nm7HbQjEewuLO3P3y6aXu/d525UEVGF6RPHS8ehYjMBKyRP2mIXz5mYklY+n
         xMi86XLyszxkOMA0aQlRJZ/ciBVSQVadhhBx1z03Edd+y9hHKdjYz09hXGF+w4tZg5KK
         qwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011572; x=1732616372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85S0Wgk4R14tSlRD4buKO5TXxTAg6c1gFU6+LoW44DQ=;
        b=mH56TYDJ2OmBK81BfJDLKthhxh400dbOkrzitaDagZYU6T+ddyuq2qWipSUhr3F0JV
         bH14nlvoS1/Frm90+7JRaJanL7KUimkZryDvyuK8ZOJWW1sVPMA9Iss891WxYzHTnkf7
         dXJ8PTDT5+uqBuhh5nMGbmWpOYXhKZtKBhII+8/K6K//jqAuGAlRc69wdLeTs6jupZrq
         ivd/g7fYG/LlZP6CZg8SjU+7Iu8foCy1s+SRGBiPhmdy/FIHEK2Kg/ujYiEND8Nz9xVS
         gJVHAH4KvRO+X5ohIeH2ZoYvlg/mmEGGkLSJdqY7bFpje9rlH/qiyWDmQx+3TFEf1D/6
         3Y6A==
X-Forwarded-Encrypted: i=1; AJvYcCUTdJrGy3UDifQx2xjnEqE/cnIX8NYkGa6O8VKMXgfRCbORvBXK5CIo4z6kDcSy+9C6dnohEYUHWaymtgm15xw=@lists.infradead.org, AJvYcCVk7RSowXrf4LOCmGwOh14BKC06K2VU7TnEEJCKgSw8QkMnrkQjrvzf21+FOrYIIpjmXMDLyx10LZFUWRplhIX9@lists.infradead.org
X-Gm-Message-State: AOJu0YyC2kJvnhaw1Wtcqp/ZVR+w7MtpsXxDCfAKmZsjFGHWs1nN5JuR
	gKB8VUtpYfYRbZLJcgGz7inIIYzeoEMYStW8iNjCIoqBtV1xHBDF
X-Google-Smtp-Source: AGHT+IGzVDghd+HHCKlijYAqrFFNL9wIfOoTroQPxMyDYa4idVXMvA5nnKPnghWyNvh8dPU7HPTv9w==
X-Received: by 2002:a17:906:dac7:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-aa4c7f2c8fcmr220655966b.25.1732011571689;
        Tue, 19 Nov 2024 02:19:31 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:31 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH RFC v2 net-next 10/14] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue, 19 Nov 2024 11:19:02 +0100
Message-ID: <20241119101906.862680-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021933_084428_5D09A63E 
X-CRM114-Status: GOOD (  13.39  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.
But we want to use it for flow between bridged interfaces.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index cce4c5980ed5..f7c2692ff3f2 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -106,6 +106,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -118,6 +119,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
 			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
-- 
2.45.2


