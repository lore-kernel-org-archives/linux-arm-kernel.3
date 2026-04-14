Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B22F531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/UlFbfy1tsVpqkvx1d3PVwDBlDWdNrEuOEoNe4Rz2eg=; b=xM5Hf65JZZ+Yhk
	nA+zBTqS3aLSeGgWsPa6jWdBO5VW+qm16fGp0wsiKRAsZL5AdhIO1VL2TPrltOfpq0moF4isu35bO
	owCBHACHOz/fM17nori3BVgjGseNS81lNrlsEnylRlhCpgOmdUfmdM4V946u7YyipsQ7Rn3ki0qBf
	CDtSHHIkPq1qwXuIk1OWzqpbF4E6HuFWlq3CAy0x3n6Fm4oMfnBtgvgv/0fDNNeTL1wjDyzd+JsSE
	44fCRDupEQUZVVvtNed1EkSj7azNC6UL0KdUnIDW8beuCOmbxxngq+Hc8hF6+oXtmXhgzjknj7zGB
	ljGINl8QzeIoK2obDgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbay-0000000HCLE-3NkV;
	Tue, 14 Apr 2026 11:06:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbaw-0000000HCKt-3CYk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so38480855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164773; x=1776769573; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UlFbfy1tsVpqkvx1d3PVwDBlDWdNrEuOEoNe4Rz2eg=;
        b=l5aeueVmnM6LsoarvqSaZaS20PGCUCNY3Fj8V36YhE6LCd9f+uQaZLpirV9afVNAnG
         Gf2dKAcBWp/bfO89uRkNDdRNyUE9foVFeboMH1QcKaMRiq9GwS0AuA9lUYWElhnThtA2
         LlS1BqsgfQi+4RMMFx3D/3YQ8O+tCXIKTuCSexWh/6yPAyMtPHFq6KSrmt0Tl84XgQew
         v4F/YhDXxk9GyvDvOB7mO8V8vYm8w+kc3YBOVqyqw+lx7Uci88HtNqOyW1Bx/ffvBtzC
         c3+fo0+ZsFDw9yRZmAf6T+MU6hp4UOn8UMX2NFLmR1HLYQnYGWvQ/Bp0+iUGxC4JZzW8
         LHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164773; x=1776769573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UlFbfy1tsVpqkvx1d3PVwDBlDWdNrEuOEoNe4Rz2eg=;
        b=DA9Zr/v16nrGN3B/QPCmduboNssqwnXXUpja724QRG+McI4jPV4RrKg0pKgkzBqh05
         ixJhtKWpotE4gar4egZBuNXZnumxhhkkgBVPVgxy8iMrQZMMXQHJvjmlU2Ih2b8YOOh1
         RIiFpTdpBqRNwGUsj/gZxnFcm2eZUFycXBWQfFbhfkFghZ5xVubMvwBdx/9I+5i1ahwT
         eg1E8ftONnlodAGXuEP064MFp4pEM0eLAkrGyEs/zKAZwGEbs33Brfgb/Jx0yY8gJ0Mn
         kXfAerUA+ejFac2+0NWp+YlgARblEFBb4ZIy58VbaUBxd4MYxjOZXZtp0SuzCujg9qjl
         xvtw==
X-Gm-Message-State: AOJu0YzS9pPrC4ZIhHMTYauPJl5XaZCNw2gQbg+899WrIF7zDkAft0TD
	eg+B/UyCXep7oCKtbZfXuI5EZdyV8OOmprPpl/03XTq1/FAmC0DWKRVQvs/4FE8LBNg=
X-Gm-Gg: AeBDietmyUxhRdhZn4H0QKj/UjRspDDx/Q4CEN5e+6rxBmKkJoFd/lu+MzIe7qeLJR8
	uHE4UUsrYVJt7FGOMQrW0i2VCn5q+NBAYYJSwQtPKUd2hqg0WWSbt4+iSox7XcM3vSC+tw8xn7w
	fNdjlfipw0w25fmNtblDhl2RiqfIYirCBmM8bf/CGsihlvH01fqbpS9XTWLUq6Eokze6YNrsy41
	H/cwfmaQhFA/gm6wDNXXZc5MHXZBFtWdFxsiflzZo2lPZnVlsCJ7unqT8DD8UjGJT8Gkwr7xsx/
	rzY7yFxVqLB4n5XFxUON26kehAIChtQ9YHKU3K80Wc9L4A/NBacD1VJCat4pxIH3J8A48mUl9dA
	a4pdgiWCutorK3Mwtj1fEQEKTDu8PZGA3Z3hFbF2kWCYv6Ovdpr4T3Wc3ks5DKdjtDhMnUsMqE5
	n/62cfArRvgIu8zViRrlDW/pQ+fwDcaqnaJS2zJVc0Mw==
X-Received: by 2002:a05:600c:628b:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488d68603ffmr214529015e9.22.1776164772573;
        Tue, 14 Apr 2026 04:06:12 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/6] perf arm_spe: Dump IMPDEF events
Date: Tue, 14 Apr 2026 12:04:46 +0100
Message-Id: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4f3mkC/3XNwQ7CIAyA4VdZOIthhYnz5HsYD4SWDaNjAUM0y
 95dNi962PFv068TSxQ9JXaqJhYp++TDUELuKmZ7M3TEPZZmIOAgpKz5zTwo8TSWxWNEchzJBiS
 OrVJOObTOaVaux0jOv1b5ci3d+/QM8b0+yvUy/ZpKbJu55oIbFCg1WABhz3c/mBj2IXZsQTP8Q
 nobggI1DUpybautOv5B8zx/AP+fj8AIAQAA
X-Change-ID: 20260331-james-spe-impdef-decode-d944f4fdcff7
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Al Grant <al.grant@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040614_916656_9D407166 
X-CRM114-Status: GOOD (  10.91  )
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
Changes in v3:
- Revert for_each_set_bit() back to a loop with BIT_ULL to fix both 32
  bit builds and decoding on big endian machines.
- Link to v2: https://lore.kernel.org/r/20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org

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
base-commit: 4e03d6494f9504f8af46ba68a2a8b6877c196789
change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7

Best regards,
-- 
James Clark <james.clark@linaro.org>


