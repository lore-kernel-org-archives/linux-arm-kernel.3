Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FE0C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=; b=00DjADo/hNClc5ra2SUugXrRNB
	/OCGZVigT7Ztt/Vdri4foPeoxIzEmAFo+Dr4neBm2NWxyNm3ZHZms3qfRhyMPxcEoumOZNChxyNwO
	uOOgopONIpGioejtOFMH+gSHHedtyMOUtO3dX4f32ov2uZe/kX00u3MqHw6l2jtu7hUzMFuoe6Ngt
	Q/FR4qrdLt4DAYYIb1N1sPdGYyZLExVI7jPHSW9Z/Cm8Rn1DI1tf4mWMjpKQdyEuF2zEHC92ldbQj
	bvG247sNq6Wzyq/qD2U1iJUcsbee84ulTBbCHyCPQDSmy6CkOCMNw/2JpFSg/WnkpHGKFG2qRZSy4
	YSz1Xc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2X-00000006jbU-3nAr;
	Mon, 07 Sep 2026 12:01:33 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2V-00000006jaC-2h4X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:32 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7f57db8b5a4so2665607a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782491; x=1789387291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=NVcB7xQ4VlmV38VRqZLUIDpKDb/HopzRXOTaQJanW0g/YDwxT/+Ix0THRBJtJGmu/+
         woTiCvvjRKUbCmdE/7v1yZdr5zSi8xMmGxRc6lv7mIdrP5ywutj5niD9yKTpb6Wkw1/B
         j9D/ELFd+X23ZdBj+1D9LBqQ9fJjaigliP6KHeaIPK1v0nuZIFovWD0sUi4DV5rHUEM4
         oAfr8XQXSxBshuXatL3phfftVj/YYi6oVnj3BESeNnwWsbzQUKs9Dg9nSXyPXrxGH1P9
         J9cUJ2q2KMd+TxEW9+AX62oSb5PkGKN0fAa2G2KjF9yRTO+nSgrJpZWhB4DCEQyt2jOF
         0EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782491; x=1789387291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=SJWlsleS6QV+YHbKEyZKpwc1+HReObm5BuIZPgMGd4Yb8XYgnGPWIxHu7dfUY52YSh
         daX0/5Cy5Vt7MZ7G1DGvP5GowBZQ60gXISyEiAI+PowR7MdL0uYVS+0P+B7CduQtS2UD
         izIaMfwuzJG90+um7eGbflnZZw8+6CZA0562qv0mYe6NTnjYExOHZfbbld5l0h2C6V29
         ugu+TFOkYwt5qKNzCgZGABRnmmdQzboM9gbcdD28TYRqjcX6sXniQXzuHlzmNq9/K1DP
         Jo39dlXQCrj/dw6uqutGWhL+Mla30gI0j6Wlfr0Hwici4NyXsmlUvFOiFnNW1hc9YLeO
         NTWg==
X-Forwarded-Encrypted: i=1; AKwUvBxSqGayDal5aoZtzpxq6yci/xvnT/nBJjHSsjV7iBc/xM7bLZ2xgvavGB3+wFLTZS8fWpuiewqdxtjuuL+4eS+g@lists.infradead.org
X-Gm-Message-State: AFuF++nEcCetN46nFx4JeXp/3NC+KjN36ryz9N7u35s5DNYdq3JmtqvL
	K8PqDrZ11FxDKI0DImocl8/zmiebyjdDDEB0o8PwD2o11/RYzNl5dAn3
X-Gm-Gg: AYBFou0pTib7QlMASCeDlWQXiDzTK0mVye6/AjLxPCHqm6RRIQGvaFUZZTW3enoOMJ8
	tCH5ltdfdA3tGhHknQKOLFRduqaAkprWKAxcCg7tdjLPlOBDNCMuy3GgIm+AG0bzTlGoJwfFSoo
	rmB3lLBLbWJAGoir/vUHUmReQZktja8mDdKfgV0L1yJBNUj8lqed7g6vje9HE3FGVxwcqMOAQml
	yKPXDs1Fv4W3trQaV4ZKlcmQTUOUNvrUlRGFjudaV/Xv/MklHwk5C0CzT1RnlkJuzJ1pBC8tEnb
	c3Hxh6JQFGyQnCiDfQlX0AAqiFtue/JH8uW42a91AA71guysgkQlY97XJGeFnIybIM3QgrZyXhf
	CxEjDWcKlA6takKZl8fstxHWPER6sjqYQL/VeaHcnvcPyxNFbuboIFYFE4vskrbGHoBHAnlb0Mf
	XWxsTpF4Wox0ugt5JWg4gndIx99j+0HofvB+voezbtfG66q4Yg5nTM2aNy6vKKqZROvpQ5nOnqn
	XpBglr4PF9g3Q==
X-Received: by 2002:a05:6820:6ae7:b0:6aa:d13c:a709 with SMTP id 006d021491bc7-6b6fe2aeaf0mr12073907eaf.31.1788782490438;
        Mon, 07 Sep 2026 05:01:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:30 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 4/7] selftests/bpf: fix typos in comments
Date: Mon,  7 Sep 2026 17:30:40 +0530
Message-ID: <20260907120043.36894-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050131_688390_E70CDBDA 
X-CRM114-Status: GOOD (  17.39  )
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


