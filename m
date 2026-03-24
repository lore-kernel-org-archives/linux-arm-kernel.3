Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6822EF54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oi99Zq9kXc3m7bqBRTiEl2Y4h2li2+WPQIA8JvfmSpo=; b=zokCkS3KBLftuA4GPjewwUg56u
	yN6NhRQ46ieslj8SI1UY628qbu0GjupQq0Br7ktdfGScLMttr5RloXDF1yijUjSd9xRQBdUQFd5tc
	vvh2nnB542JDTO0m0QMW8fe5xNasLfhEPCI3BIOSgpnJuNNgTLR4KI9ooxR+VwLL5yasbwzuAkHno
	57DGzbo3Ed2/uimvSklMTkoCK20KJIISSzGlqCLuZaYgbK/AmZMQYFMX0Pjja2EdNSZqgmkJm4oax
	s/yTGnPmud6iQ/ssmJ42hvzbTpMJ21mh6epaA62VjZYILL2N9+3k6GX2jpSw/GxSfnAMsCcB8zDvr
	siqTk3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uOL-2Eph;
	Tue, 24 Mar 2026 16:44:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rL-00000001uMl-3bhq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31AB560123;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35F7C2BCB2;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=U61+dRHYuGxHw4u9pXFuFuZiDuMWELHNCtj0Nylxc0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tsClmxy4M9zi3pMxpUGq3hxYRSZ4og2rH3NnK9WSJE+kTch0rT9za2dEVurIEIHKq
	 VbX7Lb6/U1gjTqAUOzLAJOKbGEl69JQtOEyuJg62O46z9jRZA4yGmV6mb5c6CopUtO
	 mYbRbmqo3Jm59Mu89FgntzTfaQlsAhglopEXSBGMMI3V1cxL67L5otRhmiPjM2NiFE
	 FE0dskqUWWH2ldK948OprtoogAP3SfcBt9gArYdz5Tj3x3N3Ml5QdN5HzivawjxeGn
	 UzsM7Zap8uftLrLhLP2UMI8Cmh1MPWEs9Hai3MN+kBI6PylkgCfziMsYX7A94QbHK4
	 4tmrUMoYxNuvA==
Received: by wens.tw (Postfix, from userid 1000)
	id B0B825FFAB; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] soc: sunxi: sram: Const-ify sunxi_sram_func data and references
Date: Wed, 25 Mar 2026 00:43:51 +0800
Message-ID: <20260324164357.1607247-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

sunxi_sram_func contains value mapping that do not change at runtime.

Const-ify them.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 446b9fc1f175..5e8c80ae3509 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -29,11 +29,11 @@ struct sunxi_sram_func {
 };
 
 struct sunxi_sram_data {
-	char			*name;
-	u8			reg;
-	u8			offset;
-	u8			width;
-	struct sunxi_sram_func	*func;
+	char				*name;
+	u8				reg;
+	u8				offset;
+	u8				width;
+	const struct sunxi_sram_func	*func;
 };
 
 struct sunxi_sram_desc {
@@ -54,7 +54,7 @@ struct sunxi_sram_desc {
 		.reg = _reg,					\
 		.offset = _off,					\
 		.width = _width,				\
-		.func = (struct sunxi_sram_func[]){		\
+		.func = (const struct sunxi_sram_func[]){	\
 			__VA_ARGS__, { } },			\
 	}
 
@@ -111,7 +111,7 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 	struct device_node *sram_node, *section_node;
 	const struct sunxi_sram_data *sram_data;
 	const struct of_device_id *match;
-	struct sunxi_sram_func *func;
+	const struct sunxi_sram_func *func;
 	const __be32 *sram_addr_p, *section_addr_p;
 	u32 val;
 
@@ -169,7 +169,7 @@ static const struct sunxi_sram_data *sunxi_sram_of_parse(struct device_node *nod
 {
 	const struct of_device_id *match;
 	const struct sunxi_sram_data *data;
-	struct sunxi_sram_func *func;
+	const struct sunxi_sram_func *func;
 	struct of_phandle_args args;
 	u8 val;
 	int ret;
-- 
2.47.3


