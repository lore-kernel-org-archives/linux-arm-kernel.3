Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E289CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YinQbLU8vbzVnJ38abcAwWcbCaAwl1rPZIBZboRvYqM=; b=0nXoqtmZ1/RNWC
	rqNC4seDykKn5x8lWqIoB0q4mBA0mguhy24VCicmp/RMLHbF1AAf+vbgy+0kHOFVJJiLc2jZN7Bxs
	SjLN/F+TbS28zSyz+L3sKhrcwhpsJUSmGABZqGJ55v/D3p4mws8p/41/e0BIW38fl2ychfNnQB+r1
	EILLPuMWJtA84gIk15AZU+S5vkAD2ZEzkAeRKKbnFNAgPmBTj45xn3v8Wg+k8otYoy1UXa74WBGwO
	Y1QgV696YMLCxUyTVbMcGb/C2j575bCprYi/KueV36LGoZuhmdg6TrADthLNodw/bKpiS4GwenGlg
	i22sJ83Kj9DLkRfjiC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8X-00000007iAj-0nxb;
	Mon, 19 Oct 2026 14:14:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8R-00000007i7u-0wix
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:14:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36D301682;
	Mon, 19 Oct 2026 07:14:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23B13F871;
	Mon, 19 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419279; bh=acYj46bAxdWbuEbOhneF5ckxlobjJs/JJVp9hxOcfo4=;
	h=From:Subject:Date:To:Cc:From;
	b=j5RdBllvhFGZfX6lQGSnPcns4MMpNcHTbQhwiUAOkQG3/GcXt+2wxDGnyCpt+MZWY
	 3EFzwkYaIagQoAgDRm2WyxkWe+PzYhkp+VOFz4aNeuuZWdu45/bXcYoYi26Wv6qyHU
	 xORYVLZ9o88+2nWVbOR1rN1ELy2Y+rDuw6SXyDjc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Date: Mon, 19 Oct 2026 15:14:32 +0100
Message-Id: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgl1moC/22NwQrCMBBEf6Xs2UgS28Z4EgQ/wKsUCXFj95BUN
 qUopf9uyNnjm2HerJCRCTOcmhUYF8o0pQJq14AfXXqhoGdh0FL30mgrAnHEB6UZOTiPwnS96n3
 bOS0PUFZvxkCfarzD7XqBoYQj5Xnib31ZVK2q0P4RLkpIYc0RQ2i196jPjuPeTxGGbdt+IluBn
 LEAAAA=
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4888; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=acYj46bAxdWbuEbOhneF5ckxlobjJs/JJVp9hxOcfo4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXLCXbKAMZvRl/irKlXnYVtSLBN/LtDnUB/w
 c498eQFNF+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlywAKCRBt1cPRWsUx
 M6oJDAC9lDUAB6f+L01DAIp7rWxMexvCisf52P2617kAUk0ZoyHr13GVoL4UsDUHQlmpof9pVPM
 VcG1lZOifb4InJAj1AcD/uczITyrpeEGJASp3+qUkIPDERiPyj/MZQ+YywmzKY+HoZs9ZVyHmat
 6OCAcKlpZOSiTfLb2J59Q8p4nXCEYVhQNXYXMVFYb+0+XzhHAxqXj9UNGoblgtRyf8Xy9ZlmyQ/
 PqJ3rTUuRXgG+8DKfM8GmmObWmLFn9oSbSUMfatVbWmGL4Fb3xUEamP0v8b9FIvxG+XfCSOzmNp
 VXb9bnGD9pQ+ujSbfxe5QgfO7Kz9tVS3g6XN5HZclTgEdL0FDbwFiFEvKEvxLlytz8bzeSF+5mw
 mk/i2ciSd/12hKqi/7AXf0wEjcIbxE7YskWYvZmMUTC3Ao/hcAAm6sEaQRvqAptkE0CWLgo3eIZ
 8gXGZZ6fTtNtICcUkE6nQ7xx0Iyc0tERVTa+raIuXObn0udy8f4c7bNrcaz7fg47k22Co=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071443_390269_A7FFDB81 
X-CRM114-Status: GOOD (  13.93  )
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

The Arm Confidential Compute Architecture (CCA) introduces the
Realm Management Extension (FEAT_RME), which enables the creation and
management of dynamically allocated, attestable trusted execution
environments known as Realms.

Realm management relies on EL3 firmware to provide services for Realm
construction, resource allocation and isolation, and attestation of
the initial Realm state.

The Firmware Interface for Realm Management Extensions (FIRME) [0]
specification defines standard interfaces through which EL3 firmware
provides these services. FIRME defines the following service groups:

  - Granule Protection Table (GPT) management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation Token management
  - Integrated Device management

FIRME also defines a Base service that provides common functionality,
including service discovery and feature discovery.

Although FIRME primarily supports Arm CCA, its interfaces can also be used
on systems without FEAT_RME to provide firmware-based attestation and
other security services.

This RFC patch series introduces the arm_firme driver, which provides
the common infrastructure for discovering and accessing FIRME services.
The initial implementation supports:

  1. FIRME Base service:
      Provides service discovery and feature discovery.

  2. FIRME Attestation Token service:
      Provides access to firmware-generated platform attestation token
      used to attest host firmware.

The Attestation Token service is integrated with the Linux Trusted
Security Module (TSM) subsystem, enabling userspace applications to
retrieve platform attestation tokens through the existing TSM interface.

The objective of this series is to establish the foundational FIRME
infrastructure in the Linux kernel and enable host platform attestation
using the standard TSM interface.

NOTE:
  This implementation is based on version 1.0-ALP4 of the FIRME specification
  and for-next/smccc-bus branch in arm64 tree.

RFC and ongoing TSM infrastructure discussions
==============================================

There are ongoing discussions regarding changes to the Linux TSM
infrastructure [1]. This series is being submitted as an RFC to gather
early feedback on the FIRME driver architecture and its integration with
the Linux TSM subsystem.

The intent is not to pre-empt or undermine the ongoing work to evolve
the Linux TSM infrastructure. Rather, this RFC aims to highlight an
additional use case that the evolving TSM infrastructure will need to
accommodate, namely host platform attestation through
the FIRME Attestation Token service.

While the current implementation uses the existing TSM interfaces,
we recognise that changes may be required to align with the proposed
TSM infrastructure.

We hope this RFC will help inform those discussions and ensure that
the requirements of FIRME-based host attestation are considered
as part of the ongoing TSM development.

We welcome feedback on the proposed FIRME driver architecture,
the integration with the TSM subsystem, and how best to align this work
with the planned TSM infrastructure changes.

To: linux-kernel@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>

Link: [0] https://support.arm.com/documentation/den0149/latest
Link: [1] https://lore.kernel.org/all/arzr32ZDComnfmny@FV6GYCPJ69/
---
Yeoreum Yun (3):
      firmware: arm_firme: introduce arm_firme driver
      firmware: arm-smccc: add FIRME device
      firmware: arm-firme: TSM_REPORT support using FIRME

 drivers/firmware/Kconfig            |   1 +
 drivers/firmware/Makefile           |   1 +
 drivers/firmware/arm_firme/Kconfig  |  42 +++++++
 drivers/firmware/arm_firme/Makefile |   6 +
 drivers/firmware/arm_firme/attest.c | 172 ++++++++++++++++++++++++++
 drivers/firmware/arm_firme/base.c   | 145 ++++++++++++++++++++++
 drivers/firmware/arm_firme/driver.c | 139 +++++++++++++++++++++
 drivers/firmware/arm_firme/firme.h  |  53 ++++++++
 drivers/firmware/arm_firme/report.c |  88 ++++++++++++++
 drivers/firmware/smccc/smccc.c      |   6 +
 include/linux/arm-smccc.h           |   1 +
 include/linux/arm_firme.h           | 234 ++++++++++++++++++++++++++++++++++++
 12 files changed, 888 insertions(+)
---
base-commit: c83237edf0adb8f8cbd9859841bbca5acc00fc11
change-id: 20260729-firme_interface-75616c45a203

Best regards,
-- 
Sincerely,
Yeoreum Yun


