Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8868E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUvE2f6iOzNwCrYNdrQY+FL/vDHn4ndwLWchPd2QhtQ=; b=0jkXOMdNIj56zY35Xf14QEDlmL
	XUSwAIXmJoyz/cSJXuDUViGr5QVI7Bw6pRZQUgaEKfEW2YP175qnfFQHPCeNusOwTf3D3vBHWZg4x
	RwBYpqWPC2sJJmYOBP/LX5Wa0SgOK7XahQLgzZsEaOdWdR/KsS7hUbewju9Ri77Hap80EKV5UURiP
	m9A2bVS/ySUv0ycQFUML7k8ynsE5BF4qp1vOVeekAQH7ZfJjl6dYA3+F3FNRDgCYvPmUK2DP77b7T
	WMZWC2xs4hdAfxVd5PmoxDEyZ/OHQb14w6xpuurfysDFAgrW/iygXn9lUeCrzqwWj+XVFyjHag+mC
	IqbNDeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGTL-00000005RdW-0Odq;
	Sat, 14 Dec 2024 00:57:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPC-00000005Qmc-0Udp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:15 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee6dd1dd5eso1774343a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137593; x=1734742393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUvE2f6iOzNwCrYNdrQY+FL/vDHn4ndwLWchPd2QhtQ=;
        b=FHkzAQonO8liPf1mdwtaUSTDgjKSVH/4MXewygjo/BcqiZc8yF+UC8v+C2VYKJtosy
         PiT5JCF1/OhNNkOOYDzp54XsIejSUVASAt75De04QQkxtx4arOZdxVmxLr1R9za+j76c
         tkise1r2K8AvQqjPklaEWgbyyNgBLfwIqQ0ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137593; x=1734742393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUvE2f6iOzNwCrYNdrQY+FL/vDHn4ndwLWchPd2QhtQ=;
        b=bXjPBEA4piBQF73FnCKRQDuRNjopLF4fWZm0lsQVvmjz11C9D2qbd6WBRUjl6WIeQR
         Q1VhXhHruVFHhxwXacbtQVv/kc7q2on64WGTf43eT1fitmWG9K9Et9PdqMcz1xWapwMm
         euHC5BDScrMImwZvK+x09YtEqvq1OMzOYl6NUERNaHcEZHdvF32rt8PMg5ZuHKgr0W4l
         gBiL7SeNG9GtbBFSF+Qk5i8Xddk925w38IcTLiA3U1PTM+/+VjH0e1dfAAZbfa2MRGYv
         ATAY25I1x9wnySoznLKWFw6+EFuiDX2+pXmnGPjw3t4vzrr1kDgbVGTjq4gTuyJejXqn
         mJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD7bHmbr9MarAChw71t1LsiL7UC2ShseP12KD1S+/bXGgeVVp9h1UyJ13JMA527SOXAjIdlR48WmK78IZxcQiO@lists.infradead.org
X-Gm-Message-State: AOJu0YyXvQF62lC1sMveHARlUmqaX4h1+Nk4SayUtLEcRkrbahGBXa/H
	jlpYSBtPAhyfb8qNeIM5H859IQPoKVs/joDmbmjoUzaKtjwmmc2dvnPQaSpGLg==
X-Gm-Gg: ASbGncuoeZRTDtpURZlzRHluIXVEBdz7kipysCsk4r816KSQNjVhLGEOFo49h8a06Su
	/4YKxYRRQyCLJipt5mut5OwD0Q7aC8oT7WwBk0WMZAHQvhEsbWGJBwMp7AtognzLisKSSgyyhDB
	SD/3LhVsqyr2TobqT7lrvqcGrJJI41AyLjHiS7SQJTeLSapSATLdoWq2uyZEm2P/Ev5tD9g4XIT
	lXCDHSD1BS/OSkHfn+0pK2fz7PjeGm/cCDZikq0kodvdBctc0n1YYfCq3AMOscLUNPauO8LDLRR
X-Google-Smtp-Source: AGHT+IGU2S6Z3GVHm0+57veKVF9GWyDASh7uUNfkbmZbC9Zjun4Gf1t3LPe02j8X69XemOFEZkD8aQ==
X-Received: by 2002:a17:90b:3c02:b0:2ee:c9d8:d01a with SMTP id 98e67ed59e1d1-2f28fb63bf1mr6635097a91.11.1734137593296;
        Fri, 13 Dec 2024 16:53:13 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:12 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
Date: Fri, 13 Dec 2024 16:52:04 -0800
Message-ID: <20241213165201.v2.3.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165314_154275_ACE0C03F 
X-CRM114-Status: GOOD (  15.24  )
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

Qualcomm Kryo 400-series Gold cores appear to have a derivative of an
ARM Cortex A76 in them. Since A76 needs Spectre mitigation via looping
then the Kyro 400-series Gold cores also should need Spectre
mitigation via looping.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The "k" value here really should come from analysis by Qualcomm, but
until we can get that analysis let's choose the same value as A76: 24.

Ideally someone from Qualcomm can confirm that this mitigation is
needed and confirm / provide the proper "k" value.

...or do people think that this should go in the k32 list to be
safe. At least adding it to the list of CPUs we don't warn about seems
like a good idea since it seems very unlikely that it needs a FW
mitigation when the A76 it's based on doesn't.

...or should we just drop this until Qualcomm tells us the right "k"
value here?

Changes in v2:
- Slight change to wording and notes of KRYO_4XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 012485b75019..04c3f0567999 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -887,6 +887,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.1.613.gc27f4b7a9f-goog


