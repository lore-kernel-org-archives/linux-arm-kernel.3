Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5EBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/zhBj9KsrWu1iz3uRFGRfIc5hKkqLHf63XbozGChRc=; b=owwrEMtw+RM5RAbtvygM4H7gx0
	IDg302EVzUyU+irxhap7ycixK+I0JNgaxcOTls/nEtMo78PF20Z5N5Z54XB0DwWR071JwpOglbP9A
	2G/7e3NH1OOAUhQ0SastUylkGrwLBgFMHy/Ugm1lzOKTe0kZ2Z8/+sT+DjZlPWIBt9A7RV0bbEe1y
	y3/wtp6FY4a6KX9lKM2WVnC4LwM7YS3GCxZnJIS6yHJ/Jx2tqE5u73jBSo55IA9Xq4qXlrhD6D8p4
	YBNmqR/c58O3GaBUV1t1eoJg0oCp6BEJuTWIkuo6Qvc2ETlnWufGJmx4Rlzo6Z6kpF3ZpQS447d8r
	mAFT4c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKU-0000000EcY8-3Me4;
	Sat, 22 Aug 2026 15:08:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKQ-0000000EcXE-2ArK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 15:08:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84830c774a0so2291728b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787411294; x=1788016094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/zhBj9KsrWu1iz3uRFGRfIc5hKkqLHf63XbozGChRc=;
        b=gHi0uoRXE1yUZX+k7VFyCWykEcuB2qnObzu9EyHQlT4kcIp5IdKhY/HtCqlQ2kI3It
         Xp9Wn3GleLJQNPSqTTcU8dFAqFvI/BPsiIFgKg4uhPGkevHU+Ck8w2L75aLMV/kNtiVC
         1cswXD9T0nklxTsHxgOZFfPNy9vzYBqdA8jGe3gSkVFMmw+VcDcWVUVVypXI+2QUDbCh
         3ekNFyU0tPibZR5T87X990jkZTbZabJb03jfMworLVTvwP4toNPi4151ORITetdi7xYd
         TBzCwdcbkN1PYNQ24uXgsTOFtZOlIGhyj7KeLH51rRZIp08z0rxn9DRvPO1jBmEgQg9o
         b7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787411294; x=1788016094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/zhBj9KsrWu1iz3uRFGRfIc5hKkqLHf63XbozGChRc=;
        b=R48Ai/c6/RonIWpm/BnFyVPMh7AoA26Ee8+mokjobnoOaaJx3i5NcnmlVuWJ8G2aPj
         9VuWe8/4YixsTT1jLrcVh2UFw+ptwc1psr4t/1VCjay/SlkUB9i22xdwgvetKadVmnPv
         yzXOv0QDU1l3wQPqCpmsHiBCli9c7ANLlKXhqlI7JsVaatg0UhOacoFMLUQNQUiKeAee
         Sb2hreQ7Nz9X5TmxtU/fQO1mO6duwoJB2d6gJOQ27ja9w79LtT5MAObk+iaVdvQP165K
         1YrJGuc5/qhUcdpB8cOcBykL+YzP+VRRazZG5WfQteZyFkzk5gp3x6PMml/1UZsohaM5
         RYAw==
X-Forwarded-Encrypted: i=1; AHgh+RoIXV5GUqgU+fVPenszk//zCyGCpbTEbt90ww/t+jzaprdyiQLfFNYZuwF4X2Oa5KLpEOSVzQ/Wr4msivwcb185@lists.infradead.org
X-Gm-Message-State: AFuF++kB8kZW2uV33r2wr7JTTiUonNCLz0szfqJFlLChoT/qpYFK6Dbx
	qNYqhyVqnJYodeGsrpfo7eHQL2BiUY52ZiKgWttVyhghnf0TZKGTaMdQ
X-Gm-Gg: AR+sD13Qx/Ek3NOrGoiT/SXOwywjeWMlMDYz8WHgK4htkk05o3M49GwK6zaxscNO2tJ
	bgGDOqN7PLXFDOudh+5P6LKwd7MlUiPR5QUJCkDdpRU2MI4yTxjTphyEwJ61q/iIZI4Pj2Ro/4q
	SI6FuHH6Zb3DL06HwwOxxoi7xcUoqZs/CIdM7O4UabvZDgOTVSre94PzKKXY1eb88sKH5m1pXfc
	DjQvgtXhE9halDmstVRpG+ls7EwIRXqkM/LB7ReXAFGcdXTRRcic7KzJ/kte+AdM6Ghrf7Avm4A
	iTp94+9azaEr0MxvmUpjNSmpS6ySmO3iKRnL6iYdyWH6btEVu+MD/NS83OpZuYaU9ZP2LNAVyE3
	xRv53693lsY9qi0DqcKgRM/+0ioUbrm+rZ2OCBCK+zNUyZt7JF13x2TYmbeBcizLj173GOEK6mC
	Pd2ol4EkbwFUYDQnqevnC89EEtMlEPRAENOUdKPa8DwK7i+amWP59+cC7w049SKYYCWvNT7t734
	A0jFnNmoqFZynVoNnglIZ5xGEggx90X7jq4V5c0m3F4LAcgCzRQOGWQ
X-Received: by 2002:a05:6a00:14d4:b0:84a:2fff:cef9 with SMTP id d2e1a72fcca58-851f9f84b8emr18586843b3a.13.1787411293482;
        Sat, 22 Aug 2026 08:08:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b1ebsm628242b3a.30.2026.08.22.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 08:08:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 22 Aug 2026 23:07:48 +0800
Subject: [PATCH 2/3] PCI: dra7xx: Fix device link leak when devm_phy_get()
 fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-dra7xx-v1-2-23e204d5548b@gmail.com>
References: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
In-Reply-To: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787411275; l=1121;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=B23Kydln9+sFNwl/EddPsXeSNGxgpJc+Bv5D8Nfp/CM=;
 b=TX1ESX7RK6u/H0zkVg6E0SCFWHpFzbnS5YCn4VL1Y4bMfduClDLmt6rcMJoaUKwAyiOBXMhmO
 cENEnoJzPM9DLryFJyE8Xfafq84ILfLThjpcV/5SGBtHXPuUruKAjOu
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080814_570186_5E899E40 
X-CRM114-Status: GOOD (  13.21  )
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

When devm_phy_get() fails, the code returned immediately and left the
already created device links behind.

Jump to the existing err_link cleanup instead so those links are
deleted on failure.

Fixes: 7a4db656a635 ("PCI: dra7xx: Create functional dependency between PCIe and PHY")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d43253f7dea6..bf32b14436f9 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -740,8 +740,10 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	for (i = 0; i < phy_count; i++) {
 		snprintf(name, sizeof(name), "pcie-phy%d", i);
 		phy[i] = devm_phy_get(dev, name);
-		if (IS_ERR(phy[i]))
-			return PTR_ERR(phy[i]);
+		if (IS_ERR(phy[i])) {
+			ret = PTR_ERR(phy[i]);
+			goto err_link;
+		}
 
 		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
 		if (!link[i]) {

-- 
2.43.0


