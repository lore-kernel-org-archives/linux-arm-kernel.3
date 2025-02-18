Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C40C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ec+invD4pmWybvpqHuAJa8iilHdNXezPA/9XfsZxQE0=; b=kI6iWkHADIQ5TE5W8usVzQXBZp
	tvojSyDQ8+r1lD67w8ppgA0JHIwLCQYY91XBno48TUIYDhlXMSzqTSwpqxyMryjQgIHgMgBi9oARB
	098HIxZdbDI8WYZWfTRKVzyFgllVOwxQG9mqFNMPatCD1kmkv0QD9kjDTzWKGzjA9ziz50/w4gVkO
	tNU/SvUqotY6DOLiToiHVY8zdB3PBd6cu+ZMohEdB6Brup4Umd1zdVrgOfVENzkgiIOi8qds9I+Ee
	D6pmG/X9UDDHgLawXkblkRCfxMxAIw3OV96Z51/Ni6gxDHFJ/iLrBhoXcr+6DRrcaHjhk7VkvEDb6
	/JF/3Itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRDT-000000097wP-25Jr;
	Tue, 18 Feb 2025 17:17:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRBz-000000097fm-0FWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:15:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939FA152B;
	Tue, 18 Feb 2025 09:15:46 -0800 (PST)
Received: from e126864.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05A073F59E;
	Tue, 18 Feb 2025 09:15:25 -0800 (PST)
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/3] arm64: Use memory copy instructions in usercopy routines
Date: Tue, 18 Feb 2025 17:14:27 +0000
Message-Id: <20250218171430.28227-1-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_091531_136143_7BAF5204 
X-CRM114-Status: UNSURE (   8.57  )
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

This is a follow-up to the series using CPY/SET instructions in the kernel's
memory copy routines [1]. This series extends that to the usercopy routines.
This required some additions to exception fixups since a CPY instruction
accesses both user and kernel memory.

Note that this conflicts with Tong's series [2].

Thanks,
Kristina

[1] https://lore.kernel.org/all/20240930161051.3777828-1-kristina.martsenko@arm.com/
[2] https://lore.kernel.org/all/20241209024257.3618492-1-tongtiangen@huawei.com/


Kristina Martšenko (3):
  arm64: extable: Add fixup handling for uaccess CPY* instructions
  arm64: mm: Handle PAN faults on uaccess CPY* instructions
  arm64: lib: Use MOPS for usercopy routines

 arch/arm64/include/asm/asm-extable.h | 10 +++++++-
 arch/arm64/include/asm/asm-uaccess.h |  4 ++++
 arch/arm64/include/asm/extable.h     |  5 +++-
 arch/arm64/lib/clear_user.S          | 25 +++++++++++++++----
 arch/arm64/lib/copy_from_user.S      | 10 ++++++++
 arch/arm64/lib/copy_template.S       | 10 ++++++++
 arch/arm64/lib/copy_to_user.S        | 10 ++++++++
 arch/arm64/mm/extable.c              | 36 +++++++++++++++++++++++++++-
 arch/arm64/mm/fault.c                |  6 +++--
 9 files changed, 107 insertions(+), 9 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1


