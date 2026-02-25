Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A63FFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=feUaaWPWhWwF9bHj87Z8uDECXZWEFAMDd/LLESrruqM=; b=D4Uo46peb+unA12ThvTSp5fyRL
	5HkXQ5nE5f5ZIwbLF32mUXMTo6RhotN0OZoFCdNDy+8w3e0KlErs6jj+oWhQxEYPFfhlK3MzbdPUE
	f9NQ4Myl2ShkY6+lJAFQeDzUdFkT+VFAnVn9Eu8Y1v+HCESWuJHcqVdMHqFU5eaFIqDoXui3PVGQN
	lvzKfeJHdLdPFcjj98Ywi6CMI0fyHSmwqLUkLiefdjlLyXBHKAEQWCc1XygfmEB34wsjtdIt5MwUn
	3etDPW0fWzavAcOwGDHo393Gb5J3qlMicY/NUQh7/Kr7HAhFaCToPcHATMtWL95p52kBSbjVbXWya
	8JbvVqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuL-00000004sd8-0wMt;
	Wed, 25 Feb 2026 20:54:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuI-00000004scn-3Usa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 20:54:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34F3E15A1;
	Wed, 25 Feb 2026 12:54:45 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECC483F73B;
	Wed, 25 Feb 2026 12:54:47 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	zengheng4@huawei.com
Subject: [RFC PATCH v1 0/4] arm_mpam: resctrl: Counter Assignment (ABMC)
Date: Wed, 25 Feb 2026 20:54:32 +0000
Message-ID: <20260225205436.3571756-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_125454_934769_9EF51899 
X-CRM114-Status: UNSURE (   5.98  )
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

The MPAM counter assignment (ABMC emulation) changes that were dropped from
the resctrl glue series due to some missing precursors in resctrl. Counter
assignement enables bandwidth monitoring in systems that have fewer
monitors than resctrl monitor groups. Posting this as an rfc as this now
depends on two series, the mpam resctrl glue [1] and the resctrl precursors [2].

Based on [1] and [2].

[1] https://lore.kernel.org/linux-arm-kernel/20260224175720.2663924-1-ben.horgan@arm.com/
[2] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/

The series with the precursors can be retrieved from:
https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc

James Morse (4):
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()

 drivers/resctrl/mpam_internal.h     |   7 +
 drivers/resctrl/mpam_resctrl.c      | 192 ++++++++++++++++++++++++----
 drivers/resctrl/test_mpam_resctrl.c |  62 +++++++++
 3 files changed, 238 insertions(+), 23 deletions(-)

-- 
2.43.0


