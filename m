Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EBFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULpxzULg3028TtNWu8N7vw/s480uAXkmsiGbIaA7mGg=; b=4ILpd4K5cF/hN+dOOWF6UIjLFH
	pdsCERP1ZPCkcF9QrS6pxvqOPMEiRs52fIzVN3FzXd7yOQejQR13KUfb7L+n0/lSfz6NkeYMIVZ7F
	/MHjl/O91c9ALXkaLZLBBAZtegYs+iklyK0SIhb0qLmwavG1pqMj74EFAEPzVn+qrsDwstWECN87f
	9KMX5pPr1BZX8QWb0tOyBfT1jqzdFCGR57Yu+tR8TGOOwfe7/gSn82fn7BJyh50KuAyDpd/mYdDof
	9yKujeL3UJAtVOiiV4DCZRzZVN6w3LatU5osRnD1B8Zo7AUvQeJHR5nFZk23d2rJO/ltYmLNzqhxM
	GAjuzqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Nr-0000000ESPf-1b65;
	Fri, 14 Mar 2025 14:51:35 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6JU-0000000ERgo-1DyW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:47:06 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e60aef2711fso1653033276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741963622; x=1742568422; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ULpxzULg3028TtNWu8N7vw/s480uAXkmsiGbIaA7mGg=;
        b=tn7gljz9iDbdTeCRBSIYWdnAkRsrAxvJPE0mijqfAGI3WCHsUYSadoUZ/J54RJEKlV
         4+/pY4hUrYCAiIE+gwYbrhiDObxNoqYgvYoPd9EI7EIRC6Dy9fRGAW6oyUR3+MTjfIn6
         FDZdXHZRg0mhdeGCQcV854T2RrUmwrjnVin4DuFwmBWQRBSYYryfVg31lSupgFbLrZCR
         0obvQ1TTmR6cdrqD19pm8+DK5Jh8rK3Ic+0s4Vg/iBrqBmQROopktP/FK6BNY7FbWZcV
         +V/0uJ9T6EG77PRuLzI9eQNfTIWGadw9xQE3lNdYXmV7cdia2THWnZ9hj3N6eA2Y/8Zw
         aE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963622; x=1742568422;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULpxzULg3028TtNWu8N7vw/s480uAXkmsiGbIaA7mGg=;
        b=w9DFvZIukUhzL8elX1xCKIihlzTEVWG9ahYzrFOtSs52AitlnICWu2cMyqCFO+5IsQ
         QyMwUAcbhuNsKsFnOXO8cOul5vA6dt/20VJw7GiWc2aMau3fOYtQKIORwOb2tDPVzh6Y
         Ocl+y0GZLcoeuAUp4LADExxS5q1v11TsslYpwihREioo05V0W7QDbF//vcc5JXzU8lF8
         9jghD8OYTpjPEBfNIY790ibO8R6fE7H3Ngu5rxlATRXrV2lwIf8Da3hE61vAUmg+b0LU
         GaK4QQ9z3Lygd+4K4pS3Dn1YUmKmGr6tnpHO8YAhrh0/tNC/j3R769nWbCzAio65/2Iu
         zFFw==
X-Gm-Message-State: AOJu0YzusJB7kFs9zfMu568PQ7Goi4ub+El4aOPI/wQUjwemUUmhIg+U
	3XdMyBWZ/MSLNv1wQL9vVbnR+vGpZNhakqiBkhUU+ntOo1Vrt2k8W9f0rRMyjl78yAi26YX8lwC
	746o8513nQENNOlIqxZqrJzJL4KuZpMjCe2pm4H0i8y4H0LpaRCjs
X-Gm-Gg: ASbGncuRQa7MqrfuvhEEj8+Yh2mfAffDqGZ5z4YACtQncqVd6OK7x3UQIVJraphFJCu
	oEr4ew6VPIngXqKzPNOJ2d6q+wLKp2hHcs8+eSCthRvJwR3ZhQEPlU2JzASya1dX/8heck+jpRe
	eEtX1WeZfssV4ZtCqceRnySdzLi6I=
X-Google-Smtp-Source: AGHT+IHqkVQeDa8YWC8fBhIO88ibTpOHbiGi3FxISD11Pk/b7UC56/MhEMJyW7h/esZ9FomSB6B4l4pl0qUjJEHnxxE=
X-Received: by 2002:a05:690c:6901:b0:6fe:c040:8eda with SMTP id
 00721157ae682-6ff45f2bf78mr30405407b3.4.1741963622528; Fri, 14 Mar 2025
 07:47:02 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 15:46:51 +0100
X-Gm-Features: AQ5f1JpGVUbKl2emC7DLpVnArC6KG70gSWzthZQtM-tnmFCjp5UWdrBp1hf_NCM
Message-ID: <CAHTX3d+u1VmxP4vm0peQS-ST7o0BuCpKUPRVCSLMfAAb=eV3Xg@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_074704_500033_043ED71C 
X-CRM114-Status: GOOD (  12.02  )
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

please pull these patches to your tree. One new Versal NET board is added but
the most useful change is to start to use constants out of dt binding.
There will be followup
patches to migrate all SOC specific constants.

Thanks,
Michal

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.14

for you to fetch changes up to f0ceedd52a69a8bf63778b1fe9e1c10e02ecd3fd:

  dt-bindings: xilinx: Deprecate header with firmware constants
(2025-02-21 07:58:35 +0100)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.15

- Align clock nodes with DT binding
- Add the first VN-X Versal NET board
- Move constants out of DT bindings

----------------------------------------------------------------
Michal Simek (3):
      arm64: versal-net: Add description for b2197-00 revA board
      arm64: zynqmp: Use DT header for firmware constants
      dt-bindings: xilinx: Deprecate header with firmware constants

Naman Trivedi (1):
      arm64: zynqmp: add clock-output-names property in clock nodes

Shubhrajyoti Datta (1):
      dt-bindings: soc: Add new VN-X board description based on Versal NET

 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml             |   4 +-
 Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml |   3 +-
 Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml        |   3 +-
 Documentation/devicetree/bindings/net/cdns,macb.yaml                  |   7 +-
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml              |  11 +-
 Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml            |   3 +-
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml                |   3 +-
 arch/arm64/boot/dts/xilinx/Makefile                                   |   2 +
 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
| 231 ++++++
 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts          | 116 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi
| 752 ++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
| 126 ++++
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi                        |  17 +-
 include/dt-bindings/clock/xlnx-zynqmp-clk.h                           |   7 +
 14 files changed, 1262 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
---
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

