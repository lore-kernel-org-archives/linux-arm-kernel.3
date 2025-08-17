Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF17CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=; b=MpgsJnQdFtHivFTcXnvmGvupFt
	paEzY409/5hh2fJ3eHAJb0ysFBJnVDQ0BdIowEvR9N/ntv+1MWalmf8REBkiH+bmIAqoXxnLXXb80
	tDM0beuKypJ8TFHM46dCOHCBGczoPQ4el/qspybicI9SOH6gf9fV4z1YQU4FTtqGRudRkq0mjzVv8
	xfm0B3nGtgNMHozpiu0EIbelQ51uvdSEa82SkOqy3aJ6VCMm0TcLpB2aU9mQVdW6uJ5NfFzcn7dLT
	rionB0jKARuwHBCZsFdsk+1g8QMSvOuHYR7ptDlObMS1SrWjTe6XjR6Bby32ECm5kNYWCjtK72ZMj
	o3e7T/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unW1y-00000005NKn-148j;
	Sun, 17 Aug 2025 05:34:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVuD-00000005Ml1-18pt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:26:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so2243109b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408369; x=1756013169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=N4+d9VBYcVozegvQ+VBhrX08Ryv0dtD7+cbIhNlYjcmecgd71eq9etfRa0YWS4qqsg
         A13Plfw+GpPk53w1Fbni6bWZoFPNWzVuSko1nHPxFXLMEP4pkLhN1d91rw1efv+FvBe+
         PVgFUHIJK0krnLUVZQB9HzE8zo29a3gEzTQDEOdvuVPnvWnvd0XXbhAs6C/XkcU7hMD2
         FgzUR9q127NLptHEUVQV6TXQNEBGhKB7MpP1i2XX8YVmBj19rsRSkfA+NVo49YmPcMv1
         /Sxz4Mf5br1k56oiDaMlTwhcLYgwUevR9Rar70GYLoDcLtEz7gfQsHP1iEZdFaw9cH9v
         ozhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408369; x=1756013169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=A8sGiQSnyGa5VbXsDIGDHzihEtGGXenehmdVzH7pvONm/Bei+besDpNR7Zw/uNJ9Xz
         u5uzMyhR7x9Uz+TkN3LPwuZruL6Kx/XNWmGxUlGAp6ILfoTTtURx53Heir2b2vyJ/kaU
         YZjG03cjfxMcZTmNKoBLD1ww4sffjx97uM+K6gW5BVpC/PIoIz42O1PBCFYPS9S3Lxbn
         rKHoRDJoLYYEjiEJIqiP/0SvdvGyf4JDLs8cIqsR8ErWsA+scaodBF6nlBQJSsbOpvUw
         1uLjgfOrtvpRHrkip8WVeBmSrVEdMLqfT7CCEj8FRPOJLhAUc3nq9XugmSRHF+iu4F3/
         QX8w==
X-Gm-Message-State: AOJu0YyZfHOhSienEKumgE4eEZqx3XqTVtbu2P6/v+uMxiDDTF2o44h2
	36EdVfgXjCFaDZgaqYQBjkZCbsyKQ5Oxrla23kTs35NrUf9SHyDhbAVonQVwKg==
X-Gm-Gg: ASbGnct4wRaajyVNAI4cApGnu0pJXFBTYSgKeceFzPsuuQFUAfhcRJDscmP98kT/GOQ
	qx0/F9l3igkT9OzXoU9zQ1cPUvT3G3+tM4p0NrtoL71KXW2hr9Sp7WdkAISeV49Z3ZceiD5bGIl
	1NB6CLUPY1IKtrFdeh9DMtT7WEol3JXgY16OuSrejkdf3oCtQgdz7c9MR2R35sLVRjBroa2vJdp
	uY3JSzpy9zDI1QBrRY9E9QD6UlZm/WHni+nI4TXxhOJ2Ow8qDRHI2rpBMMOuAXJyoLf32q3njkO
	9NREx5gqe9FT/6qvNQLKg9H8HcQNunJFXz4J9EkmDXRxRvW5bxUi8i9OYyGYnkDHxf2iK4fT7Cp
	RyVAshluUlAsqTFEQcRL4+M8M2cfn906wkdUTKFAS8F+xFuj4cOUr
X-Google-Smtp-Source: AGHT+IHtIqiE8tKlhMXE2qxS2ZYVqePYlVExN8CDQA3pcKM3jIJ9iKgzjQ3BjPsu7v0SQMmcXr8yGg==
X-Received: by 2002:a17:903:fae:b0:243:8f:6db5 with SMTP id d9443c01a7336-24478edad87mr56831225ad.6.1755408368594;
        Sat, 16 Aug 2025 22:26:08 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d592448sm47417625ad.161.2025.08.16.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:26:08 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 1/3] kselftest/arm64: Remove extra blank line
Date: Sat, 16 Aug 2025 22:25:50 -0700
Message-Id: <20250817052552.8953-2-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
References: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222609_312755_1F784D37 
X-CRM114-Status: GOOD (  11.23  )
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Remove an unnecessary blank line to improve code style consistency.

```
[command]
        ./scripts/checkpatch.pl --strict -f <path/to/file>

[output]
        CHECK: Please don't use multiple blank lines
	CHECK: Blank lines aren't necessary before a close brace '}'
```

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 6 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 002ec38a8bbb..27d4790c2f0c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -55,7 +55,6 @@ static void cmpbr_sigill(void)
 	/* Not implemented, too complicated and unreliable anyway */
 }
 
-
 static void crc32_sigill(void)
 {
 	/* CRC32W W0, W0, W1 */
diff --git a/tools/testing/selftests/arm64/bti/assembler.h b/tools/testing/selftests/arm64/bti/assembler.h
index 04e7b72880ef..141cdcbf0b8f 100644
--- a/tools/testing/selftests/arm64/bti/assembler.h
+++ b/tools/testing/selftests/arm64/bti/assembler.h
@@ -14,7 +14,6 @@
 #define GNU_PROPERTY_AARCH64_FEATURE_1_BTI	(1U << 0)
 #define GNU_PROPERTY_AARCH64_FEATURE_1_PAC	(1U << 1)
 
-
 .macro startfn name:req
 	.globl \name
 \name:
diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 124bc883365e..3dc195f977ba 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1569,7 +1569,6 @@ static void run_sve_tests(void)
 					  &test_config);
 		}
 	}
-
 }
 
 static void run_sme_tests(void)
diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index ea9c7d47790f..2d75d342eeb9 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -690,7 +690,6 @@ static inline void smstop(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr");
 }
 
-
 /*
  * Verify we can change the SVE vector length while SME is active and
  * continue to use SME afterwards.
diff --git a/tools/testing/selftests/arm64/fp/zt-ptrace.c b/tools/testing/selftests/arm64/fp/zt-ptrace.c
index 584b8d59b7ea..a7f34040fbf1 100644
--- a/tools/testing/selftests/arm64/fp/zt-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/zt-ptrace.c
@@ -108,7 +108,6 @@ static int get_zt(pid_t pid, char zt[ZT_SIG_REG_BYTES])
 	return ptrace(PTRACE_GETREGSET, pid, NT_ARM_ZT, &iov);
 }
 
-
 static int set_zt(pid_t pid, const char zt[ZT_SIG_REG_BYTES])
 {
 	struct iovec iov;
diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 989f75a491b7..1e6abb136ffd 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -165,7 +165,6 @@ TEST_F(valid_modes, lock_enable_disable_others)
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(mode, PR_SHADOW_STACK_ALL_MODES);
 
-
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
 			  variant->mode);
 	ASSERT_EQ(ret, 0);
-- 
2.25.1


