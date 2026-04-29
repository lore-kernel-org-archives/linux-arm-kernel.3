Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC197FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGTs6AF8YA/dsJ5X6YrGeOvqR7qYdbsvIoXjGXSTGR4=; b=HvCfoCADJxl1kjb7mCOnxPsV52
	ugwT4rDX6USWeiq5wf19S0hynX2TmeGViqllg1x2V0eGJuKhjx888fUDy3J7x7HwHStRdqrqYa0ED
	wbKlyfcF+HMQ0vBfNYkmdSc+sgzRsbH+/6CSj8Lt2Xh0UE9xkBma8xWP67hWZeXCZbdlb8PP6+Qur
	kLt4+1O1h7ogeNPyN7sRIlE57RrK+5nq6mK4UBTuJebtdEDX6D901uYV39zwn65Ll9kBZbXZ8bt7I
	ubuSQYyisWfppWo0fFvIawR/ywuq6wE0TP2oPPjTdedpgcG2sVRMkongOnoi5wZz20V5QLXWrzMLm
	udQZNs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hx-00000003dXG-3Bkc;
	Wed, 29 Apr 2026 13:12:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hn-00000003dTM-2dBh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43fde5b81a1so9334970f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468313; x=1778073113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGTs6AF8YA/dsJ5X6YrGeOvqR7qYdbsvIoXjGXSTGR4=;
        b=ouxqjBr71HI4KR3hcyvUI+5sVUv5/quPJ7ojxPvQjLtD1BPN3NZ3bbi1Z9/l7DUiyp
         x+3kIBLHaYjYlCQrDeq5qF5woxH7g862p6jhMDUm+PicTFMxHg+22A+rnwueX40Ym/g0
         ildIwSVucPUcVYdYru7N1CNsDcjULLqzM9iWBrBfzECGDoKFhQX2KuYPDR45HgzSqvJy
         4b5NxhaXktM11wxAh5y1193tcjvn96Pugi2eKtM53ghEf+KP5IxZaXmL6dOPgeqXq+hk
         8aCqE8WpVGE48ed2dimarlV5swPHlhsxvqo7bd33d0rV7E7OrccEBG0Ja8br5sGa3+Dp
         dpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468313; x=1778073113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGTs6AF8YA/dsJ5X6YrGeOvqR7qYdbsvIoXjGXSTGR4=;
        b=o0jtUK9VJWzUo+A2atPbVvxqkB0AcHlaTY1D6Q7Te96yf0nmQXIpCgVRkmiUkF0IwF
         LcXg8S353kqJXYEWPECJeLqUkijF72iUx1Qbe5EYL77noxxgDNHI+LPjMRp2cr+yOLAd
         LbIQYThZ4cRRfsC65xPvS8PD06mjCCYomO/yxAuAQVq0Lq/soXsbFtKXzufMixXEE9Tp
         dU0VOkHrlaAjKufhhEvbDkRlk/e1gV1TVtQRBfJpPYWH9JNadnkeLFzjbvSudKFnxN3a
         BlQWqBoT8sKwpvHhMDZE9LWDsG/3lxT27wvV+m5A6g7iHmipgyBI21VyLySO4TUhGbP/
         jPdA==
X-Forwarded-Encrypted: i=1; AFNElJ9hlvBE21opDMRI/SCDNfxZ78KwJVux/oxe30V33gbyO7Efw76XETbDd85aeWrQgrIT+BZIq3fbcUekVGAFDKb/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhw3/8HUl1Ns5l/np3cDPgXK3GCXa3L0k9pwqU/HrmYDPYQvjt
	iwUv1DpDNHjm1WSezcf6FrbaY4uUvvFYn8RUjObamabr9NfkgRUtl8mJvsvudun6JMU=
X-Gm-Gg: AeBDiev2kXrzVr2h4rQ3gFoqvyPKAJpguqCGC27pzETxyMt6c4OxkRe/x7dMcsca2eA
	8P9brCEIAa8QZP34PiEIJWxVWMeWQPaZJzRtGekQYbhaI+o6+s/Fl8gKrKCa61KHngSrvARwKNS
	XZz7W0hJexoQsYmerhyxejUTaYxdHnctDEWrYXDgSWRYrHWYMxec9pk2ZqHxiq3/dOPlGxLKYPm
	Svo3BKmJOmcooTwAsB+Qwfq0TomK+IEHJveFjV847ithYFhMrICQu85XB15YneOYp6jyn8v/CmK
	k4iAednNYCBB00yCExP7mZuiSfikcjm+3NX9x4z7UXtIvt6VGAUnGoOeQmmmJ43LbCKqywH+Lyt
	O+Q/UajThHgQYNSa2F6buaOAsz9UJJBBQ6qiDgTHForB1T7Gx5cbRMPk0wD+ClAjBptV7N6TLSl
	cxoK0YK9BIzs1/jJUtY6wsl8VvJjzs1GrfOga6K9hRbsGN2YslWPxaRmI4bNclhWBMDKb5jSQ/K
	qQ2Wj7ndpTpRLRBnA==
X-Received: by 2002:a05:6000:2681:b0:441:1ca1:6404 with SMTP id ffacd0b85a97d-4478ee6236amr6849560f8f.18.1777468312985;
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:51 +0000
Subject: [PATCH v3 2/6] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-2-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=2353;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VKO+y19Pmg/NLq4w9DyMkKEZ4ajWvhIqJpQfNSp1fww=;
 b=1gWFaMA3Cd6Dw7QDwhBQgAQ8DdYnx8S5TmxRBEoW9KCayFmX+XpOy0oYB12RXbvUT0DJgo2Xk
 TeJmSkes8lZCIccs94W3mYrZcqMBIsK/nC7MMT+GLZDKIUgxFTnzRhv
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061155_691295_AE549F86 
X-CRM114-Status: GOOD (  14.31  )
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

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Additionally, if `acpm_achan_alloc_cmds()` failed during the channel
initialization loop, the function returned immediately, bypassing the
manual cleanup and permanently leaking any channels successfully
requested in previous loop iterations.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and registering it via `devm_add_action_or_reset()`.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..bd0d48e9d157 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -529,8 +529,9 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
  * acpm_free_mbox_chans() - free mailbox channels.
  * @acpm:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -558,6 +559,10 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	if (!acpm->chans)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	chans_shmem = acpm->sram_base + readl(&shmem->chans);
 
 	for (i = 0; i < acpm->num_chans; i++) {
@@ -579,10 +584,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		cl->dev = dev;
 
 		achan->chan = mbox_request_channel(cl, 0);
-		if (IS_ERR(achan->chan)) {
-			acpm_free_mbox_chans(acpm);
+		if (IS_ERR(achan->chan))
 			return PTR_ERR(achan->chan);
-		}
 	}
 
 	return 0;

-- 
2.54.0.545.g6539524ca2-goog


