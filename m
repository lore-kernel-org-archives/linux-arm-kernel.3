Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA17EA4FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Blh4k2iEtKqVsaKWsMhLpBc0znGNyeqiyVUhWON8rv4=; b=ew/uu8nbCdGVohEQ361nwXxjtd
	hY322fF+iGJafui69xpVfhuQXJ/efRb+FSa3JDdr6p4rZutKI0uVWVM1oQI9v5GQNyMHpR9G8Q4Js
	itZ8raHvQjneqKvnE12AuDcNBx24wcUMUDw4XNMoPc4bb+8279R/UQU+YfMz8Z3zUjUg1rxlic3Zs
	PHORMhTM5kpkgbm6Qdgmkc/hjM7sPPuoIka9OwewlWSjI8eNi1cxA8QS8cPOMJUwgx6pqmhKxrute
	axQA88p9ItTIwyVq1z5XEyYgbnFUe7TJUSjO7jzo7MZOA4yJYYhCaXb0XopI0ozKeEZhuv011GC54
	cGNnAAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXWG-00000000Xx7-1IRe;
	Mon, 23 Feb 2026 15:06:44 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXWE-00000000Xwi-1Gzx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771859201; x=1803395201;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CKrHYBD8suFxrxSi9DamntzJhthvYGfiYJJVSaOhJic=;
  b=dG48SW0bgcDuczFGciYPI/aNA7e+rdc7ipn+PbVu6/pVylzQon1TjKJG
   /dLccXsxJbCJdHiTsNtJ6p4Qi6EiBTdoUgsbT/1+sdRM5wS6rtYvnUAnk
   NERmZc3lyZU9RBLQ3G+GVNlWkqAM9E3RvSGCO+dl4zdjtbg7pxYaYYPTT
   pU4J7HaObJUhHBf5YVyHq7Xguefh4VLRQGFaO+/5znZKtXXM8XGo9baRi
   BBwUFL1L7S056hJnrDJKAWB12y0edb4kMUJdjmTLG3jMiGXPArGpyreI8
   JSMTqBD2EShL+w5cqbDCPZY8deQQkXjlN1GwwENO+q1pcCiXlBJAX84/3
   A==;
X-CSE-ConnectionGUID: ZBPcT7L0QnSHgIrShqqb3g==
X-CSE-MsgGUID: HeYpUP7WQRq/NPUJxWrH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90263268"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="90263268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:06:40 -0800
X-CSE-ConnectionGUID: y6aS34q/S6Cz/VjDvrGEtA==
X-CSE-MsgGUID: P2bUdkHQRrmrY2LAah1T6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253313289"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO dalessan-mobl3.intel.com) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:06:37 -0800
From: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
To: linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Paul J . Murphy" <paul.j.murphy@intel.com>,
	"Paul J . Murphy" <paul.j.murphy@linux.intel.com>,
	Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Mark Gross <mgross@linux.intel.com>,
	Declan Murphy <declan.murphy@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [PATCH] MAINTAINERS: Remove Daniele Alessandrelli as Keem Bay maintainer
Date: Mon, 23 Feb 2026 15:06:22 +0000
Message-ID: <20260223150622.268245-1-daniele.alessandrelli@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_070642_382492_144D624B 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

I'm leaving Intel soon. Remove myself as maintainer of Keem Bay
architecture and related crypto drivers.

The INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER has no replacement
maintainer available, so mark it as Orphan.

Signed-off-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---

This patch involves two subsystems (ARM and Crypto). Not sure
who should pick it up; should I split it into two separate patches
instead?

 MAINTAINERS | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8d8a5c41597..d82693faa94b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2913,7 +2913,6 @@ F:	include/linux/soc/ixp4xx/qmgr.h
 
 ARM/INTEL KEEMBAY ARCHITECTURE
 M:	Paul J. Murphy <paul.j.murphy@intel.com>
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/intel,keembay.yaml
 F:	arch/arm64/boot/dts/intel/keembay-evm.dts
@@ -12984,8 +12983,7 @@ F:	Documentation/devicetree/bindings/display/intel,keembay-display.yaml
 F:	drivers/gpu/drm/kmb/
 
 INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
-S:	Maintained
+S:	Orphan
 F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml
 F:	drivers/crypto/intel/keembay/Kconfig
 F:	drivers/crypto/intel/keembay/Makefile
@@ -12994,7 +12992,6 @@ F:	drivers/crypto/intel/keembay/ocs-aes.c
 F:	drivers/crypto/intel/keembay/ocs-aes.h
 
 INTEL KEEM BAY OCS ECC CRYPTO DRIVER
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
 M:	Mark Gross <mgross@linux.intel.com>
 S:	Maintained
@@ -13004,7 +13001,6 @@ F:	drivers/crypto/intel/keembay/Makefile
 F:	drivers/crypto/intel/keembay/keembay-ocs-ecc.c
 
 INTEL KEEM BAY OCS HCU CRYPTO DRIVER
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 M:	Declan Murphy <declan.murphy@intel.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-hcu.yaml
-- 
2.52.0


