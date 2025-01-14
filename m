Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB3C02187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=; b=lWlTCRNQorQ3A0sVI6gzKsKWQc
	kzMbaMxETqwHhOrhHxzTx7BCw2TfWhsAaRN8VgIpFxl1/B364VjSmg0qNG7+nNvn4jX16UcW9oh8T
	W2BTZTM1CB0U1Avpg1v/6STT4AvibMisHykh8vaAu3UoCQen3YbLozc1t77F3bjhrOmaDsh1A+c4a
	sSlxz/nY+NvV1QWobXyXrCQPzshHulwRv2Rjbq9c9BwI7oRnuXcDX78i5I640Nx0huphovsQKfjQX
	8Lm8M/V74me5LEVR/PDKtZ5Qps20gVMEod/GcOsmlev+J2r0eNn2n0uXO25cxHsm3J14hik4ToCCa
	q3CDgr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnDN-00000009dau-2AVD;
	Tue, 14 Jan 2025 20:08:41 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnC7-00000009d8g-2Kj3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:07:24 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7fe2732so367762f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 12:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885242; x=1737490042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=;
        b=dUnERelxGhzoL6Hkoi0mL2Ixpew4MfznbzPMmSDX7HWZAd9TSdFcCROJzkEOM3PLIK
         YmSkn3TFtOGoOJ0eoIkHSI/LhgAo/gRMIkdm7SmfBM3z0qdEdyNr+6Cl0/km/0dn037N
         vRP8gP2T+Fx7lzeECVB21aLSVDR/TNsD9HCazsMvueOjVT/Ty6DMJR9hYl16kxO25zAu
         NQga7HCPmIWu9g5T8sXlGeENAnp7lSZ/vW2aSNV/uH29Pp/LYZnwHPSHz4flboBMkfxe
         hRwnObPRmQWkdSoyY2lgwmLyAVJav9asptIoZ8SfbWku+r2RsZOl/kCMbU1b3tTgd7BH
         OsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885242; x=1737490042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=;
        b=FAp3px9d3Ax/AHoP0w7nX6g1voVxpxkALy64QT2QvV5rQGgFiJhVb031Onh0S21idA
         qlietpxyMr4THAI/Wj+IOeNJvcDhT+Uj/0xxaYiX0MufRPdE/3KQe9bsr/HvQSOgAyH3
         xxOfSG962nIufaiMA/WhXU9/eoCRuWE2eAveItnOi4BTBVkHjcbG+c8jCNgFOwCk9nJR
         6GFgUrD7ysDHBwTDcGmZc+ZoYIFIvTIduhsaq8gja/8NA0ePVV4lPOwGN3cZ0pibBTQD
         zb8MTfJmEkF/5RlCCfX/0PGwPY4K4gSEo4er1SxYhZNCyCb7JjWAbJo6LjanYnkGI8p5
         ENfw==
X-Forwarded-Encrypted: i=1; AJvYcCXhZncpANzvTC6q+5cvWqrSPRID1BDc11alGeKY2rcisdalFuwN6y21P9C+Mh6eLhtA2XNAAcwMZXfQ6H7qmc/D@lists.infradead.org
X-Gm-Message-State: AOJu0YxP/CE/MGbXxr5UOHh7sgQ0PkDgUKUocYG993ZhJZS25ioDSirF
	LXqRkdkci34TFsL4qpK3sAJ7735unGwq/hWVkdOtOJfGFDH9Y6XxzZFDEWaNQyw=
X-Gm-Gg: ASbGncv6UOi3NrabjgEeTsERsoBsSb8ffJKT3xXOAQXmalU0jYTF9xe5bq6vOyr+hCr
	RPSTFeVYKcU7ZBQyt9EBQqhm5AxIBFeZtEJliA6b2p/ec5Wlgn/+MFzv/otDrk+snAsAXMDtNKD
	VGtie2yCpKLBk1lG21h38L5oytSbX5JzWhW7VAVJY+vl9aahdOJO+wWuxJ5mW1rv2ogPV2oGiCa
	HK8iun/i27AWRZUpoS0qUBZ1pFLdAuf7wWb8uc5eUTBxLfLSYG9xlLNIc3YiiOAVAc88SQ=
X-Google-Smtp-Source: AGHT+IE7Jj8lfNs/6Mawrj444oeAra8QM8Y3meAjqJpf/75OfBxvuzPW0rWmRWiybb+fzK9QvFi5qA==
X-Received: by 2002:adf:b60c:0:b0:385:df73:2f43 with SMTP id ffacd0b85a97d-38a872c8972mr6632398f8f.2.1736885241685;
        Tue, 14 Jan 2025 12:07:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9df958dsm185199475e9.17.2025.01.14.12.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:07:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ufs: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:07:16 +0100
Message-ID: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_120723_585581_4DC55868 
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/core/ufshcd.c       | 11 ++++++-----
 drivers/ufs/host/ufs-mediatek.c |  7 +++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 27154a5dcb7b..5225d48a47f8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -23,6 +23,7 @@
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/clock.h>
+#include <linux/string_choices.h>
 #include <linux/iopoll.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_dbg.h>
@@ -1187,7 +1188,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 
 out:
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
-			(scale_up ? "up" : "down"),
+			str_up_down(scale_up),
 			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 	return ret;
 }
@@ -1549,7 +1550,7 @@ static int ufshcd_devfreq_target(struct device *dev,
 		hba->clk_scaling.target_freq = *freq;
 
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
-		(scale_up ? "up" : "down"),
+		str_up_down(scale_up),
 		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 out:
@@ -6026,7 +6027,7 @@ int ufshcd_wb_toggle(struct ufs_hba *hba, bool enable)
 
 	hba->dev_info.wb_enabled = enable;
 	dev_dbg(hba->dev, "%s: Write Booster %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 
 	return ret;
 }
@@ -6044,7 +6045,7 @@ static void ufshcd_wb_toggle_buf_flush_during_h8(struct ufs_hba *hba,
 		return;
 	}
 	dev_dbg(hba->dev, "%s: WB-Buf Flush during H8 %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 }
 
 int ufshcd_wb_toggle_buf_flush(struct ufs_hba *hba, bool enable)
@@ -6064,7 +6065,7 @@ int ufshcd_wb_toggle_buf_flush(struct ufs_hba *hba, bool enable)
 
 	hba->dev_info.wb_buf_flush_enabled = enable;
 	dev_dbg(hba->dev, "%s: WB-Buf Flush %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 
 	return ret;
 }
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 135cd78109e2..a7804fe387e9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 
 #include <ufs/ufshcd.h>
 #include "ufshcd-pltfrm.h"
@@ -480,10 +481,8 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	}
 out:
 	if (ret) {
-		dev_info(hba->dev,
-			 "failed to %s va09: %d\n",
-			 on ? "enable" : "disable",
-			 ret);
+		dev_info(hba->dev, "failed to %s va09: %d\n",
+			 str_enable_disable(on), ret);
 	} else {
 		host->mphy_powered_on = on;
 	}
-- 
2.43.0


