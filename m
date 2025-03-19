Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60888C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qEZeyPH3DN6EY3kRLphvmTruJ5WHhFKumGbsm0McfOM=; b=1sGonbR6zNSX4x
	+sy2BKCqz6DpHoYeNshJEAtub0xXFOEf31GvAjPpnKNbbZ8WKl8hN+zTd7r7nt/yl4mvRm6De72md
	TSl3oPlW+roWUoymcvgW5Y59B0PlwyIQbipZchqy8T45VqbLz/ScY7b/pr1F2preKR7Q3SGNQKvw6
	6Ryy05frN1hMIVMPOQus+MaJu07mKUuT2F8opAYRcRRyrbgoRTxbDIdsLXyDyjmQrw9KqthQXhNuc
	DrB+O4HcFYw6bKH272f4LVJwjYlNHCA9o1uVSMVeUR3H+iAEZstJrEQ/EW0CXXTqw5/5VFs2SWy20
	fUPM4+GAdG0fUs3Lfcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvOy-00000009OOk-3P8E;
	Wed, 19 Mar 2025 15:32:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNG-00000009Nyo-2Sxo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso22322495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398228; x=1743003028; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEZeyPH3DN6EY3kRLphvmTruJ5WHhFKumGbsm0McfOM=;
        b=InySB7Z+j37m8ggBMp8CJG7Pvr5rwkiXvGkAYlGJN6jjkKQPYlwTICra04O5ISYtco
         Cu6hhF6XBbTcgK3iliIc7vLItO8evR/IYv5mRmtiehjCQE5PMh+we1s3CCtnsn6yiapx
         o5dzeGjqEbJYqbzZY6aiPqq9M9+Pv7DW5mjyBarsrG1PsKGtSQYX9LiTCMMZGcD2y9cI
         IIU++kLOSH2MP7XvG8IYPEyT8+p4ohmBjpoUBIyn4IV3ZVEz2Aiw8F/r5Lgo0jily6mn
         HXuC3Rcrt+H7Kk5+fgSsMjEpbku5KKL51no1MmfluKU+lc2kxq9XiwWJAqBWi6FDJeSg
         5OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398228; x=1743003028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEZeyPH3DN6EY3kRLphvmTruJ5WHhFKumGbsm0McfOM=;
        b=XP89jNyhZPEMMqTm7kmSGG7QcwrTqB6AB0I7MwZMULSdwJF3IYTcDUb9Cg9WzLBLue
         zciPPizHQUhLAIdJU0Fgk8GEENMAQCvkINIrAiRm2EMsISu+Y1feShghg/PZKw3rC39P
         yEh/StPT+scRIk4eSc7dW+mxQUdklIqXuz1aNnUuroOsduAPZxRq7uwru92w2P9qMPqr
         tPrgiXsWY+jdmCVP4G/E+dmwxOK54K7Deryyd5rpTr5iSYtWuFSaHzPYH5SrQ3EjHq+8
         P2/1vzrEcUiguPU0Uom83Vsk3mP8k7XKPZXr8zZvP2aGy1CEtU5JiRq70CRntDQeurqk
         WHGA==
X-Forwarded-Encrypted: i=1; AJvYcCWAxpF3OUhXtoblZrpydYpldn0vXKQXBxOH8vZ9Vhpnj5AQ4CIrAJjG6Z+0IHJrTpBc/aYcRjdfKm3NtOBhqKMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkxp837om9haCFDiKo5Nu8icXajZ5Se2gM37YdsEMEX/SB2vfr
	CbsWu9qMiqqxygAVUdb8dG19gAQHdfrN1Qgr6GUmNNb8CZ1LlMqOInyjG0TsJNY=
X-Gm-Gg: ASbGncuP5eGqbV8EwRET+qjMTBvKrotjsl+CUS8e435mQRUCYrkm9VtlBGVALoHp2kg
	InShF9e1s3sbOhGNK3nxoq2nXkjzRE1kfld4HdMGAkbFB9qG1FE87hYKC/Z6hePI50A6vZ9sIMx
	vya7XgabEU9uvpR4f/5zHgkk/v3R7EEnt0NetlqsMidSMFbBC1iAbFOJCjrz/yBvCSkFnAHENo3
	ya8bivOFPCkrmVCSFsv5vab57ukBze4PzS9YvHpC/OZIgPuzq6r+SgLytAv0wXnjXCq4+Bc/j1m
	q2uUv0HJk9Kztz3wIFVQT5dMRKs8/LWt6zgoUHCF2LbqGbcm0uhGsOG+1CE0P8uPObZxW+xEMhE
	W
X-Google-Smtp-Source: AGHT+IGjnNjwq+MehcbC/hNwNMnENA+yaAifRw6JfmAvbNb+L/5ZJ5fX1A2xaTQSRDS1Im7e3lx1xA==
X-Received: by 2002:a5d:6d8e:0:b0:391:1222:b444 with SMTP id ffacd0b85a97d-399739bedaamr3628438f8f.20.1742398228350;
        Wed, 19 Mar 2025 08:30:28 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:27 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/7] ufs-exynos stability fixes for gs101
Date: Wed, 19 Mar 2025 15:30:17 +0000
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnj2mcC/x2M0QpGQBQGX0Xn2ilWhFeRi2U/nNLSHv8fybvbX
 E7TzE2KIFBqk5sC/qKy+QgmTWhcrJ/B4iKTyUyZFXnDOC+/Kf8mZT3sIKscF09yQhm1s01dGRR
 upDjYAz4R+65/nhfznIBRbAAAAA==
X-Change-ID: 20250319-exynos-ufs-stability-fixes-e8da9862e3dc
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
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/wdQQT8Uza3QQ8DxhowYsgtSCAG+eJfAgNfJhMqT56E=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMPIIUjvTrJwB/bf6NJvAEfmLtzYJjS2lH1T
 7BfK9xyJDKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjDwAKCRDO6LjWAjRy
 unajD/9Cn7tx2QPnMfbWKfUHujf8hPZa1cu0fDAlEehSOmtXXbYACAJh5RMKun3s4cmXI1SLDV1
 NDgRqHDRg7+OfgTquDBmQBnRltEdbiw5hMN0u6W0+SxUc+7d8cdPvTqml4b3PQY4Hofg77kYdqW
 zDVjS+FgJLNTPm1jAgKGVydFbUxn6uovbzmpPPOJfosNwhRlOqreukBWwmGKVuCjs1/KGv/O4v2
 dzj1Mo+GYACOZPMqttC4X7VB6mFkyb5QnsokohAIhQ11/G8Kom7x0NITrwU7d/B/3ZioHJ4T42t
 uRQ0jqf10+jt3lFQ0fgiLV052oMwmFjEdRA9vMlcAGprcKr2kEvbR3hJxQR/VdRgULSs5LJfPx1
 JX9vgQ4LtCK8b2FlxMNcDCi0RSnIrkAM0Husi1ATJTpelimGuB3TnuT4xN7WouTrCy/UhnhRhrE
 tiym0DZ+nj26EBNIPz9eSmEZc5DrL06IWb4BfEQ9HoTzq7glC/+W36RbVgvG1wic4OovGYK6C2G
 /aGtXnyrs/KBTZDX6rw/1J2piiasyKTZ9/JYcGS5UnCfb//OXZhZcL9teaQCwLUJ0ThNnPykKPw
 oBwHDzjnJvThNpzL/J0fPTOciSwv/SNhaDqxsxRPsge01ie9OD9hS/O9C7z2y2ZBIzpUQok0BWj
 8Fe9IXbmzfPYBtg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083030_637258_98F254B2 
X-CRM114-Status: GOOD (  12.23  )
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

Hi folks,

This series fixes several stability issues with the upstream ufs-exynos
driver, specifically for the gs101 SoC found in Pixel 6.

The main fix is regarding the IO cache coherency setting and ensuring
that it is correctly applied depending on if the dma-coherent property
is specified in device tree. This fixes the UFS stability issues on gs101
and I would imagine will also fix issues on exynosauto platform that
seems to have similar iocc shareability bits.

Additionally the phy reference counting is fixed which allows module
load/unload to work reliably and keeps the phy state machine in sync
with the controller glue driver.

regards,

Peter

Changes since v1:
 * Added patch for correct handling of iocc depedent on dma-coherent property
 * Rebased onto next-20250319
 * Add a gs101 specific suspend hook (Bart)
 * Drop asserting GPIO_OUT in .exit() (Peter)
 * Remove superfluous blank line (Bart)
 * Update PRDT_PREFECT_EN to PRDT_PREFETCH_EN (Bart)
 * Update commit description for desctype type 3 (Eric)
 * https://lore.kernel.org/lkml/20250226220414.343659-1-peter.griffin@linaro.org/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (7):
      scsi: ufs: exynos: ensure pre_link() executes before exynos_ufs_phy_init()
      scsi: ufs: exynos: move ufs shareability value to drvdata
      scsi: ufs: exynos: disable iocc if dma-coherent property isn't set
      scsi: ufs: exynos: ensure consistent phy reference counts
      scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
      scsi: ufs: exynos: Move phy calls to .exit() callback
      scsi: ufs: exynos: gs101: put ufs device in reset on .suspend()

 drivers/ufs/host/ufs-exynos.c | 85 ++++++++++++++++++++++++++++++++-----------
 drivers/ufs/host/ufs-exynos.h |  6 ++-
 2 files changed, 68 insertions(+), 23 deletions(-)
---
base-commit: 433ccb6f2e879866b8601fcb1de14e316cdb0d39
change-id: 20250319-exynos-ufs-stability-fixes-e8da9862e3dc

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


