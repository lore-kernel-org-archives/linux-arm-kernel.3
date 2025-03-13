Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358BBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inXF0fSbPXzIw85fLojKxfeAwoCHVSrQnIcBk6Xmr0w=; b=pov0R6xIhM9IYxCHz9hIVQvemt
	U5/W0JjPimJxCVqCtcQnANgUC9BYhZehWooocVemMkJKz8fE9EQXWj9Ccda6QUGHLCxxRAJhCWytL
	F84pVlrklBlat5z9jQ/pBULSPbRWJK6fjDz8uaRxtaExPx2D6ealzWkDuSh+aMlbcypEkwSIZnaON
	mcXqyHFrFUvCnkViM+cti/jQmhT3astSAHs6xwRTlRGGx2ZXd8CcSx8vdcGxNvPh4gDjyNBSLfLat
	q1VzLASay7h/DJab46vFd4PQI4HcjvI5a8JytJl/hNunG7tdbSl4NxNxFs8QdI7R7/LczImlfeOlT
	IZfN6bmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmxK-0000000C8Y7-2u7l;
	Thu, 13 Mar 2025 18:06:54 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([2001:638:a000:1025::14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmoQ-0000000C5wm-1BS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1741888660; bh=inXF0fSbPXzIw85fLojKxfeAwoCHVSrQnIcBk6Xmr0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=AxKMmKCQ/tUIryjmV6bln3IsP87BGHN2B6gCMBY0/d23v1QncY7Fg4tvz9Ply2c2E
	 EtZ9j5hk/a93x8xbTIDeFfX4xhjnAVkRHkqxR8JXcWkfYBYn7XqIDdRKjBW5K87Ulo
	 CNJgfqkZkXshsU8mgMnsK14BhABBlO4wuzXR08U5aw0PIYhxgH+zSWNXs1ZU6RpevA
	 c5zAnwkfBTXgRsb0ihRA3j+8KZaIVNDtvH5S/9CVFPq29NX+vt8ZOFeBQn2HXQM5tN
	 9k0MxlQGKreHFKOYa/LE6axle2cpz397PbIJD/cx26VfVqozGpfawjRItUXG8S00o0
	 WqDysq/Kj/HAg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZDFZr3T6Cz8t05;
	Thu, 13 Mar 2025 18:57:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3614:2b00:7ee6:68e5:4447:ba92
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3614:2b00:7ee6:68e5:4447:ba92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+HSEbJ8SZ+LQGIWIboOg0KFAeQEvQjoXs=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZDFZm2cS5z8svD;
	Thu, 13 Mar 2025 18:57:36 +0100 (CET)
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
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	WANG Xuerui <git@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
Date: Thu, 13 Mar 2025 18:53:12 +0100
Message-ID: <20250313175312.1120183-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313175312.1120183-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_105742_479561_05DC0E3A 
X-CRM114-Status: GOOD (  11.29  )
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

This trades verification complexity for runtime overheads due to the
nospec inserted because of the EINVAL.

With increased limits this allows applying mitigations to large BPF
progs such as the Parca Continuous Profiler's prog. However, this
requires a jump-seq limit of 256k. In any case, the same principle
should apply to smaller programs therefore include it even if the limit
stays at 8k for now. Most programs in [1] only require a limit of 32k.

[1] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
    Precise Spectre Defenses for Untrusted Linux Kernel Extensions")

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 03af82f52a02..49c7e2608ccd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -187,6 +187,7 @@ struct bpf_verifier_stack_elem {
 };
 
 #define BPF_COMPLEXITY_LIMIT_JMP_SEQ	8192
+#define BPF_COMPLEXITY_LIMIT_SPEC_V1_VERIFICATION	(BPF_COMPLEXITY_LIMIT_JMP_SEQ / 2)
 #define BPF_COMPLEXITY_LIMIT_STATES	64
 
 #define BPF_MAP_KEY_POISON	(1ULL << 63)
@@ -2010,6 +2011,19 @@ static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
 	struct bpf_verifier_stack_elem *elem;
 	int err;
 
+	if (!env->bypass_spec_v1 &&
+	    cur->speculative &&
+	    env->stack_size > BPF_COMPLEXITY_LIMIT_SPEC_V1_VERIFICATION) {
+		/* Avoiding nested speculative path verification because we are
+		 * close to exceeding the jump sequence complexity limit. Will
+		 * instead insert a speculation barrier which will impact
+		 * performace. To improve performance, authors should reduce the
+		 * program's complexity. Barrier will be inserted in
+		 * do_check().
+		 */
+		return ERR_PTR(-EINVAL);
+	}
+
 	elem = kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
 	if (!elem) {
 		err = -ENOMEM;
-- 
2.48.1


