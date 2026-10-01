Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE6ECA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=; b=Y7XEw4+DHGyzAX
	JT1WKtUVGpUDzp3oeUHx3P3der4RJunrd0N6M1b0v1T0f8BDC2FSUIWvR9K6coJekbq9RBkG0xsr6
	r4e/zBN4nex9jZ9FDf4/qCY6+RhiNvVvQI5wx0BPm42glw25Z6UekJIk2PleGgtIHi4Yfz8K8A+9K
	ND4JBYKHRgZ0D8Lkkz5AW45rT/kH0CJsa4bTeRuYTjOjOcnzcAf86zcrdfixznBS95QQNlVJyPHvG
	+Ee18ELJcq7ddz+0GyXCCKgoeoPAs0Awi9rIzbIl8kpv0o4tojBROWIzh5hZEjvn3dzkBySRCuCG5
	UC6yPHy0aah/yZP7GzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfI-00000009M8k-2HfB;
	Thu, 01 Oct 2026 14:21:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfH-00000009M81-2akn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 14:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=; b=gX5H6p/70cEXNzxPs98annlpks
	LQujRCDqC/F6XH7O2Hlif9IQZukSz0/xUWCeCcjnJKBWm1tYxSgnUa4eH6SPwQ6Hu6mrSxyn/+MhZ
	foHPHAy4OsyfxgNRTNtAJuuBLDnzZcvs/SmkSaMBItP8xSEicn2Z072komQz03e/IigStZIinbpLZ
	JsrhFTOWPHKsiZYpD3PwP5iaOLTB5R5tgF7B+Dxy1zh6iNyGz4WoFuRLd6UEoO+dR2RNUCDdvJWM7
	w/g04rliJGxu4xSxv9hQsIWeOgseCSpgA5qTr847OFpU5m/5MrW/8NVA+7qZBWjxLJuD4sBdPsn/f
	EiBkqN2g==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHfC-0000000547N-3doL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:21:38 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887840c529so2288948f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790864493; x=1791469293; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=;
        b=fZ7xliiqSMK7gPjYoiTheHOPIoIAW8hDbZuRA7ibT2eKxr/CegMBJNcfUdlprc0DMK
         ZLNPDFJpD8h9CZ/2pwqeIH3n3HdgQY1J3k2amEUQouLDScOnNJ3y9ogmbqDmRVg1lEbw
         5vIklIRgcsPm/Ip9p1qXRjO+51717jiFM1yWq/Tf/PD/GLjEugelsa0Z/I6dN96Uu5Iv
         rCHUPrdayFzB07qLu5VHjEiM4uJTbNS1F3QBDhZNNFH2Qqf5YmCAUtgTvig7SYcErnDl
         /GHN25rK+D5wPjqiaAYr7v5cIulszvY3CZCoy72jI3+Gw6VqEZFcbtqcYGOi7osDIxhC
         6t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864493; x=1791469293;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=;
        b=dVp9AwNDnSCYkuznVc1vcFXok2qKrXVNehOkF3Knvb+3oxmS7+TuZvYdBphKzUElbq
         g+E+eQdzbrpRWyEPjwcWEjIHzIC/9WeTzQxv0mqUaS8+tndzNkcjB43ta/PFF6+By2qo
         AoRmikr1uLNglOZZxa67bhKtGsO8rx/c3sQKslS27QSboqTozb389i83gdNXtrb/oxG6
         XQokZReO8+GnyTMmPrHjB9SIDsGdfGzpyMzBaPpf4FrcUEYx7XBIFZXuSxWkbWjwT2jR
         upNWWVLKbQ9+sN9npoDoh7atOC0EeY9bh5wl5w7pRXNv7zzPn/FQMMi/OiJp1gQCKL+V
         cjmw==
X-Forwarded-Encrypted: i=1; AKwUvBy84W19nbA7D216u16iDnIjOExdXKCuzXvv3HuZ/uW4dZpaOJOvCZ2ZDHMwI4R1wWcOlmT220vK4OqTsYPMi/Or@lists.infradead.org
X-Gm-Message-State: AFuF++lIFHgPeGqmPZJ9hxPrBfZqqkl/7AYskEV+jQRmby3uGaJ8HI8l
	vWp9LczavhMaSWkeBStoQcQwOegBXvdQ/+cjVEl7tRh6Mbk6I1Odj3gZjDmegpjAT9o=
X-Gm-Gg: AYBFou3YZKzkat8Mw5ls3frX6Cguz3NlSrgQwCh/6evF0bVajsyG6K0oOUnAP8YPfNJ
	hz1fBb/w+oyTNT+xxSz/4pPp263xaTcPjhxx/+gH23sjmX4xyEiXPMh1mSJ5vVCTxrf6UgVOkZq
	zdukQybwHloDKHqovdnUV3XhW20DHsrAaUe/TDI7LJP0gqSsoYsBxCGXl4bXaag1VMTjZzV43dv
	otcPQScDcYFPG1mkgDoaVBe3XmMZs6yrzjxrJt1XtFs0nN2MrAIW08XzZ3KqH/SsLiHRLPEuHio
	jXF1/cldrCl8m/apuv58oSKodKp+Y8C0sGLfK1MOTlkrECdJVXPESPC/axTFX+Xs0mUxueFUDV6
	FlxVGQ82wLywB1BAT35TIVQEtqDk0HVv8ilWCHvi2hllIsi+dXmES42QKqCj9zy4Ibu33GnyHwK
	tfiANRO6khtI48iSt39QfHALr9j9gW13ET56NRTCX7jg53QEgCH3fnjuf3Z9hTm5fWgUtvDzx3O
	Z1u/B41AGviQg==
X-Received: by 2002:a05:600c:a107:b0:4a0:1ef1:b62b with SMTP id 5b1f17b1804b1-4a01ef1b7ebmr38500685e9.10.1790864493549;
        Thu, 01 Oct 2026 07:21:33 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm34783975e9.2.2026.10.01.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:21:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] coresight: Retry failed HW_ID writes
Date: Thu, 01 Oct 2026 15:21:14 +0100
Message-Id: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpsvmoC/yXMWwrCQAxG4a2UPBuYmYKIWxGRNvOPTcEqSb1Ru
 ndHffwezlnIYQqnfbOQ4aGu16kibhqSoZvOYM3VlELaxhAij90FzuJsmO3Nw/OkmXclQlopKfc
 t1fRmKPr6bQ/Hv/3ej5D5+6J1/QAt3Ef0eAAAAA==
X-Change-ID: 20261001-james-cs-retry-hw_id-8f1ec3cf2db3
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_152134_959596_FF761FEE 
X-CRM114-Status: GOOD (  11.46  )
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

Extracted from the last two commits from [1] as they were only
conceptually related to that patchset, not functionally. This can be
safely applied to the driver separately.

[1] https://lore.kernel.org/linux-perf-users/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf/core: Return errors from perf_report_aux_output_id()
      coresight: Retry failed HW_ID writes

 drivers/hwtracing/coresight/coresight-etm-perf.c | 50 +++++++++++++++---------
 include/linux/perf_event.h                       |  2 +-
 kernel/events/core.c                             |  6 ++-
 3 files changed, 36 insertions(+), 22 deletions(-)
---
base-commit: 75ba5c486ea071d44d3f61318c88a7793bc768d4
change-id: 20261001-james-cs-retry-hw_id-8f1ec3cf2db3

Best regards,
--  
James Clark <james.clark@linaro.org>


