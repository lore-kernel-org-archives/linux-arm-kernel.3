Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B911CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN/1z541eD5r45O9HbiVCy9Hf0r9nA9EQTfNLTZ91CE=; b=XjPLPgA8zxlEoeT3jyeaWM4Zd9
	hI2iXyxXViYnicUKSR0GGFXNQHM+58eRh15ybIxuQtAI3Mp8Ps8++0C+1F74JAi0edWAwyxtxuFFf
	CKIut38epxcC741h/9FlZSPIQHxlhaSvZtOPG1/1OQwpi8Cx73Sl1B4IvC99NysRFrWLGx7UZWibZ
	aCXehB7E/B2FLcA3yn43x3e/2x5X9tuvP6ytEkBJpsooI2MDeqyX4SgIwTFTdotN74Rm5vBdwCO/M
	3MPmrKt7eneyau2yCFzi4uyjQpkt1YBRDjAwzhyXy6JZGeWAcsolgwcX9jhIAEUVDes7PtlLFzsxH
	795MxRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskP-0000000ByX5-1gKN;
	Wed, 17 Sep 2025 14:03:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjZ-0000000BxDU-1gD6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN/1z541eD5r45O9HbiVCy9Hf0r9nA9EQTfNLTZ91CE=;
	b=OU0D+c42NlGykjDU6oGCfr2xibvn6mC2df40bLfNviSDptLpM54CoQW1K4tc7Lu1nQ801B
	AI45uOJkKyvDXc2zqv9iHI7xOfg7RG6NyQ2aVNacyQK4mRDO92YPUaA2ZD5oknUUB0Hlm8
	whOgK6f+UE+l9PeFnQ9xwpTtymjNJ54BoECq4rEifHc2A+IFQnRCR9/cMmMwd9pNiQPx4u
	Hxg8TYMc4WZR3ZmpmwgiWbwAFaSyu1YnEP7XKnx4Wv8IlSK8fA6l8l6oxvzfFWOSYQ+VjR
	69db/jFjlz8/6AnHtXn+reY40PAw1OKp4IRNt2sCz1YwBTayGnG0Km/UPbgDyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN/1z541eD5r45O9HbiVCy9Hf0r9nA9EQTfNLTZ91CE=;
	b=odwIPgAFfAeSJScaPPohX4KB03R5GVAZP3L6MCWqTrN7xKE//eHoqZGIqzKAZ6Gns9YHoG
	+PtSg2Nov56e6wAA==
Date: Wed, 17 Sep 2025 16:00:22 +0200
Subject: [PATCH v3 20/36] s390/time: Set up vDSO datapage later
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-20-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1209;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ApSzf9ILh/EhcOJI2zAI91ndmrTsGMpy2DZqXgLt548=;
 b=rk9HBKG5f+HFQaqZDuujtGjpLv/GgbgrC1EVImtnQuWZjiDVeNK5bd37f1aF/d+7HVb1kWLY9
 WmbXr35zIgkAfpyY0L1FyO/JqumrYumQ1JDF0/aprcY0YCrgSGDN6EO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070209_594580_69346C92 
X-CRM114-Status: GOOD (  13.42  )
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

Upcoming changes to the generic vDSO library will mean that the vDSO
datapage will not yet be usable during time_early_init().

Move the initialization to time_init() which is called later. This is
valid as the value of tod_clock_base.tod does not change during the
lifetime of the machine and the vDSO datapage is only used much later.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 63517b85f4c930b799235c381d9d6b263fff5431..6b948b9e61fe674bbc842a0143dd35a26b91a860 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -78,8 +78,6 @@ void __init time_early_init(void)
 	struct ptff_qto qto;
 	struct ptff_qui qui;
 
-	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
-
 	if (!test_facility(28))
 		return;
 
@@ -248,6 +246,8 @@ struct clocksource * __init clocksource_default_clock(void)
  */
 void __init time_init(void)
 {
+	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
+
 	/* Reset time synchronization interfaces. */
 	stp_reset();
 

-- 
2.51.0


