Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF58D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=; b=WXhHezhqZ79VpsC2Wgzx3S151s
	8a7IXE54GZsRlBPfgBqxprajSkkx2Z0DLvPa4+IAY4bOc9klqW9bv04rnpFK1w6WGTHEPsbJd7gcI
	o38Pke4SlGm+Sno83/Jao0Cly7ZiMthSJu/eugT3gMgDgvXDx7CCjezBebJxGqu1yA5g2RGQvaku5
	JE0jn4pScd+jaOxGbLw7vWCrLFZc1fXTGC+Zz/K079dSXsept+OFq5stRiuA7KOdX4LlZuhevIRT0
	AaxeY6HfnGuwxDEoG7yo2Vjw/TQiwg/7NEpvs52WIeLDSs7jCrOeMutbiNsMeoKkf260DSacL+D55
	UfpAiJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSexa-0000000DNh5-2x4K;
	Mon, 08 Dec 2025 17:23:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSexY-0000000DNgQ-1kN1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 17:23:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2677022b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 09:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765214619; x=1765819419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=;
        b=czsKyNxbDQYmEAaPffYco84ZKTkLMMXZlyQypAFkApmaLl7HIzj9KQLSuxIG3Iw8QO
         HRWvXZeeR06i/RqDpZb3/RZrXSHmP86R75T7AZ9kypqxGZQiGq5YqlaSIrzeVsg2J2uZ
         d0DGjISGu1SkcYMKzushDPFimz6nln/9wdA6Xly+0u4N4ZBIUtscyLiiDW2k3Q+yb+uB
         747F4/PCEeB2NCEyEJGOV1UlEtdcmu+eds38KScsLg+POvxiePPZW497KhKvi3zOt70r
         RI9/0o8zzkqNh2aiqYG8OhTmKSaUeT553qiR/JEFIBEmg5LCVGBWwXEhbeBhKdb0Uro5
         ZmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765214619; x=1765819419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=;
        b=hmU1RJ93F1qD1xWicXm3jmBOfw2KKFSt7kC6e3GyxYKdNaGFJIEm1UXVVqahKZQBK2
         P2hlPhtMGkcqQEb/34P/rNiBbVhEtWCBpLvVQhnfrE45FYAqX4/zSzeeTOBdV3eJKM4i
         jNYw0FTmKRTrsm4OeaZI1ivSzpcAL1nTA6eOyd/lSF4LM/ScZL8tMatdJ44nR2s5MqPZ
         uzIlOcr91GO6UOSbdY6yQCj/nvesqTBEHbtyeII9wAx5Z1iYhBXbawTij7wXBWltWALD
         9QQptW8E4PRqqJsvQMcbLZGktU1S3DZNoOhz+qhD+/dDWvYgKc5tFpmDbcGrWQrpVAD1
         W7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX/IahDGe/RfmsXN6H3ayln35/cN9vW8E0+N8trWPIIj4V+WmVpQHZgxHoRaNJTl8sKt9Nrcpy0Y7jX1pe+s+qp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx32LNCScbQSp4K5EhGnIN4FKUli0odxctEmv6bf0MffJmuf9P+
	bmdqcQcowGnbqGf/PhGjmSaMtm/yzR0OvfW4QkoHCFHjwYpPybqfIYah
X-Gm-Gg: ASbGncuseiiCBf123Ib6MmOBgnVhlwWXhkgNKpN87uTf1nqeJFHt6HHQ481mqL+NZEo
	0kekyxW3vtlsecKiu8A2ZSujFEML4kHLnGuDm6jn2IpDA8eBIxHsjmWuvV6AExC4qxFfO9enF9j
	dsmzgriwzxpMfJAYleihGXFeqJlPH5HF/8q5/BIYXV9j3THKyqOlSzgfcvpLyJeGKMQs/AvdKWO
	5pyyPnIZuDjwVwalJWltP4SFgoNbPRbRVaQxy2XyJjcEy1C8hRzjDQXj4CF9Q6HDp5dISuPbW4g
	nTm8sq1Ok40Q/jPSdCw877tXTRlJfQo5YqyHC0uZB7lTNJHyqq6j5Qy8V0VfQorY2HIUwzFNB6+
	bYuOONOoD5tBr7m1NqeIlpivMWi1r5eyDh2n/gpyC43P6tO1P/P3O2FP+4UgYDs/WeeFmSmQ6Fp
	qjvVzkx44fD5hA
X-Google-Smtp-Source: AGHT+IH3U7wAIn1n8s7LBxALn5cXyfQ0bJrUjXZQ0dex2XlkC4L563Ju/0lyvT1vRLhXem3jcORmOQ==
X-Received: by 2002:a05:6a00:181b:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7f03be92eaamr104219b3a.16.1765214619055;
        Mon, 08 Dec 2025 09:23:39 -0800 (PST)
Received: from archlinux ([36.255.84.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a0533f08sm13766369b3a.23.2025.12.08.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:23:38 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] wifi: mt76: mt7921: Replace deprecated PCI function
Date: Mon,  8 Dec 2025 22:53:31 +0530
Message-ID: <20251208172331.89705-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_092340_464868_0E4B3496 
X-CRM114-Status: GOOD (  11.06  )
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

pcim_iomap_table() and pcim_iomap_regions() have been
deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec9686183251..65c7fe671137 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -276,6 +276,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
 	struct mt76_dev *mdev;
+	void __iomem *regs;
 	u16 cmd, chipid;
 	u8 features;
 	int ret;
@@ -284,10 +285,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-	if (ret)
-		return ret;
-
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 	if (!(cmd & PCI_COMMAND_MEMORY)) {
 		cmd |= PCI_COMMAND_MEMORY;
@@ -321,11 +318,15 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, mdev);
 
+	regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
-	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
+	mt76_mmio_init(&dev->mt76, regs);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
 	dev->phy.dev = dev;
-- 
2.52.0


