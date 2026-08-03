Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEAEC55190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiyOmtBwKFcxS8DiEx/nBUGoJzHwVrrKHwtU1sqSgug=; b=Au4tcObk4mtQw6L3gIDEtnK9Oo
	atZys/AlM6V2TImjSuPb5p4m5MNFTFbJB8fFaNACvzBxQshctqSrbCIX4Y4jwmW51ZJ2qtqWEVxMT
	YIomM6wlfUzMVc3kkArgOnoikM24zAx6JvBD5b7zNPHVkuiYVkxNqAv1+iFjV30UoHyYJwAv7ZJsz
	PomihFRul7q6jjWjvQzn1McUAS6Z7LEE4jo1vGAieWBtCDFZQ6sU85nAffbitHQnLabUAO7ObI5BY
	whbvJOQxP0d4/fuDYiDpRs2dlEmQMLQa0ysdyhD5nY/48StGqtFaq1N9RukZw3/hOXudwVdLeD0/O
	9aKL1v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodT-0000000GeAh-1N0B;
	Mon, 03 Aug 2026 09:07:03 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodP-0000000Ge7r-3vow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:02 +0000
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673397RE014245;
	Mon, 3 Aug 2026 02:06:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=tiyOmtBwKFcxS8DiEx/nBUGoJzHwVrrKHwtU1
	sqSgug=; b=D8492wkhk7AcbaozxmOCQz9jrgwizHkgnqC8K6g5DiGwHO/H804mF
	qK9EwC9TwHNB0Pkw4vw7FovnE3nppF4e9Q4fDpbpYWEdUGqnEBTcTHrCrtgdWmS6
	4dFoBjsaQZ6Igs1cdUCPeU+r1jRvJURCbBu2GbbyaQ1bZDG9CRRRWS6bMFiAqPtr
	04/I0S2xNuqbN6J7rJso29s1evtn7cPftQntiQFKVHxukyx1dHvPe6qPQFE5bihF
	5oFpTNuoH0UDB5gy6d8KFH67OsOJAvD5n61/67ZOwV2tClv2VToyycA+50S/eddC
	UibZI5JYSYStVcAue7wlsh69Rf8Qa9Zmw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ft2edmdjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:44 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:43 +0000
From: Amir Ayupov <aaupov@fb.com>
To: <linux-perf-users@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan
	<leo.yan@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
CC: <linux-doc@vger.kernel.org>, Mike Leach <mike.leach@arm.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Swapnil
 Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH 3/9] perf thread-stack: Bound wrapped branch stack copy
Date: Mon, 3 Aug 2026 02:06:34 -0700
Message-ID: <20260803090640.2412336-3-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::2d]
X-Authority-Analysis: v=2.4 cv=WYY8rUhX c=1 sm=1 tr=0 ts=6a705a24 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=GbPsI2Ihf5RTnMjR_gZv:22 a=FOH2dFAWAAAA:8 a=kuOsLC8opfz3ArVD95IA:9
X-Proofpoint-ORIG-GUID: kASkysqwMcx_ZDyBJy9rZ_01UDOf-Fpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX8Rut+l/luVkR
 BMrMd3Id17QClSWoQRwO7DU2xVcp8AJzPoX36rBhol0y6Xy1OQkVm5pYRCWQic74qq8ZMGamPb1
 JnOrgh+kSYh2w8pucBh8DunkJpBYufT2tgl9JuOmmrBZAW0n2OXHF+0CONyh5ce6jfFxcK6wJPZ
 m6NalIRqlOp6bmbnwzjurUKhTX3+1fvrMoNSGjfwf8pWJoWAhvJKLlqrbKQ6WlHZmD/HYfjOX4z
 gXos7akx+kkCxmyiNiJVTR6ksld18tN2esVgF9xsLUY0GvUoRb5Ksxvy6CLTp9objrXKjGjYPQG
 64YpbiTi/sg4SmTa8TTm7XA5vUVEQqZqQtnoXZDuaD1ez1BPuh72m8H8S0OfGI6f7Bxg1XR6Ek8
 5FsDy1yB79SjtJfhCYam5L+Q113QuINba5mKHR2FuqxrCdFMMM3peGfKjiFNtuqXMkpvLyA/EV4
 DRwvfY/r9ksjEZz2B8Q==
X-Proofpoint-GUID: kASkysqwMcx_ZDyBJy9rZ_01UDOf-Fpn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX2DX7hkHpVtf1
 OZWsPDIhHYx2ngvFpQG7OcrroQezuk7dcwoLyYMNY/WQl3RGSNaS7ldsXc0lE1Y+viFxZ8xTl3o
 8fNH023RSOv80ha8yswEajs1yVoQPoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020700_104125_F460F16C 
X-CRM114-Status: GOOD (  15.10  )
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

When the internal branch ring has wrapped, thread_stack__br_sample()
computes the number of entries that still fit in the destination:

	nr = min(ts->br_stack_pos, sz);

but then copies ts->br_stack_pos entries regardless, overrunning the
destination whenever sz is smaller than ts->br_stack_pos.

No caller can trigger this today: both intel-pt and cs-etm size the
thread stack ring and the output buffer from the same
synth_opts.last_branch_sz, so sz is never less than ts->br_stack_sz and
the two values always agree. It becomes reachable as soon as a caller
keeps a larger reconstruction ring than the requested output depth,
which is what --itrace=L does for late branch sampling.

Copy nr entries instead, so the destination bound is honoured whatever
the caller asks for.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 tools/perf/util/thread-stack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
index 1a3dffa83bde2..51eaedb47bb1d 100644
--- a/tools/perf/util/thread-stack.c
+++ b/tools/perf/util/thread-stack.c
@@ -643,7 +643,7 @@ void thread_stack__br_sample(struct thread *thread, int cpu,
 		sz -= nr;
 		be = &dst->entries[nr];
 		nr = min(ts->br_stack_pos, sz);
-		memcpy(be, &src->entries[0], bsz * ts->br_stack_pos);
+		memcpy(be, &src->entries[0], bsz * nr);
 	}
 }
 
-- 
2.52.0


