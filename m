Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4EBC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 01:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aQ15qGlUaptB7o2KXAcGTjz0KUPJ/e9c4/mMMMjkWT0=; b=WepsVVv+wmAva/8dP1OtRvc9Jc
	FtP+jQgRaxLW80xAWD9ozdBxLtcic6+W7V/dwUss01m5OPAatRnLo2WCdq5fYCmn88yu4Qq+ULI3l
	wWFpFuDvk1mqo1p/vfDQkngm0K5WgqjRL3R2dBxOA1QPCeWrMC7p4IoHEn3B5vKIkdEn8CYzWKh0q
	E6Y4bQSaadf1YYE7f9AtXKP5Y5NtU8onVz4b4qj7j5Kc1js9GjgVTL7tSvNnfbsAWi/u1BroDO+ph
	2DWdt8ih9BHlPjXoI12WSvVLJEaKVUPGm1dSDjafdsYsUiVw1QWCpUNW8gyY2Q4H1lXJN/jNqtd+V
	83PFTmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2KVF-00000005s34-2d5W;
	Wed, 09 Apr 2025 01:45:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2KTR-00000005rZ6-0ulM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 01:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744163007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQ15qGlUaptB7o2KXAcGTjz0KUPJ/e9c4/mMMMjkWT0=;
	b=QbR060xgVP+aYZjO1MyUo/iWWZzLuP+9zpnrATKzPzGoXWkLV+Q/pDDujvAbI7R8xgqkuk
	wBcz62eKtWat7jcdh48YnlxrAUt174vTS2/+PhAnXSrdCYzuQ5OhwErkgTJTObagluaJWv
	RdRyYCJfJJeNlKxcHX2U9CBcHpZiKsM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-BxhD3ttkMn6I5gCM8qizgw-1; Tue,
 08 Apr 2025 21:41:55 -0400
X-MC-Unique: BxhD3ttkMn6I5gCM8qizgw-1
X-Mimecast-MFC-AGG-ID: BxhD3ttkMn6I5gCM8qizgw_1744162908
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67A651800259;
	Wed,  9 Apr 2025 01:41:45 +0000 (UTC)
Received: from starship.lan (unknown [10.22.65.191])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22646180175B;
	Wed,  9 Apr 2025 01:41:37 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jing Zhang <jingzhangos@google.com>,
	Waiman Long <longman@redhat.com>,
	x86@kernel.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zenghui Yu <yuzenghui@huawei.com>,
	Borislav Petkov <bp@alien8.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 0/4] KVM: extract lock_all_vcpus/unlock_all_vcpus
Date: Tue,  8 Apr 2025 21:41:32 -0400
Message-Id: <20250409014136.2816971-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_184329_367696_CE6A6CF0 
X-CRM114-Status: UNSURE (   8.48  )
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

Implement Paolo's suggestion of reusing=0D
sev_lock/unlock_vcpus_for_migration in arm and riscv code=0D
for the purpose of taking vcpu->mutex of all vcpus of a VM.=0D
=0D
Because sev_lock/unlock_vcpus_for_migration already have a workaround=0D
for lockdep max lock depth, this fixes the lockdep warnings on arm=0D
which were the inspiration for this refactoring.=0D
=0D
This patch series was only compile tested on all 3 architectures.=0D
=0D
V2: added trylock option to kvm_lock_all_vcpus to be better compatible=0D
with the orginal code.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (4):=0D
  locking/mutex: implement mutex_trylock_nested=0D
  KVM: x86: move sev_lock/unlock_vcpus_for_migration to kvm_main.c=0D
  KVM: arm64: switch to using kvm_lock/unlock_all_vcpus=0D
  RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus=0D
=0D
 arch/arm64/include/asm/kvm_host.h     |  3 --=0D
 arch/arm64/kvm/arch_timer.c           |  4 +-=0D
 arch/arm64/kvm/arm.c                  | 43 ----------------=0D
 arch/arm64/kvm/vgic/vgic-init.c       |  4 +-=0D
 arch/arm64/kvm/vgic/vgic-its.c        |  8 +--=0D
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---=0D
 arch/riscv/kvm/aia_device.c           | 34 +------------=0D
 arch/x86/kvm/svm/sev.c                | 65 ++----------------------=0D
 include/linux/kvm_host.h              |  6 +++=0D
 include/linux/mutex.h                 |  8 +++=0D
 kernel/locking/mutex.c                | 14 ++++--=0D
 virt/kvm/kvm_main.c                   | 71 +++++++++++++++++++++++++++=0D
 12 files changed, 116 insertions(+), 156 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D


