Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3A5CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FEvn+Gbfb0UDIIFxIedzzNWMkkwAYLkahWLt3v36TAg=; b=MoGCFd9dfcsKbMy1+6AQ0jFO8u
	az2mFmVSU/EmPS3pQXm8NoesyWe+68qlUjhmzaAbVLE2zYl/ZOhOQYrF+6qdnZokEelX0Dn0ZHe0Q
	v/Hy08JVISS/S75ONYoYWE/EZ8m1V3wLyKK2qAUW4svfrX1EZKclrurGsGjU5uO8Tfg7F8+X6gG0o
	CSEKygvfSaNwsyZl8Fb14Gj4DKNwdv4nCUDjMv/hXpWR8SmlgVF7M+tCr2bOOlDhcw4+CtueKa8V8
	YUkLTZbOheyELRjR57zEpDthagMV35g2aWtCiU5St6pZr+bl+MZkqP88Od2h15LJoU+X0buIcxdy3
	3omcePcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnx-0000000425x-3Vdp;
	Sat, 23 Aug 2025 06:32:45 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTFC-00000002vEt-3OXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:59:55 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2e5d54bbso116808b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 07:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755874794; x=1756479594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEvn+Gbfb0UDIIFxIedzzNWMkkwAYLkahWLt3v36TAg=;
        b=AwUMiM6EBS690lV7AVs7sP7vuO7d2OrXXowdM3GDrxnf+P0r4zKyJhZbXDf228Y4zM
         9PvEEWxrKCRZJLBUQDpluQA31/8+qSB8Fgh8IVhajfkZ1/NI86o8OzTkTI3hamcUbwDD
         x2wDz6lUEPVHVcle50sapV32inDJQIO6fpB1hMSRa6NuZpE9bcvee8ZLKji2dzdlMoNP
         kZvCVELQPu+fiGLQnSHEGLwcYl9KphV34RlaRJ82BeMVUzEbZeK4d1i1cJ3Z3LzGAElY
         uJtP46FsLf/lJqFC8f3C3az3djCqyXMKJ8i1BgxRb8ver9KIe+wQe6/j4nyV+mT9oVkm
         9YeA==
X-Forwarded-Encrypted: i=1; AJvYcCU4dWIGOhbW7gaVXgqCF/E6Jzo5IQw23vOUfxKcPq3+gWX1BWZrb28Y703qY6w41j/AnfPK1X1g+/FE5rKJOJJh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8p3ttBl0HQyrwiIbp7DmRQm5lMPQsl9IoWfMwjJlbyJgGEnrN
	XFc0F5yuH0hQnr4CNblkSBD7FqdOXQ6Ksbed34GK7UOITN4Z80hSueOY
X-Gm-Gg: ASbGnctuzVBqcpmPNp8IReSjCQuwqHK8bPxXyPTCiZ8/UAh2u+ZdA3Txa6xHZI4vjpn
	QltVnT7FJ07JnkqMpUrPbsN9PLCSAhq+kKvQGb8vJSRfWbWVOZTTHr17cS3eVJNmf25l7HyK2Oh
	m9YPkn8ScLJUnqSM7T/JqIh8Nl76S3z9MCmg0sSpUEJdXB9HxAGskZyTppzdNyBayosaRY1pYlQ
	CBD6NfMbX6rRz9fQPLFNDgnYw/0vQSLqptdtNo8Ya0xkdN8+A/mna484ZKdhd9vanpIb/hJL0nX
	KRZI8AtUK4xJG0vNtAZ/eGt/o54GbZSxZFs2s5w03JEKeysvyJ3NPUJPzzn9HVttmDpYoA0od84
	etN/oOo21pTFnbvuRCwvFf5X6U9f8/I2OFGT4UouZ6X7/xElXiGxIh8N8hpiD6FPULP3GNuB3hQ
	g5
X-Google-Smtp-Source: AGHT+IEdY6GYMUDXUE6DhIkIlb1bJoH8Ip1ND56GcMjAbMwyaSQzX1SxHfEzJmSA3OVl515mt8xfPQ==
X-Received: by 2002:a05:6a00:391f:b0:730:87b2:e848 with SMTP id d2e1a72fcca58-7702fb0043emr2208518b3a.5.1755874793688;
        Fri, 22 Aug 2025 07:59:53 -0700 (PDT)
Received: from Mac ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffb477dsm184978b3a.17.2025.08.22.07.59.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 Aug 2025 07:59:53 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH v2] perf: arm64: Sync ESR_ELx_EC_* macros in arm64_exception_types.h with esr.h
Date: Fri, 22 Aug 2025 23:58:56 +0900
Message-ID: <20250822145855.53071-2-ysk@kzalloc.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_075954_842886_BDD962DF 
X-CRM114-Status: GOOD (  11.57  )
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

Update perf util arm64_exception_types.h to match the exception class
macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
consistency between perf tooling and the kernel header definitions for
ESR_ELx_EC_* values.

In v2, ESR_ELx_EC_OTHER and ESR_ELx_EC_GCS, which were missing in v1, were
included.

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 .../perf/arch/arm64/util/arm64_exception_types.h  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm64_exception_types.h b/tools/perf/arch/arm64/util/arm64_exception_types.h
index 27c981ebe401..bf827f19ace0 100644
--- a/tools/perf/arch/arm64/util/arm64_exception_types.h
+++ b/tools/perf/arch/arm64/util/arm64_exception_types.h
@@ -31,9 +31,10 @@
 #define ESR_ELx_EC_FP_ASIMD	(0x07)
 #define ESR_ELx_EC_CP10_ID	(0x08)	/* EL2 only */
 #define ESR_ELx_EC_PAC		(0x09)	/* EL2 and above */
-/* Unallocated EC: 0x0A - 0x0B */
+#define ESR_ELx_EC_OTHER	(0x0A)
+/* Unallocated EC: 0x0B */
 #define ESR_ELx_EC_CP14_64	(0x0C)
-/* Unallocated EC: 0x0d */
+#define ESR_ELx_EC_BTI		(0x0D)
 #define ESR_ELx_EC_ILL		(0x0E)
 /* Unallocated EC: 0x0F - 0x10 */
 #define ESR_ELx_EC_SVC32	(0x11)
@@ -46,7 +47,10 @@
 #define ESR_ELx_EC_SYS64	(0x18)
 #define ESR_ELx_EC_SVE		(0x19)
 #define ESR_ELx_EC_ERET		(0x1a)	/* EL2 only */
-/* Unallocated EC: 0x1b - 0x1E */
+/* Unallocated EC: 0x1B */
+#define ESR_ELx_EC_FPAC		(0x1C)	/* EL1 and above */
+#define ESR_ELx_EC_SME		(0x1D)
+/* Unallocated EC: 0x1E */
 #define ESR_ELx_EC_IMP_DEF	(0x1f)	/* EL3 only */
 #define ESR_ELx_EC_IABT_LOW	(0x20)
 #define ESR_ELx_EC_IABT_CUR	(0x21)
@@ -55,11 +59,12 @@
 #define ESR_ELx_EC_DABT_LOW	(0x24)
 #define ESR_ELx_EC_DABT_CUR	(0x25)
 #define ESR_ELx_EC_SP_ALIGN	(0x26)
-/* Unallocated EC: 0x27 */
+#define ESR_ELx_EC_MOPS		(0x27)
 #define ESR_ELx_EC_FP_EXC32	(0x28)
 /* Unallocated EC: 0x29 - 0x2B */
 #define ESR_ELx_EC_FP_EXC64	(0x2C)
-/* Unallocated EC: 0x2D - 0x2E */
+#define ESR_ELx_EC_GCS		(0x2D)
+/* Unallocated EC: 0x2E */
 #define ESR_ELx_EC_SERROR	(0x2F)
 #define ESR_ELx_EC_BREAKPT_LOW	(0x30)
 #define ESR_ELx_EC_BREAKPT_CUR	(0x31)
-- 
2.50.1


