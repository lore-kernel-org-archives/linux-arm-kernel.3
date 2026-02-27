Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A9CFD4601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSXoXgD5yJIajfhr67akWUt2bY9n+zCrk3h+dssSjCs=; b=HF7hMjq2TyqVgNAOFpmUyOZnAr
	nRlaNOthzcwl5ci/4bqJPbVxLZJuKkVUadGmnGRQprqNtfH5PMp96dLIGPNUnuEVXt0QvYso3/7wl
	zjUh02FlwlSk1J5aGt5ifUZRqLGb/NjL2hnKrAAeldKSPIM+vUM8wWtLm3u/WdezHgrN38tskQZEE
	dZjH/uwgHkttwWAHSQkU6+6enw6OpyWvJlcbq9B+gBD2azaFW0yqHfz9Dpwcxoooz15XSGHO7mjk3
	V2wNN/S8Eem4kkwqix/ljmpRAq2ejMjzQIrl75FpN6a0GFa0pjqAY5ZKASRosHZJuqRNXdL9XadZ7
	VYPKYtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrar-00000007nm8-3xpW;
	Fri, 27 Feb 2026 06:44:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrai-00000007nfg-1C7y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSXoXgD5yJIajfhr67akWUt2bY9n+zCrk3h+dssSjCs=;
	b=gPO8bsbX2j5pl3+0WQBzSu5zAII6ivXIaw3RktNv3T1snJK//8ViSgk/FSVD2hDd9j9ysr
	B1bxTes2qn5R8L8xhfroQPEX0VodOvldUO+LVdBsZicSmZa12+RGDjsLD9JPo958FuRs4y
	6M6W0ge8+QlTDN2RH6H9ukvja4fuMAzRy26PjhpXHIbaLdNp18SeKsmRGreMp8iDrjtZ36
	6i05guUb3fVT412K/F0xnCSROVcDIJTmtb7cUtBQ8StdKxS1XL7cjPhG66PITQLrTgyKJF
	tguXygrmdxrfub6WJZgsrnnzewChBThOMRXJldwUCXzPOA5Ug8ESwSGC1NaunA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSXoXgD5yJIajfhr67akWUt2bY9n+zCrk3h+dssSjCs=;
	b=0rOwespIHMPRabYF7luWoTUNp23NVUZgYhbSHbaf/sHV/Zu6ERaXcTcrIs+1kdBlWfCM6b
	VfBKdZcuOKz/V4Cg==
Date: Fri, 27 Feb 2026 07:44:30 +0100
Subject: [PATCH v2 04/15] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-4-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=856;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZA1UJGWYD01ZyfFBKenlmw61nBxgQh2zO5BzGQCW3/I=;
 b=1TEGpURP99ld8FLPX/3v0rsq45TqqBc12m+p2OErKaencbWyxel0L2MdRiIfvqBXpvSVx4KLS
 hm7MSWrtG0yBi015CNXoPonMQtaW526wKMGNITtIy89L9oupjEmAtlG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224448_501626_3D971F25 
X-CRM114-Status: UNSURE (   8.21  )
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

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 8ea397e26ad0..a853f853da6c 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.53.0


