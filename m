Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45AACEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91s7wPZYsCFfnXF0eFI+QzjXw5p2I5wMgfHJ2UFA8aM=; b=IiABLdrl8aVcpyMoLfPQgQZOLY
	HldjrQN0hJ4mIzdYhQddsu7ah5I7av6rte9OIWGxOqN1glSbUrTWPng1ka6WJjyh6x3miRwM6ajth
	MObiLhL/77L7RAdovbkcmIDOzImgyo7wfPRljerEQYmbDjzZt6gC7VI4LgpMpePJfrv3CUxtUauL8
	mRjuard9KtGPZqg82PSyvPNUKdm4gdIkGZ7x+0LAhd7KG07Guxwp37b1uNPPq+O9lQO1KVM84kp73
	/WfCuFtkqX3iX2eatTqj+gRmxEvd22qNWIJp1ejk5agqxRikZn7aq2FyKDeHttBkALCRPqtcEvQES
	2LU9ElPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yA-0000000H5Xu-23Yh;
	Tue, 18 Nov 2025 00:53:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y5-0000000H5Ut-3To1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297e2736308so4457705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427193; x=1764031993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91s7wPZYsCFfnXF0eFI+QzjXw5p2I5wMgfHJ2UFA8aM=;
        b=uI3hyybQB6qFGF0x5C+mbWb3+kFP1MqOOdIxxc32gwOuBFHpJ9lDWmL1kMokZ4N1vv
         1a0b6wGSElN3kVo2TjsLRq0wUYsHTuKV8tEp/Aubreawdj2Uew6051F9xfsbV4j56aka
         69EGrIpPIR/F8sM7VEd3tlDVfaU9AzmipNni4nPSLnej4PVzxfh2wzcu21TM2c6CIzNV
         uHQp3z8fN8P0WWD5ObMMFJlAe8JsyM2o8+7YsgxmZacA+7G5EuIyouQ+zlOL9UZKOn9h
         XovG4Lio2L4EHztdrY37DtLJeupW7Kbz/3ImvZiCzlKYG1ei3akAdDjEdtDEp8ANwQJz
         GTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427193; x=1764031993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91s7wPZYsCFfnXF0eFI+QzjXw5p2I5wMgfHJ2UFA8aM=;
        b=bNm2rkobQHkLijGIqKYhP5a1js88SHLjiFHLDe8aPRm7cSV/ZnCABn0JzUUSXSNpt/
         WNkYYkw8A4sYjpJ/zT9p0GYmpbcV+jkTFOGbBks/cOlmozJu5jLoeV9K1b0EBqELly5a
         kpmLImo4TrnZYHvL6Do4+MW6YQsJQyZz6MkADGACKnpKRLwZLahmxQFNn4bWdhTz4aqJ
         9osWxS2NjrhTyyGW90n7/NqRt/KBkDyZZWNYfkvkaIHUQVL3UWTDL3RqQL9W2G4uspzK
         fqn5+VQW03W4pOnmJKxy24Kih5DGRnN5WxUG780c6lkxeUuFAUiKOSBkX0CRswXPa/JI
         b+rA==
X-Forwarded-Encrypted: i=1; AJvYcCXBmg1a67VRxRju+DyadrCSvLhetFY2GFz5Z+5umIJAphXdAdEaBtWRIsppEzqSD72yo3wyV/q283aLcGPFJ/RH@lists.infradead.org
X-Gm-Message-State: AOJu0YxuZNbVNZ1vZuxBTM/oLt+9oAcc5Gpwb7KgZR2iKFruBw1WfRg7
	NizPd5QfXACq6YXTGdnzjjOygzH59AdJXI5jxXioTqbq5+xANybHG1j0r1MJ0fYhSNw=
X-Gm-Gg: ASbGncsq5xBgeP2YldwgGJHLiDyOrtGAdfLDmhhQw2D5QkAPemFOxAyivmPaEOcZl77
	5BjZEn0QySe8G09HeSJMTNQWK1/xEJtxNz7Je9QmQaSQqViCUn8JVzNz6LSch+4SBVjaRkyu72n
	uPoxSoYJPnuCGsYswN9JD6E+x1kuHTGGZ3gNhN+3TxYBHNpiEDh1vU/eJ62Jr+ZOVz/SqsvLVby
	0da76HiWeTYO/YHcSiipaGa0E2QFnPvP5mvm+5G4w9gJvrBIp8n4u3iSLh1oHHfLerTj3Y2SBai
	L2W6xT/KG0q2ZAYlr2dcJ0JVXp++pgLs/c3WU8BTyDCnK+D7j++QFmJqxlh5wur5tK5lrVHYx0z
	UYLQS7y3eywYBfTeT9EH2Ih+bmCT+6fBmsPoCo393bf3/vr2+gaKlOKj9XvMT1XzQ
X-Google-Smtp-Source: AGHT+IH12IkveR/gco1bqwDQB15yRJ3JRqgOk92225QmojU5hVd1CdeAFKQltQrwcUzwsCCpadEwxA==
X-Received: by 2002:a05:7300:fb05:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2a4abb56fe7mr4474659eec.2.1763427192879;
        Mon, 17 Nov 2025 16:53:12 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:12 -0800 (PST)
From: Jordan Rife <jordan@jrife.io>
To: bpf@vger.kernel.org
Cc: Jordan Rife <jordan@jrife.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: [RFC PATCH bpf-next 1/7] bpf: Set up update_prog scaffolding for bpf_tracing_link_lops
Date: Mon, 17 Nov 2025 16:52:53 -0800
Message-ID: <20251118005305.27058-2-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165313_872379_152DB7EF 
X-CRM114-Status: GOOD (  19.82  )
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

The type and expected_attach_type of the new program must match the
original program and the new program must be compatible with the
attachment target. Use a global mutex, trace_link_mutex, to synchronize
parallel update operations similar to other link types (sock_map, xdp,
etc.) that use a global mutex. Contention should be low, so this should
be OK. Subsequent patches fill in the program update logic for
freplace/fentry/fmod_ret/fexit links.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 include/linux/bpf.h     | 11 +++++++
 kernel/bpf/syscall.c    | 68 +++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/trampoline.c | 29 ++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 09d5dc541d1c..23fcbcd26aa4 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1420,6 +1420,9 @@ static inline int bpf_dynptr_check_off_len(const struct bpf_dynptr_kern *ptr, u6
 int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
 			     struct bpf_trampoline *tr,
 			     struct bpf_prog *tgt_prog);
+int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
+			       struct bpf_prog *new_prog,
+			       struct bpf_trampoline *tr);
 int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
 			       struct bpf_trampoline *tr,
 			       struct bpf_prog *tgt_prog);
@@ -1509,6 +1512,14 @@ static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
 {
 	return -ENOTSUPP;
 }
+
+static inline int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
+					     struct bpf_prog *new_prog,
+					     struct bpf_trampoline *tr)
+{
+	return -ENOTSUPP;
+}
+
 static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
 					     struct bpf_trampoline *tr,
 					     struct bpf_prog *tgt_prog)
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index f62d61b6730a..b0da7c428a65 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -63,6 +63,8 @@ static DEFINE_IDR(map_idr);
 static DEFINE_SPINLOCK(map_idr_lock);
 static DEFINE_IDR(link_idr);
 static DEFINE_SPINLOCK(link_idr_lock);
+/* Synchronizes access to prog between link update operations. */
+static DEFINE_MUTEX(trace_link_mutex);
 
 int sysctl_unprivileged_bpf_disabled __read_mostly =
 	IS_BUILTIN(CONFIG_BPF_UNPRIV_DEFAULT_OFF) ? 2 : 0;
@@ -3562,11 +3564,77 @@ static int bpf_tracing_link_fill_link_info(const struct bpf_link *link,
 	return 0;
 }
 
+static int bpf_tracing_link_update_prog(struct bpf_link *link,
+					struct bpf_prog *new_prog,
+					struct bpf_prog *old_prog)
+{
+	struct bpf_tracing_link *tr_link =
+		container_of(link, struct bpf_tracing_link, link.link);
+	struct bpf_attach_target_info tgt_info = {0};
+	int err = 0;
+	u32 btf_id;
+
+	mutex_lock(&trace_link_mutex);
+
+	if (old_prog && link->prog != old_prog) {
+		err = -EPERM;
+		goto out;
+	}
+	old_prog = link->prog;
+	if (old_prog->type != new_prog->type ||
+	    old_prog->expected_attach_type != new_prog->expected_attach_type) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&new_prog->aux->dst_mutex);
+
+	if (!new_prog->aux->dst_trampoline ||
+	    new_prog->aux->dst_trampoline->key != tr_link->trampoline->key) {
+		bpf_trampoline_unpack_key(tr_link->trampoline->key, NULL,
+					  &btf_id);
+		/* If there is no saved target, or the target associated with
+		 * this link is different from the destination specified at
+		 * load time, we need to check for compatibility.
+		 */
+		err = bpf_check_attach_target(NULL, new_prog, tr_link->tgt_prog,
+					      btf_id, &tgt_info);
+		if (err)
+			goto out_unlock;
+	}
+
+	err = bpf_trampoline_update_prog(&tr_link->link, new_prog,
+					 tr_link->trampoline);
+	if (err)
+		goto out_unlock;
+
+	/* Clear the trampoline, mod, and target prog from new_prog->aux to make
+	 * sure the original attach destination is not kept alive after a
+	 * program is (re-)attached to another target.
+	 */
+	if (new_prog->aux->dst_prog)
+		bpf_prog_put(new_prog->aux->dst_prog);
+	bpf_trampoline_put(new_prog->aux->dst_trampoline);
+	module_put(new_prog->aux->mod);
+
+	new_prog->aux->dst_prog = NULL;
+	new_prog->aux->dst_trampoline = NULL;
+	new_prog->aux->mod = tgt_info.tgt_mod;
+	tgt_info.tgt_mod = NULL; /* Make module_put() below do nothing. */
+out_unlock:
+	mutex_unlock(&new_prog->aux->dst_mutex);
+out:
+	mutex_unlock(&trace_link_mutex);
+	module_put(tgt_info.tgt_mod);
+	return err;
+}
+
 static const struct bpf_link_ops bpf_tracing_link_lops = {
 	.release = bpf_tracing_link_release,
 	.dealloc = bpf_tracing_link_dealloc,
 	.show_fdinfo = bpf_tracing_link_show_fdinfo,
 	.fill_link_info = bpf_tracing_link_fill_link_info,
+	.update_prog = bpf_tracing_link_update_prog,
 };
 
 static int bpf_tracing_prog_attach(struct bpf_prog *prog,
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 5949095e51c3..010bcba0db65 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -610,6 +610,35 @@ int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
 	return err;
 }
 
+static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
+					struct bpf_prog *new_prog,
+					struct bpf_trampoline *tr)
+{
+	return -ENOTSUPP;
+}
+
+int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
+			       struct bpf_prog *new_prog,
+			       struct bpf_trampoline *tr)
+{
+	struct bpf_prog *old_prog;
+	int err;
+
+	mutex_lock(&tr->mutex);
+	err = __bpf_trampoline_update_prog(link, new_prog, tr);
+	if (!err) {
+		/* If a program update was successful, switch the program
+		 * in the link before releasing tr->mutex; otherwise, another
+		 * operation could come along and update the trampoline with
+		 * the link still pointing at the old program.
+		 */
+		old_prog = xchg(&link->link.prog, new_prog);
+		bpf_prog_put(old_prog);
+	}
+	mutex_unlock(&tr->mutex);
+	return err;
+}
+
 static int __bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
 					struct bpf_trampoline *tr,
 					struct bpf_prog *tgt_prog)
-- 
2.43.0


