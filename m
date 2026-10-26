Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yXYEGi70;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jHgz+9HG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x2kCiKkeOScUv4vRg+ADH3IUUv29+dTbC2OT5+HKXDc=; b=yXYEGi70OvYHg6xBpb8oCGQ0N5
	wbPSkyac4huhRd/mM/47rODD3YVlSdmeRTEEcqmZe9QcLZCrEPww4AU07svOAPjkCaOOJU5nZlQmA
	OhzM8bv1mWb17dQnHqYC/TSNIuMwcP0S5/oNa5UMDyjC42eJMR+teXWFwW/ixH1D6+bImzm23Viv1
	CiQpdyash6Wvhhd9fI/4OK6Y0K7plYoWhDFy/YUz0NVySNTC9a27U+aWudzvtEK5fLN3NNz/gJF42
	JTHF5ttGDHTmg9XyZ1ZN01jbw5Y2IN8MXfeYgpy3fgE3SS3jupPKWfa+p4U340gGEKwkY5AObeAJj
	jzPHfnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH09-0000000242D-28pI;
	Mon, 26 Oct 2026 09:28:21 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGzx-000000023zn-2k30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:28:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8LYCyZMI/ydZ4XMUTIjdTOfkLiQ3ZW2NdQjMgtJy9r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793006887; v=1; x=1793611687;
 b=jHgz+9HGTK4xRN3DP7+8+Rb/pGUvSwYzPf7AvOFunZwinQwGQWams5T09sZU34UMrOIH7CiM
 W4+hO0O8/0MsyHOCpUQLai1ocniUUAQctYGrmxkwZIAbsytL+V0BWCvnB8sqvpjgVkmj4h0dKqm
 mNlwVKyYrbNcQvN9ubAmc0lA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 312a495375034eab;
	Mon, 26 Oct 2026 09:28:07 +0000
X-Mizu-Trace-ID: 312a495375034eab
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic: LPI fixes for redistributors with LPIs disabled
Date: Mon, 26 Oct 2026 09:28:00 +0000
Message-ID: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022818_412028_21D0F428 
X-CRM114-Status: GOOD (  10.50  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Two fixes on top of Marc's cross-CPU vcpu pausing series [1], for LPIs
whose redistributor has LPIs disabled. Without them, the guest can take
such an LPI with EnableLPIs clear, or lose one mapped before it enables
them.

The first is the vgic_target_oracle() change Oliver suggested on v2 of
that series [2]. It stops an LPI from being queued to a redistributor
with EnableLPIs clear once the disable path has retired the vCPU's AP
list. With that check, the path has to pause the vCPU before clearing
EnableLPIs, so that the retire still finds its LPIs.

With the second, an LPI mapped while its redistributor has LPIs
disabled keeps its pending bit when they're enabled. The second relies
on the first to keep such an LPI off the AP list until the enable.

Reproducers for the INVALL case in the first and the map in the second
fail in every run without the patch and pass with it.

Based on kvm-arm64/cross-vcpu-sync as merged in kvmarm/fixes, which the
first builds on (e99ff76f4a02b; also applies to kvmarm/fixes
309e1d2215255).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261015100539.1011760-1-maz@kernel.org/
[2] https://lore.kernel.org/all/asf87i2RDh-WksL-@kernel.org/

Fuad Tabba (2):
  KVM: arm64: vgic: Don't forward LPIs to a redistributor with LPIs
    disabled
  KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs
    disabled

 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 31 ++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic-v3.c      |  3 ++-
 arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
 3 files changed, 27 insertions(+), 19 deletions(-)


base-commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d
-- 
2.47.3


