Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF79D60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u3z/3aqnlj2QKTkwMuuz0nzsflPHuugQE1+9CzpwS8=; b=dNbxNQNcRTErJZV3vpscx2ielP
	FG+PVoe7uHEQFu0Ws+tN8rCbPVqorCnGE94vndwT6WjfGfOGKYssOhWMzmhYtQkoPEMJPlto23Siu
	pGcKXqCdhSIeQuQ4UiMaaWSWSsnZGZRSK6lsl+rT2XYRGONu+2Dgba1XNc67IHru3tUJAHypegV2u
	j2OM1hpI8ZBTFg+p5q8yQmvJh2RdjVCZOoqVPbzmUlB2vIcL6U1Nvshbrk9bozBuF6yrWpTPnzcXO
	slgDXYS9AodUR1jSMAQgvUNI8DXDk/yH5AWr0yX3eFY+ByzJlkve8P0MApEDAvhcf4kwZRB2NvgE6
	o+LFKNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLTT-0000000C3Ud-05LM;
	Tue, 19 Nov 2024 10:28:47 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKW-0000000C133-3474;
	Tue, 19 Nov 2024 10:19:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539fb49c64aso4245511e87.0;
        Tue, 19 Nov 2024 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011570; x=1732616370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u3z/3aqnlj2QKTkwMuuz0nzsflPHuugQE1+9CzpwS8=;
        b=I71wXhw0BiSfYNzWGGTNo7H1Jzug0a3hZrsryw0lZN+Cg7Ytx7L8Ni8tfrUMdHBvHh
         effNKDprx4A0PU+219AchW/ThZ0uuEjA+e/EOuuuHrsh6e7t3wfVQNVeG0vCc6VDAmjv
         k8GINAubwnd4sJt47HIaOcdMFKPEKBjw8W+FvY8e8DDeWCuUYQfRh2j+GP5HW/eZOO00
         Q2+Rev1pWFUMxM5/pXPgmmGbb7OM3yIgYTqC6JX4GpoCPaYUN6YAjHVbD9VkVSCv8+vN
         ioiRS3IlVB03YZiZKfLYoAICLuCNplyZ92HrcuuDj3uTNE+S4YU50tjrAuPwqINtNPSQ
         j/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011570; x=1732616370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u3z/3aqnlj2QKTkwMuuz0nzsflPHuugQE1+9CzpwS8=;
        b=TMWT1juVAXmi6upwjUwKhqq+idsxRkwe/9R1L4zyd21r4KE+qka2yZSL7g5unhaKQm
         qYSSbSEJnC+1MXndlB75fWRq8S2Coe4wStrz2H8wKp+cyKdjXQ250Z2Fym4pV7ghwyrO
         pjha/xWNwsW0T27yP9G3a5sxxPXC2Urx0OI0PsxX8o9VOEjLa2bYBuQdufn8EPVyGflO
         rkoAR2jtaBcW17kz0+UdYGScKiebuqegltIFVKXcha6B/atgkwWwCVGAT2HJqFtNzA41
         o7TXIxvyXl9FnXLsWWUr+wMzh/Dllc5rXIJE1h1Kmp4LHJNnh55Db+Vo6LYwh6H82OLJ
         YkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFugoRDvG5hDh8YDcJ8+lcLi6Vt16CuEq2oBhVHZsvqdk0bbCKsQVS4ZhydtKMhitD/P/L4czjw1uT1XwBJvQ=@lists.infradead.org, AJvYcCXyJHHRkW5LN7iTFCRNyEfJSOkU/KP4BUs2VQOrrjwjbefbpsLzvjWEpQ94n7GtevSDy0sU1XidyfTq5fEX2B9L@lists.infradead.org
X-Gm-Message-State: AOJu0YwE7gLV/Y+yJSNu5zKchblDqfCH+UuR86bJefwrTNyf8461ptqM
	HkCt7R+CjfhLxDBlPACGK5UTBWBsZ1ZxVHd0KR3N9dEb8D0VJvIn
X-Google-Smtp-Source: AGHT+IGkiRcx+4ntGYaz++MVtIBeL1R2ddFZ1Ewy1ZLQRMvnRephj/zyQ1UBYhWvJx/x9a4afZDUfw==
X-Received: by 2002:a05:6512:3044:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53dab29527fmr10641351e87.4.1732011570368;
        Tue, 19 Nov 2024 02:19:30 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:29 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 09/14] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Tue, 19 Nov 2024 11:19:01 +0100
Message-ID: <20241119101906.862680-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021932_770412_BA7A46CF 
X-CRM114-Status: GOOD (  12.00  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index cdf1771906b8..cce4c5980ed5 100644
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
2.45.2


