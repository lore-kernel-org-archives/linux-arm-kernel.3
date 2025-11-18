Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C08CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qHha41aZX+I30hPrMF+dffaQZKgGfi5x6aD8yrwdBc=; b=ut5yThWZ4tMTwc8IRwBXk7ktNM
	9zzT2TgPzgP5kSYUKWIPvta6AJf11MDOoPRTVa3H2qAEDF7StGy8p8jPYsk+VuLKtMEvbRZ+il2IA
	Apyw+URYMTt6xEc7qXsHyIVEIbEIYeWSieScKX8mEgTJrE0D8UcSLymvboRP7ppA+xIcn2SbX4Kj7
	D/RIkvqyc5vzG1PXrwZVCnGEU0TUY9yyGEs0pdBORm5dnWO9pIyh6RjvX9iL9U8QFB7ykAWZcBySD
	vmrxodYMdVDDXlwEuZE19vjKqJ5yyhL6OOLaw04Z5BPF0MytpafwO8x25ck/NOm+0WZl03yiUp12V
	ttF6st1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEkI-0000000HSLa-3uCH;
	Tue, 18 Nov 2025 05:59:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk4-0000000HSCB-3We4;
	Tue, 18 Nov 2025 05:59:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D9EA4074D;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0A47C4AF0D;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445544;
	bh=8qJePZ/qYEO2UNbXovKjzo5sEmI+BwCxbWANSjOTzYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TWj1MY5E7kveAN2rm444JBrui98wazrWiegoES6D0VpoSq63HZng06SD4kCf24j/Q
	 5SWlc6wnOB/zWaKvOS73cfXOXyO9j4eBFhC2Wrp+wvoKHCWRIVrU7PZO27JxGRJrKr
	 p5HTMk6uf4RreMZKq/EkwWGQMugC8tVBPdR6Xfgtm1FYFzhLHxvGlcarPZP08iYq5Z
	 RG90V0WBWAnXPWxUhNnJsMkVvoWQixYRw+4IV4bS1NhIlzUlsBtOBoq+FpwTEWhws/
	 8tmUw0kzzLvIMbQMskP9l03prT2Aqm5CqaNv9h2rs1ZO+E8/hJNxwFE1FYSVNd/jY+
	 SQE5Jwi5aOK3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D964CCD19A;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:01 +0800
Subject: [PATCH v2 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=1002;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=r5XOc1DExyRTPaepAOT2vA2ghPS6TRl6+HA/H3c2gj4=;
 b=ql4WsQGw8qVd45J++79fRc4h8EgbiCo7L8iE30zzHh0u4MKWtXwApGCOnN9fdJjuIykLUMZ9M
 9CmPYiY30yOBqmRzw+WWE5v/bfgPJ6tAi/q5lkQuxzBeSKUxxXBv+yD
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_215905_649333_1422B620 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new definition for Amlogi SoCs, include S6, S7, S7D.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 7549f1644e5e..2a54ca43cd13 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -46,6 +46,9 @@ static const struct meson_gx_soc_id {
 	{ "A5", 0x3c },
 	{ "C3", 0x3d },
 	{ "A4", 0x40 },
+	{ "S7", 0x46 },
+	{ "S7D", 0x47 },
+	{ "S6", 0x48 },
 };
 
 static const struct meson_gx_package_id {
@@ -86,6 +89,9 @@ static const struct meson_gx_package_id {
 	{ "A311D2", 0x36, 0x1, 0xf },
 	{ "A113X2", 0x3c, 0x1, 0xf },
 	{ "A113L2", 0x40, 0x1, 0xf },
+	{ "S805X3", 0x46, 0x3, 0xf },
+	{ "S905X5M", 0x47, 0x1, 0xf },
+	{ "S905X5", 0x48, 0x1, 0xf },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)

-- 
2.37.1



