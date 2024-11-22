Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B362E6ADCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjggllig1lhdLdqzta4VRtbrfyvu0W/JksHC0TyvPxI=; b=XutZuwhHf2lpzCk82hNrb0h8FZ
	3ou9ypwtKznkkmZ1KwQoc3w9R3u0uTTFG6ZV9UtER+dQswkE1l8Lv5LGlFkEzctcS2rzmFPJrs5Pg
	BMIDtJrseMGh3Rd9AXcZQMFwLES8JgegcXrMhAPlq7P6O1RQsfK+b6s9aPFnReaHkplcdvEGVjF+U
	uuOrOgYYUzaAGjb/62nVXZaE3zDBP1fBT+rjgNw8teooXQr7cZCY9LYbAxIhf3Kh6rOworV7Y7VD6
	KKGYBNVVMQ/uKEhyVoDuxB7n9e1jZfZvPuYkZuF3wwEMJAuGCERr9gXCsJcIIC9zcIxMuw5AkIzDG
	mtrl1w7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbwL-00000003OJv-2Bej;
	Fri, 22 Nov 2024 22:15:49 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbuU-00000003Nzz-39pN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:13:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d41dbf6cfbso17846636d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732313633; x=1732918433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjggllig1lhdLdqzta4VRtbrfyvu0W/JksHC0TyvPxI=;
        b=i2twiy6odVr4l111qRRJgd1erEcPrwzA+54+D+gKsofT2xQsfTaAAhjyqyYdMLpRBv
         OeCQI/mIdMMJ27IxuNrXc2FDP6NUbtLsMAGsVhIZ4G3Utk0/j5jlrXM9UcvaC+l//qnO
         /y5qMZNKftwx94Ez9S8MzKuObPht6PSeIiTP1/i+O6tQtArFNHmozS8uvBEa8kvU4sNG
         C5chRmF13Lv+HI71iLUhe9Kw0Gl3ztyVmLyScgoHFxeSwAeijKYo7PvUsW3DtRn94jHz
         0oTKOn1AdqtnjOXzER1AQulJ8V7ts9KScOqZAS8SnfCnzihNdbIGd4ZiL2dhV6Rp13Su
         uxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313633; x=1732918433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjggllig1lhdLdqzta4VRtbrfyvu0W/JksHC0TyvPxI=;
        b=gVSHaR/KOtIpgW6SWQ2/UycPpO35YYrCOomOuiH5bAISwIhN77lT+NsQYFQN+7fe1X
         e5LzNuM37amwl2K2sAcUqViE+Ep8bBEFilwxAoskaJANXZvaamMRqBjigYJuJD82tgYa
         Ju1lW6DET6ZSX+d8LbmPWw2qkGf5U0Le61WhlnG3755usoaGHElpxdyjCb/zDSqKMq42
         tru7uX7TeRzkHtUUNF3vOo/OOWL+/dGB6nPHhxmgVXPIY69Xq7NyQ+09ZwQLREBZM1IM
         XfNO+3v5h7DkN3earMhoQG7fDj6TNbi9iZtdZO4oNPh3UWrDqXEcWmVquOBkIZrai78c
         VRxA==
X-Forwarded-Encrypted: i=1; AJvYcCUCrAjEh6PO33R2WmDuxjEcdxzgLT3qGiJCzzNyp++RTELHISAUcsDwrZwrZpAsOST5I2RXSDk+K/G0wqsc1lx4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYZ/cf/c8gvsGPOohs0WKoWi9ApUXGE8rnJVveudJ4KNfIEQUW
	lGFgyN1DoHiU79YrY5RICj6PpvnrZXfI1Dx9cXPGrS81TmdxmL/C
X-Gm-Gg: ASbGnctBt/Vz9q7tskK6ffIYCOxifwVkykZQMm4MldvZJ0Bnrg0meeYbaf/7/4MYm9F
	VkEJLGMMxEhTvg4vwAgBySUWIMXUyZlu1N1O8HttZrLjaltEyxTqf099zS1fzN2B3nltz18gp4v
	l0HVNI37ELPp28P4m7F8MMXcCpPQe9fQJUJgqrEQhQ3XMgCF+waWdi2Z/D1cIAi7yOmVJH9yUK3
	C6Vez9zJdg0ybOEDN+PwEI/vUKZYFeh5kJ2Y0DlAV9YzYdIxjtI+jcULDVFQBcLHGcTL4cc
X-Google-Smtp-Source: AGHT+IHgahotrjDkGCxkLTqv0ks7LfpHmWKZFhzn74QSP3dQNY6KwyiDyyINS/ZltTaefntCRc+JvA==
X-Received: by 2002:a05:6214:d81:b0:6d4:2a73:846f with SMTP id 6a1803df08f44-6d450e7b40amr61235776d6.11.1732313633452;
        Fri, 22 Nov 2024 14:13:53 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513fa5feesm130646485a.30.2024.11.22.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:13:53 -0800 (PST)
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
Subject: [PATCH v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Fri, 22 Nov 2024 22:13:48 +0000
Message-Id: <20241122221348.3998-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
References: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141354_784654_BF3C8C64 
X-CRM114-Status: GOOD (  13.05  )
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

v1 -> v2:

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


