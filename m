Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE080CAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPsz3uNLgOVT7SPTn9Igef5H+k3XdxFXx7NJztU0cBc=; b=AidT46YDLfRa+mEE7DrYdGvV8k
	2qz0p/fiw7v2MEBCan0b+6iW5xnhMeTLBGQ+9OFHmRkTcdyVneFfl2nnJ79lAtmlooUGcaRu0cWIj
	0mab/97Szoemlth6izXKDOksVPBWzfNh7/QLBV1Swh4R2IbzfK2aTHHzCoGBSWrb3DrRJzUMMgwwh
	jxtcBMiysfP3dy3BdF+L266iBlQ2RQaa0xn55j9/p7k7FNeJ+EfoI7mizpEWE/4mjF6fU/wbkGdF4
	qYJ4HdydsaIVYiQ0g2rx9YrzFwSiZ60r3tQjAHdxAsgQ685vfAnLpg2uLEqkrV36dhDzxfklG/nkr
	KYEdjohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLV-000000010Pp-0WX6;
	Mon, 08 Sep 2025 17:08:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvahm-0000000Gv9W-1Ho1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:10:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so2652765f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333441; x=1757938241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPsz3uNLgOVT7SPTn9Igef5H+k3XdxFXx7NJztU0cBc=;
        b=ee3xZ0qiyMB5ULhf+DgHwvAYern61apn8riGtvHULFE+QOXyGty8s2jPYNzU96jGUI
         vgdnCJAB74AL51BWtjNIQPJVTC/e/bWMgzBWpfSsymtVEQu2C1WBSna6s9bcrEEzv8IZ
         ymwxF9ovjhj9doklG4bdxnZTSAO6ZjiRnfy58i8dFcLqLiRbKaXHwyqaI/6ai3BOdeJg
         48OiBLpyn9qP0Pqq2E64LiMG2PIQ4m8EZXPASSCOvVLmuOLv5UxIvMNl4EMtcCcLCwov
         2kvgMcmNzZnOufFq88kcylnvoYWnSG7aBQQwS4aavzvr3INOZOQBUWvG1fc0s0a5XoGi
         aaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333441; x=1757938241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPsz3uNLgOVT7SPTn9Igef5H+k3XdxFXx7NJztU0cBc=;
        b=ecU4T8kzhJ+xns/urUHWYwSWav3AI3VM/o7HIXiA8cAYDCCoYZ3941CM1+xXIio5nt
         TqfK4ytUvpIOYQuF5xJjYNY3zrjQ5XvNcOSPAsUgw0IssZlTudMCePp96Kn87jQPHJwS
         8PM4yURi4f/qorWr4TMb5u+hCcXTeRAG9bzO/MbITWFRA7yGKhFAZRbBxTSdtgdUN1km
         HJyxCP9sOEgyKY2DUAUNauN5TzdX+J5zqw3lfHgd1Mon4o6y2TSbH5EST2NZkfqvtCLU
         +vvasMCyk3RRxtD5Fj4tnSbSUCJ5ts7jT/VwXbCohnjoshZApRMW9K0NF5Sm8VZ/2ooL
         zrCQ==
X-Gm-Message-State: AOJu0YwRNn3b849b1mDwV0pcOZBm9KZaeedctcHdaMCxW5irktigf0+Z
	kQoY14kNN6RMvFRR9NZvDYa6i3nglXwW+a6VvXKishFqb0okeJnK8Zh7cZqY8Ip2ndA=
X-Gm-Gg: ASbGncsV9X/vdLYJ0FAHZPmY1IgGaONS4UP2ypDTJUuGEGXmwHp5TgeE6KBBGm7AYR+
	cIjV0homttke0mnWqZvD1bhsoJiv32cjqvEirdtQDXetl5a0+d+u3kOUpiYbUVNFaswdAOqZ9ia
	Wz42D/AAFlnti1QX9x/Q3RS/67yTFacNa4RB1dlYmD6OIZASJMBxCBE7SAF8EhgM3yYEjaM14EZ
	zBPEWZFKM+eA5+6ad/K80B+/gdQgygInP6lnmMZhDFxRvOCIYTIgtTqX5BbLVpQkOFf+21U3dh1
	E5R8TsENnUlprMlMaYlPZ8pVLjOQRQ+s8fj5zNWsvvB9u4You/FuV8ReBbJ/QJxTHHTB5TM5LVY
	xV3OWpL21rnvynDFT5v21Do2FzdxcjUhs0oC2aJpbAA==
X-Google-Smtp-Source: AGHT+IFAaqKpjwj4aPOKWJLqNnoA3Btfgww5j5z05x/U+gptVrld/EgQZppTeTjJAuYETx5PqyHeFQ==
X-Received: by 2002:a05:6000:2489:b0:3da:37de:a3c2 with SMTP id ffacd0b85a97d-3e642cadf51mr6040771f8f.24.1757333440672;
        Mon, 08 Sep 2025 05:10:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41397825f8f.50.2025.09.08.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:10:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Sep 2025 13:10:18 +0100
Subject: [PATCH 1/4] perf arm-spe: Show instruction sample types by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-james-perf-spe-period-v1-1-7ccd805af461@linaro.org>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>, 
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>, 
 Michael Williams <Michael.Williams@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051042_352793_8D64FCC5 
X-CRM114-Status: GOOD (  16.46  )
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

Instruction sample types are enabled in the default itrace options in
Perf, but this never applied to SPE because the default nanoseconds
period isn't supported. This meant that instructions ended up being
opt-in by the user only when they requested an instruction based period.

Change the default period type to instructions so that instruction
samples are generated by default. This can overridden by specifying any
--itrace option.

This solves a common complaint from users that the unfiltered SPE
samples appear to be missing, and only the samples that have memory
flags set appear in the various memory groups.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 8942fa598a84..b33a0a170ef8 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1871,10 +1871,14 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
 	if (dump_trace)
 		return 0;
 
-	if (session->itrace_synth_opts && session->itrace_synth_opts->set)
+	if (session->itrace_synth_opts && session->itrace_synth_opts->set) {
 		spe->synth_opts = *session->itrace_synth_opts;
-	else
+	} else {
 		itrace_synth_opts__set_default(&spe->synth_opts, false);
+		/* Default nanoseconds period not supported */
+		spe->synth_opts.period_type = PERF_ITRACE_PERIOD_INSTRUCTIONS;
+		spe->synth_opts.period = 1;
+	}
 
 	err = arm_spe_synth_events(spe, session);
 	if (err)

-- 
2.34.1


