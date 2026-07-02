Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD2EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TFYk67kGMBIa4rE++VISe9W7bx9jplGS28C7isZgneA=; b=fg9R8VvDJydlhu5npkjw9U9rcu
	KCmT2GMX0dXv0QPvs4BP0CmE69XQ/PZYh+PIQQhmujKcuGtrRti321aWAdAR72h3tjwl1x2Eei+K8
	J84Wwhx01Sz7RxOaTCSKZFXZoMzIq7Ihe1hjulWQ4ukr8itIExOlyTG4t+t6XPE+cZUif8mrXmLOe
	D5Dkdlnjrau1DXxslAeHYKx4CBho/hCGmSzahtsh6hCDzQtdhBOOpBs0alo7nJ0i8MTmZqshl81E6
	nzjcEfwCHsF38UmM361L/RS3novNpiIDGDNqPQKYag6eAr0s3/UKH79RO6pdNBhC+yACUz2d8gXBF
	Hwy08A+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJ5-00000005TCX-1gW6;
	Thu, 02 Jul 2026 20:46:47 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJ1-00000005TB3-3ffI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:46:45 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2c9dbd2e24cso13229795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025203; x=1783630003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFYk67kGMBIa4rE++VISe9W7bx9jplGS28C7isZgneA=;
        b=MP/Sa5XY0y5a9HckpAOKuWVwCJEQMXohPSyaQOUXGDWk0YmAHO1wywRiTQx44BKHBd
         wsBWk75Wg7ae//52Wx0LEfIosmPBH2EUo1l8A2iBeOJzJCLBhnoqMw9sXc5RQsBKC8ki
         f456UNHEKumJlq902l/0RZ4Exou/b2GlAPgD45JnNFotbm+AZnUVhmPlSyvUV7/e6LyG
         DJZnJL0tV/suGhe7zPQX5qTRYHCsmWvBXrAZE6W0UyQzX1kY2Q9r8SpxNxWp2LTUsvFB
         9xAX/UrX8uH7sWb5/iiL77JF7SQZ+gaRaH9S1lVPsJ48xacuRafGMSO1QYz4nt5XI0Fy
         5jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025203; x=1783630003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFYk67kGMBIa4rE++VISe9W7bx9jplGS28C7isZgneA=;
        b=aNiUaCef4qEr5EzN2QeeqCE9IFzPaDm8cqc8MQSgUWzIGkURjOXpkQfUlAFxLWINSb
         2hIwRnlyJGTw3pvJA8t+M3TKZOz3aVlFSy2BjC1PSWNJGGd4B3uBZPYQ8ZrOW6MHHw8B
         QZVZghnCPa12S++UtHVufBI38Pn0BLngK3FAmltt4dm97rhyisa9xEKuQPzkD65uLvCg
         6Ficj9vmzNQIeBTCTK6g/q2wpFe6eFmJaplS6rOEzzI82uI+UTYouX7XxFeBMyg1IjYd
         WVXwdJaJEXg/L/g2MMScKUeIiEFvNxIFhlTR6b9OItT6Qr3HywuovVtzpSeWaWpVPB18
         5HpA==
X-Forwarded-Encrypted: i=1; AHgh+RpRUZWpihoDAYFJBnbJ4a1JkAgyeLdNX9eQFXzvbXl3SxQW14ykSgSDyrTKVm3o4iWZMmJsv8ElAer9jeYYwfbG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyogo/Z5MYgQhWDV5nE7GQvM8RxTXKG+2oYra8WinuM2k8PgitZ
	MNfTgVpQgT1f3eJ2drh4hYkvnriZZHAyB9KboT2RBBOqsmwvZZLeF+VH
X-Gm-Gg: AfdE7cn6pB22hvRAyp8cfO2FJjRVrtPDDdJhD9Iua2j79njE4SPRLmwL/HiTckLKGIN
	D1rmOePpuAgyiqTBlOEH+SD+2Ou4bBEzRsjnR6J0UP7NUm/mY8mCVoUSHENiZRLiQEJgqNYHuX7
	VLFYpXWDaqJRkQe0V2+3jsF8bRc/TWieQjmA6OgQUSMUhZLA+mp4/VLseamKn2rSwComUb5o47e
	oRd1v66zYAO0WqhYc5A2HTr508ODoDHhdS+c6jxiFDD4GpYQ+EQxUopxyRYWs5gvD+Mrjeqri22
	L01QTiYAj88Fc6UUoMV1zG0f/g3qutOpJfp3dqUciP/Wj4Jop+C4/YTCssO07rYT1gIyRyXLMvu
	iWVdiy5VOFP6sR8eEQJf+bVBEK3pNiXE5HfjgoT9pe0n1GjPlAU/dxk9xnKWSDxwfvpjSa4zYhC
	JTimIYYweT7yg=
X-Received: by 2002:a17:902:ce02:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2ca7e7645d1mr85023165ad.23.1783025202765;
        Thu, 02 Jul 2026 13:46:42 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:42 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add devicetree for the Graperain G3568 v2
Date: Fri,  3 Jul 2026 04:46:26 +0800
Message-ID: <20260702204628.2407308-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_134643_946237_DDD08D50 
X-CRM114-Status: GOOD (  11.86  )
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

Changes in v5:
- Fix incorrect WiFi interrupts.

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


