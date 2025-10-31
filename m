Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C64DCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XqY6d+LWsOv8MlASEsOAsXeeO9HQOKCMwdj36zjoEBg=; b=nd6gSDiRijhfUG
	wHjo7Ohdy9cBJ1kpmaINnW+rwbkMcQxyjMs+wyGgMeAqI3lWnoLg4ZbOV5e7kmgDnSH2jzj0yu/Ds
	yySLEgi8Ch/KYCsw/DqYSqPnRFWEJz/XhMKVWe+ZKZwyvfh6Tv6azK77CYRz2O8tIJKpx+AB7fEo2
	6P7aG4uob7RPaYanqBPuCZoUpnGkpv4XxTNWtCQ27haj2Y4UpEKGV/bkDGPDjeABxVBFCt/SvxxRj
	nm/lu/Wib6zUNZBOWW4Tk0Pzl5wdFcoUnTcx7JQMJgYcKAGYOwo1ZWpMNNQSuQfDGIGyLqMpexghR
	d0B7ogdAPN3tkxOoxoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt9m-00000006Z4z-07hL;
	Fri, 31 Oct 2025 17:43:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt9k-00000006Z4b-3KXj;
	Fri, 31 Oct 2025 17:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B317A60254;
	Fri, 31 Oct 2025 17:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382B5C4CEE7;
	Fri, 31 Oct 2025 17:43:11 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/3] PCI: meson: Fix the parsing of DBI region
Date: Fri, 31 Oct 2025 23:12:58 +0530
Message-Id: <20251031-pci-meson-fix-v1-0-ed29ee5b54f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACL1BGkC/x2MQQqAIBAAvyJ7bkENJfpKdEjbag+pKEQg/j3pO
 AMzFQplpgKzqJDp4cIxdFCDAH9t4STkvTNoqY2So8LkGW8qMeDBL/rJWaOct9Zq6E3K1PX/W9b
 WPrPmlXNfAAAA
X-Change-ID: 20251031-pci-meson-fix-c8b651bc6662
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable+noautosel@kernel.org, stable@vger.kernel.org, 
 Linnaea Lavia <linnaea-von-lavia@live.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=vroR35+0m/WOqTCc3pHB+dq6wrRsNeMwH4SL+cTs0Zs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBPUv/ByYAMlVSnih7i/7vpgUV16Ct4fpIK8Kc
 YRDlbdh7viJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQT1LwAKCRBVnxHm/pHO
 9UKrB/4jcLEeWocGJwfF6C2jbmqDNLzp+AgmCielD3AzwWmZi1u/nuZk23uQrE/nUyALXisj1NV
 YTlJXdSp5Ua/KpwmqVwlEiRlT/2o7zQ1aZMjkBHuw3+RIjDM23ngzTsB3SfDidXqGoDD1vDwu6x
 VbvARVbvAhtStxViBSpXAgBNDBXkAVR95izzw989HAIQ1CFq2YhSSqgu8goOtWH5ZdF2rWdJnvm
 trXrsKghDytyE4UjlP/CztKgJYtzY3KnoWG/stR4IwIWGjQ0BXgPP9hx29yqFe55Y6PLSCVP+e5
 6AumRv0O79SN7H9dIMbI8Zklyo9bM0gWpgPE/Dkrp+1a/nn/
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

This compile tested only series aims to fix the DBI parsing issue repored in
[1]. The issue stems from the fact that the DT and binding describing 'dbi'
region as 'elbi' from the start.

Now, both binding and DTs are fixed and the driver is reworked to work with both
old and new DTs.

Note: The driver patch is OK to be backported till 6.2 where the common resource
parsing code was introduced. But the DTS patch should not be backported. And I'm
not sure about the backporting of the binding.

Please test this series on the Meson board with old and new DTs.

- Mani

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (3):
      dt-bindings: PCI: amlogic: Fix the register name of the DBI region
      arm64: dts: amlogic: Fix the register name of the 'DBI' region
      PCI: meson: Fix parsing the DBI register region

 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml      |  6 +++---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  2 +-
 drivers/pci/controller/dwc/pci-meson.c                 | 18 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c           | 12 +++++++-----
 5 files changed, 28 insertions(+), 14 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251031-pci-meson-fix-c8b651bc6662

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


