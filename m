Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0223CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Dilubts0+8D/Ytsohz9SJxbRH8BEfIuATOG8QPkhvs=; b=OXZM8YlS45Ubbc
	TaI/awxsQd9Ntj4TXXWlsuqYPrsd5DxIkWKtcdpTu8boZs20kb06TGONAgHIpxK9j6N7td/ZFApV9
	dGWsldGfFdC1qwaNGrFAfDwwB0PpD5xQNMzAUVR+8TeMMe0JxT7o9kOkFBUja+eNwfxXubarJRV1S
	MnCgRzxxGN5QNKrkngksu2QOjQHm622VKBF43yTLi8yheSWeXZiw0qkir9evGBuO0Do1ECj7fs/Zm
	avhm/d0w7NcVoYlXE+mcL5JA030aBfTFqdL2vTd2Zizw/MxdU11HTys2cvNYWFSLkRafXdU/nDVvx
	ldkX0uqWuge54UB0m14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PN7-00000003QrM-1hMW;
	Wed, 08 Oct 2025 08:18:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PN4-00000003QqH-2W1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6211622f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911481; x=1760516281; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dilubts0+8D/Ytsohz9SJxbRH8BEfIuATOG8QPkhvs=;
        b=aFPf+X8rBw4IO5jOrF3exonQ+sPPNpNfLEyXcb1t+dsZKMdrFT5reolGGSX/zBtAM9
         6qtNlIJuRuQlgENfYi6TmeYhyA/7aCxsMSv/bq8mbO7O0kJOtTHhrUJmzB9vg+zABqo+
         OvzjFYeeE2jAI0NaD4ZHrd43+LWbnrrk7+o9HdJFM4f37migrb2ICOf/6PsSDtXhpbpp
         l/hT2Bd8RTbkKAOrDx7ki00XJZOw0I8gYpDkqyix1YKbIB1VAqjZfCJ2lOk7w98sOcXP
         QBOsVC2+SIMKi+zpLVnX3qlvRd7LV04AaW7Mk/NqgNQOqAGj9t67iKkK/ikNMts8sG59
         D+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911481; x=1760516281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Dilubts0+8D/Ytsohz9SJxbRH8BEfIuATOG8QPkhvs=;
        b=DRjiNgN1PxVDXjXyglhKgqEvNC2zU3Np1E6rGF/NWVsE8U6yoICo0gIayOWern3lbN
         O0fKKHdihdMwo8SlaVjsbO4vuU5PcZ73WWUE4frM54u9xZeIXA3Io9gjJphF9jdVff/m
         v51k1I4grcK564jUObzHG2zJYXXlmRQjUvt+oM0fnetCO/V59IgXRA+0M7YH8+vAwTLt
         RGqyndOeIIbEIB14BkdG4l4GH26lrGPH7Gkio14lJcxDPDfBghjfoHC13bcDyewBo5uY
         xLXv7GxKxM0+bJsP1Frc0T2V1ssVLXG4Ss4EoaWloBmYCB3VkgSr0Ie+vYJkSesKGt5D
         4grw==
X-Forwarded-Encrypted: i=1; AJvYcCXpTejR9FOWGCNzwYHy7+DzJRKk/Ki/jfQcYvD+pTkz/YYCAkz1VvMsKrx9dp1DhnpjqJBxqcGpRa10+4DJ2+D/@lists.infradead.org
X-Gm-Message-State: AOJu0YxIICVhTpjJis5NJQ6owoXEGn7PJ/bQ6LxvGPxA3lPltzK5C0Xs
	8DQsSqVRibi/f8R/XkOxhzlHpoUMbUMpWPODIR/jjsl623+5UjvxR8NeylB0yOb8hS0=
X-Gm-Gg: ASbGncu0LykKXIX3OBa0R3znm6aKBL3z5fovQbmcdd8jjnHQ03nZIvWI+73ssJnv3S8
	SAR7HNmIqSwBqBX7y1uTWYKMhTsXgih6W2Gf0F6a7d6PcCwLbZyQEdo/gVYNvpiyVNEeVGZai9w
	qCZe/uZZYc5GRdajsKMUe9KMdwL04ZuwDN/hgCX7XviW3Zn7oGSWffzPUUtG4iDhYflf0p4OqFk
	Gz8ys7X5vRl/ymAeNjRb5XEd3JvAC61B0DbODTvxxbFmRDJiAMjkG+z0Hf4CVRQL2f+AlAcf7mH
	HbC+1eo8JBzK7ve+QyQfFz8E8WaehqLvCtXXQMOotmRjvIEdxZT2SZxweFjcxQCH2fbhz/l3f9g
	lyVFCcOI5zyq1tDc9eoAaE+hPV/SAJw+YVfsgHDkbHg==
X-Google-Smtp-Source: AGHT+IGhQSUo3nz7xkAlyreI/mgAZYjtQto76cT/dauU+rLa2OKXc2WMdpidzyyhuEH2ethEy6bDVQ==
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr1369061f8f.23.1759911480551;
        Wed, 08 Oct 2025 01:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:17:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Wed, 08 Oct 2025 10:17:47 +0200
Message-Id: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACse5mgC/22Nyw6CMBBFf4XM2jHtQHm48j8Mi6YOMIlQaA3RE
 P7diluX5yT33A0iB+EIl2yDwKtE8VMCOmXgBjv1jHJPDKTIqEoVuDg/YrQ1GTMjj9ZhXZSKcmO
 d0QRpNwfu5HU0b23iQeLTh/dxseqv/dUarf7UVo0Kc7JV4zrNZVlfHzLZ4M8+9NDu+/4B6Qosr
 LMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o1H2LyxkkznherZmnKLQ/juvUP/chr9BjwiieBwZMm0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h4xiSWuokjcBTSXUsVyVtoVJYWA0324dAAkZ
 B1fTJbJqvqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeMQAKCRARpy6gFHHX
 cjPHEACvcI7a2/XCh7u6N5LVTP8wJojN8VL+jKNWBkslBISDhZDi0kgAEoh2Twhdlz/GVTDPowR
 4M9MKgucm548odFpPLgC3hcpMqR02PNK9wNwyrcubqc698ax+M/hCN6IPC9LOb/C5HoqQF64qtW
 IM8oNh0U4bYoLZdg5IgjBLUsgHlHPrdumId3uxyhbugtj9H3MmlT/qSXCFymTTUnPfLNLskrA0I
 iTnnG6hxduosllTHTdOkDQqlZ/Kyw60EX5VdTZo+0DOQqGNpJBvfN/BbjJynvtjNuVA12FxRHZa
 wb7QKAs/LlyXPSbb5Wl9sFw9Rrvt/JjqY6FU799h1uL4OSM47W8nfVSCpmAay3hwLmrRN3gbUfa
 jVUBZ0adu0wEYB7m9jTWsSvwUROyOho0lV6t8v2B7u5LnQhM8Pl5fukppy2PAW3fs2Bn7+/11fA
 44WxlqvTyTJ/sNXZnq2Qm5gKJHQGmvCbOcC6V+jHABUNIhI/E9c2Izyy6YNxplCQjXblrS+rwS6
 JiLhAH5BGaecPKm+OA8SVgZhUVK8rQvdd+3lY//Dqo7jZxUxdDnEYcnLQWAbBKxaxlHzEcff916
 wlcDvY7J6PWuIKRcM5hZ95jajGlxKL8Fvj7JDJ1uJTGetr1kSHMAT9ZLfRyZndnI5NBYh+G0c5O
 an4J82FVVwdpGEQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011802_667162_D0FB659C 
X-CRM114-Status: GOOD (  12.84  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 345 +++++++++++++++++----
 5 files changed, 389 insertions(+), 65 deletions(-)
---
base-commit: fb6c63cf2231e895e4b0b4f3586cc0729f71f909
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


