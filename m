Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C67A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w2jsWemR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JbcWMaMv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=miIuE2N/e+SG7Kz34MMJd25ETZ3yxYFkA9Zemr87Wgo=; b=w2jsWemRPfGicZy4yyunAHEQ9q
	wTa6DnHWPkXCkVyAkW3vfu5wLNFLEVYezJt4rjLfF5Rvomo1SA+ZBPIfMbB6be8IjJPEuqSIs4q2t
	Igg2L4bcRVuY+/GOsO20AD3pw4JgVJZ9p/Wy084kgOWwF7xLZfELpmYsNre9gFX1Riq6ZqRKreq7X
	eo2vLUAhx//OCTLVzeU5iIItMwtwQVLorpWuzVDW67Bw5Y6xpKj0YnHClQobGnmY1f2EEIHA/mGmr
	jY/ScGJKE8csjVuJxaINl5IYCy8JLuVczi5c5bgraXQJSdUl7WVigz8yCGTWnCGdRuVxEyeEgYb2X
	L8DAsB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1VU-00000006pMn-2o7C;
	Wed, 28 Oct 2026 11:07:48 +0000
Received: from out-235.mta1.migadu.com ([95.215.58.235] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1VS-00000006pMS-24WZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:07:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Pg95Y+xFHx1ZIocuSPAyjynJpdUBiCDULSiHROnP0Os=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185664; v=1; x=1793790464;
 b=JbcWMaMviRNJd8kBhaAtmLnWIDfterzdjIYllNK0xeavjxLbiYJigDFfLD4lnLenqGBmg2Lu
 6yi6fwWuojUcQRLIJIfxP2O7WheAQYb7kHPt+Ckh2WrDB0scnRejCZqMW7mzMP7kVjq4rr2fNRI
 j9CMEK6tunROWqpFNsf898ik=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e69cc8713850fd5b;
	Wed, 28 Oct 2026 11:07:44 +0000
X-Mizu-Trace-ID: e69cc8713850fd5b
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
Subject: [PATCH v2 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Wed, 28 Oct 2026 11:07:36 +0000
Message-ID: <20261028110739.2366566-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040746_679509_561249B4 
X-CRM114-Status: UNSURE (   8.20  )
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

Changes since v1 [1]:
  - Gate __pmu_stop_host_counters() on system_supports_pmuv3() rather
    than v1's per-CPU HAS_PMUV3 flag. (Marc)
  - Collected Vincent's Reviewed-by and Tested-by on patch 2. (thanks!)

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

[1] https://lore.kernel.org/all/20261027081147.498183-1-fuad.tabba@linux.dev/
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


