Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B540E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Lqlqa+yVzadnVCts+R28x1v55t3TnviPyK2Uw1lPbw=; b=lZeOnedtzP2kOkjql+o0OMv6zA
	7JA9JuiOmg4kPT2x5wwEwIgA8IHb/xqpa7Gp5VJR6Ugvb4fNvILAyZ/XTNS4QKS6Dz4fcZoZiUZdX
	cKnQ7muMprl+UoqNkO97ZiWfHbakRh4DVHmj2MuAmf3c32rBUV6DISYXENC4uX31ndjj8L/5zvOWq
	UJG/yTSQtZipENcVMtnc6YLYaxLHfi55iVt+p8q/CfWktHaXkYHcDcDyUVqIC3WJflKlX3glmd5We
	QXKM9Mfb76QFTBxO9iHrvBQLn66b/knHsw3AQ2CVKFt0W4ehEskWIC/plO+bGirAX4OOTN3jtVY55
	F73ypjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfsB-0000000HZ5f-2iS3;
	Thu, 12 Dec 2024 09:52:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfqX-0000000HYng-22PF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:51:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso61382166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 01:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733997059; x=1734601859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Lqlqa+yVzadnVCts+R28x1v55t3TnviPyK2Uw1lPbw=;
        b=jSajL4xNvDoPvd/Ibthdu/XDI5IyWC30iKoUwZtMfF5oB27py8GAfxsoDQu8lLaWr/
         LpYAZMrQF37MS2e3HT7hBo1v8GKmpMind8BdjizpL2wbTsyLScdjXGPcLWxaxBXH/EiE
         bGhPz1wYk/QZmXWSn3DTvwpvEH43aiuagB3e7GeERBuUI160Z3ZMiOZUjeA6tEm+35kV
         2G2TY1nqLqJxmp0ePfsA9+TC+CdG2C42eeYgDmtAqJ7JcKXXykNg0xt9qncgK6J+N6Sw
         hcT4+Elx8kl/ccpfJjqf9zQaN1tipLNTvQfM1DZUImfCZmEjt3vmmoXeqll2vOL7Fxcx
         xdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997059; x=1734601859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Lqlqa+yVzadnVCts+R28x1v55t3TnviPyK2Uw1lPbw=;
        b=LBb8KAyFHA4dfG8jX/u/IPXcZB1aqgqHoe8YydW7IMLu21M827iFq8xIjPYpoeMnrE
         icW2CYl9XxLvWRb9cFhx4aqRpSRXmtxRWLmDCBdreJcVmGMStni74/Z4CUUV9EJXrryy
         VhuycXdTA2ynCaw0BwXqMhjAmY8MudX8CnZEynze8gSL1gBRZDjgoeFaW0jJO9+PS/nr
         dlFeSQ6yWghI1Ky4NF8M9w2hlYhSQvES8Q/xkd1K5Vb7Nt7X5HiZKhPizFWQbOTYfQ1F
         joSnlzK648Q2tvUtSSgTNk0e9eloehsJNEzbYbBd7u0fICO8X4hknevvVOsBn7lZMB34
         eTHg==
X-Forwarded-Encrypted: i=1; AJvYcCWsPPpW2KeIQ+6ohHt9kB9FYhvzCUg2Pen8Dkt3BiMq0DINsek/jEE6Y3La5KrfqvUGVsBBSZMi08nTFbNxQBkM@lists.infradead.org
X-Gm-Message-State: AOJu0YzeLUG3XFcSfC/Q9g51ZQ0eup1vlfUl08En4HAuLjUlrP60sCFt
	sX32Ervyas2923tDVkjlUQJB5KGYz8BWdPjYNx8e14MMqp9Lwa13
X-Gm-Gg: ASbGncuydl4Sh+xgw4DM6r6I9Q+As7W5p5n4Ju9mjAwR6e61act0l3C/Te28sXIAyKI
	5TADyxi2CTWJMAIWQZFDzpUAXzaAaaCj5HP2pv0JwAB+O9A5RFjWIR6/Z9c061lx5fSgXBfwWpV
	d8VQBruCA10d6/Wh97w1ucgxwHKAnCG65IsqaHjZuzb9GrEJFgH7OR/PuJkzx2oVo5SOK0xiN0N
	nKW1b80LkhkDO4/jMjLv/jwiNEcjEk78qHrC0tfQiduHWLDMrJAyn8ij1C6Ac3maKk=
X-Google-Smtp-Source: AGHT+IHIXf2ITezkzRXYqhyRdc3NGo7nV9HtTD9QcXe0iHTpQ2fk4AxkW5PqBr9zOQsKQHtffVHoOg==
X-Received: by 2002:a17:906:18b1:b0:aa6:8676:3b3d with SMTP id a640c23a62f3a-aa6b11df74bmr563324966b.29.1733997059330;
        Thu, 12 Dec 2024 01:50:59 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6701b08c2sm714818766b.124.2024.12.12.01.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:50:58 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCHv2] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Thu, 12 Dec 2024 10:50:57 +0100
Message-Id: <20241212095057.1015146-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_015101_521646_9AA2DE11 
X-CRM114-Status: GOOD (  12.50  )
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()

The issue comes up when the expression
drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
Now the constant is a compatible 64-bit type.

Resolves coverity issues: CID 1636340 and CID 1635811

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61e..56a261a40 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1


