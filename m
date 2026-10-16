Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607D1CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=; b=Xu8v+CRmoZFn7MHWvYCC6kMFEZ
	RTUsXJbRkTyIQPZjxGrLxkda6RNF47u3SpUwAhlpdJWx3plz6ZK2pIeNNG01wFv6rjNuejVwYdh7a
	s2sb3r/hHgdieKQ7601UjDIgXfa+zfbVwpafd/l7PxjM6J5EIMv3AVDkDBPzZJVoZLmsvF2+TdV8U
	QlL8Gtm29B0K682akAF9obTPLubsOuwKBj73VkURitan35vSzBMOLaoJbxvshRXPQg+M+TG29ElAY
	YCDJ3oOgYvy0ps8pwW07GxxhRCaajZiIkw9gQjH0+FY+ec+O/1yYpiAdtpoPCRli8Uh4Yi3xM/DH1
	chxwd44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFM-000000025PP-30Lt;
	Fri, 16 Oct 2026 06:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFL-000000025O2-2I0Z
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=; b=A7+7vRr3oSt+v5mEA9pfqZKA9P
	8hE/m/pXhhpN1M+saEFUFrwjlWi2pORQyZsFlb4z84uDnGz1baSGz1wir+VqulaRNykR4OSrG7PdE
	dtONRwvlgQf2fO3RIJONczlcObjuu2UpRpihX0vmz253TlDXhtl1E4aYY5+92eJA1Lhe+Aeaj+Dvt
	pN6BjawlXC+cOUyMgKuWS7wzc4POXCCDvyON3EJzCJQ7+97SKtkbnBhlSnuf61T6YTJh179gSsGhF
	IzUHKBoRMF7FQmFvBFuVprGNx49BhgFiuWqIgXrgjc2732KQfODsng1//GJ/YlxFWBl+lVk8ZesUU
	rddIt44Q==;
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbFF-000000019f0-14Bk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:16:50 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-ccb794ce92fso507495a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131403; x=1792736203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=T9zk69T8s/L96Wm0Nd7BzSn9mUWT2BWgZd1plkgdsOxk4+nKRZNLM7Zk1EHiTSZ/Q+
         cEIzmbffZBU/2hChJ7n1urvzQ/Qpxsbb0d+inn3hOSXRgheQXJtlDYy/F4Kc9IISmw+t
         qcyIDzixCtDclrQju1IOpDj7NCNafb5DeTgxP8623ieT0gbE7oEuK/E93zki90Ssw5yS
         z4QWzYUexgJ8lVlv7GtPTLqYcwOdbKw4YL8aScwqk6IDmi2ABGhOHpQ0ewOIz5ymuQ6b
         rUFssHlA8e7MkuKcg6bR/qg/qaKNXf54CJD0aFaJL8dIk9srIgcSwIsEBHEuPPbacpk4
         LHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131403; x=1792736203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=qu9GCSINza1dpp6ex0LUAiLEVLloXp6nX79BNkk2zzrV1zbIsHiASNvg9JTGpwIGMQ
         HBNJLev/p+qUFbDbtD0H3l9eF05qNvVtWgyWGH3pKl1/yoJM2DSFzEHJyVJC5ejR5AY8
         DTyDnj1iJCo8hed/2DwFsEQ9SFATS4NgPkcKi19/IlmizN/vmqRjIzlfO4yMYxplTqlA
         44HeF+iB5TKIUXt/ML9Adl8hS0m1IDJC9kqs3g6mrrMLNIe33xyGzgcuyqtxuw/uBwXb
         JX8rJ3V23UCbCvS8yjS1xQJN/y89dOhzQM/ojfSKMFwhCrkPLojMIDs19FpL1kUzj7e1
         30dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfa8nnww1scvs2xLa3RpdHXzaP751/n0XN2Q/pWOO0W4YoJsvVcEZ1ktW4z0izoAZePrqNmXg5DwYkxvihuPVN@lists.infradead.org
X-Gm-Message-State: AFq9FYK0aiDA5i9sFMul+AunS1ASNK/7w88wFrGvGaj5BjB3LoiKf3As
	y39SS9x0/zKR1FrElfCxn61/90PxyFZLsaM+sGI2aGmFIeQFOz5/al3x
X-Gm-Gg: AYBFou24W6vyZFvTzn5hQS5PU5C4ZJzN0CGgjc6ug83jgrobVxaxv/UuFu2ydOuVq5x
	IMdLNkEkq+nkLyWoneKCqTuhqYobZoeMfHn7lY/2JGeCnzluHnY9xpBCqCMYq0asInJK2gtETmj
	gYjH+ir93pTf6Hf3VF0quwvE4Wn5MYyrw9wxI+eIPz6qUK2XiIe+ZHoKMGJfdvAEnCMGO25hQgF
	kxTJ6Zx/Yuv15Xokc5qyMSGBC+nDcluUzzw3fSWiayM10RPf7vpKyQJMTd5UAU6AifBpC5QAiq7
	kLciy4hmOrq5Q4WoP8CSZdqIGL/q/F4y4m3FaCzaqpg0xfcxixA6chSFk4aUXBd65zpobUts5Xx
	1lAojXg1yQeyKxcw8/Rz2bQATqHol9HrCmDAqxynWSL7ZDf7UsdVLcbdTGJ/Zsd7M1HWxmBtGBm
	iDd8YDMI+/Qv9kXdtHDjb5JNje9zDGxE29+xILweU8WXdfsSpndQNONVK/A1PvoK+1mxN2oYO4o
	4ihSc++esY=
X-Received: by 2002:a05:6a00:2e87:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-897c6a340eamr18515355b3a.23.1792131403430;
        Thu, 15 Oct 2026 23:16:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:42 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 16 Oct 2026 14:15:44 +0800
Message-ID: <20261016061549.4181390-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071648_271269_6CF99087 
X-CRM114-Status: GOOD (  17.31  )
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

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0


