Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07729C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=; b=fCMW8SNB3e2psl9PnJxH2QYacp
	On0TbMSpjIMVWl7mDh61lp0wTn2j/SUxB9Y9SU+omNZ3OszwnX8k1k/YMcjte5QdIonYfpI2cfoQc
	wNZ+s2AcDd8+j2/DNtr3X3p3YPLFUyAZmDDRO+GGzBduzMyQDAoKFswAeEHDDUfXxHwfWebjJmal7
	IG2EiTfIpFnGGv+STB2ruV57pXAf0lvboiGFhapyYPE6g/J8/iq9SH/KtMukghqlir1G9pxRUKuyv
	BkmlaFBMBrjaWzuGkuaWnGixRYQjrlDBbEO7DlFtxw6lgTVGo9K3nYDPv4UZRp7SvinS+E2iqhRYH
	GR1l00OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRK-0000000EKAe-0tIn;
	Tue, 11 Aug 2026 15:30:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRG-0000000EK89-3NZs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2123156f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462249; x=1787067049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=W5/LzjGPD10wjhRHA93RsV3IADwVwuglBn8lOeqezvLLBs2fg3tD4ftXFhzwp6kj08
         L+lLLxjTzxyzv5+Notitr0KomVTdkkvsqeM66zeyFFfM9fleGPR65hwVMQtkQYQSkrPl
         zo2oS36LySq9xC7TOIYvqxE5/6gHP6VsDTx3W0Klvik+Xll3Fy+XkTREyPFZjLD7UStL
         UvegrTN1/uQiCe1VacSJZ3/bM+/Cv0NhPX3yXAsnBV4XMy0WU0c7WiYjAPK4oyiMgv7s
         LxfHO6LLzp4SsdCrmAuhVfikaipZK0eoiDSCZqE9/b6R8K1R2TNqTdMlZ9S7wfmBLqt+
         FlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462249; x=1787067049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=oSzxgIayJcLPzYRJNWZ4Tfby9HQMt1QpUEFopF4Ee+sBXCjxhs27Ywhud06x8A89eU
         6xzPZAPCAyY5qEMV9NWLOszz4Ut+0zGb89hE5ps/XqfY39q6hbQygdn3B0+KzZGynZHC
         MG8xPTY+osqFJzUdo4GzXT12IkUeNXuq/gomQBqyb547uoWKojdluW2IwRIqD//qYodQ
         M5jzL4b4DvYO8mpbQDcOKXtQdEbFuxhExqyCpxkel1Nl8RIq49zSgjz8vSKXuyLVJR3M
         inYhIORdQJGz1n6P9+EpN3x6052Gx3oUjYRPzFqiNP63iRzlWs+TVS5o+BEhZrCqbFVa
         I7PA==
X-Forwarded-Encrypted: i=1; AHgh+RoVZvb6zrS3yFr8mhNl3R2gNkJnWceyj+ujjszIl90IDc6zWVZ0ARSFEp7ckjnjZz8qpr5zzmG0hGSHeYD5gsF5@lists.infradead.org
X-Gm-Message-State: AOJu0YyMh0n+14BNs/s0uHAp9ACVy/ammaY+5XafkggPqThRLj/CLx4V
	xlP1NX8NkwWKo94Aoe2j5C9JyXy+QlUSrcH12mN6xn6oJ88lG3FDj8o6vglk1aC1bFc=
X-Gm-Gg: AR+sD12fAaMNavCanA/v9jleYFVm6+3W4o6wgpnR2iFMFzYLAQQ8fNaJf9QWbr7Ug8g
	0StOAWM4QUlNz2HRfK6kjGXiOyOWfO/cb/VME/q4E3+plaDUBR0TjBxwUif9m/l1eZ9f1ZZmGaM
	xWKLUpmvIDFJh6xZTp6+3DlCpzLYPwkdk+cndYVROXp3cXwF5LxbJQcuysYvSG0m0+gCsydksyq
	OBfxUmsNllDVYuxpqsmi6IX+DN0qttJwVtSQDfCqitn5Ex4tBTCll0B/H5jUInh8DXltL54pnsF
	fsshyt8Tw+Vyj7ftyYOhP9/QO2EG2xaGcrln+WOvEIsRoJi0nJ0CBVN/lm6csWqKIEogky4tFnL
	UCE3mX9hR4blF2y0IFo34C0NQqG7mEnYrumfQ/7+aWUhmWey7BszAX5dqm9RcYzT8rUYk1V13MD
	D6h02hFOiY55lQ/uTm/kyHHh3lwcMuNnO0fyFBk6OwX+JXiNSRgWWUV+QwyCWdB3FD
X-Received: by 2002:a05:600c:4513:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-49978468c2bmr59898875e9.9.1786462248915;
        Tue, 11 Aug 2026 08:30:48 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:05 +0100
Subject: [PATCH 02/14] perf cs-etm: Warn for invalid timestamp option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-2-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083050_862994_8283B121 
X-CRM114-Status: GOOD (  13.40  )
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


