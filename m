Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A817C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=; b=jn06SPM7tVL0Yhjzb6nICgJAgY
	gQacSws5m/+mt8IfPKQwMS/sZaOgZO7UFJfFawZKo+sqIYy4NPbK5VMzsNhlfTCvvP5j9hRmxv40l
	nq4jcr4uMVeA2SbO65qTn8MqO0dFOxJ7dkKb5lB5TAEyXrDqP7TdNksTWYMHyHpHvdy2GNqy2J6Ca
	I+7x7Oy0AYIM2FRm4th4bbOMnCeTIaeeYfk8G8tnUfhHOatVvdyJK9TxBVeqKbkXL6zvvJsOTJK0J
	7gkHoX+GaH6Gggr92HUv6dDMerTTnf9kDPd6b9bdd+sgYf/TSJrn/7LW7hhdk81NekkTIVX7POVwR
	NfTlm4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnhx-00000007zRf-1EOm;
	Wed, 05 Mar 2025 12:18:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm11-00000007gTJ-10Lp;
	Wed, 05 Mar 2025 10:30:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so10953167a12.3;
        Wed, 05 Mar 2025 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170613; x=1741775413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=TwoitJDFWfwqTdJgPuuSejmYk3lSrygONh5QeUrW3ru4hnmLmPzZiTjiH0YreDenrn
         YFDtCXb0RMU+z9JZIDXBUbh91f1uWcgk47h0+cyshpfmSoKb+66rkjtHulcFXCRjWEVI
         kAZlEYTp1hXddh+vQuJq6/vzl5+oinUVIGYpIjkRXTC0pKcGqaaw2MKp/itsv6TNRF2g
         7RODzKScLNx4+019eDbp/zSewoc7HpR/tAS0sXnx8nZJDIyZ5xtyUWi5O8HzGDcayXLu
         FPpZFFViZVlBzdZHnDGlVZIMQWwUOCBte6SslHNk2mZ3dNRuj3rqSz3DYcIbF5J7F7/8
         Ejag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170613; x=1741775413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=R8IhQwY1S7kW7s91TluhkR7wzJBH0sSCd76zCL0d/SD1hPabYJcTDWNAKUdNHTFtKl
         0QNgJ02HYIgUyOq5rMAdi/KJET8Q0Euv+qQ0H8Kp3EI0K5y0TDtBCPcZGJELBHmqbBkG
         iHKCTDdmvHUGHVZOBtbdOJd7Fpz6v72vlMoe5WLmQFiU/GTfyLka6HPlp5ur0Lgrtbog
         roAtPE2I++IkmydRiom3H4cmAeFLkfMQ6lA7ZQ9WQAD+oeY56ZCZUl6rTXLFGqGb9d/8
         vEaj3pxPfotq0Y+CaQVz/tup8o4lm98gvDIRuCiCvsdPyl1P9eZtfeYGZLqP2+4IngEK
         4XTA==
X-Forwarded-Encrypted: i=1; AJvYcCU5w7yF4jmr1bURaYgtppI0efF9puvNhgOsMY7IqPDzaqW+F0h9fuNRQXFCED+bTHJMzTspoL1fA4ofYEolhMTs@lists.infradead.org, AJvYcCWtQCUFz71Tnc224TRcP1sUOC2wMHTqW5SguAhuJRT7/Xagned9p0ADYLpPUth93XqDukb6kv2NOU3VZA5Lw3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGQ8S+vzGNjbiOr6w/wBHrmoWNMnPVxSTMx3sQy4E450H8c53w
	9Bhp4NaPZvRTu347AyEnAOO9nnfvR6VIdS3DSQ1RH8pfZNr1NP15
X-Gm-Gg: ASbGncuWIhMF3sMipNLTIUiDEMj7mW+XiuqENh+AdWOLVzc2XWh0zWLsOPaLhq/cmCl
	2SBCkyfmBCOM0pVFwL6imz3DmJHOs8MQFlgoUJxao9FVRcUcGAyf48+r7ZaqMtXPu7vqgykVkfQ
	jdw0ceZ84EwvVnmJMk9eiB5ZsWwUjvjxBVRSGbxW1ba93G+CXBSVn0Ngr3k2s9fueYr+gtkbOn+
	S4fOsRMbKP/onFgr6RTLHQoROFRA2wWaTLjVQnIw23bxcnhiU0Ym6BIlbPGPaWHVFfdvUsrFNOa
	eK3mYpUFaaP0AEpDTB6LoVRUpw5xiFKPESOunv93uXd3oGFf/ILWicAwr7sOpc6xtQM8d9Rct7Z
	7K1COFM1as3X72mYrU54xftQHJ/snwL0fAw6G+aSLB26DkdPMTRI79FvFiAM49Q==
X-Google-Smtp-Source: AGHT+IHkGwcjTfVbXx6eVRlSW1bPJWg7ABfB6LE3pcI1ePV03v0+a0Kiykk4HhykJH2czK6vrMyHQg==
X-Received: by 2002:a17:907:8b9a:b0:ac2:c1e:dff0 with SMTP id a640c23a62f3a-ac20dac2643mr219805866b.19.1741170613297;
        Wed, 05 Mar 2025 02:30:13 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:12 -0800 (PST)
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
Subject: [PATCH v9 nf 08/15] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Wed,  5 Mar 2025 11:29:42 +0100
Message-ID: <20250305102949.16370-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023015_295474_A0CB07B8 
X-CRM114-Status: GOOD (  10.61  )
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

Add nf_flow_rule_bridge().

It only calls the common rule and adds the redirect.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  3 +++
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 4ab32fb61865..a7f5d6166088 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -340,6 +340,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
 int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 				struct net_device *dev,
 				enum flow_block_command cmd);
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule);
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index d8f7bfd60ac6..3cc30ebfa6ff 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -679,6 +679,19 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	return 0;
 }
 
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule)
+{
+	if (nf_flow_rule_route_common(net, flow, dir, flow_rule) < 0)
+		return -1;
+
+	flow_offload_redirect(net, flow, dir, flow_rule);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nf_flow_rule_bridge);
+
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule)
-- 
2.47.1


