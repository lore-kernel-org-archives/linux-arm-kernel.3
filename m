Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rvTf8Il6f/mqfra/iGYvNWp4kf3icOzgbKsdoIlAr9k=; b=o/mTZBVbGflLuX
	2+R78jEA9kjlqyOWzMBylOccdvQdHTCAR+NuF1If3YDN2H0aC4V1GQJTI0K9APjbnZ0No0l/Lti9R
	k4g0tC/ks3p5wpCh4yNWPueeJq8oegMDJIT9+E+AtmaEHWoGSnOAx8DjSyUWZnlslWFwfnDjDIS2S
	tTpLMuOq0Iqma4W2C0q06ztSQGtGTOi5va6cG5zACILqtdQfsI8rstskX8LyNqKt62tPSOR94Qgi6
	3qhB4lAofjH2HguXugAZz2qJ3d7l69gwgB2mCGAeix5Dd6Q8CVdNgSeYs/FgRNL8gkJrKafHVXAK3
	hsjlvWrGkbK43Qrd9kBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLU-000000010PJ-1YAD;
	Mon, 08 Sep 2025 17:08:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvahl-0000000Gv9B-25tS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:10:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so2122937f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333440; x=1757938240; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvTf8Il6f/mqfra/iGYvNWp4kf3icOzgbKsdoIlAr9k=;
        b=LKnckcWWc8N2fkzy2r6tlqG6e5ySzkAweIXuDM6p0THGjkSdhfFfS2KT14Wg50fn6g
         nGuIeHuhfRfOUFGkKGTBVbV38gpusI8d2n28D/S8kMzDKj/C7GA2/MLiteL/TN/YM7ua
         ZqArrM8fwFzCfZedjnkcUTkUHJ80yFRSqK0h4CI4++QfRbWp5n/8N9ObBB43oNz3Sti9
         e4PTeH3IxgSv3HLnLmHUZ1elPrumRRFb5SzmVpZfVB34c//8TPq1i7gYpMVPXDvcZcdw
         bWRTJavh05JGfML2wOLtgTMmWKIzonwgOSlkt6aO31IdFHQY1RmkdwHZUj7EfGEgTUDm
         kdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333440; x=1757938240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvTf8Il6f/mqfra/iGYvNWp4kf3icOzgbKsdoIlAr9k=;
        b=pRIKWBoaEuDhoflyP6EKz4ASUg17q+lgap5pCMwTMzSLzmgpjvpE51IHYW4RiiyDRa
         m176dXV8ad+ZcxqfSMJHamPuC/9qd5Mzj2Wqh/d2bVhKFcj4kivuTT4ng9ztQyEV4MQi
         s8b/9B7VwH1QuQaROGfSJvFWGUpS4/IGMAAZ5Bhwas2QugMGJ+DDHXVyC1KTIhBP6NOI
         8krtFLAnMMrParW8CYd/3i4eDXYC5ro+S5NsT+75+sDzEsURCuHB/2rdN0ayh/GDg2NO
         X1OwuLiAJD/gLexgY69mRlWR0gX1A9yv3w0SCGBnIMDZRpKMR1h+HbfjqVyH8nSnC41j
         cDfQ==
X-Gm-Message-State: AOJu0Yx/uCtDMbY0/lC6cG57m3uMru1Pm8mZqgVqAIXLL8Rr0dRljhSR
	pJacThV4kWyaj6f/arzV91B3s57opDIMDM9MnwasJUUgD7y1tUb8+koJtPWTznrrVQ8=
X-Gm-Gg: ASbGncsVasIFxKneV0DZALM2B7IiN2pLNmncYW6UId8ZmAupBS1qFpLb1s8EgQen+mu
	XhKIMmVC1XaKB2C9tKZtdczAB7Ou+h3xe8Sksf7MwFqhKFN0U/D8xHe0pFep6FlixJv+Hg/cxgD
	b2Dh+JD6B1Cu5LCI2vXa27syRAryxID8vHlB7LdqTxTtG1blsqcXZDhzq05klCAdqqKgvlS3mlv
	3HQOwoQdPd9XOR4bueuu9IIZwfCLLbkw7Z45u2rV8Mn9AsZaRUWgzjtCJirRvAY75eewRBSQMFq
	gCMQcmjPfQ/5fL6hgQ5jRdBenR2FGSVzOzDJyEHqJChlNAuOc8p1GHPl4sDIURSAbUWfU9f3DjC
	RTPus3r7OSF1Imuhr1rtS8Ae/cKo4nir3ZVguK/JLZQ==
X-Google-Smtp-Source: AGHT+IFEyhgsQFK+8cAvwVvaOJyzzhjwcI+1heh5zPX3kbpjk/o0y5jOw3y2xWOVWDMeF85EgycT/A==
X-Received: by 2002:a5d:64c3:0:b0:3d7:618b:293c with SMTP id ffacd0b85a97d-3e641c4d63fmr6143479f8f.16.1757333439535;
        Mon, 08 Sep 2025 05:10:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41397825f8f.50.2025.09.08.05.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:10:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] perf arm-spe: Improve --itrace options
Date: Mon, 08 Sep 2025 13:10:17 +0100
Message-Id: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnHvmgC/x2MSQqAMAwAvyI5G2il1uUr4qFqqhHU0oAI4t+t3
 mYOMzcIRSaBNrsh0snCx55E5xmMi9tnQp6SQ6GKUjWqxtVtJBgoepRAH/Axoam0dqW14+AMpDZ
 E8nz9365/nhfqGFC9ZwAAAA==
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
X-CRM114-CacheID: sfid-20250908_051041_551719_D759D448 
X-CRM114-Status: GOOD (  13.25  )
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

Most people also want all the SPE samples (instructions group), not just
the flagged samples that are put into the various memory groups. These
should have been shown by default but weren't because the default
interval type wasn't supported.

Also when looking at this, it appears that the downsampling was behaving
in a way that would discard samples from one group but not another.
Improve that and the warning messages.

I don't want to put fixes tags on these because it's only changing the
defaults and the behavior, but I don't think the previous behavior was
incorrect necessarily, just copied from tracing techs but not ideal for
SPE.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (4):
      perf arm-spe: Show instruction sample types by default
      perf arm-spe: Downsample all sample types equally
      perf arm-spe: Display --itrace period warnings for all sample types
      perf docs: Update SPE doc to include default instructions group

 tools/perf/Documentation/perf-arm-spe.txt | 14 +++++---
 tools/perf/util/arm-spe.c                 | 53 ++++++++++++++++---------------
 2 files changed, 37 insertions(+), 30 deletions(-)
---
base-commit: 75a7b9d29215c5aa813b9620f3c56817918f9f8c
change-id: 20250908-james-perf-spe-period-4711a566cba4

Best regards,
-- 
James Clark <james.clark@linaro.org>


