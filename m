Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C4DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=; b=0CZRB8DNy+IDYNjF8zSwCqaUiq
	mdBt60//AkY8TVNaNSZroQm8Ofbjn9zkObjdRVt7rB32utl+s0qmfhm+t3PF9rKF0YJtIhNSwyQrV
	iHWnl6clr8c54AOz/SFI6VcVIONhA6+ezsHkkwdt/uhW+rhXTZnSBNeYA2XskEBaABN0Nr0dPfyHe
	fTr/NTn4RSziMwa4IqD5/29+XAoht+CHDvXGJe1/0Oas+8jflZlGSzvHrKXJWMejDW79drf+aEGqh
	PqSw1J31Wtn2bOm7VT8BythOK0i8KNG8/TWlPnJOY59w4ZthFnhLCFu67stQ1f/D2nFb517OVVB24
	5vM3gzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsc-0000000Cx3e-3fW9;
	Fri, 21 Aug 2026 09:49:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsP-0000000Cwwq-2ATU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fde295992so574047f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305767; x=1787910567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=l+5xhDHw1+wUHFqmqA+sHH1Bk6Hu+45c2TzygwiRwSQIziHgJCraMAWXGnl/tq0qog
         EzphHHrCdMZ9KYRY8BKHLAT3nVWme3+fmnhpPGj5DFGauOhQyisdbkTzDcCxxDVrzyql
         SNOaTFt2oQk5x41sNwNwKTr058+5jjtB8UdSH/Wj8PUU+RzdVMqhOJokyFWe/oJvpZly
         OVFFWAAUkLq8iTRmVujh2N+fl32okw+faBx/RX4ivYnRSE1jActesePT5qtAAF2OVLGU
         yktqW0ejCpB3qmIB/WU4McW0WDoxyBI2I6AOJiXOQqVbvrsZNVDITrtHt6TK6lOCXQow
         MSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305767; x=1787910567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=fydHP7VZ3gZiHvKGH96An9AkI2Rut8Uve7hWvQ6I30mMoojRjDJ/z03StmmPodVEdT
         TM2kbNLrzpS6iWj55XbI4dwszqsbkX1XQyn95996cdAvxqhKPGZ9K9WvVxOtAXYMsT3t
         IzGx5TGWpAmjzyxh0cfi+RHDqQ+skoOiJD9obeT2Ugpi5cfEYVaR9gFwXtlTnMzBtrsq
         Ip+Kpip6PAgz/HdgSGQt4O+W8wEuM4Nbm+HKnNlw+QCyL6wBTJjRe00IMOQmfEvKkuTb
         Kf6s3w1O09+YBdsIzgmGiXv4/TCs/ke1FJaq52WGPBzZqyoVx/Yl9eis0gx+CFiFm06x
         51Ng==
X-Forwarded-Encrypted: i=1; AHgh+RorqHqfQqt0T0OV7+4U+rkMY+2ABX1tzWwvRhB+w7+UWJBS1L0WcGaIozrRZpNUwkUKmE9stQR8ogGn3t+IVKqg@lists.infradead.org
X-Gm-Message-State: AFuF++mdeWr3jWYjGSzuk7bY4M2QgpVYdgn7hu3nhw1tEuVr+GoTdoY2
	JrHlnwQEzJtlTSw6SlQbOV51EvaJBr5SgW3W9vpZbsm64oXy/+iPhs+6Yhi0RIMNfrc=
X-Gm-Gg: AR+sD10MLz70IxKLIqbijs+mAkpErxBAcFOvcY7TY+/RfaE8/Qlhy+2eD/VEOB2DWlJ
	drd3HStBMoiTXnJaYnL7J5NTTf5qRTiX/3YfrroYPDqclNepitMu2cQwW95k5XR/WrzFt4SK6Jk
	cqCIK4PiUtxjtzRkwnTTKOKV2AoOsS8iqzj68MLHZH+LZc4tXSiw1DlmlzPe6eF8SBdo7d6QFD/
	PTttt8CBZx1n52ZEs4KnECPJjvIOZWOmu+0mEL7rmF4LmyoroANMHf5MuzF7zXjF9qWp/a7pILW
	PkxC6Lv8qrUxXk9DEmKFul2steLGSRr72eRPtHpOQtWTpku1d9o+KeRJkTdd0vaFBBVsbZmAd22
	OCop3BXcy4kJomS1nKNZ7NTKlzDgmk42urk4KjGRNJTegq/q5tX/spC4YSH1juk/wIWv7VpqQYx
	Aw5AJKUKPmutMPhhUojxCH3CttD21gwASAIFVeN/B1P2bymEfSHbzCuLnnB/Dc9fmhDhcQWRkUK
	js=
X-Received: by 2002:a05:6000:985:b0:47f:e746:dcab with SMTP id ffacd0b85a97d-482c1184819mr5551648f8f.10.1787305767292;
        Fri, 21 Aug 2026 02:49:27 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:00 +0100
Subject: [PATCH v2 02/14] perf cs-etm: Warn for invalid timestamp option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-2-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024929_575326_2F323748 
X-CRM114-Status: GOOD (  13.48  )
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

Instead of silently returning an error, print a useful warning.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0


