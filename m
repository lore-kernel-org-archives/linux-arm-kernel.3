Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB6C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJlc4WpGe7AaXtvR1uMYrd4tG3NiRCopdKcTPQdM0Ys=; b=mTbu6HvlfEMoR3ji5EoN4avoqe
	bLCcT3nQmslE5U/hB6Q6t4yiqOkPc0lggnSos1PU0oG/rOs9b8ji720z3GuDTpOcuc+FHiYvIFgUX
	6PEgR0kCjeVgQuEBRO6zQbV9pscoT4hmKPjE2QWnq33Mk+M+5/9mDHr4nWKG0eDfWYq4Nd7N/BZLu
	j1aej6CrsHZhbSuzvFXcPYyuT10ULZV0Dh9x5RSAZhGi14IeIJac0KjRLoFNodNA2p5GSL8E8w0KR
	l7Uh2SUz8j9SbJOl7Th9mF2xheTtPzFHcJzKaLP3h7JCZEEDbyFui+sjvNiP6mHhfHUv98+Y6Kuov
	HDeMpmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpe-0000000AHeo-2FhD;
	Wed, 11 Jun 2025 14:53:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJZh-00000009jxD-2Ic2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aJlc4WpGe7AaXtvR1uMYrd4tG3NiRCopdKcTPQdM0Ys=; b=WMhaqvqpTEeGZzqWrTHYnE1Pjd
	cVJdPnCVlIaCxh37MQpmfK+kXni3So540v39ZDDoHEmTdP+afjQ6vgPg3JeyLjwBH/z4T/TumRs+q
	Yak3OXQXbmARQBrIVQETqTtPn0WHzpfoBgTw4mnPRrVn3XuHQM86g/8lkdLRdLdm36gz/KwGY1+ZC
	k5Gi5ABQzpZ6tQII9teBIjNnSad3brCS2vTMivEVK7XR1uuQfSK+JjlpA2dRlWwU5Aa0MFRwq+inx
	0SuHMnveSQABCPqZYAUclDT/bN+sGxUC5ojDuPvZaSt/Qj2MMFe5p9uhp9xNthaPcvpHhz8p4tpf/
	74oHyerA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJZf-00000002Lp2-1z4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F9E2BCA;
	Wed, 11 Jun 2025 04:24:32 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A94FA3F59E;
	Wed, 11 Jun 2025 04:24:50 -0700 (PDT)
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
Subject: [PATCH v3 0/2] generate boot_aggregate log in IMA with TPM using CRB over FF-A
Date: Wed, 11 Jun 2025 12:24:46 +0100
Message-Id: <20250611112448.17751-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_122455_731644_F738597F 
X-CRM114-Status: GOOD (  13.45  )
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

To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
the TPM driver must be built as built-in and
must be probed before the IMA subsystem is initialized.

However, when the TPM device operates over the FF-A protocol using the CRB interface,
probing fails and returns -EPROBE_DEFER if
the tpm_crb_ffa device — an FF-A device that provides the communication
interface to the tpm_crb driver — has not yet been probed.

To ensure the TPM device operating over the FF-A protocol with
the CRB interface is probed before IMA initialization,
the following conditions must be met:

   1. The corresponding ffa_device must be registered,
      which is done via ffa_init().

   2. The tpm_crb_driver must successfully probe this device via
      tpm_crb_ffa_init().

   3. The tpm_crb driver using CRB over FF-A can then
      be probed successfully. (See crb_acpi_add() and
      tpm_crb_ffa_init() for reference.)

Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
all registered with device_initcall, which means crb_acpi_driver_init() may
be invoked before ffa_init() and tpm_crb_ffa_init() are completed.

When this occurs, probing the TPM device is deferred.
However, the deferred probe may happen after
the IMA subsystem has already been initialized,
since IMA initialization is performed during late_initcall,
and deferred probing is handled asynchronously via a workqueue.

This patch addresses the issue by ensuring timely probing of
the tpm_crb_ffa device during TPM initialization:

  Patch #1: Change the initcall level of ffa_init() to rootfs_initcall,
            so that the FF-A device is created before any FF-A drivers are loaded.

  Patch #2: When built as built-in, call ffa_register() within tpm_crb_ffa_init()
            to ensure the Secure Partition used by tpm_crb_ffa is already registered
            before the TPM device is probed.

==============
Patch History
==============
  Since v2:
     - rewrite cover letter and commit message:
     - https://lore.kernel.org/all/aEgwpXXftXW6JNRy@e129823.arm.com/

  Since v1:
     - rewrite commit message.
     - https://lore.kernel.org/all/20250606105754.1202649-1-yeoreum.yun@arm.com/


Yeoreum Yun (2):
  firmware: arm_ffa: Change initcall level of ffa_init() to
    rootfs_initcall
  tpm: tpm_crb_ffa: manually register tpm_crb_ffa driver when it's
    built-in

 drivers/char/tpm/tpm_crb_ffa.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_ffa/driver.c |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


