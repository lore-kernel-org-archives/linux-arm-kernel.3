Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284E2F54ADC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2M0BohN3DVZ9pC0H1J6A5RAwkAq1WIWF54qASZfCXA=; b=pz3GvwZAW6GUEXYMlAOzy1qJRR
	jmXU/VbbEHHCXSrmUCY0/aO2DivcSNBLSrmhTjC6U/Fzgh+njiIrOFxZa/FAUDeUYSA324W37u6El
	jUBQYkL7OZKZ1wcAVB3u7nKhONbqpiuy1Eu/5diLLl8gYxtp+GwXRY9QZ7GLWfYjFujjJHDf/1fsF
	r82peVtFtZQsChe/Pd6VZr1dxpNP0mPTOSa5pVN8ovF4+O5R4TjqKoIQbIAC5GjY7zrIN2wy5x5kg
	7nvjuHBO7o5hNvGW34XsXMcpN08Dh4X9mKV7P26lr0deLbKnGTwupDYMdEx/zC2FpGcQZCbm3z1na
	zBvmrMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rb-00000001uVv-0KoT;
	Tue, 24 Mar 2026 16:44:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rL-00000001uMm-2eOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AC1A44574;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC357C2BCC7;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370643;
	bh=uNk+5l4j5lYbYuM0VQJOR8shYhm489bqZiHsaW/YJrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnmMkuLIPy/3dOerLZTV5S9nifmLUuXUBt129KvZCUgiuvT5AR7PRnkgLwOzsl9YE
	 vNFMk3Xuhhv+zaJz2gK15DayDFcFTwNg/O/s6Ubtd6fgBxW8u5I5JmSqp5w2zGnEEE
	 AyfdhQgdTQbymfSYQk8ZXYx/IowOksUxdzuXhqo7C9265L3pI/GRQ9hiNk7P8AGPce
	 2o9b6JPJ0ljamfWCpMCrq5/s8qiDZugyhabkOuKahenbdVMgG1wPOdzVluAkib0Oqc
	 lwwM78NZ1IQVf9Bc3oUJOmig9LtB1US3PxTIKN63JgV0LD3n9gpC4WFLkxGnp2YMs4
	 OH0BAewXE9rVw==
Received: by wens.tw (Postfix, from userid 1000)
	id C06785FEC0; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
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
Subject: [PATCH 4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
Date: Wed, 25 Mar 2026 00:43:52 +0800
Message-ID: <20260324164357.1607247-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094403_704261_A3B764F7 
X-CRM114-Status: GOOD (  17.81  )
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

On the H616, the SRAM C region is an alias mapping to part of the VE
SRAM (accessible in whole at a different address) and part of the DE
SRAM (otherwise unaccessible). As such both the VE and DE need to claim
this SRAM region to prevent access from the CPU.

The SRAM claim API is designed so that a "claim" routes the SRAM to the
peripheral device, disabling access from the CPU. So long as the written
register value is the same for all the claimants involved, allowing
multiple or repeated claims is trivial. This is indeed the case for all
supported SRAM regions. The only known SRAM region to have multiple
different settings is the SRAM C2 region; this can be claimed by the AE,
CE, or ACE (assumed to be AE + CE). This region is not supported, and
likely will never be needed nor supported, as there is no documentation
for the peripherals involved.

Change the SRAM region "claimed" field from a boolean to a reference
count. A claim will increment the count, while a release decreases it.
The first claim will trigger the register value write. The driver
otherwise behaves as before.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 5e8c80ae3509..aba155379ccc 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -12,6 +12,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -38,7 +39,7 @@ struct sunxi_sram_data {
 
 struct sunxi_sram_desc {
 	struct sunxi_sram_data	data;
-	bool			claimed;
+	u8			claim_cnt;
 };
 
 #define SUNXI_SRAM_MAP(_reg_val, _val, _func)			\
@@ -244,9 +245,11 @@ int sunxi_sram_claim(struct device *dev)
 
 	spin_lock(&sram_lock);
 
-	if (sram_desc->claimed) {
+	if (sram_desc->claim_cnt) {
+		if (!WARN_ON(sram_desc->claim_cnt == U8_MAX))
+			sram_desc->claim_cnt++;
 		spin_unlock(&sram_lock);
-		return -EBUSY;
+		return 0;
 	}
 
 	mask = GENMASK(sram_data->offset + sram_data->width - 1,
@@ -256,7 +259,7 @@ int sunxi_sram_claim(struct device *dev)
 	writel(val | ((device << sram_data->offset) & mask),
 	       base + sram_data->reg);
 
-	sram_desc->claimed = true;
+	sram_desc->claim_cnt++;
 	spin_unlock(&sram_lock);
 
 	return 0;
@@ -278,7 +281,8 @@ void sunxi_sram_release(struct device *dev)
 	sram_desc = to_sram_desc(sram_data);
 
 	spin_lock(&sram_lock);
-	sram_desc->claimed = false;
+	if (!WARN_ON(sram_desc->claim_cnt == 0))
+		sram_desc->claim_cnt--;
 	spin_unlock(&sram_lock);
 }
 EXPORT_SYMBOL(sunxi_sram_release);
-- 
2.47.3


