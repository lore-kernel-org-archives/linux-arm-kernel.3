Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32814C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EhU0lksOjQ0TR3P146OV1hVStSVy2GPBLJL11UWPwxI=; b=fMs5lAdCK6YNbP6226GLIk9TRq
	xnL1pUyvvkRdWzMIYI91Kp3YgV74k1TXIgo0UEDCvQdcXVHmy1wuAigRiUgVTRduUVxiM8mfqa9wz
	O4g0UQOUj37aPHJLG2GonF4CTtffHq7zAOhLrc74pjWcH3s6mhsn3KFJ9u9nMK9VP92ZNgyagVZ0j
	jZeV77+UbERsrNBt3/DWQzULhqbMimehS1EVWoaIWpkFH5kG600p2ZovW+/HwdoPJrcn7CDCUMrLE
	/XeLwWpOGLReMyMk+kfivDm6BfXuP6tElhunR90Ou52UQx1mvwp6lizkjhcrfD+2lchkqQ6ul4Oj0
	Yx3f2VXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqePU-0000000G5Jg-11v9;
	Sun, 02 Aug 2026 22:11:56 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqePR-0000000G5JJ-1Fzy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 22:11:54 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c2a76536bso25595761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785708712; x=1786313512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhU0lksOjQ0TR3P146OV1hVStSVy2GPBLJL11UWPwxI=;
        b=feGQ2WpVIcFc/KcPQ9xub95AmGQXmLCgmnCSSixrqPjjhoYeXaCZjA7yhaLblKkLxi
         klTIAfbq72Q9NSH571dO0dxHeX5UzEIEXEJzQh/llznyXRo+kHMZy12MYZ0WgMnUrPjG
         amWua/Aoj0F2srT2SXwBkIECX+Ceaq6QxicArZFJbIwwGrqrrKt64ll3W7vXXQIq33e7
         nmMB/EuPD9sh9npw8VIKln8XMvb80DwUJCsqAr8Z7D9yJ7BmlpEpH/K04KDT9zsxAfZx
         RFXivudcat9oletIW9TAo6W2fC2VqT+7aj6oZvWlmpYUP30BV98n8p5dHbWnW0oGN6Ha
         P8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785708712; x=1786313512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhU0lksOjQ0TR3P146OV1hVStSVy2GPBLJL11UWPwxI=;
        b=k/C37i64AJj9W+vtbB/skTXED9cm7/FzAolhl3TjA0Ppd+1OKKfb5WP/PhQerFYYfi
         xYUZi3yXS4obv2rSmneCbDncgEe7XQlJhOA16xqPDbfO7E2mYXFDTOJBnhNidfo7zaMR
         YwW51CG5/4ETcZuqCkBPjsMfORVRIWE8GOuJ42Bu75JMIf9ALyAy6xJJXFLomh7LAMW+
         uLVrL4FqsbDV5ausBZfjgtOhqtlmhBXnqajCGKaK3LMe+3dorvQyliMx1sxgxeSQ62Bs
         mzP4szQCDaJumzX7+lJxUufCL6st3p8flvEylIA0YPR7uMz9kY+8yJzvMx8Ht9wuT0OK
         KGhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+PtzGk9BlC4ULC+kIUuMbfXaRCKJg23z/mUNDjOGZpASpIMbS04IeAruB7QX7ut6HW28NUZj6blRlvSS4cF3L@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqxAABY+6TKyXfgyXe1VyoXfWpCSZSb7pFbw3KNBAAL/Ka2OM
	laHEc8bHPL9GRdXDuK0oQvIVSJmURi6mhOuIeHy3ng3cSx9Rm5YNsMdL
X-Gm-Gg: AR+sD13xPqQkgL52Q+gjUA09GA+QvwPrTe0sAxJrCHUamsOHIYGw97wTowhWtjF3Jc4
	f/9qOulSA7BS0wenaXmU0qOoStJq2QhNA1gKdxKI3LwxoAF4llqdLZX2H5NivbpAwUUqdeCoF3S
	HNS27Sr9oYYsNCb4KBaT4U5AwQNG0Lut9JNYw6TvOY4s6qDEGrKCladsmYUSdl0jjWMBg2ksHJB
	QFO2eBvped/3MsyvERHFyhUGlfOd8xSCDxiRQABv4xW3LzeXImmx49Ql6C4CW0tHRNaWAu373ej
	o8qP7GJYLrCxIDD/HM8LxCJ6daPd44m6OEiL/NFIGAj/76iMfJUOHQVHxMH00hF2JROOQjG/W36
	+OaS0oIZjoNG2WGXRYsMqp1Dq0Isv6g7JZmNY1u8fNu3u4nQRlMJHS7HdsR95UcEXIQGQ1SuYA4
	Rm2+BDc6WyuxwwrzMuMqj/talGWxHyqrbqoR6vK/7TKGb0uo+uyzTX7e5wdCtpBWF5YJSnwIt4p
	fYTYZwpIa4+u+7jgzI4MkQhWpNFF03tvLNBd27bm7f0xifKWEaLnd60SoLlwDM=
X-Received: by 2002:a05:622a:1f95:b0:528:3142:d466 with SMTP id d75a77b69052e-52b567cdee3mr154874811cf.41.1785708711652;
        Sun, 02 Aug 2026 15:11:51 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e7edb3fsm49573231cf.4.2026.08.02.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:11:50 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: toan@os.amperecomputing.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] PCI: xgene: Use managed clock for PCIe controller
Date: Sun,  2 Aug 2026 18:11:46 -0400
Message-ID: <20260802221146.573233-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_151153_366677_A81BA721 
X-CRM114-Status: GOOD (  11.42  )
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

xgene_pcie_init_port() obtains and enables the controller clock manually.
When xgene_pcie_setup() or pci_host_probe() fails, probe returns without
disabling, unpreparing, or releasing the clock. A failed enable also leaves
the clk_get() reference unreleased.

Use devm_clk_get_enabled() so the clock is unwound automatically on probe
failure and device removal.

Fixes: 5f6b6ccdbe1c ("PCI: xgene: Add APM X-Gene PCIe driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/pci/controller/pci-xgene.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index b95afa35201d..4fe3581b9372 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -321,18 +321,11 @@ static void xgene_pcie_linkup(struct xgene_pcie *port,
 static int xgene_pcie_init_port(struct xgene_pcie *port)
 {
 	struct device *dev = port->dev;
-	int rc;
 
-	port->clk = clk_get(dev, NULL);
+	port->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(port->clk)) {
 		dev_err(dev, "clock not available\n");
-		return -ENODEV;
-	}
-
-	rc = clk_prepare_enable(port->clk);
-	if (rc) {
-		dev_err(dev, "clock enable failed\n");
-		return rc;
+		return PTR_ERR(port->clk);
 	}
 
 	return 0;
-- 
2.43.0


