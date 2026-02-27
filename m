Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3441BFD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0EBIBm5jNpd3KIuLGszq3PazACWdDvXzo0/uNY329I=; b=sa8Q2tgsUXastc0uHf19KNqRZ3
	EAGIREA66aX8UpIs5YDfHpyUC8AXoG0Vm3mEdNxA9MQ+Q4qbn5LfQ+ak19FXe6TQrpGipI1OZaPMC
	mkXDMZFtlr0i5u0+JdVOx+5HRb8PrBXfSksuhDfuk/0Tt3RplGqCqI3t9nCJSTjY6Gy2pFTqh2fzC
	HNfENTOqE+gMWwsg3Uc40Y9tcsa12IMd19N52py1HCYEfI7GK5l4C+sBadPp23U1zETjMqIzJDeTp
	HYQVvHvlKa8YWGn86WQNtvzVG5oe7sPAd4OX7XeB5ZcACNvM/MXBh+p4tnLgR29WMu0OF149oDgAR
	1czS5zCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvraz-00000007nwv-0da9;
	Fri, 27 Feb 2026 06:45:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrao-00000007niL-1eYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0EBIBm5jNpd3KIuLGszq3PazACWdDvXzo0/uNY329I=;
	b=Vw0vB8omZo7n15kO9jm6LrTkJPZPCyTUp7BYuIRcalRbmVrerP//B/YrsO/bVuRC8udPiT
	Tx4WT5VQ9gY7wC/GaUR2JbK6RKmJ/hwVpyjbBNGyQSn0ma2Vy9Pr/7MWbkqQ6z9rfh4347
	VjCtnblV+UrqlbRZID7ZEV25INf4LrJCikRBLY5WEXMADFbC7ADXNK6btC7Jk09vyomdw3
	eN1Yd3OwInZGcay04IFQ0tNnsZeSsJyNQ49cgmhblZox/8R78n8G1ObRfI3QYw1xQLCqpN
	nz3DOXY6/+ZaGAlwr+3V/r/IiWmyhmuAurbhWwGRe8eLBYlAbP/vOFgsklzxbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0EBIBm5jNpd3KIuLGszq3PazACWdDvXzo0/uNY329I=;
	b=rjQkLIGROHanTm4ZQKkRhxB+SoXQ85/KChGEgURGHZRk1xF73Af+heravUg1o4MI3/6Nmb
	ppUZ97iYyiOwdNCQ==
Date: Fri, 27 Feb 2026 07:44:37 +0100
Subject: [PATCH v2 11/15] vdso/helpers: Explicitly include vdso/processor.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-11-35d60acf7410@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=694;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ksAvbNu4g6GEEgEwDE4RqU2Mb+uIs9kO6obM62gGDDM=;
 b=jfMCxjTvNN6/pYy+fIWrmEt0awSdB/wvT6klfnssMA8eEwpKV+gbcmPDAhbNs3euCJHVEtrES
 QylTA587HbwCMFzseU3rCypSwUO+LeHxhv6GYUU1xKBFDru1TJ7WJvw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224454_628426_CF3AFF69 
X-CRM114-Status: UNSURE (   8.11  )
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

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c..a1c995af4696 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.53.0


