Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE08C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 09:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=; b=aW/04/cw1q+nSMmyohDvEhihvK
	gnOLcCETy9/EUh9+e49mfiIhRzT9Ec49n4W9nj41PoNExEkhatWv0Tt4bYS1MdJoRfjYfWN/KVWW4
	48K345y77SiYDCN5GnSXiQalMtHeGLFmm6SKwFdhfVh7wlzSv6WlpV3I/P6cRTsjFMda0bCXp2xjP
	W/DvBNMw6IhFvPvtOu4KiPHcXcJ+aogempyWhiPACkazWuMHkEpy0oX7cr8pSHYmvTspU0RdWGuYH
	Y8oTbEJBdXXto9OU+PB5K+fTeHw/VaD1BEtay4tLTZvpNGpGyamslbhtha8UeIxvZXLyhacOqeidY
	WEHt1EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nOi-00000003z6w-3pF6;
	Mon, 21 Apr 2025 09:25:04 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nMQ-00000003yrU-46Bo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 09:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745227355; bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From:To:CC:Subject;
	b=Q58yTLNirc90MfQQmv3WZEWQgKgv39jvjR97S0Dw+0pZfWRtR27c0n9QrGk1swR8W
	 Gbj4HXZOqEx88TVx8IGnXx+aj5A9F9ry9SEhG6neNxgkZMHDJLbSYZIwzFGhZkMBHp
	 f1k81ShqLHH40k9ku7EZdXZUqUQ1+h8wKGRG5G3JaLlYc5Ncc4bYUHC57V/qVX1hlQ
	 DYy9ak2pisCyBhkqry46aUBQ/UoOhDLLG4NMm+nIxnKZrZh4KgaUDLe6tJ8WrEfO/h
	 scoiDfhNE39CsAz9fjvUQoQ0f6mgk4vvbflb8X/df2LZ70TznkKE1KqhuguWnYhDhv
	 65U0kRlQ/6GLA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh0JW2BHRz8sv4;
	Mon, 21 Apr 2025 11:22:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19/Cw3SxbY0NrcDswZrJkba51HAa62QSVk=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh0JR6bnNz8sx9;
	Mon, 21 Apr 2025 11:22:31 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
Date: Mon, 21 Apr 2025 11:17:52 +0200
Message-ID: <20250421091802.3234859-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421091802.3234859-1-luis.gerhorst@fau.de>
References: <20250421091802.3234859-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_022243_165000_38141C53 
X-CRM114-Status: GOOD (  14.88  )
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

Currently, __xlated_unpriv and __jited_unpriv do not work because the
BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
with 0 if the process is not bpf_capable(). This bug was not noticed
before, because there is no test that actually uses
__xlated_unpriv/__jited_unpriv.

To resolve this, simply restore the capabilities earlier (but still
after loading the program). Adding this here unconditionally is fine
because the function first checks that the capabilities were initialized
before attempting to restore them.

This will be important later when we add tests that check whether a
speculation barrier was inserted in the correct location.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in verifier_* tests")
Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembly after jit")
---
 tools/testing/selftests/bpf/test_loader.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_loader.c b/tools/testing/selftests/bpf/test_loader.c
index 49f2fc61061f..9551d8d5f8f9 100644
--- a/tools/testing/selftests/bpf/test_loader.c
+++ b/tools/testing/selftests/bpf/test_loader.c
@@ -1042,6 +1042,14 @@ void run_subtest(struct test_loader *tester,
 	emit_verifier_log(tester->log_buf, false /*force*/);
 	validate_msgs(tester->log_buf, &subspec->expect_msgs, emit_verifier_log);
 
+	/* Restore capabilities because the kernel will silently ignore requests
+	 * for program info (such as xlated program text) if we are not
+	 * bpf-capable. Also, for some reason test_verifier executes programs
+	 * with all capabilities restored. Do the same here.
+	 */
+	if (restore_capabilities(&caps))
+		goto tobj_cleanup;
+
 	if (subspec->expect_xlated.cnt) {
 		err = get_xlated_program_text(bpf_program__fd(tprog),
 					      tester->log_buf, tester->log_buf_sz);
@@ -1067,12 +1075,6 @@ void run_subtest(struct test_loader *tester,
 	}
 
 	if (should_do_test_run(spec, subspec)) {
-		/* For some reason test_verifier executes programs
-		 * with all capabilities restored. Do the same here.
-		 */
-		if (restore_capabilities(&caps))
-			goto tobj_cleanup;
-
 		/* Do bpf_map__attach_struct_ops() for each struct_ops map.
 		 * This should trigger bpf_struct_ops->reg callback on kernel side.
 		 */
-- 
2.49.0


