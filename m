Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB971C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYRqu3lVUIKqJWn4tGQNNX03TQN1RZDYmju+H+bQTEI=; b=lYtPtxsl4Zu6OSRlyHb+eQWXO2
	Fgx/3w3j5kMm5SuYc9R1WTD3JAZIqgKY8eRO8IvBnM00GDlO6Vn3+S0wdCLZak25D+9gwLeZlzqFA
	ReJMdIwl/oCpaA1QzyQ3SX0nfuDIGj7FueegA1EyKPloKXxgQMRXh6/eHosReI1Z2hH/MB2nfMl6Q
	tWY4G3G9CbHNj7dOBQ848urqkTHcyBdlP1r164ldkg3nQWkGNcekSRGVDrYTfnDid62+/n4Ru9NeG
	O1PCv3ajhPmKF3oYgEpacPqhm2FaUgD1R6ELFn6XGbXFV+z1mQmJSjNGxKZ2oCW0j+Zmczqwzil+X
	Wbbs4umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCT-00000005N5J-3Eao;
	Thu, 02 Jul 2026 19:35:53 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCP-00000005N3k-0WsT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:35:51 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c888c2cff98so920102a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020947; x=1783625747; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYRqu3lVUIKqJWn4tGQNNX03TQN1RZDYmju+H+bQTEI=;
        b=f8iucxvO7DUjSexS4uWUWS+YdGTuojsi10AnlQOPbzcAfH1aie1ao5y+T2k5COOS6e
         YOicu2309Y6qUlAPWZnba16dAkNsDQgT0GfkcK90xOvRsit1arwowam0qA+1HAqV3bbp
         wIQlw+YFw+zGyNeIStAK8F3m3HVu7CqHq9P3jizMW2RXmtH2rSpxBr9zmJ9Mu3b6QQmS
         UUq3Ls7ytGu8q+sWqQ3k2P9Z3DPM9u6cbp/NW8bx79ngoadXfFgE1GXVfEd69hP5rjp1
         mTv4dxYPexBL/E+BJWEG8Rn1LBjq84X9A/zBEN2QFKH3zRBXq7l287+WM1pVHtprv3h5
         1kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020947; x=1783625747;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYRqu3lVUIKqJWn4tGQNNX03TQN1RZDYmju+H+bQTEI=;
        b=eqMrUp2FhC1mgJyJxkn5+P3Iw44TySzj1Gf6WFL36E/ZwB9vhE6KfvrjIegR8ZmAsb
         jspOvorkgdEAEn14NU5c0KALAnY8LJeM9DQ7IUI5nb0XbKTcVVaniaztt6LwSLmuVoq1
         /AzHWrHV4vVhvBBKTYArUf5TUHYXYiSGBorh8z66OzB/TZNe7un850H8KCpIUUHE3Uzt
         ZX5z6f8f3BxXCbTUs7VByWbT7IKw1ILIlDOQt+gEtNKTNsWcsIWCx4ik4fMl1dh69s58
         fuRj/3UeI0pBXMeXQQX6U0v4ytYxu1ehoj1+bU3s3Pcc45hNaMeahNdgADDyCssxo5b6
         9h/A==
X-Forwarded-Encrypted: i=1; AFNElJ/Fc7+0vgyTXEhRFfJLi2uiVNW1PJGu/jvHRSyiFBhex+XIphBrxYuKlDpe3fWDdovC3ObZUWPxKSoo3rGPccsi@lists.infradead.org
X-Gm-Message-State: AOJu0YzpshRJ58W8yby+NV3ReN5HFnpzwpQZQD+Ir+L/HVyYY1TWCgfI
	G42cR3p+KNyPFNR/kTaS+uRMDfPGRZfQYnq6Cjw5AAmWvPTPWOLdMJs8
X-Gm-Gg: AfdE7clB/oWmz6XXNMc5cd1HpUlUodpO29eIG7Dl5LYbLdAjPWYB3cRmew2CoYPRsff
	uIK6o4x1VPLUvqglpd2YxeoqLXS/3irG8TzjHJWyxgHBAHp+RTGvfKXuOPxeRDL/3SkswtBy6Jw
	L8/C+XlUuH/xWzsvpz6bBZxsTXC38wbaQP8S51RP3DVBKkeLElN1APz5IZQhdMu0ZTl4t50n+5z
	F1Fy1ORQday+7Yd+utiSaNfIuhgLAyhzYH7YtAbIA6/VrMIb2kOqmdy0VL2cmS3UfD7IMT1Lqgn
	ccI24cX+ZAl94dumb9gjtZ8SZqaatwHPnE5mZu63PpgqtRLkSAo2ZcRKk+VWjBB7Y5wLUEoe1nr
	dO8C2A4IwBEStxJ5SaCH5Mkbq2RS3Q5cdRESGI+WQ11R2DIxJnCsqvK8jPkkn/tIEC+WPnJRB6H
	1tKyUx74Q5ka8=
X-Received: by 2002:a05:6a00:139c:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-847c4fc29b2mr6697327b3a.6.1783020947157;
        Thu, 02 Jul 2026 12:35:47 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc188sm1844249b3a.4.2026.07.02.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:35:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v4 0/3] Add devicetree for the Graperain G3568 v2
Date: Fri,  3 Jul 2026 03:35:35 +0800
Message-ID: <20260702193538.2195973-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_123549_163281_728A64D3 
X-CRM114-Status: GOOD (  11.96  )
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

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Changes in v3:
- Picked up Acked-by tag for patch 1.
- Fixed text wrapping in the commit message of patch 2.
- Replace the legacy 'gpio' label with 'gpios'.
- Add the basic WiFi child node.
- Add the Bluetooth UART child node.

Changes in v4:
- Fix incorrect pinctrl bluetooth node name.
- Disable bluetooth sound since rk3568-codec-digital unavailable.
- Add WiFi fallback compatible string.
- Add WiFi host wake interrupt.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
  addressed globally later.
---
Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 943 ++++++++++++++++++
 4 files changed, 952 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3


