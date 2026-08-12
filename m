Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80BC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mO5K+Y+jaAemQRUn6dy5r0Wp9bLq9BMqDYDK55DMLs=; b=3vl/pbezRc6LJvjrhNxbASgXb0
	gVWiMn1oS0TIz0WZ7F5qv0gICOfBHpC6ezrGH0ss2Mk27IthpFafwZ45ENQh5F9qJgR8FF7ZMnMEa
	CdkmBfEu0ykjB+SAZ7HAeAO0tmD/32FcKJ3yMEoGlFOr7aDH+lsCqPilW/dgBCDBFGtKmbk9w0zEs
	e/ZXpxrsjiTogpOqOrl0cP+POhodzZ2pjGxLmd6VjNZ0Y+P/Ezc6GsIED37/3yaIfBqXXRTBEWUFL
	V/vnc+nJAySzj5vUlwK12Ok5QmmLnDr904dvA2bZMlwGty9QlhIiJeYa//vN8tSbIq3Oo2GRnandv
	642KeHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu66C-0000000Fsa3-2DK7;
	Wed, 12 Aug 2026 10:22:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu66A-0000000FsZa-3beN;
	Wed, 12 Aug 2026 10:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 769EF43CDD;
	Wed, 12 Aug 2026 10:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519D8C2BCF4;
	Wed, 12 Aug 2026 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786530134;
	bh=FsFkACjzxhmjjBFuJr7WRdIrgV1ZzFunR+1J4ZbzPDY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nwt33dr1S6z55+7n7X9+vQZOVdsucGH613Uqigpnp38GBUJDHrLe53ZbeU2+uY3Pd
	 MGiyKbWQ6n/u0GZoGnYbbxsw0lIeAf/wumcR516uD128AssTZikKmUwfftSZBsdmlI
	 TaOmpsf4X6Sz5UiI+lg2GT1HIIF6gw967d8Lpc7mrYeC6WGid475C+5g3A1/YnE7+J
	 KRc7nlZzUe8xSGHCvbOFBQsdCUnyA+uj5y0n7dvMxGW377q1mMQHa3iTRjdhthNux4
	 U3XuBYBiinwuUM2/PkeeY5AicSkxDC6Bbai9M2XjeNschR2lWe3Co5H84Tt0oHAVXw
	 aQglxwgL22Uxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3050EC5B56A;
	Wed, 12 Aug 2026 10:22:14 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:22:12 +0000
Subject: [PATCH] pinctrl: meson: sync some modify from A4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFNJfGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3eLKvOT4RBNdA0PDxFQjg7Q0Y8NkJaDqgqLUtMwKsEnRsbW1ADs
 3+W5ZAAAA
X-Change-ID: 20260812-sync_a4-011ae20ff31c
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786530133; l=1591;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=e/6sQWJ1ygoCKacBsI4pbgOSo29ZSl5fN1COhUhv2b0=;
 b=+npSTpTZcyUHwNQKfVQMSVMkn7ZL/7EmlBUcCciWqI0ADTvpgZxjGNIPFljysn5gww3Skd8T9
 qvIhywPAjIADP8eZEf03v8d3ZxXYnHfIBxR600Yn+YSA1nkayfJfNlj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Set the drive strength before enabling the output to avoid enabling
the output with an unintended drive strength.

Also return the actual output enable state from
PIN_CONFIG_OUTPUT_ENABLE instead of always reporting it as enabled.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Sync some fixes from  A4.
---
 drivers/pinctrl/meson/pinctrl-meson.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 4507dc8b5563..1eea3e9d1cb2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -252,11 +252,11 @@ static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
 {
 	int ret;
 
-	ret = meson_pinconf_set_output(pc, pin, true);
+	ret = meson_pinconf_set_drive(pc, pin, high);
 	if (ret)
 		return ret;
 
-	return meson_pinconf_set_drive(pc, pin, high);
+	return meson_pinconf_set_output(pc, pin, true);
 }
 
 static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
@@ -498,9 +498,9 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		ret = meson_pinconf_get_output(pc, pin);
-		if (ret <= 0)
+		if (ret < 0)
 			return -EINVAL;
-		arg = 1;
+		arg = ret;
 		break;
 	case PIN_CONFIG_LEVEL:
 		ret = meson_pinconf_get_output(pc, pin);

---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260812-sync_a4-011ae20ff31c

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



