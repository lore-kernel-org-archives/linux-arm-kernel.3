Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981BEC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOi2+mQp3d944N2hzVvnKFDwZUvY8jSUF/ABKoJE7Fw=; b=AAe7P2fKCfLyrmCM7Meb4DEuV4
	H315V7NyQMFqyx9x6OUD3s++fe+vtntNk9BBieP4UY9PUpTZj6gZ65jbxk3gnSaUKj/9Fo3U8nzL9
	5Qq7sePjHGt6rjzngmKRwK3HFVto17/iPeTR6+kAxs/eGAlpmTI2tVIYWYIJ561d2UbBRmsNfVzfW
	PwPSiEHY/ecGlZvqNX/9SdRYxDYZ6OjLWywf2r0tbsHgKr6LXSjgwop5PhGsA8esstytJplDM7xC0
	YT1FwEHyx/++UAxxyK4hTxyxRdsPvYymZfGIdEJlffIgLIWkxJTcGcYFG9yWes+ZVs0YBLTInqYG5
	gjV8JCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf0u-00000005aHl-1hUJ;
	Sat, 10 May 2025 07:52:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDetS-00000005ZP9-21Q3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B2234A6FD;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19001C4CEF1;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=ftCcW7WIxYGQk7HA8lp62RbBZM06Z5asH0bujmE6CcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sgWXpeTGyvrpyEns61D6Dw84JcJcSkdgmOleT3NYM578DuoduMD3suLSzEdrNe9xi
	 72B7rEgoFfJz5ZfiIlCrTs+B2g3HL+/Dwv+KUuEMOOTPDh0M2DYOTEgZT0IJpo1ahs
	 zwlNLz6rV7CGHHrownc/QC1cIsjiGDGNxZ7D/mODDxXPY+cnQXlzM/YlDzWCTeEJGa
	 t5WkSb6wAsM/eCXOJM2/7iyx7HP8Mk9UeJSS0vE0quES/7SvReVsrutUhT2RC9vGxY
	 LlIjq9dypB+Sd0k79sGpPhvawKL/pf+GEBma5XFUB3S2g7VOPu+v413VbQ3o7j3ce/
	 vs5AK5uWDMT+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07AC3ABCC;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:43 +0000
Subject: [PATCH 3/7] Revert "nvmem: core: Print error on wrong bits DT
 property"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-3-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=hpPWBCehpQX+TRroEYSLZmoZuXPmZL8t0ylnYC5nM1Q=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y883++/u3l1adVWlJs9YLZTxQcu8fofWhL8YmaEy5cU
 +Rf17d0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZiUMnw3+vR7e2GDusU50ks
 z3jCtm3S2wPbI/5ufdvw/NekJt4HDHmMDL/uGzoqHLjJfEXi5U1z2z+BCZ7ui/VnX7ox4Ye1mqx
 FARMA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_004510_567562_ECE80C2D 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

This reverts commit def3173d4f17b37cecbd74d7c269a080b0b01598.

Now that the core supports accessing bits even beyond the first byte
this additional error check is no longer required.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/nvmem/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 02081c93fa467e5448bd78a4920072d437365fb9..ef1f59b34d262a533fb601d87fec123061cfff81 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -837,11 +837,6 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
 		if (addr && len == (2 * sizeof(u32))) {
 			info.bit_offset = be32_to_cpup(addr++);
 			info.nbits = be32_to_cpup(addr);
-			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
-				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
-				of_node_put(child);
-				return -EINVAL;
-			}
 		}
 
 		info.np = of_node_get(child);

-- 
2.34.1



