Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A9606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ea9Ux2M;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Aeg1DChs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ht9WUxyatyt/F/skn5itMNnUaqsNQIudb7pG2aMoxEk=; b=0ea9Ux2MGU9tkO6g3TNNu9G5Ba
	KXCuS2vpQ7B9HNq2FWbCpDXIBPgzN77UTk/glg0U/fqZFk5noJfXTCuJC6bwdN8vdQAkXsZypNt6b
	Kh4Qy9VJZ1PauX9RpSs4VYIAO6Czhrl8IWQvUD+ag1RQwek2ZRD4PE1sn+GHm0S/uNyuuziOAIfoW
	GBY9ggPKjMvtQwA1LACpDUAiKFdkHFrNPoht7zxQ2aj2VK/dwGAIACezLn409BWe3wuYZT5cWpwc/
	ogz00VOuLElghmdOpJkfjopzk/DGlkVijkrVWq+u8GoKFfgluZjUPngsC9GHVEG0XUuyMnzk6ooSo
	r+Yjm6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dC-00000007Obi-23G2;
	Wed, 28 Oct 2026 15:32:02 +0000
Received: from out-160.mta1.migadu.com ([95.215.58.160] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dA-00000007Oat-0DNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:32:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZTWMSahcNXio61k2+E3NsswZxtgAxnlSsoLAtP0uISQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793201517; v=1; x=1793806317;
 b=Aeg1DChsMb9hcUlrxe+YoPOS2vcNvhxGq711ffbNVJclJcFMFBaLFxVYqvTRCOzTyVzXIQZ/
 Kv+JhWrETEzBCGGMkZgPgxjS23mvKp3YD/z/owt+19Ag4qp6bnWbxhG2kPDksUGtJXK0Inv0jPZ
 s6o3L8d751aRLOzQ2G5mJLus=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1c20b6414d7e255c;
	Wed, 28 Oct 2026 15:31:57 +0000
X-Mizu-Trace-ID: 1c20b6414d7e255c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Wed, 28 Oct 2026 15:31:49 +0000
Message-ID: <20261028153152.1740044-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_083200_307746_8A52C35B 
X-CRM114-Status: UNSURE (   8.61  )
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

Changes since v2 [1]:
  - Stop the host's counters with PMCR_EL0.E rather than the individual
    counter enables. (Marc)

Two fixes and a hardening patch for PMU handling in pKVM, as one series
[2].

The first is Vincent's rework of his HPMN fix. It supersedes his earlier
posting [3]. Rather than read nr_event_counters through a different
accessor, the host copies the hypervisor's kvm_host_data before it's
deprivileged, so host_data_ptr() returns what was set up at init.
Otherwise, HPMN is 0 and a non-protected guest's event counters don't
count.

The second is the non-protected half of Oliver's patch from 2024 [4]. It
passes the host's PMU events to the hyp vCPU of a non-protected guest,
whose counters otherwise all read 0.

The third covers the protected half. It stops the host's counters while
a protected guest runs, so the host can't count the guest's cycles and
events. Side channels are outside pKVM's threat model, so it carries no
Fixes: tag.

Based on kvmarm/next (dd0bc00e3e920).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261028110739.2366566-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/86bj8kzix4.wl-maz@kernel.org/
[3] https://lore.kernel.org/all/20261023092007.3918848-1-vdonnefort@google.com/
[4] https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/

Fuad Tabba (1):
  KVM: arm64: Disable host PMU counters for protected guests

Oliver Upton (1):
  KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected
    guests

Vincent Donnefort (1):
  KVM: arm64: Synchronise kvm_host_data before host deprivileging

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c   | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/pkvm.c              |  6 ++++++
 3 files changed, 41 insertions(+)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.47.3


