Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8179DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HWvBIY2tEG2DSLTqqgJSdpMrQ0RYX+Wo9cgrgvmKcM=; b=jn9stcb05gwfLW
	PEmVqY5lPuZrCvihhWRPSuiVzNjb6NUPZP9Y4xNf6FdinqQUlIyvNcl9UjO0o2qH67qGTYeEvDXXI
	QIJ/mir1SeWOS53ZcPFLYuOMfIs7LsqgVaYf6E+rsvqRoNe/XgKCtd5UQO512HLFN4xV/k4jpCHFc
	Z5YDIR2OFaYDkrdPKLD+cnJaxgI7/fz2eotbNMxiIW00tSJOJALU4qIjRDePmQvbL+dWKomuAM1K6
	hSMVdO+QVVcIlhPLXtRlVs8/pa9tqtiKBO+u60QHElEQHsTf2UBvfWktQEs1vaZfPAKdec2axM1l8
	v2BAs0Nx37h8rB+6Gc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3w-0000000BQNd-3v4F;
	Fri, 02 Oct 2026 11:04:25 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3t-0000000BQLg-3lIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:04:23 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a163f2555aso1554305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939060; x=1791543860; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4HWvBIY2tEG2DSLTqqgJSdpMrQ0RYX+Wo9cgrgvmKcM=;
        b=D7WsqUY7H7C//cRaY+zVKdV4whVlaPI+V7OBxGRKqHjSaB2zptnH9Wkc+599osH+O3
         0gzdL92ArqSexIOycMQFhaRlr3z/1SzYt4LtJ0+xCoJzI7SYlkfDlp40mb8K5+pzvJ9a
         a+BD3AwnYDS/c24vPaMOBhXut7aMT4NOqClpydwhuGCUd1PvsBYf1CVD5wMzi6Ah+FmN
         flRSXlTFGZcbGjpfev7zjoqPoWdu3PpZx1Aasv9H09tZHUGxk+tKwhU2JwryHtz19M0s
         XTA9ltLg0tLoRLS/YhxxF0xKJaVAbFKtsufRbhXHXiukb3QUpjtC5Ql/JpX+0ci6+q5K
         7HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939060; x=1791543860;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HWvBIY2tEG2DSLTqqgJSdpMrQ0RYX+Wo9cgrgvmKcM=;
        b=Mm4A4Eg6F5eNCuQJfxt6EHAFfaGt/g5RMgDjLld1ykpJLdG45qplrIiu+Eo906L4zg
         0G7+kuCqgAMUs09CZLhpzSHDruK7rlQa1s9tcR6773p7kkkZJZRHvOc4HXevylNEzTj7
         SfxvQG806xTIAS/T4DCe8eM+VGwjlTtM++aa9J1ujutV5YBQ2ii/krP4DVMFw+mAPwhV
         D1vC2gkHSjx2JPbuyWq4qS4cJD3bTOT/+zhKw06Em37le69ubz0g+5niae4BoSDBgTBA
         GCFR3MKYyw3cyTNbyiRr79+Z9HOK1eGjNIRuvU+WisNo66xiAyf/1YMqJO4bIigWBkRk
         4uPg==
X-Forwarded-Encrypted: i=1; AKwUvBzb1VtQd6E4EJZAjSv/Nz6/h8h/BRYAhG3uxsH7qC5hEKoBDE5EmlXBBdIduXS02lwoM63QUdvnOiRalrjqNey4@lists.infradead.org
X-Gm-Message-State: AFuF++mVhVoD9K3VNKcria6bHPc2vmcvD9qv33lm3giDi+XcB3SiXOKB
	rYWEMLA+xj0K+kQT6ezc6LcQkZAJA53gyLDc27MqmYUifm9lejemHYhZtwD9YmaWoX8=
X-Gm-Gg: AYBFou0711nTPW4CwgUcm1i5NKjFCee3fLMMBZ3yBHpO4szX56rv5iJt+7/Yo+M5yz/
	NV4wk5hZD6rdil1vjrZ3IiZeNddm1LLx8Rsy5+V1o/rjwrEOWt3SzV+2+UOrnfdxqmsflOnW4Uo
	scxt8mLuo0jdt/TfUe3qoIpJ9i9qhMSkWDP/SoRDy12tJKQ8zDXKKAX/wUIxU5XP2C+dEquV4Fw
	/G0Kmn5MZXySyYjqDX+HngfFF6efdoU158XZrq1LKbDWgWxhOW2EqodzBxSDgbJEqBhXvxlNZtK
	p2GS6GlwJsRLir+0U6zkPQsAd9rsIy4jJ/VlpFg1ZcfV2mXarq9tO9NV8lUTxNs7FD3l4KulMmV
	Vih5xddI8IQYRCTvbST87c7uFsPRImGVdknAnYAaKR2KfpIlzpKSW78Arv7QC7U1luhZe0wZMhg
	826uNi8vKO5kq287/ApaxW4beW7G+Yk6FEuuDredWUDEkWzDkvExdL6MhS2ylpblJwlQieyYGp2
	w==
X-Received: by 2002:a05:600c:4e48:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a02769cf5amr46752105e9.18.1790939059584;
        Fri, 02 Oct 2026 04:04:19 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/4] perf: cs-etm: HW_ID improvements
Date: Fri, 02 Oct 2026 12:03:52 +0100
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmPv2oC/4WQS26EMBBEr4K8Tke2+RhY5R7RKGrs9uBowMQ2J
 NGIu8cwi1lm+WpRr7rvLFJwFFlf3FmgzUXn5wzypWB6xPlK4ExmJrlsuOINfOJEEXSE8fvDGfB
 rWtYEFt1tDQTC8MbwSpLtGpY7lkDW/Zz975cHB/pasyY9wqclSw9Hw+unY52tDxOmRAYWCpDGQ
 GggV0LNSckSUVlO/SYP2YCRQPtpcqkvVCuqVre17BSXlbWkUPEO9aC0rqzuuJJKCNWwY9boYvL
 h9/zCJs5d55hWin8O3gRw6ExdSmNw0Lp8u7kZg3/14cou+77/AXxPQ4xiAQAA
X-Change-ID: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040421_968517_0E38A2D5 
X-CRM114-Status: GOOD (  12.57  )
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

The driver might not always be able to write HW_IDs, but we don't need
them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
Synthesize missing HW_ID mappings for raw trace").

Include some other minor improvements encountered on the way to appease
Sashiko, like properly freeing queues and ("perf: cs-etm: Respect
--no-itrace option") makes debugging broken Coresight perf.data files
easier.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Drop driver changes and move to https://lore.kernel.org/linux-perf-users/20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org/T/#t
- Don't process any HW_IDs for unformatted queues, just create decoders
  unconditionally with trace ID 1.
- Use zfree() instead of etmq->decoder = NULL
- Remove dependency on "[PATCH v2 00/14] perf cs-etm: Per-thread mode
  fixes and snapshot wrap support", it wasn't functionally dependant,
  just touching some of the same lines.
- Link to v1: https://patch.msgid.link/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org

---
James Clark (3):
      perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
      perf cs-etm: Free partially created queues
      perf: cs-etm: Respect --no-itrace option

Leo Yan (1):
      perf cs-etm: Synthesize missing HW_ID mappings for raw trace

 tools/perf/util/auxtrace.c                      |   2 +-
 tools/perf/util/auxtrace.h                      |   1 +
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  12 +-
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
 tools/perf/util/cs-etm.c                        | 184 +++++++++++++++---------
 5 files changed, 123 insertions(+), 78 deletions(-)
---
base-commit: 78148c85297024ffe7a709acb7cc4fc907271176
change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
prerequisite-change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e:v2
prerequisite-patch-id: 1aa32269a3a7dc76840dd8a24cb5a8715507e898
prerequisite-patch-id: ef471f468351462f67efa58a09a3461306ac5a0a
prerequisite-patch-id: c78946cf4ec1c7722570865403a3562625bdaa33
prerequisite-patch-id: 0b953eee0252db3c7ba3ef1e3397048a94482ca2
prerequisite-patch-id: 27da72c2f01bcc68205bbcc14d5019369c02cb83
prerequisite-patch-id: 365c6d5f71c754e4c690b5ebed3453565bb5b809
prerequisite-patch-id: 64e9419a41082a2db3daf255baf0fb40efbae5dd
prerequisite-patch-id: 1dc2e6ef8e76b369736b4c88560302861b2e4faf
prerequisite-patch-id: b7de38ec4d90f5b45d56390a4e5919a1d6439951
prerequisite-patch-id: 3548d5b161cfb8c11a166ca2b3228ca4821f1ca0
prerequisite-patch-id: 97e66600218a2b32e5b21d0abcb6321590f98de9
prerequisite-patch-id: 292282b20bd8ad7d096ee7ffbc55dcfb75455f53
prerequisite-patch-id: c80259b47850ba65c985c85a29c8cf4948463d59

Best regards,
--  
James Clark <james.clark@linaro.org>


