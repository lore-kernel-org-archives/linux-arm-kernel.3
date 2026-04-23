Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95AF589DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1raj2hLcvt/ctJ88E4Z4hbSzBiYLTxybyHDMre6WH2o=; b=1UuSK/tYWqIM+7lVMfdnaPxtpd
	bbmIMaEEHfBRmvNsycCZ7BPDU8+OMVhS9ChrwqjX7J6cv5otorJHeoLeevwyPxVF+TVsPCvuKn1ZE
	ZQPVU5d6bDLlk2doDmipHPrw2TiSvnCIAGY9G7ryKiPm+d/GDC5nnJSXTlnH9ZtQyhZLmCmEETR7u
	faPz9RObP8lBC1x9c9sixVGL7gR+v1U88HwuY1RVAXyMPGtbJoGa7jCeBZcPrrQK2bAUB3JqNvJpy
	2xe3uI79u6VLP5V9BjZsx58kOmEKhybiaiIKEekl8yBUgMBFkWFluny3shsEfrVLn6fV+9EeEowZT
	/eWmi9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuts-0000000Bniq-0POZ;
	Thu, 23 Apr 2026 14:19:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutb-0000000Bndv-3nRk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:19:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4662281f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953950; x=1777558750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1raj2hLcvt/ctJ88E4Z4hbSzBiYLTxybyHDMre6WH2o=;
        b=PRA20yaZ//LXJo6FK/yjUnENZ9A9OFzNUD/0+ry9tw3lxpW1wERYigDPBYFzFQKe0h
         aQbX3C7Quw1obS+fRJqfapZi/LpPlwo7kSl3pq3XX6sicSWzE9etw4HRm/rIt3dCQEfe
         MDuUk6PtdNYxFXX/iudsqOPuSJDks/MZHYpvE5jj79WSBKPLWBUi3My1N0emymq5BS1r
         68X1Bn8jYOHPTcCB8HYru/5p6vH6HcWi+MAVPy63gNeXmu7AlKAIwrfNo8UrMzEBXjgt
         qiLHRuQvGBTdDPTR10JAGFDZIINFZJ9e9BmpsUbj1iuqprk2L9gP1H26zyN9+CcsD+5Z
         jpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953950; x=1777558750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1raj2hLcvt/ctJ88E4Z4hbSzBiYLTxybyHDMre6WH2o=;
        b=Ky3/1BQakcSzzaMqnIFWUjd287L4gYmy+NzM2yHIDS35eZfhlDjAH42vN55Zp8d0KG
         6PLJ96Upq64GeiTpZxsgQa9lFLrJDKqKaMpU5jsYxiwy7LGDoZCv/JuZx4OlSTfwC67z
         3yPV/6tMUP7Fmh3KqQ9sjpLNkKNrrKf2V5slhT7vSFWrY6XhYSF9/QRtmicqoOg02pJv
         LCqnOvgaG01i8tiq3/i1hDOOwaKnbsHgbiW5jbe5XZxhAhyx3J5mSBwZsdu+fOsJDLNq
         hFg1l4fpCywaKSQmaSqOctDPTzKM0Vk53Lc8u9J6hrlrlkivWqy/XMDfgqXpYHiGT+gx
         4Ptg==
X-Forwarded-Encrypted: i=1; AFNElJ/sJUD+7dsB8LxOg+jE/B7ubn9rFzASHWibkGMEHJ5mTT8lRAObrcIJ/AE6y2j9qxihaSMACbySsqNqcyI4Yp4b@lists.infradead.org
X-Gm-Message-State: AOJu0YwUT4cF8r6LEkCNTlZtj4erCESPuZ48MuuuevK4hrbm6Ue9DpAI
	Rf8bdAoFkcM6aI3RX488duo0mzMzZdKJwvUuKTiWrvUZZX8SPwNdcX1cTiZjveXLE6wqXoQbzv8
	J+xK8UP8=
X-Gm-Gg: AeBDietFnsJFK5x3KPM8qWBuR/BE4r+qL+3CTJVIjpELD4zLUNHZ74DVu5RENJhaDR+
	QLvm+BPGpX/lp54heNsxr0Xk9wlvr9Q8DEEbw+UfE1c63S+Gh3n85n8/TdEvA02CKvPbgVgjtRi
	oIJwr0bX25j6AdTbHgPg1S1fxYfOdghNeJ/sgt/SFzripxjaMyKNzply3jFgkhx+g2S84W/X+g/
	TwjX0K91ptJ3nCXywt/iabliM/BIy6BGaSczZEu0HtUnWvbepx74N73Z1ogCNTlBIsx2Axuw2Cg
	GkLQ0Ig9jT7BPVu4S+MwlSNemGlf6HJ4g8arm05cCpxgPgutO4TQtyu537CMfTzxULstCZV7vGA
	ILjitIXQF6VaAKs28IBppMBUtTKZ/bloSWp3klORv/+VQFHaX4awbqPz1ujY0I0PYGMJJ3zhgG/
	ACxGemIuxAA7tQ+S5iMmtYvh+8xBpgGNaajaUfjV+0vQhhWdI9wHcdI8fCfQZ0aW2OHMgRxsEJV
	jgtp59KK5IdqjWexbNre2IvHrJ6
X-Received: by 2002:a5d:5f96:0:b0:43e:a73e:cc8a with SMTP id ffacd0b85a97d-43fe3e0aa94mr41477511f8f.36.1776953949571;
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:07 +0000
Subject: [PATCH 3/4] firmware: samsung: acpm: Fix mailbox channel leak on
 probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-3-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=2175;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kOgs95O6JRaZlEPi/372ZddtgKAq7o8MYF3mwzBuWXQ=;
 b=18HbsNzGpOO8k/tK09MU8TicbRqu3E9ILnKYrDV1cDHGI48yY+5TskCUogS0Dt6MibK/x9cgh
 gCD6yJNK1UnAM7ibtJDYED7qeoBJ+rZZTFISCeBmJY3R1GFry0GLLhk
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_071911_964526_77DF4C0B 
X-CRM114-Status: GOOD (  14.34  )
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

Consequently, if a later step in the probe function failed (e.g.,
`platform_device_register_data()` returning an error), the mailbox
channels were permanently leaked. This prevented the driver from ever
successfully re-probing on a transient `-EPROBE_DEFER`.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and wrapping it with `devm_add_action_or_reset()`.
This hooks the channel cleanup directly into the device's managed
resource lifecycle, ensuring the channels are properly freed on probe
failures or driver unbind.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a9baed5762d5..896fbdc2700e 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -535,8 +535,9 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
  * acpm_free_mbox_chans() - free mailbox channels.
  * @acpm:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -658,6 +659,10 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	acpm_setup_ops(acpm);
 
 	platform_set_drvdata(pdev, acpm);

-- 
2.54.0.545.g6539524ca2-goog


