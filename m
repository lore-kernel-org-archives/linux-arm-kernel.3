Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8739AE6C614
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvs5Ig22q3GUo5N50D+zEpwy+yzRC74cy8bQ/BN/E5s=; b=JHEIcd3rhS/NoR+vXFBfl/T5R9
	FakgUEurIjq6uCZknQUNkWNc/TCTJrW8D8eFMlT2NnVHM7zX+L589+cAq+pAzZTR0kFfOdP96uMdW
	v2ls3vUcmyON9HVU2i3NiCknD4hRjT9rxBMKvlYKrOhQO4yswG0rJ8Al/CMnfGLrpJkKW+5W/iykr
	m2xpAu5unYSam/6aObS0esjL9qUsS9nEeKuxz9/NpmDW36q4MDYgZGNcpOwKC82FF4txP7nuvXGAi
	hC04Q+9DEZ0q7GHQufiEi4tfC2VmvvqixsieHlXdBmBXwv+EPdbQ1925x0nPhVYvheCtmiJhaeM8K
	E3hi3b5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMo-0000000EcEV-2r8v;
	Tue, 23 Dec 2025 06:59:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMk-0000000EcAb-1ogO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvs5Ig22q3GUo5N50D+zEpwy+yzRC74cy8bQ/BN/E5s=;
	b=IjVn5f6AgLOlQfCHqp5GJzD65PArhFv7j8tFOSrZFyFjtHhdHgGxHCjFO2TIOdIGVLHFbN
	06/dTedixnpJhwXuj8Ez+fhs2n0GZfNsHk8FV/jeqg5/xNHDf9W1mBKEW+l92KuIkMLqgS
	uApAoSv4xORbWiLCJYYLjBjGev4WDji4CEqG8/xRAIh0E9ghPKLfrWbAIbhVRztlaYzAfC
	9IHp0O1AVqo3QRJUK3+UQHs2GRpKEFT//IZo6FOsfTsRILuID50rdfYJt6dEIfQM55nDZ0
	jKMIdZPsjJNRcvvXyMZSfaKT2g0ePAKdc6jo17vFnZtMzcMnzAW3L7IzgQSNPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvs5Ig22q3GUo5N50D+zEpwy+yzRC74cy8bQ/BN/E5s=;
	b=QpVdPWBaPRZhT8wSESJZpjGlGAynxMrdY3o0+Ym4QaYxBDrB9hbYm4kqWxhtAxjFnpqTck
	4ibmJ2Q5RxcrYwAg==
Date: Tue, 23 Dec 2025 07:59:18 +0100
Subject: [PATCH 7/9] ARM: VDSO: provide clock_getres_time64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-7-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1854;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nldWa4kQ886kbFTIL9sYV2DTnWNpLETSHelHafpckaI=;
 b=vNEJ/cyb1VaiaSFk+v0znP7UhHkc4mdRjK0VM30s+Pybx74RtyeUjLXYWr8QgB0B4rHpxCTuJ
 Cwfk3P1kGexBdd4oc+78w1+EcqgakcjUzBwj7H6xYdzY9xDY4h0YVsc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225930_623062_CB8FA13F 
X-CRM114-Status: GOOD (  10.15  )
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

For consistency with __vdso_clock_gettime64() there should also be a
64-bit variant of clock_getres(). This will allow the extension of
CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
time types from the kernel and UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/kernel/vdso.c        | 1 +
 arch/arm/vdso/vdso.lds.S      | 1 +
 arch/arm/vdso/vgettimeofday.c | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index 566c40f0f7c7..0108f33d6bed 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -162,6 +162,7 @@ static void __init patch_vdso(void *ehdr)
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime64");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_getres");
+		vdso_nullpatch_one(&einfo, "__vdso_clock_getres_time64");
 	}
 }
 
diff --git a/arch/arm/vdso/vdso.lds.S b/arch/arm/vdso/vdso.lds.S
index 7c08371f4400..74d8d8bc8a40 100644
--- a/arch/arm/vdso/vdso.lds.S
+++ b/arch/arm/vdso/vdso.lds.S
@@ -74,6 +74,7 @@ VERSION
 		__vdso_gettimeofday;
 		__vdso_clock_getres;
 		__vdso_clock_gettime64;
+		__vdso_clock_getres_time64;
 	local: *;
 	};
 }
diff --git a/arch/arm/vdso/vgettimeofday.c b/arch/arm/vdso/vgettimeofday.c
index 3554aa35f1ba..2874dde7e6cf 100644
--- a/arch/arm/vdso/vgettimeofday.c
+++ b/arch/arm/vdso/vgettimeofday.c
@@ -34,6 +34,12 @@ int __vdso_clock_getres(clockid_t clock_id,
 	return __cvdso_clock_getres_time32(clock_id, res);
 }
 
+int __vdso_clock_getres_time64(clockid_t clock_id,
+			       struct __kernel_timespec *res)
+{
+	return __cvdso_clock_getres(clock_id, res);
+}
+
 /* Avoid unresolved references emitted by GCC */
 
 void __aeabi_unwind_cpp_pr0(void)

-- 
2.52.0


