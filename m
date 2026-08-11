Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAF9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA5/MBZwzPPdo+x/NUW/gcy1HnQst/utc/ghTFwGrIo=; b=pcEMYdevU0XU5qhSgtjYXQjIjR
	AFe1Qb88nf6zbBLbueYyUV1Zuvj/G0kvcsjhxysAacJAur+rj61TVFlZtXEL+f95qfb4Q6LQTWZ1G
	Duy2/rC++KG46MhJFYWVVOw6NJJLaVh7Tm+VLhyNvOybqZB4nMAlO7WWD17lAjfrsBRyku+Cs8hgH
	uLAAKR6HFw4/pHK48aJEWy22BPIlF9ks3YrOhmGEaQhnV9J7gJnUSGgssTJOl+68cl0FDnjBHGAxe
	x2WYTViu2frcQGxF4DdN6Jw4lUcEHTVrtWURAKfmKevBpGAM/E+btczlOz1t/tkwjYWjftkVwOs/X
	G1OPZAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRa-0000000EKMZ-18F0;
	Tue, 11 Aug 2026 15:31:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRV-0000000EKGS-3rlV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so7438265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462264; x=1787067064; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bA5/MBZwzPPdo+x/NUW/gcy1HnQst/utc/ghTFwGrIo=;
        b=YwncRfiuUNpnCaR2u8Dq+RUq09AkFSH9RZrxZ+e1Yg9Ew6Fx2lSsHsEgjaHvmEMkB0
         zLk+jHfrSW3ITjmTb6SawBb0iCPmATj2O48ODPXxaApLGngjiTVaXH26O40KDxzn3THT
         oOAaNL/ulER5nEABh0DdqgxpN37z6fvcB9kSFBpqsg+NCUzIEaSSZ9+bDPBP/ju4xZWB
         o8/1CowDWIMqhnkxwzvxgYb1YOw7IOf+/rrvBAoadZgpknpTz48LoAmVuSkhG8ScLjDQ
         e2QJbGHUrR5w+96zVgMWS+rYNw/67jfHZBMrUkSmfZ0idhfJgLkEgNihhcEKy5fgvO6f
         vxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462264; x=1787067064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bA5/MBZwzPPdo+x/NUW/gcy1HnQst/utc/ghTFwGrIo=;
        b=LrsorViFFR9pFvfUgxdQO1e31eO3/U/Y/RyKxEhMMex3IHrLdCX15jJ2b6sFC7ebHu
         QNSTvZxgojXhc+sjeFHTT77KU5n5xUUcwWpb6HaLCWJOio1FpiHXDcjE9WlXH+OAdx/O
         vQg9p/vUt+0tH1nTA8vpBRtugbV7Y3oUq/WxmH0NYIceaGVf8QfY00JO6TadpJXm3B6A
         FsuvjnmF3vO1mYMwAtXBUoy0p7RI4f0xhbY9QHZWk579vEhZ0sXaNDd/3XG/Y3oP4qWh
         kvPZfp69QODxu6sPfwZOFfItvI3Tdz9JdbJitL8kREKl5JNFo5ufKvifVqb9rTPVPAO6
         Y/Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpLKbq8Rp0q2YA0CTI6PBYvvExZCNvI8r6R5on5/4w4iF1maE9DtRnyUqizg6Qhmt1D2NZ4Wn60IEKfP6e+dHXd@lists.infradead.org
X-Gm-Message-State: AOJu0YxIsjKvYRm+iBi70anWcejAcR8ZUoqaXqOgsTzVBHes6R9z0Pro
	Z68zJmzGxOAONYhgPNgjqbAbxWrfyz548EFhb+I8fugpjPG6dm59rZ+E1ftCmr29Sq8=
X-Gm-Gg: AR+sD10KCMoIVlNI2V1L2rvhiR1LJBCEB5vdod5fRY7w/4rhUVkvcoPu8bwna7X72mb
	WamUrCCDpVw1bDUZ8oHLdTv/5gIICSWZIa7k09jRHxx3eisIMImrEhvjFL+bpOsajn2dv4p3u3P
	fiG4bExVqFK77x07PJcfAOZ0QeZxlj2/QrwQXo20wewWec7UNOpKhOzYQlZMjQ5pEzZ4j4PEZpr
	lb6N5neROUgG5vDaHBFJwm2M34lbEDkoc4w7A7IzWOl9ip6ttvrIF91VdtRGqwVBrAkDWPUNOYf
	jeBMK/tv0fXucy2SA7AcY/mEQBEUDhEGyqYXUYuQ9Ci70pWlJktpmFY08vCzEVLa7VtQZ8pyx5y
	vxoh8jLzLU+UIoXZMFo7umKO4V7IvqOOlmpTgFVglz3N13y3TyOsIiLfkQb7f4XKuFJH+eJDVgN
	wtnK5DmtNxo72Cm7He4bZE3hUmaTYJGYgIFj3ds9Bsdy4mAefUMznC2OTucZAWunj+
X-Received: by 2002:a05:600c:310e:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-4997a6e5226mr11138885e9.1.1786462264095;
        Tue, 11 Aug 2026 08:31:04 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:13 +0100
Subject: [PATCH 10/14] perf cs-etm: Don't print missing buffers in snapshot
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-10-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083105_992754_1A8F5C15 
X-CRM114-Status: GOOD (  14.27  )
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
index 5bafee31cf4b..a80f34530917 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3317,6 +3317,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3370,8 +3373,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
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


