Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A4AD6B06C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIk3pddVOqWimPRGtGvBdRms1k4+AnvpJZJJoPVzhfU=; b=yqlghO1C3rlKgViSHZ4p1dVtBZ
	2NpU+VGU3RX4vifgLOQdkTEPJuRtjRei2GP4NLzRzdfODdMIbtaBPHbprmkvc+hPbqpYPFR6F/4Uh
	Y9+Yk5umihgN6QIDa3jrR6WEwpC7KeXEr2FM+t7ivhT5Gjv+vXnMdcPJIbv6hzss8qbtwBKGQcrUx
	+6H+jpZoo9ZzwFcj3ELyk+Y837/npxtd6eijHoO8kP6qout6589Dk+bOwXIX6oZ+I/RIeCDHIkDe1
	g+YYe18VsE+UpOMOtN4FMNgGUq2wF1uHLijDnSSikhYr1hbR8SuiuTCO6ufCxC/sWxYnhLgbxBH3V
	IfmiX4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUJT-00000000IWH-1RxO;
	Thu, 29 Jan 2026 15:52:07 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUJR-00000000IVM-2bD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:52:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769701922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gIk3pddVOqWimPRGtGvBdRms1k4+AnvpJZJJoPVzhfU=;
	b=vY9AWNcAEMyQ8/9xKjftxd2HgJH4sb8oDqzDzWBSRnwdcYz6VkopZ7OgxJgnHrFoMLE4Hc
	KkLbhdeHk9LLu76jL2Q2YaROe1w7wZRT38yFm768lEljcli8JUVNgwDoxMCW4q9H7pdFVO
	9J09OMPyu/sp6QBMmKJi5HipW70O17o=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
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
	Shuah Khan <shuah@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v4 3/3] selftests/bpf: Enable get_func_args and get_func_ip tests on arm64
Date: Thu, 29 Jan 2026 23:49:53 +0800
Message-ID: <20260129154953.66915-4-leon.hwang@linux.dev>
In-Reply-To: <20260129154953.66915-1-leon.hwang@linux.dev>
References: <20260129154953.66915-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_075205_793317_B5BE7114 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

Allow get_func_args, and get_func_ip fsession selftests to run on arm64.

Acked-by: Puranjay Mohan <puranjay@kernel.org>
Tested-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 tools/testing/selftests/bpf/progs/get_func_args_test.c | 2 +-
 tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 0a3236a7a109..180ba5098ca1 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -167,7 +167,7 @@ int BPF_PROG(tp_test2)
 }
 
 __u64 test7_result = 0;
-#ifdef __TARGET_ARCH_x86
+#if defined(bpf_target_x86) || defined(bpf_target_arm64)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test7)
 {
diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
index 65f7e1f182bf..43ff836a8ed8 100644
--- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
@@ -106,7 +106,7 @@ int BPF_URETPROBE(test8, int ret)
 
 __u64 test9_entry_result = 0;
 __u64 test9_exit_result = 0;
-#ifdef __TARGET_ARCH_x86
+#if defined(bpf_target_x86) || defined(bpf_target_arm64)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test9, int a)
 {
-- 
2.52.0


