Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A623C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJkLdfWqS4G1xdqUVtL2U3xbkMZdjpzIyL7R/rtgSKY=; b=dc1fDuXhS2Be3sodxG2ixkWEdA
	IN+zD/Xtvp5QLa8hrle+rnGCiaZ7uuvj5VmKK0BdxDT+Mt3n03YicGzHB5B63whRvdf/EQU/mWmLm
	EYDCjGPQq2vm4PWwo9EwZif9rp6tFJGnBeLJGarOua6efWiOpCzmrOTPF0ZQfJoFmRQFOPakAt1gk
	BnK6TiOypijgdms+C3zgHnOBnci1H4GA6OQlxjD38+3mN8BV3Q69GREluXL18uWMqI5W6eaKXrhxh
	HVRkPn/aelopEgoN3HOPjM20/WohAGb2u4z/gfTUnAFN4z0nDFSFSiSqLGGvTzB5FjWz+qXPnqp5A
	0ZcVk3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6lv-0000000FJRn-0FQ1;
	Sun, 23 Aug 2026 11:53:55 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6ls-0000000FJPp-0WpJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:53 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so20667085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486030; x=1788090830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJkLdfWqS4G1xdqUVtL2U3xbkMZdjpzIyL7R/rtgSKY=;
        b=oo/iJKdxyIQhh64SZaAJRBKfG648Tz3WzTslBFvqtxEUn49FiLi+ohUn8gK0R1vaGw
         krmZPyoPahZUwodmdcsZ/0q2XpktavCP+3QrlykKTr25gZMY/ltoO4b/pagsB5hcMKhh
         o22jkYHvRe8qPTVrSgAK4eFWVjhtDML+aRvbfpwby+OE36S24m07P8yFVqgZSFPDSw4m
         ZHYTqP/Gcqm6HTNJDmGEUgd6TkzDPnYVyFl4u72/VYEAHjj62a+XooTkxe0mwqC8mt25
         YPzovh4n62F97cyhjHGtVQ3XFjhAcUONjPLixVL7soGKEZlJ4irjMJgNTYKW9K9/lp7+
         HOBw==
X-Gm-Message-State: AFuF++mEnnlYMvSRQoD5DailFpgoSpVqVZfvuo9aipSHuMjXef0Vykov
	pYoHq2m23cHYzvCJipR+0tCZoOVlldvXkIC4agFfLw2JJxQj8jFv5J3T0iMOJA==
X-Gm-Gg: AR+sD10xdrr3vdGsY9pm6SAe+Tv92/K8wPm+qlFcCB6mGYsmOy+HwF7n4fcogdrraZP
	864RZpzqLFqATcYvNHJ6PS0VHpYjABwuxsUMakPhnsVOd4bKOhUcBST21YDYwdeQYMVH4W2ieMl
	QfP7lfuRVxfhMqBBtbGTonDB58JvPZrJACyH+Cbk9RN4/YGXRTDFCdh+9erP3/Oai+w4117zgCS
	vTj+P2zU3NiOX3g8OWwKxoBEg3gBVGwLUCVTLg5t6C7OHyqRoKUNETJitnp25p59tM9Ke/iThgf
	arE3eQuIMol0xWjgxr5e1t61s2Cqy7rpQqcgLjIdnYtxYokEQips2OrC8uIkFwmNgM73S4Cusfz
	6zNlt8fdHl1tcEetVwrTuAEQBOsL1Vf65KKGFwEdDLdaES+UhpAxlYHQsCkgAaxVkjfq0cTaAUn
	hlM3YIeHWNLTj93P7PtRnBTOUMr5CPugV/rvWhWXqx2giaCl2nOW0SZccP03rvVsvQNWs/8lfaH
	HQVqST8QxLIsJRIlUbH/MrlP65NQtNxnKMPNw==
X-Received: by 2002:a05:600c:c08f:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-499be9e4a32mr134720045e9.13.1787486030111;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:49 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Sun, 23 Aug 2026 12:53:33 +0100
Message-ID: <20260823115335.102219-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045352_168632_6DED0A17 
X-CRM114-Status: GOOD (  13.33  )
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

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Changes in v2:
- Update UART clocks directly in the board DTS files instead of moving them
   to amlogic-t7.dtsi, as &xtal is defined at the board level.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.55.0


