Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658B7F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8XpTwYaznTB7X95a9deMFZcsmj1UdrXkb3hcBiKjSk=; b=pzkAG2SSCEiXj5YQS/PpcjsqZV
	+nl6DN6gP5OE1CBOTfLYFTLCm1HEiW1CXuDQakIsMElp5lknpfr5Q5ugiV20vJwOhc2T/u8G6twfT
	wSA3Y8Kzky4HGw9o35PotaSrRb8oU7qnAR0rKMnbMCQOULfhMkalvUzksUlRDGPzL33NYaqmgqrci
	vSUrQPkP7AcymUG/paxNo1V3U21c9a8hbt/hFdWN3f2iObj1HUmncq5lLJj8FOLTi6imDcYSdeyRz
	nSH5vlBavLqTWRTyL78ATQKGJ4fY2VbtImjYIRkDVT81dtXZoamp3V1FC5FiprSPzzI3NPo3r2lHd
	WlJubicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9ES-00000003PIw-3xgC;
	Wed, 25 Feb 2026 07:22:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EQ-00000003PDT-1Oh0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab232cc803so31315005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004169; x=1772608969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8XpTwYaznTB7X95a9deMFZcsmj1UdrXkb3hcBiKjSk=;
        b=mtzG/kblBFsM+krKSuhALnR0/4QRhFbL+jwvwZ93Pw32gKFRSzITpOKkx9RRrarodx
         3S7Gky9qlUd/PBPqYNCOxahF6EWe810KlKhkVVwbYGJsit2t+vh236o9qG6EKFmZQdgk
         z2FSjuF1jkLgLm2C6zv3GT7RH23CUrGEXp6SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004169; x=1772608969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8XpTwYaznTB7X95a9deMFZcsmj1UdrXkb3hcBiKjSk=;
        b=ANgCEr4Y2kj+4XJplYHcpTw9GjQUaJmdEamkb0VP8w/TCm/lqel/HGyqsRRMzCOCik
         U4gZhOyjoyuXI1OfaSqOpfmrv0n1Vp28cZ3NDObRS7FwPFq9tOZt5qdPPTIanoPBA5lh
         UO8XU4rZ/3UcfZx6RLiqrImO9FNmdKRWZFmrv8JJJLHEX91xq5g1hno4kDxQtBf0k/iY
         JxSkjZjfwCZ/Ryut1NbsXacsOQi+sM4dErMQlWpGGKuZuVMEiZIV1bNtGm6C2mzhK6YS
         jyoF2IDU5vl4hZL+W16aoIIstAo1tg1PsTadKDZpQqvcFwmlOOztMC5BUDjoRS/SDo80
         qQeA==
X-Forwarded-Encrypted: i=1; AJvYcCW+GfMpGyBmjev/R2iF/Be1bifgmPv0mpFKcFb4ZpDtKKrtHZJbtJChqUMm4WNVQntmqjPWeFskVSwbPx3e9NAV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt2ULHLmChL1T/hiYTl+0U5tP6/ZV9wP6lwq3JneEL04XJGHJp
	du0hiRWoCF8YgGT0U/lAGDV4fPt0QiucKQCYms93X48eZL+LWE6KibC1Z8UTvmqNFA==
X-Gm-Gg: ATEYQzz8jV+l+QIjfnDAxAluq8qocyfoLGIKu29qkXs1z1e56bBYidKVPCtmYiJH6jF
	BDZExpQBhuNeQ/WTpjs/y+tQCUGQa7/35dqxh/K6In0/02iSnXSU70cLrmcP1My0qKHdb6znk37
	BcuDprSPirqO+gGZR3t74bhYz9Z5N0+tI5f3zuS7sXdl5FIO9af3cmLV0VgSeUiG6eQOEiR0E/0
	TiGcSQUqocT2frhG9PXGdOxH7CYhLNNn1tckJo+GsalO/hOsQJIcsmjqg0z0IJ9RLeFcO0goT2z
	raYMG0c//97707CYLhMC5+9V2YStEZ7i66RLy7RegA0K6MsAaEfPmaLMtOVkH9MHj2Emk/bg3C1
	wuOkPEnzXr6HwISOhFbMR+LuET91ktXl+EKbn2WOhtB/Yg6E5EH5Bv/pUdwT39ZFbD6e4V54540
	/d8OYxWe+JfI9VoUa/fT1Mqr8vYdvQLOk35K96Q1tZv0EaS/R+pT7gxpH/CkIu394YKSvlDNhkk
	NIv5w==
X-Received: by 2002:a17:902:e80b:b0:2ab:3ac6:8d01 with SMTP id d9443c01a7336-2add1382e48mr18547135ad.29.1772004168768;
        Tue, 24 Feb 2026 23:22:48 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:48 -0800 (PST)
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
Subject: [PATCH 0/7] PCI: mediatek-gen3: add power control support
Date: Wed, 25 Feb 2026 15:22:17 +0800
Message-ID: <20260225072225.3345307-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232250_517783_EB38FE65 
X-CRM114-Status: GOOD (  15.56  )
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

This series adds power control support to the MediaTek PCIe gen3
controller driver. This allows proper modeling of WiFi and NVMe
adapters in the device tree and control over their power supplies.

Patch 1 through 4 are cleanups and minor improvements to the driver.

Patch 5 adds power control support using the new pwrctrl API to the
PCIe controller driver.

Patch 6 adds the WiFi and BT power supplies for the MT8195 Cherry design.
This is actually a M.2 E-key slot, but support for that is still WIP [1].
And even with it merged, support for the USB side still needs to be
figured out.

We can either merge this as is for now, and do another conversion later,
or just keep this one out. However this is still an improvement over
the current device tree, in which the power for the slot is always on
using a pinctrl setting.

Patch 7 adds the M.2 M-key NVMe slot found on MT8195 Dojo Chromebooks.
This change actually makes use of the M.2 pwrseq driver.


Please have a look.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com/

Chen-Yu Tsai (7):
  PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
    dev_err_probe()
  PCI: mediatek-gen3: Add error path for probe and resume driver
    callbacks
  PCI: mediatek-gen3: Split out device power helpers
  PCI: mediatek-gen3: Disable device if further setup fails
  PCI: mediatek-gen3: Integrate new pwrctrl API
  arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power
    supplies
  arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot

 .../dts/mediatek/mt8195-cherry-dojo-r1.dts    |  38 ++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  47 +++--
 drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
 3 files changed, 183 insertions(+), 87 deletions(-)

-- 
2.53.0.414.gf7e9f6c205-goog


