Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B8CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=; b=G5XlyAbOqemB6KHzBN7rs4YyAf
	AgpDzoK6GcdnEjsYOOpfM1hxM0IuoR0VV3dldzjYnSok4C15YBko3wJCpRw/BuPum0g8UHrpr5gNZ
	gvfu8V6icNaOTosmaVi/8nlC60WE2wq1E46K0KbZHQtNUmf4ahW0JZ+AOcsm80+FJogZ+pR3ghJRW
	s8PIEua2w1KZhZDIVe2AXXBCNZCVDyPtek6V46/2jbOsCMecvjXt6XSbuYC7mEFe9cpmR8Pdar9Bl
	PYdM6Ee46RkDqB2qpbGPe2/OYyNf1T7JlMEv4Uxd5F+npEeHfBrZIUbVLkJG3opy3wSffxH1TGuZY
	VYSnUDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVc-0000000H9TD-0hkh;
	Mon, 27 Apr 2026 15:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVT-0000000H9Pi-3NsO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 15:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=; b=dKhFLzXG0Sj3c3Wfa2gz1Biy/t
	cRxQ/AD09W18mJaJTrcDx6XJnkGCLEI9NxPGcZgi7cRv2FcUMCO8JsGuRAX5x57x7TOYfjR4+6ra3
	BYc4VUeuhedHGoMaLo7yOoJVDZLwykwFqjtv0tR1K43CThcX4WFz04nwpy1i7ov95dnlkbyXi4KlZ
	KSWmZalY/LZ0zhNh/x83atVdi8EEpzE01tQU+tkchLBbxT8waTgbyrfKSUao1DNyjz8W/jfeHrAoy
	6Xc6L3eKkToQ3kmyu6DSe1VEzU6bd2AhYekOkhiBOrJ1r5AfnWv2AUdOxSv+wYie5MbfR4r7Wc3+4
	ehgMEeFw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVO-00000000tA5-3YQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-445795cf6f1so471943f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302253; x=1777907053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=;
        b=xzexvCfr7VaaKaSvBzMXwSSrSsIvC70wwuMLdnWDjCbrL8dChyYOYoEuD65HDquz9c
         8VZwYfP9U9T66MCUHBJJmW4ss5jx6GXR57fIdEO2ZKAvW7xh+IFcCWjVWKrNN1GUjAr4
         +4Gc6uKzYXYs1ZzHGmfrK4KwllGqNhwytpHa67Bwpzkd5FKiX/G8QnZDCGxHkjFMFfB/
         e9hHCXht7EUELpzi+ansV0eth0EwsOXvGiPhlwNiSeIMt6HdRPlX7hs39cc/XHoYoneV
         ubGQfijWkb1LSfc6Thp2bCiWZoBFw0fWKL1EtskyUqucFFgb0LbWcIixqDrYmkBONLCk
         MFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302253; x=1777907053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=;
        b=dGNI9XUYNSUmGOZtrrFtIU1ZezbIybIq7y5fHkF7zcqeKMB2ixSaA3Vjy4cODDKpbp
         jzDCAn/8RYGPGhup8T3NZWrgk7KQSSU5WN4tAj8/PNVItbhH3tH2Z4bE513GHrtgJ/UR
         I1zkLWpavFYu5Nbj17XF+k4N+GKw30MFmgBy5cwEKawwjcIE0U2tXV7ceXmnuyUOpRCd
         2JoqGkGz1iNJm3IergipTqxLtW2QUHZgr9bDUnr6uRR0HFuH1742K4JJ2B4/QodWSzLf
         pn77xrJgCvQ/vkhUfLgLFzSMXlUwmLP9IWn/QmFDipJk4V+vv/0OlFejD2qbzsPaq28Y
         ax3g==
X-Forwarded-Encrypted: i=1; AFNElJ8soaMf/d+DcwIMu8v/CMPvH3PDMqk8rXFt9GqBbqfcYIMUR05hm7kfu8DaTnuwjCCwgyYNz7yfynwge6wegN2h@lists.infradead.org
X-Gm-Message-State: AOJu0YwysWpgFv6u1ZGHRgIAsBbtFb1Lgo/xjqr+ZrzjoV3FEvZYLTTQ
	7XhcvThruOvhR9IXfXXgvez3VKR3hr0pLwoSuS9IAhPMxFpX6NNwbihFU3ee1cvvg5s=
X-Gm-Gg: AeBDievbaHwrxfT7yXqinxGSu0wyWXsDEqUHUcZyLejIXiKUioi8t/3qt1gDUSRpJm1
	1vwLmgECJ7iNNlgvhZKSbk7xkL0k2GMPlzSEpKBkX/TT6bE1QE+0b9LPuEFJdz2S4yrz9cEylSV
	PImSa62IrpeJ404WNUPFUprDnlsznRcO7DdTsc53Qn8gPPUO1hAClOzNKtcGl2snBLBGX9IyTJn
	dUxDZpglJsQJwzui9dhExd+DfR+TYVXHIuTcdSWlviqJh1iudocor8cgxm09v11DOwg8obEIcwd
	C26azAs32IpOgz/HJ4DEmKYtI/EGX3H1N8CbmsoAtr8JpoL7zfBDziKjQKkr0osmWyY/bujNUwZ
	nTQlXM9/1VP2SCVQk0pWUh0NKs/53PO4sJsuLgLmLq/cWn6dr8/laTYIeq00mpYMwC2mQqPC+j3
	X5n4OwxJQwIX8txIPViXAjInmzXsCOdwlbYVFEx6YWgz1t5jBowd7r8QfSqN7HTffCxboF7jKG+
	p8KUi7bYZh7At9kOA==
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488fb780463mr598840525e9.22.1777302252912;
        Mon, 27 Apr 2026 08:04:12 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:07 +0000
Subject: [PATCH v2 2/6] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-2-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2357;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ba+dTVUBhKnEfFMyTWML1d2ClIcN7W0bbbcIFyIYV0Y=;
 b=+4DHqrrOrGVH6m6Wr5Ur7SY6SyVl3EwK2I9IlGtYy5oHdPr9Pl50/6Hc5kvjbRc6gNH+qLFVB
 ynehG37WZSHCZr4+uQEBK/+nnABGuiJG/bdVGw9ezePZ9tunC9qr/lM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_160415_150698_ACD064B5 
X-CRM114-Status: GOOD (  14.18  )
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
2.54.0.rc2.544.gc7ae2d5bb8-goog


