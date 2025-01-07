Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C6AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7JIcKoOn+aj6A6FGmZdKgBjeiVX3ZBuDhppF1K0+s8=; b=wz2iHm8CpE4iFQDQg2TjftaMfC
	ccUusIvOKwcaKcYtCvuXp9oYfN+IwjyHLoP/ogsZjjp1QW/jkU3SqTm7AY77J7XVqnKPkTKamRbM1
	ycWF4ZGxRJ2leGm5pHfwTaBOMUGwN/DlsF5AcmnFSL9OuWjBNvuioUuV/hDtJ1IKglkH4UIN3e63U
	2EG0cSGqAj8jLpPWhEEvOYD7jOLVuPhmneZDgQqtFd1JMjqijNb/5DoDjKdQR7YXOU6822aHPfuDJ
	SE4IHxFxnXPFw9XN/Wm2tsPItprt2bjYqxCZszMBPO8Kb2Jaq/j3ANvUFmzEjwsi72jO1G9n4MFFw
	z1OaYjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFwm-00000006DLr-3ShQ;
	Tue, 07 Jan 2025 20:13:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFs7-00000006CSe-0cza
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2167141dfa1so2658175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280494; x=1736885294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7JIcKoOn+aj6A6FGmZdKgBjeiVX3ZBuDhppF1K0+s8=;
        b=L3F7onW08RhT7drv/Mrs/vVemHwV0PpXpTYjGGFWmDx6XwPQmS1PgQUc6nh4BMOOT1
         4VfbWqDcWG3LkGMbehi1qifKwQ4iYdPR+cJq2wU7HB9vWUzEGUQv8reofZtT4iTHHzwN
         D2dRO8Dvr061t4gElpKarAnoQKmCmSBtopoak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280494; x=1736885294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7JIcKoOn+aj6A6FGmZdKgBjeiVX3ZBuDhppF1K0+s8=;
        b=a+4cQGMKeWXCBTiErdcYw88zwyJYsD4b0uqIJ9p7d6VTdwa0Jc4TLuytTGxFWw1oAb
         7fi3I50LcDIlhHu/Q8KsJz4NH/uEvFE8ye+0960vFLzJrPacpc8v8M2lTFHPNvSSUezX
         +I1h4RdKOo93HheNEbOn8m3nCwBIEopxPU2aPSRfPa7VoNJ3U6I1/IYc7Gbgkn2OjmQ4
         vSeY2gyS62DAQFE2zrgu6wzMLH2+wVrqlkBZ+fbavF3Wd/hP+ds4K57Sj379KZc6VZ/H
         PhBuwSdlnlufiepFOUKMzkxcsx+61LOVGcPvISXg8s9PV/tMPICnRiuhpHSb8OI78FMB
         fyKg==
X-Forwarded-Encrypted: i=1; AJvYcCUIqzwzJ+OdTYvAR/vmh60DJp9Sisqo7t/WbWRKJ1Omglt4rhxv96LTk0NkRUcU40uFUMx/OO0mYIVjXSB/j+tW@lists.infradead.org
X-Gm-Message-State: AOJu0YySG9J9NRtMU+fMwRWaaxsc+/WqUYjZZo0H/TQi17xTpGWsniWv
	GXZQS8r+DamR0qaO/zQY7vdH34R71c1YFJxh+8E9HeC/oO7KDyWyJEJzb9nOew==
X-Gm-Gg: ASbGncs7OttsYq6Vicuu6j9yg6gDmGEirAhYowWVgXSlQYIhg4dANHy2xFf+YIYZ+iY
	xkwa03qjCa5D5GeOSe7UeVR92OZOy4/B38S74OhWHMXUK09bF0hOC1tD0DgImvK9BKdDP9v29dg
	pZgeSrci90nNHd5wmyQvC81tGOI4r3w6wF4yK31SaogO3C0m1QwL0OaBZvvfw5DIa618Egz1dCm
	+sZRzekfbk6NdUiATaGHxFhCUXg3VThDubXgj5fXBsB0DE3v6Fn4CRO1kwH/4uek9655nMPj79S
X-Google-Smtp-Source: AGHT+IFYwu/b5vkXAi4S+EzyiEJNxnfulDMZqRNb7srUjlr5I3jIs0W0BPEczm+Ttsn4js6vyxWAkQ==
X-Received: by 2002:a17:903:41c6:b0:215:758c:52e8 with SMTP id d9443c01a7336-21a83c148abmr5723375ad.12.1736280494447;
        Tue, 07 Jan 2025 12:08:14 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:13 -0800 (PST)
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
Subject: [PATCH v4 3/5] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
Date: Tue,  7 Jan 2025 12:06:00 -0800
Message-ID: <20250107120555.v4.3.Iab8dbfb5c9b1e143e7a29f410bce5f9525a0ba32@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120815_189960_3DF4CB20 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

Qualcomm has confirmed that, much like Cortex A53 and A55, KRYO
2XX/3XX/4XX silver cores are unaffected by Spectre BHB. Add them to
the safe list.


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Cc: Scott Bauer <sbauer@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Re-added KRYO 2XX/3XX/4XX silver patch after Qualcomm confirmed.

Changes in v3:
- Removed KRYO 2XX/3XX/4XX silver patch.

Changes in v2:
- New

 arch/arm64/kernel/proton-pack.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 17aa836fe46d..89405be53d8f 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -854,6 +854,9 @@ static bool is_spectre_bhb_safe(int scope)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
 		{},
 	};
 	static bool all_safe = true;
-- 
2.47.1.613.gc27f4b7a9f-goog


