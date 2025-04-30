Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF29FC3ABB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=; b=1w710hYFinT4UnRFTvxy7jkLon
	YsqrN5UEAW7MqRYu7fBO3XvI+dwg4d9JdpmyyMFfttvEXJpMusiJtBEmWqf+BTf2RccFZJQFU9KAZ
	6T6AR8RBXLK6SsV4Lcccui/KmgqgNrpigCpg7RDTgP1BsKXtVbFvz7m7AnuQBrGHHYCYVGmtGq7b/
	NGlloB1ANQZlokRAzlBOEkULjof6um1e1+fGfCicYpgxQ88O/C7yTSG71zue9n8Vxlpl173S8X70G
	939w+nrVdcg5e9KIQ+NsyDEPZafKpn+wy2g/2Wa2sguTKzg5wY7YTzIBgMNxO+tb+fXu0KjSTJXe9
	25J48+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5eo-0000000Cgwn-06lJ;
	Wed, 30 Apr 2025 11:31:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kh-0000000CXnM-2cZz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so822266566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009198; x=1746613998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=XewtvbdG0bemMB6pUz9PMxujR/ARZ9lrU+NDBZpexH8hTRAF103uG0efm4EMKyK9/M
         QRwWve78Dh0JF5syJD6wrXwQ7S+k8eia1acrJ35mPyoxwGHfj9QRzivszgcSp6zi+HNO
         lR2gXtajOpcM128Q0aeytEGPth4sQV6O32yp8sUFAUslxuX1Vouj5biBF6m2v6XQwiqc
         F2G2OaGiVdsn/EDMvT2yvBQRvOFngySZwCS1fXelQ4AaT0Pe9nC+MKpaOsBl8V+T8zgs
         JTrmYBIe99wQgmlQl6BfxvKwyrY2+aJTcVrD8fEjsQUjI3DDSVyhoJGZ7w5+Jmknp+uM
         NbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009198; x=1746613998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=K7u8br3XwDiBX/bInbyOOQ6lS3cLl4xy5Tka+675yS0zYYwS3ZTaYH8zjsOpJBIYlk
         JnQ5rjQVHRU808tl10SpvF2zOCGtRRqyPKKHzylWPEWRxb1pQ/d0XzbsQNBwsNy9WOcX
         yIDN7HFt04WanaZ/yWMu823rMAMjTfTHqP2oUlgte9u+TWmaovWj114wAxT44NAw1yQV
         AnJNb7PbIkLrsF62He1kh1O3Jo6AZCbqWjQo+apqH/uDc+QFToxWQg2sSeq82L0YHV4S
         jeGbeYGCSlRAgGfNtT2BzN370GwpCX1Aarv4XByFx4CEhdg6PRUHUdYXOpM3sPjJ2yQZ
         pjkg==
X-Forwarded-Encrypted: i=1; AJvYcCXPAP7ZFcWPIjq7Ydag1nSBciv4b3B/Zj1ezY6xWyugC3LbOmYgfMZhZs9yjzfH76QIvB1ZB8o6LmtrqbydejWX@lists.infradead.org
X-Gm-Message-State: AOJu0YyIlfyBRcMHWX0MiANDYsG3FHQff8PIvcTrTjUvRMhDB3MxhHW1
	VUjuR/J25hCBCaUtqLhg/ggj84eWWjExVX8xuES0DhDrEIe3dc5vICutz0sRk5g=
X-Gm-Gg: ASbGncsQByeljERF24OPDWEx9q2XedytTKl5ItvgHvt2pWm6hzQv9X8kBxsBfVXYrUb
	oUe5pPS1mSD0xyadfnZQ2Fv45uYr/LXJvQyZzbIgyp9WkklRxUwqM3VvH5rSAqztnfmt68sbU1r
	HZQy2rDGHHQDCSbulJhIlPV6gkveHVG1rFgdpODjICts5AfIHa1hO46bXeuKcHaN51ae5b6S8VB
	Q5kZhsIlTGNK2b+Y4LVLN919cKpgLGlxiH9mAIJNUpvGXAwadKt0E6o45tBZo04R3BUnx6yIgWh
	iiszWEVYLkfDDEM8YZEQuNFBnUvYzQBK3neQwgl+bDteE2/Nb9rNPzJBdpUwNIwyrJAtneI=
X-Google-Smtp-Source: AGHT+IHBcCruFD2Sx7wtL0cb9Uodi9fNatKRjptTZekaQF3eLuwGTgjpuo5/jbKcvNzZcB+Y1bBY1g==
X-Received: by 2002:a17:907:3ea2:b0:ace:da39:7170 with SMTP id a640c23a62f3a-acedc768b2fmr307149666b.55.1746009197623;
        Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:36 +0300
Message-ID: <20250430103236.3511989-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033319_670769_6FA1FF07 
X-CRM114-Status: UNSURE (   8.67  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..b36a96777018 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


