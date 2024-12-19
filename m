Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D327CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nYPl8ByRqy7GQGlWB5bDU6INvfmgU7gSd26B40zOKE=; b=Wau6+gRbW12mp9kIFX3BR6EUVY
	RVu5cqTO+9mIuqbKmtxOC29eFJKFOX4YLlZKzs+5qsTWKNvG/yy0yfu4K27LObO0SoUX4fbsn1BmA
	wwj8VRtX3eeFAw1aX41vSCjNU82bySpBEqy/9VrBz0Kzpvgnv3HJdwFwnR/JG6JlPrWhmt5XJC2yL
	NKu6QPs8uTsgTF3txAM2lkE+kx/5JqAvadMeJTTG2ciPVlvwT6wL40xCtDq2JXSPb355aIYZ6FUVw
	7YYwYfvTjVXX9G7n4OrgQenuURkg3PjMpF8MvPJRiZTJyop7EnHnTuK9DW8YkWi3sP8yRu8Yw+uR/
	G6qtNWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONbi-000000035p3-48qG;
	Thu, 19 Dec 2024 20:58:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONXm-000000035Ip-3yxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:54:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f44353649aso930313a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641690; x=1735246490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nYPl8ByRqy7GQGlWB5bDU6INvfmgU7gSd26B40zOKE=;
        b=GhPr6oiWMiSRmWko4Qv2aR+xmbAH+hp2nb9RnWY4F7bKZvyK9GtJCYVLi6NifswyMv
         0KnWL2/1j9eC5E7xdrknvJo0Oyi7yIBrlci/CHu+zlTigdbEKujAJlFFNx994GjCvhWD
         TcT0A1UCIV7xhI/OajcJyiKPKJtkoDvusLIUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641690; x=1735246490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nYPl8ByRqy7GQGlWB5bDU6INvfmgU7gSd26B40zOKE=;
        b=tYi5Vpp0+Pz3NnZxFFUXLTMqv31j+W4yWxTCllrmb3VuxHheiqhmHdsZ24YvkyXyCo
         PQo0SrMbCwsEj7p98Yyd9xrGvoypFzdTHueVBLvr0Kf1tzh+S5EWYDnSS84XY9Yi2Ehn
         KfXDmlLBr6SIuvF/2/V6zeJp2bp8IBh1JfRzHni2SA7XzO3B66E5pJMRUsAfK135SB3z
         0zEUKvTxErcruTbjfEtY+xNmwuynVp+VsNAxw5snyEBiLA73mEbTbgYQCXeJuApZxN8p
         YVem7Ivr+KiNlPhZXM+etjqUCWh7vZtKp4qVtmkmWdUy2/3lK5hZMXpPv8ze7vnjY/gG
         MZbw==
X-Forwarded-Encrypted: i=1; AJvYcCVN+VdqKsO5uHT6tsqXzKBPjlVAW38pY8qPBED0D1G/x/xcDtNFCu2CSnnWLBohJKvQRNG08SbTWWMWJrmDbRH+@lists.infradead.org
X-Gm-Message-State: AOJu0YxpuAg/F1du+1uLJ1sXGVQ7VXogWIowzm7GNdBu/dgnar4XRloI
	1FYsQ7ewhb4srzz6DpZaiGb/evR5BoCdbvyXpcpF2C+k3eXjR3I+MU+inf876Q==
X-Gm-Gg: ASbGnctXyEsB1pQfD/MIqfUDaPAGmISyuVTVTrIroMmNOcbQhYRdQLCpQS/SSYDtTI2
	psIzISWaU7JMcqbQOImJxECClCWvt+h/Ta2edteG2hMbotn76/dCi3lT5JTOmAZFOSIgVw3R9P9
	/2GjFREUmWb3tAzPgdPXbCAVelqVlzUiHqEuCL4SmmtmjgSVrE+pmDQeskx235zKV76MJfRetHR
	lM/Wewt/fQxlR6CO5uoS5mAmyicfN94mSP68jHgjoflJrxx7FNXaT9phfh41X/sXNy0Wa5wFYLC
X-Google-Smtp-Source: AGHT+IHwccOicX14rSFcDOJXBtww/CDCMLgDGO2mkaPlpWN8gXB9LCHU0FnM7zfKAT8dE4Ug4VhHdQ==
X-Received: by 2002:a17:90b:5487:b0:2ee:f653:9f8e with SMTP id 98e67ed59e1d1-2f452eeda4dmr637078a91.35.1734641689761;
        Thu, 19 Dec 2024 12:54:49 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:49 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: cputype: Add MIDR_CORTEX_A76AE
Date: Thu, 19 Dec 2024 12:53:22 -0800
Message-ID: <20241219125317.v3.2.I151f3b7ee323bcc3082179b8c60c3cd03308aa94@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219205426.2275508-1-dianders@chromium.org>
References: <20241219205426.2275508-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_125451_000212_79A5FA7F 
X-CRM114-Status: GOOD (  10.03  )
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

From the TRM, MIDR_CORTEX_A76AE has a partnum of 0xDOE and an
implementor of 0x41 (ARM). Add the values.


Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New

 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e751349..a345628fce51 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -75,6 +75,7 @@
 #define ARM_CPU_PART_CORTEX_A76		0xD0B
 #define ARM_CPU_PART_NEOVERSE_N1	0xD0C
 #define ARM_CPU_PART_CORTEX_A77		0xD0D
+#define ARM_CPU_PART_CORTEX_A76AE	0xD0E
 #define ARM_CPU_PART_NEOVERSE_V1	0xD40
 #define ARM_CPU_PART_CORTEX_A78		0xD41
 #define ARM_CPU_PART_CORTEX_A78AE	0xD42
@@ -158,6 +159,7 @@
 #define MIDR_CORTEX_A76	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
 #define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
 #define MIDR_CORTEX_A77	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A77)
+#define MIDR_CORTEX_A76AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76AE)
 #define MIDR_NEOVERSE_V1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V1)
 #define MIDR_CORTEX_A78	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78)
 #define MIDR_CORTEX_A78AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78AE)
-- 
2.47.1.613.gc27f4b7a9f-goog


