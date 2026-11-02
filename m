Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D81606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMJTv7Q1;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l8fM/8oX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+JdS4G63s5YrX6ja9msk8fkBfAQWzo4U4td4gFNglHI=; b=QMJTv7Q1GEnE02U8aOSbOR3eyw
	FM+52UeWLTPl0hbM1sbVXL+aXvmOT+SfZCa1bFLl2wgt18/ZiRvg8Pe3fREn5eDJC9HmSCoIVJ8yv
	w7CC7PDjzu5RZ3apIw/lLDkdPa9COlLGeeYY8aFVf9vCpzA+Hx4xloa8k0TmkNQ9bU/Lph5f838DR
	fApb03Eqj4dzTluYOtTQPnjP7oetJWY+QZh4Or+pIDL2rurLdk1CWbvxzt6GPvqDWaWkY4zBfBakS
	ZkIN0xSPSsNCSGJya95P5TjiFlpwk/jDWDOTUoaBi8pHR7p0/FAWK5WnS73WYGFxZD5lF2MgBke4c
	uZ6ICAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwQ-0000000FoL5-0LZi;
	Mon, 02 Nov 2026 07:58:54 +0000
Received: from out-222.mta1.migadu.com ([2001:41d0:203:375::de] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwN-0000000FoJp-1MyY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:58:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OPCNKwKilXKP7yPXswDvwmi3hPbRw7m/9nNCGlJWJ7g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606328; v=1; x=1794211128;
 b=l8fM/8oXnEBp1ZMX+BTQ0PLIAisq+rvezWYZWxHTJ7z38YaWoyG4vstEyCCdbQnk2cdx3mHM
 xesZPrn2UKdNn4H+vE8A8SU+5MhBgh0VMbUh+FSpK5ANedsEX9z04YavgM1RrTci0OHv4cBtsVB
 qPG9BNi5kGfr3xXgquHJUwAk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 483c354dba814e72;
	Mon, 02 Nov 2026 07:58:47 +0000
X-Mizu-Trace-ID: 483c354dba814e72
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 0/2] KVM: arm64: Clear VM-wide state when kvm_setup_vcpu() fails
Date: Mon,  2 Nov 2026 07:58:41 +0000
Message-ID: <20261102075843.2556018-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_235851_639597_400A6D58 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v3 [1]:
  - New patch 2, clearing the default PMU left set by a failed INIT.
  - Reworded patch 1's commit message.
  - Rebased on 7.4-rc1.

A KVM_ARM_VCPU_INIT whose kvm_setup_vcpu() fails doesn't undo its
changes to VM-wide state. Patch 1 clears the feature bitmap, which the
PMU attributes read before the vCPU is initialized. Patch 2 clears the
default PMU, which a retry with KVM_ARM_VCPU_PMU_V3_STRICT would
otherwise inherit.

Tested under QEMU on a host without FEAT_NV1 (an Apple M2 MIDR,
for which has_nv1() returns false), with a reproducer that fails an
INIT and then initializes the PMU, directly for patch 1 and after a
STRICT retry for patch 2.

Based on Linux 7.4-rc1.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921190843.107881-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Clear the VM's feature bitmap when kvm_setup_vcpu() fails
  KVM: arm64: Clear the default PMU when kvm_setup_vcpu() fails

 arch/arm64/kvm/arm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


