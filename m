Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F07C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=/UbQxd2gHuwSazOzBCkfogNyge30ll4F/uTuo1uhry4=; b=m/DmsWvHrtubZf
	IeHO+Mt9Scyh6uat8UbiS9xsTYeBsYhJvG5od9yY6jSyOdfu33dvkAx9UqBjnblR/jkisuzokCKci
	BclEy3pf9I0wCLPZQ26Q3MPwQavIRarBm2xvVH955fGLpllt/yXQvrEA2R3CFkIwfdObwTUZm4j3G
	qrMwobI6QoAAWEi/wJrcRMvUqqySwOkhWb8C8Zmbj2CHNC0vJYiSW1UYBehvCE08Zjm5AzedC9b38
	f5o1YSszzFV7kQWIegKDJmER6SAKiF3hZNBmHngXGGBxH9tu01fg4pVKiMtkV16QPVrGAgn2dYBzW
	WldOWE1Mm4NBVhmbq8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidGA-0000000C3jn-0vpj;
	Thu, 13 Feb 2025 17:44:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiby4-0000000Bk9n-3DsE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60DC05C5846;
	Thu, 13 Feb 2025 16:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7BDC4CEE8;
	Thu, 13 Feb 2025 16:21:35 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tibyD-00000001qb0-3M01;
	Thu, 13 Feb 2025 11:21:45 -0500
Message-ID: <20250213162145.652220571@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 13 Feb 2025 11:20:49 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v3 2/6] scripts/sorttable: Have mcount rela sort use direct values
References: <20250213162047.306074881@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082136_929602_990EB04D 
X-CRM114-Status: GOOD (  16.49  )
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

From: Steven Rostedt <rostedt@goodmis.org>

The mcount_loc sorting for when the values are stored in the Elf_Rela
entries uses the compare_extable() function to do the compares in the
qsort(). That function does handle byte swapping if the machine being
compiled for is a different endian than the host machine. But the
sort_relocs() function sorts an array that pulled in the values from the
Elf_Rela section and has already done the swapping.

Create two new compare functions that will sort the direct values. One
will sort 32 bit values and the other will sort the 64 bit value. One of
these will be assigned to a compare_values function pointer and that will
be used for sorting the Elf_Rela mcount values.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/sorttable.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 4a34c275123e..f62a91d8af0a 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -552,6 +552,28 @@ static void *sort_orctable(void *arg)
 
 #ifdef MCOUNT_SORT_ENABLED
 
+static int compare_values_64(const void *a, const void *b)
+{
+	uint64_t av = *(uint64_t *)a;
+	uint64_t bv = *(uint64_t *)b;
+
+	if (av < bv)
+		return -1;
+	return av > bv;
+}
+
+static int compare_values_32(const void *a, const void *b)
+{
+	uint32_t av = *(uint32_t *)a;
+	uint32_t bv = *(uint32_t *)b;
+
+	if (av < bv)
+		return -1;
+	return av > bv;
+}
+
+static int (*compare_values)(const void *a, const void *b);
+
 /* Only used for sorting mcount table */
 static void rela_write_addend(Elf_Rela *rela, uint64_t val)
 {
@@ -583,6 +605,8 @@ static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
 	void *vals;
 	void *ptr;
 
+	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
+
 	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
 	shentsize = ehdr_shentsize(ehdr);
 
@@ -640,7 +664,7 @@ static void *sort_relocs(Elf_Ehdr *ehdr, uint64_t start_loc, uint64_t size)
 		}
 	}
 	count = ptr - vals;
-	qsort(vals, count / long_size, long_size, compare_extable);
+	qsort(vals, count / long_size, long_size, compare_values);
 
 	ptr = vals;
 	for (int i = 0; i < shnum; i++) {
-- 
2.47.2



