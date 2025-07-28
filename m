Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BADEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ItkzBZe1xNWTDxJw3YTXp/blm8WuT8V/aqN+K06Qllw=; b=eiy1vTl/+hS11uoykok/EpcoqZ
	gjvEfeX9R8yrLtHwx1Xhc9hTJmdapERUSM53geyWqL4VmTED9Od9UID6gZtrdnb4qvr//DGzd+0Rw
	MXqbfyxEB0uwXt65FrolXsPYXRnKlwYKmtSVwhU/r40XdzLxLvrdhmV3jyF5SYsE8zaVlari7lnJX
	K1wECiYKY8WYIPqJFWx0JZ1uNzRCpQi358FxWeOyquzmN/nQebGLa6C/ZK7rXk0/iGa4yH1rxoiH5
	2u9OPNVptXe+w1qKtMLRnTZBvFOA26UOMv4a9sSYDQLNypQcVgsuk2cDYLyZTl2Qqfo2mwOiSI+Ny
	ZIyasIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTox-0000000FKil-1jBE;
	Mon, 28 Jul 2025 19:47:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTmV-0000000FKa1-2AMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 19:45:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso119615f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 12:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753731905; x=1754336705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItkzBZe1xNWTDxJw3YTXp/blm8WuT8V/aqN+K06Qllw=;
        b=SQNHhv07YuwLJVw1U+NhhVvmiay030fDzTvTq5rkI8yrOkzLCcgLoZkCSd+cZWSUQV
         //mh7E8/QrcKYq2/3vwMQ8IyU4NLNGzXjvNKLi8k1MgA9+KK+17wlt+VlcJ7hXkkaPSP
         Y6uUAACHVr4wYiUpjYmfmvJiBCr2XuO1Ca5/HOww7jsFqa7afpseo4rnnwqPVmJEkKLx
         YQsRRHKTNsxHmaOxvQUrpcfCjC842/m+TIKRcOm/8zBBEfiZExx7vVO1aqgpvrjZiYrp
         /xDllgYBYU3USm9s5twytAITJ0i+m6IeXGVhum+7D3hMUQj0j52cuqj2zOABBkDsXTHs
         0Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753731905; x=1754336705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItkzBZe1xNWTDxJw3YTXp/blm8WuT8V/aqN+K06Qllw=;
        b=G71qXnubPhL90TBCu9cydRVkzOdEeaaI4t7/GPsle03FiwbQ6JD/IM/Iet6hnV3hm/
         FB8idFzjoQt0lPXw0m/szj1l5UvaEC2PSzF8LULoAk9u1QFKYYR9TZksBoqC3jT5WIKH
         D8ddVHlsseZJE2QZn9ZOW/K7scMRHdcxlZ7nhYSIES0SlECtbwRMdxEse4uNkA+XfshL
         q7gEPZKJ4U2ZlrKRj4v2iSPmnpIXvJp4vnf4NdLFhuhKdyEXYmDLZb+RPSYD400MZuN9
         ifdHKkDklckaYi4tk1Q1EdYQxTPfM8ygIlTAnPHsAB2SHBjepbTwqcLVaxQfB9nD9J0T
         1l3g==
X-Forwarded-Encrypted: i=1; AJvYcCU15ZhfgE5GOxhES+cfUv9Qb4SmXlNduWmfKqcAhsHQruJJNmH7EkfSTOwJaA+ARXcucCEU3BmETmijddLefr+x@lists.infradead.org
X-Gm-Message-State: AOJu0YwMnwLYzRUBg+ED/dtiGA6BvK24MsPGgl5IZzxPRHcK4OHIjQpc
	c1bzU4fBAtj5RtTVDDu3VXpr55OzDdyhEmUfuE91AHLNtaTi3JOr16ry
X-Gm-Gg: ASbGncvwjgD6K4xNTRXvZquuh5xEHkcpzYRRjRp9GroFYb0FlQ23eTvGoRLq0UfVTHz
	SzXQ0wRv9r0F0aS5tgYkpA0LqsctQn74M81zNwGOBli9JrY6FuuvHc2ey51lI2bdum50pTyjvX+
	C6TrPqM6YodigPpdaGOua3lYZMAa3+jaWcoFUWTPILFJAbvlfsqhIFZqVBHC1RzEBGXnH/xhtn8
	Lsvbulj060foPAhO78Tv8cH6G5HJf8mzaf331gmSGDPQUj1XMTRp+ls+Fh4ZfOFhje6fi6EEWi9
	qiZamntMRpCaGGXOk8GGNokyDNT0gbcHLKdV3oD6xbBwcum/MogZvZ4aHv6UYgH1OL6cCTpipAr
	CdoWfvTzkV1ewbBnDoMG76ybso2IwugAnM60UWwy5tZbUqx5r7E1n/BxY1lGzXxexGWQFfg==
X-Google-Smtp-Source: AGHT+IHY8hLa8p8y5iQ7pp/OFOj7bim/OIX1NELu4CwTPhxkimsWDOt02B6vAdwiG9TIVZN04Lvssg==
X-Received: by 2002:a05:6000:2a08:b0:3a5:3993:3427 with SMTP id ffacd0b85a97d-3b78e60fbf0mr426846f8f.26.1753731905198;
        Mon, 28 Jul 2025 12:45:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f0c477sm9547837f8f.58.2025.07.28.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 12:45:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pwm: imx-tpm: reset counter if CMOD is 0
Date: Mon, 28 Jul 2025 15:41:44 -0400
Message-Id: <20250728194144.22884-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_124507_559323_93A6382D 
X-CRM114-Status: GOOD (  15.26  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
of the TPM counter does NOT get updated when writing MOD.MOD unless
SC.CMOD != 0. Therefore, with the current code, assuming the following
sequence:

	1) pwm_disable()
	2) pwm_apply_might_sleep() /* period is changed here */
	3) pwm_enable()

and assuming only one channel is active, if CNT.COUNT is higher than the
MOD.MOD value written during the pwm_apply_might_sleep() call then, when
re-enabling the PWM during pwm_enable(), the counter will end up resetting
after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
normally expected.

Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
written.

Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v3:
  - added Fixes and Cc tags
  - rephrased the newly introduced comment such that the bit is understandable
  w/o having to check the TRM.
  - Link to v2: https://lore.kernel.org/lkml/20250714123634.6442-1-laurentiumihalcea111@gmail.com/

Changes in v2:
  - dropped the "VERY IMPORTANT" bit as per Uwe's suggestion.
  - Link to v1: https://lore.kernel.org/lkml/20250701220147.1007786-1-laurentiumihalcea111@gmail.com/

 drivers/pwm/pwm-imx-tpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..5b399de16d60 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,15 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * if the counter is disabled (CMOD == 0), programming the new
+		 * period length (MOD) will not reset the counter (CNT). If
+		 * CNT.COUNT happens to be bigger than the new MOD value then
+		 * the counter will end up being reset way too late. Therefore,
+		 * manually reset it to 0.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1


