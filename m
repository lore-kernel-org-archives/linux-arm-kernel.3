Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC93C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJMmlptoopG7uLnpNHx3BFeWdRFU3hEImM+p7yUrZvk=; b=0warAVJPi9Kyj5wN9NyNY1Lxx5
	GJB4yYW6LBEoS8nr8FUQ9Su7ly05kPTuHg+E0GKtri34JHfVWz+u7hrmDZQZgLkk2+KJZH8QlAVj9
	3pZXstE/Cwwug+fSVh8a37z3bjXECkXT408hP6MGz/iZec5yCsRvhutNbp64HgIc/1LEK1+MNmBtQ
	pKozpAkts3OpvAx+AXtAMpk86W+3mmnTekPo8mAFaADnOzSgk+GP63enNqiSBBgAaHUzkSq1bNW7Z
	+0ccrBeLxQRiLIm2lpyhTh9hljz2jdOXLXMRhDwhcsQwG/45/FyE16dtNJdvlH7UcJIuxyan1rqQG
	aE0xLw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLiF-00000002jXE-1CEU;
	Fri, 08 Aug 2025 11:56:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCc-00000002evF-2mtu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:24:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-455b00339c8so12893685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652241; x=1755257041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJMmlptoopG7uLnpNHx3BFeWdRFU3hEImM+p7yUrZvk=;
        b=PQCV3rZP72jnPKRK00fVWYFlEsrPFsTKS5xAD0GI4LZc2J53Cl+DYk/vjMzAMgcj+m
         WyP7Hhhs/Yw7R7GI44jPBvViKs9JVaBJbtO7RMVC2Nw5wWSZ0uzEE13A3radJMnaUeJu
         SkbpSrRjTWre87M40GYVF7Wp6siBMDWGF1ABIu07PWh6dtzaGRmRDrGfeWr9B3aRMpg8
         NT9fGro9SYCF4GNTpbQeRFSQ/9JyMDFeIGRg42GQQHCzM76rw2RvyOKHtav48aBi3dZy
         zA/fEJvZ25ad2SuQn1rgBHvDPlMMzFkl+yMakt/YLHzWyCH1sNZ+6EQkyo63N3pUJWs1
         dmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652241; x=1755257041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJMmlptoopG7uLnpNHx3BFeWdRFU3hEImM+p7yUrZvk=;
        b=DPusIq0Srd2Ty9wA5IGBg19r+4/7Dos5NbjvONtvlmy+DjBrC7fkGUOxbtD+0zyuMu
         YgGscjkDaB2YDNppXcftarR9ox/GDj6uwQByUPJ6auq5U8CvAuCSoWqpygFcbGYf0VxT
         j6o0jJVNundB6jFKbnOhJoUFobbZOa49+dgdciTPPa6bzJvP2p0tbSAysTf53TLU90Lm
         xiDFMwWMGyakq7JLSpfLEVvicbfjf1eQd6zFfQBB4VdA+xohrGkvXcxeRTc6zF/URWFK
         OtkbZNKMU6wXaeVvt5osJGDxk202Kd9A+js3kyZ1L+TC2nN63kGiMHTrg7+6Rz6u6wEd
         mokQ==
X-Gm-Message-State: AOJu0YwWhtQPsEyDq16oCPktfSASzbfzIv2aubm2m244/rJsK3hPMfST
	Rv2NSgAdV83nSIVCZ5++XO6NYrcr0YXipX3vjEVaGIPz7xIWMUpnqdZEpWd4lf4CqSk=
X-Gm-Gg: ASbGncsslcJd2hyKPEtQOf2mklc/Y0LoKjg3Cb/hBj7eEt7Ltp+GEkvINc4ZPPrn2T+
	C38BHlkHi6RIx25E5RAVqiCJuqLt7tSRInmTF52/R1yxknX+avhNoPQxL2B5JKv0yvUi+9Rkon7
	IoFP6oOKz+Qm+HcPQs3m/ESAoPDKLT/2nV9wvp6sYrVIVIHB/HTsfxPfhvdHg56KI+4eyKepho4
	4oUkGmLVCf79IsGn27FRrF1GuVyHpIOjeqecOGJjENTkAX1W9jykMK+cmhTThJ+nojmXY1CGzc7
	HIi2/9DFJ05wWRxtFJc0dYclRbQvLw5sNrZK1E6x8fftDPisUdXKhtb35OXR9HHZE1/iB2WcOHK
	OAxKrrciDHXnJQ18mzAMNIuWX7nYQVVc=
X-Google-Smtp-Source: AGHT+IHmVAPILAQt3jjnEVGZ95cvj/TwlhhBPdwWWqHVaKoukt+lAJlLJ0e2hot/FLFDTcAHZ+O1UQ==
X-Received: by 2002:a05:600c:468d:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-459f4f98174mr23235225e9.19.1754652241155;
        Fri, 08 Aug 2025 04:24:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:24:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:09 +0100
Subject: [PATCH v6 12/12] perf docs: arm-spe: Document new SPE filtering
 features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-12-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042402_720217_CAC0CCA1 
X-CRM114-Status: GOOD (  24.71  )
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

FEAT_SPE_EFT and FEAT_SPE_FDS etc have new user facing format attributes
so document them. Also document existing 'event_filter' bits that were
missing from the doc and the fact that latency values are stored in the
weight field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 9 deletions(-)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index 37afade4f1b2..c7d1032ff219 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -141,27 +141,65 @@ Config parameters
 These are placed between the // in the event and comma separated. For example '-e
 arm_spe/load_filter=1,min_latency=10/'
 
-  branch_filter=1     - collect branches only (PMSFCR.B)
-  event_filter=<mask> - filter on specific events (PMSEVFR) - see bitfield description below
+  event_filter=<mask> - logical AND filter on specific events (PMSEVFR) - see bitfield description below
+  inv_event_filter=<mask> - logical OR to filter out specific events (PMSNEVFR, FEAT_SPEv1p2) - see bitfield description below
   jitter=1            - use jitter to avoid resonance when sampling (PMSIRR.RND)
-  load_filter=1       - collect loads only (PMSFCR.LD)
   min_latency=<n>     - collect only samples with this latency or higher* (PMSLATFR)
   pa_enable=1         - collect physical address (as well as VA) of loads/stores (PMSCR.PA) - requires privilege
   pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
-  store_filter=1      - collect stores only (PMSFCR.ST)
   ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
   discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
+  data_src_filter=<mask> - mask to filter from 0-63 possible data sources (PMSDSFR, FEAT_SPE_FDS) - See 'Data source filtering'
 
 +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
 than only the execution latency.
 
-Only some events can be filtered on; these include:
-
-  bit 1     - instruction retired (i.e. omit speculative instructions)
+Only some events can be filtered on using 'event_filter' bits. The overall
+filter is the logical AND of these bits, for example if bits 3 and 5 are set
+only samples that have both 'L1D cache refill' AND 'TLB walk' are recorded. When
+FEAT_SPEv1p2 is implemented 'inv_event_filter' can also be used to exclude
+events that have any (OR) of the filter's bits set. For example setting bits 3
+and 5 in 'inv_event_filter' will exclude any events that are either L1D cache
+refill OR TLB walk. If the same bit is set in both filters it's UNPREDICTABLE
+whether the sample is included or excluded. Filter bits for both event_filter
+and inv_event_filter are:
+
+  bit 1     - Instruction retired (i.e. omit speculative instructions)
+  bit 2     - L1D access (FEAT_SPEv1p4)
   bit 3     - L1D refill
+  bit 4     - TLB access (FEAT_SPEv1p4)
   bit 5     - TLB refill
-  bit 7     - mispredict
-  bit 11    - misaligned access
+  bit 6     - Not taken event (FEAT_SPEv1p2)
+  bit 7     - Mispredict
+  bit 8     - Last level cache access (FEAT_SPEv1p4)
+  bit 9     - Last level cache miss (FEAT_SPEv1p4)
+  bit 10    - Remote access (FEAT_SPEv1p4)
+  bit 11    - Misaligned access (FEAT_SPEv1p1)
+  bit 12-15 - IMPLEMENTATION DEFINED events (when implemented)
+  bit 16    - Transaction (FEAT_TME)
+  bit 17    - Partial or empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 18    - Empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 19    - L2D access (FEAT_SPEv1p4)
+  bit 20    - L2D miss (FEAT_SPEv1p4)
+  bit 21    - Cache data modified (FEAT_SPEv1p4)
+  bit 22    - Recently fetched (FEAT_SPEv1p4)
+  bit 23    - Data snooped (FEAT_SPEv1p4)
+  bit 24    - Streaming SVE mode event (when FEAT_SPE_SME is implemented), or
+              IMPLEMENTATION DEFINED event 24 (when implemented, only versions
+              less than FEAT_SPEv1p4)
+  bit 25    - SMCU or external coprocessor operation event when FEAT_SPE_SME is
+              implemented, or IMPLEMENTATION DEFINED event 25 (when implemented,
+              only versions less than FEAT_SPEv1p4)
+  bit 26-31 - IMPLEMENTATION DEFINED events (only versions less than FEAT_SPEv1p4)
+  bit 48-63 - IMPLEMENTATION DEFINED events (when implemented)
+
+For IMPLEMENTATION DEFINED bits, refer to the CPU TRM if these bits are
+implemented.
+
+The driver will reject events if requested filter bits require unimplemented SPE
+versions, but will not reject filter bits for unimplemented IMPDEF bits or when
+their related feature is not present (e.g. SME). For example, if FEAT_SPEv1p2 is
+not implemented, filtering on "Not taken event" (bit 6) will be rejected.
 
 So to sample just retired instructions:
 
@@ -171,6 +209,31 @@ or just mispredicted branches:
 
   perf record -e arm_spe/event_filter=0x80/ -- ./mybench
 
+When set, the following filters can be used to select samples that match any of
+the operation types (OR filtering). If only one is set then only samples of that
+type are collected:
+
+  branch_filter=1     - Collect branches (PMSFCR.B)
+  load_filter=1       - Collect loads (PMSFCR.LD)
+  store_filter=1      - Collect stores (PMSFCR.ST)
+
+When extended filtering is supported (FEAT_SPE_EFT), SIMD and float
+pointer operations can also be selected:
+
+  simd_filter=1         - Collect SIMD loads, stores and operations (PMSFCR.SIMD)
+  float_filter=1        - Collect floating point loads, stores and operations (PMSFCR.FP)
+
+When extended filtering is supported (FEAT_SPE_EFT), operation type filters can
+be changed to AND using _mask fields. For example samples could be selected if
+they are store AND SIMD by setting 'store_filter=1,simd_filter=1,
+store_filter_mask=1,simd_filter_mask=1'. The new masks are as follows:
+
+  branch_filter_mask=1  - Change branch filter behavior from OR to AND (PMSFCR.Bm)
+  load_filter_mask=1    - Change load filter behavior from OR to AND (PMSFCR.LDm)
+  store_filter_mask=1   - Change store filter behavior from OR to AND (PMSFCR.STm)
+  simd_filter_mask=1    - Change SIMD filter behavior from OR to AND (PMSFCR.SIMDm)
+  float_filter_mask=1   - Change floating point filter behavior from OR to AND (PMSFCR.FPm)
+
 Viewing the data
 ~~~~~~~~~~~~~~~~~
 
@@ -204,6 +267,10 @@ Memory access details are also stored on the samples and this can be viewed with
 
   perf report --mem-mode
 
+The latency value from the SPE sample is stored in the 'weight' field of the
+Perf samples and can be displayed in Perf script and report outputs by enabling
+its display from the command line.
+
 Common errors
 ~~~~~~~~~~~~~
 
@@ -247,6 +314,25 @@ to minimize output. Then run perf stat:
   perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
   perf stat -e SAMPLE_FEED_LD
 
+Data source filtering
+~~~~~~~~~~~~~~~~~~~~~
+
+When FEAT_SPE_FDS is present, 'inv_data_src_filter' can be used as a mask to
+filter on a subset (0 - 63) of possible data source IDs. The full range of data
+sources is 0 - 65535 although these are unlikely to be used in practice. Data
+sources are IMPDEF so refer to the TRM for the mappings. Each bit N of the
+filter maps to data source N. The filter is an OR of all the bits, and the value
+provided inv_data_src_filter is inverted before writing to PMSDSFR_EL1 so that
+set bits exclude that data source and cleared bits include that data source.
+Therefore the default value of 0 is equivalent to no filtering (all data sources
+included).
+
+For example, to include only data sources 0 and 3, clear bits 0 and 3
+(0xFFFFFFFFFFFFFFF6)
+
+When 'inv_data_src_filter' is set to 0xFFFFFFFFFFFFFFFF, any samples with any
+data source set are excluded.
+
 SEE ALSO
 --------
 

-- 
2.34.1


