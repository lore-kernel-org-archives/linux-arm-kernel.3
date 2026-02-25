Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF0F3C99C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=; b=fmKGZJOteOToLxF6GS9O6r0BQc
	/Ac6DIgqKcATGCf8duFfda5S0VfY2ZPQsdDOWv8JJxrYUxz4tkt5+rGFCoymobwGxozMUQg3CcZpe
	Wp/7ChGf7BJzxTid+WcMqHoVEpPpmmPgMXvuJdMHlJSV5HF0ZypypkoSI2ViKku5spUe1St+wT9vc
	DR0+hnVe8oTDFfADMSYOj/4ktC3gFx+k9Pe1s+Ky0zNT1Zs6hgIiFMQt53LAve8mRIM6W5HI+lB+Q
	SFAJDxywR6BXKr+9XDBNn6N22gphQ2bE2XbI9kOO2slbfrQX8+ZFFJ3iHVhlrBBin0kP/NDNOLTs/
	NH9FTfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ei-00000003PYq-2c2u;
	Wed, 25 Feb 2026 07:23:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Eb-00000003PR8-41xh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ad9516a653so8344275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004181; x=1772608981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=;
        b=jNbf5JBTv5DlxPpEDUg4MRmPFBVzjyVDPB7joB8qOo+Go164DsEGDzlr59wQkyh/+u
         NIz+w18B6Zb8+Viq7+4gu0GTFwy/7l9Gwf0u4A5DFM/r1+F8SnAlskrfCOYHItE2+U/i
         PPhZxDZVYZsuxz9Nf3AN/ZJdZ3RNLUvzLLxZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004181; x=1772608981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=;
        b=MJircjEeyLJG0mzeYv9WeVjvIfUCUJly6PFfYFE1ftx5rBsVeHlQrle6DSHN+hWeNW
         UUtAsHJohCg1docfkfWXpdTJcMT5ESKXDQF0CHt8q00ZgxBE2kUvzLH92jE1c297Ku17
         N5NdOp8y+CzXYXqgsrabBgOIj12gYPzVaDBkr8OYCQ5PpPSkIB763Bq/fN/nfNFGSQs4
         4F9DCpc5v9nhx5Wb3RgVly+J73gNjJNyZtjyg1YeNSlNKDLY5Us+e1vmpHTp09IlYmfb
         bfCOwQMv6VQJM3i8Uz/RczzGIDjX3z273I+KgF+xP0jxQUE1AIZr48IPOkpR2pj2OaBv
         1n0g==
X-Forwarded-Encrypted: i=1; AJvYcCX5GrU25T3SLhVkN6AD+J71/VZCb/Qp8opl0c5yOHTdJOhfDjw+1kPrJ5dhbpzYkTjsSzV9h2NcYwNvWg6fg8l2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk3CUWHO2q37p6/0LOnv2kkRtAxTlbteok2cnMlb+XSP49L6MN
	2/CRVXrUFL7/coJcHFd5IasDRcNxW/oXI+Lz0CORApGepoNWlPJL8HYf8NBzO2pJ8g==
X-Gm-Gg: ATEYQzxgv7SJ5gNUfsWJxXH3n4SDllvvrhC4fe2m9cypZIwq+4zTztyt3XVerPINWfC
	L0U05wi+2dwSzr3blDd9ehqn0kkZWn952VEh0BOLDNRQRUBcDdoiaXKrEND06AoSCFlG8gKq8VH
	Qc8z0qclZC3WTUUiXV5qQvDuIFHfuxERq6BAU2+ya4dgZTrjC6sJXWogA7132LxZMVDgKP4PPo6
	iCzpfZfTg/Gc5doy6glFRTyfKJ3g8LyBGv78Fw9KuTI2GO4+fvW3vYKnYIEwPooYvEOcFtdUsqS
	7fb5ZZo51m91lBqgrENIF7kSbzsltSyKMAY7I1YbdseCd7xWT+QYhqkBIngzKCcLqvxRDSz6NEJ
	4CNeGgRpQ2hFvKkspcWv1anpW4yEIL9BuiFRlHBvhgIn3VVB4ERoUN81i7aoSE5y2+iIqq9mtUB
	ty5koCMvF9Z7CSbxo43SC/mjSNkqOF1OY838cMMfabpUcKPg5ftkcYbwEO6bDgoHxE5mpWpTuqg
	lAx8w==
X-Received: by 2002:a17:903:3510:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2ad743fe17amr132040615ad.5.1772004181108;
        Tue, 24 Feb 2026 23:23:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Wed, 25 Feb 2026 15:22:21 +0800
Message-ID: <20260225072225.3345307-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232302_005631_8E44B1D8 
X-CRM114-Status: GOOD (  14.40  )
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

If further setup fails after the device is powered on and link training
succeeds, we want to place the device back in a quiescence state to
avoid unintended activity and save power. This also helps with power
state tracking and balancing once pwrctrl API is integrated.

Power down the device in the error paths of mtk_pcie_startup_port() and
mtk_pcie_setup().

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 870d3b3db11d..7459e1c1899d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -531,7 +531,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		dev_err(pcie->dev,
 			"PCIe link down, current LTSSM state: %s (%#x)\n",
 			ltssm_state, val);
-		return err;
+		goto err_power_down_device;
 	}
 
 	mtk_pcie_enable_msi(pcie);
@@ -556,10 +556,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
 					       type, &table_index);
 		if (err)
-			return err;
+			goto err_power_down_device;
 	}
 
 	return 0;
+
+err_power_down_device:
+	mtk_pcie_device_power_down(pcie);
+	return err;
 }
 
 #define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
@@ -1174,15 +1178,17 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	/* Try link up */
 	err = mtk_pcie_startup_port(pcie);
 	if (err)
-		goto err_setup;
+		goto err_power_down;
 
 	err = mtk_pcie_setup_irq(pcie);
 	if (err)
-		goto err_setup;
+		goto err_device_power_off;
 
 	return 0;
 
-err_setup:
+err_device_power_off:
+	mtk_pcie_device_power_down(pcie);
+err_power_down:
 	mtk_pcie_power_down(pcie);
 
 	return err;
-- 
2.53.0.414.gf7e9f6c205-goog


