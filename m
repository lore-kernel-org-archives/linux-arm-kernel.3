Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9ACFED3CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmF0qibZtKOHXTwdjY+VV0OSRsvAx+RxlsILPiao7RI=; b=dHVCfTf0fSC2Lv4qm3hCWf4gct
	kfkLZ7OQ1g8v82UI4Jdmwdt2lWMdNTbqc7U2cG+si5qCBmBmOWQaiVS5aQ5fiz5IOieJhFvIhfY45
	PAOVVVLKcFrBXnA8RcYKTC1/L3dTo40NpD6/SXccDIRWh+x3RJJeZ5/HdoFxekIO49W5RVNRVGJy1
	ibfYPFCiAEcxHkmZW6SvSNdSaHmUb4/P7ldptq1hWkk0f8JI1BCFBPcMN25geK84M6qL8PbBos1zA
	xIBNCAH0p8UuYjmSZVA+X9qHQfEUP6ItTm0SNCZSKz0e9TQ0CLaG4xZqUOAfC70VlUdhWukW1skRe
	Sueizzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGVg-0000000DEJV-2rBJ;
	Fri, 24 Apr 2026 13:23:56 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGVd-0000000DEJ6-1xKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=JmF0qibZtKOHXTwdjY+VV0OSRsvAx+RxlsILPiao7RI=; b=s
	v4a78795KOSH9KoUfXxgxQi/ESnPuimjFA8bBIWOOVlybU1uicTvPznFO0//UI3POT8JPIpHz4hkT
	7u/UClrD/yH38ufAx9Qvo0hH3rtRis3VxNl/68qsKOKg60KShhIRPKASvARiobeDjoIaOnj0PDSD/
	ydCRBMMR1VFnZuzZP7ycoFaaVfA0M5b7cGkkXs/BXMaPexlfMfM+kbxaum1HXwugfDGzTgVYeWb43
	TMBnC8kOVhe1XP5//No4iJCyq26FZzJ5/eYCVew1xPEs5KDwvFszuNnjhG/9rdTxiMTQveVxHTLEu
	TudIgyHxY7RJJaXbddM8kB2wwHoXlv1mg==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1wGGVV-0000000551k-3EYt;
	Fri, 24 Apr 2026 14:23:45 +0100
Date: Fri, 24 Apr 2026 14:23:45 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v3 0/4] Fix IMA + TPM initialisation ordering issue
Message-ID: <cover.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_062353_583329_FF34EC2E 
X-CRM114-Status: GOOD (  10.06  )
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

This is a slight reworking of the series from Yeoreum Yun, adding
functionality for IMA initialisation during the late_initcall_sync
stage. This solves the situation where the TPM is not fully registered
at the point IMA wants to initialise, avoiding a failure to correctly
extend TPM measurements from IMA. This has been observed on both Arm
FF-A and SPI attached TPM setups.

As part of this series we also revert the original changes made to the
FF-A driver to try and solve this problem.

(I have left Yeoreum credited in all the diffs except my rework of the
 IMA piece. Yeoreum, please yell if you're not happy with this.)

Patch history
=============
from v2 to v3:
  - Drop ff-a/pKVM diff (this seems to have a separate set of
    discussion)
  - Rework IMA delayed initialisation to avoid delaying when unnecessary
  - Ensure IMA log clearly indicates when we've initialised late

from v1 to v2:
  - add notifier to make ffa-driver pkvm initialised.
  - modify to try initailisation again when IMA coudln't find proper TPM device.
  - https://lore.kernel.org/all/20260417175759.3191279-1-yeoreum.yun@arm.com/#t


Jonathan McDowell (1):
  security: ima: call ima_init() again at late_initcall_sync for defered
    TPM

Yeoreum Yun (3):
  lsm: Allow LSMs to register for late_initcall_sync init
  Revert "tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when it's built-in"
  Revert "firmware: arm_ffa: Change initcall level of ffa_init() to
    rootfs_initcall"

 drivers/char/tpm/tpm_crb_ffa.c            | 19 ++----------
 drivers/firmware/arm_ffa/driver.c         |  2 +-
 include/linux/lsm_hooks.h                 |  2 ++
 security/integrity/ima/ima.h              |  3 +-
 security/integrity/ima/ima_init.c         | 25 ++++++++-------
 security/integrity/ima/ima_main.c         | 37 ++++++++++++++++++++---
 security/integrity/ima/ima_template_lib.c |  3 +-
 security/lsm_init.c                       | 13 ++++++--
 8 files changed, 67 insertions(+), 37 deletions(-)

-- 
2.53.0


