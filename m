Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=; b=1QvtN5oRJV0FhMMVYGH33/5q2K
	UgFNgXooEkSZyr6rwlbij72erDY6QRcJhy4fsrRdr9eCjtnTfy6kCddpTiMoxWW+BRbAuuAqIUh3l
	F1YJndFs2UBw5N6UBrCJNSSHxRV5oI6/GsH4A2EdAJJMSkk+NIDYsCjYFzKCsIDviBgLTlkI8pGK9
	IOXO8hfnYec+nU/bgxq2ZsU22z/TjzJzOL9KdLTEZNMsGFfXT2Cu8A01liNhxVpRTrswLylL/0nis
	36q3kOi8xdkUV3Eo3o7Gbj4R6QC+IX1rrvMBOuy9m4BgMWXEDrMoeErLK2VVkiCAqvOyq6I81G7ct
	chHva7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDDJ-0000000FvEi-3RcZ;
	Tue, 05 May 2026 10:41:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDDI-0000000FvE6-1gv4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=; b=HE97ptpwZ0vWHUfcUmyJnccKKb
	WKbLCaIhcfI77HaT9PYXYe8owtCFVr1xpPJOtKDB5NyzSCUhhiCd8V/p3S4CTytJsaySz5MvO8m+8
	Mm2pepdm0gWI3tmztc7sLvuma+USVc6BeFDWmxYXq4TP4CKa/jPpUOcDvkOhYzvnSFRDCWFJwDXd2
	wiLyxntBmEjh+hG850bvMaGduTE2qUxhp4LsZ1ccNO4JF0t5yJnLaHDv+xUm/YV1CDJ0NB33sCAVh
	jD9IYlBIUdZY6qt7bz1kK3ljAx+fVzsMz12WEdT8J+CdZQw/HAj7RRqS8DG5fASSzzNMUb+YCwVA9
	QrYoBeow==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDD6-0000000DEKh-2FrF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:41:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ba6485d219so913375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977662; x=1778582462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=U9M5I6UojN1Jhj+Nc8VW8wVUxW4DwHd5vugMdSJ6F/kS0PAUEc1xUZ78J/AfdUD2YA
         OG9POeFEVZVYe20jVd9ZaXDfgOI1oNt4x9BnE1KRDaY94EEyA+mMqVcUIR6jCvOCof66
         UnpGGz2Gh3upaR6DNC65zNaV/uQIhhcLbfJa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977662; x=1778582462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=TYJpc177m0rH7xM/AwS7BgXfR8ORsxrvCm165BA68bXMxnEy2mwFLlUd8mO2LblxOF
         0t/R7waPLTrEaoKUR22eyz1c4C3fDeFTOPEnKY2z01YD4t8w3D6MM1D7SRR89kzQJsS4
         r3OI6O+po624kYASxK7A/J+WrYGDgDtiArIE/FhvfSM00BRLpFbxl7QMPCZHZZ+cXab8
         UXv9IoBUWscfV1M7gCcJ/0vQwLg3SLWsd4Uk9TSWq9DXxqpZXAHyUW9XuYs01o2t4Y/G
         CEG4LxqnJpMclbddVvH8/8uZ7StyXNmI2+EnYfaECPpb6ER25FZIKxG9SB/KlG66IPVy
         3APQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JfPZrMHpLcJ3phhFFk/c7HrJXjPXl+EdY+uOxJAmxB/TK/G8313BjTnIGQ4jZRE2zRRVwZL0rTwg53C1sNmyU@lists.infradead.org
X-Gm-Message-State: AOJu0YyaPeQDvaKCn933WKJ/8rh5t7l0CeijlKomK2fctnh1gTAUyjTX
	c/7nFf9JObA1SkfnLfDB4kIhCdawofFnGrGwL94t3wqzU2CudXF2DMpbN6MBYuvYFQ==
X-Gm-Gg: AeBDiev7pZ49+f4XKEZITsTppX2Q1vrm5nS7eP/kltD+7g6CTMTEIOqUc+AZlLKULFy
	3Kmdpgt6DplBEe5EUn7yKaYkJieqicoRwWr2H4Npm1Fp2cZHusLRcpJ64B0FSweiV6b1jMxKdHE
	TQNXIEG273J2CnwtGvxjCktkIZAUbhWlrNLYP6mu2xcG/R5BwPJYD3+zKuPqr4sxaw2JgDJ8aVM
	xP36BpnfsKVzsd6yGuWjJMFPz7y4IgLqYt59WfT+9xhf+t6skPao/fn6uHoRYeaeY8nuyHoMGVT
	3YXBlYZfLhZFFYLT1FOMIM3PPYrLni+Ee4tdsX2eFnKQ7tqnYT8LLWsKQNKS/ipU6ywfrPs8jv1
	qGEn4+7KDoWx+dHa31cuFj9Q5nCjI7O7XJ47rSbiqMguy3G91fr67dpg068k/D+FXqe5MXPkZIM
	m9yPOeq+iaYnD+UFH0CNk9+Y4O5+iLGc+Yz+ZoiIL8It91BbHuLNvho15TuRIvw6amGouHTQtFl
	9tGqEkbpjKz7w5sttI=
X-Received: by 2002:a17:903:3c66:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b9f260d87bmr130052675ad.20.1777977662215;
        Tue, 05 May 2026 03:41:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae3b8e6sm126670035ad.65.2026.05.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:41:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: common-v1: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:40:55 +0800
Message-ID: <20260505104056.1812343-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114109_767700_AF947547 
X-CRM114-Status: GOOD (  17.63  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Also, once the GPIO function is selected / muxed in, further GPIO
operations do not involve pinctrl operations or state. The GPIO direction
and level values do not require toggling the pinmux or any other pin config
options.

Switch to directly calling mtk_pmx_gpio_set_direction() in the GPIO set
direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmx_ops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c

This was

    pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmx_ops
- Fixed direction in mtk_gpio_direction_output()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427061720.2393355-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..dd2c8aa03938 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -802,20 +802,27 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pmx_gpio_set_direction,
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
+static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+}
+
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, offset, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, offset);
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +902,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.545.g6539524ca2-goog


