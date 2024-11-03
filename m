Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A0D11195
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 22:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5Y0QqOSqKhVyDS/Dxio6XA90bc6k/m0aGaSN9hstAA=; b=IgvFXM809VIyMU3ja+ojZKMSX1
	RNq7T2ZnHrHrSQFXHdyvhpizENX1Rz04MAGUfKb/56RnavNKvorlI++TTUYDQJcy53k1cDawR6HaZ
	03Dk76KQTw34TEIPQ2ZD6CYeQt4FgLoguuB0WYtT5hwtQHfPiadPjYICeRyP2/aUPCN80ZBNOP2Au
	R2obwghTeQY6WgMIOfQHktGjLqEhV7bJYD+Hgp02GhrZ90KEzfI8Gyl4aGLKnWrVFqdBP0iVJTky9
	ncDjieFABngokFOAfFZvo/w2gQmUY3aWlPb+Wj9wfENUWvX7SgwJ3cLghoWIjUAVyxhESfx9No8IR
	oFvoSy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jCn-0000000C9mJ-2Bgm;
	Sun, 03 Nov 2024 22:36:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7j92-0000000C8Ki-0adi;
	Sun, 03 Nov 2024 22:32:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3520BA41F26;
	Sun,  3 Nov 2024 22:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3C1C4CED6;
	Sun,  3 Nov 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673146;
	bh=tFO0F6yNPt11cX0x9fLuUHzrKqGkpHig/cPtPasc7Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLEXF5OnjtoHBLz2W1SudB1KfgQeNbVamfWQca0Lr3ls4Ajd6zui8pPZphDG8wGHi
	 LMeOxQgpUfQZBOrr9Xxbh82UmIw4KF07FJGWQHV31qEzfhzAW4QITRvihj6T8dNJwD
	 7VM4SISyDF+9nWY8v1TcdePZO8vlrUSxuR0C2sAycL5JfMzno08WrlDBIWB428LYwV
	 H74oQ1WRR+qGqF2fzD79IPcenVru6oQPFG/aiSVpU1viylHUP1PVVW0SlpHWBah85+
	 GLRmjZ4czJdS+k2WUI0O0AY7XjAnn6mserV11No6DhCIo1gKixC/7dgNgepAp/Vyod
	 VKf8STCElVs0g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 04/18] crypto: crc32 - don't unnecessarily register arch algorithms
Date: Sun,  3 Nov 2024 14:31:40 -0800
Message-ID: <20241103223154.136127-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_143232_441000_8167D36D 
X-CRM114-Status: GOOD (  12.46  )
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

From: Eric Biggers <ebiggers@google.com>

Instead of registering the crc32-$arch and crc32c-$arch algorithms if
the arch-specific code was built, only register them when that code was
built *and* is not falling back to the base implementation at runtime.

This avoids confusing users like btrfs which checks the shash driver
name to determine whether it is crc32c-generic.

(It would also make sense to change btrfs to test the crc32_optimization
flags itself, so that it doesn't have to use the weird hack of parsing
the driver name.  This change still makes sense either way though.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/crc32_generic.c  | 8 ++++++--
 crypto/crc32c_generic.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
index cc064ea8240e..783a30b27398 100644
--- a/crypto/crc32_generic.c
+++ b/crypto/crc32_generic.c
@@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
 	.base.cra_ctxsize	= sizeof(u32),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32_cra_init,
 }};
 
+static int num_algs;
+
 static int __init crc32_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crc32_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crc32_mod_init);
 module_exit(crc32_mod_fini);
 
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 04b03d825cf4..985da981d6e2 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
 	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32c_cra_init,
 }};
 
+static int num_algs;
+
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
-- 
2.47.0


