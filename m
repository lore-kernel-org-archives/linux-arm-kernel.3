Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA685E87834
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=; b=e+HU8vdWAdMKjcYg+LuLOW7j1J
	qqksx1azdQXVKERg5tnbhz2PGaHEozftmrHDFE5pWbSYxV/U9wbAEBLcQXs+HT4ZlCo+VDo0oyDbY
	h3S0grUcPLLeePyWYTlhdOW8S/1Wre/Y5CDIPdJDKyfXVf2spThNKHBu6dBp+wWSMbN7yqRvNsnSM
	U9qHZLzw/xAVHVxqdRTDHgVk/pDHi2Y2MXAcoWmS5vkuuE92L4woZlkNzq/hqY/rzO/z/9Kk3bRd3
	O8Og0vrCB7MOXilbyUhmX7KCJK/NjbVzQE4VDcb94hrlz3QaWMBdiswnSJJMHYKlzTfNudVY6CdL9
	K+U1GyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH4t-00000006jNw-3kUf;
	Tue, 03 Feb 2026 14:08:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH4r-00000006jMl-0v4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:08:26 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso2224976a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 06:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127704; x=1770732504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=nB92aM/+eS50lgrH8+7SvirTjDiAVrQbdQnCB/450ZyWr55PXZQFA0oRCnfyakPfEk
         vMjRdZES27uPQRPLUgv/4DQJbWFOT4QE35e5bzi8XoDgl8QXUj0iJvxueH/A6126XB0p
         h2LfaNQeyRC59gm3H4HMujc5Zjzc7ut+ZS5CSejPVtLhNkG6sj/LtKsce16JwGPtRDy5
         1Z4xWmBW3asXtTrz9HtIWaQT+1q12hPCjIehg0lR8uLj5V8H1TC6tDqU1AoIZeR7OZTX
         Woi16FJxE0YdnDMG7wJRZVPeqNNNPv0Klut70hQIfEVsNTHV6zEL+urZ9MI44LIJKJRP
         i2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127704; x=1770732504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=oBNcEkm69tbGsWrfAgwvR2PEOTqcPI9iAna4kYQNiuB9jCkkys9u3ftwJll5Xf672C
         SPJCdse67uAmGw4RnhXo3iwmjragT2Vl0sz0xrMzvk2k89PNjsjT2bfTfqqZNVmapbAB
         QMxAvohcwMOCXoEM3KRtlNGogTk+a7w0/k0l//7yXNPpwKNdhm8h2v6bWUJmlcYSWVUT
         s/xa0MkyerNYluy9wCZYLEp3pkYPQwHMHwSWm3o3iO8atCOlj0nWSg9bXoXc79e/8CFN
         dp+MdfK3lPBZZsfC9bC4iTZa7STX2TEQxqjK15ycExovMwNzO+d5gQH/o4CGXFgZYt7d
         jSyA==
X-Forwarded-Encrypted: i=1; AJvYcCXlxrhXkl4KDW3wVjXKcgVPAMdmUwlE9LN1I1S68sGmUwBFwQeM24ccmSfvu017n5p0UGE6Ry6ywr1TrJG2wGcn@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXxZ4qTaY5BskTXUKnY7laT6GJsVcGWFPyGpDKw9Rh5oX29Oa
	Gi4GceYqEPlZOt0powmpZ2uWgXb9melPuJHIA3ENLT89O1l1PEyOmi5x
X-Gm-Gg: AZuq6aKEhcTzR72X/uuHuWV4ys5wJ44WWHyEE/FWCD1o8dZBwqz1x6oHq+Q4oAhC0JB
	CxhPLrmRdhMtKcwT67XiED2+bk9ncwLSbLTENKjsKMTmmev4onRRfkQXvdcu4qkgRCg75nr+6ox
	lVZusjTY8PE+Cmd+10/V8V1viUczHgTn745R+EKezCPPAfDFYUSwCYt4nCi+fDScXdMgQdAVlqX
	KrKBDfC0JGjo9pB/tYkJP6rpH0B/mGdpYUNzG2hLh4izcO9pFysRYh8JJD0HcARQaEQOhceDSAn
	vSwI7VnO534ZATG02vy71Xjvn7lFnuAe7bL5KHy2fYeC60UwwWPefkvH6MbrI7+08GKbreXtjRQ
	Z+ulsCuB7ZRN107qKPb7C0/f88mqoR9Wv1gE8EBCTzSZsCPOE1m4msgGgnTp6T1oz/25yuus3/k
	EQ72TdKsSceDEntuDj66JjhXlPWBh6tNhF1Uml
X-Received: by 2002:a17:90b:3b82:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-3543b3b04bfmr13811322a91.28.1770127704120;
        Tue, 03 Feb 2026 06:08:24 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:23 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:58 +0800
Subject: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=7ZLF4iCQxbFTodP5/N08fEkFkgqaaRd3959nJlVr5Rw=;
 b=DCfqaRTuO/c9AWvt1I0DC0keOeLbELpHdMjClHQL8bIs/5szqeMTmhgfJZppc9gcC1f2quZJL
 unhYgZsD3wQAt48+SEMgmJH6spLmHlOQqnVc6AWYJIlz4uL3VkUO4WY
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_060825_266602_2A249C6D 
X-CRM114-Status: GOOD (  10.87  )
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

The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing a memory
leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index ba696cf34fe3..048e2ddba490 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 		}
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: parent clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		parent = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		rc = of_parse_phandle_with_args(node, "assigned-clocks",
 				"#clock-cells", index, &clkspec);
@@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 			return;
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: child clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		child = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
 		    child != IMX6QDL_CLK_LDB_DI1_SEL)

-- 
2.43.0


