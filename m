Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D58C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=; b=B1K9uolkrCqlBPgQaKfA6sDf7m
	wxchRy4tD8Y5MOCNWpIsASujCCNROazj7C/9PzFK9SjtCsy+f+mjYbS2YOu0mjHopj8BE9ALRCp6i
	vfIcrdACnzMUiE9A8yb+Eaec2AZAX+/8kmkzdr8we5wTHyCJnDSoTuVxPnmcQPtvXM40Cmp9QAdAe
	H4iMGMNPv5QKwj5CBRBqhYMouNdy2vb4psmLLxSJ4Y6s01G4flQ8BMq4udMWkMDNLs+gEs3AORiG6
	K81u96W3c3ZAg+y1QxyXyNeCTFywF6GlGfVihdBvVNTQmbWP2re+ps9V6RoKIukxvlPhAa+EX5yce
	aWwao9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QQM-0000000DT7j-1sU8;
	Fri, 18 Sep 2026 04:42:10 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QQH-0000000DT6c-2q0E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:42:07 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ee1f38so2860225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789706524; x=1790311324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=ofTXXu/T7q3/hZX/Px2XNcfAYht0uJhIbx0XPdys+/Iw+vOPGBSdasEiAvf2DEz+Ym
         UJz5VAYDPXdr+r9USd/L4syzIQGLZmxcH1xTh95EVBoLdsHR6oW0TV2rN9QtfDDFJEFr
         bhNiXX6ewTMb3Fz3zUERe4s306dYksEpHkjb+WgqNzUvA2sUcECKUtqVgsm0kOtHb3Rt
         RPpsfTsyhVaFleu3b+hC//F0S7a5YP6scem6ifPTei5xUn77LrEOu/lWn+BXBEb6kHFE
         kbLo1sIgtQSEWsaMbaOpeobTv55DSKu3RtfUmw4oNCIIYIVGFaSWsCTLOsyQ2Vs17zaG
         MP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789706524; x=1790311324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=dlnacCHLwTKtb/b5aCELWlYf+T7tEE6U8AUw4WH3SEZBKej4U/9imcmU504Us3a2ht
         0YutU9ii9yxmLlmMxFnzI/xRMKNJ1Kss2Ub24g8RvETNduXaMMe3FpjsNSzg8Vi3whBo
         iTFplu9sXrnEo75K6r5cKkMmB4SovHj7GpuYlpdgJOJIq/mNbfJdwaRSTkbsvwwfXVIL
         xE3G2+FLT3XuB7Ex5//DZ8mpjwnVlImwQRnRkofr1ItQOs2NfZK2Uw7G3qPKZ7PM1qII
         KTSmPpb7L1zyXBg/Tebm9hbtIkSPRmtMrBvRpgt1nGzYkt0EE/z6wsIYXFNMWVoWTYhJ
         rZxA==
X-Forwarded-Encrypted: i=1; AKwUvBybHkSh1/gpAyfc6AaYNGJbnr1uJ6XDSvC/sWEXVAbVszX2muQIrXrl4Ci8uVuXCBsR+Lvyj2muxXp6KGzqeaQQ@lists.infradead.org
X-Gm-Message-State: AFuF++lU8sDcVgbpjo92W3/IOHKmb++zFmAlpgu0A8gecdYbb86UM2bK
	3xdN+2go1FiENNN8jeP9peTW9xU+tpZBGwvQJOMWr9yfN9Zoed3C2/0=
X-Gm-Gg: AYBFou004ZO1ADBZ4NyNlgXAzAX1XqE0ORoRCjTDZZXk6UF9xgIf75ThfZfgshnGbrm
	ypX1i8CRJ95naVUpX2bmX1JyWdfzaWgQyN/wMFr+WL+g7PlVN14wFugNLLkq9UJJgUt1BNBwH2T
	mHnbQfSz18B+zXXzwSxr3myYKHd6Al1BU9NXcmC2TwEtYfScEx1aacvU9/XTsf20OUnnOXfNa9a
	q7+tyjW3N1n0yVBKFzD/fJkRbxJO6vBl2Lwmeyqgmy4GpU8JOV9YFrvcq5KbomFSPSs1JBAsSId
	ziHVtPUiAap9KZZes2lwsOApwGbZDQ4SyRtnhVXwmoCUcnGJ5CGc4yD0cZzk8a3hQ+jvUD0tXxg
	y1pyZkrDWzpSpUdKHgYAF5BS43WntgEuHeBsiSb4VODrkcm/Mg//1aswzHFbc8NTmP8aisaZn54
	IDG8r5E6A0gmcBR6/4frS756vvrHcySVuPZ75twPbi+Uc/i0TTKWKxS2eHqM93ekmq174llREXi
	5nwIbLpcqSAWhZDEYfk/1g=
X-Received: by 2002:a17:902:d4c2:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2ddb1c15766mr23812395ad.19.1789706523953;
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760d684sm1704675ad.81.2026.09.17.21.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	mcanal@igalia.com,
	wahrenst@gmx.net,
	triet.hoang.dev@gmail.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: raspberrypi: Handle cpufreq device registration failure
Date: Fri, 18 Sep 2026 11:41:30 +0700
Message-ID: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_214205_721941_BA029A27 
X-CRM114-Status: GOOD (  11.36  )
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

Check the return value of platform_device_register_data() when
registering the raspberrypi-cpufreq device and propagate the error
if registration fails.

This prevents the clock driver from reporting a successful probe
when the cpufreq device could not be registered.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f1a99de6de4f..9882f243d681 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -553,6 +553,8 @@ static int raspberrypi_clk_probe(struct platform_device *pdev)
 
 	rpi->cpufreq = platform_device_register_data(dev, "raspberrypi-cpufreq",
 						     -1, NULL, 0);
+	if (IS_ERR(rpi->cpufreq))
+		return PTR_ERR(rpi->cpufreq);
 
 	return 0;
 }
-- 
2.53.0


