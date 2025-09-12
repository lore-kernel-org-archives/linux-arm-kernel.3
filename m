Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DA5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xCcLz0xeAKx5n/UEUykcuqgh7EdPmjYCEV4CfhEznQ=; b=e+ehpRu0npxzz3RQ2OFygKwPQm
	yoclFPDhG3DfsEEJY4knD+rvdknsjMY4FzqCoJysWmAuehqkjtWphnKtCJjTsiuTbWi9YDCHi+fbi
	LlFMFIydv6rPc8p2N4J9X3zCiHTbOZOFaBSCBsSnsU8rKWDD1I1buWFS3KmiuQ3Dz1yV+oKM4M90C
	g+yTT3aLmuAXsYMAYtLEhZvaOROwsMmo6NAu3DxyLXVzgWXfEs1IDE8O1khAnhNBXOU7dJ0W+bgEM
	1sOeP1nKvPkQuXi6ImCk8nfDAazOixf7CmoJJVV+koHee+aODSJpwimUozxxThkqTtBv160kdxkbS
	M44eqxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux26n-00000008vZG-2gyh;
	Fri, 12 Sep 2025 11:38:29 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux26k-00000008vXl-1rFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:38:28 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e9d6cb1df67so1251205276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757677105; x=1758281905; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0xCcLz0xeAKx5n/UEUykcuqgh7EdPmjYCEV4CfhEznQ=;
        b=fvebpHYe89V3gMamH5wQ9Rt2gs/voSThomOabw0kF6DVPvQMF4WFeI7lR8mn4WGoLD
         /EL2IZigOAEMqz7OMOEAr7s0voyFDLkCJEGhcOcuwu4E3SpCKwk/FiqlP52eS7ddTJH3
         gTAg6wUI/rD1+PQLZ7HNbxBYDXygjbKAQW4Pk3dEJaYfr22z2F0wP0zHz0CVOBEXSsdd
         N+SwxzNOvmNXFDb18wJapzPHG4/HaO9USCA6utMH2uodiVnud6vzx125s10XXrV2dhn2
         vxcHmZqIvCmWX2pm8PHcUvVplEfUkGMY2KeDJ1ev/4nc9+H1BqpN3ZVMgdRmwSVOLwTo
         Nd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677105; x=1758281905;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xCcLz0xeAKx5n/UEUykcuqgh7EdPmjYCEV4CfhEznQ=;
        b=bvQVXtY4EM90AUI3kksG5ntIiqz07Uk2WQz4xeGjTQeNiw5f2hH7WtT6p3uWbiZPQU
         mHSlwlPErQrryI4a7NBq88Fr//3G5b4kjsroYMu8BucBnYM4PTSPAqzUdA2Z6WW69qjI
         8G1/1fb4iDLYSFGy+u5Bq3KwJua0p84iaztSRY8jZaWi2diy+J1N//WtduSQ5yiQxIi2
         Qaa0RnTX+FvIUjHxWv20x6HpxVbIQcILI7UFJesjHsfW+oVh/i0DdVbKK4iXPGSG9p7B
         azWsorazauNwnt8wTXytq1qrclxTitAFhDKQ29bbfue8lMD9eIxd2/b42pWRgds0qOE6
         5X6Q==
X-Gm-Message-State: AOJu0Yw31yhcmJaAMzQ0TewtOjbt84AHQlFs89Q7CG1MTIi/6zZgbxj9
	O0HM1wRNQHRss23lpK/nNZkB/GKNULAZovQ/HiOfGjGdiAgT9ulHQsMbH86UHMmRsnYLvVGQ6rm
	GCHzaqFstA35KnOevyMNWw4L2Kt74Fstj3+/SOieTRksArJsG8Oji/RwWyEI=
X-Gm-Gg: ASbGnct8ypBBNAEsbs+M8/59mLLu/Dqaq+6rPJEDUyDrnStubk70RGzdBcCiNaNDagI
	msTZgI94wOzoTKPcqeNRyBT9tLblPo7GPJORRJczBV4l7VhG8nh3zTJhfDOhM7/Kr7HlCYdi1fe
	9OwfvsYM9qMjnkB8vzf6Rjm5aEDax4AhfHmT143UzSbhbBbO0dMGOBhkw54ra6XBWt8Ldo4Ik5V
	WOyBz5C
X-Google-Smtp-Source: AGHT+IHomt3IVxngq/04+CycevFJTL5UsnTxN3HPA8yQj6kojY+b2IE4luQhzMGXxooXg9gISnBqG/EwWliSr5txeJU=
X-Received: by 2002:a05:6902:72f:b0:e95:2a4e:6e26 with SMTP id
 3f1490d57ef6-ea3d9caf3cbmr2422823276.52.1757677104679; Fri, 12 Sep 2025
 04:38:24 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 12 Sep 2025 13:38:12 +0200
X-Gm-Features: Ac12FXz16hCtqAIdxUPmYnu87QdzPPB-ONwoYmQp4XNsW_aV_6Sj1cqQsDx9iZc
Message-ID: <CAHTX3dK6if9f+-DW5ZEnfSO4=K_Zje-WH-fwysTY77farsSS9g@mail.gmail.com>
Subject: [GIT PULL RESEND] arm64: ZynqMP DT changes for v6.18
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_043826_493858_2C10E73A 
X-CRM114-Status: GOOD (  15.31  )
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

BTW: I am sending it again via web email interface because the first
email is visible on lore but it didn't pop up in patchwork
https://lore.kernel.org/soc/24b47c3c-1cd7-4dda-9abf-5032fcd1d30c@monstr.eu
Seen that problem in past that's why it's better to send it again.
Tag/changes are the same with the first one.

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
 arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 410
+++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso     | 390
+++++++++++++++++
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
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

