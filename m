Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC99D31A19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7a/8gcbX01XP0/CB6Qd22scjF/OCyrYXm0gztMHssc=; b=1GTSYdNBLve2p8akugqEg5moFS
	0eSUNPQLhYmKsHx2z9esqG0v16VE0wtvP+pVu7gwXn9BMhD0raZKyBgcb51ZlFClXqXIY6aRsa+Zb
	JizGaJGJ/KbihBHPK1oq8jqPO/f5G4O6hcUbXlzhOKEr8unT7iNbK7armcSQaW+QoGPdyaTnzqhDZ
	55zqJRe97uM0OqQnxWuWP/ZcDiEmmLwbBbcfGb9gHtGJNsYi++LWZWiDiDSFcQdQkoOhqWtI3hxZk
	EXcW6GYQAGnfQGceuQ1LK9XACDY78cnz5NbObIfGtiDeWTJqkTMAumemmYqUx4H0vfDWnyKEQWX0U
	1LZiWj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIt-00000008CHX-3mLQ;
	Wed, 14 Jan 2026 07:28:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBU-3xwm;
	Wed, 14 Jan 2026 07:28:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7a/8gcbX01XP0/CB6Qd22scjF/OCyrYXm0gztMHssc=;
	b=dAc3knakfpp5DOvozjUAzoewOZ2pVCF/gzFHHIZ75ZyWUHoMYvGm/4/09V1mA7934bDNxI
	o8gD9fHx/aoRilno7/lwiTZRd10IK5bC8RN+D7DKML6UnnYDtoNVpHNgyAI9Lw6eKvpVs3
	e/KiA20HVCghVVTcxUPZB34U1So1sEh5Gw/BgVehGVuJoZAuEb7t18x2pegQqJ5mefjAvm
	fV1es3dz7yXmx0JDg+jFub20M6R/nf90wgBOsSdhhloAi1vbdnBvni4ArSXLfh+Zs5Z2Og
	oJWVW3QVgWeA6LWHyckX4gMdJvDzi3ymAV6AV7ZY4eLe0avARB78clO/ETU8lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7a/8gcbX01XP0/CB6Qd22scjF/OCyrYXm0gztMHssc=;
	b=U/JNrNkBGW3Y1nOEUaTFB2cpGsA8hZXMVJD6By/YcVfJ2SSkYeJjE6uzVutPg+0uOmQEFf
	hiXM8qitjatAN+BQ==
Date: Wed, 14 Jan 2026 08:28:15 +0100
Subject: [PATCH v3 3/5] nios2: uapi: Remove custom asm/swab.h from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-headers_install-config-leak-v3-3-c14cde735a79@linutronix.de>
References: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
In-Reply-To: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1518;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mE+0AJr1mZB6A2o+OL0n7XdbaqJ3PgEVC2ckr3OVoI0=;
 b=zHTjG8R/h7uXxKeC9I3uek7xU7TY91UMhtbGC20yAPj5ya4N/uCIjgRNXiJw13vsOPf8QLkN/
 AdLzoLuojFQDPOjMqW281pckTTVbMF16RgvhBWDqP94AqSmP3qrsZXA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232826_114820_889D1FD1 
X-CRM114-Status: UNSURE (   8.40  )
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

UAPI headers are not supposed to leak references to kconfig symbols.
They are undefined there in any case. As all actual definitions of this
header are guarded behind a kconfig symbol, for userspace the header is
always identical to its asm-generic variant.

Make the custom UAPI header a kernel-internal one, so the leaks of
kconfig symbols are fixed and userspace will instead use
asm-generic/swab.h directly.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/93c55086-931a-4282-a94c-de4954047fa9@app.fastmail.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/nios2/include/{uapi => }/asm/swab.h | 0
 scripts/headers_install.sh               | 2 --
 2 files changed, 2 deletions(-)

diff --git a/arch/nios2/include/uapi/asm/swab.h b/arch/nios2/include/asm/swab.h
similarity index 100%
rename from arch/nios2/include/uapi/asm/swab.h
rename to arch/nios2/include/asm/swab.h
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 4f03521f4026..613f400a67d1 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,8 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 "

-- 
2.52.0


