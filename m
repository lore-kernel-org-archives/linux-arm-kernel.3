Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC216C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqvEEiGjtfCg1O2c4wJsc9rlXi5oFjjuoYnCbbZ/cQM=; b=ezKkR4jK00hEs3FBntuhk5ndXp
	9B+fbz/MHVo/zu2KbaLKge/hxWAcJWVzPEx8Q0tJ6Y+hkeV6A4SSQGX6MCWQPoNLDfXKdqyMMo4Ag
	OI25yfrdGxcMhoNo7SrAklQT6LC3cTQOo2FAQO0mG4NBeNpKTN6KfwO63HMTw7d2HzdUxHi6uYW+y
	5Omoj5It/oMTWB1sYyqNh0fU0MCiQo6cjokx+5Tv7z5avQ2jzeF6YDdtwDsxTB0YbCNxzbpWjgNPV
	JblbkXdqSD3udX1fzGnxaRlL9yG3/VmO8kAn+Ze7LBu36+uR7a0Jnxl5cdbtYpBIevtYrt+yO3DxR
	2FKzvDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn25a-00000001TAo-0ore;
	Tue, 25 Feb 2025 21:03:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1MA-00000001KiE-0DAE;
	Tue, 25 Feb 2025 20:16:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so8843065a12.1;
        Tue, 25 Feb 2025 12:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514601; x=1741119401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqvEEiGjtfCg1O2c4wJsc9rlXi5oFjjuoYnCbbZ/cQM=;
        b=R9fwMaG4deIV/f0V36+tt7h5FmOjyhLokGj87GPVx5RolNe+du55Ln0qL4wzB6O2jz
         vyIvUq1v5fTn10zSjOPCAHh5Rf8vuJFijlCAqGm4jah4uOXt4SWfdo6EXnMytA2Yybcj
         88gmSCcz3CD1r0ew2gjFnPQPEqwuD9zppCLrWUNb4woLyQ71NXDXn+1fL+BxGUicO75i
         rQ9d42xoCbo1QITkf0sAErMBO1oBSZMbGt50RvEioT77qtPeJDoHi2u6dQgF7Dq0mLpc
         M2L/27p4JN1o7lfBd9xo9bkoFf8eJmyN4PUH6PGoslNTy3cf3t3nWbS58Q+20u6+lLqM
         NZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514601; x=1741119401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqvEEiGjtfCg1O2c4wJsc9rlXi5oFjjuoYnCbbZ/cQM=;
        b=sv880hmfMP+U0jczmPZD/qy7qNNbupVoyXUAv2uuJau9aTipvXiSTszd3+SZa0mlJY
         TXCDA8Tx2q4Ct1VSVpbw5vi71TY7b7YUw0Qkwtq1pqCNMS5jqsw7yE62RlALqY2g7aYC
         nHMwxpf6XIi5Cy1P7sEdpM0lh3PjCj6kH+StVTCYCFJFYjs7uFE5C75XMPm04YpaWJ0d
         CiOHoFLPOlo+0fkAYcPtpOJj0VayQUPTXJkDRS5fIpfmExqZXfPHsYEpHDx/2HUATva3
         9KWPl9nH6JBCQPtLeXlPA4VUGA54ltgGbYlSSjqsuG/OAaVyPOP3TfWGOZbUppbnplgO
         ujHA==
X-Forwarded-Encrypted: i=1; AJvYcCVMwDZn/C4X91yuxZFn4rU08sGDLfZ7p12vyy3u/wyg05D/Ky0Hn/KwBAufcT9CVUWidS2i/8OZDT637movlk9n@lists.infradead.org, AJvYcCVeHEqFKpZSlN8Wgz4kSuK4yN9EPF174KxpF94+OvU3R8gt/nLK+mATMZgR+xAFj4eTBgSqmrNTP1KWXd7tfGc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyL61OZrBk+HjpECgFaTZhEfDDVWN0bVqb6vfGs+tDXiHor9De
	bhOdyNYYIi+N9lcZ3rGfT2wivWChXhAoptOJXqz4mXEv0TJCbbe7
X-Gm-Gg: ASbGncu98Kv6qAu37v1LFxbTnN/HUGeJjrawEbFHo/94j6wKmaN9SsoqP40p8c1cC+l
	1orvo4LtmKPKPWAsTJi6gjPjbT8XT1AtHqFnEi3GTwIyLwE5J24INKx45quZ1l0LEJelf1d8vtB
	6Pfe/CNCTCxMml5WkciXYi4QyG5g7+SW6rdSvtpWvFBxUVIo/TvN6818f/BOEdjSxJEidaAQkDX
	Fs20E+zGDvOJ1JnG08kgYLjfwbqBE5EPjDxasVZiQuHr7D3El2k5oVlz0HG/ZK3MNM1oDE/l3Ra
	CJtEovIJsblfEZn17HV0frl4/8MjFGHFHlMErCG3ShhlFoqbdH8WrlNBO0ZN6KGRE9dgWehMbi8
	v8s+B9swAph9DVV5HKAJA0RmGtYzEDRcvsaf1jDx/Xr8=
X-Google-Smtp-Source: AGHT+IHhGusG5BMLrTa3hM8cjvDcEm75Lf8vLAMleB4CleirSzLNiv+mlxD0ehZbqG9bpzWHQ5wVQQ==
X-Received: by 2002:a17:907:3e0d:b0:abb:b209:aba7 with SMTP id a640c23a62f3a-abeeedcf3bbmr43896266b.26.1740514600495;
        Tue, 25 Feb 2025 12:16:40 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:40 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [PATCH v7 net-next 13/14] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Tue, 25 Feb 2025 21:16:15 +0100
Message-ID: <20250225201616.21114-14-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121642_090519_2A889682 
X-CRM114-Status: GOOD (  15.58  )
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

This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.

It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
ingress_vlans set.

In the forward fastpath it is not needed.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  4 ++++
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 695445927598..9ac7142ee493 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -869,6 +869,7 @@ struct net_device_path {
 				DEV_PATH_BR_VLAN_TAG,
 				DEV_PATH_BR_VLAN_UNTAG,
 				DEV_PATH_BR_VLAN_UNTAG_HW,
+				DEV_PATH_BR_VLAN_KEEP_HW,
 			}		vlan_mode;
 			u16		vlan_id;
 			__be16		vlan_proto;
diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index c7646afc8b96..112fd8556217 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -430,6 +430,10 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 	case DEV_PATH_BR_VLAN_UNTAG:
 		ctx->num_vlans--;
 		break;
+	case DEV_PATH_BR_VLAN_KEEP_HW:
+		if (!src)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+		break;
 	case DEV_PATH_BR_VLAN_KEEP:
 		break;
 	}
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index aea94d401a30..114d47d5f90f 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1494,13 +1494,17 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 	if (!(v->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return 0;
 
-	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
-	else
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-
+	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG) {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+	} else {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
+	}
 	return 0;
 }
 
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index c95fad495460..c0c310c569cd 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -148,6 +148,9 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_UNTAG_HW:
 				info->ingress_vlans |= BIT(info->num_encaps - 1);
 				break;
+			case DEV_PATH_BR_VLAN_KEEP_HW:
+				info->ingress_vlans |= BIT(info->num_encaps);
+				fallthrough;
 			case DEV_PATH_BR_VLAN_TAG:
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
-- 
2.47.1


