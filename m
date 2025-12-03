Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56836D12D48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BtZSI0JUG3jZFRQAQA3W8WSSj2iYn/BEJxE7P47Si0=; b=HAbjNOgGv9tfZ9HI+FRNS87iO7
	evA8GlsUfeFD/DV5r6Oehv8KoGFBH0UVHKWKUiTqKu4sLERgH6+CpcFYWUPdQ9vpIlOeWJGApSBIw
	s/0xL6oXcG31jSo9I30gKxKO68TViSFmtQJlAlI4khfjGUvZlXk63NCuri/BP8qUn9+Y5UmRUNor7
	G/Yu9R5p5cBUE5tLCpyE5RaJ//v8oVX6NHw45SAeRsgC9eVfUln23UXHUS6GvoPj8gJMebp8+hRaq
	IZPrL3aMxVZRnRIGmEqppU7YUbfZWvkh5XG8s/TocQZw5mXJGCmjYuvNGBg08yAQCptDXNrGYiOWR
	hucS1miA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQl7L-00000006VJH-1tfL;
	Wed, 03 Dec 2025 11:33:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQl79-00000006VIh-3NxS;
	Wed, 03 Dec 2025 11:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764761619;
	bh=9H0Lj32oVEU9hMfCGeT2VAyMxxGLg8HVaCtVRvgGbrY=;
	h=From:Date:Subject:To:Cc:From;
	b=Kh+JcnuOVdXsSmFt8aDzBmFIvBAwKBSeqK4k8hki9mozRpAps4Qbl5POsXIihqzAb
	 dWfkAtNE6lJEMTi4P9es7jg7qNJ+AMpXBNEN4qrtwW58GIxopcCwLb1Zb8pCSfenUF
	 xGfrEFMj4FtOT3z0B7Ji0vufrLc6gUdAx4P5ThSgBwbOMUKtfogFR3HnXwjYd0n9xs
	 HZRAeMGFa3Bvb9pWTZCaJa//Vk2omBOcZgFLOWlHmIfl9MO8G0zxf3LbohMAZBvMUL
	 bCBUiO14gimDmn3kTmSPG79XXYrl3a8YStLwWcL6fTSqFsPDYY3UqoHQSv/AwMvIX5
	 gZMM8iW3mjxDg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0545A17E110C;
	Wed,  3 Dec 2025 12:33:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 12:32:42 +0100
Subject: [PATCH] pinctrl: mediatek: mt8189: restore previous register base
 name array order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWN0QrCMBAEf6XcswdNVKj9FelDTNZ6YNJ6iVIo/
 XeDxcdZlpmVMlSQqW9WUnwky5QqmEND/uHSCJZQmWxrz8a2R46lM92FZ0m+6JPvsrBiTC6CJw1
 Q7uA9THAnax1Vzayop1/iOuyseL1rqewj3VwG+ylGKX2TsBT+12jYti+LgxWnowAAAA==
X-Change-ID: 20251203-mt8189-pinctrl-fix-regname-order-8ecce1da422a
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764761618; l=2265;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9H0Lj32oVEU9hMfCGeT2VAyMxxGLg8HVaCtVRvgGbrY=;
 b=oDdZtMbH8bHkD0JzMY8waTUEWya8OYrMVWHwRFtHs9F3HBu+n3XgDAr0pyySPY8l+PnPQnV0A
 glEhL+EwLcQAEsDxCpf1F0WtncftcEZltprCBeAnPszEvuzbJfV981S
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_033344_364009_953B79D5 
X-CRM114-Status: GOOD (  13.85  )
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

In mt8189-pinctrl driver, a previous commit changed the register base
name array (mt8189_pinctrl_register_base_names) entry name and order to
align it with the same name and order as the "mediatek,mt8189-pinctrl"
devicetree bindings. The new order (by ascending register address) now
causes an issue with MT8189 pinctrl configuration.

MT8189 SoC has multiple base addresses for the pin configuration
registers. Several constant data structures, declaring each pin
configuration, are using PIN_FIELD_BASE() macro which i_base parameter
indicates for a given pin the lookup index in the base register address
array of the driver internal data for the configuration register
read/write accesses. But in practice, this parameter is given a
hardcoded numerical value that corresponds to the expected base
register entry index in mt8189_pinctrl_register_base_names array.
Since this array reordering, the i_base index matching is no more
correct.

So, in order to avoid modifying over a thousand of PIN_FIELD_BASE()
calls, restore previous mt8189_pinctrl_register_base_names entry order.

Fixes: 518919276c41 ("pinctrl: mediatek: mt8189: align register base names to dt-bindings ones")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index f6a3e584588b0e8a1aafa9dca74c559974a57af5..cd4cdff309a12b6987362b111e0613bf29b60d84 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1642,7 +1642,7 @@ static const struct mtk_pin_reg_calc mt8189_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8189_pinctrl_register_base_names[] = {
-	"base", "lm", "rb0", "rb1", "bm0", "bm1", "bm2", "lt0", "lt1", "rt",
+	"base", "bm0", "bm1", "bm2", "lm",  "lt0", "lt1", "rb0", "rb1", "rt",
 };
 
 static const struct mtk_eint_hw mt8189_eint_hw = {

---
base-commit: e47d97576181b31291cf58e77d737d21def0e160
change-id: 20251203-mt8189-pinctrl-fix-regname-order-8ecce1da422a

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


