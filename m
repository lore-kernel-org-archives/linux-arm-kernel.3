Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B280BCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uvb1QCX1mzHeo/71RVOy6J/1fOhqpr0rUyScFFo/UO8=; b=PMlSTKtOHvM1Uyg+FhYzbIVRs7
	qpa6kH4o6UGUe4tHYgne3NSPfKrle/zuxC8bIMq7Otnqqob/in9lGfW9YOH+stvJZ7nkOnsofvSb9
	QP9uchUPdBNIOeLjWsDVyfNz9NcJEpCXUUQJigdVNq7P/xOLMLC3/pxKTWA0LbjAzrSIvyXzKvHFz
	sdMZ8TjTKzRhHzERbMQ8yfQxvucJO1Niwg9bA0Wb7OBTEYrzr8e2ayqCsWhxoF7Bu93IxHRQOq0Dz
	Weke/LbP3uCK2qnJit6WezT4aj2Sx47G0CmRi0aFltqdcLw9MWSrhsoyFPLtoVGupRK8yV5VCdw+n
	9egZJGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSip-0000000EdmF-3OQr;
	Mon, 27 Oct 2025 19:17:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSim-0000000Edka-1esr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:17:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53633169E;
	Mon, 27 Oct 2025 12:17:25 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 393153F63F;
	Mon, 27 Oct 2025 12:17:31 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	perlarsen@google.com,
	ayrton@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] use TPM device with CRB over FF-A when kernel boot with pkvm
Date: Mon, 27 Oct 2025 19:17:27 +0000
Message-Id: <20251027191729.1704744-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_121736_478468_A8F4362A 
X-CRM114-Status: UNSURE (   8.61  )
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

To use TPM device iwth CRB over FF-A, it would be good to be compiled:
  - CONFIG_ARM_FFA_TRANSPORT as bulit-in
  - CONFIG_TCG_ARM_CRB_FFA as built-in

to integrate with IMA subsystem otherwise, it couldn't generate the
boot_aggreate log with the PCR value.

Unfortuately, kernel fails to probe the TPM device
when it boots with kvm-arm.mode=protected since the FF-A calls
(FFA_SEND_DIRECT_MSG/MSG2) are failed when CONFIG_ARM_FFA_TRANSPORT=y.

This patch series resolves failure of the TPM device when
kernel boots with kvm-arm.mode=protected and based on v6.18-rc3.

Yeoreum Yun (2):
  KVM: arm64: fix FF-A call failure when ff-a driver is built-in
  KVM: arm64: support optional calls of FF-A v1.2

 arch/arm64/kvm/hyp/nvhe/ffa.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


