Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B778BFEEF4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/r/MGY53zMFfOMSK7WGpq8A1pzaXpaNozArFN59i/g=; b=Kf9Egc3LqL12ZA
	DrT8FaPUeCWCbVh+RBb3MzGKekRHdsFfjB5WCVpz1dOUF4bL5S/kypF9VuIIigdB1lIwavPB2wGxM
	IdYjmgsh4iuuGldfbgHCQ0Fj1LuLzKSUnAq3XJ+zUT74gJr7nsPbj9u1yrXiqMp7JhMdwB5ADhfUy
	JPfzUN/5fvRITRBO90t2IdfU57M+wW0wG78FRLYmYjJeQRaXmGgl/kR9/5s6PIwwpxHMt3NbtFnxH
	bBeH7RgisOZmygsjleaONsFat54MtGFqRehtB8LRg6TlD64M5tx3JWPkR7rwzsfiwMV6qznof374V
	TQLpni8bSQy4H/Q8Phig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA741-00000006YvC-2ded;
	Tue, 07 Apr 2026 14:05:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA73y-00000006Yto-37Mb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:05:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a041eae5so24460665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570753; x=1776175553; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/r/MGY53zMFfOMSK7WGpq8A1pzaXpaNozArFN59i/g=;
        b=dM16NEJwqjXbdE9GE8lm90kxriZe0pV5yOFNWlF7Cwq3pvDRRrZhBWIHhsEnfgyzay
         GeJnz5BZ+6CkTtsgTExkEHx+QY1ea2MrCT+Hu+F5sD6Qqm+lAefxn3ufr4IE9QZEKHc/
         VS80l0weDirfSBH1DehkRQOdISnKvJATO6IusTQzFwv2W+mPC00qsjvSyPy3/oW97bUp
         Hi+xF6P+Qj1rKPIamZyOieT7VGqxd3TESiT/GnBLVedl120RxqO2GCxt8MMG9oerHcrH
         OvL+g9b680PCRsBfFqJEIjVQodveQqPPEmvgQ+jI1JRkE2lGPNguiqmxYh6penKU4JPK
         9JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570753; x=1776175553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/r/MGY53zMFfOMSK7WGpq8A1pzaXpaNozArFN59i/g=;
        b=NVZULSovjfZ1kZMsQsedcyw85I4rbTav5xyAQUGEfVFVUgNYtVQcUPwhEJyKIPKbEn
         C0aMeJ7Wf1miLuxapuaQBlAyROd4sASTVk6Gox2ViDq9rCdl9W5cx+pbQuzi8Jm6lnhf
         v0rHauOvuq4GaSs8+lBI4sQ7S65//nOHy/4bT8OmhkdH41iDGaTfLxSl3/aTni+WdVu5
         06fUj7YB0DEbEH2C91jHWDykn1D4ThUF7pPIq2xKru3aGOTDFloRQp+wUaeGPM4Wc6bn
         1CYZ+Mp8h/N1cdKgfBneFJvUc69uatKfgRXLZ9hT8+bmuNJMpCL7gyCKFR+Vn//qnoKC
         C8ZA==
X-Gm-Message-State: AOJu0YwnIyEBJap9kGUD6ZZ8g2hMcRMwgQ3N8at0ad+3VZGZe4YBFPLe
	af8d0977qN2KNwdrKrfkWsg8RLhxmpYlye1x4nbhYKiUPPbMpKt1oDQtYK1z7UTwdvI=
X-Gm-Gg: AeBDiesFJQCvJQ9FvCx60k4/mWj7GiCIgA9/f+uSK8twD7uMLyqlaVkGCQiXg9Fqxri
	ATNv18njvbEmp5oWi2l9k2y1dz9xs+ye0IW8MB+hw3tT5Y3kzJzlcWxz+hTE0E7SYTTzmUDe3mr
	D4+/pT2wY4jzz+r5mmmsp08bqLxrq47v83v2/FIJ5/4Tkqfwe5lkKjObx9Xyb9YcCDcqPFJOM1z
	YBneN/x43M88v6nDpDyifoJkMxWX+t5K2ouvOSHu+LIZGAuNrz4p9+lWsK4w9GdlPd7IgQ5Hhq8
	dVH1X6ex4XX78ots9JLHyzfAvzBNjrDWucn5jUl9l2sWL6/4GdNDtgpuael3GiVQcvUOf6HHCtL
	3WVHv+5ROqOtdSTsdvqeaHjWt8IQVghgqcf1XCrHzFSUMDCgOtE6PS4qTJbKE/vpqfRMcksQ2cV
	T46HV1li/QOn8G0QNk1/Jrg2tiAeCz3o5E
X-Received: by 2002:a05:600c:348d:b0:488:be21:54b9 with SMTP id 5b1f17b1804b1-488be2155c0mr42030555e9.8.1775570752688;
        Tue, 07 Apr 2026 07:05:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/6] perf arm_spe: Dump IMPDEF events
Date: Tue, 07 Apr 2026 15:05:14 +0100
Message-Id: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABoP1WkC/3WNwQrCMBBEf6Xs2ZU0DRY9+R/SQ8hu2hWblESKU
 vLvxnr2+GaYNxtkTsIZLs0GiVfJEkMFfWjATTaMjEKVQSt9Ul3X4t3OnDEvtZgXYo/ELhIjnY3
 xxpPzvoe6XhJ7ee3m21B5kvyM6b0fre03/TmN+u9cW1RoSVHXa6e1cteHBJviMaYRhlLKB12kc
 VC/AAAA
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_070554_825498_AE9D3E1C 
X-CRM114-Status: GOOD (  10.84  )
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

In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
ability to add names for some known events or print the raw event number
for unknown events.

For example:

  $ perf report -D

  ... ARM SPE data: size 0xd000 bytes
  00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
  00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
  0000000e: 00 00 00 00 00              PAD
  00000013: 49 00                       LD GP-REG
  00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS

On N1 the event line becomes:

  00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH

Or on other cores it becomes:

  00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Put MIDR in arm_spe_pkt (Leo)
- Use for_each_set_bit() (Leo)
- Use BIT_ULL() to fix 32bit builds (Ian)
- Don't call strtol() with NULL (Ian)
- Link to v1: https://lore.kernel.org/r/20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org

---
James Clark (6):
      perf arm_spe: Make a function to get the MIDR
      perf arm_spe: Handle missing CPU IDs
      perf arm_spe: Store MIDR in arm_spe_pkt
      perf arm_spe: Turn event name mappings into an array
      perf arm_spe: Decode Arm N1 IMPDEF events
      perf arm_spe: Print remaining IMPDEF event numbers

 tools/perf/util/arm-spe-decoder/Build              |   2 +
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  |  17 ++-
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  |   3 +-
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 144 ++++++++++++++-------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   5 +-
 tools/perf/util/arm-spe.c                          |  62 ++++++---
 6 files changed, 158 insertions(+), 75 deletions(-)
---
base-commit: 74e2dbe7be5037a5e5eed6bc1ad562747ac88566
change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7

Best regards,
-- 
James Clark <james.clark@linaro.org>


