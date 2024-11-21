Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25166E64014
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 21:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUUavdC9KXFSOqbuqB9VQAPUOgY2DcYv11W+nkff50E=; b=s+F9dG1zYyNz0YwdJODP1l6eDh
	eN26hvtPk+t3IJcHjyXIK+B3qXa0QPE1I0s1Ca03y7PIR8qQVNIEMGIQD9jz/ykNAZTrfb+jIhSHp
	ZXS0SalessyQgem1aV+hEO05ddOSL8LNn4ey7u5oQw9LnUNXPxcDs+7vI0enOJObVBCzSURp+xICt
	ZSuaeIZXbg8ozpMep8qYVfviQMw7kyQdsf2CJppNytmXyWyLzyFm0PU9nnCUfngGVA9fAzWMMfR0H
	g2lx95ccfmnOBVJZgEq0LBoa1oojOGTVL6omLYYVPfb7Q9lDC6fnZ1AeE8r3hwIRWqZptBDaoXJXB
	KbBSkdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEPd-00000000woe-30Fy;
	Thu, 21 Nov 2024 21:08:29 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEN3-00000000wLi-3j0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 21:05:51 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d42518f493so9464406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732223148; x=1732827948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUUavdC9KXFSOqbuqB9VQAPUOgY2DcYv11W+nkff50E=;
        b=DmMhrts4XBiJsl3q+AL5wYm8PPVwObCl1OgeG3zq0HpxZI/Wsx2bRCpT0/6ymoeBrO
         AESnAg8MRHhwB8lrrXaAVzziQeD0dM7tEBpafEnq7aOnvXcMrAxoHEozqjnfstD3s/5N
         FNnPgHyCbVywRlBDjnKdOsiH4v3elcbT2RLWJvp23cXTVMvgp2FwpLJoTjbjZpJLW+UO
         ii7mWJ7sH8fhJ4Lqf697nS96sn71td5aIRj29rqPf29Z0PQpIsYqZD1EqvFqQyGNW/vp
         Hz9xLvYFOwsyQ1T/yV5iaMJCHVHgWsufvmtrXKdhQV7+J8vwn06LyFTM7T0i4P5OEc//
         oNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732223148; x=1732827948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUavdC9KXFSOqbuqB9VQAPUOgY2DcYv11W+nkff50E=;
        b=EfJ87boXPSrckrIhOE8ip2UoIHk3nyTNgTa0hIJ4Y2bJH10GzmGcoz2HQb9p+3g319
         7I/kkufxcNJQ/pI2giq3gKMT4tCw4QYeb3ZtQYlxXno97Mvi1QkfjNDWew5w+ejKjzqp
         qhyYHUkG/QQE/xHXWsggl+piyg5jOU0O5GAg+R/b6Ta2S+5zPst+Ua+SBYEgmNrefVrQ
         VJdr8EeLBRwbf4JO2bbrJN7rxTBQsV4Vgn5U7hGLTZ/rTohFMW6WmPhKtuz5S4WKwbj/
         9wxx6U6J7ZUohLDKD8pkbK4um47I0//G8vsTt27joalQALRjqc9mLr92YxyHX8tbEf5q
         fVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmZdiPqToljuXM30qHaNEHrY7E1zwrsIDoTHp7yC2m8sl4bDT/5h26qIiwCJ8TXTqPrND/YMUF+MSTWXPTpnCX@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDc5OwjNW4h2EN3UASC4wud4x+pysEEFRVQ43F9/Kvg57lhsK
	79j0LLOcB7FJh7/DFk5+GNtzw5NmnrM1TjRluOkl2AyWwVyqoaB1
X-Gm-Gg: ASbGncsb1NZa/xUR+JPCi0elCmsNwfo6SWohpZKrwTHl2qmrQWpLQlkPVZjapyZlzg1
	1Bj1h6Mei/rMMn/C/LSGw01/iE6hzIsA4waym/EUM77wKU4RpsU5hqJ7XNRQanhRyahjQfMPh/E
	ktdyqSqFZzAv0+fj+bgTvLrBJTTomEP6NonpXqVbq4m/yp11dfACwdzmWf3vg4RAUlCM2RWWBea
	zyoJX3FqtqJpyw0OSSB9u/oMQFU6IFy6liEloIusL1lWsMJf9pqg8mP8lh+vTz+BYQm/EBn
X-Google-Smtp-Source: AGHT+IEmOD6xWP8JPHNPxGJBr5HO77neL74Fcf9zeBqiL3qskduADaRVqaWOHYGSFIJ1yUIEkxA3gw==
X-Received: by 2002:ad4:574b:0:b0:6cb:ce17:e80d with SMTP id 6a1803df08f44-6d4510167d7mr11722036d6.18.1732223148239;
        Thu, 21 Nov 2024 13:05:48 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b4a11dsm1658506d6.102.2024.11.21.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:05:48 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 1/2] media: mipi-csis: Add check for clk_enable()
Date: Thu, 21 Nov 2024 21:05:43 +0000
Message-Id: <20241121210543.8190-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
References: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_130549_933884_E441C80C 
X-CRM114-Status: GOOD (  11.92  )
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
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..d1c938065475 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,7 +940,9 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret)
+			goto unlock;
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
-- 
2.25.1


