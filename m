Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E6DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s4l03z+TiOWmT76Ozzx8G2m2dVtHZ3dYvzPccSMcPU=; b=qklKZrTkGK/v/8rAt//K68DYpZ
	O5dmASF2mJiK33ccNDrGxzM96zVK+VbHkEcyBcLurYzMdyRGhR2qYf6NDZwc2teiOUxkpZ/k4Gp7O
	0s08aqcaBaate+NwH50ZI6WenoRxdokRv2rQ9YI1nUwhtMRsxJBbSXg0Gt3lMI1nRyu2mBQpljBI7
	3wKYI2ibfYOaWy4DRnwcpdw6J4uvDtf25K/s27hCJTsUd9QlLYIRvy1ayzC9txM5cMVUxC/8HpSP0
	q9gGYxAEQRGTRp7xNp8M1qD/sBCeQQewmqDpA1zXc/aTuahdfkHg0Sk+ftTMhU0lbJJ5SJ2JO2YNl
	w/8cqX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONcq-00000003613-2a6h;
	Thu, 19 Dec 2024 21:00:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONXq-000000035Ju-31pi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:54:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2161eb95317so12024955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641693; x=1735246493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s4l03z+TiOWmT76Ozzx8G2m2dVtHZ3dYvzPccSMcPU=;
        b=P6WVQNdbGaXPA/+3NNx/xKKk27ZuhBJHBL0scl0elDnxEjiiATwhHEkTaL42fQyDXP
         AUpFcLMEIgyN/sf+Y1eDLeTxpdejOg6c93DQvP0CVyNjrPNgXOhGYRrxnAzsp81JJRQ9
         /RbBoCG+eDdInE3jZejjJ6iOEuKTMBfPRaY5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641693; x=1735246493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6s4l03z+TiOWmT76Ozzx8G2m2dVtHZ3dYvzPccSMcPU=;
        b=l9IDUHH1VD+RLew1hSAK/BrB4Kz4sLo/7N83dGrXa845SyB4zZv0iqj7gXZZnmTZyf
         GdlAFFXIhZ6hBEfap1K6EDS703ildRTNqCU/QYe+g/l/AudlJIRn3Tvz7ENCzFjyNfTN
         AU6v52i7IOTRXCPuXQk1huAQOwzLWmIzywsJI6M65xaOnZLJcWstTR/8V3YHjE99rRRI
         462LosF1tGQFCMa7KuwKmD9GMsFNS5OrS5+q5AIX5hQi7hDED8Kfmg9uGVuozoydutdl
         6Fw5ngQXPQxySS/wjvvELfSSZq4S1HoaEK7SrQEkmr1SbRtSruwBg4jEf/SaIKSuNIeF
         X0yg==
X-Forwarded-Encrypted: i=1; AJvYcCWpm7A0SJKDDxZHk3DDhg2SxEW/6oRlgie7aTp1KBcXs+OFNZfMPpvOaur5lbxnJOO36BqO9NeRA0Kvr+1BJAPH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfcf6fIdqzqeY9kCxl8ihy72MZHQKQgbFULVnlNOdhok8z084Z
	0MRmY847QN9jKDnTI6nqmxxEfuCe3i4/BeMDXgFrM+Flc3gK9YrM3kKYsyn0wP85kiEdTOdS1Ez
	guno9
X-Gm-Gg: ASbGncu8bcQbou5JMNvdjTNrB4bPuaTm/2GcFr/89zqOysnzNKaofbsYbyR/qAtbdxt
	3SOJnCqP7FeCXN/0KUzTTcCvcibpYsO0vG9vCpesIirSLE90H/NVJfGqcG5E9C0JFToRWR+Wd8K
	VfKLI0hbHHofEftw3chGoYVvvLSbsTO27RioSx0Zh8duNFKkpcRVM8DYJFNVegjaj4WZAAMN2iK
	vKT0yYLstFTcM8WE/gZ3n2247U16xGIuaU78sLhvbI0kwBM26WxzqqqfLw8Shii3twpAwceSnPb
X-Google-Smtp-Source: AGHT+IEaD6/NCBxxxfKhVW+SQ2XuBT1Btw2c/4loiQPU6dq3AxKc2urxpDuKIcZdFcK3IchhrLacVA==
X-Received: by 2002:a17:90b:134b:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f452e4d0e5mr545837a91.22.1734641692063;
        Thu, 19 Dec 2024 12:54:52 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
Date: Thu, 19 Dec 2024 12:53:23 -0800
Message-ID: <20241219125317.v3.3.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219205426.2275508-1-dianders@chromium.org>
References: <20241219205426.2275508-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_125454_764353_2140BF25 
X-CRM114-Status: GOOD (  14.64  )
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

When comparing to the ARM list [1], it appears that several ARM cores
were missing from the lists in spectre_bhb_loop_affected(). Add them.

NOTE: for some of these cores it may not matter since other ways of
clearing the BHB may be used (like the CLRBHB instruction or ECBHB),
but it still seems good to have all the info from ARM's whitepaper
included.

[1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New

 arch/arm64/kernel/proton-pack.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 06e04c9e6480..86d67f5a5a72 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -872,6 +872,14 @@ static u8 spectre_bhb_loop_affected(void)
 {
 	u8 k = 0;
 
+	static const struct midr_range spectre_bhb_k132_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	};
+	static const struct midr_range spectre_bhb_k38_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	};
 	static const struct midr_range spectre_bhb_k32_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
@@ -885,6 +893,7 @@ static u8 spectre_bhb_loop_affected(void)
 	};
 	static const struct midr_range spectre_bhb_k24_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 		{},
@@ -899,7 +908,11 @@ static u8 spectre_bhb_loop_affected(void)
 		{},
 	};
 
-	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k132_list))
+		k = 132;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k38_list))
+		k = 38;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
 		k = 32;
 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
 		k = 24;
-- 
2.47.1.613.gc27f4b7a9f-goog


