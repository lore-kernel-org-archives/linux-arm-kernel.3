Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7800ECD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj+A1L4ghz8M9xtQx7N/iIUl+JSGwHDfpQ+NQQtVxeA=; b=iQXYDgDWa+jJnrGZ10obNNVInG
	J0YXEF4T9h/hU6cX1QDxi2zYD+CfWMDuECjFBK2QnEcH9WgNQrpd2TeAeWs/rKyNFkgkiDFNT49e1
	rH6nm7sVIL7nUF+UbXgogxMgyo0O9BQIv+pEzMHH4FEM559fAkzX3DVS9C7MaBtPDiXrJWdqM5kC8
	6TKxMSEMXVf8BXnZwMJnTj/kg57S5yIXeLPXyrGI4MtAzjb5ZeXdEUNsStC6n0TNvewlzrm+q0cE4
	es8C7ds1XVsiNIt6cYojOokNNZAXXZ6t4qn8Ww1neyyPO0/+1KsLOVmXX1XIIjeXAuWty81EXmIdk
	OmjSoI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcXa-00000009DJZ-1PdL;
	Thu, 11 Jun 2026 10:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcXZ-00000009DIM-0jG5;
	Thu, 11 Jun 2026 10:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A7A744629;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A19C2BCB0;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781173296;
	bh=sBS5uf4qSGQnXJ31n1W2qIx8sitdGbZZdDoMUF3vkIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y9+xiRA7Etd38zkMI6aIfWpsjSXq8+5ySfZB/QalzUBI9+K4gYvJpRVIVZRXYKnjS
	 nAaNqNSgvUGv0Dogc1nuDN7peyiwSGC8TIPBsyma3QmafSbWI33TFz8i8QMmgvFu2P
	 s0j3Ss/AA3VQXvYrp1LtWhNrT4Hm07kV1AN0/imYwtl3fodtgfv8dARHdhI3OcCdhB
	 JD7Pj9mWifWhM3F2liA1w05E1A2thGbLogV14dHm2ocyyk44PISeTiVkkWEtAOrCcr
	 4B2t9wo6tTsqypa6KCO5CmxPaLuoLR9cBvUP+WY+AyqKt4jE+tO1iN5i/rF4qzb70M
	 WcwZufGcLrsKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4656ACD98D6;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 11 Jun 2026 13:20:31 +0300
Subject: [PATCH 3/4] mfd: mt6397-core: add mt6323 EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-mt6323-nvmem-v1-3-b5e1b9ce51f2@protonmail.com>
References: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com>
In-Reply-To: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781173294; l=899;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=gfiZtK59vnYwxkS8UM5M3InSXISmr33hxTTt1Z71XQo=;
 b=4lVynAgv7570qzi7ZfFm4W64uXmXlyW6EFAGKJ4NF2lEeOQ/Zz7IpcmK8EYiQQwjNlCQqr9v1
 B6I9+mVvRkpAsCIy28pUU0lrz3u3uBTZxcYLYpx5mSLBCP9BJXomPhk
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The mt6323 PMIC includes an EFUSE. Register the EFUSE in the mt6323
devices array to allow the corresponding driver to probe using compatible
string.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 3e58d0764c7e..362737a1c4a9 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[] = {
 
 static const struct mfd_cell mt6323_devs[] = {
 	{
+		.name = "mt6323-efuse",
+		.of_compatible = "mediatek,mt6323-efuse",
+	}, {
 		.name = "mt6323-rtc",
 		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
 		.resources = mt6323_rtc_resources,

-- 
2.54.0



