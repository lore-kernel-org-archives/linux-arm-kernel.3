Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3872DE6F060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeL+wNwtwp13/IriifZjEinyNYsN2WU00+W+l3D3JKc=; b=U9n5gfFjfKhD7Tv+EGlK/xys0F
	wCmfsGdlF437gugBl7mA0qN8S7DtcU+T+4xKIK+YJWBu+Bw9Tv8QikFCyFmGjSeBupHsf4d77sCYv
	JHmtEuSI3OTz05WqPw72XcUW9NwKZaDjIZiBTgt/CKnhOquAXumzOiCn0N08Ue/mNiU5ycDfXh2Gq
	ntgSbLX+PAMYXJO+4mIug6Vgm0q0UdVjPfROSNkLfRzpHx45E9iugXas7iOYDyW6/RqamiMvAMtkF
	2S6kt9gxLKaLEu5Yzom2LXAyjKytK2zTLFovvUxTzYSXROESAZPgqfrGBgvJqa6rzbLycz2Y2RJGJ
	y8yM/hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMp-0000000EcEo-040Q;
	Tue, 23 Dec 2025 06:59:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMj-0000000EcAT-43zO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeL+wNwtwp13/IriifZjEinyNYsN2WU00+W+l3D3JKc=;
	b=bjH9bAf08zKh3tAojpWoL3lwE4aziyDxCSkUkVIhCye/CcVYT7mR6MCF5e98jTHn0xdotd
	b0IyYodFLpYFw6/2+8ivpw3fA2h0+NVcXbekaet3Dt7F15oPF0Ho1jq1bpbW8HpSDjwdeL
	r/FPNWtEWkOIhuRFaslDfreIILE96n5JOQtWmL8iA5Of3rfQd3/bKk1v/kanAnFDOn/kv0
	Jguykck40SqjdphGGu4eTnXXJgpXp6w8dKIgR0LzLvP5N9tP4APpm7UP03QfAIwMRXIzx7
	xaG1aR7RUPMQJnonfu5ynB+lrqJ2lZoKg9Uff8TEjEKa38AihhEvtX8v8ttYsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeL+wNwtwp13/IriifZjEinyNYsN2WU00+W+l3D3JKc=;
	b=WGVAL1ujmSWzDJFGCarIiVPBmebqrKoHBbZ/8WEH9BEyDbQX4f26hDbVfoL91hJOG6z4tE
	KGZ/I0SZ+VV4xKCg==
Date: Tue, 23 Dec 2025 07:59:17 +0100
Subject: [PATCH 6/9] ARM: VDSO: also patch out __vdso_clock_getres() if
 unavailable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-6-97ea7a06a543@linutronix.de>
References: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
In-Reply-To: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LdmbtEljOlFyOZ6OrGxnqW75nza0HGI8PoT+uoNSI7M=;
 b=wlCQXSEJCoro5/Gj9o6p9RQLUD8hyzOugG9AocBBzD5Jh/2OlROC1hfuz+G7GHz2eosk52Ypr
 Aetv2oFKV1kDXvVyOyKB+fVpgD/q+Z3ndRGByNySeJ4yOjtX5I9z+4l
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225930_157078_818B906A 
X-CRM114-Status: UNSURE (   8.58  )
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

The vDSO code hides symbols which are non-functional.
__vdso_clock_getres() was not added to this list when it got introduced.

Fixes: 052e76a31b4a ("ARM: 8931/1: Add clock_getres entry point")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index e38a30477f3d..566c40f0f7c7 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -161,6 +161,7 @@ static void __init patch_vdso(void *ehdr)
 		vdso_nullpatch_one(&einfo, "__vdso_gettimeofday");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime64");
+		vdso_nullpatch_one(&einfo, "__vdso_clock_getres");
 	}
 }
 

-- 
2.52.0


