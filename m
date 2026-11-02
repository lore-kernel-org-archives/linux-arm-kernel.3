Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028860A5BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQErLf4A;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AyNUsiyW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LWyZ1UkaDVoP3VWJmfwDCKmpQUjYhiraBCsKNKTFD9o=; b=IQErLf4AYgxaKW
	s8VnJQ/f0Sl4SRETwd2V+FD4ujjxNjarVYFEGHVWzYg+WsEaeu3gUdAZY1IOzwD5jGXoc1QGClHe/
	Fm0USToVhEGBGX3Sv3c4tHYARNkeEYFPjTy64HNaLwt+fLhmDKr0Ba6JsjxOk96bOc4D4t8yMKVAW
	oRn+cdnUPuK7oljiF4pxFRQdyEqdF6IyZxGT5e859G3qjw8zmnujSUtuNB21vCE7TsuLVoUrH+eq/
	BD6O3A2UlykBGYJxXLtqA+UaNK62hRIxiI2HBBS0/XL5ZIMpH7J+ojQTKdMfrFc76gECIs5Urqs4S
	lKcnKRS0uz/1DvAQ6tpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrgw-0000000GYc9-2nAv;
	Mon, 02 Nov 2026 13:03:14 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrgu-0000000GYYb-1Nji
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:03:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DS9B5U4J+iTHwDTvPcTcDhDaIW+dVQnOIDk5Q84LEB8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624590; v=1; x=1794229390;
 b=AyNUsiyWPHUvVlLm0Ch+hskD0hLC+FTCjlnZY8sp3N9AFrVOsYilvnhDTRAL5FSwum5dJGyC
 aXwJ0D5Gv0OUNQfdN1xo0hajYpoR9LqRXlOf0FwMg0R45SA1PmmYtY/4J2dajfX0I/PFLUVuHhb
 eXnW07vHhxA+dayiKJfaxGT4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 28a34c058c471d7f;
	Mon, 02 Nov 2026 13:03:10 +0000
X-Mizu-Trace-ID: 28a34c058c471d7f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] Documentation: KVM: arm64: Describe the ITS hardening
Date: Mon,  2 Nov 2026 13:01:33 +0000
Message-ID: <20261102130133.3684226-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050312_506816_230549FA 
X-CRM114-Status: GOOD (  13.47  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the ITS hardening to pkvm.rst: why the hypervisor emulates the
host's ITS, and how protected mode differs from non-protected mode as a
result.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/arm/pkvm.rst | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index b75bb8ad6f26d..1ebae35f8373e 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -89,6 +89,38 @@ DMA isolation using an IOMMU
 
 Status: **Unimplemented.**
 
+GICv3 ITS hardening
+-------------------
+
+Status: Host accesses to the ITS control registers are trapped and
+emulated by the hypervisor. The LPI configuration and pending tables
+remain under host control.
+
+The ITS reads and writes memory at addresses programmed by the host, so
+the hypervisor emulates the ITS control registers and command queue to
+ensure that the host cannot use the ITS as a confused deputy to write
+to hypervisor or pVM memory. The command queue, the ITS tables and each
+device's interrupt translation table are owned by the hypervisor while
+the ITS can access them.
+
+This gives rise to some user-visible differences when compared to
+non-protected mode:
+
+* Protected mode requires the hypervisor to take control of every ITS
+  in the system: KVM does not initialise with more than 8 ITSes, and
+  if the takeover fails the host is not deprivileged and
+  ``KVM_CREATE_VM`` returns ``-ENODEV``.
+* An ITS command or register write that the hypervisor rejects is
+  delivered to the host as a data abort.
+* The number of devices that can be mapped through each ITS is limited
+  by the hypervisor, and MSI allocation fails with ``-ENOMEM`` beyond
+  that limit.
+* Interrupt translation tables are page-aligned, so each device
+  consumes at least one page.
+* GICv4 is disabled: direct injection of LPIs is not available to
+  non-protected guests, and a guest saved with ``GICD_TYPER2.nASSGIcap``
+  set cannot be restored (``-EINVAL``).
+
 Proxying of Trustzone services
 ------------------------------
 
-- 
2.47.3


