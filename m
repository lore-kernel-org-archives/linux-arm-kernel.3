Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792BBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eb4Pwt+4DlcYTmjaI/seSD+b8VboyEm5UlMbHZ6SHow=; b=1L89xlMfYNPV9ZZDMJQXlEiEgV
	yGanJGQ2G3O2JkACvOfAAjeLWdD5SwCufANpO1aNBL49MgdMxAv01Yx8Euqz8RpYVWEU4ec1SPtmX
	PSdZwDyHk80nL3ceVQqoJ8KA0wXwqxh8WQq1f5qUpuFCuEfqS/i3OC4ORnL0MW0AoFie9n1KTGJhi
	7NoiSO5AyhOvufK/6f4qZWpm5105Qvubr3bQOp8kBxcZDoTAzSCo4aZ40MQPa4KsG9qIECCjl615f
	jSQag50fDsuhAWn1czilsN8VSSQhtbsWbidJkGRPwMlWIkmxP7dfYJqyA4zhLumEZNnyRzEQDToBF
	reAapLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma38-0000000HVIZ-28fv;
	Thu, 14 Aug 2025 15:39:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZgp-0000000HObP-1byI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 15:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Eb4Pwt+4DlcYTmjaI/seSD+b8VboyEm5UlMbHZ6SHow=; b=FWEtkwe+suxrXUU4RUjFa5DJz0
	p2SV435VDGWmvisYODcPwy68472WtJDCmc/97IvCHNqO94P9CUGif+yq0nSLUPDHCG8t/WsEAhMwS
	iHArsfxFtBTnC3JP0NN8ZtOm0zSwAqkRMb1IumJWA7bWfE4Zr6+B8Ce4vwZcY2cOhA+g+qU4ZU9aJ
	FwKNWt7dBvNjGZ8tb3jMY6TLWAqF9+E9D69dHGzvmr8G7Imw+QI9dn8TPPu4A7dveN19hrC3RDYCi
	AF9ftAmrHHe5Z+uj96URO9JBtOHbR7TvjFqj1K6Mn5yWDZbaD3rmqyAr19IgkuUOkxkTg/Kn3SHWz
	SQhqTnkw==;
Received: from mail-pg1-f179.google.com ([209.85.215.179])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZgm-0000000GSsE-0tbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:16:26 +0000
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b47174b335bso148692a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 08:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184582; x=1755789382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eb4Pwt+4DlcYTmjaI/seSD+b8VboyEm5UlMbHZ6SHow=;
        b=aDIZCe4vb2c4QiE2eFJkH8p17cPmh2hOVK6GEGgK6iK3svcAlGotxm2XUoA2p4rojm
         9KyDcgE32Z/3FjJwyOFNpG2hzj8VpVnakfs7DggRj34m//7BM6uVhGyz7AliGfC38nVe
         cIHD3Wi49Br5yJ+JYnB5ehAl31iZ9JZOI1UDSaxhR6nN9h7Nae6KPWFnY6RR2j1Khwku
         TqpYx40asZ72LCh4RBQuhvXlhgtHRx5sutNDiMHYUS/piZulxgx8E7KsXm9zG1+2snpu
         4+smOT7YbZGWQhWrAJHtRG2Zr+clXBh3LHIOWESI7RzUFl+PkxNGpCE2VcqzTrSiUZgn
         4pDA==
X-Forwarded-Encrypted: i=1; AJvYcCUcg7zjQ47fzAoJ0FWaST1RxNwOeLUEWmna8m/il97dgPKkrljgakuFE+q30TaZH1/7DOnejb+K1vZlm+8vFL2H@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnT7SGlLPdiY+7X+ST07r2C5N2IvNg8Fm4FFQ19McFIy6obYu
	uklkQ8lngFlQr67SICEl8otX2RkolZ1yyNxq0giF/ap3UArZkr4Q55/gL1oaSXWe
X-Gm-Gg: ASbGncsLdvphyvrjQxUctByez6MMf1PjNvkpl1FljNE6E/zmvE3buLaJkp2kLWzwBn0
	svOds7n3mv+zMWlJm3lK3EYMcXcIorGbaD8/Q3muha1yV6Zgd4hQAfOnlaZGbvMipio0Xx3F5CS
	qDyF1v+4mkeDLIwbywC30720C04JWom0lKbTnTwCOapLITpjW+knyp+HXshqwOfqzhAmOk7Wmg8
	pmtPMZUJwKtK/T8azDqD8n4J9AkD9baeTLqC4928CsShKDLQNNvcTRE/WUX6bnmSwzyifr3WtPj
	ZLST/HOE93yA3VRoSg0njrEaOssMx/6zSStNfZb7xYzUptL34VhldLRp0mS1la2mBVukbMjJNwD
	28XVxWacow1/5
X-Google-Smtp-Source: AGHT+IFYf6c65S+ueeahtRG3nAVnc+xop3PDlfgKrPzWTagW5Fh/Eu2n1Xz11DqEF3h51G44eb5chg==
X-Received: by 2002:a17:903:1c5:b0:240:8fd6:f798 with SMTP id d9443c01a7336-2445851909amr23360095ad.4.1755184581749;
        Thu, 14 Aug 2025 08:16:21 -0700 (PDT)
Received: from localhost ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2430040122bsm72357495ad.59.2025.08.14.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:16:21 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	"Arnaldo Carvalho de Melo" <acme@kernel.org>,
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
Subject: [PATCH] perf: arm64: Sync ESR_ELx_EC_* macros in arm64_exception_types.h with esr.h
Date: Thu, 14 Aug 2025 15:14:53 +0000
Message-ID: <20250814151452.618765-2-ysk@kzalloc.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161624_338630_02DE6DFE 
X-CRM114-Status: GOOD (  11.35  )
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

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 tools/perf/arch/arm64/util/arm64_exception_types.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm64_exception_types.h b/tools/perf/arch/arm64/util/arm64_exception_types.h
index 27c981ebe401..29931bf19062 100644
--- a/tools/perf/arch/arm64/util/arm64_exception_types.h
+++ b/tools/perf/arch/arm64/util/arm64_exception_types.h
@@ -33,7 +33,7 @@
 #define ESR_ELx_EC_PAC		(0x09)	/* EL2 and above */
 /* Unallocated EC: 0x0A - 0x0B */
 #define ESR_ELx_EC_CP14_64	(0x0C)
-/* Unallocated EC: 0x0d */
+#define ESR_ELx_EC_BTI		(0x0D)
 #define ESR_ELx_EC_ILL		(0x0E)
 /* Unallocated EC: 0x0F - 0x10 */
 #define ESR_ELx_EC_SVC32	(0x11)
@@ -46,7 +46,10 @@
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
@@ -55,7 +58,7 @@
 #define ESR_ELx_EC_DABT_LOW	(0x24)
 #define ESR_ELx_EC_DABT_CUR	(0x25)
 #define ESR_ELx_EC_SP_ALIGN	(0x26)
-/* Unallocated EC: 0x27 */
+#define ESR_ELx_EC_MOPS		(0x27)
 #define ESR_ELx_EC_FP_EXC32	(0x28)
 /* Unallocated EC: 0x29 - 0x2B */
 #define ESR_ELx_EC_FP_EXC64	(0x2C)
-- 
2.50.0


