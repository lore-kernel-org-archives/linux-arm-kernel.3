Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA544EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ04RmOf6LRn6rnzO11EEXCmrhv5/oA0dpWQtGrdIF8=; b=FDOfDyBa+mqg7Cl3ffzmW1RIYq
	BjUfM9+v4Jv567gAQLe/iaBGRBxN6ON1vMU2ZHBoF98o3UeeQEpghaNBEArSMtDF6NfxNjPgC7y8v
	xDLl8OK5PrY/SairNiUtSdMUvZ7MotRDOD+4gwpNVUCwcEQXnHh0a/dWedUkbQY1mN1KD1ImVZXfs
	ApiTGN89Z9XiyXbcectFQyrHGY4b7hk/56jaT5iQgo2vga/3Z3aU6Ktzx9u223iLDiDAcxj7Z6X6r
	Q+L4Au/ygu2vRyvzn34aQj31QEbfBBuGB8JvnuYnrvS9xeh9byAPl31jbNJUgAvmCAbpxOzd+6uEp
	lh00LzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMiI-00000001LV7-267m;
	Thu, 12 Feb 2026 02:45:54 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMiF-00000001LTf-3St0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864351; x=1802400351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZJ04RmOf6LRn6rnzO11EEXCmrhv5/oA0dpWQtGrdIF8=;
  b=aDUZzKkU8Baab5kIOizcMnb5m916R4/3ziITLjIW38F0se6xKJEGhRwc
   ak+HBio94DxioZKOb5MLUxZfahdUjQp+GFa7p0gsCMTa6VcDZacEKDJHD
   +qTlMzRSxDdd81sHL6MroX/ZYLRQUkGJVGkaMuK7wfBH0BGVMnVYsv72a
   /VzRrga8+64ILMpjIHNg/Ypm4/pS+agTas4cNATrD0kBP9KdPhnTnwASd
   HeBn9AJPqJlV8haZC8IK7lcy0urjI+HxkZ5EKaw1KYUMZ2uc5N8vKc0nr
   kowNoGadPcFGfUHupZLr1/HdLST0kfQR1wFrhv4PuQtD0bKgFGDRqxhcU
   Q==;
X-CSE-ConnectionGUID: 0ZCeTKN2SXyY03JcSybZCg==
X-CSE-MsgGUID: 27vqGfmZQB2SpKNw0lFzdQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696145"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:51 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:2072]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id a1aa9c34-e48b-48b4-88ea-b27754c824f5; Thu, 12 Feb 2026 02:45:50 +0000 (UTC)
X-Farcaster-Flow-ID: a1aa9c34-e48b-48b4-88ea-b27754c824f5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:50 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:50 +0000
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
Subject: [PATCH 13/17] crypto/algapi.c: skip crypto_check_module_sig() for the standalone crypto module
Date: Thu, 12 Feb 2026 02:42:17 +0000
Message-ID: <20260212024228.6267-14-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184551_916633_DE606711 
X-CRM114-Status: GOOD (  11.56  )
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

From: Vegard Nossum <vegard.nossum@oracle.com>

The signature check in regular module verification process
`crypto_check_module_sig()` is skipped for this standalone crypto module
because its signature has already been checked during load (as described
in later patch).

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[Revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/algapi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/crypto/algapi.c b/crypto/algapi.c
index 37de377719ae..663698e0cd65 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -24,7 +24,19 @@ static LIST_HEAD(crypto_template_list);
 
 static inline void crypto_check_module_sig(struct module *mod)
 {
-	if (fips_enabled && mod && !module_sig_ok(mod))
+#ifdef FIPS_MODULE
+	/*
+	 * The FIPS module should ignore its own signature check, as it was
+	 * already been verified elsewhere during loading.
+	 */
+	if (mod == THIS_MODULE)
+		return;
+#else
+	if (!fips_enabled)
+		return;
+#endif
+
+	if (mod && !module_sig_ok(mod))
 		panic("Module %s signature verification failed in FIPS mode\n",
 		      module_name(mod));
 }
-- 
2.47.3


