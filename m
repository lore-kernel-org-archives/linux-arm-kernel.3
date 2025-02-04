Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOTq4qmB/Z3rKSvq+kobPiSLz9L5NIqUP+zFAbsLh0M=; b=MRICehNyqWQxWdu1oKM4NtTRk4
	2lo6e+pY0o1XqSm4oJaoIqR8OP5UJ79oE67Y6IBIQeeT8zpXNDa02ZZlw3E2aoZkHftM1lz5vCSun
	3q9HBtTsChEo5TGBTGw7EFgr9qtUYTJo9Cl9BOq5RYV3SDs3cS9ju+W9TlHVbRsU/6zXSMRcqBAOC
	yNsvFvTnccVbDpMVXutjBB4vdrmGxvu4uD++i+214NGufTP1VhirgEcg5dvugu3dz50L2+ta7v7nA
	/Xd9QqFRi+d0W0QdjtZVD46L4HuOmLiwcGc5vt+iule90z73nw6B19Jt1BVIiLXJ0NOmDzIghKFvn
	MCjoXb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGh9-00000000DEc-2MEf;
	Tue, 04 Feb 2025 11:02:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGfp-00000000D9J-1sAG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32583A41F6E;
	Tue,  4 Feb 2025 10:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23CC4CEDF;
	Tue,  4 Feb 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738666856;
	bh=m3XU/Fd2NXLsQavBCf01CsTad7U67r4p4e0+aklnsn8=;
	h=From:To:Cc:Subject:Date:From;
	b=sG7y73GVRTCxBxQ7IoK72vPhD6dQYXS2oWeStvcbgwPj5VUiKyFcEjM7I/iZkESdW
	 53ev1yzy4HTfoRiJwZ2zDUjwRwZiKRFBzVfrEQJdo4C1axjfaXAd28xBcdTO6ZQET2
	 NjhSShqhCLjCdCLDHTI/V78gjAl1EXkG7YdKlmCrFMuVN7SILfrDYfaYUpfS0mQuS1
	 YgOIz1d3VKsICbDjtsVR5cd9wb23m56KIaj67JaL3tV2Im1u0vf/qJyMsLEdBu26u9
	 Dfz0hdYRGQW+ku+TbYbBKv+Y4fxbhiuM9KPMfzbtMHqzsp+wm6IvsDzhsBJrdZwD2w
	 Fsls+9LDZWLUA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfGfl-000OVe-VH;
	Tue, 04 Feb 2025 11:00:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/3] KVM/arm64: timer fixes for 6.14
Date: Tue,  4 Feb 2025 11:00:47 +0000
Message-Id: <20250204110050.150560-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_030057_548184_01B9AAC8 
X-CRM114-Status: UNSURE (   8.51  )
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

It's been recently pointed out that the NV timer code that is
(hopefully) on its way upstream is marginally sub-optimal (read:
terminally broken). This short series attempts to fix things:

- Correctly arm a background timer in all situations

- Avoid corrupting the EL2 state by shoving the EL1 state into it, and
  simplify the handling of emulated timers

- Drop the weird HV timer offset dance dance on E2H switch that never
  happens and make HV timer correctly UNDEF on E2H==0.

Thanks to Volodymyr Babchuk and Wei-Lin Chang for their help.

Patches on top of kvmarm/fixes, and merged back on top of my
kvm-arm64/nv-next branch.

Marc Zyngier (3):
  KVM: arm64: timer: Always evaluate the need for a soft timer
  KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_ECV
  KVM: arm64: timer: Don't adjust the EL2 virtual timer offset

 arch/arm64/kvm/arch_timer.c | 49 +++++++++----------------------------
 arch/arm64/kvm/sys_regs.c   | 16 +++++++++---
 2 files changed, 24 insertions(+), 41 deletions(-)

-- 
2.39.2


