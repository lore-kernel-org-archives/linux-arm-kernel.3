Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4945AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJDQbifl3S3nXYi/s4G7WO8DDH38sOs3MfxUL+uTTjY=; b=wtRUcnX/lr++oB03iOW36B/J1b
	MK9NwctE6NOJjQGZgPFT5+OOHyn+PRr073IOt0BAzXpnfE2NGyASqY/O0IeKUCRXdyICnCAQVoodp
	eAJSMauWiPqm3DlrZWeH3y/dgK5dX7xcro9dY1g+nzsnW6t6fDjGEG7QZaxj7F8emYVGQw9WTWJ+b
	D/ilGDw4hk9Z6gEo08fPHzitRhq+95Z26KRzWqNrYUcAlTJ6Wj8wc/Q5/uSnqIx7JPITx+eaWfAE+
	yxzbZF83RvgLI1Mia4YJmKwvcOHskbi3BCbj7dtFaG66IpIlp8hlqc7072uaq64lRW23GS6PoAbx2
	WYqlhTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDY5-0000000FAhl-1wMu;
	Fri, 10 Jan 2025 11:51:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDUU-0000000FA1f-1sCS;
	Fri, 10 Jan 2025 11:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C44EEA419FB;
	Fri, 10 Jan 2025 11:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0FA1C4CEE0;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736509668;
	bh=2LuqfPJMjVZ/DDPyRk3omDydC7N76YqAGAm21Z7ZFXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i4Vye6nlN8OTpRoVDWqva4QwMK0gSKfbmkEu+tBlYAW2PNLgxS6E+lKjOCahPs7JU
	 vVjDFpFTHUt9IUYjYveEE94LQrjRwbRSmw0T1e7Gc/S2NmFUiAcCdrh6GQNOR1YIFl
	 Jcp9AXqs6t9rDKDC1+Kr+Y8IpqHd/6smiU/YQamWq37nX2aMBmvMv9DzrhKGZjgljK
	 LCtMTQ54Q5+9BwQBhdx1Ld2P1c9R13dMp9wk0rZRpNShhV/H8cX0iiRtf00sxpmLDC
	 SroI3TQODdVyTGUO9SZwAoX1s+8EWGwJ47gPQLTAkYLa1+MAJ+1FdroiJN9RHucD/k
	 52LIPFxKH/Piw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB43E7719D;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 19:47:10 +0800
Subject: [PATCH 1/2] clk: Add initialize the rate boundaries of the clk
 provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-limit-rate-range-of-clk-v1-1-dd618adc4aa8@amlogic.com>
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
In-Reply-To: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736509666; l=1896;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=NLbcI+Nns/2o6n4G9nqU4NOW+TQbJwF6LoFvcGM+2I4=;
 b=/HIhXIBeMDoFfKkG+m2ONfOOFLZiafM1eyQll49aSyxL2rXP4aEC5eWqUqKBgLD+IC9SM+MwL
 MB/kqgbTb4DCcVAFh9ZPihXtnYXLBLiD4tVb9iZtoh0zjY6mcTxVxc9
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_034750_650298_10952C4F 
X-CRM114-Status: GOOD (  11.94  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The rate boundaries output by different clk providers vary due to
hardware limitations.

When registering the clk, limit the rate boundaries of the clk provider
to prevent setting the rate of the clk provider beyond the design
specifications and causing abnormal conditions.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/clk.c            | 4 ++--
 include/linux/clk-provider.h | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b45fa005030..36e4b4f16f1d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4359,8 +4359,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
-	core->min_rate = 0;
-	core->max_rate = ULONG_MAX;
+	core->min_rate = init->min_rate ? init->min_rate : 0;
+	core->max_rate = init->max_rate ? init->max_rate : ULONG_MAX;
 
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b7493..46cfc342819e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -294,6 +294,8 @@ struct clk_parent_data {
  * @parent_hws: array of pointers to all possible parents (when all parents
  *              are internal to the clk controller)
  * @num_parents: number of possible parents
+ * @min_rate: min rate provided by the clk provider
+ * @max_rate: max rate provided by the clk provider
  * @flags: framework-level hints and quirks
  */
 struct clk_init_data {
@@ -304,6 +306,8 @@ struct clk_init_data {
 	const struct clk_parent_data	*parent_data;
 	const struct clk_hw		**parent_hws;
 	u8			num_parents;
+	unsigned long		min_rate;
+	unsigned long		max_rate;
 	unsigned long		flags;
 };
 

-- 
2.42.0



