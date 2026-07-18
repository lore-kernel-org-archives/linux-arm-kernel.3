Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F2EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oiJo0XVJPw2rjt+rcIvwSaUqFzjRlb/yk8buMFhbHKw=; b=JWWCx6043YC6utBDUmqU0dwVp4
	uBD4FUZOhya/kdQ6ZkrmIVir/DrTNAshG7YonK0lNcajiRj80K/nj8H3eQvWAfc/6UEL/V693r85n
	5DzORjiGBS6gIoVRla3bgfZ4nJPRNUSwyp3+ViFbbw2EXuHP7MYOuL6fGXH6tvgpX/A7k4zEJ4UlU
	eoqEy5xU0G8S6V7t3WHE+Y1lDFPT155eEY3fT0HvIwRLhFqRCgeB2+DUdD1q3ui+/Gk6eadgtgr5I
	Z3qy0nmUvOPeWUxgvjYo34DFd5nsKJxQtzVOn+7ZJM/Wr7nKWLuc06ayqdsKPHxDmluhHHhfiYFOq
	aTiGrbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8n6-00000004PM4-1Kfn;
	Sat, 18 Jul 2026 17:25:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8mx-00000004PL7-1f7u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 17:25:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso51989805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784395521; x=1785000321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiJo0XVJPw2rjt+rcIvwSaUqFzjRlb/yk8buMFhbHKw=;
        b=UjQM+m9wjKuoZ8QOXLKAw6deZdeniAZHntsheNnh4TjnAsZamjcdzICz80fG7CELoA
         nCyWsiC7FLqU6DsorR/PHxasY2zEOvAwm7FweunBDbIN+NJBtg5Z1iSalvxOryCRHnMv
         ydQlQ0uOVxMPudfFvuimvC5+PnaI8wz3WhLxs2ogVA9PWfpzoYjB3xjccW85ZiQQF/SJ
         asRqO4ChGOXT5I/aCmyij1HTnbu9HPe405EoBGjpKMAOXM4qO7BCYxdTjFlCFJ1bWLpx
         9dRXJfWBALQqhy6vSQni5ywyzjaOMZ1pPWQNrP7cagJV7LPcuXseZrwvbbqUIQo0s9PK
         FlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395521; x=1785000321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oiJo0XVJPw2rjt+rcIvwSaUqFzjRlb/yk8buMFhbHKw=;
        b=kLhCszn+cKJBQ5Vk3dAOSAk24q9OoFblPedoo3owSUVeUlPHV5gLxm7tdxBSrxKJY+
         lfUGPYFtJbpLvzUgT1HgDEhe9EPh7aklxTyqUim9A5VV0KlqIjYKCQClfdo/EyIRVLRF
         0ZlGex4MNhG/dtz/4xMOZRUqAtC0zisXw9DzpPQvoI8blj2D2JB/7P1Vp8XvrEmz4T8y
         NQwl3zFSxSUTcZxZgeePN/5nHw+Jp47Cu4//tobpQLzGlcbrgamgu+B6EjepSp7n549u
         uL4WgO8gpkGOqW2rbrM9JC02iZ1uZmGP1b0DmVOEbbhCJF2PJP/nMIOuCU/uTLr2Y2+z
         Ukig==
X-Forwarded-Encrypted: i=1; AHgh+RohWSVNIhhU3N5Py3y4bpVHumeQ2NL8nD36VqvyDmu/QObSvkeuS730W9aiRAfmTz12hn468o+P3X6r5AyOU9wo@lists.infradead.org
X-Gm-Message-State: AOJu0YwYij08zkO6CtmpW5ac0rZvxLjHa/jJlSh9JDOBFPxikU9Ztd2w
	rA2yBxs97sdFMFCXsCvBFGSiqBplcLaetLw4jNfSWhJGiiZeN+jJS6EYA6WuG15H1LU=
X-Gm-Gg: AfdE7cn5qEiunfrEKxmPHacYs83K8wDlphaoqinPEnZ9+rVfFOtr45pJvwAl0hu8nyK
	riYjlYSsaCXCMLKeTCiesA9HVZb/cRsut5uTb0PRkTXH6d6Oi9xmwpI9g3XWi8+UUfU3DrPpbRp
	b40UMqsbXWxwTK9+eybRIwaTRY5I3WUSYXvDRg1KEz/MZEFPaTz8UNZjqRjTe/x/Giy6nTK6ppq
	xqsh+VgzocLtlmGJHCdkIBw4GsSipY8FIRMxXZkkBne/uCvFTAUwF8UpvfwaCFjljvZ12IV3syN
	kaEB3VOAqpEZJ6XQN6QQJLQKStscqvgXnGtcS9KE/d1H5GEDwXk+c10XJwUQLctHzoXZdUgYUrn
	rL34/+bPMLQ0H1yP8WUREQTg6lJCm8NggWQ/vp3Jr47fO9AxtZVlpmvWEWjtODWZYjLIiPQSyro
	WXPJ8c4N8=
X-Received: by 2002:a05:600c:1551:b0:495:5858:e163 with SMTP id 5b1f17b1804b1-4955858e1damr1152765e9.27.1784395521571;
        Sat, 18 Jul 2026 10:25:21 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495499a5847sm102758895e9.2.2026.07.18.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:25:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Sat, 18 Jul 2026 19:25:12 +0200
Message-ID: <20260718172513.986134-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=szLs5CcDZwYWzOei8Q+NZivNVZp3qcW3phKkPE5EB1U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqW7b5l0Xf7DwIpP+bsrs2vbQ/0/z6agzIC30mc po64ff2EqSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalu2+QAKCRCPgPtYfRL+ To50CACKAOW2gW2kAvbfG1qPbjTY5veMSIusBRt/vgLy1JwBLwrE3YL1Vr8xDm480Vo5R8Y564E 6h5yd/+HFf7L6zW2S9ed9J5TMpsfK959oUZj3p9v754oxy2N0Y9UDo2g5BRzuaGOjlVk0LHxpHW 7Q55+MdVLRvZTVkoqBfhWjatzbaDmqkUoNJI24uqTwCmPoUEDtQiUUQkGuVbOX/josyADAf+4Te nAaMpGU/X7oEjt+akpqneCOqxkgnwh0RN3VAz6KZG6x1WC4K9wx3h7vxwOnmfbTfVCFJlSj1tKw CWi6ngKPT6xfbRklyiBSkGWz8eKGq+moaY9vUUeaaZTTE5y0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_102528_793292_F92D0DD8 
X-CRM114-Status: GOOD (  13.55  )
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

it seems in the bluetooth patchwork patches are archived automatically
after a month. And that even if there is recent activity. I consider
that very annoying for contributors.

So to get back on the list of considered patches, here comes a resend.
The original submission can be found at
https://lore.kernel.org/linux-bluetooth/20260504160940.2168650-2-u.kleine-koenig@baylibre.com
or 
https://patchwork.kernel.org/project/bluetooth/patch/20260504160940.2168650-2-u.kleine-koenig@baylibre.com/
.

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

base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb


