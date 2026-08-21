Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50633C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=; b=P9BRwJUe2ZNFWsODU2YUKihIeD
	NDyZKWkT9rTkCeMu3NMpBLeUx51Pk8QHon9KgHPyV4rEBQ/myTEvTvJKSbr/piE1QPcdR/31lBuLg
	To1wZeVLdQwbAwItJ6xiD1Dje0Jvxm3xWrfBzUj8UzW7uWZQJuAOkskV2Gz9cpI0I9NVqejlOt6vX
	+bN8F+NW/83BjMrzP+ANeRRI5nO/R/uVAnFNmBnSaOMD3o6MXtD4kL42Rkd+nMh1gOoxLWQjvAJZZ
	us3WmeIAvt7XT9Zo9IUxY/96RleNDs74Sro1f5bl3+A3VuOLp1s8yw3atUPxv6iKB4r5qKakbtT9L
	yOomXHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsU-0000000Cwyr-1l1P;
	Fri, 21 Aug 2026 09:49:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsN-0000000CwwW-2qyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-482c58a8683so20926f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305766; x=1787910566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=KVPew5jmduzAKSZnqGW2jDSWqr3DRJBAZbUfIUUGn9s6v6pT/EdIoJsoKPc0926KfI
         o8/YTEGfENL8NP9540cGIOJ/z3+29s6yS9UPZ/MJpUYVGTDu0qnFP+juEMWSBEIfPU8E
         1TpvOt8baAWcjcEYp9F3unuUXnPZ76o/hZzX4OGEtJq2cTqv2l9pO7jKV6GRTAw+Ecqp
         4Y2T8lfDwMHvNRwSKfHWcHFcVGNsenA4WwDlgxIo/ubEpFgYEACy3+813+EHNZ/w0OeM
         5TYQD+EQhu616ob5slPkE5AnZNEoPIxFYEAvPO0jmaFdu2jYAVXKYlGAK/D80O87BkOm
         pLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305766; x=1787910566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=GN3Dn7WviuAXA28NTwqYWEGlHkZliGQ06SjP4EJ2ziSCugG7gP8aKyuY1r59aT7zoW
         Ts301pFitVNmNQeA4dgOxQXnpWKbTrIWIhhviAMPVEmQQlMApsOdJoDWRzQHbW5ZljX3
         QJrA7Ablu1xHqAea5O0bcqerMkXGOzGOWS+5886oo+FJ3ZDkaFeDDCuHebQi6OAwGUjc
         p2oLZux3inim8fpRHS7dDN5G315yDNqjAXDJlTlbYFdDvj9lCEa1TnDf6NmgkbeM+k+2
         RA/99SFDHO3q5dmI+IYHiZf9dBrKV4luB/Imv3U+5CfF3j45feZj7gpk96ODWA5bAc7H
         FxUg==
X-Forwarded-Encrypted: i=1; AHgh+RqUYeCrba+GLp7WM9TiPFccZ8CbutDxJ2K9nZ7zryTT4MVsyXsnmro6ht7otErd/r4HWje1XYY1d6m20svaJo70@lists.infradead.org
X-Gm-Message-State: AFuF++mENMjDbD54sgBN+u6F3oSOFIqqZUDpL25kt7p8EafsFX7LH0PU
	yCjVpNCZmbMjAsaguYDqB4hQWP7jvB20aDhZ7OA/5y8GplNgt60UnZniYyVmukMdN34=
X-Gm-Gg: AR+sD107aNcmKc6QAO6yw7/5qge3sgPqR4w6FjbnpDOcptDl95gaN2fSFpgF4It9LOn
	Yj2VyRbO9kV5T9CNmT00kHl0i5WmgAngDwtBe3jrK63BeAQh3wlne+HG4HPxxmpUgyGURGihnT7
	6ISysmaMpEFCW0vCQ7T8uqk6pwivAWUd+YJ2mWY+cAUGCXxngwpGK4ZDUer/zA5OIE9bePp7hk8
	17E3SnZd1oSmmYmu8IV0GS/WvV4scz6PzVhXGD23Tp3do2afWU/4GzsIQzthyawr+bmsVf6Kfhx
	qaUKNac3D/1UcWc3GBp2Hwrm/x4SE4NE8tZjxNoTgNe/aYX5QkwEDo9LAZ6oD1L7kBzGlG2ZhJO
	5EOimU5eVwUDX9OTni+K+I/CdFuGSc/Jijs+mtot1CPVTVwDD+eDpeOM9adsSMVa+dCevrP2nNj
	qjn8w+6KfWYT9erwfXf/tDhDSyBt7irso2wRe6RORRR3ajAyad0PomffgXfIh4LRce9x8iLasyp
	PyM
X-Received: by 2002:a05:6000:26c6:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482c0b44b1fmr7088817f8f.1.1787305766006;
        Fri, 21 Aug 2026 02:49:26 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:48:59 +0100
Subject: [PATCH v2 01/14] perf cs-etm: Fix nVHE per-thread decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-1-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024927_744527_8F956194 
X-CRM114-Status: GOOD (  16.77  )
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


