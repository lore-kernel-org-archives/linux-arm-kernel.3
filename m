Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F890C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2H2DIuEhnzrfQ1C6Brzjicc8cP53KTk+BzeLhmkkFD4=; b=0ysdgFwl5EMb+yKTszdrUF6F/L
	tssmSv1sipxud+W3T1eBPbxTTRvbYMbBhA4ZIAuGQDkQz/ms1iI6LLHkd7MpLv3aM0NAknoIUzlHI
	C5+GWLV+M5xZyUMNOwd6pDXCG7g9QQuJM0WP5eEMiTVMUuWCFt+A0RmKeSc/g77JkwsJSjzLXs/nU
	0MDDGE5Kq3oVxlVKuFqJq8fklVHoFu+KSmNDhjRY8BvjAzcn/88amCFrFpzoMRTI9mz59/xVxeJAF
	oR0HmgQmL0TpaEhS+8F0DzU9z3BvwkbBafzpSMEv9/hz5/Xgq0KOA7M1R6O1R2XG35dvX0S4xyqq5
	38rl6sGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7c-0000000AeMM-0QbM;
	Thu, 30 Jul 2026 13:48:28 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7Z-0000000AeLY-3T9m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:48:27 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso570983a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785419304; x=1786024104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2H2DIuEhnzrfQ1C6Brzjicc8cP53KTk+BzeLhmkkFD4=;
        b=rQXvN7H3nFXNj+bw+csN+5xVjzvgG8dBWJZ15HBnA3p2AhgGv9w2ehzS9nqLdloXv1
         3csOCOzWiEh1ZuDhVVfN6yMXl+OvdpHMyiU1W4L6qlSlsQ6daICHaF4Mr7vg0lajM3VQ
         RzctyEdCEu25j5c/7NydkgX/QIlULfpLRWjvXoVDlhoBsdDG0CP8CLbS7eE1sM7QNlA0
         hgzsevDNjMlLlX9TktPmah4mSDiZIrYaM/kOdAlAPiz4lqBGLHU49pDE2V8sBsYKyIN4
         JvK4aBcxq4b1T1mRnb2VYqWNepRfiMOiXe0bS125lrPVu4tVAsNnjw9N9KnsyjX2M7Og
         mG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419304; x=1786024104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H2DIuEhnzrfQ1C6Brzjicc8cP53KTk+BzeLhmkkFD4=;
        b=b5+mCfUxUFf6SmVYG8VRyt61FSK62+gONeBDWEAbvqq1r7SEmKjML2biR1VCL6PApg
         y4ihFLhlgigAYi0l9LzHaO9oYtWKJghn9bVYbBF5rnpjG6z4Gz7tkFXiFHnwWJomHdcG
         YyY08Vqg3p3VMIyM7W33HtgIhoAyvzphq2tGGDJTammO+aJ+9+oHGiWh1xSNAzfU3EFQ
         +XhhKLnf+8oYBKpj+Ksg20EFimfszDwRx4UvEDQS/2fsorMsO07sn9rpEutI7WUMVce7
         o4g3pylRDNL0nniilfrdcCAxLgvdg9pvlkqGjBglBbIVeOW76hnLBKAq77QbAC5x61a/
         /r/w==
X-Forwarded-Encrypted: i=1; AHgh+RqPSFVkhHEa0dmmy8shK8wRqiGwYSZpNwZ/06e6Yt3aHE+DF9ll57PSqzf4Y7owa4uP5UKqb1eHIyoO2dTt31hi@lists.infradead.org
X-Gm-Message-State: AOJu0YwATLsjv1cGA6gt4dzxbb/PWyiJvnip9dUQmarTgWU7AhMZ7z6p
	1CMGYVty0AtIwNidHjyUs5joqLy0jxY5MfhoN07ef7sYR+ARf+Ec5dk7
X-Gm-Gg: AR+sD13mNj2tBNmt+Knzc8fh48rYAzZovyajnrGIic07pd690FjmfZcSkwNQFWT9eNV
	DVoidAtG7ZVonyaKEby7Hs4gDUVEVJ4ywNveizJPTeHLNLN7ubnF09E8K/6gZew55RvaoraxMNk
	fgyV8nwOIrU7K2VsbDlLj1ZZWTahN1v1M1ijKepF1BZe2WMJYO/h4kVDLK4HLvAMu4N82gGdFhK
	HC3yh14XWy4GGZzoF2d7mcs2HQfGdlPyK+JGOQxZn8ieKsdJT6Rr2VjevsYGThnX9O2TsfLC5kW
	OyxPNsg7Ek9zhy9/FzSzojYwpSG6HUj2qqTmsug/vcVqaObagaXKB64bEEYEajsy6QroSlET38C
	ERt0eBLD6tNOkPImiu72wqPbCjv1oCBujDDoe4QRw/Si6c7nVDIGpfQtctlCqdoFey7DhBAZQ9n
	EadTXwHCLqX9Z61YBmZn1MdH+urDGKkZ//+3z+hOD3GMsTGQjlGPcG+e9SPYSONv7j0MEFdkNf7
	elCPyI=
X-Received: by 2002:a05:6a20:244b:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3c90d768ae9mr393785637.5.1785419304267;
        Thu, 30 Jul 2026 06:48:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b670dcsm20692047eec.7.2026.07.30.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:48:23 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] Add support for Vicharak Axon Lite board
Date: Thu, 30 Jul 2026 19:18:13 +0530
Message-ID: <20260730134815.434654-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_064825_888610_54C01824 
X-CRM114-Status: GOOD (  10.29  )
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

Add initial support for the Vicharak Axon Lite, an RK3576-based
single-board computer.

Patch 1 documents the "vicharak,axon-lite" compatible string in the
Rockchip arm bindings.

Patch 2 adds the board devicetree, enabling the RK806 PMIC with
CPU-big, CPU-little, GPU, NPU and logic regulators, Mali GPU, Gigabit
Ethernet (RTL8211F), eMMC, microSD, UFS storage, PCIe0 and PCIe1,
HYM8563 RTC, GPIO LEDs, and UART0 serial console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Tested by booting to a userspace shell over the serial console and
verifying eMMC, microSD, UFS storage, PCIe, and Ethernet link-up.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
  arm64: dts: rockchip: Add Vicharak Axon Lite board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3576-vicharak-axon-lite.dts    | 700 ++++++++++++++++++
 3 files changed, 706 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts

-- 
2.47.3


