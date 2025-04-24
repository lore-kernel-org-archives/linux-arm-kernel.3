Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12OeSWqSAxkWwPFRfLXJ/k5srnZM/lbZzG65vpCKYYY=; b=vatmDO/T2+giHDZLxEZqOKBNZr
	LjiT+l+fDRULtBHPoI/COy/Wp6OEnG4kqs1LNxB/SupGpw18wkHsXh7f4ZCidBSwmFFHnMhIe41/l
	9jLJQ07dlgCcK/E67D6lRX/mHz78681pvOx38OkBRFZECnREU3kzaJWTW7xPDZhcYnSsyWH/q5jxd
	A98n37a6I3RhcnqD7+Js3ivgSwSllMR9KPBJCQBJk+svA1TrmebDA1pUS5MunE5yzKRQtdmnmYAGJ
	1NvvTgJO0Nr2zg76gVh/r1S+gHcBlxOMAIb8v4MiUA7rqxSJUFW1dKMeiyJ8Gc3CVwC39KHrLyGT9
	zyZVraBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kUX-0000000CPBz-3qWV;
	Thu, 24 Apr 2025 00:31:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMl-0000000CNVr-3E76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAEDD6845A;
	Thu, 24 Apr 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2374C4CEEF;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=bmNtnPkT7vfqz7VYymkCYs+RWq0I1HO9RIQ1+wDAdb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjLHst4bVDcbmK2s/0yw9jwnVejn2n2RNgkYtDcj19TnSrcTNR941Nezg68ow3IGG
	 OWWvyd7GLInEMusl4tIdEBgGWvnXyC7jS/KhbQLMmxwkmC4mNAzxsnou9OH8/Rhaeo
	 yorikXu6NekPONq5K0lpepo2u9ToPhVacC0I61FsEwFspybjF+wEG4KGGqEzjivZNE
	 NDEnU7QcaQu3to8MPi6vph/yjuH35LTnDR8OtP+RRMx0Gas4KpaHV+j2zXwJ1Mcf5Z
	 jkP4vvkXCfBanEugjydAu4QeBrQbhkac5HveHAp4hgDpO3wbrngz0kXqgz19nTpu3V
	 axl/ON8oAh5Uw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 5/7] s390/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:36 -0700
Message-ID: <20250424002038.179114-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The use of the term "glue" in filenames is a Crypto API-ism that does
not show up elsewhere in lib/.  I think adopting it there was a mistake.
The library just uses standard functions, so the amount of code that
could be considered "glue" is quite small.  And while often the C
functions just wrap the assembly functions, there are also cases like
crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/lib/Makefile                  | 2 +-
 arch/s390/lib/{crc32-glue.c => crc32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 14bbfe50033c7..271a1c407121c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -24,6 +24,6 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
-crc32-s390-y := crc32-glue.o crc32le-vx.o crc32be-vx.o
+crc32-s390-y := crc32.o crc32le-vx.o crc32be-vx.o
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32.c
similarity index 100%
rename from arch/s390/lib/crc32-glue.c
rename to arch/s390/lib/crc32.c
-- 
2.49.0


