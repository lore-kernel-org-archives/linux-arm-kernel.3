Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2229AD4334F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6bPQJwYqFCPY9Eo5614F+YujOvB4HQyUxWDCNoS0mk=; b=eQpsQvNoX2xjbk4jJL8Q6iW97r
	9DpsFD008P0ZRrl3TjhuIj4nqHPFMxWEdvaTAue/CK9XcPMtgOTS3kF6aC/10V+8L2eTOyJvB1PBf
	w6i1PhaMKsMLDUsMNIE0Oa5an2RvGmFcdQnFA0WNv6mEt6q1Cjevsaq99LbLe7eSajGgtK4SvMEK8
	K8TjATVgxL42YPB+uo/Pwf9w5Go22ozjkJXlF6gTgHhSWXvpEeL7s4l9QAAKOQYKh4CuWFkv8Bpiv
	Lq69sa+c7k1VqmfAUbX8IMKsDuhgwBl1XcxJyAjL4Igva9OXPt0mLSFMG0ebjou9WjhZ8qBApXe8l
	FCgdoweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9127-00000006oZE-2JY1;
	Thu, 07 Nov 2024 11:50:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90yZ-00000006nQx-1KrF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:47:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d47b38336so592707f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730980017; x=1731584817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6bPQJwYqFCPY9Eo5614F+YujOvB4HQyUxWDCNoS0mk=;
        b=nO4PPn+a/7gVbzchEf9HQIGuQdUXrM+sIKxkHehXJnMshK25AHd35xI0SOyyvqYraq
         g8Nz/sKsXVEMbhy7Kpz4fEOZjJjANcIBL1n2gNUt78CY8drQrIJlw8/edwtvj40+YT2L
         4zDAfoPaINI6GEDdPTZxUKDN0fGcUbXre71HpmVZzeYEmBeb09uJ95p1mTzSKovhOuVr
         G9AtngMKj2+hJxGkjU5Lx7Miy8NAD9FWmkM397kXK2aRGUNTPxSe3TFyfETiW1AelL4O
         tVL+hqMK/bAM86CQRmVfo3mbrMzo5VaTqU1/tTU8nsOmjE1QLarE6dIQRJKRjshTIozR
         2iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980017; x=1731584817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6bPQJwYqFCPY9Eo5614F+YujOvB4HQyUxWDCNoS0mk=;
        b=nlMun1sYUBIOqQGVIidOvQZkpLZ5zx1/+M2Lgx8bScvrnUzR4CqgTbpII+xSTeistF
         XhjnNSlkLI4A6Ac/c4WKpZAOWFZe51p2l7cSgLijv6LhNb8Uq/Ogdb+oJDeVrWmixBYU
         3dwOMheX5OMeFNFr3wvoxFFB1JfQNv45Qz6qGD0BuYSTQoUU3U0iB/BQKInbyrKycpVk
         lZuSA7A6O2ibxjDL+tNGf5NQm+e23/NVUCv8btpZxsvSyZdXOBQ5MJHF2XctyoWqeRMM
         t6h0QKpO4NoPd1ugdYr7dzx83bCBqsMY50dfM3ws2JOmR6H+iPaMbhCGd9R9GF/7KK9s
         tHUg==
X-Forwarded-Encrypted: i=1; AJvYcCUo/oeqXvr7/sXCsfXSu6I5yCnGGCc9YRPd9Dex/6Ub2FfYfpZwwDBD39ywFCMJL/Z7NdOFmq3W6z8pu5QQxYPx@lists.infradead.org
X-Gm-Message-State: AOJu0YzHQP6jF24LspVB6Vc2mK0FPuWk5S9VdExaBbJU6Iv2SST66cTM
	TIqrDkL6ZhSduiqL+QV4aSfvuoEGYNPZJQ+kmSJwLWiWoLas44I3
X-Google-Smtp-Source: AGHT+IGmxmbYT6mTGdynIW63d8rNVanHSb020FXVEWto0gTCU+tCmgRKqEA3n/WHVPuMHIMQRosUcQ==
X-Received: by 2002:a05:6000:12c5:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-380610f7bb8mr30048320f8f.9.1730980017021;
        Thu, 07 Nov 2024 03:46:57 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda036afsm1544294f8f.86.2024.11.07.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:46:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dmaengine: xilinx: xdma: remove redundant check on ret
Date: Thu,  7 Nov 2024 11:46:56 +0000
Message-Id: <20241107114656.17611-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_034659_384173_F055E00C 
X-CRM114-Status: GOOD (  11.81  )
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

The variable ret is being checked for an error and returning ret
and the following statement returns ret too. The if check is
redundant, and remove it. Just return the value returned from
the call to regmap_write.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma/xilinx/xdma.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 93772abc3b49..0d88b1a670e1 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -390,15 +390,11 @@ static int xdma_xfer_start(struct xdma_chan *xchan)
  */
 static int xdma_xfer_stop(struct xdma_chan *xchan)
 {
-	int ret;
 	struct xdma_device *xdev = xchan->xdev_hdl;
 
 	/* clear run stop bit to prevent any further auto-triggering */
-	ret = regmap_write(xdev->rmap, xchan->base + XDMA_CHAN_CONTROL_W1C,
-			   CHAN_CTRL_RUN_STOP);
-	if (ret)
-		return ret;
-	return ret;
+	return regmap_write(xdev->rmap, xchan->base + XDMA_CHAN_CONTROL_W1C,
+			    CHAN_CTRL_RUN_STOP);
 }
 
 /**
-- 
2.39.5


