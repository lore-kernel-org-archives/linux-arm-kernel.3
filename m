Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A36BD59D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=; b=1pc1bia3OTyzKbVC6119peRnrW
	6qTm2y4vJdPDXVCOOg48xzrv+XWnpOJlIgZuNeAX8u4mzzMLrT3KuCO4ho1imTHLsidUurzJ2ZPfp
	EeZY+7WDvnomBWwSQwP/SIUOOd4X0NHAQYjBU4wY1/aQ2N7bedsLS6hpVvY9PkcwS5CvRVAnOYLlT
	xsbgq8NF4RTS4OpCq3a8GYENmgcQOZQaQ3Br99f5dnVy08iw86NLm02K5xbrgq70YzYNJipuShDCv
	AgCwVjPh8RbncWI8zUwtLzHYT9MBNNlP4zCvyAJCICBfP/ZiC2b7CPvhWERRAu5v6ni733f3J6kRF
	XKowuq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFed9-00000008xFg-34Z4;
	Mon, 25 Nov 2024 19:20:19 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFebI-00000008wvc-33dY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:18:25 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4668cec51afso13877801cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562303; x=1733167103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=TsvmcydZn8kB6YiCWMK2nLBu2wmOdZHaudHmLen2mpn9X+2425EWkLLlB5Bov7SdRB
         O5yZGuacdMUVf8cYjQwqCciTZ7V53B8n+Q+h6+DZlAbamvUeOoO/A2fDglB5TjBs6XkM
         TbJe089OCWiAWLhdbkwldBfXyxcyMrL+HbxfPTf3bEWFTqMqxXWBLVOy/RzKH5Q8PiSU
         lnEJr0J1QchuGujWbYs7WpJb/GukRHGU/0jhELVwo+te8DdOIApIPi/AXe/VtLG13ysQ
         /P5sZjXnAC1aZ8gxD8T86I9UovIVMwjCL86tWrzqlQn3eOrasBrVb5iLtFRcRP1ZJXaB
         FYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562303; x=1733167103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=FFyb6rnYu57XCuq+4ElFN8eesq6DjdXsC4mKzTSsOAuncfIddA684NBpBzsAOBFomt
         Hn/T1vhPYdAKMrt2kZGUno7cYUnwPd+OgGIaJSCZ67eTc5U2JktlwTBU0r7U19w2dMwm
         5kJv/D9BOaVRpgQsGLuhbNdsoEXdv91ixvTveyak1vIOixynJhbDmIvxDYa3r66iiiSz
         sOfeijy4dbTDiQ5gHDE7xDiEXdvRieiTJ7nSsfdyeLxgHVLx2pLPvMn5mZlEZiqvSBBF
         SrAHAkY8LXkNpRR5Z25/A2KQHnHfFh2HUOyR1RytINGi6cN7L0OcFcIGnEljnnRn0yFb
         ZD+w==
X-Forwarded-Encrypted: i=1; AJvYcCULOMoKD+7oPFCDr+O7FEGPlZ8EEzw+kRNf64FpXGX/ackS+NTrzmSUfjBz7B1w9wGgEF1Uy2Zh8a/bw84h2nCe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyx48k0cazzmaSQwplsy3Jn1FQFSHKXcVCd9ejZGbYMpCt+/wA
	Janm3Z3Milm4hYwOHqtvAmby4SQCjcfJYmgW49LRdUiIAt1F+cLaAm52JQ==
X-Gm-Gg: ASbGncuBteqkiUAZFFRl+Zr6WvJoAQAPzSowbzR86BBTXvGL7vJym45Sdcr7ZX1LDGP
	JbfEzvTU5cw7lI5XhFUVWHrKlsJCNEdbs+q7ylb5h8eQwUJiojubbmqD8aszkIrEBoE4xxA0ep/
	x0MVZB83IgKiCrZqmsZh61MubMIfUg+Nwjx2gEJ6A5pqCR+RR9AIcOUQYd5ULkOoFaOLmQ2UaSW
	cwFL2iujBZP9cTmNMzAffMtCDCBrksTO3x7iauIMFon5pGsYe/OGu/z3nJRHG4Nkoam4bt3
X-Google-Smtp-Source: AGHT+IG58OQhLBaPrhh2bJX4k9J0UG4UvxEIeq3Wd/sphHg+BCvjNpTkmqCSn1tq3goDjKzewrs4qw==
X-Received: by 2002:a05:622a:41:b0:458:2b7b:c45c with SMTP id d75a77b69052e-4653d6280c6mr235109651cf.39.1732562303245;
        Mon, 25 Nov 2024 11:18:23 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466a41010dcsm1193741cf.23.2024.11.25.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:18:23 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH RESEND v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Mon, 25 Nov 2024 19:18:18 +0000
Message-Id: <20241125191818.30708-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
References: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111824_758150_DD7F2C22 
X-CRM114-Status: GOOD (  12.92  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Correct alignment to match open parenthesis

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..452880b5350c 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,13 +940,19 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret) {
+			phy_power_off(state->phy);
+			regulator_bulk_disable(CSIS_NUM_SUPPLIES,
+					       state->supplies);
+			goto unlock;
+		}
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
 
 	state->flags &= ~ST_SUSPENDED;
- unlock:
+unlock:
 	mutex_unlock(&state->lock);
 	return ret ? -EAGAIN : 0;
 }
-- 
2.25.1


