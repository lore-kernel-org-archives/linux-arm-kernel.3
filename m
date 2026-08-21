Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB3DC5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g282Hfq1E3bRiinvQDdFnK2jPyq4jjgh08sJOHY2A+s=; b=rKLAQ7CHvq/Qxhe718PjJtuhnk
	HaIhXHZEiVolr3d4FVTQ5YJWGedvOMpvus6PIc769bUdqOSnVtIVt5iYF0sOI0bfQgNupsud125NU
	T/iDsSWGLxPicL2+gvFsK0pZ+SMRVlaV/YKgHbupMG5UIR/NJMIEg/RzcNzh2dfWExkDpB7rdoTeO
	yexgS47pZPIVxfisfg/184D6uh37PuYnr9UZDUYAUOjgjbK9kfZ+nTya2nHpiLUgW9NbRFmoTaBbP
	XR9u7NfmpDyipqT5h4Pi/zYr97noRexcj6pXgUS1gRqiNgknHYzYXXfdv18pmG6dVwEo77cFTzzPE
	s1WrXY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLse-0000000Cx6s-20zd;
	Fri, 21 Aug 2026 09:49:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsb-0000000Cx1q-1EIC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4798bea72f9so417662f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305779; x=1787910579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g282Hfq1E3bRiinvQDdFnK2jPyq4jjgh08sJOHY2A+s=;
        b=G/ZLLPYi+9N6iINFaay5CeMs9k1OFh7C8ClqIpndDrK9hy3mkpqSsUARDlZRF+6qSQ
         cWjkTxxpqnbJ0xz1MfbJSsiqJunWtpzeYaKkGbdqMqX71zNIpkAO832oUoAnhyns4cIX
         YBg/2KfDpj3ArWzhwVVCJ6YuREIsKtlPY534GkIRj+5mv17pOC457ym05hsvSLy4gSw3
         IdQkQux5BXC2hS7kywbamBqBXRa1E0O9YTDUjYz5xCyMR6fW6mA+OvmaBQQPc4Cn1Fpc
         WN7pGwvrBH1wuLh2JCJPkyztz5xXNWP8rK6et0cL8NP0wKiuzy5I7wYhoWEIZR93zu1Y
         3Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305779; x=1787910579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g282Hfq1E3bRiinvQDdFnK2jPyq4jjgh08sJOHY2A+s=;
        b=LN1r6hxVuxj/PLrNag5e8Ha5S1x8yR6RvmNhVfQPCYua0NRWsZyumfkpNW5gYJmIFF
         IunZizmGRd24ckm63glsNQVwIkFC8RNppSzsDR5OFgJ7ZxyaGWyNJcK5omK8zgMJaEVf
         3iRztS7gsHwqrngts6mMMPZ6OBdIFYkyi6D1Ri1FBii8tsN5uCVjAvdr9tSokmtZTGYJ
         dpONyabQIkhBixh4JaED0mXwn2ekjgUng3HrsE5/DhRvdbElBxHKzK2Z8XNv7MNqg2ih
         D2MpZZ26QJo/XxOl9Y0VAPop4KHfREB85GqQYFm589oDaXIuRoEXQhOHaXVQvt5U7bhJ
         wvNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgbnNDgz/NQF5/qtRHya9HwPtmBeYFEsNLK9DWARfyeWKgrEa+lvNkoEsLJ5jirS5M8ZFtC7iRw5J/e4uuBTzv@lists.infradead.org
X-Gm-Message-State: AFuF++lpcn3I8kAex632/jTjnzbVZcUZ9GTw6p9PKRkq3CzTpg+O59+I
	jrbCrctYApCCeEQsn0wNtENQdp5yc4SUJ8mhNDUdyL7DcSx++WSwRYN4OW4u3HNmXgA=
X-Gm-Gg: AR+sD10d0UEW+ic1Qy7yZ1rwPKQGr+UCYlbDLmw6NsaggIcuq2Hw2/4pkpSkp2mUoQr
	WhS6/AmyNy3Hbl8W/gRlVxhA8Mf8HRvKnJWCBps6tBvWPjscSZPHnSU4YOAOTsHcNxfS6jdN31H
	QCED67gIxKKFHr9d2+Y0x9wCbNtfNzXKiRB2PWKnz0R524arcTI9qKqRZZN3z3wikFGmA+XSv9g
	NJRqfm80SXSgVzuAKQYGvCUDeNJ/EhqyEppOQi6ueUbdGIiom5yMQeej6rH1nlF4veaAgPcRFbC
	tJnpT5aRRLaeeaMGzbGeubRXGOTANP8oFkbv0o5YEfaJj6nGv2UBspCspSsdlWgdKcUPtr8avMn
	HC6JmubRnBUNSMHnORo7uKSPW6jpXgftnZ3h9dvFjd9fwmuGh2Hj8ilrj3aIH9hgpKwrhv+JHMY
	YUuXIDJ12oGj7k2aFOrbp7JTs+SmXi2AYyjeAe48L0B3mHLvF6A1pPEmFKRRfKB4MZ
X-Received: by 2002:a05:6000:4310:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-482c0b9dbf7mr7147239f8f.19.1787305779425;
        Fri, 21 Aug 2026 02:49:39 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:08 +0100
Subject: [PATCH v2 10/14] perf cs-etm: Don't print missing buffers in
 snapshot mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-10-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024941_353236_4708A17F 
X-CRM114-Status: GOOD (  14.35  )
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

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index d1eb4ec17bbd..6e04602ec204 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3318,6 +3318,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3371,8 +3374,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0


