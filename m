Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86FFFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r927EdXxquUzRi784TQe7IBsAleX51QDV6fOSE5krwM=; b=dW4jKYDO8iyTMnFUjh+5ry/Zcu
	hgOsf0rpzmuCgvjJXftrV5P60qyqEPJIo0UoeGY+mEkwSxAWrlPzxaFtoVcnBCie5Za2RjRZcqACQ
	SX/y91pplcDInsgA8k8Z0Ihiqh5bqyDSbhTw2cyGKWadZJ6KHFWK3ZzohdHJOilHeemrbsERCayP8
	NvQ+2E929bHq56zZ4i4UDxvbnPBzz6YzYxj075Pq73e9D1rhO4qRgpHCKBS+8tzVfhsbGGr3tBGwk
	rkKgStaOnyJLXph1QO7obeowyFNHF3pGZdl4l5FMH4zHgGCFum8S+RymCHyoN09F8xXICM4C30G4B
	Rv3fH4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvrm-0000000Dfn9-2Esl;
	Mon, 04 May 2026 16:09:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvri-0000000DfmP-1XqJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:09:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so28239465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777910988; x=1778515788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r927EdXxquUzRi784TQe7IBsAleX51QDV6fOSE5krwM=;
        b=z9PdGJ/4/okPRu7VuHC2DBMd42i5e2YVaMfutqbNnPi0Y6aJQF963O2sektwJ4Jqcu
         KUEho+lITjbpiZ7lGgnqxl4qwUTfESaiMDK2SHw3G/20tvdmXI7BQevDRoYybDbnC7Xv
         omkDzmFdENr22e+diYO2GQyyWn9GqpDgrhVivF0HJupsbPkd7uxlLqaTDC87CViII+F4
         tb6lHuhCxvvF6Bl2Ppx88nearpIiOeHvbxqQGiwm0cdFzja4q5W1Gld7FxmFIIiQAsEx
         Ir68j+IRc/0mBqQ7O2XHDCGqmGCjt7B5KdpfeaNnZNmevatN+fjrT51hC4xmA3YCNfDz
         ToGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910988; x=1778515788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r927EdXxquUzRi784TQe7IBsAleX51QDV6fOSE5krwM=;
        b=g+eA2Xu4zIHUhumo96yC5OJMoB6dmadEPihj8ME7rniggkrEuhJVeQOLBSXYNSrN7A
         1yuaFNnnf1zCwyf0C2qim39TxJI3eI+cyk14B8Ga0hHIt57zEFwf27Apq2NMxzOPVjxh
         9TwY3SY4TQ1OG7jjBMTMPJsn7bKx3i90eXDcniY5BBRWJw10ApXZ6vGMuEoEeI5HLD+1
         kvkxJ7+rD1FGhv3Q89wfvHSD3LpA+XPojawg85oJKPt20MK7rGYKeVNlOaUKIswwxxj+
         Yr93Tanvh8NwFcDWR0DdItl+QyVlk8Vtd8MLGlI0ac0LnVOYCPLJCiFUb+SXQfQ9GrYi
         PLtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LO9fzYa8FlrvlR/9h7fwQQCm8mZSB2+KrsoEqfcmhuaJ6xHGKMdHnsCQNtAZJNCEduzJbtO5hErc8K5yghzY1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq591bibAGJaXaD8nDMEyhXWcuIowP/OFO1EDog40GefJFPoDK
	u0TGJrGtYmFb4QwxDm3sUOzNZniM2SJNYXYzghIE2kZHKKjBuvsu+TTcdL6SfiwQoYE=
X-Gm-Gg: AeBDiesCLjtoSwxPuHB+jydDOv058vuy616TDM7R8Y2rmcNGoyf6OCLZtQPd5pAwqf5
	ltGyu+7ofa0Zs/XbT8vmDS+cyORHMIy0sx5EeMkmCgXphdpwNXzdjPcNphrXLTO7krkY27EO5ui
	vZ+GhtI7JI4mQGejkGnxLb+Fqj8TtEuDqe9rnZdj0QbQM4FXeDjJ7V3V0+/SQeFIMxG/z1QxSl1
	Aoq7CFtA3nVld/MD70TGc/roRB2WdngpSavM5JYLD5FVhO6u1QutexMVpUFH9N4f/1NomKIDXRv
	qqt5i1ARNkuNumOIlb0F+p3TWIaHIkJqm1Z+PW2aV3wC1jorOuB0QXR/+QgX32Rju3tYpuJmp1R
	VC8h0P7v4QtEM1qEURXAwiMJoflKBKGUA+JB6phooMxfCNiroq1A+rnvs3dR63o0vBVv4eV0/zG
	lHAMlcmjBSUN6NANUw0CxB8m93hzGEuhEuwhPqrYSmswBuoh1aGtU6PksX09QXOxccliwXyas/s
	BnS3NBaTfUyqJUNVZarL2rfVg==
X-Received: by 2002:a05:600c:3f06:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48d1424a351mr2853855e9.8.1777910988389;
        Mon, 04 May 2026 09:09:48 -0700 (PDT)
Received: from localhost (p200300f65f114e08197264a4bf9e813f.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:1972:64a4:bf9e:813f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a8eb75fe8sm289596725e9.8.2026.05.04.09.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:09:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Mon,  4 May 2026 18:09:40 +0200
Message-ID: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CmTMxazb9aucCLhZKKjA+cLLZtaezjGo/cD+BLSKmaM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+MTETAj4MRLVp6upKPuoUtwbYrRf1PX5wwFma Js/XyqYbzyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafjExAAKCRCPgPtYfRL+ Tt6hB/9GjwroVu3uHf9J5uqO7394zE0RlEuyZHf2ytSxaeZ16RG/COodYGALkZjDEOlV6COy5I1 yQB7Fg68R4mmQOYH7E4RCFHCeYeretFYKljhvo1s+2Aaaym0PmpgIoEmc6LdUNXu6NGoYb0wg20 hes/00WwxShmGb8k20rErHdNWJ4ToOjM3nMqKUbk6PJ328vLDXcIjh5FweI54NuVkibPOgUA4V9 yTF7bM59tVHMc7FFAu2eQW/mWFDOkJDKyYAua9UhUmaXYM0JWpws2CUP8ZZimqurA2t7OrU1+AY zB8QFRTyuHnXjw2lm3Ow4/KWsQhLYy01aID6U6vOHRUCfoW9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_090950_689708_191E0FCA 
X-CRM114-Status: GOOD (  13.96  )
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

Initializing a struct using list initializers is hard to read, compared
to that using named initializers is more ideomatic. Convert the macro
used to assign values in the driver's pci_device_id array accordingly.

This change doesn't introduce any changes to the compiled array on an
x86 and an arm64 build.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this is a preparing change for making struct pci_device_id::driver_data an
anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/).
This requires named initializers for .driver_data. But even without that
this is a nice cleanup making the macro better readable.

Gcc is happy with simplifying the assignment further using
PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
because PCI_VDEVICE also assigns .class and .class_mask (using list
initializers), so I didn't convert that. Once all pci_device_id use
named initializers, the two zeros can be dropped from PCI_VDEVICE and
this entry simplified accordingly.

Best regards
Uwe

 drivers/bluetooth/hci_bcm4377.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 925d0a635945..89c317561bfb 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2525,11 +2525,12 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 	},
 };
 
-#define BCM4377_DEVID_ENTRY(id)                                             \
-	{                                                                   \
-		PCI_VENDOR_ID_BROADCOM, BCM##id##_DEVICE_ID, PCI_ANY_ID,    \
-			PCI_ANY_ID, PCI_CLASS_NETWORK_OTHER << 8, 0xffff00, \
-			BCM##id                                             \
+#define BCM4377_DEVID_ENTRY(id)                                                 \
+	{                                                                       \
+		PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, BCM ## id ## _DEVICE_ID),    \
+		.class = PCI_CLASS_NETWORK_OTHER << 8,                          \
+		.class_mask = 0xffff00,                                         \
+		.driver_data = BCM ## id,                                       \
 	}
 
 static const struct pci_device_id bcm4377_devid_table[] = {

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


