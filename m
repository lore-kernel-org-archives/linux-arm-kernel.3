Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8061CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dK4q1wXB1iEpfa6MKc1INHDEgEytVZ0qx4adNK2kjGo=; b=DysyHh0YxtnZ3iLyHU2aqclyvY
	7ngGaX5SLCU9qBXAajlKeaU9TuJW7pjU5QoFGDymQIk/ovnU4glijDo7PXrSa3hqgTdY4BJBWxxfp
	xc1K8DQFmeKt2xCYpcmAcnfCIFPLHUAxmuv61nf2komWTvfnlWo2Dd7FNlJLgfljTs+IyUzGr6wGg
	3esl+F/+9Y+urS/pF4WQ/a7tPUGpP8J0WmxdHR1Awf9R/Jzkmomssw6/KlYg7GS3PNXSy4K4eDpEb
	LwI9Kju0hV5t2KuCe2g3XYp5/vQrrv+wBVUKvgTxDs3A68b7KFUdOQx8g3RTcgAQIz24OhgPJXqA3
	JMpDWzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6a-00000007rjP-2WHu;
	Wed, 24 Jun 2026 13:57:28 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6X-00000007ric-3472
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:27 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-59ccf81e74bso390767e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309444; x=1782914244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dK4q1wXB1iEpfa6MKc1INHDEgEytVZ0qx4adNK2kjGo=;
        b=O42ZLVrVwL0zpXMp8stnp+5Wft4OZAnKUkPP1WO3aSixX6djOmbSOJRiXPzdlbyhUg
         LWOtD/5Lxo2tkFoZpcNOA7C7zdPRyzAQLkSp3BKEN8pgVXSJt2+pfIAiX0FwVYwbWCfS
         Ifj6C730MFdtzNBPAEmrfgJxEEg/ZdrYKWPWbXlSAnLBYW9r9V7q8MJRypJBvKjjDWWe
         HiVwoqBW4fj/XQGYO1Q9wk/SHa5HmXQJUZBnDjgZvCbjV8HdsdF/uba3AcuHGKMoADen
         MpXAqWnW5XbxRQhGva0IS+xpql2R4LOzwUb0GT2ZLODXhhlPnbDanQRTw17ZxGKFpUmh
         s8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309444; x=1782914244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK4q1wXB1iEpfa6MKc1INHDEgEytVZ0qx4adNK2kjGo=;
        b=LEVRXtysHn2bW/APtm3zHUTyf6jMT43V3YpEGLjldd01sfp1XkVjoQw2gAz0wz4cY/
         PthV8aevyvK92i//GuodlzYTqO0lbaD00OwyxdSCWa+8N35FrARW+oAj7uueK/QeIdVY
         EGIGkQCFGzduq4uUf3Zk9eaj8cItZ3CWN3OM5lOVqU6V68BqQ2zvmYN9bwyChUMbzlN4
         3z8s3OpcixFGmdpCW5i7HuKxZzmBFQE5dK0Evy6Pw20IbSuGxeVYKs0jxzYXze375wy3
         opptlDVWJGKq5294IeIH/HFjuSvLH5x4jn9VRU9PNbN2WivPNfNBwUhE5o9r141COImV
         FMQg==
X-Forwarded-Encrypted: i=1; AHgh+RrbLRUrPE8tbVFqb2vn55TrfU4azIjYw/ewHU+Nb7W8PbuzKtD2yihMYVRAZl7FlmGPRl4fZBApZWxRlBGMaDkM@lists.infradead.org
X-Gm-Message-State: AOJu0YzyFvTSrvB6Tt0TOI8LYIyKjrOh3Qa88y8TkOkSFkbyBea0nMg9
	WoW4kMqgLGNwgh3zgnD9/kGNMKtVR0cvcgu5mbaMBu/r+F0K74CmsXSa
X-Gm-Gg: AfdE7cmGAkKs9wAA6x8V98lYxMcFaKU54SZERRIf1NAjG5LVeecgKFVs7jcbm3cgt7A
	6ArvST+h2wisIXFo/cGQ/J5+wTLW6WyNeRhthE208CIZ9QfnCmqTVkxnadBcF3GFxIOg5ujGW6F
	tMSfZXqzTL64O5pLWl3RfbQVqCYdQ+rt91FJKAKanTWevhLcW6BAQe+PmkpdpQCFoB5KAYHZqYj
	Jm0AsJi1EqPiW2xSa4Uf7CDCVmApSf5BYKHKinCiYiOu63E7BRQoaffK9q8U41QVni2DadJNDLM
	/srTLIsoAAW+jhNqJDe7oPt4mbRp8VP+T2oWLuOZSGv3dHKXf1vnr5ybC8/JwLaE2QFQuKWy0oG
	wK+rFjz7kVyBdKK4RJ7pOcaulAdWKG1I6nXeapMqh/syXEitvwJdpq/mhw7JmDlfoWTaclPH6h8
	xKO2q63x5ntOUN1MhYjWyRatvHGmuvhp4KG38=
X-Received: by 2002:a05:6102:548d:b0:604:f849:462e with SMTP id ada2fe7eead31-72fd815dd92mr4226649137.25.1782309439628;
        Wed, 24 Jun 2026 06:57:19 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 24 Jun 2026 21:56:40 +0800
Message-ID: <20260624135650.727077-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065725_791991_1FF5D1D6 
X-CRM114-Status: UNSURE (   9.66  )
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

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.
- Enable mipi_pcie_analog_dphy for PCIe on S400 board.

Changes in v4:
- Add patch to enable mipi_pcie_analog_dphy for PCIe on S400 board.
- Link to v3:
  https://lore.kernel.org/all/20260617082239.645562-1-jerrysteve1101@gmail.com/

Changes in v3:
- squash "disable pcie_phy node by default" and "enable pcie_phy in 
  meson-axg-s400" patches
- Link to v2:
  https://lore.kernel.org/all/20260617071604.635627-1-jerrysteve1101@gmail.com/

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (4):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for
    PCIe

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.54.0


