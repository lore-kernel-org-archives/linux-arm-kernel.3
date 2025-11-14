Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12EDCE8D5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI9J4tlNC+SSMmhFiTr7gPMAWNKQHr77sZKRtT+r31Q=; b=Z/XkOzUx+CqSUUlXJLblJILzO7
	e9cUoR27Z2mnmQzZc/YQNLhBPuZ5fuEGMzpb7Wj10Hd0dw+tDyKteK3tCgQdc4OBF+w5ZDAQldP/H
	F4NNDTIh2dmwiUAqcj9AyWqatsI8gFfWCRU6tCQ4+3reMe6lMrhU1R67xGPHOXVZEt3WfKT0UVy7t
	uuEhXWoxaz6KQeUacuXKobafcIR3l7eSRCzJbdzhN+gSGSGq5R7u7inZr6ekyuF0I5fNXWPi8gsWm
	jmSm8eIdaHAA0860zaeYZs4GYb9ccZCLaRAU9BACE6XhMoIRSSZPWOC0T/QW77542SUhAhaYzvcvH
	XtGiN2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4q-0000000Cmc6-1ObK;
	Fri, 14 Nov 2025 16:55:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4h-0000000CmQy-3AvK;
	Fri, 14 Nov 2025 16:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h5OiMH7vcp26YusQN7J8hqNMoIYH9GkcIHxPj08uajIe7iiXyFTvEBXpI9H/c+/PAmVr7Zf2V/EKseEDXioL+Dd0B1omlJkC6K+0uPEm36HQl635CLahLIsMB898Vi9sPtDVDPT2N55BnEP6QlOvH/I/RWG2OGomQsGKJY2nxyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139296; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iI9J4tlNC+SSMmhFiTr7gPMAWNKQHr77sZKRtT+r31Q=; 
	b=eQ1A3H3Cp1YGfezXpOXoX2ZUYchKqJD8nj2RcKDJs4odlxjqu9oldKRkhQNT5vVWpN81zdD7aWM2gAinFhehCgHvQq0kJ1aH9fsMV0XB9dQLYmc4+yju0NZ4QsccdsX8CdpwA5Zl0Hb6InCrn3LZ61asSJ9O+yO8z4lJBMcdjkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139296;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iI9J4tlNC+SSMmhFiTr7gPMAWNKQHr77sZKRtT+r31Q=;
	b=FOVq4UkK7aWrgSfBx2m2IFqsM6HoW64gusj9Lfzkfc3nRxuPs96vLFSWOP8xqatS
	VPCYwRdbzG8aN/JtJcE2KbCREX9aqK4knBNMIhYQyufyRPsL/g6M3qcPdoAUCrGt0Bz
	ZAzOlQG4wREuMDa7aIOzLa1gx3qUf06IP91LMVsY=
Received: by mx.zohomail.com with SMTPS id 1763139294579227.16027413825054;
	Fri, 14 Nov 2025 08:54:54 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:07 +0100
Subject: [PATCH 13/13] interconnect: mediatek: Aggregate bandwidth with
 saturating add
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-13-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_085503_929293_29C6B78A 
X-CRM114-Status: GOOD (  13.47  )
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

By using a regular non-overflow-checking add, the MediaTek icc-emi
driver will happy wrap at U32_MAX + 1 to 0. As it's common for the
interconnect core to fill in INT_MAX values, this is not a hypothetical
situation, but something that actually happens in regular use. This
would be pretty disasterous if anything used this driver.

Replace the addition with an overflow-checked addition from overflow.h,
and saturate to U32_MAX if an overflow is detected.

Fixes: b45293799f75 ("interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect driver")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/interconnect/mediatek/icc-emi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/icc-emi.c b/drivers/interconnect/mediatek/icc-emi.c
index 182aa2b0623a..dfa3a9cd9399 100644
--- a/drivers/interconnect/mediatek/icc-emi.c
+++ b/drivers/interconnect/mediatek/icc-emi.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/dvfsrc.h>
 
@@ -22,7 +23,9 @@ static int mtk_emi_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 {
 	struct mtk_icc_node *in = node->data;
 
-	*agg_avg += avg_bw;
+	if (check_add_overflow(*agg_avg, avg_bw, agg_avg))
+		*agg_avg = U32_MAX;
+
 	*agg_peak = max_t(u32, *agg_peak, peak_bw);
 
 	in->sum_avg = *agg_avg;

-- 
2.51.2


