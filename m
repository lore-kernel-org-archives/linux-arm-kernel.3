Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9816CC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=; b=e4Sbzo23WdFuguIto1HyUFQDHK
	ISdsFP8uddCI+CLxOofC8jr4oMhefQXZCAOLF/ul+AdxE/CQ2VSsaTcPwwRgqwI0z2q0QQsqAxf0X
	r5a5Ikm2NouipeFm8qk423Jl4IF6wkVCyy9J73GVSkBm5RbRyDLekHzwtyi1WCtt7OjbCmZxhgVJ3
	chD1OMW1g0/yp7JBkBXXEO48Hq5IK05MjEA8+jj1iTGh5QIymLDS6dwzSXNJgxDH+vTwXnbvRh9iX
	WxuWCr68UWHxlJN9Wjxnv/y394GSs9jti/poiT7nObEr93vGqkgAo3bNNvi0jJX8hro/xpIPwRvG4
	pFqHoGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOY1-0000000ExVQ-37Q3;
	Thu, 01 May 2025 07:41:33 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([2001:638:a000:1025::16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOVm-0000000ExHE-2Fcl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 07:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746085151; bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From:To:CC:Subject;
	b=FX3yLychYpnbM41rzVxjhzYjWpqFtMMfFl0/eHPmVM6vLil3mxlWlhfQqx1eMKq35
	 PaBHRJM/523p3naZaSkiQH2f9O1BROVtxVYeVzFlpqc89WiFNhsXYR9ugMkUy2fBsh
	 o0czQCiMH/Ba6T42kV8XUeCJEwW61yGWTkHFjpCoSoTfGB4W6R7Jr0M+ePJV7Oiftb
	 fWxXiRp1K+gp1kRuTyfxfCf/oIsDmOy3bz2WbMxn9ADd+w8D/LyYYE+fhgJCc7QEhQ
	 D0S5eOw0QV3kyVLh9iDNr6bLkPnUl4B6xmpHSeQgwCk5G7WL7ebqK3lceKS00XbzGW
	 ad3HH/BixD9Cg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zp5Xb4D4Kz210D;
	Thu,  1 May 2025 09:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3636:a700:12b2:e53f:6cbc:f48c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3636:a700:12b2:e53f:6cbc:f48c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+zpOyiwhLO6/w+KVc9wUxs9Zvj7+vbGvk=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zp5XX1rzQz1yR1;
	Thu,  1 May 2025 09:39:08 +0200 (CEST)
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
Subject: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
Date: Thu,  1 May 2025 09:35:52 +0200
Message-ID: <20250501073603.1402960-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_003914_720118_33378E52 
X-CRM114-Status: GOOD (  15.09  )
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


