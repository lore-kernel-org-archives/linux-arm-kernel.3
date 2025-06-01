Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE73C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLnY+e4DmR9UwbO0AVGv5r5TxRv2i22KZH8nci/gU7o=; b=lmFhN6BUmynzGW02AKklsy16Q+
	8wKUglvLawh0AnY/7Dw4byNjRlsnT8LUBFUrjaW5VFinfgS+mbWCV4/q2lslMCnyXOaPZKKm8bI+M
	llrFOloEgG3PqejL+xw479w2IEYkbml1A5AN00BPP3fGRj0vRKZTmpGjYawgfOA9ACSGyAm14LfoV
	ldfOKkyiBKiOLius7UNpT2BvDI+psCpM5ZadzDCEQyoNuZLvR+NaMnSNj5fGdMgLnRxFd4W/YeAuj
	Gl3kKe7DMx8ppkLJQ1XsvdubBKFEPOEv9VvEHGk7OP842AYXuvTKaEsA++9XzQ7sZ/ezFHJYxhzLE
	jK3tIYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrSP-000000061WE-3A2j;
	Sun, 01 Jun 2025 22:47:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrOJ-000000060iq-0wHW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 22:42:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d6ade159so5655505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748817773; x=1749422573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLnY+e4DmR9UwbO0AVGv5r5TxRv2i22KZH8nci/gU7o=;
        b=cZgMAOdM5wCSqyo/ZM59uayMUzr6X9HgS+iYoBDOt1qQmciXkJ4q2xD0MZr3CFB9x8
         8WljGxBmcSfPIj6ws4fEsQ1mQdFRX+bEI9KZGaCdxfHrTilt0BDKOdJcSvMQWXyS81Hp
         zUiPDn3oxE3HeBvGY67WJrBBnPXXdODCnzH1nXKvjw0/gGFz8MOA4NjuCwd/bA/y9gxr
         0E83XYhtZhQmV7s/adPgvsQ+jci+jptE7TD9wGX+qs/HfbFdBstaF1dFNsZfnkMomGqw
         jp6aDs+x5IhnkP+6W8CHAw2oscSdxq2keOEbmlMnjTpD15xvKqRSfw0hbPAWiOiudPTa
         lt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748817773; x=1749422573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLnY+e4DmR9UwbO0AVGv5r5TxRv2i22KZH8nci/gU7o=;
        b=jLWP79g0CsB9EoSpnEI5UOduoMcX1jgN7VGyAWIdSaN6w2fNICrH46/2FDnUjfr2YZ
         JPLG4oJUuMFnTos8wwjfSByw7jSRLnYCCZjI7PPn1daWvujNTLDgiqgFtIBiO5QyweQV
         3GOsgE0L221wzNAAqEa2LqnmsM6qqG5mt4WBz2G28OgBAKJpDay+OVvvLRJqQoGvFTEe
         R88URlxqIHwAdFcKvPFnubVfnvnfsh4AoHYFM6CoLVjd7U7l7Pyz0wyvlualhjXkZxki
         Y3CjuG2x5UqfBv8/kO2Ax1G7cBROC7bqFszp1lVeftrDJg1E2Zdmkou7GrVxGI9NTDHb
         DFog==
X-Forwarded-Encrypted: i=1; AJvYcCUNV0q3SBX+UTSX+2rGmRgIqspJQKW3A+u1kL8AIHMmw0Et+haErdRqKmKRHEP8d87FuplQBhDJ7fUzp+8ZzyWu@lists.infradead.org
X-Gm-Message-State: AOJu0YxdveqHNxtTbYtS+qlcvJtCp4iKZifQfT2aulAufBPrbBJeLp2v
	ahqWBeOhqYr/qhu2h0QL9mH+foYrEZb+qhMnqhBjivTR2VW/Tw/hMpp6
X-Gm-Gg: ASbGncstLA+TZOaXnLMJAss7Gn+pwCkU68S8yBU2yvRbKMKN1Bemg1m1praDVpL+I2+
	/IwAXMVkXa5+j8IMkQ32EocY/L9ewriSxOqcbyA7TKPQJRzDuFuB6MSGRQBJ1vNQa/W9b13JkHG
	naw5hi4Tmn7SIiCTakz60ibJOqlzAyT6JG/wUiBfYrQyFqCeftWi8ke09L+H6ApBu5AgLfYQNU/
	EXiDGPUwyEfvPk1yg3BMPMpDr294XKTL83/oi0cubUMQPiFToiGNBFs3OXsly3fL+sgkOuPG/wZ
	KOHVtd7Z7uQjBJAyK5QY4wv5R1zVqCYw6JiXWsRdPHzRrO0zcHQB
X-Google-Smtp-Source: AGHT+IHxEKNQmFH5Esn7+vrvKFhdlzvPKzJzwz+54lO3XiTb8Qi5En7rA6ezLo4Cpju1T9Y1p/Pn6Q==
X-Received: by 2002:a05:600c:a53:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4511ee1103fmr45441295e9.33.1748817773483;
        Sun, 01 Jun 2025 15:42:53 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:4518:757b:6751:290f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74165sm12916554f8f.53.2025.06.01.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:42:52 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: qcom_hidma: fix memory leak on probe failure
Date: Sun,  1 Jun 2025 23:42:30 +0100
Message-Id: <20250601224231.24317-2-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601224231.24317-1-qasdev00@gmail.com>
References: <20250601224231.24317-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_154255_262072_21F1C26E 
X-CRM114-Status: GOOD (  12.42  )
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

hidma_ll_init() is invoked to create and initialise a struct hidma_lldev
object during hidma probe. During this a FIFO buffer is allocated, but
if some failure occurs after (like hidma_ll_setup failure) we should
clean up the FIFO.

Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/dma/qcom/hidma_ll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 53244e0e34a3..fee448499777 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -788,8 +788,10 @@ struct hidma_lldev *hidma_ll_init(struct device *dev, u32 nr_tres,
 		return NULL;
 
 	rc = hidma_ll_setup(lldev);
-	if (rc)
+	if (rc) {
+		kfifo_free(&lldev->handoff_fifo);
 		return NULL;
+	}
 
 	spin_lock_init(&lldev->lock);
 	tasklet_setup(&lldev->task, hidma_ll_tre_complete);
-- 
2.39.5


