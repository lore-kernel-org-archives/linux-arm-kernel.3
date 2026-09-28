Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE8DCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U7p18ol6P0YPGqM1fpj3iPohmUFqHGT7j7iYHvqBoic=; b=IutyjWVXLoSMCN8Vq3TdZB3O/H
	uTwqDH7UC6BLZy1H/JWwLSiyU/WCq8mgtIVzORs2foXxYFA8TEuoqNzcI3ac0v1UCwAXAgHDOYYp0
	O+Jck23PfYD+WSbPUIj+yawOTX4EkZkmMNQL5aYvnI6a0lwhuXzqStF2t+2TZfeSe1DrcQlmSf+4Q
	oE4C9ME6s/DC4YMy2Y01Ycd1iOwNrISD5x8monI+y3m0OFvhL5jBEqgxtpvmk9UJmlJIW0ECJq/xW
	tsvs4eppMZu0j7tw85ewK4TSP+4guxkPApPzOs0UYFx5AuFmDuFQAvzKQC0AZB3B70WS3zHMXVn3r
	JQeFR2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFHk-00000001Be4-1Hr0;
	Mon, 28 Sep 2026 17:37:04 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFHh-00000001Bcb-0x7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:37:03 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1357990a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617020; x=1791221820; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7p18ol6P0YPGqM1fpj3iPohmUFqHGT7j7iYHvqBoic=;
        b=jsihOiLpbW8RoZkuA5aw2DP+lhCWEIDaKiilS/0wKTyx5dpz2UY1ZG7APTh5N1Gr5y
         RjVROHgUFy2XOXK2YJ3sFZDWre8D+G3Z1b4OHZha7BqIRypGJam889ohr/CfsjBrWQ4/
         VSbri5ewsenc/3PJJNb7I4AC+zsGjYDaxHvcPBzQ/cVhTjq03a6EAjfrHfaIdQM3A+J+
         KGuTiwZLAY6/+t3YKOrjIYDnjbLR8+VKYtTlojgw2Is5ourhXwP2dDQRvHMcM5/tuZR/
         UvKoK0hyX0czMakNu6XrobAbLecvJeqt5pK6qC1IWJlL58FSvRX67IrWaZU5sJeeHadQ
         E7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617020; x=1791221820;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U7p18ol6P0YPGqM1fpj3iPohmUFqHGT7j7iYHvqBoic=;
        b=D+sTBmGkxHM1vQSEtQdn0B11N1/CKLsWIkCEeUiIS0buNxKoyEnlgdmyjASrZ8pO29
         0Q3VknLVW/ItxM62dX5cCf3nC9Zewgj4Zf1jG1Qcq1vtV2nNMj2ZPSiVOnkGttFhTIRY
         i4SmM1EBfTNELp86daZihkZhukXZpcN/J7DYWYerrqyQ2kvKqQsqpaboW0zmJzxiGglp
         UN8Ix/kM5SphvQVgZDJ9EJSULsUiv9o3Jv/TMmOSEeepAOGz8dO4lFLpASIbxvLKlmsS
         /PAgygyhYjNM+6eWP4ZrHKqbGxbDGTuZzUbpjjXbRa0IdPblzifaMOZ1qxhejuuUVcm1
         95GA==
X-Forwarded-Encrypted: i=1; AKwUvByZg71WqD2ioswB6x7TLoTo6Hor/wq4dKZ5JV5OXsLbzD1NEkPi35cOFnX4HeafcARWe4lHAV/JrQkXi+WU4GJH@lists.infradead.org
X-Gm-Message-State: AFuF++m4qqfBof7urLysPXjEYOHYoJTtL+jtw3ZooSuaYLn05ScqcSXf
	vqC/BhmxF6i7ir0TZ5VJEdg0AmA5J3xjdsKBE2fJbdZ8JYFi8sPM1lrV+3BRmosHuQw=
X-Gm-Gg: AYBFou2k/rhBmq5gNX1Abe3yi97uUZZkAKl7xMFLL/0ERNpROlYd85UAVB7veDcSodG
	WWm4OPqcVL11CvYyM60WAWQlqF4QqSP4C+bbkaZAhI9VSu8gF6/aJ8qW6WDb6wsSxSxy80Ylg6u
	0U/OKWIyIsccjqFDNqya8F/wR0nbGrVbMmyUE3EQuZuzd0qAXG083nLBeSnorZU62cd2lQ+XKZm
	H5ruDxgbMYWY7HyrsVSiIh5C6EQFf5gkAcjVRBFVIxdjtOxdKUemWfDfWvZimwXXD32BmGz8Enn
	hY20U0Oe7CYhOGnUpmZvgJeCi8Kt3/PfA7Yn9yQqy4xzUB6gMb5cBsec65qoMhDKCHdeCtjKRqK
	ZL6aDMp1cLEGcwVI6st1PcMv80gDsGMUMyJ3iyqw/1AOPO7dvyAeAETZw96nEdFfgTqiGzjqtgD
	wphYamNigNGwFge5Hfk1z7N/ZI9FIBaGNMCrhyKpmwTN3mTnGjahWlrX1Pn+wZ9iUzQ/M=
X-Received: by 2002:a05:6300:6d87:10b0:3de:74ee:c04c with SMTP id adf61e73a8af0-3de74eec3bfmr966694637.60.1790617020321;
        Mon, 28 Sep 2026 10:37:00 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc7a4b03082sm2807652a12.11.2026.09.28.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:36:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.4
Date: Mon, 28 Sep 2026 10:36:59 -0700
Message-ID: <7ha4p1b7lw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103701_661975_FB86AE34 
X-CRM114-Status: GOOD (  13.30  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/dt-signed

for you to fetch changes up to c3037b5c7c38bdf78c214e7dbe513a553ce8f47b:

  ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage (2026-09-21 09:02:20 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.4
- am335x-bonegreen-eco: Enable 1GHz OPP
- clock fixes for camera sensors
- misc cleanups, DT fallbacks, schema updates

----------------------------------------------------------------
Bhargav Joshi (3):
      ARM: dts: ti: am57xx-idk-common: Remove unused ext-clk-src property
      ARM: dts: ti: am335x-shc: Remove unused ti,no-init property
      ARM: dts: omap: dra7: add da830 fallback to am3352 rtc compatible string

Eduard Bostina (3):
      dt-bindings: input: Convert TI Keypad Controller to DT schema
      ARM: dts: ti: omap: Disable keypad and enable it on the boards that use it
      ARM: dts: ti: omap: Fix Palmas RTC node names

Kory Maincent (TI.com) (1):
      ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage

Krzysztof Kozlowski (2):
      ARM: dts: ti: omap: Correct white-space style
      ARM: dts: ti: omap: Replace spaces indentation with tabs

Laurent Pinchart (3):
      ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node

Roger Quadros (1):
      ARM: dts: ti: Add device tree nodes for PRU-ICSS1 instance on AM571x

 Documentation/devicetree/bindings/input/omap-keypad.txt      | 28 ----------------------------
 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi         |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts           |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                     |  4 ----
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                     |  2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi                    | 11 +++++++++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts                     | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts            |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi      |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi             |  3 +--
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                       |  2 +-
 arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi      |  8 ++++----
 arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi                    |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts                       |  5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts                     |  3 ++-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts                     |  5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi                 |  8 ++++----
 arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts       |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts             |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts            |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                      |  1 +
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi |  6 +++---
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                      |  2 ++
 arch/arm/boot/dts/ti/omap/omap4.dtsi                         |  6 +++---
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                      |  1 +
 arch/arm/boot/dts/ti/omap/omap5.dtsi                         |  2 +-
 28 files changed, 183 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/omap-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml

