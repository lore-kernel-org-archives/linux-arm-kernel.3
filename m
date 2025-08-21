Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D730CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdUDX/GrjPHmpkOj/PiRCkrMG28qz0YSUiJOCwDTrUc=; b=jmSHD5gxxXzny0ZdF88whrcwYq
	mQNZsmgsQChTyYuXj8NK1zAcJIOln8EzJqgEkn4XiIp51ce2nbQRmEiryKhDw8PPdg4oRMpyeUkHY
	ig2YfrS+AMOGIVmR0nnpLGR9I/61saLEJYVNeEEWgQ6SoYRZtiATMbLwdSXGaXYyejjxC8d5lJX7H
	aqS+pqnv9jfIGEFBnBLz387sqCJwAzt6L/KYO0UehIBLjCWFpsZP4gU6pzhj7vRoMZ36rKuON8XT7
	ylGgwAzFuZSPU+YQnSna93VPPpDiBHSKzWOPpk063Ou6CYdlHVtDuPY0J3PQc6SEMUOG39Dyvf6/4
	FQtDo4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2qp-0000000Gex7-3o2b;
	Thu, 21 Aug 2025 10:48:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0AH-0000000GALg-0UN9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:56:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755763009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdUDX/GrjPHmpkOj/PiRCkrMG28qz0YSUiJOCwDTrUc=;
	b=OM7h2I3yPoHWiAlU/8iJbV05MyFHH2CA2JDGLNf6olHGE9trv93VhDGVjBIiHfkFM4TPW9
	if3Uy5WPdfEgZM9+kylqj6wFB7x/YfzGEKJKk3lKvDng4glIfmb09zln0KaAH07xfCE3EQ
	PtjPPICi7anc7BuTzgXqRt9+Mf3BXn7nOzgi0jTRnSv2Qe7Am49kDKL4FAcT4stM5Gbh4t
	cUvwViA/OvtI4L6DWWvfpN7pzH+asWov0S4K5zqp9vbbf8DNbZAAl2++KAeEaIxg5Yqrwi
	rQnySe4U5qPp3UDXnm/Bnpt1EV7JGMQNYRDyxR5FCc65vU3l6vZCS07r7prlQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755763009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdUDX/GrjPHmpkOj/PiRCkrMG28qz0YSUiJOCwDTrUc=;
	b=Jax6QL6LWo4yYn9sfRGf6Bg+4vl/swqgZlwvI1GV+Idj+r0Pr2s6+c8S1juQsDBLzODl9X
	LPqq0cYcRqT8jMBA==
Date: Thu, 21 Aug 2025 09:56:44 +0200
Subject: [PATCH 1/3] arm64: uapi: Provide correct __BITS_PER_LONG for the
 compat vDSO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-vdso-arm64-compat-bitsperlong-v1-1-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755763005; l=1342;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CPvrFNkZy39LJ/1qgKk+040oslCnw6l8oUx7U4UhgrE=;
 b=NkBFFQGs2Gl66H5k5IJI1BOxRJy+DwLwXfPQyxDfKIJHuMIm3m6GjjUNwMXPkx9JqfNqgzbuE
 Nu/I5TPfzydCJWh+yWXMDfYTwgncTA7dW20eskh4qspCC1iFmLPIiZf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005653_311376_BA8EAC3C 
X-CRM114-Status: UNSURE (   8.62  )
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

The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG is
always '64' even when used from the compat vDSO. In that case __GENMASK()
does an illegal bitshift, invoking undefined behaviour.

Change __BITS_PER_LONG to also work when used from the comapt vDSO.
To not confuse real userspace, only do this when building the kernel.

Reported-by: John Stultz <jstultz@google.com>
Closes: https://lore.kernel.org/lkml/CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8rSFvU0fpurrJFDg@mail.gmail.com/
Fixes: cd3557a7618b ("vdso/gettimeofday: Add support for auxiliary clocks")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/uapi/asm/bitsperlong.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/bitsperlong.h b/arch/arm64/include/uapi/asm/bitsperlong.h
index 485d60bee26ca313ad15797f230efe10072befc9..d59730975f30c0764577ec20dfafa33373311e21 100644
--- a/arch/arm64/include/uapi/asm/bitsperlong.h
+++ b/arch/arm64/include/uapi/asm/bitsperlong.h
@@ -17,7 +17,12 @@
 #ifndef __ASM_BITSPERLONG_H
 #define __ASM_BITSPERLONG_H
 
+#if defined(__KERNEL__) && !defined(__aarch64__)
+/* Used by the compat vDSO */
+#define __BITS_PER_LONG 32
+#else
 #define __BITS_PER_LONG 64
+#endif
 
 #include <asm-generic/bitsperlong.h>
 

-- 
2.50.1


