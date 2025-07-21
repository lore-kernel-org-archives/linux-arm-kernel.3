Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CDBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=; b=3SY8d1QOQLFGi14UYvEKle+oVF
	vKd20ZUW5XeT9ibthUG0gQVwbbpK4HsS0xK3Zks4Oa2OyIdzcSBtD/Za/cYzf85VZIeGllprpgpz0
	tUQeLXUCFGxOnTAL5bTPFw4vkn3zt3nRaY9E1tJyRaYiqAzWUA6cmsKp0mw9ReOwcyQDyvsEmiNiX
	XbLLeXgOqNTlrPjLoVURfBjsMv56A0iJa0MASm7X3b4BFlRTHmEG/wWpfKUHw1p9xSEKBTodkEKUs
	RfDhLSVz6n/z66IYuPFnOath8FWNrLlF4abnf0AutAZs6ciS22z71+wFoVNXhkBTjj+aXWbPD30gm
	z8ok+Eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrve-000000000nk-1fEm;
	Mon, 21 Jul 2025 14:55:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq20-0000000HIbe-3T4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4555f89b236so42535795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102451; x=1753707251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=EDdqprhyytCqC3By+bJImMJ5eV4Q5lShDIEVunbr1a1r/9l5NI6FgHQVRzCzeb7C5v
         O9x/bNSlLBbrmmlmkQ7WPGysxE44Un1W6izZNrKenjkKObU9SR1Xki2ondvNqm5rECiQ
         pAsudBU7bscvYAwi7XziiDKqYzAYcr3yidTCXN8KEJAr5cmh8ylIROXmr30twdhvvi4G
         h4QDW4IACMHnOeE0x6xXWei3D50PPPAzzxpqv/1WUvvxzuNf5uvEpp4Zc+zajAZJ+C5k
         v6jVRO3HJXiwopRygJoDZwBilDbBCrx3L4+Iwxm6zBc+c6jyWuRlhzXsXvsyNnMMQbWV
         qw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102451; x=1753707251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=Mb3fl7vhz9U/7GV8kYpV85lGQioIcOkdefrqh1ILFVa7qYnalkLGD7RbhfWwpEwiw2
         z3m41UEUxRDCjedgbUkhkFHLoYVBrm1Dfq0frM9Llt7Saah5pyJfXHtG0PcFHpVcEHvv
         dJogo0AsrxTWB33FPcZGZkFIZxBLgRX8mNOwMPUL4ImeHINbaWRoSsmugdJLhujnAZKJ
         T84i3y7oyL+Y6K5drpfRyMOkjRAPeUq9DMGkMEora87QnGxvqeLjnBnFB4+43DPQepDB
         QTcts4f2dvXDmdij9Ud5espRsSn0LxQiC3xcv45+TRkgaWuE0sMrxbpBMSj/h5G7pFYQ
         NDQg==
X-Gm-Message-State: AOJu0Yx4zssgHDurnqOc6zFxPaJ8gGb0dWf8o6RXD1qL1VvijnonWG/6
	wQdRUYX0KuBMwFl2FYRvJBqL7Q754NMG1SgJHybNDkhQivJsQ7aeP+qfUiKsB6/53YQ=
X-Gm-Gg: ASbGncuakj+e9mENYHCYYm9ePMxr+JwauhRPGVyH1dWyScPfFoeyL//lon10AGEm5io
	VLJhzSHwDJIiRi5Wtbt0HDtq1NKvPELTuM8E8M7SiYAuhX1594IVw77jMuhZmsjDVMopmdzuxXF
	XMVmJi84/GawwyAfsYP/4Ite33ThqQzbuzY8Ca7Cf2CUcOmO2AAcS2MgYqDqrE2hPEPEnVSxFjA
	ORZ4Hq7MznYhuaZm85Sgmt4ERFOO6jRFvKXx43ZZAs4zvI8O0+Iq2QkPLGTSKv/el3xo6LmRY1n
	+IaDxarlvNmKf/2XIspjcrmZpCISTiqSj3Xb7P/ZiYoa6yivfG3ph7E77sebyYipRvpRRgDa8R5
	uJ2Ya3Cku3OqebeYtJG7YbHK2OSNqKQ8U1TNH4FbQmw==
X-Google-Smtp-Source: AGHT+IEJhlbX9r690UiEzzeJ/Kdt8gvdkx0yoLLcBqhw5wdAqCeDmj5h8tFS/4SfvpSlDeFZRRIY/w==
X-Received: by 2002:a05:600c:a009:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-456389d8690mr124492795e9.27.1753102451282;
        Mon, 21 Jul 2025 05:54:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:32 +0100
Subject: [PATCH v4 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-1-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055412_868649_03D9832F 
X-CRM114-Status: GOOD (  11.39  )
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

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT

-- 
2.34.1


