Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9051AEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uykTr1wYXEvfGFPnI15K0EjeeP05XerkB61+U0BScaA=; b=maxeVBcD9QYV0iUNkPje7X/Agh
	QC+n4QQYOwkexDXyUR0i58giHSQoOImglisxmrTAmXvZlgtDSTYdGl/ogtKII+zzPWP5flaj3+veL
	4ih/itQODxhC0lBhIs8RSTffwcOQdLgXdDwpbwPZbFjG00GhhQXkwh3Uvza3RYYERjw1fwIVyMj7/
	udoxtsZ/WdWV74u42P/DfVrbLWSyNe1GQPxY6+A0nVrdayK+RcIE4A1mdXfV/SIDYYaRF39ezAdQC
	YxyUpXxujlVUxscJwwDV93mx3R4F20J9y3l3rD4C3zwY7vsQoj38DMBe/MhxQ+bA5Da+n46/+ZTbz
	lyNNWwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMp6-00000001OGm-29mF;
	Thu, 12 Feb 2026 02:52:56 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMp4-00000001OFi-0pQE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864774; x=1802400774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uykTr1wYXEvfGFPnI15K0EjeeP05XerkB61+U0BScaA=;
  b=Pu5awDdXxhUNtx/8HNXE4r34C4IIRJfcI/aYFxlGJ72Qdi4ZmJ2xo31c
   cowmAxYt4WFYkAkZpiwvSjQFeNDadvOztv3MD5j1VkbExpYEOzLVXNRA8
   lldraMiZyMPp/eCgsX3MG16k5psvJddPdaaFRGKC/pY1T7JbKoxPwouS9
   MhYHoEDiFR3Cse5A++kGFWoax803LOXNpKQKqnMp98xuS1G116wmanWNn
   BLYqBnB2k9HED845mya2HxpGx5rC90qXK40G285gb5w0pv8hpQ+BmQXum
   vJKa0gVW1n/zMG60hCxQGhTRM3U9iDq1tp4S4HqAwEqr25uEFM4nFueQi
   A==;
X-CSE-ConnectionGUID: DsZ9+mXJS6OnvNA16XAN8g==
X-CSE-MsgGUID: FuUwZKMJSUCEqaf0zalyKg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696410"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:52:53 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:9857]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 0c3538d1-91d2-4630-bce9-7843bb2e8028; Thu, 12 Feb 2026 02:52:53 +0000 (UTC)
X-Farcaster-Flow-ID: 0c3538d1-91d2-4630-bce9-7843bb2e8028
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:52 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:52 +0000
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
Subject: [PATCH 021/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECB crypto
Date: Thu, 12 Feb 2026 02:45:57 +0000
Message-ID: <20260212024725.11264-22-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB001.ant.amazon.com (10.13.139.160) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185254_302429_0BB0A1C3 
X-CRM114-Status: GOOD (  10.94  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ECB-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add ecb.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/ecb.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 251b20fad9c2..11a6714dee42 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -88,7 +88,7 @@ obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
-obj-$(CONFIG_CRYPTO_ECB) += ecb.o
+crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 obj-$(CONFIG_CRYPTO_CBC) += cbc.o
 obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 obj-$(CONFIG_CRYPTO_CTS) += cts.o
diff --git a/crypto/ecb.c b/crypto/ecb.c
index cd1b20456dad..20127b20f483 100644
--- a/crypto/ecb.c
+++ b/crypto/ecb.c
@@ -219,8 +219,8 @@ static void __exit crypto_ecb_module_exit(void)
 	crypto_unregister_template(&crypto_ecb_tmpl);
 }
 
-module_init(crypto_ecb_module_init);
-module_exit(crypto_ecb_module_exit);
+crypto_module_init(crypto_ecb_module_init);
+crypto_module_exit(crypto_ecb_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ECB block cipher mode of operation");
-- 
2.47.3


