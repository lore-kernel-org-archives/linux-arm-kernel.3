Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F2AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=; b=oMX+BpHngWNByFadptT7bx/BSz
	8tTcndGCFLP2Bs4Ule8mNDnEtz0t9UBqld+3JBNmrQRs1hKxLgBAVi0tNe7pLBLIcfQtVU+02jNwG
	korTeckvM5WLH4YFuUjxsTDpmWsFR0PFTUfhUNfqJBvKe3k1cAbGTDhNB9r/NZvablhAE64DGQ72g
	Otk7OSwUO8cBzxm3xY0ekEuyIxqtBg1i8EMwjgLGM0KWJvxNhZfwbpprYyzaTAYE3sES8UKtTDMRB
	apOLrpU0zeer/8+CJNZZoAPcXcQH6KFFXCSAdcprQoC7jKQWRsgi82bbAA0YhP7ajN1QjGp/7PYP/
	0K8kDx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1za-00000001S2X-0DxF;
	Tue, 25 Feb 2025 20:57:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M5-00000001KgC-2i0w;
	Tue, 25 Feb 2025 20:16:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so11089512a12.0;
        Tue, 25 Feb 2025 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514596; x=1741119396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=PRC5ggObCR4HijMGj7Ku25gjDk8gtWlxhMkwDZ78gRudoednGrCH8IMx8VxR6KpQ+k
         0yw2ZhrO1uxLw4pDLNjdvuQrk/ST3knX282PfBK6zrK2xXrEIb6SeqeQZbd/gt6oesIP
         CGrHvrc5TSWT76W+6HTxbVq4M+r7wUMcn13NplqlLAF2t5LJErW8d7CFrE7DcACCjtsj
         LNgjKkGjOfXlKaHraPKQMzKicnXD7ovSqmK6iCEzU6D0quQvUXvx26IkQ97pIcTyr6Fr
         AujQcpok1o51jcJNwCAcN5xytyXpv7DeSqpDugBWdE0YYce8DU6xC8z9Fy+3H9BjeCmI
         xcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514596; x=1741119396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=d/pw+5EoMHiYptRX2Kt/0vsvrukqNG4YkX3vpkPSNvL6B18/8dBb4IRxGKxOF7jXBZ
         rt67MX/8GXjnhqyIFvmFLxsWxD3odgfSXeEGdfy5p1UA1jLdYPtGZoHKVzhAN6orAGHX
         f0AYgaRelnQoPkWbg1bmTfcpoqhjfnzfn/xEZJC/DvgItyTn5ltyePmi0MGvA6MagnsC
         DgblQEB8irbbwpBBrvPB4PUo76ThHNYhsG2C+S/LO3dWcNVlAumzCvM/YKrnaE0d+mY5
         4yM5RGT1KKHqf7y0tDxYwxSw7J+9lPglUjUwkqOemJSPOS4gKLIh2rtCh8rgtWF5ppUH
         sG0w==
X-Forwarded-Encrypted: i=1; AJvYcCVsQ4vmnTAh3YFKHknRjXF4ON4q/mwuj+XcLvBVoRxCNPieHGqoKT5jsjF3YoCzWZh5grlpHsUaSyLVlD83Tz4=@lists.infradead.org, AJvYcCXnkrKJYzX2DMwCTaCDDDDmQ55GXwaoH8a1GR/yqQrAdPg/XZfxdlIn0h5u1LWRqX6/Fg7B5tHxDTFxhjtZXt25@lists.infradead.org
X-Gm-Message-State: AOJu0Yw21WeHR7wirA+gBzocbtiCyoKtCIcFYM7uTR771sazvEimqqhA
	UVOkYBEHvf4iBroJDKrRvf8Nh5MqwKqUs/BrrBAFu3XdvDOEljzl
X-Gm-Gg: ASbGnculHUqEhL7655xBTtoXVc426cOAJT3/q6A0I6jUUzQ1RAGlVM9ZvlH3A2flDs6
	mli7UaygXcoS9ATFFgkjMLmOtALca6PmaZ9d8g/uCijKDLPey6CGJN7qpnXoQ2N1ZdTYy8F3dkj
	zpNR6tpLh8iBp09XGPmdgShBEI6TFocwxvgny4gCqPTnH3/G/ULIVjzHYDSEJLKuNlCd456vluF
	YPiGdh5Tb9jYQfF/Ps+uVnkdIwVTaWmvFPKK0FYmAAZNqb0v65PsevPwKtrusFJaX06iRUwhNvG
	d3MhTKUVEoevLNgBLDnS8d+/Ukhk1XkSlOWLgCtCFql43LrodYysXunqjIzHsYxrnQvHdNv7zXy
	aRdV7h+5z3SKjWTFFZGEPes5vn3QqemE++SZvCJ5aswQ=
X-Google-Smtp-Source: AGHT+IFQrPMr/zga3A1PXJqgdsJBXZ3US5klRSnZht6r010E2CvDfRMDZ8BFvHY6Z6/b4s4s1eKUxw==
X-Received: by 2002:a17:906:30c4:b0:abe:ea7e:d1af with SMTP id a640c23a62f3a-abeea7ed9e3mr122695566b.50.1740514595791;
        Tue, 25 Feb 2025 12:16:35 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:35 -0800 (PST)
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
Subject: [PATCH v7 net-next 09/14] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Tue, 25 Feb 2025 21:16:11 +0100
Message-ID: <20250225201616.21114-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121637_689689_26E24647 
X-CRM114-Status: GOOD (  11.58  )
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


