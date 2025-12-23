Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264EE6C610
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDPjMJktX5CXG0MV0cMYF1xoy0v5P9eoHVtBs/6YCzU=; b=OmJbqQZz5APjeD+EosrtXsx1Nc
	jfNNsoQnO+/wb6Xx8kU/5YirHerLOw6R3HPXQue2eS+dDv7JNXohwKEYVG9KR6+6WhOGERMdxNV2I
	P1sZzuMjdVxvU9namzw/N115/EBc/9YkedAsKn5Meiwt4vnIccp/FJWROyp4dr9Q/ft56yQhTiDXV
	kw8rIbmuj/QFkof6TJ2TulTEkMEFwvXl2wli/l+f57CogB8GZew8svZOdSKk6Ot67lIcpqgjk1KeI
	m1zI0eV97+6l+iOYDjnDh2WbiJcj9+4hI1dgMtrTDNterX15NgB3m5+IhEvDkXOS4rkVTp5NlDM42
	hxRNFzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMn-0000000EcDV-2apE;
	Tue, 23 Dec 2025 06:59:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMi-0000000Ec9B-0KHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDPjMJktX5CXG0MV0cMYF1xoy0v5P9eoHVtBs/6YCzU=;
	b=blCiFHJw2mRAV9nwsUR5N6L3+ukSSfnvpTxeAKtZRQ1NEq1VUzr7E6tZWQbslgmDrke50e
	C27FaPVWZmTPJ7h9YHRAYFfYu5QAdAzP3ZyPtktWU8z5mM7fEEB1+JBBj2dgxnjb5Ion8W
	G68dpQdI/lAJUS9BSvRerzsyVQ0rmzL/QJLrU05/0NtAb9tM5CQNTHubGebVasejz3S7Hb
	hzlvoFlVo/moVxdc8dN3npjtsF3BJAKakNCDGqqNRWJdkDguD27Ir78ICun9HGV5XTNTXF
	yX2VofiI1MpUOQQ7MeOCMRrGasNDFr1bHbX/wetCkoftIQXjo83Ak0e6fZ1lKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDPjMJktX5CXG0MV0cMYF1xoy0v5P9eoHVtBs/6YCzU=;
	b=ZaXbnglGzz9TnvdPj6mUCHiTlAorZmY88jZbjNgKVgKwDS+5kRvbDCV1WyuHL2KqKvIEs0
	lLzqwNqX06g2XlBA==
Date: Tue, 23 Dec 2025 07:59:14 +0100
Subject: [PATCH 3/9] selftests: vDSO: vdso_test_abi: Use UAPI system call
 numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-3-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1042;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+SXAsfJphfIrvDszr56VyWDDLyMl5UJIQY3RHDubCt4=;
 b=wb277NVSHU6OwOBuItRYOE+qyzBzlMOBeppSwno9BH+tm/ZyHJAKOewX2axUQrpKLxCo4KNw2
 avEoktIEeBXCSQoGtEti/srIu339lEm3z1kmLKuKVW5+Qle5byz+MXN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225928_302828_4CBDDD61 
X-CRM114-Status: UNSURE (   9.91  )
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

SYS_clock_getres might have been redirected by libc to some other system
call than the actual clock_getres. In the test we want to make sure to
use exactly this system call.

Use the system call number exported by the UAPI headers which is always
correct.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index c620317eaeea..a75c12dcb0f1 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -179,7 +179,7 @@ static void vdso_test_clock_getres(clockid_t clk_id)
 		clock_getres_fail++;
 	}
 
-	ret = syscall(SYS_clock_getres, clk_id, &sys_ts);
+	ret = syscall(__NR_clock_getres, clk_id, &sys_ts);
 
 	ksft_print_msg("The syscall resolution is %lld %lld\n",
 			(long long)sys_ts.tv_sec, (long long)sys_ts.tv_nsec);

-- 
2.52.0


