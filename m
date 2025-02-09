Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1FEC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=; b=zvcMgI0BfKYJZVR3xw9OGYYF31
	XPSoXt9r69bCHpBr+alh0YoQZgf0A0n/RV0+4iOA1d+582NAzVUDW4xkL5STKjS66Us4Ad61RDsQf
	ERdCg+qLnVV9xGtqYE8T56OXtDkXBmw4up5uXbxj+zDukuNtPGVH2Ts3qsruD9FwGk2W58Tw86O5V
	P8Si8gW/Db4hNFWXBGgSc/93j6lGkfz7U+CDGCh/SYKg1Qmd8KR2zwh53OUlt8DmguoFL/cEhg7i9
	sRVEpTN7mufdVgKaJNXzQW9QjMT9B6Zaw1PFbWEpJt/LTt1fCxbtwqFRIJ87EsdSRCJeI0l+ORMW6
	FgPlFtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5HZ-0000000EhzX-1NEF;
	Sun, 09 Feb 2025 11:15:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5D5-0000000EgXL-26Ss;
	Sun, 09 Feb 2025 11:10:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67ac42819so542778566b.0;
        Sun, 09 Feb 2025 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099446; x=1739704246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=nJTofOMnDmXE7GRT2vfrQZQIDQAiS27p++QgRWkOdgaa6PVLgj4TZpBx062vWdDhJI
         FrPagwcS69G4rmlieLS8Tr3J+WODuyFk/Kzlw4lznQnsJ+kzDIlY1JmKy0ZGmBZrLG9d
         mpJBj9HI7x4wunh4tgOZnJNwBTBuu+8aBXkT0zCzW9Jq+UG2mbxbHVulMww0YkFZWXSs
         jy0NmKc42hPI3bX2HlcLlU8fYAo75gqAmfQujCv+UPMl9U7Mf0HgXhX9S2oxhCLqvZaH
         YYdtNrXfNnJ/FsJCNAVnmWIlpsSByedqZM/LJ25UAJ7u00DER4Iybizd2r5BqXogtsBa
         NHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099446; x=1739704246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=ZXTpRjld0CdHvHEPT2sMz5AeBaVrZCG/c2KJSQna0hz6VhsVEu8NWlLxmEGMKcltRV
         5UZGjD+zzBWFTT1sv0SDzPC8YFXxjG7kaOB9BfwzxHBvWZwZX1d+X83iIYG1oMMH/n0R
         sm6ObxdWQudJKIYUAgKAl1Oc2dcoqBB5IVOpcN5ZnoaGbV947+wpP8amxqa3z3Mfyrk5
         aA9WEQmH3ptEWEm3WDxNh3WPcsnFnhs67sG/kOXJ2ac1EuqB77xfelFaUBu5UBuMnNxo
         QbiGlAQ4Q8lBPN6MX7Lr23mRzRQeXZS5wcUJxL6klT+/aYek2Ea4QPZrDcffFBEAGyrI
         R1gg==
X-Forwarded-Encrypted: i=1; AJvYcCVuZmNk7+kIitdGYmI1z/XrjwiLEBJRJxoU+nj+Q5ZFVcGmIMIW44hx7pAjZHi2okdvreIl3qRIRxZvGuXx7J2T@lists.infradead.org, AJvYcCXt8XYgYbCOl11ca5vLx7YrJ7QxZNTwqnNw44w1b2UX7e8jGJN2J+GibjpYhVsyavrHEe72BJi42DQA+7qpfy0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZuw/8wJRE5hLFTuXOgIztdbSsteAUdFM15kWKFd+dkVxun6V7
	y1rm3BR5QBVp/8XGpsaqZWSp/CckgGjGL6vRe6lvU5jlf/chvJz3
X-Gm-Gg: ASbGncuwh9WneZISDYPdKel5fyuHQ7cX1MHsNT3oDSak0fz9bnlNdewZdFfX5mhTThJ
	2/vZbrg95KYKO44QGcKFvs5vfiM5WWqjXOrbrGYwZVMN9Mx1TJ3UQbLagtdybkHbFkaXdyDhyAZ
	CfgyDeYeX5buRDbz/cFM7KuHNMyVQAruzSzA0Zebtd4owExQgyj2Vn285LY2VoEjwpN5B+7XlUg
	P/gtFskk2RYNXA73UNo7ixhvRsdubC01nsFAjMFGVowguTambMpLqMyzb3+a1hCdndNxNLe71ET
	I8z6vNQ7t4BYZYK1zgwoIRtPl7t3e74M6yl+PG9rgOR7cvTYYWR16JnO/0MbB3ZtN7ObOa9OX5S
	TQX7obtaduYoQ+g7M+F//zKLwrgOANBCl
X-Google-Smtp-Source: AGHT+IGgn06hMTlVvi9pNiIOCGf289zNj88FfDXoxW/6B8WNNLYcdoNWmCMQN1J0/mTfbfKOoidTdg==
X-Received: by 2002:a17:906:4fd6:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab789aecd06mr902224966b.24.1739099445427;
        Sun, 09 Feb 2025 03:10:45 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:44 -0800 (PST)
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
	Kuniyuki Iwashima <kuniyu@amazon.com>,
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
Subject: [PATCH v6 net-next 02/14] netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
Date: Sun,  9 Feb 2025 12:10:22 +0100
Message-ID: <20250209111034.241571-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031047_538296_497BA192 
X-CRM114-Status: GOOD (  15.14  )
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

Now always info->outdev == info->hw_outdev, so the netfilter code can be
further cleaned up by removing:
 * hw_outdev from struct nft_forward_info
 * out.hw_ifindex from struct nf_flow_route
 * out.hw_ifidx from struct flow_offload_tuple

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h | 2 --
 net/netfilter/nf_flow_table_core.c    | 1 -
 net/netfilter/nf_flow_table_offload.c | 2 +-
 net/netfilter/nft_flow_offload.c      | 4 ----
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index d711642e78b5..4ab32fb61865 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -145,7 +145,6 @@ struct flow_offload_tuple {
 		};
 		struct {
 			u32		ifidx;
-			u32		hw_ifidx;
 			u8		h_source[ETH_ALEN];
 			u8		h_dest[ETH_ALEN];
 		} out;
@@ -211,7 +210,6 @@ struct nf_flow_route {
 		} in;
 		struct {
 			u32			ifindex;
-			u32			hw_ifindex;
 			u8			h_source[ETH_ALEN];
 			u8			h_dest[ETH_ALEN];
 		} out;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 9d8361526f82..1e5d3735c028 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -127,7 +127,6 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 		memcpy(flow_tuple->out.h_source, route->tuple[dir].out.h_source,
 		       ETH_ALEN);
 		flow_tuple->out.ifidx = route->tuple[dir].out.ifindex;
-		flow_tuple->out.hw_ifidx = route->tuple[dir].out.hw_ifindex;
 		dst_release(dst);
 		break;
 	case FLOW_OFFLOAD_XMIT_XFRM:
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index e06bc36f49fe..d8f7bfd60ac6 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -555,7 +555,7 @@ static void flow_offload_redirect(struct net *net,
 	switch (this_tuple->xmit_type) {
 	case FLOW_OFFLOAD_XMIT_DIRECT:
 		this_tuple = &flow->tuplehash[dir].tuple;
-		ifindex = this_tuple->out.hw_ifidx;
+		ifindex = this_tuple->out.ifidx;
 		break;
 	case FLOW_OFFLOAD_XMIT_NEIGH:
 		other_tuple = &flow->tuplehash[!dir].tuple;
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b4baee519e18..5ef2f4ba7ab8 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -80,7 +80,6 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 struct nft_forward_info {
 	const struct net_device *indev;
 	const struct net_device *outdev;
-	const struct net_device *hw_outdev;
 	struct id {
 		__u16	id;
 		__be16	proto;
@@ -159,8 +158,6 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 	}
 	info->outdev = info->indev;
 
-	info->hw_outdev = info->indev;
-
 	if (nf_flowtable_hw_offload(flowtable) &&
 	    nft_is_valid_ether_device(info->indev))
 		info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
@@ -212,7 +209,6 @@ static void nft_dev_forward_path(struct nf_flow_route *route,
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
 		memcpy(route->tuple[dir].out.h_dest, info.h_dest, ETH_ALEN);
 		route->tuple[dir].out.ifindex = info.outdev->ifindex;
-		route->tuple[dir].out.hw_ifindex = info.hw_outdev->ifindex;
 		route->tuple[dir].xmit_type = info.xmit_type;
 	}
 }
-- 
2.47.1


