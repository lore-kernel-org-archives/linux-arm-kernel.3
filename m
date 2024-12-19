Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717B7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFdap/sOPpq0KBRuIbSWSowsNeRO1eLNOr+oanM3LgM=; b=4wXp8zdpc77mdQo5+R3Qc0fOk+
	I358I9UhDRaFk3Hr/CUwgI870BAycFEv81EWZ4aAmWJ6bXGOwjNYLV/Vi32lH8ksK2ypdoXu2XbKi
	xO8rUxgayhRVP0dxVvieA3qA9uv7PQH08sCuwXvkkqYdKO65+cWSD536xconOT+ajapEvZQwlfGOY
	trTWhUH5RwQze/fjhYuDWJKwZpQbR7TAY7rAVEpYP7K20Mx3H//JnRejsjUbgSsYpebQIjlFdXlvV
	l9dqpoFVObOXboJw3+phJ2H+5dUAFcK0W46zu68Nm9BQx8AhlavXzHallA84JzpdejvZwoc3cdv5n
	yn/lq3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONqM-000000037p5-3mcP;
	Thu, 19 Dec 2024 21:14:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONo9-000000037MB-1tpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 21:11:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so883716a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642705; x=1735247505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFdap/sOPpq0KBRuIbSWSowsNeRO1eLNOr+oanM3LgM=;
        b=OB6CnqKa1upniCCr1m6oXEuwyIfj1AIuy+00rdkfaijMjNxsjgQUPmAJSpbdUlpNFd
         x2DUqB/7KKsyx7V7fa/rGJW3W23S63Dzv/JxLj6M6H3i3yIee2e9HwDSHoWLmAurjf2y
         A0rOIVcR2ldSHnMKzUAD8aHsvY+LaoguDH3Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642705; x=1735247505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFdap/sOPpq0KBRuIbSWSowsNeRO1eLNOr+oanM3LgM=;
        b=X7dlb4JvJl0FOeCpg0eXejaRWPgkr+0eMRR/KCphxs286ctzw4b2PZ7FbAMn8WwxKp
         aAWAKK3kfp7/XGPHd1lIteurJprct8SO01qR53C+0z9Xu+MaSH2fGVHJM2dxdg7r5k8u
         VXxqrHtjaEEWsZDqgNtTPDuZ93q4YbUY0P7EdRe6+XW0NUcrlv4QCowuQS8cDhjq7xpL
         WvVlDuKfRVfGe913Xhs/yrWyec8ryP7ahyLZRS3fSdgbcGL8O0cpVoevnMLVGCXf5jqh
         bELPCS4y4LjSTYbqj7FMq6u+U5VXvAheitljxePbs+zy1gg1fARLEeVCE1jACdYXPFhM
         YowQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmlOkVY0hfGyCNbR18eC7QLvMEpxoYLDWeO0gYHhAeUEc87NnqL1jd47z3f6UdijSJHyRB92+LnpsRyvgMqsXZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzva6/QwBUglQuG1yDz7hmtapwb2RYoTl4y0co4clxErIgyNS1C
	81Aih5Fykbg/VHJAzHRx5M1dd2qsIEksdibShbKsbjZDI19Px2L+7PaFgvk5Og==
X-Gm-Gg: ASbGncvncvTGfsEhLkYNMTu3rRzfb+Prn/a0rUFc0aUtzJKfFjxR2n49vzdrWSKIsh3
	Ldq054lmH345/jMhGePhoZ9YQhDJ9wObl2BTOVSfbuDSuQazSAz/zdliZ3ghoa2mchZlsltKv3k
	O0sQFDmofBJFDDanjAgH+OLLeg+eA/5jHhLMuqWpHlFU5IfEWpcXBHLZHjo1wHVTyJSwMG4Sij8
	7xy3ORIRvk3iQCPXWhgdFeju8Ts1gufBm/tE+iGqK97gGvxSmC2WX7ijOfhnz18ZzH36wefFbBY
X-Google-Smtp-Source: AGHT+IGGlFCtPFGDg3TdCtB0hxPFvr8OnZ5HyqWHMKdJ0cGGUX0g5v4rfCRR8thJne3bzlkoFYIN3w==
X-Received: by 2002:a17:90b:2652:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f452f01cd4mr699326a91.33.1734642704943;
        Thu, 19 Dec 2024 13:11:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:44 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Thu, 19 Dec 2024 13:11:09 -0800
Message-ID: <20241219131107.v3.1.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_131145_494155_7EFD4C5C 
X-CRM114-Status: UNSURE (   9.92  )
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

Add a definition for the Qualcomm Kryo 300-series Gold cores.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e751349..c8058f91a5bd 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -119,6 +119,7 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
 #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
@@ -195,6 +196,7 @@
 #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
 #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
+#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
-- 
2.47.1.613.gc27f4b7a9f-goog


