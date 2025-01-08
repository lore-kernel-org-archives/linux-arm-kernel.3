Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16E1E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=; b=fjGj0N0uqP1grBIc/s9fQkkKKb
	RJIp/ijmud1mWWJwMXJLNBCxunLZGO0Wcwgoyhl1fVp8SQ934MA7hrPuvwqQFmQ00A2ZKcSGa85/m
	VeuLnMaV4sjUtH1TQnpqYNHjdiS+hsXLFzHdjxcKxZeY+vSQxNKA5mHIk/g23yZah1jIpcDbF7d+z
	qOD753endj8mvXIEVuLqHQEDIHaJLSzmLrwDW2LorIf3j54Mg2BvIc4BVNMo6HdgQIaht80XtRtRg
	NbCDF7FMeq+BcT92vE6/65hH9D+m241HvS8G2gDscQiwoSZ2b+QRVeNkJDPR71ZNwiowoVGTNapbn
	q+5j7oBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX3p-00000008n3u-2cSf;
	Wed, 08 Jan 2025 14:29:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX2b-00000008mwY-00m8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:28:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4363ae65100so172892155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346491; x=1736951291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=;
        b=lnxlwzBdZrucz+wOFQUKz2GByedoOGuHhnAd0Aiy8AHHJmfM01uf9T5c983ea5AknG
         /iHNSOHvjSUC+1+vglS16v/3QdokPt7NpgHTz8buc4Ex+g1KGrTBfG37JH7lnpDnFsrH
         uRhn2qVxw6gN8P3mI5MUgJU+jPf/YPprHG2tqhKX8BPDWXTIbe8Csk9pHtMQyCMG0Rxh
         3vqMVpy2AbELROx9+DTjg6295DyWvIgrHqMA5/rAMsGq3OUPUhcj9RKtC2qeCzBKs6DC
         a0KuYxTETn3WKFM74PqvRAHXF9QuQK2GLpPxYQ+zQzQf0jARly0AKTkinnYKG7ysKa1w
         vOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346491; x=1736951291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=;
        b=RYC7PobY3F7IT6D/qttAI5Y9OI77QBjs2XL8JNVxJJehfut9MbMtk5Pn6O5grXirPK
         IJLwIFDL8ee38jkTXN06PxWhreCc9UtxVoXBH/sreTsiRI83jLrFW6/2NBwMtN7Y4gl6
         IG83O2jjVGm/hBIYKlJpsB+dandjycPAntaQ0W7HD4EkwYwCN+46Jm65tJBeVmQM2rIC
         IsLfcTh9+1FE93w3Ndm50KyG43c7liybGpRSQmhb81oeQf6f2bvJ6jqhcljaYSYPqdt4
         dJRKazD5KEKyKlEsdlWe+NIPPjeRgCy3IPjZyCk331rN03ddV6sdnP+yAkKJHXOh/qQm
         ppOg==
X-Gm-Message-State: AOJu0Yz7InJAh5zi4+cfWiHxUvXtMEoiDXZA3raR1gx8o5NDIkRlX1MZ
	xzg1mk49wcJmuH8l/0ikdFGdiFJ0U2bS1HZkVsE7jEWthi1iBjxVhT+nO9rI29Td769S4FxUMaW
	J
X-Gm-Gg: ASbGncv5EbNlFpDcjG0S+qzOSUeO4IUBiPmtQtKOX9RAobBcZEW6AtzDxZIMUnb4d25
	Qd75XCsd5zxLJUM7l49cEwzql5fECyU7xhO1ZdrmKCztL4lRnVjtOhkweZIaLICe3FgKmjbDUsZ
	aQFXHtlsDC4dU7Wh8rsRtr34X63BQnoK626TqoT171bJHRp3IE+YMkG8JUfytDngrgwXkxDGUbK
	3rJASUXAH8Qsy2mWn8EdFmrCgJDDZYiHmcJz2q5o5E4LGPb704Zq5Zp
X-Google-Smtp-Source: AGHT+IHz31vPgvjsP1ktI6cDJs5dwXi6jyonWjrDKCklrI15yME8jN2ZsQTROIywKIjV9MjHGbUrWw==
X-Received: by 2002:a5d:64a8:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-38a8730560emr2565669f8f.22.1736346491235;
        Wed, 08 Jan 2025 06:28:11 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a28f17315sm47577178f8f.108.2025.01.08.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:28:10 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 0/5] perf: arm_spe: Add format option for discard mode
Date: Wed,  8 Jan 2025 14:27:22 +0000
Message-Id: <20250108142731.400605-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_062813_058737_8DDE6CA8 
X-CRM114-Status: GOOD (  15.33  )
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

Discard mode (Armv8.6) is a way to enable SPE related PMU events without
the overhead of recording any data. Add a format option, tests and docs
for it.

In theory we could make the driver drop calls to allocate the aux buffer
when discard mode is enabled. This would give a small memory saving,
but I think there is potential to interfere with any tools that don't
expect this so I left the aux allocation untouched. Even old tools that
don't know about discard mode will be able to use it because we publish
the format option. Not allocating the aux buffer will have to be added
to tools which I've done in Perf.

Tested on the FVP with SAMPLE_FEED_OP (0x812D):

 $ perf stat -e armv8_pmuv3/event=0x812D/ -- true

 Performance counter stats for 'true':

                 0      armv8_pmuv3/event=0x812D/

 $ perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
 $ perf stat -e armv8_pmuv3/event=0x812D/ -- true

  Performance counter stats for 'true':

             17350      armv8_pmuv3/event=0x812D/

Changes since v2:
  * Use existing SPE_PMU_FEAT_* mechanism (Will)

Changes since v1:
  * Add a new section and some clarifications about the PMU events to
    the docs. (Ian)

Applies to v6.13-rc6

James Clark (5):
  perf: arm_spe: Add format option for discard mode
  perf docs: arm_spe: Document new discard mode
  perf tool: arm-spe: Pull out functions for aux buffer and tracking
    setup
  perf tool: arm-spe: Don't allocate buffer or tracking event in discard
    mode
  perf test: arm_spe: Add test for discard mode

 drivers/perf/arm_spe_pmu.c                | 22 ++++++
 tools/perf/Documentation/perf-arm-spe.txt | 26 +++++++
 tools/perf/arch/arm64/util/arm-spe.c      | 90 +++++++++++++++--------
 tools/perf/tests/shell/test_arm_spe.sh    | 30 ++++++++
 4 files changed, 136 insertions(+), 32 deletions(-)

-- 
2.34.1


