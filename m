Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B916ACA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6sHe97NS4N8HlN6yP/FaM74H6fT/5NAwVOsKoJldAnk=; b=dZXVjB1H9AFNuzfDoN/wmXgudd
	i74YERF1CqZgkdkMVcDjQDYMnTHA5ZitRooQnOFjhezx7RQQaQ0l/hFBNAgIaQP3c5BtAqwR06C4X
	+FvJV/5KMp/JXmIh/HMIfix43D9vgqW1FTErmpI8w8KNK9H8vDkul2iMAzszCjPEzqTl4Ah25m2If
	TYyFQSv12yxDOZRlUBHg8sd3gKp7Bw1EGC79jvU1xSxlDxH/47Nkp/BIxf/Vk5k6HQq3vo9vRM+k0
	67iY1ii2icD78l28Zu7t8mVrpRIOgj8CEFvf7LQwTCSK8JOFBZhZgBNsuxmwIf8FOcgT5s+eZKYk8
	abJqUP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyK-00000007HCQ-1N4k;
	Fri, 09 Oct 2026 22:21:48 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyH-00000007HC6-0VQ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:21:46 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6sHe97NS4N8HlN6yP/FaM74H6fT/5NAwVOsKoJldAnk=;
	b=HxwTJ5PJDnUoHVedy44Lts3AjlG3zALCp6AE/l6cxXOy2arkSJAB2RTtM/vDvnb6W50wvQ
	x4lBlNFDOPHbNt7sr14CBpdvb3gTLAZYcnelvaVFUS/TJxo3leaympJymrZKD1lvmLvz6p
	ERvC343f6uKIcVeWF6Gr6dTDObV3jRbuDgOnoeTUoQ64NjtM5k4a1Sd2xKWQ5dZh01PrQZ
	/I06YhJNicpnKPlVFx2fWRYa5v+K+v9vRndd4hha513zlwgYUMlm1SaUSViCnJe21eV9LU
	4ovvxeG7Ky6VKVc0WYDKOR+OIOemigE6GkOCRhdJabAHLr8LjFjztFi9v+FLyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6sHe97NS4N8HlN6yP/FaM74H6fT/5NAwVOsKoJldAnk=;
	b=tRmtWlx0XlvRYGZGwfwqAG0iE87ZR8aFmvbPsjqGAv/6Vl4Ug92GtwU7b3GYyWsYi8R1yQ
	EmozFVOJUmV8yMDQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 00/11] ARM: Use invalid opcode also for warnings
Date: Sat, 10 Oct 2026 00:21:07 +0200
Message-ID: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261004-arm_warning-3ac1e2aea65f
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152145_306268_CF118FB0 
X-CRM114-Status: UNSURE (   8.04  )
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

ARM is already using an invalid opcode for BUG(). WARN_ON() an its
variants are not optimised this way. The series here massages the BUG()
implementation until __WARN_FLAGS() can make use of it. Here is
comparison build of the defconfig with and without the series:

|    text  data     bss    filename
| 19678700 10728606 407364 vmlinux
| 19434880 10814198 407748 vmlinux-patched
text -238KiB, data +84KiB, bss +384

| 19680276 10699150 408132 vmlinux-!DEBUG_BUGVERBOSE
| 19443392 10735644 408516 vmlinux-patched-!DEBUG_BUGVERBOSE
text -231KiB, data +36KiB, +384

In general the text savings are greater than the increment in data.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
Sebastian Andrzej Siewior (11):
      ARM: BUG: Move the assembly out of __BUG() macro
      ARM: BUG: Spent each entry in __BUG__LINE() its own line
      ARM: BUG: Move the section right after the opcode
      ARM: BUG: Move file/ line encoding into a custom macro
      ARM: BUG: Move __bug_table creation to __BUG_ENTRY_GENERIC() macro
      ARM: BUG: Move the __BUG() out of CONFIG_DEBUG_BUGVERBOSE
      ARM: BUG: Pass a flags argument to __BUG__LINE()
      ARM: BUG: Move BUG() into the do-while loop
      ARM: traps: Move the BUG handling from die() to do_undefinstr()
      ARM: traps: Add handling for warnings to handle_bug_opcode()
      ARM: BUG: Add WARN support via __WARN_FLAGS()

 arch/arm/include/asm/bug.h | 61 ++++++++++++++++++++++++++++--------------=
----
 arch/arm/kernel/traps.c    | 40 +++++++++++++++++++++++++-----
 2 files changed, 71 insertions(+), 30 deletions(-)
---
base-commit: 4eeccbed21e50c19f97be9d325511f3de6343f2d
change-id: 20261004-arm_warning-3ac1e2aea65f

Best regards,
--=20=20
Sebastian Andrzej Siewior <sebastian@breakpoint.cc>


