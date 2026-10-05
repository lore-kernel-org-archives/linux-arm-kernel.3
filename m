Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEB6CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qKGy4C88fJ5sur3Q5XgFQ7glpkb5tmclhAnLtMHskg8=; b=w7ZCumru1pD1NFsT1c8okfwVLM
	2aCK4/Q9fCdVmk7Y6CiVjt3S5xDmBdXWprTXwWJJnqZOSoc7BC3c0ygITaxe2SCNyWEABcnn/D8tu
	9c6THPHOES0u0khUZc0O+t9VwWicMrzx/KpaOG4gRZuwe0OAj+D3jwjModviKJKw2maCiEvq/kgZT
	wrBEgQn3dmAvcGuJIk5Y65LmkACcaknke6KbM9l5ycojQq1XTgGzoCWWMrnasT9Ln3KwicXL22bON
	2q8Z/R1QNhHR+2BZlBm4GitA2QrR3zpiqxcbcZy2wI5WB+nAawFFtA0A1BVNtGo0ERbszAFGZ3hqp
	ZhiUol2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvR-0000000HEi7-0iec;
	Mon, 05 Oct 2026 22:12:49 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvN-0000000HEh3-36Yd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:12:46 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2e31e9f035fso8624285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238365; x=1791843165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKGy4C88fJ5sur3Q5XgFQ7glpkb5tmclhAnLtMHskg8=;
        b=OEAH0dhk8s2k1eSY+ioI1kqEM4hgFqTpW1YXyjv6iIPLEco0r2OqevYs5S7AJ91LMx
         y9u2tyi3Upz567ED0sbtz3OImBZxn2KZHnZLlC5uXOfX8d2r0f9uBGRbmfO1H0M3BYBB
         tWjx+03qHFV077aQkVhLUDhADQEh5GijA1NvzAUaKs2t+JTk1mmZpenjzvS/DHyz0M+W
         9LH2vncb1rSOd5+3THMs4K7NaWBMu1e6VO0HqQslPdDl+LcTOHyGGZ/dnBpS7v5cEzUX
         De/j4fiQwh57gBTsOY6XKl6zxZr61fcVjSOvRg13iaQp4ko/2fj3PRtAJkTlEc+cm13o
         PcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238365; x=1791843165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKGy4C88fJ5sur3Q5XgFQ7glpkb5tmclhAnLtMHskg8=;
        b=wfc2Yg+3qMr+ZB/dAJPfdHRw4pwlt9mh2bsaQFCpKm786ry2hEbcVP7TBnk3LW31bu
         R0k2XNhAfldD2vEjW96P1lRofHLYlIFOo+Rs/fQdBFB4mtAtulo5STeh7O64FTpzR6Bi
         XJOqT5WZlxxOId9+0PSf7rzh2ecPKR2TW3ne+nbQw6bzWn59KqU386D4dBu1Oe8hFglF
         BVJ0FPEk5N69Fc65tIFoqpJtjjuYbOazqDMP5imsG3Omgm6XpGDB3w9LLuJ+RG4kL/8x
         1a13E+Ou6f5+sK4o6OLnxnHVIquXa0aKAKGWDo9XD5CuxI5OQb5T+NRxCzowBEpjiowl
         pP9g==
X-Forwarded-Encrypted: i=1; AKwUvBx1514SvCrwp7VAvkeLQbe/1e1S6q4lMbTotibi3UVn+VIqYKnOclKny4KLrMsj2373S+L9+IrNu2Q+D9JHJHJa@lists.infradead.org
X-Gm-Message-State: AFq9FYIy2ChHqFudYtMERrm6Ekj+IqIvgrU87Uc6Oyli8ihxPKTRrYpi
	8qMqHDzjDPuWs/Mb6j/6sCPCmF8LLD5rWHWdOZDAgIQ96vG4oirv9PDo
X-Gm-Gg: AYBFou00tycOJl2zIwnNaP+yejmIAvckMICP/6qEqOiX+37tQSSWSznJkD06YLoIIwt
	sT4yhU9GbX2GGIJMNHpDfv4LWqWcPBmCD789ejkGdJdfYgarJJkcVBLKR64SMzHd+t2NdUPl8co
	RnuttyfNEITOjEAo9spZ8ZFmWKMigSspXyGKONm/GMV+6l7Kgh3QhNpB0tctU75oPIM28LpfYHF
	D+LzdYs0l0irLpOnxDb9ZJGa+ARUrpAhQhqj5xiJUPzO1MEGFydMxej1EFTKRH5iXNlbLqbruYQ
	BVjVfDRw8zYQPlZJEaUXsk+dyMwcUoX8ki9pdNudRX20TA8WMGpaiySlr6HwGPwayuU/KyBKyRw
	CtWjuaLlmzwF3pmZfCTnbggtZ6kOpz6aZVkumAvFBmPi8iV5tY1yPeZ9eOV8aayv9JLyKfafxW8
	fkfSSWbNnwOD5z8FkIdcSQa1XrnniMvoGwAp71aTW5uNicc5innbR/TjeJ3QWyy8kD4lYM
X-Received: by 2002:a17:90a:6c90:b0:3a6:d94d:e147 with SMTP id 98e67ed59e1d1-3a6d94de194mr3494292a91.15.1791238364547;
        Mon, 05 Oct 2026 15:12:44 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:12:43 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:12:27 +0800
Message-ID: <20261005221229.1095843-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_151245_815834_4F06E441 
X-CRM114-Status: GOOD (  10.87  )
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

This is the PHY part split out from the v10 RK3568 SGMII series. No code
changes, only re-sent separately to linux-phy as suggested by Vinod and
Jakub.

On RK3568, the SGMII interface can be routed to either GMAC0 or GMAC1 via
the GRF register pipe_sgmii_mac_sel. Patch 1 documents the
"rockchip,sgmii-mac-sel" DT property, patch 2 adds the driver support.

From the RK3568 TRM (Part1, Page 229), PIPE_GRF_XPCS_CON0 bit 1
(pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0, the
driver routes SGMII to GMAC0; if set to 1 (or omitted), it remains at
GMAC1. This is necessary for boards such as the Ariaboard Photonicat,
which uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard build
dependency; the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c  |  8 ++++++++
 2 files changed, 21 insertions(+)

-- 
2.47.3


