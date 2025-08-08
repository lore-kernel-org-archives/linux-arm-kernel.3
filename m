Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D772C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=x+XefHIV9fQshErJaLvW2Bcjyu
	t5ydzJ9yNmadEZtefzBjpKjnpuMUBMSjYBzYk/YMz0mYXP31LyxARLAbb65WKPoo0qrlSkO+TKzfW
	Bf6Gz7Cn08ONLJhIrdqAXiBO6k5TPcbqLVsOhWq9y14PVVlSlk5R3d8kebKbJOow31Z4GMn2gQEOa
	8OS2Jj/6g1stZDkkqgei4rQN+FPMZj5tX2RG3rAZaJrKRQh6OrxUFJ3oJXhooRBHW373QunI9TR3B
	y1OBLVnv1VYjW7EzrNsF0mXVRdigOde/NLCzZ3YKwFz3Gvq+s0FZEzaT2SnqnXpTyAhNU2O2adzlI
	XzYxSq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLdL-00000002j2y-36Lf;
	Fri, 08 Aug 2025 11:51:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCa-00000002etg-03Hp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:24:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b77b8750acso1269806f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652238; x=1755257038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=GVuAcRKJBtTM1ddZselHeTCbiEScezKYjE14/GtJq7b9gm6bGXj+lfLp1L2nKGHQ6p
         nHTr7pYlLvTUSGfWWKkvIpT6QS0Kf8lmHRcjH9JYapzKombUkmA6asvq8kkr4ApMrEm+
         iorIGrsiUDs0D20QkG9ngraYEeaQETxLSEgP9BWHMp6pPAzaLhnWVKWAqi1Z4rgdgndZ
         TGtNt0RX2iTAx0l+VPN0DqeY6MgUmziJPgQ4cOMLXFpFFMEr9E0IoPlrttnzxokw6sVG
         GOqVyhQnZCs+Ei04qttx7SaDASRh/pPVgxmm3k22anA92S2N4LWULPZnD5wq0W0zv3s/
         Wvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652238; x=1755257038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=pf2Ls4moWfLTajbln96H0ysxQaDVhz0gR80hHXdozBWiU6+3tf2YRj3dxqRHLxD/xJ
         IZtoGKzJ3ee+OZOLOIWPnUjG1tp8+KAjiyecS6RsSqsdLRZOhD8Kvp+pJuCb7LEY/nC9
         GrCh07gecU3z3ReR/z3rWYAnmqWRURmUkwJO6/A+hOi4LO65a1agmyuXKnrQbr0WMPpp
         wfqIZCHPMYxRxU4WBw6zsvDPGedMKS3EZUSTBiYKY7j52qxUf8y4/EPuvpYfYfVKECxb
         JIePOfCsYMJWQrNMZfB8fM5YiGLd+Nw4cYl/thSpwajUlYdruCHqn1Hd8mQ9ez49XISD
         b/aw==
X-Gm-Message-State: AOJu0Yy48oS1isFImyS/P339uHM9OhjrmztIaysJsarr5u7XpkZ7Uf0w
	FNAfxW9YZ+Db9I7MQukRoxLe1HEPz9m4VtC2YkSdLulFENxF8WG6eBmbsNhULk5tKig=
X-Gm-Gg: ASbGncvXnsJ6gh2JyrxDty0bX9devui803SB+tWS4yXGHFFK3T9tJaiX9vH/JcYu1+C
	MjZ+PU6D6G3DveF87lLpuJ+KA/CoeXWDBuvVHbK0WVZO7RmehiaqBUQorP+/bFGd+sTxhpAjvaf
	Sl61Nyms0Yi0SgrNlPpyTWMir5EGvDRVAjgXum7aSFvD9fdAwGrL104wRy3NkFyFa2Q109G+jVl
	WZc89P+JiLLrHb9Y3KpKjyN54QzhPp0WRcpZPKBBh+237i1atRyIVz/tCrvLoo6L8FgTGp6mM2U
	ZCr0GK1O9IXKLWUNL8eKNscJl/STN/dKFI38NuuXLuGHVQZwA937DDp8AOn/ExRRf+szf2kpaAr
	3345o1yCWlvQRHC7tFzmF5O1o1taXAIU=
X-Google-Smtp-Source: AGHT+IGoaBQKmBj6KMNMQL0VdWvV/9kYUe2OiKjmu5rnVVRKChL318TYjODlxCnVcHM6lZ386h3kaQ==
X-Received: by 2002:a05:6000:4383:b0:3b6:d0d:79c1 with SMTP id ffacd0b85a97d-3b8f97c49afmr6128407f8f.10.1754652238270;
        Fri, 08 Aug 2025 04:23:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:07 +0100
Subject: [PATCH v6 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-10-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042400_052246_772A2027 
X-CRM114-Status: GOOD (  12.35  )
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


