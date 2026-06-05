Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855ECCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/7aEgcQIEioAu5+XUU4oynfCe91W19NKc1VGRlFNKc=; b=Adz68kroqLyC4fQO2KRCYN6hIC
	8ncCHuYvBhif/JzEZO6ZeqERo4bt1QmzOTHp9eVg0lQoIEFygnP548Ib3d9+zm8XJOkzYb1kN0YUc
	9SZIjY4WExNdtw7Q8c/UFyrhWLs46qgY2jr8UVO+JR15eunAtoQ56Am3ADakUTnqENCgcSdk/5HJq
	qNEkVyJ4U4giXBRLedfbWCuQvXLV3OhS8RjCnInwvzYfsP7G0RlIla1lcIJJkWBJi+oTHxcAcwLzf
	9FgVrIf7rVsihA4XUk6Av35fl2x2roP8I0H54DFQuqNMINsBBKb1cSEhVi+4sb0vFcE/AGwRDbv3a
	VXTBNZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYW-00000000pZZ-0t5J;
	Fri, 05 Jun 2026 15:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYT-00000000pYE-2DEM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:33:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CD893297;
	Fri,  5 Jun 2026 08:33:45 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C373F86F;
	Fri,  5 Jun 2026 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780673630; bh=cJZsMWwAthFAD+EfG9pOv5vX8VDeNvwWNRcwfK6nxt0=;
	h=From:To:Cc:Subject:Date:From;
	b=Vrd/1ldlMKg1nW90t60ZpKirXZGIwzjv/XJfW03+uMnfda0YDB3AXgH8UdEehyn3/
	 o43oLDBBCnrv4SBXFheZPiMAfcBXZJbT0LIKzYfHevxH3icxyYYpCeY+Yts1pFOHyo
	 pSLTsMDXY7yly3I+vGm718BzpsEUpKVX4rx717tM=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 0/2] KVM: arm64: Small dirty logging fixes/cleanups
Date: Fri,  5 Jun 2026 16:32:46 +0100
Message-ID: <20260605153248.2412064-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083353_680956_D6D127F0 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi,

These are two minor fixes/cleanups I found when reading the code.
Although the diff are small the first patch has some implications.
Please view the patches for more detail.

Thanks,

Wei-Lin Chang (2):
  KVM: arm64: Replace memslot_is_logging() with
    kvm_slot_dirty_track_enabled()
  KVM: arm64: Remove superfluous aligning of gfn for dirty logging

 arch/arm64/kvm/mmu.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.43.0


