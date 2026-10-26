Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLIIPkTo;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yug95bfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6sX1ckCkCo0C9crGPLuXV3itI4WluLyfMysqHfXOIc8=; b=nLIIPkToxF5t3R6lsaaduqq/xh
	WIrmM9OvQx1nG9/W1yeB4ieVLKXxsfunEp4vJjUf8HEFIU5gTe7FlEws8a1I2jGVlObDWgsl2folQ
	/azSj62FvPSd0ZBYqXCGjLIuGmfryC4w2Sv2wkGprV9iaQX9prC3wTqCgeIcotOAjUiJ17+UNMNqP
	mjcWwYPOQy5/heQR8NCTXYFwM5h6V7ACNZA1didkIIs/rZJcE+U7WWxDJRuzVYSUIbKqGnq3ZFA4J
	1OBbNHKZy6aXx7kzBkFurIo2Jc1OJeA1QgkQthfRfQtbk09z0Jo/1sddQZ5Cl9ahVTIBgZEUGqbDn
	kWrooVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMb1-00000002l3z-0aGd;
	Mon, 26 Oct 2026 15:26:47 +0000
Received: from out-66.mta1.migadu.com ([2001:41d0:203:375::42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMay-00000002l3c-0NfU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:26:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=s46YFljZH4peYcKfdSw0ukYEvKh0IVavDFv9NTBlyqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028402; v=1; x=1793633202;
 b=Yug95bfyhInIBBLxd8u3eOeUaRUZqKDFTlAV245v9MCfpVidsG9MXF15Tx24oWy50Mg1BJkh
 V0TMFYqROCTeGQCVJ3V0OBA0bbduJ0VkrglxqpiOGhozxi1/5kfGZmon83H6SE8PJdBGObF1qqY
 1cJJ1un2J85n79Im7RnTVi8s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c79fc02862921bcd;
	Mon, 26 Oct 2026 15:26:42 +0000
X-Mizu-Trace-ID: c79fc02862921bcd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic-v4: Don't allocate vPEs that a VM can't use
Date: Mon, 26 Oct 2026 15:26:37 +0000
Message-ID: <20261026152639.3926498-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_082644_283931_2AD969A1 
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Two fixes for vgic_its_create() allocating vPEs for a VM that never
uses them. Nothing frees them when the VM is destroyed, and each
doorbell handler stays registered with a freed vCPU.

The first is for a GICv2 VM, which KVM can run on a GICv4.0 host whose
CPU interface supports legacy operation. The second is for a GICv3 VM
whose VMM cleared nASSGIcap on a GICv4.1 host with vSGIs.

Tested on AEM FVP, with has-gicv4.1=0 for the GICv2 case and =1 for the
other. With my reproducer (clear nASSGIcap for the second case,
initialise the vgic, create an ITS, destroy the VM), the kernel without
the fix leaves four "vcpu" doorbells in /proc/interrupts in each case,
and the fixed one doesn't leave any.

It doesn't conflict with my vgic init error-path series [1].

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm-7.4).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921072958.2918477-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
  KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears
    nASSGIcap

 arch/arm64/kvm/vgic/vgic-v4.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


