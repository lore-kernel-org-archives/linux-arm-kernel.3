Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90167EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLw8pvJCeEKexVam/fXhH6hjVZBQdHXzY2sxA70/vaE=; b=f49IMIslj6djN6ETaYf9xY2RO9
	Sf0tdy8Xg/rllpg/ZpiCIgX6sscxxHKxMx1dqYUWQvgVPXvUmFGyboDdf4rdfx44dCBvFhLyTVCaM
	45oYLC6Pt+qm7R620KNmdpuylg+xdeBKNNEUp6UonKk2YaEv9gfx1uR2v0A8cvXgTgmZ64/OLnOp3
	/3Tth6crfmEy5JueRBEvi9X9j/VHJyOszgNhi4sRn8rXWeyyHGKbiFSYMKMxc1KBgvNMTRIiT6tBA
	d1YbOPEvpvPoPpeEKSAwnyBK2+NJbh2Mq0ScWc0+HMkaJyDxexXikGXYX9I7sR/M98HTCj0FRHhvb
	PXz3ORkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMnc-00000001Ndf-0AWh;
	Thu, 12 Feb 2026 02:51:24 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMnZ-00000001NcK-04Rt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864681; x=1802400681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLw8pvJCeEKexVam/fXhH6hjVZBQdHXzY2sxA70/vaE=;
  b=NueJm83uY18Z47wQh9DqwPOtHSsGPo0LfvKSDT4OwB4QJxxtom2hXma0
   GC8VPNLP1tGrQ6c6Tx4cYIImGoBtEsG7KmOkL692xWy2SgpRlLIQlesB7
   CEAHvmu00XbLizLe9xNPD0CpnHcDTbTJN0dUDe6S4XbV7R3y1OqQVdOcB
   ova4DbPz/11t9KXCBsTPn/HZmXztRHtBd/inGjkxaQWReaRnKhfIPta1o
   cb7PwoXIR4xFMyn6REf3cWKxjk50BRULwt3ueaWAH2WdIPx50wKFkdOL8
   PAZGmbtI3oTAcQWVVlDMK0s8rT8KQWXhHJsnj0UIVb5w6xV1eEJEfgeDo
   Q==;
X-CSE-ConnectionGUID: +2i2aKScQCqiIjAkIi/UrQ==
X-CSE-MsgGUID: o+qYXXLgRwSPY3h/Zb5g6Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12743969"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:51:20 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:26506]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 0ea68f8f-399c-48e3-9bbb-7d2a6325c696; Thu, 12 Feb 2026 02:51:20 +0000 (UTC)
X-Farcaster-Flow-ID: 0ea68f8f-399c-48e3-9bbb-7d2a6325c696
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:19 +0000
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
Subject: [PATCH 015/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CMAC crypto
Date: Thu, 12 Feb 2026 02:45:51 +0000
Message-ID: <20260212024725.11264-16-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWC003.ant.amazon.com (10.13.139.214) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185121_105063_4BE2BDA4 
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
CONFIG_CRYPTO_CMAC-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add cmac.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/cmac.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 10cf1c6991fa..d37e00783f84 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -72,7 +72,7 @@ cryptomgr-y := algboss.o testmgr.o
 
 crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
-obj-$(CONFIG_CRYPTO_CMAC) += cmac.o
+crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
 obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
diff --git a/crypto/cmac.c b/crypto/cmac.c
index 1b03964abe00..f898c4612312 100644
--- a/crypto/cmac.c
+++ b/crypto/cmac.c
@@ -251,8 +251,8 @@ static void __exit crypto_cmac_module_exit(void)
 	crypto_unregister_template(&crypto_cmac_tmpl);
 }
 
-module_init(crypto_cmac_module_init);
-module_exit(crypto_cmac_module_exit);
+crypto_module_init(crypto_cmac_module_init);
+crypto_module_exit(crypto_cmac_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("CMAC keyed hash algorithm");
-- 
2.47.3


