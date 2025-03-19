Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9854C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjZnmCYHxYj5r8o21deMPmCGzUUBOqv2gFKI29/i6QI=; b=cIFMLBkL4EpZwDS8mg7AewhiFT
	G7JXUp1mO+IttwQsCouW+BmyNnvTAtuz6aG2nofsdRR+FA6vR3xXayLRlBsW263YgjmQSaI0vbTb/
	OxL3jd++rqvKjb0xBH+kpsfy8aG0Ef/pSkFTK1HdYiY0tqQlG1eiOqoszWHjJwPwuwTfzMGdvnB5A
	CtYSeDO7HWhL9RVlglHwUG/DmPXXlByJfRsHLSUcClZ5D5zsFCfGGPL7qXLcxd+Kj6OwMmzShDOTW
	5T5FRJJHE9ilbsqaDDguIJwetnEp/DAO39qz94oK1MMDf2yGH2A0u89HpWUxTTjBFpxdGb440QVav
	rFG5ovMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvYz-00000009QGE-0bUJ;
	Wed, 19 Mar 2025 15:42:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNP-00000009O2x-0mUB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf257158fso32115655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398238; x=1743003038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjZnmCYHxYj5r8o21deMPmCGzUUBOqv2gFKI29/i6QI=;
        b=nbUmn5YTpg5SRKW+iccm/l8HO/W0/IWRq2+KY4Gm03A2NKwFupbDoapn7dAC/BZ7dn
         vFGx+8scwzxpF/mF5lwjpqj6mOwNtygKUdYxnhLSBPJoIZF72SEf8/cWfl4Wsc1u3FFf
         zbxKLHhUIPVjrWbbePayFdrNwmfN/FL8rOdEDYIZ8bSMpPu2wH189GOIuSYo0a2nyXCG
         aR1ZKWxZBBBqExcs9jDmwwe4Nq+832nBZsZS7J9pTzd8li/wNXR6Kn5vxfcIB7zSFpYW
         c+gW4h2Bo/O7e73qcZvPoiF/wkR2YtezylRVKLedvxXShmRmMl9J4rViQ/iDF1d1KYif
         Y/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398238; x=1743003038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjZnmCYHxYj5r8o21deMPmCGzUUBOqv2gFKI29/i6QI=;
        b=wi/bfV+6R+WxdVQkgQfA5uLEdF/O54ygo0H3CszXg750PFDlGG/eIfs0SsPP7Vdis1
         BmhGwJHm/jTZ09pppaxqXYtC8dJumwC1EVVE/Oa7CP2JDCS6SwgmgTFrqWdkV+L/MPB5
         Hc+3AJIGBqVbH2mRT6y3A1uPMDzhvmWOWwvFo5DCPUNVCQRdiGjlj/VLVkUTwMFwWnia
         GOuujbEn6I1/Uq/Rk7s5Gi9CQr7Hvk0hA6GEbIuGi45RQDx3dB4d53L2/6s7E87Wyduq
         lyou2uUhQiP4ZkHrNe9YyV8yazdCk90MBXsNIHbl14TOP4cMn6rC3efWDlvsCUtF0Tq6
         XRNw==
X-Forwarded-Encrypted: i=1; AJvYcCXDgjpB3uoEmUneZb1f4pNg8ovCAQyINHi0IKH1+5Wu1U5tpahyOoKRtj3A+1ZbXXVdQ1Ona32ha2QFMwl/GE0e@lists.infradead.org
X-Gm-Message-State: AOJu0YycQPtcidxUYY2gghAcT/AN/H65wAQai+7+nQc4NMTDwXoNHewp
	kOFs7hmMhQjZQkduzHfpfZRKzAQMo9p0h+gYMIFOheNiOpD90KfrExPuwEqUmxw=
X-Gm-Gg: ASbGncvJ8+1nm2N8aJHwSMmCxTf/EtI90ny6hMTbqY5pFGRrfwe1N6wW98rxkKR6Z9s
	0DmnnrU4CsD7RyNVboylu4TS966NsCoZAoeeZCWOHJ3XRiykXtTKNetJngV5emg8cbL7aulqqba
	H4Bi0a4GtZ/HhEFpPDFeulAkxXUV43Ptp+T7Rvidpz1C7EfSGSN9at9TqkbP4mYtFMJ59vj5Tf/
	l77lYVAkh1DTT9CLUWUUa53allt+LJrsEesbHtWNW6RL2xCn/4zvXTfZOA0vrup+EP0dNE/6FJL
	Z3NFnq0kPfOLlY7/IHYZ0nRYUVFZBGivkWHmPtPcwlffqNSuHyqYKbqFkklv91ndz4Rjf92SJad
	2
X-Google-Smtp-Source: AGHT+IE0imvyWtevoay+Nl/n+MDQ7Wc9dHAjRMpT6TT9WUssTSaTHXR2b/vx1TkCs65IxfQ/y6FOaA==
X-Received: by 2002:a05:600c:5250:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43d437822abmr34547135e9.4.1742398237671;
        Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:23 +0000
Subject: [PATCH v2 6/7] scsi: ufs: exynos: Move phy calls to .exit()
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-6-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7s8ZG7rjsKFwjxleGe/WV0LjRuAvxIjVXT4DqwU66xo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMSf5uvm/FpEyh5swIHxpa/LmHezM6/OP2QY
 9MVZvxOExKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEgAKCRDO6LjWAjRy
 usXDD/964vJN7mBdCt96LUDow36KDCH5cAm1CeGbPUFo3LIj1nznxlwic31P+sgdl6J5xOMvwII
 o0eYSKMGFDWNfQdX3FfNxw+PZVH1OA0egJvAGXyexEqQOYurjEDOIc8sRRrvIwEjKWh6MnR8E+n
 m/QjkL4SExk/7n4wBVcXoaXRTdru6lc5aPBhD+yMLnL458WalOljyLsQbiR2/GPFARN1aOQDStE
 pqxmX4ZZYgXEsbOAyLbJ8NVtW4Kg+rXLu/O0xyLiya/XuDVHxwHo2GsbdfEBO8JI8k45lOPNv6w
 L+CLx4JGdpyDyqHLQdkgIJ98a2+jlptKgutUToX8hJ+SsUVseDZ4YRZimfoS/OCXPesRhk+5RV3
 WBkh2zeaQAYssWGALYLYsloNK4aZVJLjOnw2KkT6X6Zc9BjY/hxcl91iaq0tkjMPnyCUHa6ZfpU
 hPtucZXsPnrYWGm0rTAWhFxV33fa5FAbwWyKBEnMtqwUzfheLVvYTSa5Cxxs3D8566pYJ8Ec/QC
 z4wTcwnW+EWOjF3B023GowJ5sPoTjN0Dlg7p9ogQsMsIr4hX49/QLEqyiDo10nb7sspJf+Az+Rh
 NuX49wWgzfYuvxpS6Z0VQmWrfWY98RRjqrtI9Ul3478tgvm5yJCJTKIEDIMxAOAw0RkeLgsobwK
 kXo7n/Z9gZNzzBg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083039_232495_B2294BB3 
X-CRM114-Status: GOOD (  14.94  )
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

ufshcd_pltfrm_remove() calls ufshcd_remove(hba) which in turn calls
ufshcd_hba_exit().

By moving the phy_power_off() and phy_exit() calls to the newly created
.exit callback they get called by ufshcd_variant_hba_exit() before
ufshcd_hba_exit() turns off the regulators. This is also similar flow
to the ufs-qcom driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Remove superfluous blank line (Bart)
---
 drivers/ufs/host/ufs-exynos.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f6980f05bd5555b351070fe33d0afda469fe498c..81a1f04411c0426d6fae931e75db5f4c8693daca 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1523,6 +1523,14 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static void exynos_ufs_exit(struct ufs_hba *hba)
+{
+	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+
+	phy_power_off(ufs->phy);
+	phy_exit(ufs->phy);
+}
+
 static int exynos_ufs_host_reset(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
@@ -1978,6 +1986,7 @@ static int gs101_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.name				= "exynos_ufs",
 	.init				= exynos_ufs_init,
+	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
@@ -2016,13 +2025,7 @@ static int exynos_ufs_probe(struct platform_device *pdev)
 
 static void exynos_ufs_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
-
 	ufshcd_pltfrm_remove(pdev);
-
-	phy_power_off(ufs->phy);
-	phy_exit(ufs->phy);
 }
 
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {

-- 
2.49.0.rc1.451.g8f38331e32-goog


