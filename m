Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157AC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=; b=vIRCuFnKsof+jaj2U+RAOVs+yJ
	e21nYhz6X85uMNOQ78qvb4otLtSNX0Lb8dYlYaRqULwAImH80ZLptS6VQ9x/k4oKNE54aJRkBzTkc
	E4FB+hPL8FhCSSBvFJYJRJcTFMXXf5m5unpKjBQklbYd2yfG8uadoURjP8agqRMzAFZzFQxH89juD
	XcuMMD01RlBRCIrLbO4vv7rDqK1hWP0JNneZvQqfyr4pXyWxZ1/Sqm3liQHXJf/B3/RZQSQ2jVwg8
	rwYW8GAuQpgxulX0JV46bCu2CAQls1v3ldLCzLtKJv2Dg8nJVAxN9hHnbU5kNq4IvCmjyaDEmZoi8
	ew8JZRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDi-00000001gpD-42KO;
	Mon, 21 Sep 2026 10:25:58 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDU-00000001gcD-1KDT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:46 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e211a0so3049111b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986343; x=1790591143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=adC5BXX77mh4fCug1QvbJonnHvBogNmIuoN5Y5ykFRG5/z3YZMy8c4iKpslio7lW2j
         42oSrUyaFbZJy79UC27xNNzR4CFtNX1AbRr6CjOShMQGU8OsPI3IloSu54E7Yvzh/IqC
         xMA9FyuyIsGXfIOIAQPb7X3UT5wCqkfi9YkSJPehNxuynQoEqodhcVLnioW4mNNqSpxJ
         0zogtPHLqHF5AsMpsFn6NNoXZIz5Nkija4sZc24zo4c7TfYvIGBPT4/u0c+e0sxGtIZ4
         clYrW9l/dLzooBkVY6xzPb2b99M4t8lvY60HosOT43jJQiMEBsGJf5uNKl/htG8mRCAv
         WxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986343; x=1790591143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=WS61SCGpgTzPmNUryf2zVz+Ol/gxXzQ2QmIfko1jOlSVa7+zgRO9Nbn0Axpg22vdQO
         CpKgqPnMYhWTzJ4zaZsvlX2uAbiJ0CJEe8vGx3HThJvrVPIb8a2zO1rf5No3QQ4BQoD4
         xRUscZlUG+KsmLMjz13kyUx6lPCMDJu0KJegczGK8Q/TXq6Qm4r+z8sDsrjYsVp5okyJ
         hv+OHsIm7Sjnn51FhuXrDkvDmshxAXUesccbnagN8is//D9FWX7LlrH7PUHuNCNJwlV6
         EdTpB4jatUc/xt6G7ScjRKO+9QMXJgYTiaNDajGS4nzihMMak+2jpJeLtLs7FfTJYP26
         37/w==
X-Forwarded-Encrypted: i=1; AKwUvBzdk0QqqpAXhiS4ceP7lF3qLQAIKfBpr5TcaGLE7ebUoIN3m6AWHpqFSzuPs7GdJjO/GUTAHaacwWaJ/8jaJ+m6@lists.infradead.org
X-Gm-Message-State: AFuF++lWm8p62wtWH5h6+2xzQvFnVuXYctiugnITvKFKJlbpPleh+qTG
	CaIkuZqYfgNCCm1ReRz4XHv27cu9JRP4e3WspmvGrJsxpadPGs97BUUH
X-Gm-Gg: AYBFou1VNuzZVs1iXpivpCLXgRlTxkYd2cSAe7UEk4ZIMo3Vfy0TXv5tT4hdi1gvqOa
	0BaiettRZmXl0B3Og4cgVoxBAfye/K0QS7gOYY71u/apuMqt4rv8/IsISmSOt0PrHQfj3uKG4GD
	H3nVoUYSe+0rci7CvuK4xBfc0rVlhuvjppw5fvPA0eXGRKRI3b9FlDqM3/eA3aaPT6SmT4w2LZ1
	YooWDU6MM2aymRSEShBBDNngFtA73evvN8y2Nz1Ruo1Nd3XzOIe4QlX4aRokXL96ox+oU0Vb2hG
	AK6mkIfNZtLb+kPCMx1jeb0QDOEfC0auEIlEdhqCUCLgWBvGQKx1oE82c0ej2N5egLYZSqE8zZk
	YFVtI0GOdMtwfx4cuFylTzV6L2gZEjH8iSS+fKRwr+wEhm29soSDKCKH9tQeUUaPGs50tyGrgAD
	KsOSHOfPhsh0Xd6dEvTQNosfsvSDSmIcR6DMipGCCKWLcJVab4lKznH5n5KqA5luGrKX21DNAKH
	64OMUZwod79G1Y9mhSKVq3+7MiIll5PQzkZ/q8=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr14902028b3a.25.1789986343595;
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
Date: Mon, 21 Sep 2026 19:25:21 +0900
Message-ID: <20260921102522.1640072-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032544_442358_84076149 
X-CRM114-Status: GOOD (  11.41  )
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

Reserve the binding-defined CLK_MDP_SMI0_SMI and
CLK_MDP1_SMI0_SMI IDs with dummy clocks in the MT8196 MDP
clock providers.

These clocks are not implemented by the current MDP clock
driver and have no known consumers. Keeping the slots occupied
preserves the binding-defined ID space and prevents out-of-bounds
accesses in the descriptor-based onecell data.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-mdpsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
index 7667d88f0eb0..2d8997d34201 100644
--- a/drivers/clk/mediatek/clk-mt8196-mdpsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
@@ -66,6 +66,7 @@ static const struct mtk_gate mdp1_clks[] = {
 	/* MDP1-0 */
 	GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP1_SMI0_SMI, "mdp1_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
@@ -118,6 +119,7 @@ static const struct mtk_gate mdp_clks[] = {
 	/* MDP0 */
 	GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP_SMI0_SMI, "mdp_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
-- 
2.55.0


