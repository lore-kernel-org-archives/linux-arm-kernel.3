Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A141BF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bRMqXcgfTBMb2taAmCioY8eT98K2Okrp/46Mz8Swy10=; b=kpkAplzG3zH5k0
	6pok5Z2Ugkf2SJZqGikbCtX/2JSixFsGjAl1oVmCdS0aBLr7Ox3Rd+denZrIZ8EYtjI1dvFxl4z1h
	759jxmcsGFDCIZ9Sh7YYoX8cYczoLHwlPBp+Pg2EghcyhL2m823ZYREE2FxroagFk3kOIamAu2dHI
	Bu1tInewvR/n6VgN0/8XWUcpof3LiZ0u9u0ugXjR9guDsaiRlE/nH+ZYdib0eD/K5h0EWuSBvkM34
	8/B4O1BYBfHiAsKBicjt8QJD0P3S9QrAYS8YWEdXGkS6mm5lS0F2iMt2uCks9cP2y48FpaSXb4qfO
	WP/pHNDwKr13qo7WJaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBg-0000000HJsD-1jAN;
	Tue, 14 Apr 2026 12:48:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBe-0000000HJrc-1msL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so73642025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170892; x=1776775692; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRMqXcgfTBMb2taAmCioY8eT98K2Okrp/46Mz8Swy10=;
        b=sNaIKGopOpgMsu3ksjkbA3ewFToWCX/OTnCv5lWm/gytnYRHaiu/XPtbvy42hRhwl6
         nhTsY44mmrrk1vZKRbHXwXdcjs+s8hEAbfErbUew7uU+XL84jtYnqVl/NEY3GTv3U/BW
         AQccA+fTjzZ7myR8RPmPpJCrPhn1qUYx4DHGnB46rd2uZZbacezHkMi0tWzSztnpB+38
         Y816/kOrbQ2HXjyjoCLGgjmhn7OHO7PbVvGoYaZQEU5e2xbzzCDvVpr28MIeY9XlCmHr
         7ob7sk3tdp+Di8N/IBLIgOV9XUBHTraMroCtUdKnXK1VEdATjx1Zf9TQs7yhYOmvrgkc
         FWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170892; x=1776775692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRMqXcgfTBMb2taAmCioY8eT98K2Okrp/46Mz8Swy10=;
        b=D2ccGxVVE20Rs0FwTcICNEWaw6sSoMy0B//pY5jMq8YZ0RXE78b561tbV3m1az8QlI
         9CExpdVX1c1geL5TUf4SOI4+fAvBR4BHJaes6OQIr0bbOgUwImrXgG4p0fB2ltYrmeqG
         I5/iE7f+5Ffm9INBX6CXmQbc/Hm8PH+8yCnlz4bDT6g88N8sI3t5//UWzeASG4lN529R
         j6ZUU7vIfOW08U8ohe/Th3xJxZ7ArN1Fa7oaRqJcMCyVFWE+rogRsqI/iN+XBXqQHaDJ
         e0YB4gAdSZi0MudayF8nKiu3b7J+Rb4mLkbx/49bhJUcBEvpdJkrUjh4zfuxtfsvGlNR
         m7zA==
X-Gm-Message-State: AOJu0YzYl4pybTU+mn+o3P18dc/klAV9sjZ7VulmqDsyL4Sn0eIU7IIw
	8RyTt/yWSW3H41BXIE1ClxD2aC1LQ+0dR0o+lMXeObaY0GQdGD/py1xgE4U/jYzVsQM=
X-Gm-Gg: AeBDieuWRgiIwOwwh3M75ISTrXpK/tGX2mtG/qm1UuGifke4zoKZYp5BpvS/pXsMYeo
	RIysOD5eh6Zapr/rFwDK5B7QcUP0ezWgpmd2fxeRd2jj4ajP+/iYmyNl577F3vmuAEiV1DEEC1c
	2PRwqHLAeKbGPyRIK0WoiV1Bmxvx1B6X0v74xqLI6G2uwPdzPYWb8SOkKjSx3ZAjS6x7Ktvh013
	g9RXXLGMf8xFPEF9aBcp7Z443An0j7uHRDDqTNUOgjdfz8U5e2CemfPk86lE+s0SQS1HTCOJe9N
	6rCxi77x7Q87PaBrA7dpJZPO50q0FWOrb/1YzW2KueoO3+WQH3XLUeT57Zj/1594Au6PzOvUCy2
	fUTvbdIlOIipHFMvc1vsl26JzdEjkAb19NHKkSRt8B7CMPYN4ALGRreQ1T8RvSlDOMBbweRP7om
	FRJnAbkzWjHC/Evhz8aBriHQPDNwTuSaqQbQBdmAQyrA==
X-Received: by 2002:a05:600c:820b:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488d685b878mr245798645e9.18.1776170892428;
        Tue, 14 Apr 2026 05:48:12 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 0/6] perf arm_spe: Dump IMPDEF events
Date: Tue, 14 Apr 2026 13:47:58 +0100
Message-Id: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH433mkC/3XNSw7CIBCA4asY1mJ41Yor72FcUGZoMVoaMETT9
 O7SutGYLv+ZzDcjSRg9JnLcjCRi9smHvoTabojtTN8i9VCaCCb2TEpOr+aOiaahLO4DoKOANgB
 S0Eo55cA6V5NyPUR0/rnI50vpzqdHiK/lUebz9GMqtm5mThk1wEDWwgrB7OnmexPDLsSWzGgW3
 1C9DokCVRVIdFrXVh3+IPkFcbUOyQLtZWOctgctG/4DTdP0BiIjJglRAQAA
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
X-CRM114-CacheID: sfid-20260414_054814_505085_60E24C56 
X-CRM114-Status: GOOD (  10.89  )
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
Changes in v4:
- Change a pr_err() to pr_warning_once() to avoid spam (Sashiko)
- Link to v3: https://lore.kernel.org/r/20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org

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


