Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E08E6C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boeLpF9WDhdBW8/8XalkGVrMMM8dMtfSsPcLznvCp14=; b=HkylxRCB2xtg3OY0DdfRkmaAzB
	XqQBBzj3YntcOc7RkD2jCtkvVZYtBlKLDiGpEkWgICwh8mTCaZfHE2BMRvveuyHn4PryIqlG9oCnx
	OS0a8gW+5lYFcUfOxDocBNhv9sBhG2/DNOCZg/gQaHzgtpDMhhchxNlQ/msD/H0OsycEI7FvCPt6m
	M/QP0Nc11DyiT9QqqXfPqs1gbVj2/Cg2NEForBHUnD+yVRgkRipBfd8Gsz1KKdelwPPBFkspPD6V1
	0UO65D23THuIeJXR8OGf7kYg+d8BmgnYX2lDpnOBQjhSJkn7m/pxYFpx6y7N78h+kF/tMvuAUkm3C
	sjNNCstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMn-0000000EcDB-16uk;
	Tue, 23 Dec 2025 06:59:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMh-0000000Ec9A-0XLu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boeLpF9WDhdBW8/8XalkGVrMMM8dMtfSsPcLznvCp14=;
	b=Hkw+tEB2yMUUE6Mor+NRnWTO0lwB6U+Ba3sAzEYTuRKnupzAYPIH6BRmkgoo0ecwGvfYrs
	tGPWb2S594YNkvwPrnN1nJDOseOc0/88vej2lrYBAdg2d53H9N/N9M5FVrCyFy59tuu3qg
	FRAnlCQzx1Q14Z2WYZHXnNe/Dhu6wJkF27rYxRrxaijiVueExSnumvro92bgcADtPxKdg0
	CGS8ghn7jLmUniHi/JAaYoHv9Ht0gvxRPtfbtVtgA93B85PTp6HnH4zEPOpXRNtokVIWi1
	5aexoGYjotxYzJ4Nuqq9eW6jQKE8gDj8LkdFQxKEjcPIL+2zCYGcqeDkNpAesQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boeLpF9WDhdBW8/8XalkGVrMMM8dMtfSsPcLznvCp14=;
	b=mBU157FkcpYw23skKX2BNcGNQT5kMr8gUgG4EhHPJxACEsVAFlSteTQrgL8962Oie8hOgy
	R/BgvRtaO3hvKOAg==
Date: Tue, 23 Dec 2025 07:59:13 +0100
Subject: [PATCH 2/9] selftests: vDSO: vdso_config: Add configurations for
 clock_getres_time64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-2-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1154;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3oEs5t8kcw4pff3/fxmwVbbNr3F+8kVWQ5JxjTLWNN0=;
 b=94S1aojsIz+AvSGGvP1+uQ1Zn56fqN2xhvjTe0sHg67LZ5VHZkqwK0z23deRKcNZ1SoS5v8Fw
 Ufc9DZKFW58C2L1JCrLIuXrIys4yvbKrvf0TcJfCs7YcnyjPWpawoQQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225927_312353_DB6AD743 
X-CRM114-Status: UNSURE (   9.72  )
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

Some architectures will start to implement this function.
Make sure that tests can be written for it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_config.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_config.h b/tools/testing/selftests/vDSO/vdso_config.h
index 50c261005111..5da223731b81 100644
--- a/tools/testing/selftests/vDSO/vdso_config.h
+++ b/tools/testing/selftests/vDSO/vdso_config.h
@@ -66,7 +66,7 @@ static const char *versions[7] = {
 };
 
 __attribute__((unused))
-static const char *names[2][7] = {
+static const char *names[2][8] = {
 	{
 		"__kernel_gettimeofday",
 		"__kernel_clock_gettime",
@@ -75,6 +75,7 @@ static const char *names[2][7] = {
 		"__kernel_getcpu",
 		"__kernel_clock_gettime64",
 		"__kernel_getrandom",
+		"__kernel_clock_getres_time64",
 	},
 	{
 		"__vdso_gettimeofday",
@@ -84,6 +85,7 @@ static const char *names[2][7] = {
 		"__vdso_getcpu",
 		"__vdso_clock_gettime64",
 		"__vdso_getrandom",
+		"__vdso_clock_getres_time64",
 	},
 };
 

-- 
2.52.0


