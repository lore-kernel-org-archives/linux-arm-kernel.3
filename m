Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04367CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UFxKPtmjjPmsPSDnSGoXW+doirX8MuPaFEG2TG4+iXU=; b=bbRC8recj9zHZnMNHcRfsl3/bb
	r3F8g8XelRTEN9jpB2iP1HBebyXXiAfe9VS1aGexnT69EjYpgobUzAd4Yxbf7GMKI3SZBiUgiLqiD
	xUUYAGVGmJJ/fKGf6BqjdgyELIbk0ezGsDcK7sLMzTCk7m/9kokHf7DrFxHPHvWlE5JQR8+IIYYwB
	JN36kCza/VgzwpMoQdpjNlr5KDAq/r0UnM11EZUynessoUZmkaK8KeGPN5vndxeG7N1wrLBIuOApY
	gjSATOXWqkmUNKikqcI9MkFBXzE3LdK+hlIS7m+wKCbVy1JGOvhkwKPR5hxZKUzeADNtxH8xKY3AU
	JILYHJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHW-00000005YDi-0i9k;
	Thu, 09 Oct 2025 08:45:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHS-00000005YCo-3OrK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:45:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7930132f59aso1004823b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999546; x=1760604346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFxKPtmjjPmsPSDnSGoXW+doirX8MuPaFEG2TG4+iXU=;
        b=N5AdUMdk40J3BuA36HdIKLbBHgV9+f09JJvhAIVnJcvNa1vEN0je2vjyzMJY70qCwy
         Jd+j7Iff6pD7qUfZp5bLcTU/5xWqaKlUia+fKLW4sCs+OOMLDGlYHMvFERRgfZHU3nNl
         ZLtSrSrhXOdUufXN+Sf0MAgQIYRNjSPrApTNtHeFf3k2Hyr3ZcWUItAr5Hm8lwiE1CW9
         jYIs6H/Jk45Mkf6DsLse7+Mo+pHjGXeVuXFqx8h9g6NjlQmib+TOnXi5Pppi4xkKIy4C
         S+fH0wNi3m6iREx9QD9XkwexbAeZeKVRyd16qJrJXtFEpy3XDYuZFLrabTHuvIZe5ZsJ
         WfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999546; x=1760604346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFxKPtmjjPmsPSDnSGoXW+doirX8MuPaFEG2TG4+iXU=;
        b=eCu51scUx1rnF/0CFqaGxRDwM/uYh0qg/CjkpvghgBsTjwfQ4a3dPG6jvcRNVOA0ox
         c1opF8gtiADAr/Ro43NvA36hIsvdqRB1/1SE+UGaAbiXleSj9AUAZfdEger+DGzcBkX/
         0Kf8WE8faxWINEMvlRG4B7dnE+yS2JO9OKJGBKT6xBRhpBEVcCZyiuUCwBWx+HYzUstm
         jV/u5RaUL8JDBdkAFKqoU0zk+PqZXy1oyeXkNYS2mKbAJ/B6msUtNktLlazURTL0pLYT
         4mZUxVC/m5azWGplbxgFxFkzOW0p0AtYZtbr6grSHEwKQKjyx1mNEzrBNcCRo8ZAbeG1
         JhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmIHGEnCCr4toZXGq0hmcAIBUGl8XKZAK2rV2W6GzvGDuVfmJ8Rt16SuFNsRAx61R1V8byy1GlYBuJ5kicX6+9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8rL29uEoS9bexpsfzeu9UIzKs8wzGdBLtlho6wY3UtWAdbU9b
	JM5Nzg7O6uGeTLpcpOvAsGixBbsXH7WDSoOUwDPs0S0bStLdng2m7h1s
X-Gm-Gg: ASbGncsBwf7glLQ+F5ZkN1tV9SHhoMIDEaogXRe5ewx3eUpZY3F6ejEyi6OKSk68a47
	hVlt71Lth5Cy7n1QWbZVbhRVQKAQrJHQAkv3SJCSotAyusuci18T/W+4HMZ0Pd9GJ4riIO4klAT
	mgIDOkbxmjr5VUB4WrBphOmvfAW1FJBDs++PT/vDv+xyXhk3io9zusiirebX/uDXsvsxcJ6oLY6
	ksZY3kCem21eI7ouV1HMK3vvhagnAC1LNWPbjMO4tKZH7qvN+sObSr0ZzBUBmNbxSdc3V81o21q
	gvvDBM3QFXqk1JAikhkzeNwQ8Orwfq6dyR3vACyDBYd1NWoL3JIvz6lI+1wgX8w9fnS4Hjs40ye
	4Rb+osM4qZUh4EQ3Nwnjj0DqVPlQu5K9mqtD9+E7BOXmpXC9Gsxuz8LU0vtO95jcKBg==
X-Google-Smtp-Source: AGHT+IEVp0sgA10BvrRwBHxoUMhCzRyjJK1eNd6qK3tx+tcCEvpD74MNSsa4zglDlT5r0XodRH8KuQ==
X-Received: by 2002:a05:6a00:2443:b0:781:4f6:a409 with SMTP id d2e1a72fcca58-793858fb715mr7279720b3a.11.1759999545797;
        Thu, 09 Oct 2025 01:45:45 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e1bf7604sm2130924b3a.55.2025.10.09.01.45.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Oct 2025 01:45:45 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com,
	andrew@lunn.ch
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Thu,  9 Oct 2025 16:44:13 +0800
Message-ID: <20251009084416.45542-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_014546_851221_CEDBD669 
X-CRM114-Status: UNSURE (   9.73  )
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

LinkEase EasePi R1 [1] is a high-performance mini router.

Specification:
- Rockchip RK3568
- 2GB/4GB LPDDR4 RAM
- 16GB on-board eMMC
- 1x M.2 key for 2280 NVMe (PCIe 3.0)
- 1x USB 3.0 Type-A
- 1x USB 2.0 Type-C (for USB flashing)
- 2x 1000 Base-T (native, RTL8211F)
- 2x 2500 Base-T (PCIe, RTL8125B)
- 1x HDMI 2.0 Output
- 12v DC Jack
- 1x Power key connected to PMIC
- 2x LEDs (one static power supplied, one GPIO controlled)

[1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---

Changes in v2:
- Change deprecated "rockchip,system-power-controller" to "system-power-controller"
- Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@gmail.com/

Changes in v3:
- Fix typo ('status = "disable"' -> 'status = "disabled"') found by kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp@intel.com/
- Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm2473@gmail.com/

Changes in v4:
- Fix missing "Acked-by" message in patch 1/3 and 2/3
- Link to v3: https://lore.kernel.org/r/20250929065714.27741-1-jjm2473@gmail.com/

Changes in v5:
- Change gmac phy-mode to 'rgmii-id' and remove {tx|rx}_delay as suggested by Andrew Lunn <andrew@lunn.ch>
- Fix comments ('not mounted' -> 'not populated') for unpopulated devices as suggested by Andrew Lunn <andrew@lunn.ch>
- Link to v4: https://lore.kernel.org/r/20250930055017.67610-1-jjm2473@gmail.com/

---

Liangbin Lian (3):
  dt-bindings: vendor-prefixes: Document LinkEase
  dt-bindings: arm: rockchip: Add LinkEase EasePi R1
  arm64: dts: rockchip: add LinkEase EasePi R1

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 686 ++++++++++++++++++
 4 files changed, 694 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts


base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
-- 
2.51.0


