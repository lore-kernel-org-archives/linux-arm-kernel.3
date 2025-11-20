Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4ACF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrfTebO8rNsGDrFrDajdUyVNoAVMli4DcnLnNa0zpcw=; b=El5Yk1+ivfA3DzlZ1LmmAwldEC
	yJSjywBcx0VXfzjFf8sBnYzbzTK8jHIMkhsc1186yPHJh9A22AIvZ9Bk4om4d8CVNvWeO+KguWiOb
	Fc1EobD5jHWJzipb0y13W9oYpEi2LoiqJAn+WcNzVlC4ISVtum48mJGbmjsI+o4EJf/GHhH44bfHU
	nKde6xYjB8e5AAqNiAu56BkWTVWOtXdV3d5Vi7ncjmDmmKj2WiKEWtyJn0afC1ZHtJP3Oo+5OKTCp
	U52oWCijZ6n8FVcMbJjr13Mu+d93Bq/U0Cykl3f4XLQZIklG2NZXtWhKmyk8z/8LtuDbqzN0KWQVF
	rYu1+irg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rD-00000006a89-43MB;
	Thu, 20 Nov 2025 11:29:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2r9-00000006a5V-2rxq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso487316f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638182; x=1764242982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrfTebO8rNsGDrFrDajdUyVNoAVMli4DcnLnNa0zpcw=;
        b=u4Vrv5upYv7aCq4UkrnPX5lA0dIM6ckjtRlPxDIJ8rTYmM5fk+sSnEpkBkA6U7XPG3
         BHXPjfuAThlji4jpNYet0okRAGlcRF5gEdOwBmMk6YDqDi2QD94opwYWs29KMiVtS3sf
         nnsYNYsC8pEYk7p3ru4gCBCALQk4pXIokh7iQgdmWeF3XuUO1HjdfdldHNEhiWpRpXkS
         T4dpIIvCgKWKO4xLji/uvfZqjZc3e4NEhSSkAXlgj/lPNUtC097hLd+Ab/nLfiuMrfU8
         CmBn7dJOrkQTK95XrMx/EjuxOisSuXs5JupZqwmrK1lOEUPrKduWLNB+01QN4NJAdX5D
         WBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638182; x=1764242982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrfTebO8rNsGDrFrDajdUyVNoAVMli4DcnLnNa0zpcw=;
        b=Th6xD/CocIp06ZDSNFfEh7kxKsRX0YbGHOsyAY5JRWDNaCkXDu568Dzj5iIVBQ006I
         vovwR4Eyr5cq0P81/NhaPWBbIlE5192cau9MRO7A4jUfM/z+t2gufKEAycsIxzi3XnKp
         NGFx+YV7Mlm9cnbcXIO5xbvYoesLH928HVYBUUDnf7z3PnW+Vmcs4B1Smj24DQVH7dgs
         TZQAY1+sO6LdZBC+eBlNlHu5seuqe56NK/Phj6NfTuHOUv0mDGn87oy73hPTVeOIzgR1
         9xPLKW1e3JkgMOpyVWkF1hyRdZz2Fq1fVMRjfH64+M9eFCD34m7fyua3HnxweARD9mKs
         I82w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7VtnCWRD8uxDzJPjdodfK5Sx9YJ1ccz3WtYyCm4BaP0pd+xvoNG25h7spsrnGktxiWbXXLejAYjthkx8T0O/@lists.infradead.org
X-Gm-Message-State: AOJu0YwoP2VKe3iNHQUOabtwzQ0oVS831r9iS43C2WHKHiKOSfbhlDQM
	PTeK3zttDbKt6/NU7NqC8kteMBAdF0Qk6gyG4RsyU6y4nDDdy258xvi9nw/FnbY1pFY=
X-Gm-Gg: ASbGncvf5003aCaN/HPZtXo5Sa4zlOGTJr3MNI+ydJK23JwUcC5uW7nH2IFOvA1XN+k
	yYwXZrxRv1YFyugQ2Fp+rZLzKeRJV0rYjkIFBzH57H0X4uHs5mtP+GHWvB0ixRhKH9VIceyYAn0
	7zueNU2+6xgdPm1/7gktoPfkGfp5EkpZBYscOC9RY0ZCCQC5I+ou0k4iall7IKXEl89PvFFMQr6
	Z9WrZpnlHzBo8WIoD4QYqIXPy7c+/vUNEVtAjcHuXKROGIbASkvxVkuHx7WB1QX8RDoQBC6fnEE
	pbFsycR2APX+oOaoTYk4L6+IsuMMNHfQFbJF8dpgE1qIcMb7r8MjQLOx184dYiXYrX+FHmJdZKB
	gYi0ECY2Au/BQmM4BIQYmGaivViIPTbVHUJ0lOCbxGgZ8SqxUZZCw7rlAZ/t1/ySWnGLzbBQN28
	lLQVdRQ8cPN7WHc1gHRfUGEmeL/WUL8zISALIovzf8U2prbehds+VS5jFqdMk9VYyFJqeTShPVL
	fSe8g==
X-Google-Smtp-Source: AGHT+IGMAZHNjJ7KaxZQW1CKSy0e9pKm4Sui3wq/A13ZWcUF9r4m0xVl2YKFgMjFczOXBPsIBVjfGg==
X-Received: by 2002:a5d:64e3:0:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42cb9a7091cmr2496273f8f.56.1763638181851;
        Thu, 20 Nov 2025 03:29:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:37 +0000
Subject: [PATCH v3 3/6] soc: samsung: exynos-chipid: rename method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-3-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=1404;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QuLzD1mgISg4zkjQX+NNcW0jz68RwUFmOx017oxWLlg=;
 b=QwrG8SY+YQBiiH7MPcJkxfx1Dq3aLNOQbU0oxhLO628nA25GYuZ2PBNpZnlbdqR+mDmqspLbe
 gtSnFLhRo5TDgGu+KU8rF/8hHzrHdNmGF12KCR3TWXjovKn+lNDkDqn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032943_943980_8A25CDF1 
X-CRM114-Status: GOOD (  12.92  )
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

s/product_id_to_soc_id/exynos_product_id_to_name.
Prepend exynos_ to avoid name space pollution. The method translates the
product id to a name, rename the method to make that clear. While
touching the code where it is called, add a blank line for readability
purposes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a31f5b3de20f74ea 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -71,7 +71,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_name(soc_info.product_id);
 	if (!soc_dev_attr->soc_id)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 

-- 
2.52.0.rc1.455.g30608eb744-goog


