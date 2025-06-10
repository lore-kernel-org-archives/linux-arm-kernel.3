Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E33C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RQMOdx7vQ2+3WjQRNDBJsAeZvtXdrCOdQe3M0o0Y/PA=; b=qNHN9QuI7NM2QYfb5ufsR6C6Zz
	dpnAOK/vmUwa0Pbaf3OE2CBwng7oeU/3X4IEPK22lkm5+kFA/C4xGJyPiesjJjxmPYT/FAQlCEO38
	5U0WYE3BuY8rTxQMb4NbYIsLmy1yoqW97L+UC0a+u3fduCyW38/pX1eDfuMerO2EE2aq2JJc3XTqt
	OqvmhNp0bE9pssXMLRJ5Wf7Jqdc/TUULmoYlzyaJg22nbNUprR6O93Mi7uAz/REfjFKRL6H0mPyw1
	EDs1tpeITjdt0Z93wMWMdfNgcpu+jA5+WX/C8pEZNq21V2vSqJRjVyTM4pYvGMJt2Po8RuY7qQkjs
	0y5XjYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs7Q-00000005tdU-466F;
	Tue, 10 Jun 2025 06:05:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs5G-00000005tNR-316H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:03:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0786314BF;
	Mon,  9 Jun 2025 23:03:21 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A993B3F673;
	Mon,  9 Jun 2025 23:03:38 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: jarkko@kernel.org,
	sudeep.holla@arm.com,
	peterhuewe@gmx.de,
	jgg@ziepe.ca,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Date: Tue, 10 Jun 2025 07:03:32 +0100
Message-Id: <20250610060334.2149041-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230342_805865_80EB78A4 
X-CRM114-Status: GOOD (  12.80  )
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

To integrate a TPM device that uses CRB over FF-A with the IMA subsystem,
both the tpm_crb and tpm_crb_ffa drivers must be built as built-in
(i.e., ARM_FFA_TRANSPORT=y, CONFIG_TCG_CRB=y, and CONFIG_TCG_CRB_FFA=y),
because IMA itself is built-in and the TPM device must be probed
before ima_init() is invoked during IMA subsystem initialization.

To ensure this works correctly, the following initcalls must be executed in order:
	1.	ffa_init()
	2.	tpm_crb_ffa_driver_init()
	3.	crb_acpi_driver_init()

Unfortunately, the order of these device initcalls cannot be strictly controlled.
As a result:
	1.	ffa_init() may be called after tpm_crb_ffa_driver_init()
	2.	tpm_crb_ffa_driver_init() may be called after crb_acpi_driver_init()

For example, the following initcall sequence may occur:
  0000000000000888 l  .initcall6.init>  crb_acpi_driver_init
  000000000000088c l  .initcall6.init>  tpm_crb_ffa_driver_init
  0000000000000a9c l  .initcall6.init>  ffa_init

In this situation, the IMA subsystem fails to integrate with the TPM device
because the TPM was not available at the time ima_init() was called.
As a result, you may see the following message in the kernel log:

  | ima: No TPM chip found, activating TPM-bypass!

To resolve this issue:
  Patch #1: change the initcall level of ffa_init() to rootfs_initcall,
            so that the FF-A device is created before any FF-A drivers are loaded.

  Patch #2: call ffa_register() in tpm_crb_ffa_init() when it is built as built-in,
            ensuring that the Secure Partition used by tpm_crb_ffa
            is already registered when the TPM device is probed.

==============
Patch History
==============
  Since v1:
     - rewrite commit message.
     - https://lore.kernel.org/all/20250606105754.1202649-1-yeoreum.yun@arm.com/


Yeoreum Yun (2):
  firmware: arm_ffa: Change initcall level of ffa_init() to
    rootfs_initcall
  tpm: tpm_crb_ffa: maunally register tpm_crb_ffa driver when it's
    built-in

 drivers/char/tpm/tpm_crb_ffa.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_ffa/driver.c |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


