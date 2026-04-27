Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15EFFF886A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=; b=cC2TikzvGNwChI1RgNJhT2pq9M
	HxjzHt7kI/t3RftVKSMoVl8vDlAdYAa3nfbs77u14ga8o7v4a/RUo7QXsz3RKjLWbCfSW+pgnsAxQ
	6h98RdBclOAO0EDeJb8O6oUHyvPob7N/vuGB9Luc2TUUfrYX4uGc4TipwNwNiB4mMiK65HsbKi149
	0eb1Aa/B64okgUyv8+DbhjOS1xxMdvjB4O/4sCFZXA41iBPWQUIBHFQRnty9VdJDPZqBAXAfuH0f9
	xUJ67BBAolNYiWDXDCRk3Sc4tI1s8X/vWhmaN22buAcnGZHeyoAwyPxWMs83U2SdvnLafwCMtuprP
	w4G+EV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVf-0000000H9VC-3Pc6;
	Mon, 27 Apr 2026 15:04:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVW-0000000H9QY-02JH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 15:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=; b=nOyjvU5yClCmhTB80RSL72rflf
	AdBZ6ods5cxF6bfSFduFmZqm5EzUdLwR8zIy5AV1Sg6UQzcC/vHdLZfbeVxKigxDe7wftwKS8A8qE
	KRjD53ZrjUxcWRtrsZZzljOeMADHacVGA6Ixe/HAbkBfFsg6hxjamECCpLCPWiTpW9NAnKKZznbtI
	WG086TVpGKfikh1kVUSXS22YCDYej7UTzlqeuLU2L/Vk2VDKnXzddL6OHEpxNSPsr5xMswWw4XDIT
	bfLy98meMY6lGSFf4WAlWehdwUl7e+vONdb58OltYbwi5SNMugg5m+NLtdGrai24a6Ojk9At4w+m0
	3P5SFrCQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVR-00000000tAa-0LR4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso96177795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302255; x=1777907055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=;
        b=jJNARLVERpiMGVwxvWSCBLQqPgh8YjDr+vID4ftdbA0hRhu0TIYEoIjkjDwRYPdArf
         nI+X5Lr2tby8xSlI49o644tlx+QEZqe/OTntZyuttInLN+2RBZjFCBIlSPHSfmcfEEHe
         VyB9rq+hfh4OPYuiBj99mGzXyUa2vOAqiPunrDjMKQQrm4Em9JcavuoJg2HQGuYordhJ
         vAL1uVefkkmPsek78hVdfs7oZ7rZUXjiPpAn4mrQjSiYS0ISXklFOPEBmFv/oR7KEk/e
         bTbhDsKI9p4PomRd0y5XUvzbSSs0lTwP/0yYLZi7l43CeksFIh/VnYvA/MrALe1kbWYl
         na2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302255; x=1777907055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=;
        b=ZHgH+YUVlc8hNCPIlRsQDgtjUV8jSwU2DBkXReC50+GQI27NmmOZpSlLUmgPAcKMtU
         blfRv5z64U8L4D7xZFR0uQ55sv85J0NU58lsIaPDOCg7ZlGYle/emJ13Gkk/OA9qEPij
         KlWV/oN1vehD7v9l0hjn/o6DiT4ZI/j+wBBWZwtlOv09c1rk3R9B57Jn0gV7Dh8r/Ic5
         uZFlb/8KtTL/4jgFdSk91Oz0246Hi1R3QLfJKZ4NODlzYp870v0iOl6C0eyTWgVEiLJy
         0ZCId2Uug5V5Mk7EYbwF4V8ADap9dhLa0LYTfOmA9dzuPDZBMrAES2CMwZITZVGPG4Od
         qW6w==
X-Forwarded-Encrypted: i=1; AFNElJ/Eu/Lg9O3+g2Usi9FLzfnd0xkZQSF7Ob1gqKfGIDsBx8yqL5740oVoKyXVxuI4SasUmx9URVE+g/oFjj29WGxN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+LGl4cA4vlsSaiUZROyYY+OzdEGjyby7zkaySufyvL0OfV9Hr
	82m83GLjkXbf6O8BLvvyJsb0eaN/RV1vTFAJwU+OVm/LxtPyYXU4FGTOYpmKXYi90Oo=
X-Gm-Gg: AeBDietyuzyzqjr/+XaGmkkI0WK8QLHyq5tcyLiwCejThqUVmz+qOuI8PTM4YabgK1U
	oJCL/qrRwc9tcZk2Ifc1tK8S0ulfwkRNlrYY1tMYCsxaPXbeffjySboP+NEN7ijCTSzl4qnjWfk
	MRuZwfR8p3btSwMMZmg1zrUh8Im1IqLRseBy0VrKe5tTyLTb2ktR2Y8KIvQjSu8USuIg0XcJN5Y
	eiIL2lxcMcaPxcpmgpZiSOTD7uRV1ExAm/wBOlcP70D61XnPipt4I+7N5AcsEg4ebYJCgVevkTr
	dVo8o1K+f5dvObh3vWZIzCer2eC0QQGqT1LyQIflLkqs7PrH/XcSf5W35lgqHqfgRJjS11ppSny
	jo6ba11bRMddGkPl06/AQr5cBRRyTag3/5Zh6CebHB0xRnIn3WZKj5vlkAEAyJVZzAwCqFxnRub
	jtapYHmoNjqxLHtPWBjZNctp/oFOEuGxeMrZjokp+fCaU7FE5zQUpbC6MLduoTokVpMVunfZnSY
	r4q6fMJmB6nSvwcXg==
X-Received: by 2002:a05:600c:a30b:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488fb750a2bmr435746585e9.10.1777302255373;
        Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:09 +0000
Subject: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2809;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=m/tO5SKZlsZv2lDCNDVLmgGJxhoMZAGNBisteBM84SY=;
 b=5E5ST4vkspz2pIaYKwMEQIblGJZBWV/PhVFqy7dQxYqnohf57zk5thyo0lnNMquWf8nB01W4p
 JkoNrnwDadEBiGfuVEy/6Jd1w3UB0St5O12XXnW1CVE5X7T8uoO6Tlh
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_160417_308082_25AE0156 
X-CRM114-Status: GOOD (  14.37  )
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

Sashiko identified a memory ordering race in RX path [1].

When draining the RX queue or reading saved responses, the driver uses
clear_bit() to release the sequence number back to the available pool.
However, on weakly ordered architectures like ARM64, clear_bit() does
not provide implicit memory barriers.

This allows the CPU to reorder instructions, making the cleared bit
globally visible before the preceding memory operations (memcpy() or
__ioread32_copy()) have completed. If a concurrent thread allocates the
newly freed sequence number, it can execute acpm_prepare_xfer() and
zero out the buffer via memset() while the RX thread is still actively
reading from it, leading to silent data corruption.

Fix this by replacing clear_bit() with clear_bit_unlock() across the
RX path. This provides release semantics, guaranteeing that all prior
memory reads and writes are fully completed and visible before the
sequence number is marked as free.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index bd0d48e9d157..c9aa79c2faa4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -7,7 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -206,7 +206,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -260,7 +260,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -272,7 +272,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 						rx_data->rxcnt);
 			}
 		} else {
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


