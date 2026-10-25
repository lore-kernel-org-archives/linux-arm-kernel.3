Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927AF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=taZh8zv4;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HdJQUu1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BKCIoewPxqJjcEiMn9aSQhwGTJS5ZRgwusOumNV0ZUQ=; b=taZh8zv4GklVXs
	WKRVQgOHXOJTL7gUFcEYVSELh7nugNxTxyhc1Su63IcwOK3hBr8L2654R9rCfy9yz9WewWU0hqF2G
	9LiAo/pg2kHzWq9RdFXJS+2GCAVCOC7JTfuIQ2e2KjJEvbFa5+WSzkBNoYnlPnNkQNywSK1KZhTWb
	0l2GWok/cd8U4rzTjItTgf7gjlTWZ0b5fOvv/v+DfYQ9sSlfevXye91OKnxzGRBplWMBIW1wHi/XK
	vJjWB0ZCetcvlVydgC5FMaR/E/0+w9qIzYzOm1XrIMXgcpVAha9PJMoesxYvCN+Zf5WS4J7UHm33u
	Q0O0EvK20n+MVGT2Dqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1J-00000000qt0-01v4;
	Sun, 25 Oct 2026 07:51:57 +0000
Received: from out-79.mta1.migadu.com ([95.215.58.79] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1B-00000000qrP-47kA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:51:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PFBAXwuqQFvijjX3+VrafA0FdNMSxN6wY89RZNPerd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914707; v=1; x=1793519507;
 b=HdJQUu1ayqge7qfrxwLdd4FELHnZf0oyAY/CGV7uKs21K5SrdMGw7oHi8l7mi/uI58ddAeMp
 o6vL1PVURof9cmd5g8Bv1tNTluivYqfm3Cn7jO7ATVFwM9qPpBydBp1hNgwkgxnVV0B79jNS9W3
 UE8s+melIna9HJxYBacDbXbE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b9760d0147542ea5;
	Sun, 25 Oct 2026 07:51:47 +0000
X-Mizu-Trace-ID: b9760d0147542ea5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: Add override for ID_AA64ISAR1_EL1.LS64
Date: Sun, 25 Oct 2026 07:51:34 +0000
Message-ID: <20261025075138.2919734-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005150_165466_29C3C1B1 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Accesses to ACCDATA_EL1, which FEAT_LS64_ACCDATA adds, trap to EL3
unless firmware sets SCR_EL3.ADEn. Once KVM context-switches the
register for its guests, a host whose firmware leaves the bit clear
can't run them.

Add an override for ID_AA64ISAR1_EL1.LS64, with an arm64.nols64 alias,
so that the feature can be disabled on such a host and for its guests.
id_aa64isar1.ls64=2 disables only FEAT_LS64_ACCDATA and above.

Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47e..ef690cf6c3664 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -571,6 +571,9 @@ Kernel parameters
 	arm64.nohaft	[ARM64] Unconditionally disable Hardware managed Access
 			Flag for Table descriptors support
 
+	arm64.nols64	[ARM64] Unconditionally disable 64-byte Load/Store
+			instructions support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 274bc72ba98d0..0c7f293779c1f 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -174,6 +174,7 @@ static const struct ftr_set_desc isar1 __prel64_initconst = {
 	.name		= "id_aa64isar1",
 	.override	= &id_aa64isar1_override,
 	.fields		= {
+		FIELD("ls64", ID_AA64ISAR1_EL1_LS64_SHIFT, NULL),
 		FIELD("gpi", ID_AA64ISAR1_EL1_GPI_SHIFT, NULL),
 		FIELD("gpa", ID_AA64ISAR1_EL1_GPA_SHIFT, NULL),
 		FIELD("api", ID_AA64ISAR1_EL1_API_SHIFT, NULL),
@@ -253,6 +254,7 @@ static const struct {
 	  "id_aa64isar1.gpi=0 id_aa64isar1.gpa=0 "
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
+	{ "arm64.nols64",		"id_aa64isar1.ls64=0" },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
-- 
2.47.3


