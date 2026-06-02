Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29749CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=; b=K8KfpGv2ZIppAdXEHjm4fZe1dM
	nJQCZVNYmp7GYeUCwUar/xoiPleR7KrWZxflEnCInMVHCgGusNoUpPzXpZ0CcI+k1kD4d592EVEkt
	yku4ArTjv04M2O7FTxfkjAL2zUbW60LDTBxEdxcid+T6q/MiIriz9yD/AurkQCyJXYgNop6In3W5r
	DO6NfPbucqRMboxq7LxClcjKg2iQUu37DzlDMqqurtbquCMIFRnyDDvxdsHuUfRV1EMdJ0eg5mojA
	ndPaUqEE0kPl7MgmJfvgKGXIZ/6pkwSYn+a90CbFxGHDLqYtcs0TLOH0APjPqGvPDcpdkExZvvAfB
	vBMs7cCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYX-0000000CuCv-0Dz7;
	Tue, 02 Jun 2026 11:45:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYV-0000000CuBp-1Bbq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:45:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8423efad617so1121057b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400710; x=1781005510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=gyuKAKhC2ozQM8P9QkrQJ+J4OZehUuwLWdxpw8xo438dRbUiaGn17s/X8CHPP9sEq5
         hIGZsXOo4eiVM2W6jSbKkRY0F2Gpx1TaeM5azauaBJda4mIeVeIc7PyIhsQaG+E5KtPU
         G4oAeAa/gThXEW2bIz5/URbY3C+SH1ufFijYntk5+YkfEjH1yMYBbOPmIngamwMmKU3R
         p48ivqG8LV3qP5uOolpzhgWtBok+VVWfRLd9fxf9+RPBupUwroACRXBC5vY3RkTjsHeZ
         ApDoYemUEyLkBiqS3Vmf/lg02hWSXcNKSWs+9jbaOHhh139f3E1jNcO/aQWGLGHqusL9
         iv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400710; x=1781005510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=X1y6vx+S43oJPCxyiazfK2DGnVvnEuGa639Iff9cXWfZosnfQy5JLFWtnDXsnhX34J
         7fv+nDzeQiuxTJDILBJN5g3f51A5mJ2fFew/w9f3NlHZvILQHIKWuPEBzFQqJ+9jA4BK
         GRjf+xr+J6mSTdDBJhELvrMcEsqVWfyHsxM4nT27WNcJSpzJPdpUtxxBAK0VKE6GCMCe
         LRkPfDKktQKCQUOMLIeJWd0OTeWSV5MTxFRATY0HJ5iwuRpG3hhuxb9FLNTQfokAPHfe
         dvwbK+T2vqaHVidNQIm76gXJ/RoWoYq+dOn0Bi236qUwYqCiXLu7cp6NQjGcQqUvh5Lb
         OaMA==
X-Forwarded-Encrypted: i=1; AFNElJ8WUD1det9BEA0h3af+DYLo9kt1dRHviPtrNoBIciQ4xDKJqNPTcBZFXhBv4ATKZcZeoUqFJa+khtsyD6d1M1zU@lists.infradead.org
X-Gm-Message-State: AOJu0Yylo+R7A0b3dunQE0MKZdd0Q6h68LQ3wGAdaXBhMQBH+z5MCh8z
	Ko5xt68EDg73zei0hKE5ZrPHZxV+2NT2iUgDDMFdD6CQDe4fWx41buJB
X-Gm-Gg: Acq92OG1LvvitGuYDj+lanaKRkW3QGjsno8K51ZVeJVnlZnFkNIj3/JRNs3YZ7pENYV
	Twr8hrQtQJk0VGMv6u9j0E8ucHiHFNTWM81beMy1tzvI0/KL9tvnH/Y7TjeXBa26eOFP8hbULuG
	7Psc0V3Ttvop4q4traIdOZI4U8p09SjPo+YrSOHK/EJBITDgDz1zhHk4dX52x2KkjYdP9Wp/sVI
	oLyiOlzMIwtaeWpN35NSXKjN+xTA6gaNwPYyRfKbJ555Bt7Gs0Q5IudGP99FfLpL0EQW6MvTgP9
	p98CCl4xbaYs37fOxK1CRLOL9u3SkKRU+wWYyv2h8X+lZufm0N+9CWgtFZJtqj1APRcJwuGeGcZ
	UedCtIcIkuctJ0NndT/PvD2aEG4hgNFFzSWvXprKYjVSh7bb+cxqUFimCVqC+DgwKih7sarXe9s
	qRWIZ4xzyHlWPVBHhn5MThM/Udu/Q6FLNbiNJwGUWApqNr5YqCNMvwSdU8YEjkt46mt4LR
X-Received: by 2002:a05:6a00:2d09:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-842600445ccmr6078561b3a.29.1780400709999;
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:44:37 +0700
Message-ID: <20260602114437.50324-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_044511_332369_5CE3900F 
X-CRM114-Status: GOOD (  13.52  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The APB bus clock drives the register interface and must be enabled before
the functional module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0


