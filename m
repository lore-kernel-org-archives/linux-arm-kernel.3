Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F80EC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=; b=0GWRuYAHUTIckG47o6DzWVqhDi
	s3A8hd6lHg6SEhacs9HX7KJR8reUMkwi/9lzY5e/PU4lFg4EoYjS3NuOTUy+inio1xNkaCCCbeY/K
	oAva+M58lpPpORqzEXoIqU2wZjl0NfLPw8/Ks14ucNMIrjYBFEW+UNq+IrO3OeUmXlEuzA3pZsYJs
	63fxdvUlSydCs2P5XxhgvR2LcZm10RD7SMbbdG014sXZW581qLSiCX9Bwk7c1YYfsfOP/txhpcSM4
	eUOgYmRhQwTGVzmtUMQoe8KPCRdrTvyl8QsvQRWHbXP2qtzmhjlj9fsZh6/M+ytTnEbURxBV1bc4P
	4S5pK6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4U2-00000000fY3-26U5;
	Mon, 03 Mar 2025 12:01:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hf-00000000TtG-1HQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=;
	b=J2PnJ8ErcXhVIuRvqvkHXj7+dnNdS1EYL5YDEQZoOxgEkdIVKIFeg07b0VEIi3KThnzbt0
	ah3FK8WH0SUuZVYvxjp9pmpwO9vjxDPFsKHVNT/DUtprc2AbKlrSe/944ut+VipnhpibNE
	29SbO2Xuxo/jL/txmYAIO16qHVwJFP+bvw3QcgHJXU/FohbxePmQm/Y+7++xwQnw/Hws2/
	Hfq0VCWqKAR6lbMcAGPJux4b9Ev4LSi4bIfjXBPTW28XOqHQejdiPSeTSjqNqMnc5FIwO/
	uUO5w4RFlrbUUu8nnclDM2MIzMtXJU72CkI7ELp9NW9W5sVsPcqWIk3/EMh6Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=;
	b=GwBc4N7JUlvmihVy8GcCVvbKSPyE3aY+zPykltsPgrrIWLNMhdZU0VqRTlm2Ku0wvazGx9
	XnuHfIQjnht8pgCw==
Date: Mon, 03 Mar 2025 12:11:19 +0100
Subject: [PATCH 17/19] powerpc/vdso: Prepare introduction of struct
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-17-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1274;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=J/Meo4khXD/IuyjcSchvegknYNCvt5RiCWDXgeCNEuA=;
 b=ipqT0aYN+nLJcWWGgAiulZ2z34jv+h8RZjUb8zE4PSrDBBV3fg7CNnQswUAW4p7fvphbY9V95
 iF6oxWHwSrZAnFYXR+PzpHDR0Rb2CslyLmtoDfl4dn1AAze7BQJj/Ii
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031119_533017_9C160251 
X-CRM114-Status: GOOD (  11.22  )
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

From: Nam Cao <namcao@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index dc955f2e0cc51f44d46f488a292aa0dbee3dc16c..99c9d6f43fde2efaf92d4777d3a5510677da7c92 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -99,7 +99,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return get_tb();
 }
 
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
 	return true;
 }

-- 
2.48.1


