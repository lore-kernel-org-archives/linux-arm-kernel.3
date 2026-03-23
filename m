Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B511AF483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mLJgPLWSuoj/P2MAtrzoRO0g8BMHCjkX0hvTYs5nb0=; b=2rX49938YWWqer60cFBZB8rNqH
	cf6ydohD3IqNZnIjMFkm0+pqiPitl7RM6khuZvBpE2ULDDyw2+52z/hI2Fb99yQYasQGD4/AxBS5Q
	D+BMu2OvG//9d0C660zCA8pbT1Li2sgtbW3LcYsne8npQ4Cw7dMWB8g4T240ASbn3Dg+wUTFSmI9K
	WfYYooiX74Y+CTNFRbys0bHmKsGRRGAb0tA8+q2+ansAPbaBgJpb5TAVtyVzTiQyG6BQJKei7CfAt
	1TtF4G6KXsbb9wzHF9YA1S1bicVYQgugL5uW3EhnH3KwH27lO7Bf8q9EKzPrT6tCrk5R0C15hH0uj
	+WEIpKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTg-0000000HHAg-2M28;
	Mon, 23 Mar 2026 17:54:12 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTb-0000000HH5s-2u0F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:54:08 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-67bf3e1051bso5958456eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774288446; x=1774893246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mLJgPLWSuoj/P2MAtrzoRO0g8BMHCjkX0hvTYs5nb0=;
        b=tCpf+uQRoNRmVBXA+cPwzBWqd14/eoKxpo0wgSoMjglKlDzKMSvds38RvaTe8D1PSU
         6fMRYZTpU6KWPgFnMSUuqLiGtdWP3YJeBX9i9M4K5bGpLDx4fHcnldcDdlsl/Z88TRIY
         yjxBSyToLsmg0s6zkRxhxfyx+udS9n51y7qaXj2p48ADgw4NsxwUca+Dw0dtPFn2umHv
         w0FMFlcqak07aLZKKP2D+eN/0h6scE+ccdlurdjahomcxHCev3yz+3xSUMsyVSu9DnDY
         W8Ku5UzYzQbz1Jwuo94ua/KDaGrDBBmv5o/j31PkgU8XON0Z3qunJYdOSf6R6VG8W9rb
         hA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288446; x=1774893246;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6mLJgPLWSuoj/P2MAtrzoRO0g8BMHCjkX0hvTYs5nb0=;
        b=WTlDxGYXRDGORVyhKGl4h1uarFx7jPVxNbxiIFEcBwopuoAWwbPMC+dbdxbBYE/S4s
         Dl5sRFh9czwmehwtL3tsuANywL0+VYJdWosiqCLSnvsijAaMc2Y2PWayMWH36ssp3/7u
         Cewqiu5MZnkGTZIOrVGCfuNqW0fJBMRL3twnJDs8+zeZSP2fG7ZQROhbFaf9ywRpZfmK
         nBbbXw18Krg+1gJl2mFS/PMb60qxISZToJA8RDNvb038lfV+RT0PzgwTyYJbMBKGANMA
         B0hoNo8AMqgVxE0gZ3pis6INwszRnxm3HYCvYuNejz1SBhZQ5PlSEogD6ZUvfkAop5p/
         pndg==
X-Forwarded-Encrypted: i=1; AJvYcCW0PFtpXBzivsKcGBPc8H6ZVlbMnvQsP/DtNjQ9aPNkfzAhfIGyk2OZGinvas3iZfcN7ZXI4QMtTjjJRduvdUta@lists.infradead.org
X-Gm-Message-State: AOJu0YzwkzfqnZh2UHGFKRrvFMlEs48ObJWcjpG7ITFmvgDX7+QF+rkn
	zQhCQKSaJTtC1kGz9VlU2XlEiQsFLh+YHkH2nGir/tOj3t5ymNVGHz38LrFMPyDFmHQ0X4Rh+Jr
	L+dwBig==
X-Received: from ilbeb14.prod.google.com ([2002:a05:6e02:460e:b0:4f8:5be9:9dbe])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:612:b0:67d:ec7b:cc9d
 with SMTP id 006d021491bc7-67dec7bd049mr3051580eaf.18.1774288445933; Mon, 23
 Mar 2026 10:54:05 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:53:39 +0000
In-Reply-To: <20260323175340.3361311-1-avagin@google.com>
Mime-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323175340.3361311-4-avagin@google.com>
Subject: [PATCH 3/4] mm: synchronize saved_auxv access with arg_lock
From: Andrei Vagin <avagin@google.com>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Cyrill Gorcunov <gorcunov@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, criu@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Chen Ridong <chenridong@huawei.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Eric Biederman <ebiederm@xmission.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Michal Koutny <mkoutny@suse.com>, Andrei Vagin <avagin@google.com>, 
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_105407_756161_B0043064 
X-CRM114-Status: GOOD (  20.55  )
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

The mm->saved_auxv array stores the auxiliary vector, which can be
modified via prctl(PR_SET_MM_AUXV) or prctl(PR_SET_MM_MAP). Previously,
accesses to saved_auxv were not synchronized. This was a intentional
trade-off, as the vector was only used to provide information to
userspace via /proc/PID/auxv or prctl(PR_GET_AUXV), and consistency
between the auxv values left to userspace.

With the introduction of hardware capability (HWCAP) inheritance during
execve, the kernel now relies on the contents of saved_auxv to configure
the execution environment of new processes.  An unsynchronized read
during execve could result in a new process inheriting an inconsistent
set of capabilities if the parent process updates its auxiliary vector
concurrently.

While it is still not strictly required to guarantee the consistency of
auxv values on the kernel side, doing so is relatively straightforward.
This change implements synchronization using arg_lock.

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Reviewed-by: Cyrill Gorcunov <gorcunov@gmail.com>
Reviewed-by: Michal Koutn=C3=BD <mkoutny@suse.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 fs/exec.c                |  2 ++
 fs/proc/base.c           | 12 +++++++++---
 include/linux/mm_types.h |  1 -
 kernel/fork.c            |  7 ++++++-
 kernel/sys.c             | 29 ++++++++++++++---------------
 5 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 1cd7d87a0e79..dea868d058fa 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1791,6 +1791,7 @@ static void inherit_hwcap(struct linux_binprm *bprm)
 	n =3D 1;
 #endif
=20
+	spin_lock(&mm->arg_lock);
 	for (i =3D 0; n && i < AT_VECTOR_SIZE; i +=3D 2) {
 		unsigned long type, val;
=20
@@ -1831,6 +1832,7 @@ static void inherit_hwcap(struct linux_binprm *bprm)
 		n--;
 	}
 done:
+	spin_unlock(&mm->arg_lock);
 	mm_flags_set(MMF_USER_HWCAP, bprm->mm);
 }
=20
diff --git a/fs/proc/base.c b/fs/proc/base.c
index 4c863d17dfb4..b5496cec888e 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1083,14 +1083,20 @@ static ssize_t auxv_read(struct file *file, char __=
user *buf,
 {
 	struct mm_struct *mm =3D file->private_data;
 	unsigned int nwords =3D 0;
+	unsigned long saved_auxv[AT_VECTOR_SIZE];
=20
 	if (!mm)
 		return 0;
+
+	spin_lock(&mm->arg_lock);
+	memcpy(saved_auxv, mm->saved_auxv, sizeof(saved_auxv));
+	spin_unlock(&mm->arg_lock);
+
 	do {
 		nwords +=3D 2;
-	} while (mm->saved_auxv[nwords - 2] !=3D 0); /* AT_NULL */
-	return simple_read_from_buffer(buf, count, ppos, mm->saved_auxv,
-				       nwords * sizeof(mm->saved_auxv[0]));
+	} while (saved_auxv[nwords - 2] !=3D 0); /* AT_NULL */
+	return simple_read_from_buffer(buf, count, ppos, saved_auxv,
+				       nwords * sizeof(saved_auxv[0]));
 }
=20
 static const struct file_operations proc_auxv_operations =3D {
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 62dde645f469..10351af5851b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1255,7 +1255,6 @@ struct mm_struct {
 		unsigned long start_code, end_code, start_data, end_data;
 		unsigned long start_brk, brk, start_stack;
 		unsigned long arg_start, arg_end, env_start, env_end;
-
 		unsigned long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
=20
 #ifdef CONFIG_ARCH_HAS_ELF_CORE_EFLAGS
diff --git a/kernel/fork.c b/kernel/fork.c
index 2ac277aa078c..3880ce0d44f9 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1106,8 +1106,13 @@ static struct mm_struct *mm_init(struct mm_struct *m=
m, struct task_struct *p,
 		__mm_flags_overwrite_word(mm, mmf_init_legacy_flags(flags));
 		mm->def_flags =3D current->mm->def_flags & VM_INIT_DEF_MASK;
=20
-		if (mm_flags_test(MMF_USER_HWCAP, current->mm))
+		if (mm_flags_test(MMF_USER_HWCAP, current->mm)) {
+			spin_lock(&current->mm->arg_lock);
 			mm_flags_set(MMF_USER_HWCAP, mm);
+			memcpy(mm->saved_auxv, current->mm->saved_auxv,
+			       sizeof(mm->saved_auxv));
+			spin_unlock(&current->mm->arg_lock);
+		}
 	} else {
 		__mm_flags_overwrite_word(mm, default_dump_filter);
 		mm->def_flags =3D 0;
diff --git a/kernel/sys.c b/kernel/sys.c
index e4b0fa2f6845..c679b5797e73 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2147,20 +2147,11 @@ static int prctl_set_mm_map(int opt, const void __u=
ser *addr, unsigned long data
 	mm->arg_end	=3D prctl_map.arg_end;
 	mm->env_start	=3D prctl_map.env_start;
 	mm->env_end	=3D prctl_map.env_end;
-	spin_unlock(&mm->arg_lock);
-
-	/*
-	 * Note this update of @saved_auxv is lockless thus
-	 * if someone reads this member in procfs while we're
-	 * updating -- it may get partly updated results. It's
-	 * known and acceptable trade off: we leave it as is to
-	 * not introduce additional locks here making the kernel
-	 * more complex.
-	 */
 	if (prctl_map.auxv_size) {
-		memcpy(mm->saved_auxv, user_auxv, sizeof(user_auxv));
 		mm_flags_set(MMF_USER_HWCAP, mm);
+		memcpy(mm->saved_auxv, user_auxv, sizeof(user_auxv));
 	}
+	spin_unlock(&mm->arg_lock);
=20
 	mmap_read_unlock(mm);
 	return 0;
@@ -2190,10 +2181,10 @@ static int prctl_set_auxv(struct mm_struct *mm, uns=
igned long addr,
=20
 	BUILD_BUG_ON(sizeof(user_auxv) !=3D sizeof(mm->saved_auxv));
=20
-	task_lock(current);
-	memcpy(mm->saved_auxv, user_auxv, len);
+	spin_lock(&mm->arg_lock);
 	mm_flags_set(MMF_USER_HWCAP, mm);
-	task_unlock(current);
+	memcpy(mm->saved_auxv, user_auxv, len);
+	spin_unlock(&mm->arg_lock);
=20
 	return 0;
 }
@@ -2481,9 +2472,17 @@ static inline int prctl_get_mdwe(unsigned long arg2,=
 unsigned long arg3,
 static int prctl_get_auxv(void __user *addr, unsigned long len)
 {
 	struct mm_struct *mm =3D current->mm;
+	unsigned long auxv[AT_VECTOR_SIZE];
 	unsigned long size =3D min_t(unsigned long, sizeof(mm->saved_auxv), len);
=20
-	if (size && copy_to_user(addr, mm->saved_auxv, size))
+	if (!size)
+		return sizeof(mm->saved_auxv);
+
+	spin_lock(&mm->arg_lock);
+	memcpy(auxv, mm->saved_auxv, size);
+	spin_unlock(&mm->arg_lock);
+
+	if (copy_to_user(addr, auxv, size))
 		return -EFAULT;
 	return sizeof(mm->saved_auxv);
 }
--=20
2.53.0.983.g0bb29b3bc5-goog


