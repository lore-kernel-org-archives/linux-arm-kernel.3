Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37985CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BTJQtxd9YgBbEY84uWjjyLHuqLD7niOkLwH2AgMU1JU=; b=D/hpOdlTP98JYs
	UCDUogXMNyv5vvjIbshFt7pWlp0zYiLuSj1gfvYU9lBD1cDZZRD8MJV8+I0sJ7DLm7paYHY5AtPXl
	8G//Cdyg9QS+kh1lk1x2uwiZ/Rccom2HYg8GNQLlBSiRnBL2RPF050gUfaWaUXpXOH7T7uYDWVv8h
	ZumgBod9hfL+C+pY6gz9Lhtm7bL9vkkzwwS2cBqWYq/fa029Dy0qkZTZO7i1HukJXWyRlWrhyfnVF
	GDzd1ldx/wkiCDqikbv9ZuWnQRyTpi7RYDNxGEnfOzn9UOYg7L+W9e4ER1TIv+S2qx/TTRCSXIOmK
	ML4DCWRuklBL62OP4DVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEh-0000000BS5S-0F7K;
	Fri, 02 Oct 2026 11:15:31 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEe-0000000BS4m-0Bpg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:15:29 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af0707d41so1980696f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939726; x=1791544526; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTJQtxd9YgBbEY84uWjjyLHuqLD7niOkLwH2AgMU1JU=;
        b=KTKysnVeb5SCvU9CmQddpwh+7oF3T74tBFHOBO9grSD1SlTzrn6jC3jo6DZ+tMANJf
         SlvVUilPhmzLqdPLvbynAd47UYAP319d+0tHEgLexQhLmYRdVKIW7oeJxHBgUlp56gx8
         ahpTTRUMV98i3w+k64yXRRMTS95Q9n74GLEn5RqqG2j9RenkMaFYkDjnnmxnwfBSB57x
         ivEceT55jkAZzI4vU+jFDxpyq3pFfYFn/ph1fGpYhs8DH4xSyKzJbtoMxwxEEnaW9ZmM
         pd95ACBGX+3mk5Nl2gruMgiQZWZlyTF17TGKvJfL6QH8VhQnUOKCjp8OOUhj6tdqqpGM
         PURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939726; x=1791544526;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTJQtxd9YgBbEY84uWjjyLHuqLD7niOkLwH2AgMU1JU=;
        b=xmyDd+SmWPEhkVvg2373NW2fimijUsRorWgQXFZwoRuenztEIL4bEzxJLCtR6Hmn4X
         a0HXOSNNbq8POO3bkLEeyPNXCNVXlqKau9LHWIytZV/tyRKriT6/dlEeKHJ2JrrujeCm
         iRyPRx0shsf+SRsoPaQYv1m/wxfH/pvx4DIbkH07Ubd69SOGJiSBzZAQo6TB97LQlTAS
         D9oqSlBRlSUZD+0mOwcTMLSuhXpz8n3vEbaPdkZzsi5QqsnVolHz91tvTlIdtpwA4r83
         e/yTmlIDI3OTK9Fpryl5EdEuy5JHvTfTdqBjEP8nW0aLfiKCNjJ1XiEAAZAKmj6yhtWI
         j03Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdJ6scv/dvwsKTasaHMg3WDnlD6jYT6BaHX12sVihiTre1lwQ4CJJwyY34zesOAgK8DK+UEACJPCv91nGNpsIh@lists.infradead.org
X-Gm-Message-State: AFq9FYJe4bnmMF395rijKrwbtSfjTng5Ya93m9qSL/Jm29BvW/m5CzHp
	67HMKpC/i+xrY+iWblFyLPtT84i2JO2fa/t6UhVqcv/YOo7r0K59pC2m02TLGkCi4nY=
X-Gm-Gg: AYBFou2stsdP7OYqNS77UYlFjNPudRdG2Jol7L2r1b35MGhL2rKMkPLCilGGMLdIFNg
	qW/j8Wfql1O0GY74wMwBBbtuN+82jok0OPvck6DJFx6UUHSIk8zCn/9o1Iu6XGNov94sUxemKOI
	TgytZcUJpW8z0sC+dD3lTnk+HzPnQ3IxeT4yGdfydwraesOsajI3tL9VJCOq2euzhvf2bZ8qvHR
	QiEgD9X2uH5Ds8x+JLY8FPBkR22/TaAUT31C5+9w7EPnSL4DrA4XgbZfd3jsMdLALsWM0KVdCx7
	nDzd4V5qD5/luIfypylkK5SGbtuZ3KQYmQKViNnDIIk7U9qOPcEhDyNFwY543s7k1IO9+T+qh8v
	PxFP0GFjgaWxaQJ/sFrnOoDEUvRR7t4Jswdt9mYna1CuxZUX2sd/qX2Qk5g5QF65tDLzOgv3OV8
	cynlyRjjT9yMM16zWfmZIu+8e4gd7VGN0vqF+mk2vw5Qdcz2ajbv92V0Q0aFq6uAT+f4XNcZw7y
	A==
X-Received: by 2002:adf:e188:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-48b1274312emr4732047f8f.16.1790939726167;
        Fri, 02 Oct 2026 04:15:26 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
Date: Fri, 02 Oct 2026 12:15:10 +0100
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6Sv2oC/4XOQQ6CMBQE0KuYrv2mLVjElfcwxtT2I98oxRZQQ
 7i7BRKNK5czizfTs4CeMLDtomceOwrkqhiS5YKZUldnBLIxM8ml4hlXcNE3DGAClI8jWXBtU7c
 NFJqurUcQlivLU4lFrlg0ao8FPSd/f5izx3sbZ5pvWVJonH9NHzoxtvPcRoo/c50ADrldJ9Jaf
 TIm2V2p0t6tnD+zke7khxOcy3+cjFymRZ5qrYTIfrlhGN4sSMvBLwEAAA==
X-Change-ID: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_041528_138761_33794C00 
X-CRM114-Status: GOOD (  12.84  )
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

The driver might not always be able to write HW_IDs, but we don't need
them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
Synthesize missing HW_ID mappings for raw trace").

Include some other minor improvements encountered on the way to appease
Sashiko, like properly freeing queues and ("perf: cs-etm: Respect
--no-itrace option") makes debugging broken Coresight perf.data files
easier.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Remove old b4 prerequisite metadata that's no longer relevant.
- Link to v2: https://patch.msgid.link/20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org

Changes in v2:
- Drop driver changes and move to https://lore.kernel.org/linux-perf-users/20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org/T/#t
- Don't process any HW_IDs for unformatted queues, just create decoders
  unconditionally with trace ID 1.
- Use zfree() instead of etmq->decoder = NULL
- Remove dependency on "[PATCH v2 00/14] perf cs-etm: Per-thread mode
  fixes and snapshot wrap support", it wasn't functionally dependant,
  just touching some of the same lines.
- Link to v1: https://patch.msgid.link/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org

---
James Clark (3):
      perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
      perf cs-etm: Free partially created queues
      perf: cs-etm: Respect --no-itrace option

Leo Yan (1):
      perf cs-etm: Synthesize missing HW_ID mappings for raw trace

 tools/perf/util/auxtrace.c                      |   2 +-
 tools/perf/util/auxtrace.h                      |   1 +
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  12 +-
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
 tools/perf/util/cs-etm.c                        | 184 +++++++++++++++---------
 5 files changed, 123 insertions(+), 78 deletions(-)
---
base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96

Best regards,
--  
James Clark <james.clark@linaro.org>


