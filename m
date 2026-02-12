Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E8CEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmFq8yGyc70/+W2Glo7jC1OGxaGS0GaWe0UVpEa+H5k=; b=gowpsUNNpeWzSnrbu8qZ/WtWDe
	UaV9O8K+Fk9iHHgQrFisAelU2fomCxeFSyqoESfHfpII22d5DH+NC8v9y4k6C1IaBqHD/Sak/AR6g
	Or07PMwJMHQC3iDxexVYDddoBdoKS6Xt78zgQPdD6zGAosSd3Qr5K8MNHPHxmSYGag9/NeYIeNQny
	dLtyAciAo+t5nxkI/QcVv2eqoTqKCiG/IU++LDq/a3GzQoxz8AY/ccv2qQ/kwagw5qzbZn2tis4oI
	lWvMeSCnrl3bftL+x0d9HNTk1hZC5BirGoeCBGAkbiakx0u6cI9U4mHX2tN4ujZGUWMs+h7iXBbso
	a64dcHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMgp-00000001KsO-49DR;
	Thu, 12 Feb 2026 02:44:23 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMgm-00000001Kqh-3fSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864260; x=1802400260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QmFq8yGyc70/+W2Glo7jC1OGxaGS0GaWe0UVpEa+H5k=;
  b=meGiM3XJ4CphGSykhvxrrckcFpUJSs8apVqrpthprY5rBiXUtIb2fmXb
   AwzJ8l9RHQG4QWr1GdGRPJh1EjZy98/Llmw0xZAM3Y1YIj0SaxfhFuW8e
   JLbLVxC5YG1QoXEB1d1uTBlGmaUlizUYk8Nm/irbM0SHqen9FZ/2VJo99
   Pc8CQ7mj13XUqyTd3NgPJJFq1x+dZBpCGjc/ZBlxzJhVdiIE3VghIkg7i
   ahbM4AWhsx20A0SrN2jPxCdbV5P1e0QFvSE+CxBskRIYZ8I+qcI5GS0sM
   ptRsp8Ts3eh5G0kx45QWZoJnBj8z0GlmWMwY/S3YBr8E/P3k/x4W6UeZs
   g==;
X-CSE-ConnectionGUID: cLPVIGHpTU6D/zAFLeUzSQ==
X-CSE-MsgGUID: A+alze5dR8Kg1HWLagSmAA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919210"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:44:18 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:30569]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 20fe8c9c-fcd3-4bbb-8b1b-e1dad286b9f7; Thu, 12 Feb 2026 02:44:18 +0000 (UTC)
X-Farcaster-Flow-ID: 20fe8c9c-fcd3-4bbb-8b1b-e1dad286b9f7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:17 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:17 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 07/17] crypto: dedicated ELF sections for collected crypto initcalls
Date: Thu, 12 Feb 2026 02:42:11 +0000
Message-ID: <20260212024228.6267-8-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184420_964584_23D33A1E 
X-CRM114-Status: GOOD (  13.37  )
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

The addresses of init functions for crypto collected into the standalone
modules are placed into a dedicated ELF section. This is achieved by
introducing a custom linker script crypto/fips140/fips140.lds. Since in
later patch the init crypto will be called in the proper ordering (e.g.,
device_initcall should be earlier than late_initcall), the linker script
allocates different levels of ELF section (e.g.,
__fips140_initcall0_start and __fips140_initcall1_start) to preserve the
proper ordering.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                   |  2 +-
 crypto/fips140/fips140.lds | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 crypto/fips140/fips140.lds

diff --git a/Makefile b/Makefile
index b5ae385ed5f3..8413cc02665c 100644
--- a/Makefile
+++ b/Makefile
@@ -1313,7 +1313,7 @@ crypto/fips140/.fips140.symvers: fips140-ready
 	@:
 modpost: crypto/fips140/.fips140.symvers
 quiet_cmd_ld_fips140 = LD [M]  $@
-      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none --whole-archive $< --no-whole-archive -o $@
+      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none -T $(srctree)/crypto/fips140/fips140.lds --whole-archive $< --no-whole-archive -o $@
 
 cmd_fips140_mod = ar -t $< > $@
 
diff --git a/crypto/fips140/fips140.lds b/crypto/fips140/fips140.lds
new file mode 100644
index 000000000000..1adb3ccb5b9d
--- /dev/null
+++ b/crypto/fips140/fips140.lds
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+SECTIONS {
+	.init.data : {
+		__fips140_initcalls_start = .;
+		__fips140_initcall0_start = .;
+		*(.fips_initcall0)
+		__fips140_initcall0_end = .;
+		__fips140_initcall1_start = .;
+		*(.fips_initcall1)
+		__fips140_initcall1_end = .;
+		__fips140_initcall2_start = .;
+		*(.fips_initcall2)
+		__fips140_initcall2_end = .;
+		__fips140_initcalls_end = .;
+	}
+}
\ No newline at end of file
-- 
2.47.3


