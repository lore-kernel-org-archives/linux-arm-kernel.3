Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F15EB597B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg6rUiFx+q06U0spbnVO76byiw3N0jzh2FjIOHbS9H8=; b=q1sX1xG4oaB8cwwd6/1kGrjf8s
	J4dSOoqMGBN0ohVGGEuC1Hy7HaVIwXNfgHDKQ3U3/X4b5jfTePB7YhF0opgtklpjxCrEf18gYNSDA
	uj+c8S/r2UvpYMVZqGHmse4oxwqUuvyPXN3a+n1nOk5zxiLf8TQDZoQHEsvHYBJymT+jWdINQZ7wr
	v1wttkNpCh59hTd8W5gH1Lox9p6W2o9TaWUHMgujP3QkLxGosKAnfIXDaAevfeUkLf7t1idJbI8WN
	7SezbAj+ztXPPAYcTkIJ14rbsv6tYUwXQeRbfUS2m59A++zg9Dk0OED4QUqgfAGGDTk/oy3GcQ1bP
	hLo8EW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5WG-00000000O2t-0nYg;
	Wed, 11 Feb 2026 08:24:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5WE-00000000O0f-0HZz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 08:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jg6rUiFx+q06U0spbnVO76byiw3N0jzh2FjIOHbS9H8=;
	b=Mnwo53ArF/UDBoE3bsjVIWZz+MkFxTXWR2q+BQA2T82sr0Ny3bskFOQY+ErwPkflkQaW8Q
	1J1GsbgazhZx3ECRVb0WEJ0rxPb5N0nT9NzSi2fImclgwQEeS5MYcUJYOiUaCuktNy1zjF
	IrTcsbDKKA3fUToW3CVl2RhsvIQ+Nxs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-rU9Nvn7JMqiNqEbcND6ffA-1; Wed, 11 Feb 2026 03:24:15 -0500
X-MC-Unique: rU9Nvn7JMqiNqEbcND6ffA-1
X-Mimecast-MFC-AGG-ID: rU9Nvn7JMqiNqEbcND6ffA_1770798255
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso5878832b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 00:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798255; x=1771403055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jg6rUiFx+q06U0spbnVO76byiw3N0jzh2FjIOHbS9H8=;
        b=FlLDpxhACWyrf+tBIpHCyFohbjb+HlxvtWz9C5eYaX6WJJEc9yThDRTNYAjpfrqOPn
         NMjDjAxvpjSUJR9G8HpwEBpCmGiJT9jRxDqGWVw1RYUzgxxBeybDyRaS+aDNEDMyOq18
         XNcnFrhhWvI2sko0lFq0x/D6XqKyAl1e3Z2EVcWaxzzrn2YUgy/xbutkUOAWp7/e4inh
         Ih6FE+kET9oZOuAXnd+vE3juhe3dXvzCY1HxCJmQ4j2v3pgxXodFpf7jrZBwSjJ/rlAf
         01ArAw2lieHgKtUFHjIlY6ZpLYcPmZ61MT25Ea78AHbaX4g24dRNIk/sE5BzYkeCgQK/
         iETA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgZxK6gSZ4GfmvJB32BgDlc3aXdiBWEy5zUqdVB9RyMyVmUraSr326TVV8KaOx4wNeAer+UVKgJOEVW/DZv1n@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzZSTVgOngm95TsvQ3TYiNwaf+hUVi7c8Pw2lxK99bux0pRiU
	5SZoHhjZUSkYBprmkjy7gHXsSPEGYD9PDp4VEOcia6IzLJMp6n52kg5Bm0Fx+Xs9hzPxRbHlODH
	kG9QjIFiXHSRJMx/vj8T0p8CdZ896kzCKqbS0k/acxukSmgqZY75mkB2yYCqUcBNLWoQh7mvG7p
	xg
X-Gm-Gg: AZuq6aKmai3BhNB/M21joG/kbDNFq16w5ltl8Th7SFSJGeAxoqfzFtDC97a/qJWJEVi
	rgRJXbpWg/f0bkTPyJH+oGE2Rqr+nJ1iwuQEYKjFyVsrFMwZtieYLEdVcsASgczhepWjTGOCuhI
	0jEWfVWw7VYVyRs/eStwQV0LiQq9iSsguqGYJTgwO3MATY/baaMSvVehthMZpp23tb6w/x+9YOL
	2rPB3UMnf7azV01CvrK0s1XxZddYL7vBnT9kzZWUDhPof602lFdGLAvo9B2Fau6K1IRaag3pSSq
	ZcNdes3IoYswN8iGeo7jyuU/T5E2zS9Hozs+GlQPmD6QmP6oM19Or0VdwwWXQ4NCk0jDADa9ybE
	lm2cQGR7Ybhbt
X-Received: by 2002:a05:6a00:4211:b0:81f:c6d1:d167 with SMTP id d2e1a72fcca58-8249fdf39edmr1252046b3a.61.1770798254459;
        Wed, 11 Feb 2026 00:24:14 -0800 (PST)
X-Received: by 2002:a05:6a00:4211:b0:81f:c6d1:d167 with SMTP id d2e1a72fcca58-8249fdf39edmr1252015b3a.61.1770798253951;
        Wed, 11 Feb 2026 00:24:13 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e7d7136sm1228850b3a.42.2026.02.11.00.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:24:13 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
Date: Wed, 11 Feb 2026 16:24:00 +0800
Message-ID: <20260211082401.2407853-3-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211082401.2407853-1-coxu@redhat.com>
References: <20260211082401.2407853-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TN11rG4NHIBgXBzS9GhJdNn0Nta4EnxRKJAUO7akUS4_1770798255
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_002418_185419_DDBB71DC 
X-CRM114-Status: GOOD (  22.09  )
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

To also enable this feature for ARM64 and PowerPC, we only need to add
a device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
the memory address of the stored info of dm-crypt keys to the kdump
kernel. Since this property is only needed by the kdump kernel, it won't
be exposed to user space.

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
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 410060ebd86d..b6798bb2bb82 100644
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
-- 
2.53.0


