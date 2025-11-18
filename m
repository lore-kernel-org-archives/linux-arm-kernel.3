Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975FBCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqtHILsF2TAT2qFB8P2xd62Q4NmwrffJGJ2M75+ke/A=; b=YvXtYo9BKk+SpAvT93Z0zDB63A
	yIABeX5DrIVu7vDiz2h70rnXCqPT5Gq6RF3O4mL68dWwklYe1vBzyt+lJ8lBV55fXW49lddFdSVs+
	0qiU7hai9R+uvNixUxk+IlTIFXo7nQlx8CwL7DlqCpt41WaFTi7JZM9A886yaa+He/o/p7L6i9Jd2
	tYSMZPVDiFiiCL25oNS1teWN0lc23RgE8s9FphvHVvi1bBNyUDyoDMbJMYdftu93SPuFt3qs7KlOF
	owDYInPsed62Vwz0TG5J9l2Kl673zircexhynlCJlCkXuUAMbrZ/SxJ3kVcE4wgWMxIa9Pl9kVnRv
	ZX1ZwDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yB-0000000H5Yk-0Mf3;
	Tue, 18 Nov 2025 00:53:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y8-0000000H5Vi-0xL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-299e43c1adbso2068965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427195; x=1764031995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqtHILsF2TAT2qFB8P2xd62Q4NmwrffJGJ2M75+ke/A=;
        b=PdePRsWX5wpus6BzFsodkXiZZ7xxwhaBEySr1DoXO8p8/c0Jsyn4D57jwEy9eaKKeW
         rcqCxytJXOkwLWXLUR9Wved+pnPH/KnMAG+BbB0hjdY99rVyTw3aD7h4O838EM9lW54T
         VKP1ezCjMXgbeM6fILfUrzKRTW55KPUC3mTFKQTnQORKQEdBmQXTvHGM4Er8isWM6bUU
         KySM9oCtISXqJ3j7FKY93I5sMqVPFKsWgCygy3UB+fUeM5MKbDXQzNEOhtEjPPVAsF6q
         7dKllqYJ35MUQJGxK+UrEPwDnrPdeia/fGiaxDFyBzUfrBgFFCj9UJ8gNS/Q88ZIKiXE
         L8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427195; x=1764031995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqtHILsF2TAT2qFB8P2xd62Q4NmwrffJGJ2M75+ke/A=;
        b=MLT1moTxu/ivmKmr4tcRfy6vRTfWjVB+rH3NF8LBZXgZsTV6iTApLsQCel5zeWYdwV
         NJpz/Tp8QYwZQ527ntptrH29MfuNPEDKhucrt8dY7Ho2qqG9RTkirrPj7NXeiZFzKOA4
         1T5K3icwT7ZnaOG8astUP0GafuEVIp/dG0g4zbllsruqBMK7JT8sdOepEvC2SC//je2L
         viRAsVsavWeSvzfmcXhUU1zxaUukEu9fNbiJhUDCSED0CUFlxdKXgJKGDG6WkECmAJBP
         oBT811VcfdTO2EvbXizpO500HJuTWBJ0aQW6OcxJ9ihrXeAostmmv6LKLuATD7PMwEGl
         TXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUgFfMhjliy7fBslGJDsNe/2lCUnzYO7LFYfMjffk1JQhjsbVuA3ujQ2UO8IwIJ+H6StiiXorbjQga4MOlr9+dk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk4h2/xWxijILPKOIFduPMEYTyD3TpbBD2FLLSLvhSEtgt0WRv
	k3xESCl8tNsUpfBzECDxU+65culQ0OIo4qJ5vning7yvpZEqvDRNHm2nAd5MFBUZP78=
X-Gm-Gg: ASbGncvI/vsuwS727rlVhbU+YtCxUwt/XdEQ0K869+N6kxl7zZ75yJJNtKFf88gta+w
	rGnap080iW4qUrubozUYqxzh6dEk2Neb52DelkXeSHKS6Oosr8hkC1GlXLhYBUcSqo7Sf5qULrI
	QeXrCiYwwcdYIV+yZWsiQKMrLJv8wxbPmqGbWRaunssa9pPlHOZIqR90JEROU0OJpPqTo1DK42z
	M1rkEN2iUfEEpnsB7aptX2Wk0UNpYJit3XJ/5asRKLr0ayXZ3Tuw3bvar0+AzOFWUg1T9iQYQki
	nVuDgTHAmDb3PlNoEvNOGqR3bP3LA67NU07unkZxlnxv9FNZioFaL6PvHrFsmafOuUdaVs3nknW
	Mep3FeltPfUTIyO70Of/t1DlPcp3wsn6Xjyf6M1cGZf47e9UJQdIH6kHKWOPjsnMztuo7YkxKBG
	c=
X-Google-Smtp-Source: AGHT+IFJPILg18zJQZC0TW4P7pXEkHzpuOhLWUEFhxqpAVjTKvXaGm1YV+XYqv2kf00AJGzo/HV8dA==
X-Received: by 2002:a05:7300:fb05:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2a4abb56fe7mr4474689eec.2.1763427195139;
        Mon, 17 Nov 2025 16:53:15 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:14 -0800 (PST)
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
Subject: [RFC PATCH bpf-next 3/7] bpf: Enable BPF_LINK_UPDATE for fentry/fexit/fmod_ret links
Date: Mon, 17 Nov 2025 16:52:55 -0800
Message-ID: <20251118005305.27058-4-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165316_307496_5E55001F 
X-CRM114-Status: GOOD (  22.53  )
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

Implement program update for other link types supported by
bpf_tracing_link_lops (fentry, fexit, fmod_ret, ...). I wanted to make
the implementation generic so that no architecture-specific support
would be required, but couldn't think of a good way to do this:

* I considered updating link.prog before calling bpf_trampoline_update
  and reverting it back to the old prog if the update fails, but this
  could create inconsistencies with concurrent operations that read
  links where they see the uncommitted program associated with the link.
* I considered making a deep copy of the link whose program is being
  updated and putting a pointer to that copy into tlinks when calling
  bpf_trampoline_get_progs where the copy references the new program
  instead of the current program. This would avoid updating the original
  link.prog before the update was committed; however, this seemed
  slightly hacky and I wasn't sure if this was better than just making
  the architecture-specific layer aware of the intent to update one of
  the link programs.

This patch sets up the scaffolding for trampoline program updates while
subsequent patches enable this for various architectures. For now, only
x86, arm64, and s390 are implemented since that's what I could test in
CI.

Add update_link and update_prog to bpf_tramp_links. When these are
set, arch_bpf_trampoline_size() and arch_prepare_bpf_trampoline() use
update_prog in place of update_link->link.prog when calculating the
trampoline size and constructing a new trampoline image. link.prog is
only updated after the trampoline update is successfully committed. If
the current architecture does not support program updates (i.e.
bpf_trampoline_supports_update_prog() is not implemented) then the
BPF_LINK_UPDATE operation will return -ENOTSUPP.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 include/linux/bpf.h     | 10 ++++++++++
 kernel/bpf/trampoline.c | 33 +++++++++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 23fcbcd26aa4..7daf40cbdd9b 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1215,6 +1215,8 @@ enum {
 
 struct bpf_tramp_links {
 	struct bpf_tramp_link *links[BPF_MAX_TRAMP_LINKS];
+	struct bpf_tramp_link *update_link;
+	struct bpf_prog *update_prog;
 	int nr_links;
 };
 
@@ -1245,6 +1247,7 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *i
 				const struct btf_func_model *m, u32 flags,
 				struct bpf_tramp_links *tlinks,
 				void *func_addr);
+bool bpf_trampoline_supports_update_prog(void);
 void *arch_alloc_bpf_trampoline(unsigned int size);
 void arch_free_bpf_trampoline(void *image, unsigned int size);
 int __must_check arch_protect_bpf_trampoline(void *image, unsigned int size);
@@ -1840,6 +1843,13 @@ struct bpf_tramp_link {
 	u64 cookie;
 };
 
+static inline struct bpf_prog *
+bpf_tramp_links_prog(struct bpf_tramp_links *tl, int i)
+{
+	return tl->links[i] == tl->update_link ? tl->update_prog :
+						 tl->links[i]->link.prog;
+}
+
 struct bpf_shim_tramp_link {
 	struct bpf_tramp_link link;
 	struct bpf_trampoline *trampoline;
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 0b6a5433dd42..0c0373b76816 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -230,7 +230,10 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 }
 
 static struct bpf_tramp_links *
-bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg)
+bpf_trampoline_get_progs(const struct bpf_trampoline *tr,
+			 struct bpf_tramp_link *update_link,
+			 struct bpf_prog *update_prog,
+			 int *total, bool *ip_arg)
 {
 	struct bpf_tramp_link *link;
 	struct bpf_tramp_links *tlinks;
@@ -250,6 +253,11 @@ bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_a
 		hlist_for_each_entry(link, &tr->progs_hlist[kind], tramp_hlist) {
 			*ip_arg |= link->link.prog->call_get_func_ip;
 			*links++ = link;
+			if (link == update_link) {
+				*ip_arg |= update_prog->call_get_func_ip;
+				tlinks[kind].update_link = update_link;
+				tlinks[kind].update_prog = update_prog;
+			}
 		}
 	}
 	return tlinks;
@@ -395,7 +403,10 @@ static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
 	return ERR_PTR(err);
 }
 
-static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
+static int __bpf_trampoline_update(struct bpf_trampoline *tr,
+				   struct bpf_tramp_link *update_link,
+				   struct bpf_prog *update_prog,
+				   bool lock_direct_mutex)
 {
 	struct bpf_tramp_image *im;
 	struct bpf_tramp_links *tlinks;
@@ -403,7 +414,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 	bool ip_arg = false;
 	int err, total, size;
 
-	tlinks = bpf_trampoline_get_progs(tr, &total, &ip_arg);
+	if (update_link && !bpf_trampoline_supports_update_prog())
+		return -ENOTSUPP;
+
+	tlinks = bpf_trampoline_get_progs(tr, update_link, update_prog,
+					  &total, &ip_arg);
 	if (IS_ERR(tlinks))
 		return PTR_ERR(tlinks);
 
@@ -506,6 +521,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 	goto out;
 }
 
+static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
+{
+	return __bpf_trampoline_update(tr, NULL, NULL, lock_direct_mutex);
+}
+
 static enum bpf_tramp_prog_type bpf_attach_type_to_tramp(struct bpf_prog *prog)
 {
 	switch (prog->expected_attach_type) {
@@ -629,7 +649,7 @@ static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
 		return 0;
 	}
 
-	return -ENOTSUPP;
+	return __bpf_trampoline_update(tr, link, new_prog, true);
 }
 
 int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
@@ -1139,6 +1159,11 @@ arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image
 	return -ENOTSUPP;
 }
 
+bool __weak bpf_trampoline_supports_update_prog(void)
+{
+	return false;
+}
+
 void * __weak arch_alloc_bpf_trampoline(unsigned int size)
 {
 	void *image;
-- 
2.43.0


