Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98DEF0183A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dTFnqPhdGDy0o98vgCtpr3hY5Ue9KjjzpvOD/DLxois=; b=JRGQ2XwpiuOY4M
	EjTe/QGFyqL2M5ZHgJY/WkLGTPPAzBIuqm6XGEYsWNFLdM3SJeD6H6wOdd17C0M+3xipGP536oVpO
	olvEDn5mmBFTCx720vUE60BqTJYGUUgICxRrNdQsRri0hQPPcr2i/SBMxdSdID4VI0MuJYioxw4e1
	jlBs2JvbPWXvwwor2MfUC4fga0hx9BGillFRN++RhNnxD8SLwFYH9/rJk+nHEgaPj43cX2pDLGlfZ
	9FoloCuHQedvNPbNn2lIW2tthcKkHgOIV9bkRY+NF1eGVaIHnDIgkAm7fGlFv4fRVC0dB40J2tBX8
	0Pmsc/xyigRnqBnRef2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrJ-00000003rbJ-1aRH;
	Fri, 06 Mar 2026 14:08:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrG-00000003raN-1rAU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:08:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439b7c2788dso4072534f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806128; x=1773410928; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTFnqPhdGDy0o98vgCtpr3hY5Ue9KjjzpvOD/DLxois=;
        b=KlkNumSyUV/erO5aXQ/VtBtm16/fAO8KbkCx1e6xgnOL133R59x+mmI7dWslCtKvpm
         xRzw9gonH0pWaEuKrn08M/rP7knylhDM9wsB+XAIzutr9QPpcONc/8RXzXHqrcMNMb2p
         +NtgBfy7Xeg/eQ8RcVUVYljugzh758m29d5qF10N7DrW7KKPn8wp8nyJoW4rw1QPIZsj
         VdKsyFQQw6yoT0iuFX2ad9eFoYHbIKIoNaU93GbIGpo233D23Fi3Pf+xFYPduSgW3sUx
         cV5G3V39tQRn4vrrw9zIJC0eprbqB/VxvcRNTCjizRtiZQ6hxRtE7Z/DjLkcRViKClVn
         y3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806128; x=1773410928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTFnqPhdGDy0o98vgCtpr3hY5Ue9KjjzpvOD/DLxois=;
        b=lOtjsx5PViDIMALpHoqPYjRAeg0TjA5HoasJ9KC7TTPTES3F6FicNdIpqs/CCBxuxO
         /CHnYsvM7qenUSDvZbmMOdlNugTbIvKh4T3tXbQXxoIp5lbzCpXmjwH3uUFeFFKzR2Lk
         wWYrRTuj2xXfZot1OLw3bQLavU3QodfqxZMObtmhULN3ztMjPHcFQegTPCy4bGBZMRxg
         C/JaKf6VvguBRutpOzfhowisrr5i2CG3vpJoR1Xsd758GVx121bG+o4RSuapDeu34uRT
         OziqCnAHVMxRPO9nuWFQc4TdGQMZZGObk3IHHOopORa0HkrWI/W1rlNdQwR42Lghzh/D
         jvNg==
X-Forwarded-Encrypted: i=1; AJvYcCWA19GmSrMpW3gfhdhuDhnVUiqO03AeAc4G9dXWDaPp0bPyLuVaqb7TswD207VyG++wMwJJBW/t6op2d7mOjG0O@lists.infradead.org
X-Gm-Message-State: AOJu0YwgVdSr+F6/hkpRqRtZmUd4QVnXtqk83zacEKm5xfh5+KCDK/Er
	PBlC6hP39zvidELfGTz1ulpcamJCi+7s9mzO2VNKIPYUUFW/jg6dvoroifByBXRyr+S4VhTmgy5
	a5mUxPe8=
X-Gm-Gg: ATEYQzyVm+Xm01AFACelE/19oiKmWdtNFN7BZ6WqJ3MiQH93wdoaylqb0nghHMEAyoW
	2JsKQqc8YbFIQV/6JKiQsxgJ1juKIMf1ksVGeAMf36pc0misqZZEEHbYjPFRBNWL3jR5H6Uz8Uw
	7E3X35dqzTvvwFo47WHeFYhWvj32Zyr17fMA5CBH/JrBHLWkULbEiKOV0Y1U+ZXDiMPqwOQszFX
	QMiilALN8TFmRAxEjzy2gAFvr9a3wAxJH7LS7MaQfn3J/iZ0d/KKosWwOU9AfelsmE2IT8eZLvj
	DUP/iIg2x/JK84VU4/F8hQ6+RMBtzHX3Y430HLmqWnJ0yu1SJSgp4FT3TBfAUVBn5By/1LNtmix
	u5OPKUNuWYsD6uJTUHPTxHcuXXgPtiGHqnrCMYS7jv/B0rQ8RU8oE/RRwuiaOsoYwYXOV67MJ8q
	RaP4hmJW0D32sFTDTLcrt/Uew+RlxzhkH9
X-Received: by 2002:a05:6000:2886:b0:439:b7c9:2edb with SMTP id ffacd0b85a97d-439da35c8e3mr4031345f8f.25.1772806128424;
        Fri, 06 Mar 2026 06:08:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm4212967f8f.25.2026.03.06.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:08:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/2] perf cs-etm: Finish removal of ETM_OPT_*
Date: Fri, 06 Mar 2026 14:08:33 +0000
Message-Id: <20260306-james-perf-remove-etm_opt-v2-0-b411d3ae24b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHfqmkC/42NQQrCMBBFryKzdmSaQKyuvIcUCem0HbFNmZSgl
 N7d2BO4fA/++yskVuEE18MKylmSxKmAOR4gDH7qGaUtDIaMI0sOn37khDNrh8pjzIy8jI84Lxi
 IL/7s6jZwDWU/K3fy3tv3pvAgaYn62a9y9bP/VHOFhGSDc8bWZF11e8nkNZ6i9tBs2/YFXU/gG
 sMAAAA=
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060850_527260_CE853D21 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Finish removal of ETM_OPT_* defines so the coresight-pmu.h header can
by synced from the kernel.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Access metadata through existing etm pointer (Leo)
- Link to v1: https://lore.kernel.org/r/20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org

---
James Clark (2):
      perf cs-etm: Finish removal of ETM_OPT_*
      tools: Sync coresight-pmu.h header

 tools/include/linux/coresight-pmu.h             | 24 -----------------
 tools/perf/arch/arm/util/cs-etm.c               | 14 ----------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  2 +-
 tools/perf/util/cs-etm.c                        | 36 +++++++++----------------
 tools/perf/util/cs-etm.h                        | 15 +++++++++++
 5 files changed, 29 insertions(+), 62 deletions(-)
---
base-commit: b1718b0367ba31e8db273e3896ebd1707bcbe59e
change-id: 20260306-james-perf-remove-etm_opt-c0e9a768dce8

Best regards,
-- 
James Clark <james.clark@linaro.org>


