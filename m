Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A6C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLWNDAF0JZiAUCm/AxF5RSwmZmjZzyfu4AiJa0g8FhI=; b=EE9kYgHHtJgLBYh2VEjFvsXM1x
	jaZqAeFr0Mdk16fQupppBKd8F76vfDr5IJ/dVUbWrq3xcwFS/3uVctP2+YuA/kuRPHmNZl2Z5yHu6
	Z+c6TkC+7vhpd5sDEzXQDduGgkz+FAP4+vvtBH8lQGMgy5Jn8s/VZEvvC7USDFapzwJ0JDYnsoYLo
	n0l/X3VVKRGe7+qTkM3+hLIRE4uN+yy/hX4CN2TvX8a5ByaDLOzXakp4ChuemDdpt/K0N+HJ0NvIf
	01i2jLyN1+rNW+tHLy/PhORjv93155buDGP7OrwP1GWXFQEUfE0mxWaZTPmGG1t7HVU4DJ/2TR67U
	hRPIzYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FHa-0000000172r-3xOv;
	Mon, 14 Apr 2025 08:35:10 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FFj-000000016wE-49yJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1744619596; x=1776155596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLWNDAF0JZiAUCm/AxF5RSwmZmjZzyfu4AiJa0g8FhI=;
  b=oU1x+XyT+3S3PrTBpNJ21R77d+6+Kitq16gaH1sCsOBR0UYIMGHyU8aa
   5iz0zdK6qsStOmjMCkg1QJXYnqpoJgarnlw5WPvpZ2iILukNzae9e25lP
   +m16Kktddw1vaL7HAUlZaDkkREmMng2HXPK8tlM2NIb60JddXMuwdnyzN
   s=;
X-IronPort-AV: E=Sophos;i="6.15,211,1739836800"; 
   d="scan'208";a="395591120"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 08:33:11 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:33266]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.10.242:2525] with esmtp (Farcaster)
 id a1d5a350-33ad-40ee-b565-0d87d5ec1661; Mon, 14 Apr 2025 08:33:10 +0000 (UTC)
X-Farcaster-Flow-ID: a1d5a350-33ad-40ee-b565-0d87d5ec1661
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 08:33:10 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 08:33:07 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: <bsz@amazon.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Alexander Graf <graf@amazon.de>,
	=?UTF-8?q?Jan=20H=20=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: [PATCH] fdt: arch/arm64: Delete the rng-seed property after use
Date: Mon, 14 Apr 2025 08:32:43 +0000
Message-ID: <20250414083243.59664-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.13.227.240]
X-ClientProxiedBy: EX19D042UWB004.ant.amazon.com (10.13.139.150) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_013316_091242_B2B88230 
X-CRM114-Status: GOOD (  25.06  )
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

As a part of platform boot, device tree is being read to extract
randonmess bits. The 'rng-seed' property is used for that purpose.
After reading the value, the field was overridden with NOP instead of
being deleted or zeroed. The problem is that NOPed fields are later not
reused, and kexec code appended this property every time DTB is prepared:

  /* add rng-seed */
  if (rng_is_initialized()) {
          void *rng_seed;
          ret = fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED,
                          RNG_SEED_SIZE, &rng_seed);
          if (ret)
                  goto out;
          get_random_bytes(rng_seed, RNG_SEED_SIZE);
  }
(source: arch/arm64/kernel/machine_kexec_file.c)

Taken together, DTB grew at each kexec by 140 bytes ie. size of the
newly added (and not overwritten) rng-seed property. ARM64 sets a hard
limit on FDT size at 2MB, which means that after at most 14,979 kexecs
DTB exceeded the limit causing catastrophic (but silent) failure in
setup_machine_fdt().

This commits addresses the issue as follows:
 1. Call to fdt_nop_property is replaced with overwriting the rng-seed
    value with zeros.
 2. Zeroed rng-seed gets special treatment and is not accepted as valid
    seed. Warning is emitted on zeroed value.
 3. Kexec_file code is modified to delete the zeroed property if it
    can't fill it with valid seed.
 4. Proper error handling is added for the case when DTB exceeds 2MB.

The change was tested in QEMU arm64 environment. To do so, kernel
containing the change was built and included in buildroot initramfs.
Subsequently, kernel was started in QEMU. Using kexec_file, new kernel
was loaded and kexec reboot was issued. DTB size was noted in this step.
After new kernel has booted, another kexec_file was issued. DTB size
was confirmed not to change.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 arch/arm64/kernel/machine_kexec_file.c |  5 +++++
 drivers/of/fdt.c                       | 18 +++++++++++++++---
 drivers/of/kexec.c                     | 12 +++++++++++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index af1ca875c52c..af0e39f6c96d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -170,6 +170,11 @@ int load_other_segments(struct kimage *image,
 	/* trim it */
 	fdt_pack(dtb);
 	dtb_len = fdt_totalsize(dtb);
+	if (dtb_len > MAX_FDT_SIZE) {
+		pr_err("DTB exceeds the maximum size: 0x%lx > 0x%x", dtb_len, MAX_FDT_SIZE);
+		goto out_err;
+	}
+	pr_info("DTB successfully created at 0x%lx (length 0x%lx)", (unsigned long)dtb, dtb_len);
 	kbuf.buffer = dtb;
 	kbuf.bufsz = dtb_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd89..8c2895cee682 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1019,6 +1019,18 @@ int __init early_init_dt_scan_memory(void)
 	return found_memory;
 }
 
+static int check_randomness_nonzero(const uint8_t *rng_seed, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		if (rng_seed[i] != 0)
+			return true;
+
+	pr_warn("Provided rng-seed value is all zeros!");
+	return false;
+}
+
 int __init early_init_dt_scan_chosen(char *cmdline)
 {
 	int l, node;
@@ -1039,11 +1051,11 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 	early_init_dt_check_for_elfcorehdr(node);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
-	if (rng_seed && l > 0) {
+	if (rng_seed && l > 0 && check_randomness_nonzero(rng_seed, l)) {
 		add_bootloader_randomness(rng_seed, l);
 
-		/* try to clear seed so it won't be found. */
-		fdt_nop_property(initial_boot_params, node, "rng-seed");
+		/* Zero out the rng-seed property */
+		memset((void *)rng_seed, 0, l);
 
 		/* update CRC check value */
 		of_fdt_crc32 = crc32_be(~0, initial_boot_params,
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5b924597a4de..f5bfbac77a66 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -453,8 +453,18 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 			goto out;
 		get_random_bytes(rng_seed, RNG_SEED_SIZE);
 	} else {
-		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
+		pr_notice("RNG is not initialised: deleting \"%s\" property\n",
 			  "rng-seed");
+		/*
+		 * The rng-seed property may exist as zeroed stub. If so,
+		 * remove it to not confuse the incoming kernel.
+		 */
+		ret = fdt_delprop(fdt, chosen_node, "rng-seed");
+		if (ret == -FDT_ERR_NOTFOUND)
+			/* It's fine */
+			ret = 0;
+		else if (ret)
+			goto out;
 	}
 
 	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
-- 
2.47.1


