Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F82DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07RhwIu4Dfn3mAkieHcOnZT/4Z8HTEe7FGUX0mJusZ8=; b=vm9wGJ1rH4q/Oo66FnJMJgl3Lv
	W9uzu6xaiFUjGVgTokOtoZxPG1DcZzYEMkG5PVNVhZYJPokZsZuRTnXKlvBIONzzIcZ6GIJLMwqAP
	MHMHfulcxxtbjQknie+3VtT6VnCXwM/gyPFQ9wtsUlSfZIbSPXSl4Nubx6TSFc15mGHf585w0bari
	5352wEey9PHUlpxfmpGmro5tYwYkpeXSSn/KjX3tAiemrr+HbTPdfGhslZ6BFWjISMVh24kKwCVq8
	GhCNBrH4lgba3F6VE54cIriquoYf8/d/2IEtTJQy+8O4rdwxQOXDgSI1EhT4yTM/3FQ81l1XpsSJd
	517ri2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUoX-000000006RF-1Dkd;
	Fri, 06 Jun 2025 11:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUlt-00000000619-0R7W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:58:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB7D9153B;
	Fri,  6 Jun 2025 03:57:39 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F1333F59E;
	Fri,  6 Jun 2025 03:57:56 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] fix failure of integration between tpm_crb_ffa with ima
Date: Fri,  6 Jun 2025 11:57:52 +0100
Message-Id: <20250606105754.1202649-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_035801_183005_167F20D3 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

To integrate tpm_event_log with ima subsystem,
tpm_crb and tpm_crb_ffa driver should be built as built-in
(ARM_FFA_TRANSPORT=y && CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y).

However, this could make failure for ima_init() gets tpm chip when
each initcall function deployed like:

0000000000000888 l       .initcall6.init>-------0000000000000000 crb_acpi_driver_init
000000000000088c l       .initcall6.init>-------0000000000000000 tpm_crb_ffa_driver_init
0000000000000a9c l       .initcall6.init>-------0000000000000000 ffa_init

If crb_api_driver_init() is called first, probing tpm device using CRB over
FFA method is deferred since tpm_crb_ffa_driver_init() or
ffa_init() doesn't called yet -- this means the secure partition isn't
probed yet.

and deferred probe of the tpm device will be probed by system workqueue
in proper time after deferred_probe_initcall() registers the work.
However, ima_init() could be called first if they're deployed like:

000000000000012c l       .initcall7.init>-------0000000000000000 init_ima
000000000000016c l       .initcall7.init>-------0000000000000000 deferred_probe_initcall7

In this situation, ima_init() failed to find tpm device and it failed to
generate boot_aggregate with PCR values.

That's why kernel prints log this situation though tpm device exists:
   [    3.080786] ima: No TPM chip found, activating TPM-bypass!

To resolve this,
  Patch #1, change ffa_init()'s init level to rootfs_initcall so that
  ffa_device generate before any ffa_driver is loaded.

  Patch #2, call ffa_register() at tpm_crb_ffa_init() when
  it's built as built-in. so that when tpm device is probed,
  tpm_crb_ffa secure partition in probed state with related ffa_driver.

---

Yeoreum Yun (2):
  driver/firmware/arm_ffa: change ffa_init's initlevel
  driver/tpm/tpm_crb_ffa: maunally register tpm_crb_ffa driver when it's
    built-in

 drivers/char/tpm/tpm_crb_ffa.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_ffa/driver.c |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


