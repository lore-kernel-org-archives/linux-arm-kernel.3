Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFBEC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2A9Dcjes/+32sERoSUov+ch9amtIj6eI646E87CQPts=; b=BFdNsz4KqFxo2W7OIKMfyNfaGJ
	hP1+eBOpAUNBHwjrW5TqaldfQ5/kAXaAzfQydTb6sIaouGexAci2dSnGWi5rWgtbTQHOOTUkjQSCT
	Hn1sbdl4fSYAujIKRvvY4+ZHbFetgLMVkCiv16sPmIbJdYKfpLtMfGCZuf8L9coz+0qWkNZWlUeUe
	unBosVphpfAktwUW8xhulXkWRV+IVR2gmZNnLKMMufSpbP0erjoMUBiUH5p+AtjJHXqBDRN537uo3
	apEHYy0hE6Fusllv+4B+T3AII3wwNkgzdhBIcE5hCmxPDZmMlkMZYNqGFQtLJj+FBk/4+w+9G8VLR
	yS3I6u2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40N9-0000000HO6f-1p3Q;
	Sun, 13 Apr 2025 16:39:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40LI-0000000HNzS-1DNn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 16:38:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ac56756f6so3057264f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744562278; x=1745167078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2A9Dcjes/+32sERoSUov+ch9amtIj6eI646E87CQPts=;
        b=lbzwURGyFJ3e79IID+h+2Xu6nHvwhTnbU2Rqh/OXRbisPNYXRDOm5h/CA6db3M1O8U
         kcwCEVxci3ueMnwozmDP2o39Oq4lOppnvVq7Rhw9IPbTTAE3s5EsA7lPu2XpaJIinC7p
         +HZezRjj/3UbXLYZw2N3xrNLF3Yn7lq7h+1EbdccOKhvqwe/P1/nUPZYkCvvQnYHyA3c
         ojG3+awRcJGPk5Ez7KHSulrp79IHtHDoIDVtujDkbpr26Vm4CvmNVhB0ixDkRNwqt7S2
         ZgG+9uEb5to5y7sIr/z3H/ofTqaDZJXrsi3MnVXe09XxlEwhLeAuvT6Sxnrv8HDrbgkL
         F2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744562278; x=1745167078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A9Dcjes/+32sERoSUov+ch9amtIj6eI646E87CQPts=;
        b=nVgw8GtBbfgPWLNWXZkPZ60K2+l5PZXbicuKE4SH7cX2VH01oL1KFQh1xkOJGIutNT
         kmZB7Dl86Oef2eqQ18WSxCZoOBvbQC/BOYTfJdv0gzKGP4z1NIIK76nerNBREf25mKuY
         aCR/V0HkEbSN9hfXFJwIc7huzFYLyDcaAV/b87/8Z73IRHNkb/Fg4vOu+UgB80ehxVyo
         uGhQSjakRGir5Ho5RTgyhhjDfonYR8EZNOoOSM0VGfecFHxJtaTahW4PE3jrE+RLyHQV
         bmActG58p0T0XUcKgsAuRVr7l29vuu4USSNFsnerL1W7vg1IWqoAWIWY6XI7NXEPzvcQ
         4shw==
X-Forwarded-Encrypted: i=1; AJvYcCVSbBlO8UFrzEuowUbY+aTQLoF6DrZLWIUlU2Ol5U3WknlMbtVP8w++E9ewqe5FJiGv1bBe4wILBzJAuopMkWhg@lists.infradead.org
X-Gm-Message-State: AOJu0YznrixJvMadQWna29pZYx2/qEZCKfq7pDUuvoMCdyFkLUfICWkn
	hSloQCAtKQazazhfm3taqZLoS+GJD5d3P13UClSstgW0LQhHtVdZU3sC2w==
X-Gm-Gg: ASbGncuVFbAuYyy8ndYHwEmPwu7PW8g641yt1eSlXYmT0S4lmdqQRKfLgPFZ7pl5cuj
	TDKcSIO5n7niLECc3hR0MKXkrP0kgVEsfG20cdCcKvsl+rihbBWamEAvSShVlGt3ITr5h1gSyJh
	RLuQEXtctRkHJ0GFe55oS9P5FgRrCauU7X7xrx63uq+TR+uKcFSvkDkcB4gacX6H9W2jfesHqlc
	VYJhHzgRD/EXHAWC+o95rDrd2bNidDmkB93YTAc3Oz0tdSgYcfb7SS8lyGxPtyf+ZJ8bOTPzj2v
	HYvcxwyhxMZOa7PlwA9Dxd9JWTcmR+vAZVrXr8RLSpxw2mBtx6eBhBhNg05T4B4Gw/znlS2932b
	U18K/+iK6tOrKtKIk
X-Google-Smtp-Source: AGHT+IFhCxopziJZlWQ179r6LZuAG9+1Kj/1Hh1QH+FwbKfdGfTQzhiAIMLXVWuSTeTyxw0yzNXQqQ==
X-Received: by 2002:a5d:588a:0:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39ea634bf9amr6390646f8f.29.1744562278315;
        Sun, 13 Apr 2025 09:37:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c49f7sm147450895e9.17.2025.04.13.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:37:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: samsung: usi: prevent wrong bits inversion during unconfiguring
Date: Sun, 13 Apr 2025 19:37:55 +0300
Message-ID: <20250413163755.788907-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_093800_328613_4BF6EA7B 
X-CRM114-Status: GOOD (  13.34  )
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

Instead of setting bit 1 (USI_OPTION_CLKSTOP_ON) during USI unconfiguring,
all the other bits in the USI_OPTION register get inverted, which
should not happen as that means the clock will keep getting provided
to the USI IP. Remove the unnecessary tilde.

Fixes: 11e77776b58a ("soc: samsung: usi: add a routine for unconfiguring the ip")
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index c5661ac19..5f7bdf3ba 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -233,7 +233,7 @@ static void exynos_usi_unconfigure(void *data)
 	/* Make sure that we've stopped providing the clock to USI IP */
 	val = readl(usi->regs + USI_OPTION);
 	val &= ~USI_OPTION_CLKREQ_ON;
-	val |= ~USI_OPTION_CLKSTOP_ON;
+	val |= USI_OPTION_CLKSTOP_ON;
 	writel(val, usi->regs + USI_OPTION);
 
 	/* Set USI block state to reset */
-- 
2.43.0


