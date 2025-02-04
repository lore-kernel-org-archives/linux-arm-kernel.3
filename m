Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B0DC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfNQ5cmnsawBulJakMMTQobb95EzKwEtX4OwcNbEVcc=; b=Vq346DA4xzXf1fyVx6JDoixhK1
	3W8tfUjsQNGK4o7qYL9JCl3CskumsAZIlu5msXUFKvDUf3UCcZY8Eig58mQN+ggny5IAkKveArjov
	B2JOMqadFMQdglO35XRgq/8Ir0fnsE/AwO6f0Yors/Nz9yySoPFUPrrUB5Lik6ziApf4evJ8iYa4E
	OghU76Iy2DmXZ8pG62S03yJi28k6ZHokYIYoizP2DqBwcjcs79h7X0ES0bdM+ez9sipTo0lgGVKPj
	kBxulmIcqwGBTtsmlbXTdZwhN9h31rJQU+N+jQeCVcbswJsVnu0MzJcFcbZ3FUzXY9kuI+Q5LMLMK
	fFBj840Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVd-00000001bNJ-1P2p;
	Tue, 04 Feb 2025 21:31:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvs-00000001QMe-17b5;
	Tue, 04 Feb 2025 19:50:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1065049666b.1;
        Tue, 04 Feb 2025 11:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698602; x=1739303402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfNQ5cmnsawBulJakMMTQobb95EzKwEtX4OwcNbEVcc=;
        b=lTJnDbGMP8vszaANsafTJfezJah4xbMUGgz6W6cdVtvdy9Qv5vauk1S9LTM7ZxlYuw
         pu9cKPFH1cSjpGRC7IUZ1+mdeans1tcKvFuETGNwxWfbhQNXGsiUUCgbd6Jiis0dCpPv
         432OVi2Fu4Lqn0EzyEfZRSmkvdlb7dijhoklkzbXfE6+5Gt0wdnl4wvOtDP3W+rQdyEq
         iWTvVMUI+0+PfHHl776HM1MluFkmxCVHDUszIYpguYjcbri6BEai5X3MtFRH1dkh5ewj
         WyrKIkJajbrjJyHDP9le+zEh8Ar0MLWJODOTr6qnAf2KAutsTRI67Nlz2TZ0faAWEq7F
         sstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698602; x=1739303402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfNQ5cmnsawBulJakMMTQobb95EzKwEtX4OwcNbEVcc=;
        b=X4RpY40QxGV0b/6W0M09JEz5Hgt/7370iSVPdzrHo6r+ZCEJtD2GI1A0dsl0vdBDAB
         b6pqtmkvoPla3qck7oZuM18WbAa5Q+dkmx35EmjlvJ8/vl6+U+Z3J/9vKeqlJvXRBp+h
         4UimP+LM6WEKIRxRqehBOEOT3+XgZOztPry+EgPIV3fWABzc8UCu+9aDsoCFfb/8EaLZ
         zNdwYrl6cNFClFUtun6MKQBvjdoc7q89dwZdjBXPpLs9+son8OYeqJ0bbsjs8gh1BzdK
         rZk9OJRPjDQPp/kz7OyWLyQc6AGVWqg8hAgMOz/TMIUm5NggYfI5DpF1wVv2o1uXEeGg
         xKIg==
X-Forwarded-Encrypted: i=1; AJvYcCWSlh1H6TG9iL14uiejWigzsZMd7Dmb59vHth7c0ecUmaseweknj2if57qkby8HbRUTAvGlCabKjE2WCFVgRj3Y@lists.infradead.org, AJvYcCWqjllmlJvpqftF0FA+qWcl6aqJHrsLoanMIWpGF5yA72ssn9DoNAp7dTGUAXUWSf/SIE4KaxWSOZhAiH5hN7U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyom/2s9xqLA0wJWTJ2T4kbYHGJ5BHENTxDbd53LdNEnVHnk4gH
	5WSGBlRPqohhN0+uwV6MFOvHJwTUQgu/t+vxKZuy88m1TnpqyRGx
X-Gm-Gg: ASbGncvP9b4eM8/37Cfc9GhOqwhIrVRCJNTePdOOEUTqghOm82xP8WWLCbHGw368Gme
	48XhIy7FevqtWqC2esfdpHkEK0xDZR4hUURhYVrAEi2KukRe1lLB6FoOjWiqF7ggXE/0W4cilGg
	w0y9HZwOG+7jCDxGbQig+3Yg8N7TWuqj0JumGd90q23UWx1Q+1Le06F/tknnH9KMN7YDFRK2fYZ
	ef0EOzY3yx5pBrFZTw0wIRHwmtzNNagxv6BnfS89mobOQaPGR8eiHf/ZMZyWzzKLg3HKQplS8AI
	6cms3vOf8kYKXiw9vN7fZdCZfpGkeb+SWCz5CRzbzJFykPLgq8otbTU4AZuxzupXmruWZyCdKmH
	ODFT099YhRWephm5Jb/O9BoDtwtJr93zY
X-Google-Smtp-Source: AGHT+IF0i6wSQMkgrmjCQzY0taa6wuEGcCy7CIK6oAwJpMPmap+r+O5XJX2h9JbKqG9hmQnHQyXFmA==
X-Received: by 2002:a17:907:c0d:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab6cfe41079mr2625537666b.52.1738698602307;
        Tue, 04 Feb 2025 11:50:02 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:50:02 -0800 (PST)
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
Subject: [PATCH v5 net-next 09/14] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Tue,  4 Feb 2025 20:49:16 +0100
Message-ID: <20250204194921.46692-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115004_313598_90597263 
X-CRM114-Status: GOOD (  11.72  )
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


