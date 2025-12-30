Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7B1EE0209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEvS2cDqJSHSaKxR0oOFhahjCV7xBGKzZW04iiKTNc0=; b=oiSbJl8RwAEuneCSh51sCM3IJt
	biGfB3gSp2wka471ffdiVYCFX53yWJORoStRiPvyfYxdtWY7+qkupHriBjVZhhiwrcUWAQFrb+FwT
	D/T84lcRiDN56+ZU474B2jtitBEHWXYRXMi00mpCJBZhss2Uvp53eDsPxBcFOo6Y+z6EqbEGr2Uk+
	0/8GKu+hZ+eTVnOoE0bTpfE5JzRouTgFH5eNvkSYJ2U4eBN6r+MRHdrG2qv+VXC2wRVmNksckD3wY
	YT7R4JFZBkdrvrlREn+Mnd2DOwOvomqu3KKLG+zB3/pWTyOmtkbh9BLUSu8TVJazqPpo37NhthvBK
	rfRkISyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3b-00000004x8v-1KSW;
	Tue, 30 Dec 2025 14:50:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3a-00000004x8S-0DZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B7D960010;
	Tue, 30 Dec 2025 14:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083FCC4CEFB;
	Tue, 30 Dec 2025 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767106241;
	bh=27TvWU4UpBAfYfhozN7qRGVx1Aub7R7oMGSS4pd4NDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7rMpxMe5tUBvvp3jiwkyiPsvxQW0NwaV6UaF+p1Q6tE6RJplksLhCihzOkv3EfVj
	 b5AZoV2O0c2/SenjgK+oiUMjWgA01qx0C72CIDDgO5HbppuXwPtoghoTx9RGMqNEW8
	 0oVsS+qWM+CTvGDNIDdoxt8Y/YT1LaUse7qyIVCA6LlcBDGes3atERRgugxRpXpMRz
	 DhK7ldQwyqXxcgCDv0lrdraVIMR6ejHCLnqv0X1KPwg/FfIGeUeQ2VXX54TUV4GCE5
	 slIPWm1xJp8meUvhQ+GvMJT4DshHYe6BZ8Jg23inNxMkFmB6dpgzHrpis7O2KSLyJm
	 L0Bmllv03SYDQ==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv6 bpf-next 2/9] ftrace: Make alloc_and_copy_ftrace_hash direct friendly
Date: Tue, 30 Dec 2025 15:50:03 +0100
Message-ID: <20251230145010.103439-3-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
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

Make alloc_and_copy_ftrace_hash to copy also direct address
for each hash entry.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 kernel/trace/ftrace.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index f5f042ea079e..409271aa8dad 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1212,7 +1212,7 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 }
 
 static struct ftrace_func_entry *
-add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
 
@@ -1221,11 +1221,18 @@ add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
 		return NULL;
 
 	entry->ip = ip;
+	entry->direct = direct;
 	__add_hash_entry(hash, entry);
 
 	return entry;
 }
 
+static struct ftrace_func_entry *
+add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+{
+	return add_hash_entry_direct(hash, ip, 0);
+}
+
 static void
 free_hash_entry(struct ftrace_hash *hash,
 		  struct ftrace_func_entry *entry)
@@ -1398,7 +1405,7 @@ alloc_and_copy_ftrace_hash(int size_bits, struct ftrace_hash *hash)
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
-			if (add_hash_entry(new_hash, entry->ip) == NULL)
+			if (add_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
 				goto free_hash;
 		}
 	}
-- 
2.52.0


