Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F4BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5nYEuEHetJaYS/wsB7dUCYJ99YTlt2b/K2HrzA8zt2E=; b=fyVIe5Wa2qW0gZ45sGHSUPDcat
	HrPh15fth7uUd7woHDupjHvcSwNxjyMN80tSyM9axIyFjGPWw80OVX55+mBoknmB7Sinytqvu3E2A
	GHqKnOw2WPY86cAP51oyOe309xp8KADvtlKmXQofHwvlhSplEeuV9FYHZx8wahLpXpahhpu9B9Gel
	DJ+k/PM0OsWqXUWIy8NsX821P9RMXzvt66dtXeOSVZXZ6bjim5vavbBtrSHEcbwENiHJzonli5jrX
	JFvIFaAbB93bSqnB8fTn+fQscXM1SsDRGeVgeMiLP6ZU5SRqc1h0OLOEZTKXTW8BmRn9XMjXfpqkV
	wDBYfaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7q-000000001tZ-2nSC;
	Thu, 13 Aug 2026 07:45:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7q-000000001tN-1Gk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:45:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9D8F40E36;
	Thu, 13 Aug 2026 07:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564C01F000E9;
	Thu, 13 Aug 2026 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607117;
	bh=5nYEuEHetJaYS/wsB7dUCYJ99YTlt2b/K2HrzA8zt2E=;
	h=From:To:Cc:Subject:Date;
	b=izd5rmAbVRl5xG+TWj8gdsSAL8bqhLaOU0ROhKiYvWdd1s69rEdS+Cn4hSsHE0MYD
	 iQzLT4QVj0rkgIRoHg67IQT+ifyr9DzL6QTOe1Bryy3RCtnK3T3d75iQHLlhwCOlvU
	 iTj7GcaTse0qQdGBCRdsBq7/dmWnHkPCaft7WfJ2VUX50H7vTQjCdtjVgZju21XMKG
	 BmEAgNZ2eJBbgSsvh4p1YgqHrbHKK+k7WmeKpKu0OetNs7rdCxKYFMoFCcBCil6GdO
	 c0oOsfc3uPYfQ1Qxadeqgd611AmgHIJ0x1JyEhvHern4TQPxrfthCMQiypRo4ZKFjd
	 bvS6HvolxBryg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 0/3] efi: Simply DT handoff from stub to kernel
Date: Thu, 13 Aug 2026 09:45:07 +0200
Message-ID: <20260813074506.643472-5-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=ardb@kernel.org; h=from:subject; bh=MmFnoyH6IBM5J1QaHpDDaxU2xgzbd3BB99dcCccK0w8=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIau2jFnQTFzk7q7r/v83MoTFVHJ/mmk/p7xl7tOH01b+3 WC9qYC/o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk411GhikqBUIM9xafuh4b 4X1I++7KfzF/t1j1cq8sFdf+pvL0wi+G/8Fsfe+drC0epYVzf9OLZyxc/2Om8bfZOXIvgm98lJ5 xlQkA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
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

Currently, 4 separate DT properties are used as an internal ABI to hand
over the EFI memory map from the EFI stub to the kernel proper.

This information is redundant, as the same information is already made
available via a EFI configuration table.

So replace those 4 DT properties with a single one that carries the
address of this config table, and make it optional, so that it can be
omitted in cases where the kernel is able to locate the table directly
via its GUID.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev

Ard Biesheuvel (3):
  efi: Turn boot memmap handling into shared code
  efi: Pass EFI boot memmap struct address to core kernel
  efi: Make the 'linux,uefi-boot-memmap' DT property optional

 Documentation/arch/arm/uefi.rst    | 10 +--
 arch/loongarch/kernel/efi.c        | 10 +--
 drivers/firmware/efi/efi.c         |  4 +
 drivers/firmware/efi/fdtparams.c   | 77 ++++++++++++++++++--
 drivers/firmware/efi/libstub/fdt.c | 40 +---------
 include/linux/efi.h                |  3 +
 6 files changed, 84 insertions(+), 60 deletions(-)

-- 
2.47.3


