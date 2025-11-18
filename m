Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49844CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fy47l5qUKB/Fc1GgcEEdT+++QBTiwMB6PPYQ5ZBX3s=; b=Vtfsw2PNvPaf4As+OK2WGeR/OC
	LlSAdEDcu2IrAwZ5Cifonv+km4uQe2mShESVpWyNDlD8WGDOO6Yjy1q9uEtG0/0FRWAZVCHRjkiiw
	udFQspg3JOU2ieCHQR6UXRTF1x26dIVCYnC8Rl1uHl3rS/MVYBQgg9mkvnEZOaqSBdE/BYrxOG3U0
	ZN5U4tXGcSowKtgdzDV//x+vmFDml/CiVCBRQZh6iHfZxjO52nH166NqE2VH1Fv1AQ5XA+eXTIGND
	Hr1rr+cJbJ6r1/+FktKXbxTwxh6aq/R1w2iWttjRaTSNj5B/U2xPjp2d3HinlanKDZMjJp2xYPei/
	BY1ETAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yP-0000000H5ip-1uDC;
	Tue, 18 Nov 2025 00:53:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yC-0000000H5Zs-29Zd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:21 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso392694a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427200; x=1764032000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fy47l5qUKB/Fc1GgcEEdT+++QBTiwMB6PPYQ5ZBX3s=;
        b=AoQNXLb5lxADiRcJ33qZVw7POs6nMvCJoEXegA8selFdTkLWPqH120uVkj91Xw9tOd
         b0VZakp6KtzHxgeEJgOTlvC1xcpe94NyM4S6x6LjHQ4u70p5Xyzpx5f8RG0riT3fkzZe
         RO65Ox2FDiI6YrjKE3o4JgvKw36jkc2YUUnThWZJXQ7+XUcZck74cyyaqrEshPcmK+QC
         bi/vL9A7L5NeHWhnCR7N9Q6rvo0G5+h6yOJUYlQHUV8uaGzhmeo724rJAKs9w0nEJeKX
         PHjaem4H1v9PlzVwiyJ3TJuXetycU356u0qaIoEbyoSRYhrNCQAwSp/f1J/mxr6I46Mg
         IEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427200; x=1764032000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fy47l5qUKB/Fc1GgcEEdT+++QBTiwMB6PPYQ5ZBX3s=;
        b=MmaWB6YZAfG+KNPv4DXFdm3UFeyDBxozLv5/yb6ZUBoKGPXfIlp8V7/Yn24yz+Dkrq
         qS1CbTRLNWggPhrWZKAjBX5YgmBufb91wsreII/koJ7qBxDXL7fTXXP85ZCPEJuHb3n2
         hZSd78Tg0cisvXZR3vat/uJzcWhjZMiRvEwxiw3D7a8Yp72Gob9G8FZaUWtHPLIh5WRV
         95t5GuDTU4Z43E2/Zl8O1Wdms/XCdwsC/5m1n5m7ouqKIYtvvsVVj6xoNbcW7uRyLlQQ
         JFOQksxBqEg7sDUVOxbrdcj/quLxBX6EJvCoau5XR6KHekGFImfBtqlLn9akB4Vpc7ng
         bCxg==
X-Forwarded-Encrypted: i=1; AJvYcCXooTAwlndIigCC52TVgwMDcEymPg7PmGS9w9TGOtu932xGdJ3r3250W4nPhhroOzlazQgqmhTZjh6kmgh3Dxlm@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4I7sLsvoYjiWT/UcNEX2BN5TKgIcaN0R3fSmkOZKhq6MZmhy
	VJLGu/Ou9JBr5+czwLr6vymGpKe5peoR+sKcT7cRJFfpDEwQTwdIlOsVC170zzJ+vFw=
X-Gm-Gg: ASbGncu2I+3bjOv4dtrDCE99v42ExhwxBRgQAYktYrx4OGA9wcXJ6vAiKsxyUPOk0Q1
	hBl6bsEV8Jj/6X9yBffZRHGUBHMb03ar8bBeAypkd5DoSaVJ5jHcd8f76R6rgexNIbUFX3b+pB5
	TkS7JcW91GFJ4ryodlqnZftKockurgwEm6QEszAWIZl9wW4BgVrNEpDCiNKi2JmqyDGCHB3e62D
	mDPhmRzTviTDhcQd9TgF2Umn+ptq6X0Uukx8/NLkmVkEPHuCADTX/smE/9qCcuczT6t0HvIbE+1
	b6OrO2u/qPh3tvplR60TKfiKT6EkimzQy60PDFjyk3s5cVCgBAwBElIEvKEmsEDQPvG60cESV4V
	+t8x1W7vb9kfKOKLV+3ncAfZ7qxNQ0jwoEXRUNFv6PRNKtQkyIYafXuCGyFYCSimRo1kchU+bPk
	c=
X-Google-Smtp-Source: AGHT+IGS8MH+4wG4TpRMM5bDLUzpAWdnYKva3ibohJVmCcSnJJTwjXokFdlN1Sv5ke7Pv7ajvAjq5A==
X-Received: by 2002:a05:693c:4096:b0:2a6:9dbf:bbe1 with SMTP id 5a478bee46e88-2a6c9b916b3mr234570eec.3.1763427199710;
        Mon, 17 Nov 2025 16:53:19 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:19 -0800 (PST)
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
Subject: [RFC PATCH bpf-next 7/7] selftests/bpf: Test BPF_LINK_UPDATE behavior for tracing links
Date: Mon, 17 Nov 2025 16:52:59 -0800
Message-ID: <20251118005305.27058-8-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165320_595012_AE751AF8 
X-CRM114-Status: GOOD (  16.32  )
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

Exercise a series of edge cases and happy path scenarios across a gamut
of link types (fentry, fmod_ret, fexit, freplace) to test
BPF_LINK_UPDATE behavior for tracing links. This test swaps
fentry/fmod_ret/fexit programs in-place and makes sure that the sequence
and attach cookie are as expected based on the link positions.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 .../bpf/prog_tests/prog_update_tracing.c      | 460 ++++++++++++++++++
 .../selftests/bpf/progs/prog_update_tracing.c | 133 +++++
 2 files changed, 593 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/prog_update_tracing.c
 create mode 100644 tools/testing/selftests/bpf/progs/prog_update_tracing.c

diff --git a/tools/testing/selftests/bpf/prog_tests/prog_update_tracing.c b/tools/testing/selftests/bpf/prog_tests/prog_update_tracing.c
new file mode 100644
index 000000000000..0b1e0d780c82
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/prog_update_tracing.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <network_helpers.h>
+#include <test_progs.h>
+#include "prog_update_tracing.skel.h"
+#include "test_pkt_access.skel.h"
+
+static bool assert_program_order(struct prog_update_tracing *skel_trace,
+				 struct test_pkt_access *skel_pkt,
+				 const struct prog_update_tracing__bss *expected)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts_trace);
+	LIBBPF_OPTS(bpf_test_run_opts, topts_skb,
+		.data_in = &pkt_v4,
+		.data_size_in = sizeof(pkt_v4),
+		.repeat = 1,
+	);
+	int prog_fd;
+
+	prog_fd = bpf_program__fd(skel_trace->progs.fmod_ret1);
+	if (!ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &topts_trace),
+		       "bpf_prog_test_run trace"))
+		return false;
+
+	if (!ASSERT_EQ(skel_trace->bss->fentry1_seq,
+		       expected->fentry1_seq, "fentry1_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry1_cookie,
+		       expected->fentry1_cookie, "fentry1_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry2_seq,
+		       expected->fentry2_seq, "fentry2_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry2_cookie,
+		       expected->fentry2_cookie, "fentry2_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fmod_ret1_seq,
+		       expected->fmod_ret1_seq, "fmod_ret1_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fmod_ret1_cookie,
+		       expected->fmod_ret1_cookie, "fmod_ret1_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fmod_ret2_seq,
+		       expected->fmod_ret2_seq, "fmod_ret2_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fmod_ret2_cookie,
+		       expected->fmod_ret2_cookie, "fmod_ret2_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit1_seq,
+		       expected->fexit1_seq, "fexit1_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit1_cookie,
+		       expected->fexit1_cookie, "fexit1_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit2_seq,
+		       expected->fexit2_seq, "fexit2_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit2_cookie,
+		       expected->fexit2_cookie, "fexit2_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->sequence, expected->sequence,
+		       "sequence"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->sequence_bpf, 0, "sequence_bpf"))
+		return false;
+
+	prog_fd = bpf_program__fd(skel_pkt->progs.test_pkt_access);
+	if (!ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &topts_skb),
+		       "bpf_prog_test_run skb"))
+		return false;
+
+	if (!ASSERT_EQ(skel_trace->bss->sequence, expected->sequence,
+		       "sequence"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry1_bpf_seq,
+		       expected->fentry1_bpf_seq, "fentry1_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry1_bpf_cookie,
+		       expected->fentry1_bpf_cookie, "fentry1_bpf_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry2_bpf_seq,
+		       expected->fentry2_bpf_seq, "fentry2_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fentry2_bpf_cookie,
+		       expected->fentry2_bpf_cookie, "fentry2_bpf_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->freplace1_bpf_seq,
+		       expected->freplace1_bpf_seq, "freplace1_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->freplace2_bpf_seq,
+		       expected->freplace2_bpf_seq, "freplace2_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit1_bpf_seq,
+		       expected->fexit1_bpf_seq, "fexit1_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit1_bpf_cookie,
+		       expected->fexit1_bpf_cookie, "fexit1_bpf_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit2_bpf_seq,
+		       expected->fexit2_bpf_seq, "fexit2_bpf_seq"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->fexit2_bpf_cookie,
+		       expected->fexit2_bpf_cookie, "fexit2_bpf_cookie"))
+		return false;
+	if (!ASSERT_EQ(skel_trace->bss->sequence_bpf, expected->sequence_bpf,
+		       "sequence_bpf"))
+		return false;
+
+	memset(skel_trace->bss, 0, sizeof(*skel_trace->bss));
+
+	return true;
+}
+
+void test_prog_update_tracing(void)
+{
+	const struct prog_update_tracing__bss expected_inverted = {
+		.fentry1_seq = 2,
+		.fentry1_cookie = 102,
+		.fentry2_seq = 1,
+		.fentry2_cookie = 101,
+		.fmod_ret1_seq = 4,
+		.fmod_ret1_cookie = 104,
+		.fmod_ret2_seq = 3,
+		.fmod_ret2_cookie = 103,
+		.fexit1_seq = 6,
+		.fexit1_cookie = 106,
+		.fexit2_seq = 5,
+		.fexit2_cookie = 105,
+		.sequence = 6,
+		.fentry1_bpf_seq = 2,
+		.fentry1_bpf_cookie = 202,
+		.fentry2_bpf_seq = 1,
+		.fentry2_bpf_cookie = 201,
+		.freplace1_bpf_seq = 3,
+		.freplace2_bpf_seq = 0,
+		.fexit1_bpf_seq = 5,
+		.fexit1_bpf_cookie = 205,
+		.fexit2_bpf_seq = 4,
+		.fexit2_bpf_cookie = 204,
+		.sequence_bpf = 5,
+	};
+	const struct prog_update_tracing__bss expected_normal = {
+		.fentry1_seq = 1,
+		.fentry1_cookie = 101,
+		.fentry2_seq = 2,
+		.fentry2_cookie = 102,
+		.fmod_ret1_seq = 3,
+		.fmod_ret1_cookie = 103,
+		.fmod_ret2_seq = 4,
+		.fmod_ret2_cookie = 104,
+		.fexit1_seq = 5,
+		.fexit1_cookie = 105,
+		.fexit2_seq = 6,
+		.fexit2_cookie = 106,
+		.sequence = 6,
+		.fentry1_bpf_seq = 1,
+		.fentry1_bpf_cookie = 201,
+		.fentry2_bpf_seq = 2,
+		.fentry2_bpf_cookie = 202,
+		.freplace1_bpf_seq = 3,
+		.freplace2_bpf_seq = 0,
+		.fexit1_bpf_seq = 4,
+		.fexit1_bpf_cookie = 204,
+		.fexit2_bpf_seq = 5,
+		.fexit2_bpf_cookie = 205,
+		.sequence_bpf = 5,
+	};
+	LIBBPF_OPTS(bpf_link_update_opts, update_opts);
+	LIBBPF_OPTS(bpf_trace_opts, trace_opts);
+	struct prog_update_tracing *skel_trace1 = NULL;
+	struct prog_update_tracing *skel_trace2 = NULL;
+	struct test_pkt_access *skel_pkt1 = NULL;
+	struct test_pkt_access *skel_pkt2 = NULL;
+	int link_fd, prog_fd, err;
+	struct bpf_link *link;
+
+	skel_trace1 = prog_update_tracing__open();
+	if (!ASSERT_OK_PTR(skel_trace1, "skel_trace1"))
+		goto cleanup;
+	skel_pkt1 = test_pkt_access__open_and_load();
+	if (!ASSERT_OK_PTR(skel_pkt1, "skel_pkt1"))
+		goto cleanup;
+	prog_fd = bpf_program__fd(skel_pkt1->progs.test_pkt_access);
+	bpf_program__set_attach_target(skel_trace1->progs.fentry1_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace1->progs.fentry2_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace1->progs.fexit1_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace1->progs.fexit2_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace1->progs.freplace1_bpf,
+				       prog_fd, "test_pkt_access_subprog3");
+	bpf_program__set_attach_target(skel_trace1->progs.freplace2_bpf,
+				       prog_fd, "test_pkt_access_subprog3");
+	bpf_program__set_attach_target(skel_trace1->progs.freplace3_bpf,
+				       prog_fd, "get_skb_ifindex");
+	err = prog_update_tracing__load(skel_trace1);
+	if (!ASSERT_OK(err, "skel_trace1 load"))
+		goto cleanup;
+	trace_opts.cookie = expected_normal.fentry2_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fentry2,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fentry2"))
+		goto cleanup;
+	skel_trace1->links.fentry2 = link;
+	trace_opts.cookie = expected_normal.fentry1_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fentry1,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fentry1"))
+		goto cleanup;
+	skel_trace1->links.fentry1 = link;
+	trace_opts.cookie = expected_normal.fmod_ret2_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fmod_ret2,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fmod_ret2"))
+		goto cleanup;
+	skel_trace1->links.fmod_ret2 = link;
+	trace_opts.cookie = expected_normal.fmod_ret1_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fmod_ret1,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fmod_ret1"))
+		goto cleanup;
+	skel_trace1->links.fmod_ret1 = link;
+	trace_opts.cookie = expected_normal.fexit2_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fexit2,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fexit2"))
+		goto cleanup;
+	skel_trace1->links.fexit2 = link;
+	trace_opts.cookie = expected_normal.fexit1_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fexit1,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fexit1"))
+		goto cleanup;
+	skel_trace1->links.fexit1 = link;
+	trace_opts.cookie = expected_normal.fentry2_bpf_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fentry2_bpf,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fentry2_bpf"))
+		goto cleanup;
+	skel_trace1->links.fentry2_bpf = link;
+	trace_opts.cookie = expected_normal.fentry1_bpf_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fentry1_bpf,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fentry1_bpf"))
+		goto cleanup;
+	skel_trace1->links.fentry1_bpf = link;
+	trace_opts.cookie = expected_normal.fexit2_bpf_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fexit2_bpf,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fexit2_bpf"))
+		goto cleanup;
+	skel_trace1->links.fexit2_bpf = link;
+	trace_opts.cookie = expected_normal.fexit1_bpf_cookie;
+	link = bpf_program__attach_trace_opts(skel_trace1->progs.fexit1_bpf,
+					      &trace_opts);
+	if (!ASSERT_OK_PTR(link, "attach fexit1_bpf"))
+		goto cleanup;
+	skel_trace1->links.fexit1_bpf = link;
+	link = bpf_program__attach_trace(skel_trace1->progs.freplace1_bpf);
+	if (!ASSERT_OK_PTR(link, "attach freplace1_bpf"))
+		goto cleanup;
+	skel_trace1->links.freplace1_bpf = link;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Program update should fail if expected_attach_type is a mismatch. */
+	err = bpf_link__update_program(skel_trace1->links.fentry1,
+				       skel_trace1->progs.fexit1);
+	if (!ASSERT_EQ(err, -EINVAL,
+		       "fentry1 update wrong expected_attach_type"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Program update should fail if type is a mismatch. */
+	err = bpf_link__update_program(skel_trace1->links.fentry1,
+				       skel_pkt1->progs.test_pkt_access);
+	if (!ASSERT_EQ(err, -EINVAL, "fentry1 update wrong type"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Program update should fail if program is incompatible */
+	err = bpf_link__update_program(skel_trace1->links.freplace1_bpf,
+				       skel_trace1->progs.freplace3_bpf);
+	if (!ASSERT_EQ(err, -EINVAL, "freplace1_bpf update incompatible"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Update with BPF_F_REPLACE should fail if old_prog_fd does not match
+	 * current link program.
+	 */
+	prog_fd = bpf_program__fd(skel_trace1->progs.fentry2);
+	link_fd = bpf_link__fd(skel_trace1->links.fentry1);
+	update_opts.old_prog_fd = bpf_program__fd(skel_trace1->progs.fentry2);
+	update_opts.flags = BPF_F_REPLACE;
+	err = bpf_link_update(link_fd, prog_fd, &update_opts);
+	if (!ASSERT_EQ(err, -EPERM, "BPF_F_REPLACE EPERM"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Do an in-place swap of program order using link updates.
+	 *
+	 * Update with BPF_F_REPLACE should succeed if old_prog_fd matches
+	 * current link program.
+	 * Update should succeed if the new program's dst_trampoline has been
+	 * cleared by a previous attach operation.
+	 */
+	update_opts.old_prog_fd = bpf_program__fd(skel_trace1->progs.fentry1);
+	err = bpf_link_update(link_fd, prog_fd, &update_opts);
+	if (!ASSERT_OK(err, "BPF_F_REPLACE"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry2,
+				       skel_trace1->progs.fentry1);
+	if (!ASSERT_OK(err, "fentry2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fmod_ret1,
+				       skel_trace1->progs.fmod_ret2);
+	if (!ASSERT_OK(err, "fmod_ret1 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fmod_ret2,
+				       skel_trace1->progs.fmod_ret1);
+	if (!ASSERT_OK(err, "fmod_ret2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit1,
+				       skel_trace1->progs.fexit2);
+	if (!ASSERT_OK(err, "fexit1 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit2,
+				       skel_trace1->progs.fexit1);
+	if (!ASSERT_OK(err, "fexit2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry1_bpf,
+				       skel_trace1->progs.fentry2_bpf);
+	if (!ASSERT_OK(err, "fentry1_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry2_bpf,
+				       skel_trace1->progs.fentry1_bpf);
+	if (!ASSERT_OK(err, "fentry2_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit1_bpf,
+				       skel_trace1->progs.fexit2_bpf);
+	if (!ASSERT_OK(err, "fexit1_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit2_bpf,
+				       skel_trace1->progs.fexit1_bpf);
+	if (!ASSERT_OK(err, "fexit2_bpf update"))
+		goto cleanup;
+	/* Only one freplace program can be attached at a time, so instead of
+	 * swapping the order as with fentry/fmod_ret/fexit just shuffle
+	 * freplace1_bpf and freplace_bpf2.
+	 */
+	err = bpf_link__destroy(skel_trace1->links.freplace1_bpf);
+	if (!ASSERT_OK(err, "freplace1_bpf destroy"))
+		goto cleanup;
+	skel_trace1->links.freplace1_bpf = NULL;
+	link = bpf_program__attach_trace(skel_trace1->progs.freplace2_bpf);
+	if (!ASSERT_OK_PTR(link, "attach freplace2_bpf"))
+		goto cleanup;
+	skel_trace1->links.freplace2_bpf = link;
+	err = bpf_link__update_program(skel_trace1->links.freplace2_bpf,
+				       skel_trace1->progs.freplace1_bpf);
+	if (!ASSERT_OK(err, "freplace2_bpf update"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace1, skel_pkt1, &expected_inverted))
+		goto cleanup;
+
+	/* Update should work when the new program's dst_trampoline points to
+	 * another trampoline or the same trampoline.
+	 */
+	skel_trace2 = prog_update_tracing__open();
+	if (!ASSERT_OK_PTR(skel_trace2, "skel_trace2"))
+		goto cleanup;
+	skel_pkt2 = test_pkt_access__open_and_load();
+	if (!ASSERT_OK_PTR(skel_pkt2, "skel_pkt2"))
+		goto cleanup;
+	prog_fd = bpf_program__fd(skel_pkt2->progs.test_pkt_access);
+	bpf_program__set_attach_target(skel_trace2->progs.fentry1_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace2->progs.fentry2_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace2->progs.fexit1_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace2->progs.fexit2_bpf, prog_fd,
+				       NULL);
+	bpf_program__set_attach_target(skel_trace2->progs.freplace1_bpf,
+				       prog_fd, "test_pkt_access_subprog3");
+	bpf_program__set_attach_target(skel_trace2->progs.freplace2_bpf,
+				       prog_fd, "test_pkt_access_subprog3");
+	bpf_program__set_attach_target(skel_trace2->progs.freplace3_bpf,
+				       prog_fd, "get_skb_ifindex");
+	err = prog_update_tracing__load(skel_trace2);
+	if (!ASSERT_OK(err, "skel_trace2 load"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry1,
+				       skel_trace2->progs.fentry1);
+	if (!ASSERT_OK(err, "fentry1 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry2,
+				       skel_trace2->progs.fentry2);
+	if (!ASSERT_OK(err, "fentry2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fmod_ret1,
+				       skel_trace2->progs.fmod_ret1);
+	if (!ASSERT_OK(err, "fmod_ret1 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fmod_ret2,
+				       skel_trace2->progs.fmod_ret2);
+	if (!ASSERT_OK(err, "fmod_ret2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit1,
+				       skel_trace2->progs.fexit1);
+	if (!ASSERT_OK(err, "fexit1 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit2,
+				       skel_trace2->progs.fexit2);
+	if (!ASSERT_OK(err, "fexit2 update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry1_bpf,
+				       skel_trace2->progs.fentry1_bpf);
+	if (!ASSERT_OK(err, "fentry1_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fentry2_bpf,
+				       skel_trace2->progs.fentry2_bpf);
+	if (!ASSERT_OK(err, "fentry2_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.freplace2_bpf,
+				       skel_trace2->progs.freplace1_bpf);
+	if (!ASSERT_OK(err, "freplace2_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit1_bpf,
+				       skel_trace2->progs.fexit1_bpf);
+	if (!ASSERT_OK(err, "fexit1_bpf update"))
+		goto cleanup;
+	err = bpf_link__update_program(skel_trace1->links.fexit2_bpf,
+				       skel_trace2->progs.fexit2_bpf);
+	if (!ASSERT_OK(err, "fexit2_bpf update"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace2, skel_pkt1, &expected_normal))
+		goto cleanup;
+
+	/* Update should work when the new program is the same as the current
+	 * program.
+	 */
+	err = bpf_link__update_program(skel_trace1->links.fentry1,
+				       skel_trace2->progs.fentry1);
+	if (!ASSERT_OK(err, "fentry1 update"))
+		goto cleanup;
+	if (!assert_program_order(skel_trace2, skel_pkt1, &expected_normal))
+		goto cleanup;
+cleanup:
+	prog_update_tracing__destroy(skel_trace1);
+	prog_update_tracing__destroy(skel_trace2);
+	test_pkt_access__destroy(skel_pkt1);
+	test_pkt_access__destroy(skel_pkt2);
+}
diff --git a/tools/testing/selftests/bpf/progs/prog_update_tracing.c b/tools/testing/selftests/bpf/progs/prog_update_tracing.c
new file mode 100644
index 000000000000..bdf314e28425
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/prog_update_tracing.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+__u64 sequence = 0;
+
+__u64 fentry1_seq = 0;
+__u64 fentry1_cookie = 0;
+SEC("fentry/bpf_modify_return_test")
+int BPF_PROG(fentry1, int a, __u64 b)
+{
+	fentry1_seq = ++sequence;
+	fentry1_cookie = bpf_get_attach_cookie(ctx);
+	return 0;
+}
+
+__u64 fentry2_seq = 0;
+__u64 fentry2_cookie = 0;
+SEC("fentry/bpf_modify_return_test")
+int BPF_PROG(fentry2, int a, __u64 b)
+{
+	fentry2_seq = ++sequence;
+	fentry2_cookie = bpf_get_attach_cookie(ctx);
+	return 0;
+}
+
+__u64 fmod_ret1_seq = 0;
+__u64 fmod_ret1_cookie = 0;
+SEC("fmod_ret/bpf_modify_return_test")
+int BPF_PROG(fmod_ret1, int a, int *b, int ret)
+{
+	fmod_ret1_seq = ++sequence;
+	fmod_ret1_cookie = bpf_get_attach_cookie(ctx);
+	return ret;
+}
+
+__u64 fmod_ret2_seq = 0;
+__u64 fmod_ret2_cookie = 0;
+SEC("fmod_ret/bpf_modify_return_test")
+int BPF_PROG(fmod_ret2, int a, int *b, int ret)
+{
+	fmod_ret2_seq = ++sequence;
+	fmod_ret2_cookie = bpf_get_attach_cookie(ctx);
+	return ret;
+}
+
+__u64 fexit1_seq = 0;
+__u64 fexit1_cookie = 0;
+SEC("fexit/bpf_modify_return_test")
+int BPF_PROG(fexit1, int a, __u64 b, int ret)
+{
+	fexit1_seq = ++sequence;
+	fexit1_cookie = bpf_get_attach_cookie(ctx);
+	return 0;
+}
+
+__u64 fexit2_seq = 0;
+__u64 fexit2_cookie = 0;
+SEC("fexit/bpf_modify_return_test")
+int BPF_PROG(fexit2, int a, __u64 b, int ret)
+{
+	fexit2_seq = ++sequence;
+	fexit2_cookie = bpf_get_attach_cookie(ctx);
+	return 0;
+}
+
+__u64 sequence_bpf = 0;
+
+__u64 fentry1_bpf_seq = 0;
+__u64 fentry1_bpf_cookie = 0;
+SEC("fentry/test_pkt_access")
+int fentry1_bpf(struct __sk_buff *skb)
+{
+	fentry1_bpf_seq = ++sequence_bpf;
+	fentry1_bpf_cookie = bpf_get_attach_cookie(skb);
+	return 0;
+}
+
+__u64 fentry2_bpf_seq = 0;
+__u64 fentry2_bpf_cookie = 0;
+SEC("fentry/test_pkt_access")
+int fentry2_bpf(struct __sk_buff *skb)
+{
+	fentry2_bpf_seq = ++sequence_bpf;
+	fentry2_bpf_cookie = bpf_get_attach_cookie(skb);
+	return 0;
+}
+
+__u64 freplace1_bpf_seq = 0;
+SEC("freplace/test_pkt_access_subprog3")
+int freplace1_bpf(int val, struct __sk_buff *skb)
+{
+	freplace1_bpf_seq = ++sequence_bpf;
+	return 0;
+}
+
+__u64 freplace2_bpf_seq = 0;
+SEC("freplace/test_pkt_access_subprog3")
+int freplace2_bpf(int val, struct __sk_buff *skb)
+{
+	freplace2_bpf_seq = ++sequence_bpf;
+	return 0;
+}
+
+SEC("freplace/get_skb_ifindex")
+int freplace3_bpf(int val, struct __sk_buff *skb, int var)
+{
+	return 0;
+}
+
+__u64 fexit1_bpf_seq = 0;
+__u64 fexit1_bpf_cookie = 0;
+SEC("fexit/test_pkt_access")
+int fexit1_bpf(struct __sk_buff *skb, int ret)
+{
+	fexit1_bpf_seq = ++sequence_bpf;
+	fexit1_bpf_cookie = bpf_get_attach_cookie(skb);
+	return 0;
+}
+
+__u64 fexit2_bpf_seq = 0;
+__u64 fexit2_bpf_cookie = 0;
+SEC("fexit/test_pkt_access")
+int fexit2_bpf(struct __sk_buff *skb, int ret)
+{
+	fexit2_bpf_seq = ++sequence_bpf;
+	fexit2_bpf_cookie = bpf_get_attach_cookie(skb);
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.43.0


