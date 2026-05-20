Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45694CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUGv8oIgE91WwfwK6ezX3xvVxWVU55LwkhTCXk2cXTo=; b=3I54nkwl4+l4AJFIKEU9kACDUB
	V558k3EORAUAJjvToRfSw6Q6wAL49j0/xEZPobs/Z7YcaES39yBp3haVVBc4awQ3NleLunwX5vtEy
	xm6gJcIUKq5f5HQ6QejrvA/W9VqtyFQidbukqzgdsnKTrQsO5/0NH/9DlaAxHox6DAIOQBPkpFHuU
	YgPBd+Plmsb4NGrvrKvgm/lfYARL6a8UXsRVM3sVMKQ1q7j20sCFhytJoYEO/XTlikdQ3uP6bLAy7
	oei7FJod0f7m/bnnIQjY5iao1xo3Flf5NoUGQtETPSJNuR0l3Yc7kjXi9t/wAv/BOmXMNiDs9ZcaW
	fRwZ6Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcdk-000000041Yx-03QS;
	Wed, 20 May 2026 08:50:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcdi-000000041YH-2CIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:50:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 917FE600CB;
	Wed, 20 May 2026 08:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4526C1F00893;
	Wed, 20 May 2026 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267053;
	bh=dUGv8oIgE91WwfwK6ezX3xvVxWVU55LwkhTCXk2cXTo=;
	h=From:To:Cc:Subject:Date;
	b=lyr7vTrzuEUPWYUQ1jyu+OJJxxIVAGUJcGTeWIUwu3vddGICaHXpzg9T3BiSnU50T
	 MtXziZRZWx/SPAc9D9F42VyHthyOkdUPnbEdaao+2R3OBi2iP0tcTcAfs3bQ474Ikn
	 Viy48D6BATML9M42plqZn1GdvEKAYSKYYDMTGY/XyjiuSP+Y6WSGo5DHzyib7g6g7x
	 c0QMunuEebH8hZTdwnD5tnJPbFe6oIIQxlHCyDFDvyjhMQaIc5v1PmKra8jdDcQk+u
	 UOPjDQQoapoIBC+yVngONgJO7ebB/H3UxH9nivfUvZ9toMLdAEbTyqSlfKXdRRxzd6
	 L23gHqJDnDclA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPcdf-00000004Hno-0fBo;
	Wed, 20 May 2026 08:50:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: nv: Reduce FP/SVE overhead on exception/exception return
Date: Wed, 20 May 2026 09:50:34 +0100
Message-ID: <20260520085036.541666-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, mark.rutland@arm.com, will@kernel.org, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

This is the second version of this short series optimising away a lot
of unnecessary FPSIMD/SVE context switch with NV.

* From v1 [1]:

  - New commit message on patch #2 (Mark)

  - Additional comments and WARN_ON_ONCE() (Mark)

If nobody screams, I'll stick that into -next.

Thanks,

	M.

[1] https://lore.kernel.org/r/20260512140755.3676306-1-maz@kernel.org

Marc Zyngier (2):
  KVM: arm64: nv: Track L2 to L1 exception emulation
  KVM: arm64: nv: Don't save/restore FP register during a nested ERET or
    exception

 arch/arm64/include/asm/kvm_host.h |  3 ++-
 arch/arm64/kvm/emulate-nested.c   |  4 ++++
 arch/arm64/kvm/fpsimd.c           | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.47.3


