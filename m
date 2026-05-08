Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6D9CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NxJJx2rSpE+R1ocCkImSG6yUjctcN9jF6/tgnKE3dMo=; b=2THg5RDS0wu0PGNeI+p8n15+Ax
	bAmoQicIcsQO2BQk5t5el6vMmsa5L7JMhJT/r4BWjKYY+tKH6K6Wo/njzIFwTQKvFV54sOlHMotMl
	4H7xd7u1PvSmoMWB6nxFWVJ/EbdmmuHRWzy876bkT9Qd3aAtBOpxk//GgYJqqkGwLimUk6LKHX1jv
	72LptHPv39CzhBJZk2pBrnrq3da8No3joikTRPXivrRvq4Dr3OYvZsrJWkHxI1WQiitXr0L8aBKb1
	tcXZoTfpJwxCLA9f/NqwVuwC4Yl+vlhB6MLgyixRMhyUavK6JGwFVfJfbKtw+TCFdBS7x723Uv8/u
	RSkxP0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNza-00000006z2Z-1ir9;
	Fri, 08 May 2026 16:23:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzX-00000006z1x-0DcC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF4661E5E;
	Fri,  8 May 2026 09:23:47 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5717C3F763;
	Fri,  8 May 2026 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778257433; bh=IiRqUc/P2T/3g4My2DD8Q2YomQC99W+YNsG6oKtZfAE=;
	h=From:To:Cc:Subject:Date:From;
	b=V3OMOoSRpkyATXE6zQfQwT9ug1dW5IJRov9FoyoAo/lc+g3UOxmg6vDoWDYDcOWSC
	 Qb6nJ16DDlujd8i/vd6XmE0F+4miYB1syIFFG3f5D/CRAgp5PvwvyoeNPQdgXLbpLq
	 fLIg6KNlS0+g5dyzNy3ZyCJFxAkeZ0c27zop9eyA=
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	catalin.marinas@arm.com,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	will@kernel.org,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: [PATCH v3 0/4] arm_mpam: Add support for the MPAM v0.1 architecture version
Date: Fri,  8 May 2026 17:23:37 +0100
Message-ID: <20260508162341.3762549-1-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092355_142049_8598175D 
X-CRM114-Status: GOOD (  10.17  )
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

This is a v3 of Zeng's series to add support for MPAM v0.1.
Included are the changes Ben and I suggested, and a couple of bugs found while
testing it.

I've put the bug fixes first as you can hit these with mainline.
The patches for v0.1 enable MPAM on those platforms as this extra ID register
was missed.

Based on v7.1-rc2, and can be retrieved from 
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/arch_v0.1/v3


Thanks,

James

v2: https://patch.msgid.link/20260203095406.6437-1-zengheng4@huawei.com
v1: https://lore.kernel.org/all/20260104133434.1887677-1-zengheng4@huawei.com/

James Morse (2):
  arm_mpam: Fix false positive assert failure during mpam_disable()
  arm_mpam: Check whether the config array is allocated before
    destroying it

Zeng Heng (2):
  arm64: cpufeature: Add support for the MPAM v0.1 architecture version
  arm_mpam: Update architecture version check for MPAM MSC

 arch/arm64/include/asm/cpufeature.h |  7 ++++++
 arch/arm64/include/asm/el2_setup.h  |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 15 ++++++++----
 drivers/resctrl/mpam_devices.c      | 36 +++++++++++++++++++++++++----
 drivers/resctrl/mpam_internal.h     |  1 +
 5 files changed, 53 insertions(+), 10 deletions(-)

-- 
2.53.0


