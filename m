Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608C4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFf5JB4GdDQKdk++SQl6a7IcUSmGGEsafQltb6JfXEw=; b=xQ/9zJmJeiw95BRfifoR5/nlA1
	2vuUyJJlbU2bCUyq8Yv/wEmO2KIxZhyA/cp1curSKm5/hiuGOsl5Ajn5WVDHl7doDK86yClnTMGzp
	xqYDUM8Xz+nPAER7DQdk7tAsHm1FnDyZKPK+ZIKm+t8icQLjaQw7zu4MNI7fZLhuOb3JAQxhMqRFr
	IHyyrrRQOFe/KAuVYhyyy9jYKvlP/qgQXSlLs/j3RVb5cPUPvGX6tCB4k85ZIN4zmWc+coYy3dHrb
	3H2jgZEhufKhir3DCWSPpnJoMxDkbYquwCU4SQCl6EQVpf149Pzd3MMfl1UNADjEzNTaTnF9MeMrk
	VsS5HR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW28-00000002TzF-0yYI;
	Wed, 22 Oct 2025 10:25:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW23-00000002TwZ-1HRj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:25:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE441063;
	Wed, 22 Oct 2025 03:25:16 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3727A3F63F;
	Wed, 22 Oct 2025 03:25:23 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [boot-wrapper PATCH 0/4] Enable new Arm architecture features
Date: Wed, 22 Oct 2025 11:24:59 +0100
Message-Id: <20251022102503.2878048-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032527_384586_6347138F 
X-CRM114-Status: UNSURE (   4.61  )
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

Some new Arm architecture features introduce new system registers,
access to which is guarded by SCR_EL3 bits. Since the boot-wrapper has
no interest in trapping those accesses or deny them, just unconditionally
enable them during initialisation.

Please have a look!

Cheers,
Andre

Andre Przywara (4):
  aarch64: do not trap MPAM register accesses
  aarch64: enable access to FEAT_AIE and FEAT_PFAR features
  aarch64: enable access to HACDBS and HDBSS system registers
  aarch64: enable access to FEAT_RASv1p1 system registers

 arch/aarch64/include/asm/cpu.h | 15 +++++++++++++++
 arch/aarch64/init.c            | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.25.1


