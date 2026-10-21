Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B486606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KVXd91+H;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a8A2Q5uE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zRu4spBthg7fz/wTpeQjsyF6+hRLpSrvVHTyZtMUl3w=; b=KVXd91+H8BlImTVNFGvyW2QopF
	ng00Up0EBlDxYBq47iad8/9nsLC7FcQPXKffiZsJi+BcxbtWppfcen9DkOjFowN288taVGRqDfaJU
	HNNslYl3XdPnH2mqPhn9Zw8J4tgbNHvjL/eoKVF1+qrf58o96OxKKACqfR6LI3jzu2sWySNzhkapC
	+7f29WhD0VnGVzkrG/6t12i212awdueUwlxnAUmHgUG20QUcntTdwd3E+XIo5GZYTDYw3KiiHF3Jx
	KwcBl+6YAqBIcArk5X9GUnzRcffsOpa4rNHURRaH9DgaEJ/f68AtDsjZuefDohw1RmhSAUGixEKRH
	SU1SN/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRaZ-0000000BKFc-1a6a;
	Wed, 21 Oct 2026 08:22:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRaX-0000000BKF2-0mBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AD871596;
	Wed, 21 Oct 2026 01:22:16 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C533F7B4;
	Wed, 21 Oct 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792570939; bh=AMqPkWKzj1+68mhTDS/Hj4pDsMMWxqm4w8Yx3mtFTGA=;
	h=From:To:Cc:Subject:Date:From;
	b=a8A2Q5uEeYc3MBqt9ou/y584mD9rIEgzEi9SUGxVz7OxdpAVf94wmadF9JGKgAUtY
	 WAOqkTXCjzzQ+Ef4jhnP1HcYCvxD7BoQ8VXkwahlOKtuVDKPKM4qjunk9QlIlwAqGw
	 HgUjxBi5rgF/vGCGX0p5Se8PP6ua7DkVJJvgVmLs=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] KVM: arm64: gic-v5: Drop unused addr variable
Date: Wed, 21 Oct 2026 09:22:04 +0100
Message-Id: <20261021082204.1494581-1-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_012221_271052_4D902317 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vgic_v5_has_attr_regs() assigns reg_attr.addr to addr, but never uses
addr. Drop the unused local and assignment to avoid a W=1 warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610210232.uzFGXnjw-lkp@intel.com/
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-irs-v5.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
index 1874c3c289a6e..8d0ad74ebc64a 100644
--- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
@@ -1134,7 +1134,7 @@ int vgic_v5_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr)
 	const struct vgic_register_region *region;
 	struct vgic_reg_attr reg_attr;
 	struct kvm_vcpu *vcpu;
-	gpa_t addr, offset;
+	gpa_t offset;
 	int ret, align;
 
 	ret = vgic_v5_parse_attr(dev, attr, &reg_attr);
@@ -1142,7 +1142,6 @@ int vgic_v5_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr)
 		return ret;
 
 	vcpu = reg_attr.vcpu;
-	addr = reg_attr.addr;
 
 	if (attr->group == KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS)
 		return vgic_v5_has_cpu_sysregs_attr(vcpu, attr);

base-commit: 678f16b6e4767096aa3e3e6eef60e981b3f61e12
-- 
2.34.1


