Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F1EF5862
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=; b=4J9usfurZROEVVzP+/ke14mT5Q
	6Bo92lFh0bnOOvhJN/Hyof3p1CSdyBM4qS1cm3nDMZ6tNY8MSwZankyMjd6eA5GK2do/jeoIyBmpm
	uv/ByTJF9wClYJtsoCeTTSOEGbv4B/Cg16pmJNLw3AriY8FA83uRpWcN7BeiSjnLbDqzLLw6TDX+z
	geoS3CJXFQBSooiRNZx+ImuGNfw/dm9F64U0c3i6K1XlIQi8YhmpXRIA2VArIgGpYDCw1aWsCjtUg
	hj0kUuRyAXij4o2CRPoVuJX8twXrUwvX/qeXaFP24FkTwkFZ+D5agMoDjGYN3FKs4pHqY76uUCUwa
	Jf5pd5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80M-00000003HCQ-2Puk;
	Wed, 25 Feb 2026 06:04:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80J-00000003H9L-3xyv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
	b=LQLUxM88ZDe++7AXfB/ju7650xuX8m65+f94yEu69JLlOniBTZNnNyDVaZ8jLW5MvhXYXs
	oOXLdUZmFtfECY0ipKnlNVq2+8dRm2bDct4n5SK/VzZJopY3URhOYIJCSezWY4oo9RNAle
	wapvTnr5EVPDkDMdgzNRY6gaEyjDy2Q=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-UHLh8DrqOj-2Akkg5u24zg-1; Wed, 25 Feb 2026 01:04:08 -0500
X-MC-Unique: UHLh8DrqOj-2Akkg5u24zg-1
X-Mimecast-MFC-AGG-ID: UHLh8DrqOj-2Akkg5u24zg_1771999447
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824b3532298so2857127b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 22:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999447; x=1772604247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
        b=AatBR+Zb6FbSPZ6gUOlB2j29tQ6kb0n73pyMj/M1DyxaOVbBVeggL/yrTBv4UilT0I
         CvvBe1KXb44Lx07hqEJxSpySd0bsLi8vRMla+5jMX4QwqDCDn9H8+lcrdy5Vh3oRMv3A
         Nfsv1uDNt/J34lPQuC2kWykByLWjs1pcKoFr9Fk62T8yXw7VJbyxYPI9HrmToFTbaiuc
         Pc2H2xdp4nxxFWr7Bah8TZUejFU3xDc4eS9CpRosXnJrh047/sBFj73VNbhVeVFhtI4y
         Lxo0fblJU6BAAq54cEQhXlQ82tSrXwMPdIcNN5vaSfR+4pUD0jY9dfs69qveBxbRR75o
         M4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWUqeJ11/6vz4Thm6bzK5sxaZKep4YEtSijo07A23IFODrayuvS2bC0+2mIGoXeaCuXuk0XAmtua7B9xoX1BvA6@lists.infradead.org
X-Gm-Message-State: AOJu0YyNLWf8uE9fslHQ23gNksznUGiJpo9ZJRWdvIBrM30EM1CZsXd0
	bsqCiuAjTaB+194xcMOJ/8T+IKinUoBAs9YhwIcDXz1PKpWs4kVkoXlH/+JhJFkyyhlWWTygKnl
	V5KBkQ93OgZCKWGFOJCIHhQ6R22ChEzXn1MYfwpf43oXWjAcZAokV66evZemhpzCCDwHrRiJ5MK
	rs
X-Gm-Gg: ATEYQzwIkAtlrSufUfyfjsb4su6EHPV3LAaNGS5L6Jan7T3yXJ2/fcwcex0eV6c2HAf
	1SiXAh4Y7GaRWgGefmekgAMjaYUicUgYdW7OKRitVCf057adu+cKRmPhSlMDREV96Da5T7Pg+KU
	2JcJerXuQqmr+BMFwcddCYGyIuwySfTkZOhGeA0rIBf9OfNiJm1VGEqwBqhkLTylwC5jt/1Ar6J
	gO4jCx0zfH1K3s6G22XrSlfh7bLIuGA1hzSPR6lLqFlLdRRFJ68ms4hHB3YUowG7qfSVB1XxSRB
	8oBYm/at5RNsKZT+rXCrBZWN5TepUbgwgA8PlMYXVjoxskssy502UPTmekNFwksKoJvnLEBBlkD
	Yv5HIwHOPXFkY
X-Received: by 2002:a05:6a00:2997:b0:824:adf4:5a32 with SMTP id d2e1a72fcca58-826daa01ffcmr10872366b3a.42.1771999447100;
        Tue, 24 Feb 2026 22:04:07 -0800 (PST)
X-Received: by 2002:a05:6a00:2997:b0:824:adf4:5a32 with SMTP id d2e1a72fcca58-826daa01ffcmr10872341b3a.42.1771999446454;
        Tue, 24 Feb 2026 22:04:06 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ecb2dsm12330215b3a.60.2026.02.24.22.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:04:06 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Baoquan he <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
Date: Wed, 25 Feb 2026 14:03:46 +0800
Message-ID: <20260225060347.718905-4-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y8H5bbGYLX54TT6B6i2fq-LIW6Ak9oGlZ7nPXZa_K0E_1771999447
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_220412_051031_A6D2E3A3 
X-CRM114-Status: GOOD (  23.68  )
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

CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
device dump target by addressing two challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

To also enable this feature for ARM64 and PowerPC, the missing piece is
to let the kdump kernel know where to find the dm-crypt keys which are
randomly stored in memory reserved for kdump. Introduce a new device
tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
memory address of the stored info of dm-crypt keys to the kdump kernel.
Since this property is only needed by the kdump kernel, it won't be
exposed to user space.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181

Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Kairui Song <ryncsn@gmail.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thomas Staudt <tstaudt@de.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index fba260ad87a9..e31fabed378a 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -134,6 +134,10 @@ int load_other_segments(struct kimage *image,
 
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret)
+			goto out_err;
 	}
 #endif
 
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5d6d616404cf..ea50a072debf 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -79,6 +79,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			goto out;
 		}
 
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret)
+			goto out;
+
 		/* Setup cmdline for kdump kernel case */
 		modified_cmdline = setup_kdump_cmdline(image, cmdline,
 						       cmdline_len);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 331646d667b9..2967e4aff807 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -866,6 +866,26 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
+static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
+{
+	const char *prop_name = "linux,dmcryptkeys";
+	const __be32 *prop;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
+		return;
+
+	pr_debug("Looking for dmcryptkeys property... ");
+
+	prop = of_get_flat_dt_prop(node, prop_name, NULL);
+	if (!prop)
+		return;
+
+	dm_crypt_keys_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+
+	/* Property only accessible to crash dump kernel */
+	fdt_delprop(initial_boot_params, node, prop_name);
+}
+
 static unsigned long chosen_node_offset = -FDT_ERR_NOTFOUND;
 
 /*
@@ -1097,6 +1117,7 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_dmcryptkeys(node);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
 	if (rng_seed && l > 0) {
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index c4cf3552c018..fbd253f0d3c5 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -423,6 +423,25 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 		if (ret)
 			goto out;
 
+		if (image->dm_crypt_keys_addr != 0) {
+			ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+						       "linux,dmcryptkeys",
+						       image->dm_crypt_keys_addr,
+						       image->dm_crypt_keys_sz);
+
+			if (ret)
+				goto out;
+
+			/*
+			 * Avoid dmcryptkeys from being stomped on in kdump kernel by
+			 * setting up memory reserve map.
+			 */
+			ret = fdt_add_mem_rsv(fdt, image->dm_crypt_keys_addr,
+					      image->dm_crypt_keys_sz);
+			if (ret)
+				goto out;
+		}
+
 #ifdef CONFIG_CRASH_DUMP
 		/* add linux,usable-memory-range */
 		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
-- 
2.53.0


