Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F7BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrdqv5su9sKfrkNYXwk3VMWny97c1fSpv0cdthxhYIM=; b=cvxHBW1ZssY2JjBeVlC+c82Zy8
	8XyySfQBECS9IJnirJUWnsTkKduRitcaODl38WWjof/qpmg3cn2HTxfQt88OyvHkw06C/W7IIzW1t
	zLfb3K55sAKNwlyt7r8pzWi8G2B0JQoJmSyv16D0hH4eHwdKACE046eoYPlVQW3d1yEDG35udTHZA
	TXRc7TkL3EbFtQddFtS8w8COT1ZvQImMMEDCY7/gPKm+G0ddjwNiNYXRdcp2BgN/31+UJI1NnJrAT
	x1JqEvT+7es4lhqQkdPuPAegrUaBHW8BPD+YNRbH2jvsVGFejkH6WP+IE39lBdinznvmHmpk0dY9G
	csmYHLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGVQ-00000005Rqa-1Fvk;
	Sat, 14 Dec 2024 00:59:40 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPH-00000005QnR-0ZB6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so1435601a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137598; x=1734742398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrdqv5su9sKfrkNYXwk3VMWny97c1fSpv0cdthxhYIM=;
        b=PJu2Cfv//MyeOuzYMbPOdZViOIE9gkFleB46R3voKJaT+vwIQ8wZ9n2Au+BTLVCMmQ
         zbrgEp8lxnVqZs8kEGAkgNHCMeOm2yO9LTlcF3ZMA85c7VIYNNd11iBymu3XeNXKYv2q
         XhOzyIoYX8PX8QHjyV4+xi3xuMiaYEB9wa8rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137598; x=1734742398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrdqv5su9sKfrkNYXwk3VMWny97c1fSpv0cdthxhYIM=;
        b=JKGprhBE7QVbn0qa4PLlQV/MG5mSjXSuukft6CF/ixkjzxKXyx9IG1C/NLjVDr7rF9
         JJ9ViAS81CgYFjP9yRykr6ajJu88oCHUd0wf6PX1UO6I2HWJEH/AdNw00dk7h2NsQRRI
         NwYudXneRGRBBK6Z7fX5W9exoeL5WmK2Ohc7XOTxzI6q3Jq4AxXA6Brr8D4SdYTQHIXK
         yhPh+QSXw3Ub5Av8uuDYv/w1ZRHLptjCzermDqY3hh8739vto+O2Ujs8pGc1T9WnGZpi
         2OrQieBkcJ7v9m3PFZ2XBRnIudNuqzn03GhykYRB0muITVEDy+vTPTJsYgH5+99JRyIL
         RIXg==
X-Forwarded-Encrypted: i=1; AJvYcCXpIFnr8SXF0MFpOxU48PK1JnI7/nDqfFe/qdVmV9pafyesENsxBBTqpobmHOeRthZr052H/tJVxJKtEQzkOAK9@lists.infradead.org
X-Gm-Message-State: AOJu0YzCOmHd2vGojScq6zoh8BMzqFx1IEOdzmLjEJ2GvTeTeTycwFQv
	Vwb+/tfpqN4WPWuYAsAQ6GoBxAlOqhOD9JsKjbJisa207b1h/8MsxjvJyzxVkQ==
X-Gm-Gg: ASbGncuym0sChdsNJbhp9s+DXEQk5u7QWo/yYezdHM88qz5dHXby96z0nQosfUe2PY9
	EJ8Ksh0nof6I/wabPFohFjnYY2HD67zM3a4G249JeKBiPqfHqh5GyAyQ/dQIBJFiBgT50fpLH9a
	sTHnwWo++AaTj03FUgTslYl1QT/1TkL1HPxC68EjK9GzyrZABjQ4V/3Oprd+7o2nLrc/N1yD0Tb
	yj+MJ9lHHW+X/FPvQTZvE2APWR39yzdzIYzCZuzC2fRy1MWgx7vuQdGwbsSP6zuam88JmW45gXX
X-Google-Smtp-Source: AGHT+IHOcPfHNBrkQn6M2DPoYqrW9wGOVpvFmhjU4MB0966dHygCTCiPIakP//mkJvwDEs162n4ynA==
X-Received: by 2002:a17:90b:4b81:b0:2ee:b66d:6576 with SMTP id 98e67ed59e1d1-2f2901b3256mr7290054a91.30.1734137598295;
        Fri, 13 Dec 2024 16:53:18 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:17 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Fri, 13 Dec 2024 16:52:06 -0800
Message-ID: <20241213165201.v2.5.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165319_178355_AA2E7D7A 
X-CRM114-Status: UNSURE (   9.15  )
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

Cc: stable@vger.kernel.org
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


