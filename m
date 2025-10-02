Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC6BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=; b=PsYeLg/wvekVYA2Bdr9ybPthFc
	VMecTyAdDsfPXSfL3VxkJ/Pksxg7TaSARA0QhWs8Y7X9eDcooU2lGuD/Wnix1pWsJ5v96uqupZ8Du
	m4h5jVvyDMONe9gGw+eamwNEmgVuw4l9jsM9v63wxCluFLaABWGnKAir68oYG57RZA5hzwTEZjc0V
	vmtuZc8MmS2mW7xd1OJ7FuXwZSoznYi6jtz3EJerYnVCfNNBPrgMLquJtYLzTcOwyeW/UfLy53UE4
	704z42Vv+5dK8GcCyXsyZXuhp8dRDQW+vPPtmLntx/RFPpSy3d7limTb/s3gyKhNX7Qbgs3reN+VP
	334zuiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVh-0000000Adt2-0oOh;
	Thu, 02 Oct 2025 14:42:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVf-0000000Adq9-0rL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso1379113e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416137; x=1760020937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=QVgJ4R/ndSF7MOwBUks1Fj/QGD0EyFdNIHu1kpjYfvlhaAhH+1fj3Z/gs93yiKoQTq
         vLJ9jE9iSXhdD9B80BrA5yt4jcTsWU8mFlA6xLLYQ+bKU47sSkW87wjhORfeXn2w39BP
         UhoKSz+G9VMIL2isNiIHWaQjOkkiQe3aa3VJwEbug74YKfMC7lHpbUn6CvZlrypIdre0
         5DogRDhRu8LU1XjzXkXN1ZGnC5d49JR5GaEgjuLVMDFZmCnvyQ4uDxRCLshQQhFK7+/w
         4/JxylF3p8P0HmrAqQE1HDPW5p6k+5hrwGHtwtL+XNw2jwirZ0H5tbG2hKJHz4zOfVji
         sjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416137; x=1760020937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=KMehlfFgyBckgkxIPfKlJLThlSM1tqtAPIDb7yoqotPuBI9qVNlmkGFl+tHmqtLm7v
         kB7WPGyZr04i7ovZqTG1RWGoUJye1HFd75+zi9H117xmXXcbY7fVbGmrexAs/ZfXRP5H
         2z6UeU2pVjVZf9opc3B9L3/kZW/l4+4uuIkwybI2J6IhiSUJNrivy0aHb8u72z76xStV
         wU/1fRiwUcqgNtDrxxtPtD5OuWe0NxK2ClOVE7Q+za/WZLkguWAGcOU24pMe6FXWcNEi
         ddcvZjdp5pK0kyVdSIz/vuF2zs/z0AKqswl+k9diHHB7+qKbS4zF3EybSKANycrsxc44
         F+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVtrsd+2uYRPkJ7m/yRDHP89dwGP2JnlaBU1u2sDxFOzhCJH9UqwtkQTu0GUb+VTUTJ29HYhlGqJQbUH596WS4O@lists.infradead.org
X-Gm-Message-State: AOJu0Yzysg2wt8QtUj9yjPC76jLoPZ5+aMfZQMZ9BTWOshGqNuOvSoIT
	Fg3e1oT0VdFbrBtJP32tHgMvEIrkphWy58Wi0UC0+Qh1qRA6Q2OfhhWQ
X-Gm-Gg: ASbGncuk1qTataKNjJqf9YltPOyFYzlIj/PbnPU6WaK8Q+B2D2OsPO0+9MZwOE0IoAj
	+dY6WdiZCaZqJ7Tw+HLjiGDQwHFwFgkGGJZAUssRmkUzjWnodvx6q+R1PpQs2wbOTyJhIa+WpKD
	C3JzzwBcsqdgaS3S4JV/G2C/R8ouO4cVI8vZPh/+OrB6g7GO0hfZNgN7+35/Mwgg++iHBiRrbBg
	kVvw7BuupCriNrexOyQxpBiPXBjpb7tekXjxMiZwjxXyh8Wi2Jb1+ZMQ49yvJpyMKorvMsBeBaw
	eUcDG6NwggglBjkWU1u5+ZX0Li0RJa87sE5eAWhmSy9KxsoFOCqQI0ypYEXJyqzDZWgWhPTryl/
	gzZei1SHKJxukm+nKFgJUPSPY78VRs2pDgAkPWkDoGdTzOO8jHd4aD8DSrWPsl1JTR1OVN14s+a
	exfEcOtG3DM/Kf7hc=
X-Google-Smtp-Source: AGHT+IFlC3v1YYZBYn9JkfJx0Nz5xBDWw6BPu2hVfH1sXIWLY5CnUNsKrvc4HAl7fKytpVF8f6F0Pg==
X-Received: by 2002:a05:6512:6c9:b0:57d:1082:e103 with SMTP id 2adb3069b0e04-58af9f1fb89mr2486707e87.16.1759416136880;
        Thu, 02 Oct 2025 07:42:16 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:16 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:35 +0200
Subject: [PATCH v2 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-4-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SEKtq8WlaDinzaqN6sbmXex+0jo1iDkPy6Zh0RvgHvU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o84HWKLdePi9d7Tc2PXy/ubOIvh9PDmJUI93
 qBA7BYJFC6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6POAAKCRCIgE5vWV1S
 Msb+EADCHGLcNzYBswSFO9dObGRTq+GinFNvJi1Xknuw5pbEsMWNSeUHZO/frQMkN2WBh/bZXPn
 avl/25KjZ2kLk31+G3MYQoQLfJ+rF/Zo9h1JtYZqtbVlE5PKYtbWIaUaw1kl/d0q5HKMt7YHL8r
 Da29RmFGTWQ8uJKcUynIvk/VRZPTHehK5lRo/D33kuSZPtQ4lzHJ6Pl9aEGzegukAi0QlizBJyI
 xhl5Yoq1gsRdJjxLZvL15jX0Ohw9xc3mvkL8pSRd92zB5M06TZX5B5Q4w/+WydkgWrpBjzSocqX
 bh+Lzq30gHjtmDitCM1WL5BSE85Tize4E8StL6gO8A5RxkmcZX0RUxYorO1vIgqIh0d1+Pn0rQ4
 k0kPZ7ymJ9bt/Yet8S/qfkpIZmEkIGHAwGPphM3wXnYr6yF6oYXg4PaT3c5swKe4y6jeNtc/Qsx
 57kT2Q77aPPsW6pjPVrKcNaKsrJa3Ub0raMYm07sWvUnJxAry9np3ViFl/jGMZ2VOsf95NLcpLQ
 3CGiwzg7UmikygJC6xwPKFtsUKqsiiMZMRUslJHwx1dcnxXtXvWHapivkPIENm1VVhLb3u7+UMP
 6i+F87YEJilujFQm+zW0rBIjuOFvd9To6gLjrveIMlp5TojCJkfAYq3wnAkNfHEjLAL6nfxIS2N
 uWqLK377NiLQPow==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074219_276189_DCDFE2AC 
X-CRM114-Status: GOOD (  14.25  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d0ef108c57d13c10004aa25014cbf..fdde573eb59d11a7c6a87141863df1b9b58f64fd 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.50.1


