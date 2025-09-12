Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03999CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s5X7H8g9TghKOTLREJ2OSJx6IAiEOQjoYaS013q9w+o=; b=UhBt3NxD3Yl6R5dEyggk21JIvP
	5IC6Q7Z0C6JrbHguJb03d/MPquLnBEuSjV/fjAaqG+u1I1T/sSrasZmX6saOoBx9oT9qvomwLWqrn
	PP6tQhk0Oel+tkrL+OKwxhQLQsvitkyI02hNTtwu5rQN+6D1R9FXxhPYBnChWDZQK6iICl5vtgkKH
	jDwU+dNOgEDFNHlHBuo56LOn0A1L7djNjQj45nQXgAG2xp9gZ6/fzbInDIeVf5m5nuOe9odCFj/X0
	HujojjksuqNVL9RZw2znUP/ogrjo3Np2+XejhCXbKcruy908SVoI41E7KUt15ERuwYDn9d05QWlvY
	KGiK28hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1p1-00000008qB6-2Kor;
	Fri, 12 Sep 2025 11:20:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1oy-00000008q9h-0shX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:20:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b04ba3de760so237044666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757676002; x=1758280802; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5X7H8g9TghKOTLREJ2OSJx6IAiEOQjoYaS013q9w+o=;
        b=0zVlCoyBF3x88uQ1hULgviFjbhmVyFKM3RKFmaiipAvrWm0vemwnBwfiSwrny5Iw6s
         4MEQVPlDfBi/a8QeqYVpgoRrnAp/xFMpX8nKvUcszH3e3QZxQQSbCCihF3C7pQWM0yTV
         geKvPMUQXlhFVEPXlAakdfUV/jesrbJJetUZj5eRm1IoQNngRVdKwZWFRE4pUXbA3VtL
         fAkEm0Qw8zHOywzHQnxssIqriCgDYiGW0LklMagx1dJzxxw6Dxie2XvPWSmSj7GWcP5P
         BeOXBqxRpGSvzyl6c+0s7hqkHqydeW4ET5qmbl44JmLbxFnwwAeofUSXBEOzT7iO6XG7
         PYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676002; x=1758280802;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5X7H8g9TghKOTLREJ2OSJx6IAiEOQjoYaS013q9w+o=;
        b=eYiR42dxy2QjEzbM433HpDSmwLXY6YrnusQu0bydm8I8+nRVKRjl+6mf8936pXtHnl
         Q1qLQO64qwJLvNfTxy2N2G5qsgDsE4rSZU8ypljbwFG4F8cTSIRvY7IHD5bNVHNY2CsT
         t4DC45QxWSEam9iz4sQTkZzmxbvXCNpjpZQffsRGTsNwCqFTxCnceOOGzQC+m/Fmr4MN
         xM6gVBgsvwOv6mGV4M8/4rgflWhxqxM14rO3eeqeZ3dU81Euz7p0pUyCa+i+KDUK3WMO
         tdUdw/wB89d/pF3mTuN4Cv4auF0abve/W7U1pvHmHdgNSp37E2TgyUxCS5d5YfRF5Sr0
         JzlQ==
X-Gm-Message-State: AOJu0Yx1dkW41rON23wj/gO9s7ViBiPg8unGPVpM8s5cSMrhrhxtMVYl
	xkfj3SuvqkMF7OuK8bPB753wy071Ga0yFe7QX5x/Vza6qHDk7WP+qo8oJ2GFjl7vmU2wjmGwhR1
	m32nk0+lp
X-Gm-Gg: ASbGncuyMCCC45hteOzxPgjeuTp92GGla3fCgyHndQa8ep7dqW36Ho/qeqjcEBtUUe+
	4Pt5/C5L8JGS0rP9A3abYznc2LHs5OsCbspMSZguuw8Z55L6Tr++vi47MRoUR0J6uQn/nx2NUpi
	OcFYeLGFnPjagAT/aNpOebCTVvOfM2rvhSoQxrE3Ot7buakl9jcH2y3xXtxQO2w7GvYyrXFLISu
	mbGBu/O8Npe342EYT8UEkfFHKaRnlND8SSS8Cy9CgJINpOdMicMM07zSfm3DzbzbVRugdFT82MN
	36bTMWeqlpHpq/LF8JaoI5Wku6DIt2Q4s1cQXE2GT/m+0Rl/C+fcUxK1ChO9iM3NYXBQnkAjroA
	26UUB84niBCgjREaHB150lvzoBxxFOhAn0JX57VVYqK1sAif5nZQ=
X-Google-Smtp-Source: AGHT+IGvugGRAn2HRo+5LhqaFkHFSWWapkjEnS7PFZhMxUpdAiZSErcN9VQ0FwoL0JVtOgsS/yt7fA==
X-Received: by 2002:a17:907:6096:b0:b04:5a74:b675 with SMTP id a640c23a62f3a-b07c353e5d7mr289894566b.9.1757676001707;
        Fri, 12 Sep 2025 04:20:01 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm348713966b.67.2025.09.12.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:20:01 -0700 (PDT)
Message-ID: <24b47c3c-1cd7-4dda-9abf-5032fcd1d30c@monstr.eu>
Date: Fri, 12 Sep 2025 13:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: ZynqMP DT changes for v6.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_042004_399679_9342B50A 
X-CRM114-Status: GOOD (  13.40  )
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

Hi,

please pull these changes to your tree. Pull request contain description for new 
k24 SOM which is placed on kd240 carrier card. Also new kr260 carrier card which 
is using k26 SOM (as kv260).
There are a lot of changes in versal-net.dtsi but just because of 16 CPUs and 
cache hierarchy.

The rest are small cleanups and fixes.

Thanks,
Michal



  The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

  are available in the Git repository at:

    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.18

  for you to fetch changes up to 0e81960419ad186378b4cb55d7939d03c85262ab:

    arm64: versal-net: Describe L1/L2/L3/LLC caches (2025-09-10 15:56:24 +0200)

  ----------------------------------------------------------------
  arm64: Xilinx DT changes for 6.18

  - Fix some issues reported by dtschema
  - Properly mark EMMC devices
  - Update PSCI version
  - Update DP description and enable it on boards
  - Disable DEBUG IPs by default

  SOM:
  - Describe usb hubs
  - Fix PWM polarity issue
  - Add support for k24, kr260 and kd240

  Versal NET:
  - Describe CPU cache layout
  - Fix RTC calibration value

  ----------------------------------------------------------------
  Harini T (1):
        arm64: versal-net: Update rtc calibration value

  Michal Simek (10):
        arm64: zynqmp: Use generic spi@ name in zcu111-revA
        arm64: zynqmp: Remove undocumented arasan,has-mdma property
        arm64: zynqmp: Introduce DP port labels
        arm64: zynqmp: Enable PSCI 1.0
        dt-bindings: soc: xilinx: Add support for K24, KR260 and KD240 CCs
        arm64: zynqmp: Add support for kr260 board
        arm64: zynqmp: Add support for kd240 board
        arm64: zynqmp: Describe ethernet controllers via aliases on SOM
        arm64: zynqmp: Enable DP in kr260/kv260 revA
        arm64: versal-net: Describe L1/L2/L3/LLC caches

  Paul Alvin (1):
        arm64: zynqmp: Add cap-mmc-hw-reset and no-sd, no-sdio property to eMMC

  Quanyang Wang (1):
        arm64: zynqmp: Disable coresight by default

  Radhey Shyam Pandey (1):
        arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106

  Rohit Visavalia (1):
        arm64: zynqmp: Enable DP for zcu100, zcu102, zcu104, zcu111

  Venkatesh Yadav Abbarapu (1):
        arm64: zynqmp: Update the usb5744 hub node as per binding

  Vishal Patel (1):
        arm64: zynqmp: Fix pwm-fan polarity

   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml |  81 ++++
   arch/arm64/boot/dts/xilinx/Makefile                      |  24 ++
   arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 410 +++++++++++++++++-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso     | 390 +++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso     | 455 
+++++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso     | 456 
++++++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso     |  40 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso     |  39 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts        |  23 +
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts        |   7 +-
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts       |  21 +
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts   |   1 -
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts   |   1 -
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts        |  21 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts        |  14 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts        |  20 +-
   arch/arm64/boot/dts/xilinx/zynqmp.dtsi                   |  18 +-
   20 files changed, 2046 insertions(+), 29 deletions(-)
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


