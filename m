Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBCE77183
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lb40kxSySziI3vHFr8SIoDrNL6+Q2SvOcQax38nrL70=; b=Bl6wnPDFy+2mE11LrgpPVVZr4M
	h8GtfCYrF+Z7r0UrIuHahLkEvR97cy9P5TJNw+4q6wVjc24WE667GOjVE29WvCySJo2aj0lnMpSaa
	yyR+o3zeFxQ0VH29G9jm1kSNP2p/R3pn6yHaPQLQBams/BQB3OKlBON60zyZUK/Bl0viLpuOOBxBR
	iDilib1yz8STTZU8O6BdCcBMOQU95eq8g7bCJqRyOurg4KtXmcBpMEYJbytVHVZAelerVF3tchHnC
	rjfa+eU1X0SBYk3JlGIB2P4TFKIaQkbOQn3gF+SSDI0rbLRSGPYJtJDa9YIw8IgUNQMWpTCiR85yp
	0IYl0Kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGSH-00000005RNY-1voQ;
	Sat, 14 Dec 2024 00:56:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGP9-00000005QmC-2cnK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:12 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso1762942a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137591; x=1734742391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb40kxSySziI3vHFr8SIoDrNL6+Q2SvOcQax38nrL70=;
        b=fJJCN4JiEfru2OEWArdCaLR7HNsL8xBMDu3WTE36M8E7ONh6hrJESOazNydj7DVV6P
         qHK29xXPg7OSB3VLn9AVyKjgjYKDtdUiwc6KeDOJ8yue2TNX+NaORoHqbHzvgDOlK4Kj
         kA0OL2COfSqLlRCr6S2nukxgbiRQxP1GT0Ks0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137591; x=1734742391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb40kxSySziI3vHFr8SIoDrNL6+Q2SvOcQax38nrL70=;
        b=IM9qc9nqNfn0Si4Ze3OI3v4MehjAYAYy3wEbx7m9JCd3h7KXIiav566MtPbzOJQB1U
         zRP4xwrDcvc25pOOaYX/EIhh8ShTvIegoYIK6R3G4SGwznCztqbkPcLQ4ONRDmIBnsTa
         P8wBlyPAdpv/22YwoI3bACai8hajzOtqyreTWAEIuN7jC5E88iuGnRSjAvQOxmgK07U6
         4eDc7lDJVmp+Un1DN0fMTEIAqoH/GSQzyME3VXOrWUNVmvbdpfo/1KCv+mDA0tdJnIIl
         Ig80hjojdxXkjrHpyQw1PC3rzPb2QMpTlA9bMfsNVhXQreTuy2QmWhWLznpwSkOoaBlb
         UA7w==
X-Forwarded-Encrypted: i=1; AJvYcCWN9bzDkjsEU2cpmWOMRh/EtX1hAVQ78twIxCwD4nkvti109a6i5sIgDmOwl9gjDNfvTQ6a7Qg5tM9BAQInewQC@lists.infradead.org
X-Gm-Message-State: AOJu0YztoW41q/PBszuEt8Xq2uzx5b6Q5+YV8VPV2oFkX2b39T5/BAjD
	9TJPsyo+SKH2vKnA0XjyPk43STv4x90/iUW8z0TOnskK2KFnrPHLpPgmijH+1g==
X-Gm-Gg: ASbGncu0TMeP2ehuxImpdL+FyEDxSIkLlDPegt47XaN22UEa3Y03s37hVgiap6mXVL6
	+Li+AgxBYLDCkSiEPtFfOO7MZq9cZn8YhJhgauoSw/OqyxTFOA1OWVuiN8iv7VrUoQYZK4kQWh9
	G8HwSP6mktJv/bZxkdAGyNDUY6MhP6/dYFk2faaZcCTC12PAlTs9wzeJ1/4e1tvnQk67WATjs+K
	pf7Bnn8jb1Tyjw95e1ghHxQ/ucemKKymTJwpYwEvSQNSqQivNQ1mFQny7LcNaTObxEGY3T5S2gY
X-Google-Smtp-Source: AGHT+IHA02wdX7gbQpc2VM52GOd1+IrxDgEcszoQJP7VGIrV4tHzcaG0wjdjW5xSAzMH6mwnDjKcmA==
X-Received: by 2002:a17:90a:d450:b0:2ee:f687:6ad3 with SMTP id 98e67ed59e1d1-2f290d96c48mr6152633a91.28.1734137590982;
        Fri, 13 Dec 2024 16:53:10 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:10 -0800 (PST)
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
Subject: [PATCH v2 2/6] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre safe list
Date: Fri, 13 Dec 2024 16:52:03 -0800
Message-ID: <20241213165201.v2.2.Iab8dbfb5c9b1e143e7a29f410bce5f9525a0ba32@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165311_661213_53F273D2 
X-CRM114-Status: GOOD (  12.40  )
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

The 2XX cores appear to be based on ARM Cortex A53. The 3XX and 4XX
cores appear to be based on ARM Cortex A55. Both of those cores appear
to be "safe" from a Spectre point of view. While it would be nice to
get confirmation from Qualcomm, it seems hard to believe that they
made big enough changes to these cores to affect the Spectre BHB
vulnerability status. Add them to the safe list.


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 arch/arm64/kernel/proton-pack.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 39c5573c7527..012485b75019 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -851,6 +851,9 @@ static const struct midr_range spectre_bhb_safe_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
 	{},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


