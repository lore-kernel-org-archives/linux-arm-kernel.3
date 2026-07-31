Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C635C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XKaPdB4MnlwEF1r+9WMk80Srkg2KM9H8TZMozCmsZJg=; b=D/0mEry1l59evR38MCbiSNO3v5
	/vz8cDGqWK1sqP6caG8qBv2vIurQUed3almpfSzQnpCOLvU8IlkEtptikDIsMgIi2rgFYLvcFbn74
	Z3Jdll0KHIallYS0I6koUi5KJ61zb/uNmycxgmsJ7n4xHrP0RYov5R+s5ObZyRvbroHJBq+Laj/wV
	tKWABcXIN/p6hHHZ9Bbn8yITFPTQet2Pk/UuKAkFXkSi+EIbO4Pw6a0sBosPec5x6EON/6e6WZuEh
	M6j3Z0K3IDrwNrNBr4eqlH6XD65qgqttC5hhL2mMIEdYLBA6r6GUS7uWHG+RFvPExY3PToO4An/Oc
	akLKm8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpru2-0000000DM1C-0JkU;
	Fri, 31 Jul 2026 18:24:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprtz-0000000DM0d-1PDw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:24:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1374278a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522250; x=1786127050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKaPdB4MnlwEF1r+9WMk80Srkg2KM9H8TZMozCmsZJg=;
        b=VhmVX8jlFvKkTeMyJaDYJp7QWAtLMeHs/cZHclYrW/ewwJzYT8R0tpBDN4j87v+lz4
         ts3/R0tVzzCG2gbzd5bFKm0dkEYj5JREAmwE4txQ8J4HAs945s084M8+BhFJzx6vVfK6
         ubq+e7uvxUaOvARifu+k93Kq8IXB1GADlHDBkbSVuP8IdJHPXeqEE7qmfsVb4jSWcEJN
         KnahK1MMvPEAa79gsbfXDIylWPPxjW1VMlHMJ4r94djdY+/a8Aps8QDD0bJDakB94ZTq
         Yvgl4AyStjX7r8MtZe+jlQ0zT6PQ3PQ/2n1WaNdkxPCpEI7cYNEwVaP6TQZIiPlx26r0
         x1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522250; x=1786127050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKaPdB4MnlwEF1r+9WMk80Srkg2KM9H8TZMozCmsZJg=;
        b=AL6djLkuUv7H28XO6FsofbveVWJXMZFTWBl48ktMYWGucMgGpgXe4nEs1Yxo17cjI2
         uR+bCpYTHkJoG9szHLM+6Li8vh49hQY1T/pXkx4j8rYFJPfTQ8rWdG/oIXXe+QuzkI3I
         ES4P5ubg7QUTYJkigTHwveEqqE0R8L5kVNWMjDetWqhbboiBcT8IdOFVS3Fmkzh/xYDR
         qS4AUb3HcUcyGxi+BKfA8tOP3A+UUDA36Kf5xcUxfg7sl14VR1gBDWB0b9REDspr7hNH
         iaf0wOgLGDONQwl5T+UDfBPodCpQaRSKKkUPCok5yoFTYlEJ/bSiIDsCalDjYHEAY14g
         KKkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9mNv3JByx9bAS0v2b6wxupV36JnXDEu6YwZNETYtqI3vfXXTdYUGEOCv1Nz9eWwwcrTiob8Ajq6MNuDTSiLwX@lists.infradead.org
X-Gm-Message-State: AOJu0YyK2Lf2ZgcG4GvIOlH7JEZMN5AAoFNyY9F0I4kzyom1XTT04TBS
	sCqkNQDMuhi1dygDCP00mBPqBLBp6Bt172mUuAUVEMF17rohoa01ifl4
X-Gm-Gg: AR+sD13aObNG55OdCGJ9qaHNPZOA1phy5E/S8uIa9jfCg0CFG3QWo9N7rcdyQaVjPmk
	TGf114Lsb06gLKfTktIjGxzb0KgI3iOYK5RZSME4X/rtjSzQ/g1cOhQq2lICV5fkfv0nu8/BIlI
	t8jND+ogvmBV7vQIz3sVq01fcvNFZp4CVo3KD/zENpmXgcRQ9RY2BZey42B6ID2l1ifv6nCl9Xl
	IqOSA5UrYOpi/zWPk2mXpt6eDBWEe8NnM6BM+SlFNFL0k8Zj5JESJruGkcdiKK67U/0JnHWuOl7
	BfjdLBrqV5ihx/yxv1dcbVRYSoOY1Sma9hJidFiW2qJBpzJWL1O3R8KJZc7aP3uGlve1cJJGjrH
	aCiek6oFfRJH2atW+GuCXzVyfxlDfIU60ot8R5ijzHfeLunQLCQxB6LlQ5seSOZRSGOAZO7wAS2
	+rSt2LpxIRcxsSeetqIN8GcHndnBu+8JmYC45FAbNpbvA4qeuTsQ0WI6eAYmY=
X-Received: by 2002:a17:90b:540b:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38fbc51f1e4mr724861a91.28.1785522249782;
        Fri, 31 Jul 2026 11:24:09 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:d69c:7f00:28b4:311c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm8400785eec.10.2026.07.31.11.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:24:09 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
	Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 0/3] iio: adc: bcm_iproc_adc: Simplify probe error handling
Date: Fri, 31 Jul 2026 23:53:44 +0530
Message-ID: <20260731182347.42888-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_112411_376815_24A2C879 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Hi,

This series simplifies the probe error handling in bcm_iproc_adc.

Changes in v3:
- Split the changes into three patches.
- Remove the redundant dev_err() after devm_request_threaded_irq().
- Introduce a local device pointer.
- Convert the remaining applicable probe error paths to dev_err_probe().
- Keep the original platform_get_irq() and devm_request_threaded_irq().
- Remove the redundant dev_err() after iproc_adc_enable().
- Convert the iio_device_register() error path to dev_err_probe().

Thanks,
Shahid

Mohammad Shahid (3):
  iio: adc: bcm_iproc_adc: Remove redundant error message after
    devm_request_threaded_irq()
  iio: adc: bcm_iproc_adc: Introduce local device pointer
  iio: adc: bcm_iproc_adc: Convert probe error handling to
    dev_err_probe()

 drivers/iio/adc/bcm_iproc_adc.c | 54 +++++++++++++++------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

-- 
2.43.0


