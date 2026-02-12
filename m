Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD4EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teRQ469Nql8dnjGK42odTTdwkBKcylLAZvUmdlwdLAM=; b=YD/4hA3L2MYcSMVMTGHKjQSbYr
	IFA3ce1+n7/fi11LiUsw7Y7nLg5bQkVMX9pXI0xO2myvyDHi9rwopYWbbjVdM+cwd/+EETb232hbP
	FgJLaddpEuYlXfLAOfxZ4OkwHXVDXEjVwbFVClipyEthz5Z6663mrPN+4QIBeQkcRZZgAD24kTMz0
	8uFc4oqYYEpneEclxMaWpm1j++V3JJ+93+Vd71u2xNGTgZgn0kdx2rFkPpVPMREy0wVPI1wIBnoK3
	XawqVrwxbq2EdP7A4nv+xyHmZKMGTvIfsTejO00+9jFBfmNLoZPft/hhs7RyYQ9r4bIYRXXGM2WFn
	AZF4bC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6x-00000001VgS-4Bpf;
	Thu, 12 Feb 2026 03:11:24 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6q-00000001VdU-29r2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865876; x=1802401876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teRQ469Nql8dnjGK42odTTdwkBKcylLAZvUmdlwdLAM=;
  b=ca5ATE8SYqTFJzseKBgrhO2y88azMigUCPbYcQQAzUGv3H3pOvLE7lIW
   YSVcvnMgpfg4FwngD2rOu3GABSMHskqNA9z6HchyqxacBBTPLaEeePnj9
   IYaRz715EiehTbeCe9nK8XCG1sVVqRQEplKA8hTNMoRtigGBPaIXCAhLi
   Jg73D6Un3mJA70RXGc/cQ+2j5cgwKq6hMIlIcUdIXZPwyd6TEuYYXR1UE
   yF7mtCiUGOkP8mcu5RU52782Ue+1ty2HquPxiL/53JGGC+jP0CR3cY96F
   Z8GclUlcdOxoEq0DL+gNBuey+N/vMzjy6XeEWKkOdF1opLxxd5AI0WraZ
   A==;
X-CSE-ConnectionGUID: RhsYn6fHS7yYJIdYgt5VEQ==
X-CSE-MsgGUID: XmOXcqrQQguc+wadrHll/g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727630"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:16 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:25574]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id f7d5bce0-9999-4b4a-aff5-5f74cf21e156; Thu, 12 Feb 2026 03:11:15 +0000 (UTC)
X-Farcaster-Flow-ID: f7d5bce0-9999-4b4a-aff5-5f74cf21e156
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:15 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:15 +0000
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
Subject: [PATCH 092/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECRDSA crypto
Date: Thu, 12 Feb 2026 02:47:08 +0000
Message-ID: <20260212024725.11264-93-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA001.ant.amazon.com (10.13.139.112) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191116_603928_F2D7E37D 
X-CRM114-Status: GOOD (  10.95  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ECRDSA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/ecrdsa.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index cdc74dcea2f1..dc70a464fc1a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -191,7 +191,7 @@ $(obj)/ecrdsa.o: $(obj)/ecrdsa_params.asn1.h $(obj)/ecrdsa_pub_key.asn1.h
 ecrdsa_generic-y += ecrdsa.o
 ecrdsa_generic-y += ecrdsa_params.asn1.o
 ecrdsa_generic-y += ecrdsa_pub_key.asn1.o
-obj-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 
 #
 # generic algorithms and the async_tx api
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 2c0602f0cd40..b9cd02a7e515 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -288,8 +288,8 @@ static void __exit ecrdsa_mod_fini(void)
 	crypto_unregister_sig(&ecrdsa_alg);
 }
 
-module_init(ecrdsa_mod_init);
-module_exit(ecrdsa_mod_fini);
+crypto_module_init(ecrdsa_mod_init);
+crypto_module_exit(ecrdsa_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vitaly Chikunov <vt@altlinux.org>");
-- 
2.47.3


