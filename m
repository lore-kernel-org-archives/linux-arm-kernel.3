Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E2BC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oh1PJG/vwynt7EkxazpWcIlavpMds/jXQGtW/4wg0d8=; b=ervrAAzXdCDwae7X5UboPJWff+
	QMx8EbnsTIe9yT9NZsAaCOjNDsDJm2ddMymyLY8AvrBiA50aN8VOmnK7OSn7XrBww5/l0vGJa9u4r
	0JXkzeHJfjv6/45AmffOlgsWRg47uAloDDCRWY4Zpq6J0OqrFAmbVAeUpH2u/585mKIpaj47/1T/p
	IIBEqZFLZ/E1Zu7vrk7vW2tPPpLgi5RtvWjYie6A5xc8IHMZVSDsuo3ESt28dkBTPiItSqfGQfEZi
	tlWd8jcb0ECfKLblyMF0VHs3ajASTmL0Um/06e8IduDYPTq8Momd+HZmJprLRt0v2yH6v8TiR59SD
	ek6NT/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E23-0000000BAcM-2jdw;
	Wed, 09 Sep 2026 08:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG4-2p5O;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oh1PJG/vwynt7EkxazpWcIlavpMds/jXQGtW/4wg0d8=; b=GPtrY8ap0G4D4APl8h3tHPAAsM
	xI1lg6NyylOx8TPhWVApCDrE/IP7hiwZleYDE8h4vYN7eGJ8VpiBs6BzZW0opFV8tACVIRslfqJe3
	Pc/cksT39Al/KQTNWYxRX9xQhYRZ4b6WxvbjpsONM2QJbSQ8h7Nw2Qfeicu1TpWjBu+Uv5CMv3kRZ
	8MusxZXXefpwW/BRVi12qkGPBwhlyVL97tafRNdOChAlQ01BDqsTPMjEFKg/4iqlBSA2OV+ZGenCj
	v4dnT3MXMLxStlfRH2wvMDVRiifzPtj0eCnLDnpnZFFDibkOk5FmC38LZzILf3xYWrTXnUkCERd87
	8xhxXoTQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1h-00000000wHZ-0O18;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oh1PJG/vwynt7EkxazpWcIlavpMds/jXQGtW/4wg0d8=;
	b=jG8f6cKe83NgFyvB7usZY5ErQO/V+DEWyK1IB8tUERMGKxGkzLNkIRGesrebnzL/Gxsnyi
	ajCdAtna/v6CMkAKXjthX4qDcEE9WrSAtMgIfoQFesbhR0R4vNqSYIZ1OGchhK7tOM/GSY
	SGyj2dZCe0nw25WQUym+CIEiEZ6x/wUaSFxGrW1UHbhREFH9op4ca2NuLp1Mo/RiW4B8P0
	WztwZfxOkGPxnJhqkzrD+mcn0yD453QUx2P4tDWkiLiMbYyG78yBvjcK8R/Ym+DjhTxPlv
	Qu07I+AE0JkTdPbZxhPMQ3BqhKIYkYs6yAnLeDVndUB+dkr600i6Jh5cklHbPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oh1PJG/vwynt7EkxazpWcIlavpMds/jXQGtW/4wg0d8=;
	b=+0brCh2l6wZIkosY+LRmMvfxx2IhX7GE3jNB+mNx83iF8+o62DG8Ex4rQiFeyrEcrPuQlG
	/Ke2Gl8rQAlYcQBg==
Date: Wed, 09 Sep 2026 10:51:23 +0200
Subject: [PATCH 10/15] x86/vdso: Delete asm/vdso/vsyscall.h inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-10-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1100;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5kEtWlx4srqMSxMbrqSmgOqVkUKIg3dsZZJXpVNG60I=;
 b=n4PspGkIOT4Ebc+CmHeX9ALb1UVKIlo/hmp+mpBEFSF3QM6gtk5pa1nGQAPgV+tbbPhWB3ikF
 CsF4rPheNMACU2R8R3gkRXtsPOgU2bhh0jtZnJ0G/TUZh5S+gNmgRl9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_412581_896AC389 
X-CRM114-Status: UNSURE (   6.90  )
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

The inclusions are unnecessary, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/common/vdso-layout.lds.S | 1 -
 arch/x86/entry/vdso/vma.c                    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/x86/entry/vdso/common/vdso-layout.lds.S b/arch/x86/entry/vdso/common/vdso-layout.lds.S
index a1e30be3e83d..f190efbc640e 100644
--- a/arch/x86/entry/vdso/common/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/common/vdso-layout.lds.S
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
-#include <asm/vdso/vsyscall.h>
 #include <vdso/datapage.h>
 
 /*
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 18dfd80a81ef..4bd3b22beea9 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -25,7 +25,6 @@
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
-#include <asm/vdso/vsyscall.h>
 #include <clocksource/hyperv_timer.h>
 
 static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGES);

-- 
2.55.0


