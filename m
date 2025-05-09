Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD88C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 00:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yclRk7ooaIvmEqMgjub1QEJG1ED/vyWOa9p4x2ARJMI=; b=vIMtkY01cY4xC60/XYNyA1PX3+
	Wfazsm5iStxmmjVctsb9idKK5vxAKNFMOKeRPg/ZfktW55V8GBcszG6cwxYYrvxROC5zwMDk/K0+f
	0vikoN1bN7VPFNZ1VVJ3OocL0ZOeQk3BPamzQfdUt3U2C0QgwOVXxPzttRt5GdW8iBr8JFGk5pkbt
	1r7ehJLthmDuzk02Fb220dcWnpEwsJ5kcB7930C7H918PUlKw4EdSCVMvgiyf29tutaInAXEGdLJL
	U2MqMy2KZBGXCuBwr/Dyfhu/W4b6OCuMrKZP9vfbzwxV+8cW+scBC+7KBUcvLL972Kd0kMFUDnec0
	opbexuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYMY-00000005DjA-3yWp;
	Sat, 10 May 2025 00:46:47 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDXIV-000000058mc-49Bh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 23:38:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746833908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yclRk7ooaIvmEqMgjub1QEJG1ED/vyWOa9p4x2ARJMI=;
	b=wWiGF1WUUoUBATWBUsBJ0I7cCKcZxaKo7zT5rbGGxGrdOqVKKzxD95We7ZPmhi3QmW4bSw
	KqbrAw8FgXkBGLUP1O01hVk2sw27VRq+Lp1I+Y487UrA+mckVboffn68mFLN6uIgpeKawe
	YvNj1lzJe7tAC5/oVWX0NUjMgqvY9Tc=
From: Sean Anderson <sean.anderson@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Radu Rendec <rrendec@redhat.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Date: Fri,  9 May 2025 19:37:35 -0400
Message-Id: <20250509233735.641419-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_163832_166403_18227C26 
X-CRM114-Status: GOOD (  10.87  )
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

Cache geometry is exposed through the Cache Size ID register. There is
one register for each cache, and they are selected through the Cache
Size Selection register. If FEAT_CCIDX is implemented, the layout of
CCSIDR changes to allow a larger number of sets and ways.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/include/asm/cache.h |  3 +++
 arch/arm64/kernel/cacheinfo.c  | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 99cd6546e72e..569330689a2f 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -8,6 +8,9 @@
 #define L1_CACHE_SHIFT		(6)
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
+#define CCSIDR_CCIDX_NumSets		GENMASK_ULL(55, 32)
+#define CCSIDR_CCIDX_Associativity	GENMASK_ULL(23, 3)
+
 #define CLIDR_LOUU_SHIFT	27
 #define CLIDR_LOC_SHIFT		24
 #define CLIDR_LOUIS_SHIFT	21
diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index 309942b06c5b..a0180d3f1631 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -34,8 +34,36 @@ static inline enum cache_type get_cache_type(int level)
 static void ci_leaf_init(struct cacheinfo *this_leaf,
 			 enum cache_type type, unsigned int level)
 {
+	u64 val;
+
 	this_leaf->level = level;
 	this_leaf->type = type;
+	if (type == CACHE_TYPE_NOCACHE)
+		return;
+
+	val = FIELD_PREP(CSSELR_EL1_Level, level - 1);
+	if (type == CACHE_TYPE_INST)
+		val |= CSSELR_EL1_InD;
+	write_sysreg(val, csselr_el1);
+
+	val = read_sysreg(ccsidr_el1);
+	this_leaf->coherency_line_size =
+		BIT(FIELD_GET(CCSIDR_EL1_LineSize, val) + 4);
+	if (FIELD_GET(ID_MMFR4_EL1_CCIDX,
+		      read_sanitised_ftr_reg(SYS_ID_AA64MMFR4_EL1))) {
+		this_leaf->number_of_sets =
+			FIELD_GET(CCSIDR_CCIDX_NumSets, val) + 1;
+		this_leaf->ways_of_associativity =
+			FIELD_GET(CCSIDR_CCIDX_Associativity, val) + 1;
+	} else {
+		this_leaf->number_of_sets =
+			FIELD_GET(CCSIDR_EL1_NumSets, val) + 1;
+		this_leaf->ways_of_associativity =
+			FIELD_GET(CCSIDR_EL1_Associativity, val) + 1;
+	}
+	this_leaf->size = this_leaf->coherency_line_size *
+			  this_leaf->number_of_sets *
+			  this_leaf->ways_of_associativity;
 }
 
 static void detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
-- 
2.35.1.1320.gc452695387.dirty


