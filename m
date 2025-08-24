Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B198CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=; b=DlOe6lO+fVhncgdWgBy2xQ0hge
	i4mJIO7lKyswirq+QS/oXA9Tg5XxmtDWgu00ImkBi5N+Cm3efh8tZgxaqSLJseFlcFWf9vPexWhpB
	Ea2Pl9lbMl1Eg98wCVaJlm40t3wW0pkJBo2plbeRqdGsAVj/jelqdzXgr61vjgnY5ZuvQInvcyK20
	NP4D8e9QO1K+Nl1PhVkVtdwjJ9UqRKsyalpnEsehWj9YivD0vw8qFFJrHpT7pIPW/OW8OCvzqavyW
	g9WRY/2CK5NNQTn6Yhm0VLlJAcSSSs9AHFMRcqe0jVDFwdeoAAI6h2elStwLToBMNoyYiIflm8Buu
	LhtOJyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq45B-00000005lZ1-1Q0d;
	Sun, 24 Aug 2025 06:20:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq3zx-00000005l5b-0Nkt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 06:14:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso4161393b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016076; x=1756620876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=BHmTRvXX2UflKGkpxuWElbY4vlUh+rInsmmjnGLKU6uVS5e7RXZj78SGzR8uM/bdnY
         Pub5odR/o6WE3G5duMFDNvmtzuBJpDKKSgNit5wg49qk7kYgSToIPxJfprN9NQ6J7HB4
         o61CyliZy/T/N/rfsyeeFZVj+dYyNvBpbs+ZT+cw3ZDgMv6Sbud5u4iaV03MKyXinLfO
         KhRQ8XI0Kh8w1BZrdleitCEE/VD0KkN4EyfGr1PHAxNl1MLiTSBvynjbEDyuuVVznTAh
         4N7QZ9tfgkMhDWwqBvOoJllvi1YWEmj3ZhPjxdGMJwQQ+Pm/hxFFV45TamqbX/bqmGyd
         HtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016076; x=1756620876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=MDo9OuEG7pHYTmvBE0MHeIpNGJKErxtXMti0Ku6FkQW83U49xZxAIBjT9KWpIABjlH
         Wf2HPTFEGHLsGohXC/Ar4B1IR1fxj9VCMGaVcXpugi0aA+/vg4aIoo2wUaXjReEoFjdf
         4RBeC0qAZr//+WtWLaO7g2I+TjxeKdDjWEmIyrLhokOrafUJoCu1kmyMn85rZzUljlGq
         eEc1h2t/Po0hB8qU834ACbXth+ABn1zz1KvjakwejqcRjJMclqJprI/MU0eGPjKY2Jpd
         +q+QOZXku3dC6AHGiP9Ks1FAAKkwo7ljdKARBCHJY/Bfo0N7nIFGKK9WOnBlCL3tnZl+
         wWwQ==
X-Gm-Message-State: AOJu0YznuBb+wGmteFRYHxymoIpMZ5X3WF13RYHHlNcNSQVpaqDwQ6yU
	lXM7Z/SgwIxfZrChdVgbzNoeLJPFUBV9zYAynwopvXVykBTK15CfD/RI
X-Gm-Gg: ASbGnctq8rZ9f48/G5w8C3GfKxFfR6BFmmoe6WN84hVopYVZPwi8byuJGvq948ZHSB5
	Pqmx5Y8MVmjsQoBxTN74XyMDZjmkayYGIXtiTzyPktt62y/+CLLlwtU2bpQiF9blkSfHS1ydCc+
	3xKunKoFMev3YiX2gsgKUHE7eX9oUajZUMCt0XfZSDz4P/4KPEGLCl20UdEII+t+mFSHrZzX9lT
	nBlSCJY7qmQtSzJgtOryUKHS+r+zCHj80kxzL9M0fb8UwVGmZGWeoWUzXRkt8lUH5LIR6RnJntN
	DN/SB/jF6umr09D1pJq5AAdytvf1dDuL4k/baQ+zU1mcsflZhlTaOhsQjuFvpSZmabx3ZBckXaj
	c42ST6dQeK5dM0xkD1mQzDJj7wDI7Tg7sNNQyJmUPINBTMdByxrAN
X-Google-Smtp-Source: AGHT+IGf7w3aejcMRspW0BPyWAdmCLwYhnOhUhtrCW6ul7LU9ibd0rIlZWCizAKLWAF8pA93qJtU7Q==
X-Received: by 2002:a05:6a00:138c:b0:770:2c2f:6435 with SMTP id d2e1a72fcca58-7702faafbcemr9453653b3a.20.1756016076256;
        Sat, 23 Aug 2025 23:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:35 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 1/3] kselftest/arm64: Remove extra blank line
Date: Sat, 23 Aug 2025 23:14:00 -0700
Message-Id: <20250824061402.13432-2-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_231437_131865_D2071E69 
X-CRM114-Status: GOOD (  11.38  )
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


