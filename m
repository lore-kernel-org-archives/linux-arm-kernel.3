Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D86C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C3WPuCy+qpuZZVpz27zDoZpe8zx2Xoj4eG92N2KUaM=; b=MW6J0oN/hvfXInGnfe4fICxNYZ
	4qiuUywnOY2UlyCIdhsRaOly0Squo7JDbrb4xlrH5fk15g0JRuJ/WFBEnGgo0Z19Zqx0ETAXF1S2n
	Y4I/m2hi5afTgS0n1K0ThnjNhVJNI18tmjX2jSGMWJ2f9xVUS5DjTNwxxy9uaIMtDneiPcyTjbUJH
	2479aJ/GxCLroiW6lyISOZR8JJWrMjxsnUjzA+5oNPJ4HwCcYYuMocJrpyY6up+Q192qL1LkydMU1
	UT0ixJ9wCDcErUQSxxruu4wo7h2UtB8Ydsabh0fOGhoNiyeQGdXS+uz/A3Q/rbRURm/ZPnLNh+4go
	9sniS7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhr-0000000DYV6-2toO;
	Tue, 06 May 2025 22:24:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTg-0000000Cjz3-1Yue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so33570005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550147; x=1747154947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7C3WPuCy+qpuZZVpz27zDoZpe8zx2Xoj4eG92N2KUaM=;
        b=qzfhHuAs+yVaaqrzePd4WaZPO5Kkaq1owuho0i5cMSn1/j8IV23iHOxPnG0xdz8vqm
         SRius/NDywgs1l1M87FLkp3W4a84Gg6+Bu1A9Ek8DyDg7RTZSS4MKoRWJSyCYHXBsCpL
         jiHHeHaV825EXCDolSA+7rQkq0TKyzuLLlFMH6mZ4PcT7/9Ou/8v2d9BhxjaxM1eN5wJ
         pIaBeXroQPt7paJNamJEFfL2V3c18BazzkPTyOTG2vfSlL6N1zOC7ev3+W8Xwk+r6eRR
         fT57xDCR/8qCje7xDOZMuFqPmgzwhW9y2t49zfBMqTv5NYfWZr9emhcncmFXh4KzfoaI
         /sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550147; x=1747154947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7C3WPuCy+qpuZZVpz27zDoZpe8zx2Xoj4eG92N2KUaM=;
        b=J+oSjpP3fALA0zl/U4wKPt69ztb4Ke+qBCyn/27LvMsmUpbQCA/6qVNlHuHbA+99iE
         oYBP4jE+lHi3SJ4JRqJErBnm9sZ655JkY+gJcSrbGRYvj0SbVyXBjETvbnmUCI8zSucw
         2ABaFaucRo8DmN8MxpZ1oV2WDyVdrOwX5Z7TrtyUKTEpiC+Q0NDIzdBVg9g2yjnPAH3z
         U9L1S78vg2BY7iyZG6ayq9yk4bVAywT8tK7m1vTNObMhXCTTSaJCN8sEBkb7GoT4l2LP
         h8pcdnNsNXpL/sHtznqtQJoMgFIgjj3uCv4KVCRgWuthtrAOizoZx0R0IqeebhBDK2Ep
         KOFw==
X-Forwarded-Encrypted: i=1; AJvYcCUlp8L2K+oqgzgZD5oInrTelH/As50Laiz/6ms9Pc98bVNHHO6ZcMET/D0aso+3dMUToWWzaS1xLlgaIzp4nGYi@lists.infradead.org
X-Gm-Message-State: AOJu0YyqMFgepk7BqAvUN8ByPXstUD5404pvSo06rz3ELLvcVumL1rxf
	wsrZQwIpz/4V3VEO992xkGQlJoDPvfg2y78nzz8fsBMsqdqzKN9Vsup0ZYggTX0GbzC1nPITdgp
	vbjNZ8eAUcEvgfx0XQQ==
X-Google-Smtp-Source: AGHT+IF7ojYXqkZ5V+iTaYolJ/Z6/ACckxfH3IbRRaRpxwKWSi1sy6gef3xj2zw6+90icnL5SP+LXnZpGd7RLvBG
X-Received: from wmhu9.prod.google.com ([2002:a05:600c:a369:b0:43d:1873:dbaf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:870c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-441c48b0293mr115167875e9.2.1746550146800;
 Tue, 06 May 2025 09:49:06 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:11 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-16-vdonnefort@google.com>
Subject: [PATCH v4 15/24] KVM: arm64: Add .hyp.data section
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094908_411610_17481F5A 
X-CRM114-Status: GOOD (  13.91  )
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

Allow the init of non-zero data in the pKVM hypervisor by adding support
for the .data section.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 40971ac1303f..51b0d594239e 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -11,6 +11,7 @@ extern char __alt_instructions[], __alt_instructions_end[];
 extern char __hibernate_exit_text_start[], __hibernate_exit_text_end[];
 extern char __hyp_idmap_text_start[], __hyp_idmap_text_end[];
 extern char __hyp_text_start[], __hyp_text_end[];
+extern char __hyp_data_start[], __hyp_data_end[];
 extern char __hyp_rodata_start[], __hyp_rodata_end[];
 extern char __hyp_reloc_begin[], __hyp_reloc_end[];
 extern char __hyp_bss_start[], __hyp_bss_end[];
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5e3c4b58f279..9c5345f1ab66 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -131,6 +131,8 @@ KVM_NVHE_ALIAS(__hyp_text_start);
 KVM_NVHE_ALIAS(__hyp_text_end);
 KVM_NVHE_ALIAS(__hyp_bss_start);
 KVM_NVHE_ALIAS(__hyp_bss_end);
+KVM_NVHE_ALIAS(__hyp_data_start);
+KVM_NVHE_ALIAS(__hyp_data_end);
 KVM_NVHE_ALIAS(__hyp_rodata_start);
 KVM_NVHE_ALIAS(__hyp_rodata_end);
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e73326bd3ff7..7c770053f072 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -13,7 +13,7 @@
 	*(__kvm_ex_table)					\
 	__stop___kvm_ex_table = .;
 
-#define HYPERVISOR_DATA_SECTIONS				\
+#define HYPERVISOR_RODATA_SECTIONS				\
 	HYP_SECTION_NAME(.rodata) : {				\
 		. = ALIGN(PAGE_SIZE);				\
 		__hyp_rodata_start = .;				\
@@ -23,6 +23,15 @@
 		__hyp_rodata_end = .;				\
 	}
 
+#define HYPERVISOR_DATA_SECTION					\
+	HYP_SECTION_NAME(.data) : {				\
+		. = ALIGN(PAGE_SIZE);				\
+		__hyp_data_start = .;				\
+		*(HYP_SECTION_NAME(.data))			\
+		. = ALIGN(PAGE_SIZE);				\
+		__hyp_data_end = .;				\
+	}
+
 #define HYPERVISOR_PERCPU_SECTION				\
 	. = ALIGN(PAGE_SIZE);					\
 	HYP_SECTION_NAME(.data..percpu) : {			\
@@ -51,7 +60,8 @@
 #define SBSS_ALIGN			PAGE_SIZE
 #else /* CONFIG_KVM */
 #define HYPERVISOR_EXTABLE
-#define HYPERVISOR_DATA_SECTIONS
+#define HYPERVISOR_RODATA_SECTIONS
+#define HYPERVISOR_DATA_SECTION
 #define HYPERVISOR_PERCPU_SECTION
 #define HYPERVISOR_RELOC_SECTION
 #define SBSS_ALIGN			0
@@ -190,7 +200,7 @@ SECTIONS
 	/* everything from this point to __init_begin will be marked RO NX */
 	RO_DATA(PAGE_SIZE)
 
-	HYPERVISOR_DATA_SECTIONS
+	HYPERVISOR_RODATA_SECTIONS
 
 	.got : { *(.got) }
 	/*
@@ -295,6 +305,8 @@ SECTIONS
 	_sdata = .;
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
 
+	HYPERVISOR_DATA_SECTION
+
 	/*
 	 * Data written with the MMU off but read with the MMU on requires
 	 * cache lines to be invalidated, discarding up to a Cache Writeback
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 68fec8c95fee..58e8119f66bd 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2604,6 +2604,13 @@ static int __init init_hyp_mode(void)
 		goto out_err;
 	}
 
+	err = create_hyp_mappings(kvm_ksym_ref(__hyp_data_start),
+				  kvm_ksym_ref(__hyp_data_end), PAGE_HYP);
+	if (err) {
+		kvm_err("Cannot map .hyp.data section\n");
+		goto out_err;
+	}
+
 	err = create_hyp_mappings(kvm_ksym_ref(__hyp_rodata_start),
 				  kvm_ksym_ref(__hyp_rodata_end), PAGE_HYP_RO);
 	if (err) {
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
index f4562f417d3f..d724f6d69302 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
@@ -25,5 +25,7 @@ SECTIONS {
 	BEGIN_HYP_SECTION(.data..percpu)
 		PERCPU_INPUT(L1_CACHE_BYTES)
 	END_HYP_SECTION
+
 	HYP_SECTION(.bss)
+	HYP_SECTION(.data)
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d62bcb5634a2..46d9bd04348f 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -119,6 +119,10 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
 	if (ret)
 		return ret;
 
+	ret = pkvm_create_mappings(__hyp_data_start, __hyp_data_end, PAGE_HYP);
+	if (ret)
+		return ret;
+
 	ret = pkvm_create_mappings(__hyp_rodata_start, __hyp_rodata_end, PAGE_HYP_RO);
 	if (ret)
 		return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 0f89157d31fd..c462140e640a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -262,6 +262,7 @@ static int __init finalize_pkvm(void)
 	 * at, which would end badly once inaccessible.
 	 */
 	kmemleak_free_part(__hyp_bss_start, __hyp_bss_end - __hyp_bss_start);
+	kmemleak_free_part(__hyp_data_start, __hyp_data_end - __hyp_data_start);
 	kmemleak_free_part(__hyp_rodata_start, __hyp_rodata_end - __hyp_rodata_start);
 	kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
 
-- 
2.49.0.967.g6a0df3ecc3-goog


