Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E75C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=; b=QNg3R2Qt4uCjLXGh+ufESPHHOO
	Dp4if5bD11LocTkpH4MLBsBhDXCnv84lZ4pwHWlwvzRL+NoPQukZoufPos9ywoadpBCUQ7BSxJF4k
	HETkJHWSW2mfaQxTb6s/JBlsSKitP0GA87B9Mi7H76oGUz6HoOV4pPLrs5WDqu9HOwTYHn5pb4ye3
	n7u5ScjGK1CcGDqEssMc9B765IwUUPXW7q6J/07XnMAZJrNe82cs3Ye5yVTxVmSXKWfP4Yv2ehqw4
	tEJRyZI2YJfMHi9VUJ32J902k9XA1TKOoiPZUkY1vLJC2Lx5iRVZlXkAhqGTD3B4FiMLH0EotbZth
	Dzugk5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2zL-00000005cAB-3Yih;
	Tue, 24 Jun 2025 12:42:59 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fn-00000005YkT-0DZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0b2ead3c6so5162966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767765; x=1751372565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=UVKLBThi4BjoK70yMT9HB3/xjMqD9smGbpDZg8fpYIDVBNyxlIhZ0GNIScG4z/qOsl
         qschdX17U5y1m/H+Gu89Dkx+G2cS7EPpO3ijxUH1bvyIlmJvrSzakVcPfi5Q61IcD75d
         HYCY6A/y2Ff5+7XokPX6nHRm20LNcY5U8m+X8HvgU4lGy8HEND7ARrC0gmqhZeq43YS6
         i0i/abH3BqfJhi8AOizQCRj6bnuYge4htD+6PE52YW/bbLV0MB6/ViZ9/HyFMpZ/R+l6
         SUBXhPMRea7AePakoQBEGtxPqvb/wnpoPVuu0KpQ8iA6je+xDvwSPla9yMieY3AsaxjE
         LGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767765; x=1751372565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=P4q4aHkE8JCHMsKrcKhMNi9v+ZguBcETND5e3klRYmywQn6zF5lyK1sQzxE4/JcV/1
         +nMsGyPRGeHQDf7GyyhciEhDj3bIo13UnZmu9gYWkTwaqa7e5AK+5+/K48ynoMn1RDAB
         YPVhgYiNZ461+omzQYQZWQ20YJD2fo1XF8sJre426dG47Wk0/qjRDUtdCQS16Z4LlUv5
         ZfmKJVaZW6lsdnkAHwAJL1ooWa4I0qRp64rmCg5P0/IKjfu/c6GNJtPaErlBfS/YxDX/
         hSa01Ghsvd8uDitp6UO5Gg7KDwKLAth67uWSzBfipApXD3MYYZ8+JTjoNK5WiG1qjd+k
         ZWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRV4qPvJ6Ap095zEdL46skBr2ucFk5rTaUdYXcC5Gmkd1dJz77kQ42lR2CRSd797DmPhMjjxZV6CG56VHcVJrx@lists.infradead.org
X-Gm-Message-State: AOJu0YwVz7+BlSUEi2gmlrG8LFu4+BFAm6CUEVLxaPQMJ7wz1zj+/2uu
	BCTbtw5SY2AnJacdQt5VoJh62CMYdDH+04HTwjVg3axiBM/GWYYHO9MO/GLKhxJWbbs=
X-Gm-Gg: ASbGnctqUvBCC9dFLIWD57FXdQ4Z5FBV4C862JGSl5TkVA9WimTTBow9x7VQTsicLKC
	LeZL7NeGqnRwJ1IWFlsSIIX4ndCW7gRA90ccwQWCtBaznU3MJc579BmrVAX6z6BAzjND9McPcgn
	gyX0+MhCY+/cS9CadpPol1XS1TA4/UUGnlv3deBI32c8IYzAk2p2DIcNuYtvUdmFW43rNxcf669
	KyYnQDC8gL6m941e6c74cMC6dHYD5WhI9rk2O+v9ztso+uVVDdQ08MS7GR/Lbb1V7sQR4qsrLOL
	IaRVjbdg3Ffdfjq8CsOx8CFTy0e4cHQTQAmaFMCK/pbHPq07tioFaZWVnXN0JDakvG/y0NgSS4S
	VTQrKnQ==
X-Google-Smtp-Source: AGHT+IEsZ//+E0/Q5JRbtMOjfmMwrd6ZqBEhvEMcASAfMvO4Z78K40GvJpneVMJGYeJGXSRojLvxIw==
X-Received: by 2002:a17:906:9fc8:b0:ad8:8200:ecfc with SMTP id a640c23a62f3a-ae0578e005amr526516566b.5.1750767765372;
        Tue, 24 Jun 2025 05:22:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:32 +0200
Subject: [PATCH v3 3/3] iommu: mtk_iommu_v1: Simplify by dropping local
 'mtk_mapping' variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-3-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ueipJTTN4GIT99VDYZR+nAvHf+JWom0KrWneDnWo3sI=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGhamI7Iw+ClTaksgGzVRNZBqEwhCMHErWdDPgl3KBLt2cw5H
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoWpiOAAoJEME3ZuaGi4PXrSMQAJis
 3J5R/L2EfwRPOX20YInJ3r9Rj4cm59Hk4gwBb6sJBPC42WJRFUfriJKoBwOrXG4/wGCneYOvHGn
 F5h1zJLrIknW/Rr3eQU2JmiXfvfG05b4wEn2q59T4z98TmmqESvXISsSy8InCeK/ui4qCEormFm
 WCluiPBO7+kmKT471cc0V8LUPwBidaXYQy0bvjwLALYhsZSyss5hTi0lqvTpmEOIPjJQPZ8S44U
 y8hpaLmPwJZaSNbSxVJ7jgDmEG0OCU2Lp5Hfk8m76ijVsRAjp7vbifVJJcmzAwVnLwz/Mhp9zqR
 701ZiWueSdJOpFBr9dnum4uzJtbfmdAOcAaZrtr9fZ6/8ODcEjp7a1R4JPWaqzdwTcMrjXDcDSp
 5ucG899MrwqT2WEahy5IreqJFG9SGntaDTDewpOcO1+l+iqe/4TFw1rrvC+vK9qOdHK9DnBc3T2
 6cDBQMuhRGre8ruUf6h1li4CfqdYwi1szocZJHVAsr2PQZvMjWtWLBToNtCdJbPXEhD5loEEwpO
 Fck8zxNaq4AlXafOpg2uWSWvYs13l4VTCztSq9QCYclHzDZhCXukRHSJtPuCdNnQjAO4JtF4LQP
 BdA7mfHdmewfVjvi6I+fwWRhECj2Z5cyuRBK9DFSYqceUX0/iMGPS6nRoDGeG9QYu1NFWb5FYv+
 /WU5W
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052247_163779_3D7A4989 
X-CRM114-Status: GOOD (  13.18  )
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

Storing 'data->mapping' in local variable in
mtk_iommu_v1_probe_finalize() does not make the code easier to read.
Use the 'data->mapping' directly.

ARM64 W=1 builds also complain with:

  mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]

but this is not being fixed here and 'data' still won't be used in such
compile test.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Old warning is changed now to:

  error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
---
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
 	struct mtk_iommu_v1_data *data;
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
 
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }

-- 
2.48.1


