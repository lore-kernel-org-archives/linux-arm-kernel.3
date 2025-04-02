Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAFDC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6EhU/9t2oF0mJIZOkkWFSnPLwKyGMReGziz75LxHrE=; b=Q+eM9SuefEbnfgYD1oLtlncfNN
	kki6Uf6GxQotGnh3JW/8rSd+LURHy41SzgYE3VuhV8KbFH0JjWpOjAANKDluA9flqn7FJpdLZ6z88
	+hHnzBglYvqEVyIN6l2LTR+JLXDi13Pn4I59oN+BWwOphpU7WUbzIELXdoQprw3caTJnybYDbV4Nc
	rH16mF4l1KZsbUEH56HSl8cZTJhY+qPsPaT6ut2glERnOvyX/ch1UBwFFRR+7KhFwAhMsH3OJ1nqu
	3CMpO7rKJ6nRJKOwOnU20jqkL6Oc6R7mKFyqxmPJRdoJQJ2NUuJPUdEf+eQgCFKTpg8oRoIUirZgn
	K+UDUvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03hi-0000000730p-0vHi;
	Wed, 02 Apr 2025 19:24:50 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03fx-000000072mE-1932
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 19:23:02 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso260646a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621779; x=1744226579;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6EhU/9t2oF0mJIZOkkWFSnPLwKyGMReGziz75LxHrE=;
        b=LkqitClX4AwFHf+X+/6l4A2k9wAH9xzqai2u90ua5eMBSB5w6LAqNt+H7qBHPrmO4r
         MK2Ir18Jr4/ED7vclH/e7d/Wn8T1lGTvUTCdWKdQbI59PQBEfVWgENHfIUJ/PmD402cS
         l+biHaGfJXndwwqa2m0ochxYXuZcUR3ID3SREWsFjT5tt05cPHNBlvTj3m30TqHTB+Gf
         B2h7SIyhteJ/u9zo5NtRp/ehiQaUHoUlGfgx+GNAd0LVtxFzAimPK4h8UnjThgRTVng+
         KgOH4i0rvg3QWXs0Gzz4yg7189M21tCNbgKF+wI2nux0lMBYmNtI71vTewaplufcPzP7
         Z7kw==
X-Gm-Message-State: AOJu0Yy4DPmF773VK6564Ne/p1ey/oWUIdVAOSpM93Yayogw5f39wRNK
	BwTQJajQCv5ZIdragE1s2DPhbpVUjQH6bat9exmkV/stljqi/sJE
X-Gm-Gg: ASbGncu5r6spAEkmoSbwBdWPwrIYlWWezUi2WkUomYYfWqWhWIgM+BvrpfPXS5Ua7UA
	kwmB8+eCKVMISzPZ2PxKt1i1pbCxTiOwswvoJgy4N6y2ITSTFIHWWxuAonxW3hbvV2y9I4Edfxw
	3Zp1CgsLuyqjrFMErv48Ns2prLLKXMLxlqRWtV/WXSxwTB1nkQ7gW0t3YkkPO7jnyeM8PMPVxsv
	x8tGr6rQSPfArwObLGZLPcXj2oWLHsLe7OfJ40YVPidx2kIlj9eOEUVYYfeW+FVmqQyWbSLBEND
	8I3gqRRjYnvSfqAcrZ2OXPSmvmeaZwoh1jEd
X-Google-Smtp-Source: AGHT+IEXs3QvvTarAPqvu5hZjvcXf2QeKhj0SNg+fmdUNOq6Y4HUDyeEp9v+k2i3CObdo6T+vIXudQ==
X-Received: by 2002:a05:6402:26cb:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5edfceaa4b4mr15696652a12.13.1743621778206;
        Wed, 02 Apr 2025 12:22:58 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm8949262a12.44.2025.04.02.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:22:57 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 02 Apr 2025 12:22:47 -0700
Subject: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
X-B4-Tracking: v=1; b=H4sIAIaO7WcC/x3MOwqAMBAFwKssrzawRi1MK3gAW7HQuOoWfkggC
 OLdBecA8yBKUIlw9CBI0qjnAUd5RvDbeKxidIYjWLYVl2zNGHaT5ngaX07s66WoCmZkhCvIovd
 f9ejaBsP7ftQLfo1fAAAA
X-Change-ID: 20250402-arm-vdso-c4b0c9f35300
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arnd@arndb.de, kernel-team@meta.com, vincenzo.frascino@arm.com, 
 maz@kernel.org, anders.roxell@linaro.org, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=leitao@debian.org;
 h=from:subject:message-id; bh=ljKOGDNIoGIYXjjrmExu3/2eCFL5hJ0e/kaT7Y/A0lc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBn7Y6QmPWVYqn8sXqLtXJY6ddJzmHk5lG7gS9qQ
 25fb0TT+eKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ+2OkAAKCRA1o5Of/Hh3
 bdN8D/90tSUXwFJX/AQtgyjEV3xiUwShqy9MVfqcdiPe1zBo9wMj6mRZvZZzMmgBhtblBUuCg7R
 tf7oy8x6jIR5AN5rSVbi4/DFu8swmXKw+23KBdpDSsyqdQ74VC7qMjErh4P0fykSXs8H4zfTAjo
 BU60s/JAuQrHLK0cGVxDG0zDIY3OfCz4DM901rWHUzbMLT+nfyM4EpdwNjEcZAv/x4YBsEMdjE7
 lwAmYmnN940wov9Do2+8AuSbsvASMq/c860JiE9U6n0tqzI6hcdwIPjgIclnHQplM6Wt9WaSO45
 2g9g3Cw2nSsuN/kUaiKvfewKcOWh+QDN/3FyNr/l9lpbWbRedYLQCO+jC9sWIYa9sM1fSiEUzTz
 TU4DVgMPVRGvB57SHK3o4RO7gcS5yR41JIsMLIwbkBuzRtbXrrw4j1ohQUoFYFQ7D8Z6rCCpES5
 5DizLWUUgtoLRliodczaZUnFxt+wj9DiBAOAUeImpdW3Ytfsz3jNaOPqAS6Elz3SFdy7gWcXmS6
 RLqUU+5HMu04IbVno0mRBO/mNvs98ZoyrR+JN1nCd1CPFesQyOoKdTcUEWcOe6efBZqc0se/DSl
 70u2VCfxtGsWZNJk7KM6KoSv9bmR7tlmR4KBVNtbimgx+q6qZRefyqDCSVQBdKkwVjchJr8Kmn5
 pfI+oVMonLe+UcQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_122301_315571_A2F6374B 
X-CRM114-Status: GOOD (  16.81  )
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

While reading how `cntvct_el0` was read in the kernel, I found that
__arch_get_hw_counter() is doing something very similar to what
__arch_counter_get_cntvct() is already doing.

Use the existing __arch_counter_get_cntvct() function instead of
duplicating similar inline assembly code in __arch_get_hw_counter().

Both functions were performing nearly identical operations to read the
cntvct_el0 register. The only difference was that
__arch_get_hw_counter() included a memory clobber in its inline
assembly, which appears unnecessary in this context.

This change simplifies the code by eliminating duplicate functionality
and improves maintainability by centralizing the counter access logic in
a single implementation.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
I'm sharing this code as an RFC since I'm not intimately familiar with
different arm platforms, and I want to double-check that I haven't
missed anything subtle.
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df..417b5b41b877d 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/sysreg.h>
+#include <asm/arch_timer.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
@@ -69,8 +70,6 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_time_data *vd)
 {
-	u64 res;
-
 	/*
 	 * Core checks for mode already, so this raced against a concurrent
 	 * update. Return something. Core will do another round and then
@@ -79,24 +78,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	if (clock_mode == VDSO_CLOCKMODE_NONE)
 		return 0;
 
-	/*
-	 * If FEAT_ECV is available, use the self-synchronizing counter.
-	 * Otherwise the isb is required to prevent that the counter value
-	 * is speculated.
-	*/
-	asm volatile(
-	ALTERNATIVE("isb\n"
-		    "mrs %0, cntvct_el0",
-		    "nop\n"
-		    __mrs_s("%0", SYS_CNTVCTSS_EL0),
-		    ARM64_HAS_ECV)
-	: "=r" (res)
-	:
-	: "memory");
-
-	arch_counter_enforce_ordering(res);
-
-	return res;
+	return __arch_counter_get_cntvct();
 }
 
 #endif /* !__ASSEMBLY__ */

---
base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
change-id: 20250402-arm-vdso-c4b0c9f35300

Best regards,
-- 
Breno Leitao <leitao@debian.org>


