Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D7E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KrxwWdw54K0Yj+RKR+q5UWCVF10MxJgob7ZMKnFuvw=; b=4Av5Vo6/1So3HZmYIIHOSQpApE
	HwjKQTqkh/m7qoy7w9Zb2jrHJS90WAtxysBk5MKdJBEPUjnW+jrQoWX6Lxq4kfEl4qFrpxU4jCHKN
	qSfUbSTyUQAsPZVedH/J0NeG8uBKdO3oUQ/RD51XLRiH1ohw9EP4lm08x8bkU4pLXV8LX1nOBuIog
	yRNfWNnXnlNWRRIM9VruiEuf/3O0LkIofFc61HS/ArfaDIj8d45sjO3/fPNnW+WuW1rEBFfg7ackp
	LjKIMubT4K2E+FN2ayLoV9JpP8NSoTDbmSsBk3DSpDSRXSCppw3tAN/3hYna5HwwScdGxLd9DRhTr
	UQinPlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFuS-00000006D43-2E0k;
	Tue, 07 Jan 2025 20:10:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFs3-00000006CQs-08HS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216728b1836so215819035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280490; x=1736885290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KrxwWdw54K0Yj+RKR+q5UWCVF10MxJgob7ZMKnFuvw=;
        b=X2vdvdZI4As24Zf+ALaWAQSefA3HY9tnfkF+3ItpeqKG5J0oV1vloypLvYND99IfFU
         BDNJhoiaX9O6pRIhpS4K//5EHRclwqpBc41ZEZqUDYH+0vqVbi+YxtxxMdl9XwpwCZh1
         fTqO8qCdhQzauNihNeqNGQU3X7TcmLBzcKZA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280490; x=1736885290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KrxwWdw54K0Yj+RKR+q5UWCVF10MxJgob7ZMKnFuvw=;
        b=EPGxRd8OSnC3b1zjIDjM/LHZmkIYEbcGj7nrb6zIHSpTngCZ6Lz5E8PmwCWijvcbxl
         iWrWmANfQ/jlBPLV2WEwXTZOtgpEDRtUXPTMkxiil2bZBwI8JXxnW4CuucYgt6CP2n9r
         2Rkz/UOhSSyZ8Gady/etoMLKPvU7v1k1dBQhpCsSSpvwwem4bsfj2s3kBXjqn0fn/vsS
         JMCrUA6rZ5yJ++15MNJEpl1DhSzqkbR3eN/ujIA4gJ2TPohJ0xwmEELY7HshMcBc/u5q
         w35AAkgLcfjiZxHvzAqLvXXJpnLfZnDt62sRyYGbEBS9R+A0RihT57OMqmYhn5b74gdZ
         C/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGxGGmRl1LcUtd2m+s7xk+IfJIc3kxJDK9poUQWvswFjQUMvMFnUmZZaIcfeOqTvFhCGp0tt9MWU298UgTvYV+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6XHSm11R6mptycXA0JckpGonx6fug59RWRwGo+GyzNfD5X/rP
	ewI+XbQMV8+sHypqgO1UybUM1MC5DjIgKu9pSyNeIj6tsHaoG7jEJYVornN88g==
X-Gm-Gg: ASbGnctEEqjBCLgLBBaJ74w7YAYdbTexl1WH+MxgrLPzyzmQBG6UzmK8e51l1Qu0xa3
	bzrvgHk9EOm99a4wo/rmO9yPHiVOedUNlRMEtwje6uPKalyGttFX1ybcRbCrxSv1L3rBSZrbvAG
	w2IKOw2VuQT/IYFQBFK/8rP8EV8iT8yuHVKJUrveNysmrD255iq0vzsIxKFQGYH+rUTol8trPNZ
	KIAMrFZiygazSx2xfnv2kz1PURN/7wZqH1xrCGLMn1o+5U8t+2UKzYHxX6A2I8l3E9AT2HlTkxx
X-Google-Smtp-Source: AGHT+IGlYlv+o4b4M4lfyay2yfIQhWPrIig5AxGmXyZ7/rDfeJh96vHrE9iSzFs341VZqJN1Vu/LmA==
X-Received: by 2002:a17:902:d48b:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-21a83f5510emr4528055ad.18.1736280489913;
        Tue, 07 Jan 2025 12:08:09 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:09 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
Date: Tue,  7 Jan 2025 12:05:58 -0800
Message-ID: <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120811_067147_42212DF2 
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

Qualcomm Kryo 400-series Gold cores have a derivative of an ARM Cortex
A76 in them. Since A76 needs Spectre mitigation via looping then the
Kyro 400-series Gold cores also need Spectre mitigation via looping.

Qualcomm has confirmed that the proper "k" value for Kryo 400-series
Gold cores is 24.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Cc: Scott Bauer <sbauer@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.

Changes in v3:
- Removed QCOM_KRYO_4XX_GOLD k24 patch.

Changes in v2:
- Slight change to wording and notes of KRYO_4XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..e149efadff20 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.1.613.gc27f4b7a9f-goog


