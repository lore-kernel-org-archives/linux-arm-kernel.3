Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB5EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGbo5qhTe577pqrQ9ND6f63OdqvG3EyYMTypktWkDO0=; b=d9aoDag+7jSFM+GS5ub0AeuQEf
	4s2+yApXEBjLrVCEjAWf69Vw0WgYUnNKV231HBtSGLJzrIjRZjxRHnFdRBLkjBckXdRNiEHATq+wJ
	bGGmGjH535UnwGhnLBkAKEVSqu5G6FfOUms6fUazWTNixaAf8I2mujHIFq3MjqpUrut8Pd8R17Y7Z
	ujKAfWvOq34NFqF+CzoVshwkZoySOYDGLCRpDyxIH13XtiQxSYU7OIXTRVzdzXCbrhKOvBoZq1oJb
	SrhSRsYKXtNV5axV/1eA19EqJJq62YZH7rpcS/B3XY/BPKNfi2EN+0r3D3NMRWyCyRwh5wXnUWIqA
	LVnJv9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpr-00000001OYG-04Mn;
	Thu, 12 Feb 2026 02:53:43 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpo-00000001OXF-19nK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864820; x=1802400820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGbo5qhTe577pqrQ9ND6f63OdqvG3EyYMTypktWkDO0=;
  b=N16NfpLRP1O+2jiFXYk06KonhWwt/Mdc8EBYpQ3s0OwvhNowc6zK5Hi5
   XKYA/YJixVG5DHthdd4BG/4P+cFb70I3NsUHFg7ibPdE0fbfV0exmwokw
   hjPZIKsYwj61dYd3H7oWxP7YFMuaDJALufUQQ8B6t+mapq9mocI4bFbHI
   rmNZN8tZy3lNmdjUFAZWLotasZHuZJe3RjRx+QmsthpKfIZ6cUuehfo97
   p0iYbBZHRF+AuUnPIeK1dpNCzQ6LUbWexn0EUrXRgZo7FN8ZIoqevfqWV
   OPIBSQxfGg/kf1ExNvMh6SFSbRIAVSgAnVddRSAXq6IyG84ymURixvGoL
   g==;
X-CSE-ConnectionGUID: YAXV6n4wTaGaiKPN9kO0yQ==
X-CSE-MsgGUID: QiFvn59mS3K/Sdr2w5LeoQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744145"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:53:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:7889]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id ff7a62e9-741a-405d-924b-013e88bc1bb4; Thu, 12 Feb 2026 02:53:39 +0000 (UTC)
X-Farcaster-Flow-ID: ff7a62e9-741a-405d-924b-013e88bc1bb4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:39 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:39 +0000
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
Subject: [PATCH 024/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_GCM crypto
Date: Thu, 12 Feb 2026 02:46:00 +0000
Message-ID: <20260212024725.11264-25-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185340_369837_416E2E0F 
X-CRM114-Status: GOOD (  10.84  )
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
CONFIG_CRYPTO_GCM-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add gcm.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/gcm.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index d5b5ca797dc6..11bb65cf0094 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -98,7 +98,7 @@ crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
-obj-$(CONFIG_CRYPTO_GCM) += gcm.o
+crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
 obj-$(CONFIG_CRYPTO_CCM) += ccm.o
 obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
 obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
diff --git a/crypto/gcm.c b/crypto/gcm.c
index 97716482bed0..54a376e782d1 100644
--- a/crypto/gcm.c
+++ b/crypto/gcm.c
@@ -1119,8 +1119,8 @@ static void __exit crypto_gcm_module_exit(void)
 				    ARRAY_SIZE(crypto_gcm_tmpls));
 }
 
-module_init(crypto_gcm_module_init);
-module_exit(crypto_gcm_module_exit);
+crypto_module_init(crypto_gcm_module_init);
+crypto_module_exit(crypto_gcm_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Galois/Counter Mode");
-- 
2.47.3


