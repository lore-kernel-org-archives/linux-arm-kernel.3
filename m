Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ADFC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=; b=a4lABhlx+txBHqbLkmEnxSZomM
	m7d1sLxV5NuDC/UJptrLkSEiDpD2qj5EQvquQ0RAou3tGY1LeyhB/CJW45V7eTHUqOEtP3SLRN1ZH
	f/SvAnVa2KCFR6lIlvUZCOcODJgqcDj02plM1ed3DPtVk3bXLJqbBPP8IeskOUjszB6FsT/1Xq3Fo
	CyrGlt1ktzxxsrbfuFkW/D/cqzVsv83b2tgppX1HKd+z2TDgxLsaZog2R6NfrLa0YjVcgJQqw8Gl2
	cE/Tpau257n5V8Znl1K0vuIwZQSKKnhDeUu9ZHQJGJ5ZE0/OCzqV1McHq76MsgjT+cTwVZWN3+4gz
	/3rgigzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRK-0000000EKAM-0TGs;
	Tue, 11 Aug 2026 15:30:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRF-0000000EK7w-1xWe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4813ea321cdso847257f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462247; x=1787067047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=tRSNNGAeCHnC1ZGiGqcxvmliCf7LmwEDE/TdWAXubLJtg4NI6taMv177Pp3UrJBkHx
         hnYCVq7wD+y7QzignXaAeq7uXIZxDfWnffD4BoU7tYdZh9MEz0UPJFS42/ogURM5m8oe
         sAod9DBTd6OzrxNo78LoeEIW1eIxJYanwjEhEsKH2Kg+31EbcYbzIsrwa/VHzAxE7Gnn
         Hu/IsFZO6Sai7OO1nPzdJ8KPKOMixcJpQ8l/KGpg2ZfLKgixaCMsctbaA+QmjPahuoZH
         Kqlc0KTIbHtXIH5XoUQwhagxwWhbNY+f/V5cB3KnoxBe2uQPYUQaeOjmReiafNaQaPLZ
         W/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462247; x=1787067047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=EmpQG3rnm6yUrq9g6vb/VmaD8FnlgWG7y2amDidgEUG2+eVPeHecgz8vNYbxR6cQGZ
         2Y9MOkAyAQoBAaqg2Wej69AzWZfj3TCJiam/rkPPnTuyBY0AQWNwe9fUfMW0wV3ZXPvX
         pcd2KWrwupXhrnVLdY1zwZ0WowG+UesZ/3bxqErlcnyGWqXeawciJY+CP2PeUGErHNy4
         FaSnxDCEY/EXIogxSB+ZUIMDR+UyhmAd/Jxpyb+eMRhizyrzcbtcQjsAjV66tBChBsGh
         ymQbJ3OsANcy8Q6LYJ0Ylj4vqZIfEaodEGwhLg9sQhOF2GzoVNkzWTkmIP64FQ3cjq9E
         PkMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFCsBN4XWg71icwT3bDRJtIevd3jRctaGluhANkf1fEu5tLNt819KoGbffI3TfFSaEh3xM0Rhat0qQX6kXEHk1@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnxBM3/aItY4G2fUvlPXlEEMfFy0lqMyo0CdWhALBA5UgmYOF
	tWIBzun/Dn/sc5JdIBmRESCnFzAUHKWW2DMn2HpzfNzZUJLw86OfYQehioz8Dg3wzfg=
X-Gm-Gg: AR+sD10USySEnaLhqsWUhjNyDqPZSuWQuG/S2cJoENRlMsBbao6jhi7Nyx/WodeU5ug
	4plk/bb3KCgG5SYH2oVd/umYFSm8XyLybPH23F2/H9jeONaf7eCGb9J6AWRPSb9EribA60LMILq
	KrQHVOjXRn+5Xjc7klMK86gHubXBllRA60Z2hGG6Igt8eWq2U64+AVsRKD1hGzBtVCKJKYZ48V5
	4m4bYR9Z87z3flHavYxLpprlEVy2A8nrTBCpU8x8KtgGL0bI32L9UT8DOyfTQKJpexcsp8hCq2k
	911/ti9uNU33DJzVPWm/gkYCsQw1eYO5HNRN3eW4dbZNZdLOA88X8fXUpOa3CJgwE6ZPSSmY5+V
	EKFhMd2ov2vcuMsQx4+p7kll0/Bbuaz88BPMFZoVzPsh+t3cYeI/kFg7bHmSl/M9oHoYXNenhXe
	TKsSPt6rHbmTP+TxEOXroZGQTx9bPPbbyYUo8ki+aIIPRq6u9bfFH+WXzO243+lg87
X-Received: by 2002:a05:600c:8b63:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4997a71648fmr13439405e9.8.1786462247498;
        Tue, 11 Aug 2026 08:30:47 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:04 +0100
Subject: [PATCH 01/14] perf cs-etm: Fix nVHE per-thread decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-1-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083049_545221_31710F18 
X-CRM114-Status: GOOD (  16.69  )
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

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 114b3cd2da49..d423f1cb408f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1071,6 +1071,18 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host.
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode).
+	 */
+	if (!perf_guest)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0


