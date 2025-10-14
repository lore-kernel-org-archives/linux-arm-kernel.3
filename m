Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD48CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbYmHynLeWlw8u23NecrRWs1rFP/nnkTB1+gQnuvcng=; b=d3GELbtQFmZ5eW37W8yb4FR+lH
	p2gF3j0EYquef9YbzX73riIaFm9x7/72hxia+0aflFSb7FwbF78ejzWACedtHm5k2j+Am3WZ3XP8T
	mYr5CHuWEHvpGWNAOqgfoEBOCv7raZu3cfRuI/3TeTbKtsfDXEbrzoYyOI0rXNSQHDdQMNQFbm3+a
	UitF6nJC1w/7TosGpbQQzHorc21bvOi1AxLNJyz0eTN1r9QxjD27+q4JbabaFOu3UKHpj1o7CpfFb
	RSHNj+DSVUFTY+tCT9HWnw7bTgzXb6R8ZP4NM9d6lZjpJRwYFP68829aQQ6UfNeg5fI8pO5ZSh5rg
	QwWAHOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dAe-0000000G5E1-2Itt;
	Tue, 14 Oct 2025 11:26:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dAc-0000000G5DS-2BKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:26:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so48014295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441181; x=1761045981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbYmHynLeWlw8u23NecrRWs1rFP/nnkTB1+gQnuvcng=;
        b=BUN4fKAQmNw7CiGAcpN6NKE920vZbtBaGZbHMBuJFywdCX9CtcQ7hU5DKqJdqOqrQ+
         oJhWMwQp+b7V13eDxQYAui5rv5g4GgQD8snXNj+pTTsoQOJHuypSpy4mu+dQaaLsRvO6
         UAzO9CLKtxXNnzWGiG10Mfirh6zzl9uUFCItT1pB+G0hElmvzpkjO/iseg7T3mQsC8ok
         nAbyNqqp/vT0HIYX/7ZRJ36TvQFg9SOYWTYWBWVXIZ5qkDZBmfaa6XxJGFNhLEM4XMlj
         OdxeV1gORUDIkU6dIUzEHslbN5JBRS17Z37i85HBNRHyBjjwEn++nPk8tYtXct33Cf5L
         nVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441181; x=1761045981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbYmHynLeWlw8u23NecrRWs1rFP/nnkTB1+gQnuvcng=;
        b=UJ3a2r+zS6Wf2Y1AkR/sZLWVIADcSfhf+DgUb0e78JONMRu/cxyPriDlxscRlg6Kfd
         HcVQo3h3jFsEu/xOg6RVoXtY9+iVkRqmMIcldDRxzOEnmtkBOuuiB61A7yjkFUiVayiT
         NsjmuLph75Uw2sOiVD5XKrfQyCI2cdovnZH7K0OkzmqLNzBWyry0Y3onErZ8KTbc3m5G
         98WFA3FfA+XxGxZpoXORUSGhMOj0qLEWtCbjGi37vql8rqTBQJgjhQe5J5iYDeZRvTYg
         jn1DtUJvxZC9UhQ8AihCGgDB0BTFzwRrI30xFKfIJN9aYHHRNuR5+MAUJnSd89BJqdwn
         aV/A==
X-Forwarded-Encrypted: i=1; AJvYcCVfMSnBJ2vYujudhWsaa8YjaPHbr1xVOOmQZrJTVVcEVZYzYOpFJCc6mzKJyux0miBbG/3LL4W7ePNCcuV5bh1a@lists.infradead.org
X-Gm-Message-State: AOJu0YxFYZHl6smu7l/gwqDcRsOgnr/ejPpNBXLv5vVg18K+8JCn+PO/
	jRZVbYd7U8w2G6mT31/zuixI3QFB/R/mdLSgpTsaMFQwoRJrtJpGKpvT
X-Gm-Gg: ASbGncsSjzvMCdYbLW36Qb+woU0R9QhGUmhdYJSvWebSboZCQQAxYbwLWVkp9n81A2D
	A3CGHBLsTXzt0OWp5aWA+sbTNbfk4fEW9cgYwD8nIOFxyRAaDtkFp9CuEmut7Y38a+vJHf/ltTu
	Kx9uWYbVXVXQ7h8ffXsGGnmiJ9lOzMevfNq444y40LFmbMbm2fJsdNZLDbUuTmXgToDWDmrQial
	12E/gF9qqdEkq7AEkpMHgGcKSK2GkHBp7MuFFqPnaKzQjyDUcyox6bgDXb3e9ZzRxnsSbycbptr
	rDdDz/lwfWMiuNhztgAOqTuEWBgY4NQHAIj04r9XAyCg8BAAeAUup82PkpDCVY6VNCLRJBwt1/5
	00Ts69d9ScV2cXo5Mi3pUTHDV6n7540nKF4ErjiBBSCHJrfCrXQMAscOqwQ==
X-Google-Smtp-Source: AGHT+IFO2uKjeUaYUKbnwXbbO+Xo/HgCqYDDA6YUTOMYT5kkkih/xh4BWfPVSZJs7SLyBcg2m31Icw==
X-Received: by 2002:a05:600c:4745:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-46fa9af30e5mr188941035e9.19.1760441180577;
        Tue, 14 Oct 2025 04:26:20 -0700 (PDT)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265829845e9.0.2025.10.14.04.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:26:20 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator supplies
Date: Tue, 14 Oct 2025 12:25:49 +0100
Message-ID: <20251014112553.398845-3-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014112553.398845-1-ivitro@gmail.com>
References: <20251014112553.398845-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_042622_578224_3A6A2927 
X-CRM114-Status: GOOD (  18.83  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Some boards require external regulators to power PCIe endpoints.
Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
vpcie12v-supply.

Use devm_regulator_get_enable_optional() to obtain and enable each
supply, so it will be automatically disabled when the driver is
removed.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..f29ce2aef04e 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include "../../pci.h"
 #include "pcie-cadence.h"
@@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
 
+static const char * const j721e_pcie_supplies[] = {
+	"vpcie12v", "vpcie3v3", "vpcie1v5"
+};
+
 static int j721e_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -480,6 +485,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct gpio_desc *gpiod;
 	void __iomem *base;
 	struct clk *clk;
+	unsigned int i;
 	u32 num_lanes;
 	u32 mode;
 	int ret;
@@ -565,6 +571,13 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	for (i = 0; i < ARRAY_SIZE(j721e_pcie_supplies); i++) {
+		ret = devm_regulator_get_enable_optional(dev, j721e_pcie_supplies[i]);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret, "can't enable regulator %s\n",
+					     j721e_pcie_supplies[i]);
+	}
+
 	dev_set_drvdata(dev, pcie);
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-- 
2.51.0


