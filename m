Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B16E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 04:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=; b=vrbDyPSAOxidghQNfT71KGFX/Z
	BSniTnPqxPDRBEEkAxhHKGWuVE2FESFtgD//LfMXQUy1dxq24+0hDRz1XTfDeDiY5SxSaRb5yAAvQ
	DnsBJBExges28B6bziB/HAWEAV5+KGYnYydr+zs7MGEazjMzUOYGZJ0pu4u44bgssol2gIHY5aK5X
	bjjSny3wlIzkjSK3H4Q9+ZokUBSsaydy1le9AiqAyfxLdBl9YP1z0TdsoRe2DYs86AkZ+he/z68U7
	C7DktTpoOXnluFsoACVOLeyZo1LmBJlMqKbWRGguBJZMAKFrK2vs8SHFMckHpmBn5Hb/c9iTlG0gr
	sDshX9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHoM-0000000Dp9N-3z6p;
	Thu, 16 Jan 2025 04:48:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHn5-0000000Dp2i-3bnY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:47:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2165cb60719so7278955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 20:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737002854; x=1737607654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=X1hyBxslUxRw2HYqeyFLwbDRPOSFTxy8nr1g2m+ndIOYNaZciGHCbaXHdGz2kj2xBF
         7jYubrWbQ4XLM0hQhoseHCNwmfiSgimUYnd5zh8E74rwN5n8eG5tAjj2cLW9QAFNbBA+
         lciBkLjCW3NPtN8Q4tSha9U3S7BJz/4+u9o9xsRQFZzRKvDk58M8zreyhdeineSKNWyR
         9IflmteVFLgA7LugvOIftxOZQq6oHgl1i2AB9dkcG8UUfSNESMmkEwflKWR5fkIrKAI3
         jverOJ0iRdQd27AULngIGhhRzTJVM4HeKhJ1PQAcpsdmpbLvhaX6ERV8Pyh1l/ZunQpS
         RtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737002854; x=1737607654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=RvtOzaE1jswg55B7bA2OVFpcl6JtYqaxCAMON1Jtn6PSFILCApdZnX/F+xsoYVGTfL
         nWonCQisp9m0BM54uEssLN6B1zMdKcaFK+fqkMgHbUQwMfplNeD1il8VPED5yjDy9Au2
         am4CdjOxX4YmYDbGL0MKcF9cAybeIKdS1xp1wLv/Tv5SQyAX14GsQvKg3eg2yBFO4O5T
         dZJQRtuOKvR+zPaV4lRUh5tob7xIfdzq92rbD0mMCi6VqxlM4F8qg6e4bJuZyFQ3jazi
         HJOJALf186/SsWiOQk6V/d2HasIXf6ej1CXKnd+PXSOW+Fn2S9ccnFa845D7oH1hWKSM
         aUZw==
X-Forwarded-Encrypted: i=1; AJvYcCUT4dD35bbDtTaPM4L1pvDROpXaniTkj7a9QM14n25KkFtF1ysMF+bNEw/hdtbCxAssiF/UbTRTeyuM2qSSSI1Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9prmHGjh16XPHsx+f5oPnWHoLUnsFXb31lLMZ/mVnOo9j/GQF
	B6bYHLV/Ep6D0ur0hbcTBb09lpVUFrSYhvUrjG2n+5vHWxAQ39G/A9/5KFRnQmw=
X-Gm-Gg: ASbGncslAyMKUaEhz4uTHDn8fkXVIkr6jYijkZvR/a4YYmP06BT0wZFg2N2ceaEjSBF
	fKB2Yv4+V6JrwkQBnQccQrqrmmIAuDC/QcP7myLgqFYN1VVvva3jlQkKKpBjNn/lNzUK15LKeWT
	cxO/i9FgR+/fdAh3egilw721ZcOFx7izsn70lFv0VkzwgcrV2XzMSl1RhDVbXvWxXH96qJuB592
	ZlPyOlVI78DdXh2gLVRj2ZE2EWX8cgB2UygrOu7ceXmWCHO4NgpHZ5+ih/xXCBddjKg2pJPNxta
	Kw==
X-Google-Smtp-Source: AGHT+IGM9wfi6d8bcKoIqL+AasZgn6bnQ6PxlMKh4ZwouSG1BClEURf8U1p38bGBT8jcz4A9LPNnXQ==
X-Received: by 2002:a17:902:f685:b0:215:b473:1dc9 with SMTP id d9443c01a7336-21a83fdf10fmr490381715ad.46.1737002853230;
        Wed, 15 Jan 2025 20:47:33 -0800 (PST)
Received: from localhost.localdomain ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21bc9411d96sm35492225ad.119.2025.01.15.20.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:47:32 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mchehab+huawei@kernel.org,
	sboyd@kernel.org
Cc: konradybcio@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	marijn.suijten@somainline.org,
	bjorn.andersson@oss.qualcomm.com,
	abel.vesa@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()
Date: Thu, 16 Jan 2025 13:47:25 +0900
Message-Id: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_204736_166607_0E92C37A 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

spmi_controller_probe() assigns a parent device and an OF node to an
SPMI controller. However, the operations are not needed as they are
already assigned in spmi_controller_alloc(). Thus, remove the duplicated
assignments. An unnecessary OF node reference acquisition is also
dropped by this patch.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 3cafdf22c909..122140b97579 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spmi_controller->lock);
 
-	ctrl->dev.parent = pdev->dev.parent;
-	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
-
 	/* Callbacks */
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
-- 
2.34.1


