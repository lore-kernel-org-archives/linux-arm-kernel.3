Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=; b=P3HhUk/AdNb/cn5hmwFz2wl9W3
	378o7zrLI2wIMVLp1ymjGHrMffGMfLstY/PMxTjuKCQwxxxW9loz4TTTlP+LdH4TiR42Ba6kZ93Ou
	yMj/EgUlir3YaUp2mh8fDA/3uXEDhGJzMCPRusnLs3oL+SocYh9keDc7IfIdyhm7KRJqq063rsZdN
	r0aFZuRUJ4MCKgdm2nLCrvzBcJCYjEqNndSVeUGGXvT0PubRTTFWD1nEyeY+aFzT7/VT2r/nEJFVY
	rmPxQCti9CMAu60UulzeVAML/y5Q8oSFd34eiOMns/c9K+O0DaRVr1vzWq6NevzJmHaOr7raQY6Zz
	vdJDRzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to74u-0000000Ccm4-1r4W;
	Fri, 28 Feb 2025 20:35:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6me-0000000CYN1-0Xmp;
	Fri, 28 Feb 2025 20:16:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaec111762bso445610466b.2;
        Fri, 28 Feb 2025 12:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773791; x=1741378591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=eAhPdJ9kDqH2+mJcHBqQijbskDBwoZKsOsGF+Z3GKZp0yyrKUrAmL4CbUviq6XpTKp
         S9XDIhknke8Lm5XO8gR9RjofoJ2GUFPlO4i/wpb0z3kZGwLvAoki2rCZniel3A/6yyUb
         8O4LxW76aX6JtG7BE0GzQlP1V0/uvxqI+qfF3xJBSlSCDSKOskeKvZG4LOYt41BsY+l4
         e+oUaVEvlHU8uYV5W9fgTKeKzuhKZOavsLBt+7ApYuBB+2xPvHRzjRRY/FJQkLzsceZY
         uc/r7YeOiGrp4O/DsT5gI9faVVfEaleXR84UNqMB/a9MIBNa72S8uacJc4r5GsFP/hZ6
         VqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773791; x=1741378591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=p7syLzjM/sgsjlAP+XFfEeCp4iwppYr+4LVP4zQOoFYLjgeAs60A4nf/tz1JxxkjZw
         4z9A4TQ598rJvm5F/l9cP+hXwdAErPK0yfVHMwBcwA29IKArm3AVyu8b73gn4sQe6vdt
         Djih2PFNFnqZGTvrsBj4KRSOQFujZxZ+yMIzbfIZBeIm+/EWL+RfLRO0kMGZfMbzesVU
         HjmPgHGhbQqAMEea9av+2sPRtmd/iTeN9a/o0b7EoZRACbAl/oGJ2o1miAexoJEwIeke
         JQt5oWWwKSA8b12yEpK48yIXSX6a+izU6VvF2BtWKpFTA5X1M4NxN+QPYK3wzqvoG4PJ
         SAOw==
X-Forwarded-Encrypted: i=1; AJvYcCWk3Qw1GvyJYiPtLMZLZ2LR6DnpM9Oo+cOH8qfD6r6nFKtIKNU7Iz0QGTc0MMHeWfOaf+wTNXWrq0I/2TpzIZQl@lists.infradead.org, AJvYcCXx0WgMUNcoi0cJSYnkk564M5B22qVxAkwYOzJiWlJX8QN97ZQx+vMmxtZGZBI3ZyySaAS87AaXDSBLjsKN5Ow=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuNlHqC4jg0RXW8UdRkIu7+70oBbaRaTKtoVU3YaGyqdmpbjYZ
	oXvCxNYrLxyjKbz6uC6hnljCsNpvOXaJrgCo07JfrQRD8XdWrCYsXkbgytXJ
X-Gm-Gg: ASbGncv57kceu6QvvlUU2OGgarSUnhKZn92RVqsqpK3Hk2BzwUM6n+HWyoYZrdPwqL1
	AapBFfaWSaNXpt6UrHSqlTnUsgFpsUuY9pOTotQ/2IKTGxx3rj4VsHHDl7lav9wjTNwTFy5KWZO
	pfg75gf0tLNoOA55lz6xfo5omYj5ePmT8bzIEEyDL3FBI78IeZnfhukPa2YR/K1ijUTDvAgKDmP
	j430kWfrZW/sENKQzeMMypSLGIg4gL8tA1F3E+XeleAzrVlv5QdqVnjDxlxjNhvyABHNwDJGa7u
	BsF15E/eKL5JfIb0UNm9ffsp/v0/buVNzHHQElM3VPPaZN+ewkqYgP3LjVg6wXnSuaYmiynrMFh
	bBVEfwsdjpUZJF4EbfUIhpqgx7125Ix9R0TN+VXTHV0Q=
X-Google-Smtp-Source: AGHT+IGIlmp0gTErSS4DfDNJ2k0q+U7DXk7nnE8hCWt5GhbV6qmR8RoCNHygavxB4lOMiFfar//Acg==
X-Received: by 2002:a17:907:3fa4:b0:ab6:d7c5:124 with SMTP id a640c23a62f3a-abf265e8ed2mr386410966b.43.1740773790747;
        Fri, 28 Feb 2025 12:16:30 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:30 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v8 net-next 10/15] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Fri, 28 Feb 2025 21:15:28 +0100
Message-ID: <20250228201533.23836-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121632_170898_8D5B1D60 
X-CRM114-Status: GOOD (  11.33  )
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

Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
the bridge-fastpath.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 5ef2f4ba7ab8..323c531c7046 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -421,7 +421,8 @@ static int nft_flow_offload_validate(const struct nft_ctx *ctx,
 
 	if (ctx->family != NFPROTO_IPV4 &&
 	    ctx->family != NFPROTO_IPV6 &&
-	    ctx->family != NFPROTO_INET)
+	    ctx->family != NFPROTO_INET &&
+	    ctx->family != NFPROTO_BRIDGE)
 		return -EOPNOTSUPP;
 
 	return nft_chain_validate_hooks(ctx->chain, hook_mask);
-- 
2.47.1


