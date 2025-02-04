Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6831BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYHS436MhCvQPNlHTWPNiRlg7kt4orCDQn4NLGRznHk=; b=cI9pJ4BZ+3b7fwlvVRFlOXY4E/
	sFupo5tCuT2Je/XAHK0FNn9AXl65Ye39CAc89Cx39tCxmikXylycgxZHJvNNLNTwLCXrjRojh+yA0
	q3eOa7Oyozf7Uyg3wgwyXWxbmMPyg3F/ZIDu3l+3J5rPkwHdZzP0aagbFGubQwkXT8S+J2AZrFt9v
	Nyb+kSeGHf5B0+RY4lttQI5OGPyH+jrL5UcWwtXlBU0XOtraINobDJAtdNmVhcuZlVdXr//bNK8a5
	8n5278AHOyoTpjWU1HTVJGC50w072QvdTxDICHwX6OqK7OGU6vFeqY5xra0VjDUct/IzX4xG41OxG
	rpaCHLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQHA-00000001ZKe-3jfB;
	Tue, 04 Feb 2025 21:16:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvj-00000001QJZ-2JEG;
	Tue, 04 Feb 2025 19:49:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab751a7f67bso126146066b.1;
        Tue, 04 Feb 2025 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698594; x=1739303394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYHS436MhCvQPNlHTWPNiRlg7kt4orCDQn4NLGRznHk=;
        b=jAaRLHCf8qz3h6toHoFEJyJt92/k3IZuzsb0S1M10i7FTZBrxJwxUt3wCtq6meZa9z
         1Ll2dX2xiec6/TuRF9rDGBSh+SFftAfNpKziEhriTrub93Qe7jhdxtZVJ/jtBqp7GWIc
         qFVnmO4inVjJo5zWaOexqnAuNFCqoENOmYlF+ruRS9hqNuzgXDmtJ6DOzGi71b3EYXYe
         hQ+yIY5bXkGMoNSb1Rg07HX29qDj/06X3JMlmCsvd+10uFYnL2//8clpUIWBwdDfL9cY
         sMeAln+jzHFFPffN4NxoVPjRZAyFK3jNecd4/Mo5XQXH/PjngsWM5Modlzd92v6pqFcM
         Qtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698594; x=1739303394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYHS436MhCvQPNlHTWPNiRlg7kt4orCDQn4NLGRznHk=;
        b=JfaNQ3fNb+qySPMT2HUAJ2j7Kep3hPM4ULl8R3IlCGIGqIow5PAVwqNjIx3ewd04lZ
         qFs8jHxrGX0M4aKAc2YP8Ob2bubDltVSrqz9iAGQ6EuZ1N7RyTGjFbeOSCXcBAkcEVkM
         l+y73yD9JBRtr6W1ueAZ2Vpr2LOSFwNC5J2LA9Lc23lckZugbkUv62/rN1p0LFKYPGxl
         ttsBlBziPFgTmY6S7FwLn36bYmBvSgumIw/E+OcKwgKQ6gN8DGeoFPpuLa1Su0R5JXLD
         LEo9czCjyiSgC8sHn1teriKsG0tfuFb6LbGgnhc1v1UiBcKNLVAm8fP3cBoJrt0JU7iq
         0SDw==
X-Forwarded-Encrypted: i=1; AJvYcCU10qv8cnyV8ybLbu93bN5Ad+IEpyVPgmUOjS6C/rth0Bk6rZLX/Kv8f6h+W6AzU+aHxOYZfWEb/bZgX+AAAo34@lists.infradead.org, AJvYcCUnGS5FO6eMVMXJw3890FJfSeu+RBV3YpyBnis3VsaNNw9jxHLYVViPttokcAK61RQKeKiCmpZUoSU8yDN5jKo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOS/3p0hQspssvf6NyJLr0n2CFS3YuPkI3qTZfleRvL5C1vWND
	F4b3ds5Y7Hc4A8b1r41qTpERd9m3GCxT4pkZwAeBLekjoJEhPZRp
X-Gm-Gg: ASbGncvUdtEjlnCoJlgsjsVVVfxUoiAvtoLTgZDkr6kdR5Ns+ppyouQwaK873ybYPVC
	q1SPz1rzm6c66yXldltez3C+iPzbFQqRoYxeCTPnqaVJ9M+mmhvGRYO7W0FayEyQXg5snP2A/yB
	gNMv2Duh/cjE1XAdyBQ9SJetyS785nbHslVp/GS8aNnqE3PhLSpEZLUmrU+4UBna9Sn32oMtDQm
	WEL21Ql9ACa9lfVjrqXnUzAEJeczxa+iP63JQ/go3VgnAx6EnJ6NXqpIRxfFGDXPtzvLE2Y3C17
	YrrG7RtU8gDnFSbnn3Uo8k61NRQFM46F60dI6f9FNDxBng+jzQsM1d/V80lJZ9RAsdV1R1EiFoU
	scECA08vXax4jld6zKEGSpsTf+n2P3JwF
X-Google-Smtp-Source: AGHT+IFfJwb9MQyefWJ9mzFYp2BV5PmqGkhxPrYjuZLqNPTns6xWOMQoNOZAbpkulbWsZqH9uAZmRw==
X-Received: by 2002:a17:906:1691:b0:ab6:d686:de7 with SMTP id a640c23a62f3a-ab6d6860fc7mr2382446866b.44.1738698593832;
        Tue, 04 Feb 2025 11:49:53 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:53 -0800 (PST)
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
Subject: [PATCH v5 net-next 02/14] netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
Date: Tue,  4 Feb 2025 20:49:09 +0100
Message-ID: <20250204194921.46692-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114955_586685_B62063E6 
X-CRM114-Status: GOOD (  15.21  )
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


