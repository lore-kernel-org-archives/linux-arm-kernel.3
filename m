Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB4EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=; b=FrhF0Cra3+dVcvROlIjVKqbLze
	xRxyVgsa9A98c9HoY+4o8/7f8YAZ+kolUzRUOjR5mqy8POPUh1gdIZkcXdsTPV2CcdwuZXRsyW6U+
	UTO6K5Z5wyNECMJkQxBYlICSnMu9nJF6CXj+lVNMgPVNfUIWxmc14ZHriq9bYsXwABPhVCJaF4QlD
	I+cDRlqrR55YBoICvTm0YwC8t1ESnNH76z85sx/uTAydvnd2GDemE4y99O8EL6nopJRp0tdSm3/QR
	UKRYSKZ+ys3t2Q3ND7z2Ae88nRVwiUbr8nS5GP22KkVrpD27SL9LRuEMQqpZqqkGf+smtKriac9W4
	ywaZ4M6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiD-000000086Nd-2MMU;
	Tue, 08 Sep 2026 05:49:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiB-000000086MJ-3niY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-85339ed040aso3302279b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846579; x=1789451379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=FrGwg+I23nX5ycyRx+zojQh592HQijA+HJmEtSdQkKNFK8ROU5L7AK6NaFaicx2/mk
         F9C2qAcl2ghJVNlZwQWvltOMGXlPI8Q4nqgMii0Lba0UcWUDzppJ2q5ruAYJ1OlKo7ad
         OBhdRTmhsruBQeRDGPliz7JbbLE7Y9TWjDLWvoCE++AjlhGr7itONx37f9/d8ok1kZRb
         SuDu6h1QT836ljy+Alnx105KAL30z2FBCYZNQHaLgvBkMDaabKoww8C/xjD04I8oqgOB
         PlKb0FBlY7Bt/h5ydstS9OQU3xe8PEkXeVzGA5ooAp6HLIZXpkM+IvuIGC8ydspf9tNJ
         b9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846579; x=1789451379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=HZYH9uRiOwKYNY8KSFcKpIYJHEijFec3JXpKZYhDgslQmfQg/V8AZuL6ifSpeKYchN
         YmqezSD8BBWiRNd8sbJ0xdlQ1nh7Om3nA9ne9Akf5vDu1cPitZOTytew/gHMsNFjHsx9
         LXIUNd1ylAV/3DTMC7EGM/1JZ+i3mwQpz6JsuehGKaCwYiC+j21Twb/btVJ8dy3O4TyX
         gU9qFH24Xay8gMSSekunX5fRLxaaG7fAMRhqpZ7vkoVARvKV8DTdfZZWhFWxVmnVi4L5
         d0mc/KHGkDAvEU2xXMbOTgEZldM/A1cRWD2dpi5ecBAopuKO3KeV7r4KTeGr8ctBgzl1
         wVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqKA3Cgl6vTl09uafMDyeJxoLrnJvUEnfYXq+qz4wvuXW2/etqwA1z9416BjYUw8xwZosvLDc91MIifA8/qegJ@lists.infradead.org
X-Gm-Message-State: AFuF++m5CeQuzhgtjXaJpInwuP5xGBF03QJwgJZMVGzsR1lF1EeuIsJo
	Dp/Y5JGxgeyVGIGcL2IRmdgw3rZtrb+7ZAOwUFqNe61MPye1TPZBwSeF
X-Gm-Gg: AYBFou3+lXtIW3UFGpIxfxhi2lapCtvwJcwZjOyBLwLnd7WYX/cwx80J0O8FITDo9CZ
	LsJYtJXdQPUkoeYIg2luG1qo8mGXAfwKwDnPfu0fwEMozSRrrjLNKw2mVbPVB2OwYRKyoAT8unG
	lKYefqVuAcsazQURNfFpzQnzarHRwBQpz0cqajgy6qWkBYoM5q/szTdaS8wj+zBPJhQmyzcVjwY
	pQU6mWsYVnj+Lgx057zYIqoBuXwKxMbxnRmjwVIbgiWT6+HOg8g0JONbxwXQuOB49Ueo9woT2a0
	dMQqvcDTj+og1L0O/Z+Atxl91M5BpcuHGFBQPomrkLrFA4a7MEFEKWChkTywDrg7C8myo8uInW5
	JAISGna/gUny3OhRouwSLNTuen93zp9qrRXnd76S5tEdu+fJIzqa0jIUYlUKP30gSfx7mTVB1D/
	FWiNMxnTZuComVvKKhTixRoM32g6v6clCI7wCPs+MdyzYHZFoYyeaPQ5LZJKRsMF0w6hAHm2Gey
	ZYAi0FouQSIRg==
X-Received: by 2002:a05:6a21:7748:b0:3da:6bdd:2c74 with SMTP id adf61e73a8af0-3da6bdd6cfcmr22673394637.10.1788846578979;
        Mon, 07 Sep 2026 22:49:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 4/7] selftests/bpf: fix typos in comments
Date: Tue,  8 Sep 2026 11:18:50 +0530
Message-ID: <20260908054853.13820-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224939_954958_1506EB82 
X-CRM114-Status: GOOD (  17.75  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
index 1b25d5c5f8fb..8b96fb861368 100644
--- a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
+++ b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
@@ -13,7 +13,7 @@
  * IPv6 header with a Segment Routing Header, with segments :
  *	fd00::1 -> fd00::2 -> fd00::3 -> fd00::4
  *
- * 3 fd00::/16 IPv6 addresses are binded to seg6local End.BPF actions :
+ * 3 fd00::/16 IPv6 addresses are bound to seg6local End.BPF actions :
  * - fd00::1 : add a TLV, change the flags and apply a End.X action to fc42::1
  * - fd00::2 : remove the TLV, change the flags, add a tag
  * - fd00::3 : apply an End.T action to fd00::4, through routing table 117
diff --git a/tools/testing/selftests/bpf/prog_tests/task_local_data.h b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
index 8ae4fb2027f7..9f2971fc7cd5 100644
--- a/tools/testing/selftests/bpf/prog_tests/task_local_data.h
+++ b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
@@ -243,7 +243,7 @@ static tld_key_t __tld_create_key(const char *name, size_t size, bool dyn_data)
 		}
 
 		/*
-		 * TLD_DEFINE_KEY() is given memory upto a page while at most
+		 * TLD_DEFINE_KEY() is given memory up to a page while at most
 		 * TLD_DYN_DATA_SIZE is allocated for tld_create_key()
 		 */
 		if (dyn_data) {
diff --git a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
index 624078abf3de..d7e30ee576c9 100644
--- a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
+++ b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
@@ -7,7 +7,7 @@
 
 SEC("freplace/btf_unreliable_kprobe")
 /* context type is what BPF verifier expects for kprobe context, but target
- * program has `stuct whatever *ctx` argument, so freplace operation will be
+ * program has `struct whatever *ctx` argument, so freplace operation will be
  * rejected with the following message:
  *
  * arg0 replace_btf_unreliable_kprobe(struct pt_regs *) doesn't match btf_unreliable_kprobe(struct whatever *)
diff --git a/tools/testing/selftests/bpf/progs/verifier_var_off.c b/tools/testing/selftests/bpf/progs/verifier_var_off.c
index a63e33675091..227dea0da3a0 100644
--- a/tools/testing/selftests/bpf/progs/verifier_var_off.c
+++ b/tools/testing/selftests/bpf/progs/verifier_var_off.c
@@ -225,7 +225,7 @@ __naked void stack_write_priv_vs_unpriv(void)
 }
 
 /* Similar to the previous test, but this time also perform a read from the
- * address written to with a variable offet. The read is allowed, showing that,
+ * address written to with a variable offset. The read is allowed, showing that,
  * after a variable-offset write, a privileged program can read the slots that
  * were in the range of that write (even if the verifier doesn't actually know if
  * the slot being read was really written to or not.
-- 
2.48.1


