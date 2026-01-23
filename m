Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16ED72349
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nA8sXD0FqzkneEAx9yV9Y9lTP0hUm1k+5svU6+Gfnes=; b=Y5PjeLlymlm/4pmZvI2htaHFsq
	LChgEBQ4cA4eiik7NlUPBAT7eNGsFt2q0hejB5vxN8qCgjSTWXIo/iyfLOgWbEow/KzM7SRaJJYTN
	CeTZu7aBT4u9ujap1vw0k8c0nmuDjdo/ivWGg33ltZy2B7R9Fm6ScR41P/esn2hKcIydZQT0tWlhK
	LZQNy5PkRtixADw18dhDPLxVATku3a2qzRypfyy2wsiIrLrihWLs8NidcvINshjpcm1Qlh84JgKeD
	1TISgx/DUJFvyaBkHHB2ldZ2SSH7oqsZjSkQNfeX5+/+YjbqVQxhn7idIV1Z9Km9h8xzUWT5zvsqt
	gUeB4dYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCIW-00000008RTh-48wx;
	Fri, 23 Jan 2026 08:13:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCIT-00000008RSE-1zN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769156016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nA8sXD0FqzkneEAx9yV9Y9lTP0hUm1k+5svU6+Gfnes=;
	b=aBMJS16Zh3rD6wqirlwv+vT82mpO0Ts/dYHrR2oUYVNgvRAP3b1HjscD/crZ47GDCP44cl
	aeDFxDvRxIo/ogp88gJe9J4C/E+sP334A8AMT+v76ihZx5VqWWg27RIQYxYhpuQ9wCM2qp
	/R73tRdSXZDW4C7u++fI++jbP52itg4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-ABqTYDsdMqmBQ0o31A7ctg-1; Fri, 23 Jan 2026 03:13:32 -0500
X-MC-Unique: ABqTYDsdMqmBQ0o31A7ctg-1
X-Mimecast-MFC-AGG-ID: ABqTYDsdMqmBQ0o31A7ctg_1769156011
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82323cc7594so12014b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 00:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769156011; x=1769760811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA8sXD0FqzkneEAx9yV9Y9lTP0hUm1k+5svU6+Gfnes=;
        b=jVEx3D1teyKWPbZB6NQlwIAIgAV2M5PIAT82Gl2jxW8odXVIPAJpOjNRHDQy0tQXsm
         x6ylOUP+k1RIsofAgyGQJwGiEq9KU1LONHxX5VPhwrdoHaVLPDumNyk/Ny2DU8ZFH7HM
         2jAQPPXM6QMW+QVRuVg8sAqWJ+Ig04EQaoqrGXBI2CufW7AUos8HMYPlg3gbZHL/ivfS
         Y6INrPkXY/mJUAtRUtQKGcWIdKBtCb3KcX8KTbu0JrDc+5qnr3dIqpo+RmeEu1dhHXpp
         535iW7GoS8Jo31yWrLATVLLRVaqiRujY98fxy3uQO6THQJQbSZZnZQu4l2Z4lIiGPvon
         q/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWeewJEHkfTX3/+Wu0xyC0VXl0MV+V2UC02jjPmq42XJ7rw1954HO+mxMDErXRLdGvQdPx88b6JzKhBsdsrKUdT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3tLR22orC5rmRKs/wZWcu8g0dWWnleR98BU9tOzFClLY20JBN
	ftura6fBSrvk+F1n6ouBG23kdGbobsK62yQSVyWXMnQzJNQlavtACh6bHbtP3YNUJcdx+dzLeP+
	FulpVeEZxBXUfxGe/E8lvEGttjeJqWjeZ/oTbERohF1QeAL6tWSyuvLAt/9+CIDAIMvUh2xX0Mg
	iv
X-Gm-Gg: AZuq6aKUNbqg4QIxsqmU2j8/l86e6Ix5eRb5KPmOuv0O4lN0oO4vJgzCu1Krl+ghc29
	ydeklDf1Y0MzYjitxVMcsk7q7AGlyWRE04+4Cm0qnLp2/QOqWYhsViGUNuB87lhADuL4W4e3rhj
	OHH1mMtUBGHJRgL3FRdYMHx3Eve3Zn5T0UmeXV4QGaNWomXC057YTQHV8Z0whccVRjn8AOp0LZk
	L3EdWhZ13DX58C4FLMI7fsoYGOGoRZ6OkwNLeNOHruYWCq2oCFhngMkz54vFUh7oLkz6/IscMjW
	2zWqbL5ZLLBnckMowvs7VcEIC4CBAH10iL1n3PNeFVESSd6MQOkmmbM/zvShJe9FeA13NBZydWy
	t
X-Received: by 2002:a05:6a00:1885:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8232178898amr325075b3a.66.1769156010905;
        Fri, 23 Jan 2026 00:13:30 -0800 (PST)
X-Received: by 2002:a05:6a00:1885:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8232178898amr325043b3a.66.1769156010374;
        Fri, 23 Jan 2026 00:13:30 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876f736sm1443202b3a.64.2026.01.23.00.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:13:29 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Baoquan he <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE)
Subject: [PATCH v3] arm64/kdump: pass dm-crypt keys to kdump kernel
Date: Fri, 23 Jan 2026 16:13:25 +0800
Message-ID: <20260123081326.1362666-1-coxu@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QCK4l2APt4HP9da8zhs5bof82k1pO1KGLcglQb8oUtQ_1769156011
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_001337_585013_75C6E017 
X-CRM114-Status: GOOD (  20.91  )
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

To also enable this feature for ARM64, we only need to add device tree
property dmcryptkeys [2] as similar to elfcorehdr to pass the memory
address of the stored info of dm-crypt keys to the kdump kernel. Since
this property is only needed by the kdump kenrel, it won't be exposed to
user space.

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
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
v3
- Delete the property after reading it [Rob Herring]

v2
- Krzysztof
  - Use imperative mood for commit message
  - Add dt-schema ABI Documentation 
    https://github.com/devicetree-org/dt-schema/pull/181
- Don't print dm-crypt keys address via pr_debug


 arch/arm64/kernel/machine_kexec_file.c |  9 +++++++++
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 410060ebd86d..5f3bad8ca96d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -134,6 +134,15 @@ int load_other_segments(struct kimage *image,
 
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+
+		ret = crash_load_dm_crypt_keys(image);
+
+		if (ret == -ENOENT) {
+			kexec_dprintk("No dm crypt key to load\n");
+		} else if (ret) {
+			pr_err("Failed to load dm crypt keys\n");
+			goto out_err;
+		}
 	}
 #endif
 
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
index 1ee2d31816ae..4bfb1ea5744e 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -432,6 +432,25 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
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

base-commit: c072629f05d7bca1148ab17690d7922a31423984
-- 
2.52.0


