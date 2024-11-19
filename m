Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F8CD60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd7MVftOQ+4b1SqBzhiH//oS0+6ChrCs4gWAypG7zyc=; b=KPzMCUvTlkWD4rVj5K7meKFjmh
	zqaZcJCJ0Q/WOWHC9CwxJCfRDXxVILb6MUjS0HRC0vWCrsxNdNLvXqyr5oUumM1mQmsIEFwRTT93u
	uyhuu85qS5dKr3EWb7cjVZ2TKsyrgR6ttv8YOM/R4oMAzCv4qYbrY2PBGJX9okKOUAOUrZ5Yk3k+5
	H+bDX2CrINhg7qf1qUF9vF7GhGX+HrHvgs+DhiZ879ce1z93JjkH4k3XKYN7PgrV4INrI64HShA8Y
	k52lCoZARJMfZKzql4+amOE+h/s1MN52x4rPd2sQ0f50D8tNi3/DxfpI66ORnMK8/tqhuxTfWDOQo
	s6tzg/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLVI-0000000C41f-1DF8;
	Tue, 19 Nov 2024 10:30:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKY-0000000C14A-3wDK;
	Tue, 19 Nov 2024 10:19:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so1205830a12.2;
        Tue, 19 Nov 2024 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011573; x=1732616373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kd7MVftOQ+4b1SqBzhiH//oS0+6ChrCs4gWAypG7zyc=;
        b=lJXiaU/gDTLKlWM35tbCLFh25ZWemcQvFt35hRcLojPaWP1VvtohDC1ze82yRiTBM0
         ep8gZvdHhQjJA1hoKI8G7PpqHn19mUsYxyLg6R7q1JL75fBlQIjWh4njqQKkPZ86oS5X
         auuLQYC5yV/Zc7wPqRlXk8MgJmnfdrsf9TVVDXoOThH5NP6Pj7SUyPW+3cjmQVMMAUzi
         sxkxB2fqI2hAyZgEsxiDWSp3d9GIuQLC/gKBqnLkH6pkG7+lscjEWe9u503OKl4NJkzf
         mRk6tWe+uMNOCaT1aH0PCKHtAZoGxg1QBT0qmW+Mp79G0Y5/YPvH14RkpX/ikFs2fAaY
         8/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011573; x=1732616373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd7MVftOQ+4b1SqBzhiH//oS0+6ChrCs4gWAypG7zyc=;
        b=PrkVfo6PYo1IW81cT5B6VszGoQ+vSKwibb6n7VZ9A94DdNKzcrl1TifohXIheJ9G2P
         6eSf4tS7qshKcfsfSVyGksusLZj7+qGmeDa0J1mIYbmmEgJrs2AV1sv13TMtjl9F39UN
         swfou/GSn1LbcrZma60EWTkNxZ31RMRpNb4nWrfbIkXT7V1dBr70HcDeBm25GSVsiVm+
         fsQN5Y1xKUb4pZU+q9REEodFegHXnFIVqjq6hHOOFjtz2H3ijIy9lNFOjvAssrjVxHTf
         a+vqFC6flaez+dnsblpqdX5A9I1RZcfrb6YHe3P0B+5olLAlAudHk2SA6Ti66CGNYXfd
         yuAw==
X-Forwarded-Encrypted: i=1; AJvYcCV83iC5e3zsOJfoIs0eFTBrA8AzXVEPEg9OaN6K4ubFbYJOxktpZxVdP94MHTXmbPFLWy4y5VyGfL7gPuSKpzwg@lists.infradead.org, AJvYcCWZlS/fk5oZFi3vpbQt49uVlNmBKUMfCmHuqS0jJIioKacKG2YWRiucc6MmHZVgpDUS1jntyDNS/bOjzT8acpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwvrBNbFaF8V1gvXw+Y9/AMC7At+05DTFTnVCYTUi2IbZrJZB4
	bHZ7xOZxswV7R/KdvBI1twC+wukrILGbhMu2dd3YTVcxOGPe3aiX
X-Google-Smtp-Source: AGHT+IF5+KL0F1ms3SncUyr2N9wLbMEErdK4tEsHN/IWbmagzPDJ/Hm22ZABIXpU1FMVLbP7YJ4tcw==
X-Received: by 2002:a17:907:a0e:b0:a9a:4d1:c628 with SMTP id a640c23a62f3a-aa48352c0f5mr1451198666b.45.1732011572868;
        Tue, 19 Nov 2024 02:19:32 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:32 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 11/14] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Tue, 19 Nov 2024 11:19:03 +0100
Message-ID: <20241119101906.862680-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021934_974545_6FB6035F 
X-CRM114-Status: GOOD (  11.78  )
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

The bitfield info->ingress_vlans and correcponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index f7c2692ff3f2..387e5574c31f 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.45.2


