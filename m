Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2875DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5NZCKDlX+oPqhza0bYpJ75ln4h58BOrozj2Pne5F7g=; b=TMEIVIXbsCH2WbZcx35L6Z+GmC
	jCZMiRswWWfpi/HTm2xs/dcZbogPFuiSp4apH2pP4fM+PH/8OqA6SOQVsUNXpUAA/H9WiUJavLYYf
	4CftTg0E5X0MgprLS/T1pHhahu5paBdds8eDgQTMW7FB0F2/6dFMt/hNvyXPgwZEBdbWpswBPXa9T
	wVt92MBn5rWl3l9F+4s/rxpdkyuWNM0KTMswaVeRTTOiXbkEe/SNxBhFqb5iWT7A6YXRGP2s069Fy
	phlhtsrP05vVW3ajltx8bQ7L+jgLPart99CfE723MJbuvanftKb7a1ypbmgfrko5TiLUG/YncVtHY
	oovbsu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughyJ-0000000GZtu-2KHL;
	Tue, 29 Jul 2025 10:54:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughal-0000000GX2F-10eq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAB58601EC;
	Tue, 29 Jul 2025 10:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D41DC4CEEF;
	Tue, 29 Jul 2025 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784994;
	bh=UFgBnii1sdnMHWK81UnyXcALAP0f+Ry5dK/qMV1lLOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qk9/9OIXssyCgo9MwjG36TdZkK76F6foHCZOoraayhJ+SrW6vtIs9CmDiHWXO6FMJ
	 xQt8jMV/GonZ01c8wf/1TquBLjawrFzDnkBaDctTYiqSl2o/IqBb28MsxZpy/K05Ry
	 bmXdUD+NMWK5LJ4R1tOYvTY+8evd7RVzA46HwRoNyKIFcihfGaI/MXYhhXeCrveZLN
	 j6xIBINpzVSzMgg76g1A/9thAccmLeHh2ctr27T3yhmFGSRFTJp7TAySEqBbUBklGy
	 GorVHY7RnIrLvc+xHbWqEX0dttAddWiaITK136lnlTj/Iied4dOe/vjwg5pk/OeNCB
	 cBJxEpgz/ZcPA==
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
	Menglong Dong <menglong8.dong@gmail.com>
Subject: [RFC 09/10] bpf: Remove ftrace_ops from bpf_trampoline object
Date: Tue, 29 Jul 2025 12:28:12 +0200
Message-ID: <20250729102813.1531457-10-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
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

We no longer need ftrace_ops in each bpf_trampoline object,
we can manage with just single ftrace_ops for all direct
trampoline attachments.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/bpf.h     |  1 -
 kernel/bpf/trampoline.c | 34 ++++++++++------------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index c14bde400d97..bad29fe38a12 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1257,7 +1257,6 @@ struct bpf_trampoline {
 	struct hlist_node hlist_key;
 	/* hlist for trampoline_ip_table */
 	struct hlist_node hlist_ip;
-	struct ftrace_ops *fops;
 	/* serializes access to fields of this trampoline */
 	struct mutex mutex;
 	refcount_t refcnt;
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 398c1a722d83..e6a0e7b20bb6 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -175,16 +175,6 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 	tr = kzalloc(sizeof(*tr), GFP_KERNEL);
 	if (!tr)
 		goto out;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
-	if (!tr->fops) {
-		kfree(tr);
-		tr = NULL;
-		goto out;
-	}
-	tr->fops->private = tr;
-	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
-#endif
 
 	tr->key = key;
 	tr->ip = ip;
@@ -202,13 +192,19 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 	return tr;
 }
 
+struct ftrace_ops direct_ops = {
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+       .ops_func = bpf_tramp_ftrace_ops_func,
+#endif
+};
+
 static int unregister_fentry(struct bpf_trampoline *tr, void *old_addr)
 {
 	void *ip = tr->func.addr;
 	int ret;
 
 	if (tr->func.ftrace_managed)
-		ret = unregister_ftrace_direct(tr->fops, (unsigned long) ip, (long)old_addr, false);
+		ret = unregister_ftrace_direct(&direct_ops, (unsigned long) ip, (long)old_addr, false);
 	else
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, NULL);
 
@@ -222,7 +218,7 @@ static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_ad
 	int ret;
 
 	if (tr->func.ftrace_managed) {
-		ret = modify_ftrace_direct(tr->fops, (unsigned long) ip, (long)new_addr, lock_direct_mutex);
+		ret = modify_ftrace_direct(&direct_ops, (unsigned long) ip, (long)new_addr, lock_direct_mutex);
 	} else {
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, new_addr);
 	}
@@ -237,14 +233,11 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 	int ret;
 
 	faddr = ftrace_location((unsigned long)ip);
-	if (faddr) {
-		if (!tr->fops)
-			return -ENOTSUPP;
+	if (faddr)
 		tr->func.ftrace_managed = true;
-	}
 
 	if (tr->func.ftrace_managed) {
-		ret = register_ftrace_direct(tr->fops, (unsigned long)ip, (long)new_addr);
+		ret = register_ftrace_direct(&direct_ops, (unsigned long)ip, (long)new_addr);
 	} else {
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, NULL, new_addr);
 	}
@@ -502,9 +495,6 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 		 * BPF_TRAMP_F_SHARE_IPMODIFY is set, we can generate the
 		 * trampoline again, and retry register.
 		 */
-		/* reset fops->func and fops->trampoline for re-register */
-		tr->fops->func = NULL;
-		tr->fops->trampoline = 0;
 
 		/* free im memory and reallocate later */
 		bpf_tramp_image_free(im);
@@ -885,10 +875,6 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
 	 */
 	hlist_del(&tr->hlist_key);
 	hlist_del(&tr->hlist_ip);
-	if (tr->fops) {
-		ftrace_free_filter(tr->fops);
-		kfree(tr->fops);
-	}
 	kfree(tr);
 out:
 	mutex_unlock(&trampoline_mutex);
-- 
2.50.1


