Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FCECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDXLKD2JcAw4148xQRE51MPjYYIH4PeA7CAsRBKlZFU=; b=4DBOdGQBeDoBkjo0aDxTLxyy9p
	A5LK+o/9eQgZGz+NJ5lkXhPiIZdL7J9H7JfxL3HLm1NHgCQ24+9hg0AEtu/RVeJ/GsnCjtr2tBdbv
	2qJGHt5d4f7TctswlgrLZnHebSV9P5pMFCOE3z0kL8FOviOmkowg4rtsfD7qBZTVdR13TDQ9e3rg5
	M+pnp0R1fuBBUQ+7cjbUFfq3huK/Dz4+553CqzKB0Fp/Lo8zLGRJwrL6AvBnvFQZotBwBzaW2+VMj
	WhvRBVohYQ3zgLsRwuPg3lD7W4DJAnIw1+6o5f7cYOBSVAZTsHFK6JYirXk6y44I7EYeoubwSuXYB
	QtrX5VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPo0-00000003xvk-2vXe;
	Thu, 30 Oct 2025 10:22:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPnx-00000003xuX-3DmL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:22:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AA5B2C42;
	Thu, 30 Oct 2025 03:22:42 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D679F3F66E;
	Thu, 30 Oct 2025 03:22:47 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	perlarsen@google.com,
	ayrton@google.com,
	ben.horgan@arm.com,
	sudeep.holla@arm.com,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] use TPM device with CRB over FF-A when kernel boot with pkvm
Date: Thu, 30 Oct 2025 10:22:43 +0000
Message-Id: <20251030102245.2313898-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032253_864857_BF09AAC8 
X-CRM114-Status: UNSURE (   9.04  )
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

Patch History
==============

from v1 to v2:
  - remove unnecessary ffa_feature smc-call in ffa_call_supported()
    (Ben Horgan's comment).
  - https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/


Yeoreum Yun (2):
  KVM: arm64: fix FF-A call failure when ff-a driver is built-in
  KVM: arm64: support some optional calls of FF-A v1.2

 arch/arm64/kvm/hyp/nvhe/ffa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


