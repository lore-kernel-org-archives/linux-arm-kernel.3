Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E1ECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLYtPbQjZgcuVs2CGURwKTgeknAxIQmlp31jFys2sGU=; b=PQ5iHSXOX4V445kjL0StuXvzl1
	Hw45/yMYerWMmJUnesdwewSK5VKlwCh+Ucs56Fz0YPy5m6KWs7382QYPmYcKOfau+oX3lzJW4NiKJ
	k5XIhFYgDR6mxhfU4o+9pOhxOS7NGWxeFrNWZB21R/B4kfSAlTs5skz7Uh954flJ3a8mLdqVObhJI
	uGJXq6+G79rREXJ1pYvgYtl6GMKRaYVYonUeMu8xwr7VG8NrGErIo3X2EQmkmpJU47P+3DbfY/3xO
	YY6Cu8NOZQJt6+rivb0rQf8ZT716gdGNWCPtWCDHf0uUlDi/KRwaVXdce6cPV8mpSmBaypsIgtUt3
	lbgW7Zgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpN-0000000F5iL-33Vk;
	Sun, 04 Oct 2026 17:16:45 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpL-0000000F5es-0Omo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:16:44 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so1698303a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134200; x=1791739000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLYtPbQjZgcuVs2CGURwKTgeknAxIQmlp31jFys2sGU=;
        b=FVPIdHuq66eilIC25uwgazE6GYh+35enWrtxOvIjuvDGnFtjKnt3I2SoI6z/ZTgd0E
         3S4qRakP8dWFyBOAl2qX3d4fDc+fJr5WafNGAP+3KeolphmH4dcUcjcPUUGZBe34IrPX
         IKrKdkGQG2J4TuaOzybc0b1IEdz1WT+/PziwtXw0/FeC8hoggkdp5DZUqQyquASAOWc4
         GcjLGYtBPiKriCQuP5Hh2eR5c8gNqpp88svlCgDANAGYLIaa+3xMf4NOoEtQrtlR0zhm
         /iImn3+xqnBc1P3JRd/WvA4Jv32PDIz9aJ2SSeDkjm/SA/Xsilgchi7esJilBbPkETVo
         UpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134200; x=1791739000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLYtPbQjZgcuVs2CGURwKTgeknAxIQmlp31jFys2sGU=;
        b=yjQh2Ip7K3yp5Q40uQ87zt9ezG6tgcYSQn95qFxycVOUzuFsL29432D9lv/DmdYYdx
         LKnT4CluwnJvu8pAvZyNcqB70y4J3U9ebblmEnQvMIEyfmOvK8IsTBrzsFeXJCLlqWz1
         OtpV59Xe1KF2OpdPVeAin/HlLqCHOEFu61Qag3GCqwzIkAe+SY477G+KUQ1Mrw97UMYU
         vYMfrMwsKqD3RNFcKL4HPaNyQzBWkmGmCiTq7OS5j0TaI0pW46yZ20dBXQICYIk4rsl0
         cNLfZakIHMYiR78zJ8LMXdlraRmDmq6JdOA2qv+lS40kre2pSmPwcxfW5jxjCcZk4Keo
         JuGA==
X-Forwarded-Encrypted: i=1; AKwUvBz9xNj57CdTiLrZR57JWpV/Ql7ED0oihmAsZlmLYCtY/UacLs4QTGdDntyirF3k6UbVcijkf96FjGQDADOHqdK7@lists.infradead.org
X-Gm-Message-State: AFq9FYKaZAv4RHX1gKKiKWvS3PhWVziOBcj5lIqzQX/3tipKVF2LA4/d
	7tw5JRrQIgjMhRLShQ6TIjmi723wotOaFo5o6t9BzN1doIeca+uTNo0gBTCAf3kmdg==
X-Gm-Gg: AYBFou23dm85q+Fu9eIXCZZF8C0kFw3m2vtPkOVhEnfPIqmA4iYXzVMXxQ8EFEujjJX
	d0l2B62AapQUo/kvXe/yYIzVEWDHNVtkosoEdJS/aOeadmxZUgTLDljI/97EprqE7LI5vL7Haq/
	u9uIT+c/6140krsLAWAPiWDflW63LyZSMz5BC6U8LEH1El3q5x1O5enp7COO0lne6IGzv8PhdPF
	N4T5j+IR+puj8rVEnRe1IV+fB7mnardXStSbUiGw1Z2PLpeZ8BG45tHyTZ6uLiIL3RYXu8tOgv0
	UWzjagx/JEfSiZfjgopVPeN1yDUte2PFGwGs4UuVOtWZuIQBO+XIVfX25kaMGFl8JK+0+ZYAinA
	/6st1fDwDVK1CHDMToXDRYLzzlLmWNAEmYFMMJyRSj5w6ce5gtia62a73Qu0jEffOPi9r+jBk2B
	VJ6QFkJjeNY/Kk0thKz3HH3KG8wRKD04Ba641nIOhXKKul89gO/Qz7nabNZyn1Gk4wH8OcsEVVZ
	yJrGHcOM1UiExgFdvUBBR6AixRbI+Q5g9Mhp6smpoTsFlwO6RKOuXrTDnrOTHbCOepNdOiU+ClE
	Qdc03im97XzzA6btMpnLvRynl9ItsIAUhbzeSk6RJzKMi/NXj2V7kAY3myk0sFqLG1oKaHgQ1AI
	uWjKjqDPYGaAq0YH0cu9cRv9rzy/pU1p/eba7+4E/RUwyWyR4dD9wI2jOY54VrKuU+EkzEOgCpS
	rxWYNf0mVv/eaKEOyIz+p0M1Kl
X-Received: by 2002:a05:6402:3905:b0:6aa:e46b:2ca with SMTP id 4fb4d7f45d1cf-6af9e2fe4ddmr6623554a12.30.1791134200443;
        Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:39 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun,  4 Oct 2026 19:16:34 +0200
Message-ID: <20261004171636.3545085-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171636.3545085-1-julius@bairaktaris.de>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101643_160247_EA8A5545 
X-CRM114-Status: GOOD (  17.17  )
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

The next patch makes the flowtable emit FLOW_ACTION_PRIORITY for flows
with a non-zero skb->priority, which on IPv4 includes the priority
ip_forward() derives from the TOS by default. mlx5 would reject these
rules and stop offloading flows it offloads today.

The eswitch does not use skb->priority for these flows, so accept the
action on flowtable flows and ignore it. tc flower rules with skbedit
priority are still rejected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../net/ethernet/mellanox/mlx5/core/Makefile  |  2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |  1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |  1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       | 22 +++++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/Makefile
index 19e50f0d55af..8bd352e7f20d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/Makefile
+++ b/drivers/net/ethernet/mellanox/mlx5/core/Makefile
@@ -54,7 +54,7 @@ mlx5_core-$(CONFIG_MLX5_CLS_ACT)     += en/tc/act/act.o en/tc/act/drop.o en/tc/a
 					en/tc/act/accept.o en/tc/act/mark.o en/tc/act/goto.o \
 					en/tc/act/tun.o en/tc/act/csum.o en/tc/act/pedit.o \
 					en/tc/act/vlan.o en/tc/act/vlan_mangle.o en/tc/act/mpls.o \
-					en/tc/act/mirred.o en/tc/act/mirred_nic.o \
+					en/tc/act/mirred.o en/tc/act/mirred_nic.o en/tc/act/prio.o \
 					en/tc/act/ct.o en/tc/act/sample.o en/tc/act/ptype.o \
 					en/tc/act/redirect_ingress.o en/tc/act/police.o
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
index 0380a04c3691..91a3bab5e498 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
@@ -23,6 +23,7 @@ static struct mlx5e_tc_act *tc_acts_fdb[NUM_FLOW_ACTIONS] = {
 	[FLOW_ACTION_ADD] = &mlx5e_tc_act_pedit,
 	[FLOW_ACTION_CSUM] = &mlx5e_tc_act_csum,
 	[FLOW_ACTION_PTYPE] = &mlx5e_tc_act_ptype,
+	[FLOW_ACTION_PRIORITY] = &mlx5e_tc_act_prio,
 	[FLOW_ACTION_SAMPLE] = &mlx5e_tc_act_sample,
 	[FLOW_ACTION_POLICE] = &mlx5e_tc_act_police,
 	[FLOW_ACTION_CT] = &mlx5e_tc_act_ct,
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
index 2e528b2c34d6..bacbc862970e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
@@ -81,6 +81,7 @@ extern struct mlx5e_tc_act mlx5e_tc_act_goto;
 extern struct mlx5e_tc_act mlx5e_tc_act_tun_encap;
 extern struct mlx5e_tc_act mlx5e_tc_act_tun_decap;
 extern struct mlx5e_tc_act mlx5e_tc_act_csum;
+extern struct mlx5e_tc_act mlx5e_tc_act_prio;
 extern struct mlx5e_tc_act mlx5e_tc_act_pedit;
 extern struct mlx5e_tc_act mlx5e_tc_act_vlan;
 extern struct mlx5e_tc_act mlx5e_tc_act_vlan_mangle;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c
new file mode 100644
index 000000000000..2a047059574b
--- /dev/null
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+
+#include "act.h"
+#include "en/tc_priv.h"
+
+static int
+tc_act_parse_prio(struct mlx5e_tc_act_parse_state *parse_state,
+		  const struct flow_action_entry *act,
+		  struct mlx5e_priv *priv,
+		  struct mlx5_flow_attr *attr)
+{
+	/* The eswitch does not apply skb->priority to flowtable flows. */
+	if (mlx5e_is_ft_flow(parse_state->flow))
+		return 0;
+
+	NL_SET_ERR_MSG_MOD(parse_state->extack, "skbedit priority is not supported");
+	return -EOPNOTSUPP;
+}
+
+struct mlx5e_tc_act mlx5e_tc_act_prio = {
+	.parse_action = tc_act_parse_prio,
+};
-- 
2.53.0


