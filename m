Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CF0F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKqhp+h5tr1j1YyBp1e3IhdY0y212x/JXc1mTvz9lyw=; b=FRgKWFj7S4TAJI0MH4Xvflw+2b
	ZN7DNOF+3F0JZt3aauP1VLyDlb0MPSz6M6gLEMhPDWHbi/v7UHUw0MxQtcJ9Tqi/B6kZ0Ole5/YDd
	EXdHuZI/aJnmTc45ZFbZstV14h62zq+YtIoSHJQ48l9d4exJ+QIetcN/mnxFS6bnjpgYj4ZXV41Or
	NwH7grvr4DFq4PruXF0En0pMaRsWPrktkvv9fNtaasQzmXGhpu8D1YDfYjR7PLNPP8jn37/nsNHcQ
	wx1x/Mz94OFZefBl5+M4Xf8ey0XI9Y+NsL5HeJ2MMek0M3spEdB64BIJKIQCvcTBCjHbdadjTwZPO
	hQDXOi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQc-00000004aKU-3YEU;
	Sat, 18 Apr 2026 00:20:54 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQZ-00000004aJd-3BUq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471651; x=1808007651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YKqhp+h5tr1j1YyBp1e3IhdY0y212x/JXc1mTvz9lyw=;
  b=aOWg+0/T+ydcALOzzsoggvx579z+p3dX72Zc9THIRonwWMDN8Qn9Whr/
   NrQX7GyBiato23lIW45XBYMa5DOF9yDdf0sSGlTZCEpfoJJyZXMMskt0h
   LuW4kVlssJzZFrBS6n1hiDwFlVefDIRjLyYmH2yQ4nakMwpEmobhOsKZd
   ymyc6Raz45Uel2QHw/r4Y/JoUj4cOGeGSSnjkNjYpPYUQOpTkHwu7JbKK
   XdcRKfhj4LlqCsgIwT1tE+KqBtSFDX+6/8hVbgxY+ooVW/jWqAZtRnYfd
   zHh6zde4HBK8rEDkP+tGZVfCfh0Gtpg12pSHh1ogH81DZZvAgAItidntY
   A==;
X-CSE-ConnectionGUID: d7/VvQ+pR0OAUcKUhTLGdw==
X-CSE-MsgGUID: cff9/EewQPqqtx4+8XbMlQ==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17401470"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:20:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:9370]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id c1392d9f-f0b6-4027-b02a-fb741f7f05ff; Sat, 18 Apr 2026 00:20:49 +0000 (UTC)
X-Farcaster-Flow-ID: c1392d9f-f0b6-4027-b02a-fb741f7f05ff
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:20:49 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:20:48 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 01/19] crypto: add Kconfig options for standalone crypto module
Date: Sat, 18 Apr 2026 00:20:09 +0000
Message-ID: <20260418002032.2877-2-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172051_859334_F0C1B314 
X-CRM114-Status: GOOD (  15.38  )
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

Add Kconfig option `CRYPTO_FIPS140_EXTMOD` to enable standalone crypto
module support that can override built-in cryptographic implementations.

Currently supports X86_64 and ARM64 architectures and requires CRYPTO
and MODULES to be enabled.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Kconfig         |  1 +
 crypto/fips140/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 crypto/fips140/Kconfig

diff --git a/crypto/Kconfig b/crypto/Kconfig
index b54a1bef6adef..d792ff01298b7 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1387,6 +1387,7 @@ endif
 endif
 
 source "drivers/crypto/Kconfig"
+source "crypto/fips140/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 source "crypto/krb5/Kconfig"
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
new file mode 100644
index 0000000000000..0665e94b9fe05
--- /dev/null
+++ b/crypto/fips140/Kconfig
@@ -0,0 +1,15 @@
+config CRYPTO_FIPS140_EXTMOD
+	bool "FIPS 140 compliant algorithms as a kernel module"
+	depends on CRYPTO && (X86_64 || ARM64) && MODULES
+	select CRYPTO_FIPS
+	help
+	  This option enables building a kernel module that contains
+	  copies of crypto algorithms that are built in a way that
+	  complies with the FIPS 140 standard.
+
+	  The module registers the algorithms it contains with the
+	  kernel crypto API, and the kernel crypto API's FIPS 140 mode
+	  can be enabled to restrict crypto algorithm usage to only
+	  those provided by this module.
+
+	  If unsure, say N.
-- 
2.47.3


