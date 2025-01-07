Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C3BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+J3uEvrodRrvpIjWWGDgko7jtoYydXF7C2qPRbL5eTY=; b=4H+HUySOxzP2z9AsPXPebJzlJT
	a2xbtbEj9t31anyrS2kgKeKKkPW6IE7WdjcmIkmBclJ+os4vc2UUjjHN9dXILoxYJEY8ZgEmSFCSJ
	Cb+R+oxUC4d708Kj89ih57Tdb20MjA255BYP6J49eQlTs3nihWyK1l+B3vxD88ZWNXzR8Lxuffts8
	mt3+DvqBRScU/TwRdETuGtLN8emh79NhjnaqdbDceRPIDSbZ/QZUt8sMzjHKuCOfSzO1ubUkV8/36
	y/RzuDwrjDUKS+a/qSqN6JWahl1FfY4nooHyONlH1PKzbMZpKIdjpk6HIGM/YmPMuDMl/gCEz/jsz
	6tGTZybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFxx-00000006DcI-1rfb;
	Tue, 07 Jan 2025 20:14:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFs9-00000006CTJ-2B6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2167141dfa1so2658825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280497; x=1736885297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J3uEvrodRrvpIjWWGDgko7jtoYydXF7C2qPRbL5eTY=;
        b=guVQSlKjeE1WjDhS4VGzYTzqohgmdXlGKwodziW+IQoetdvt0lOR4dwPRR+Zl5aK7F
         3Cm+tELKXvrtuV/5MyyKR+WBpMwSB6PmJDPHpzsdwQ47Y7YRmhZT7wFPUERfqu9mznFw
         j41IDoozbYNOPBJNZkjmEg4gnkBldfaY6w7Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280497; x=1736885297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J3uEvrodRrvpIjWWGDgko7jtoYydXF7C2qPRbL5eTY=;
        b=kiK6W46iOa7c2qu6rH2Ip/0PLtG95veRZTYKEM58RDyweCx0jWLVnHTf+/Fm/y7jEw
         PJCQok7AIspeUsknBYxtiov6qKJkg7U3f1zoygH4k4N4/RawLRrlSFljA6VYdD//Udxj
         dgQ3ZMHEA5+5nMwsxqUXqZ5ZWE01073LUmm/UunQzpdWGWYoWjHXkJYpdyJtYhr49AiE
         zfIFF6XyKQXM0vgMP8mGc0QDpaCgUE0MaRBgHRa2fbmYAOY7PzAwmLfQwyAFZaqgFcRc
         SfsMH9sPHgxK1xLAeeDdvaaOPzCvR2NZ/CA4OkeXILeeW4QZxnMVqfeuSVDyKftC95WI
         nasA==
X-Forwarded-Encrypted: i=1; AJvYcCUUo3dbscAQWJzxzQHy3VFI3hUSCWkjXbYgnCln2UyZOGfceFd8zLwzzcZI4FL8Lde8JF9y2GdPhnrs7BMXZTjN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1ppatcvib36ycAc0JxjjZOYWGz0WRhvM97EBxPcyb4RFoL3m
	XJxIeq9v7zDKlu8F8qiCIrGZCvixIDkBm2zLfILmjdgFOPM0WJMK16IY8d+AhA==
X-Gm-Gg: ASbGnctjZtfOsAhEzoxv4erby8N6caPTfJhzoxqUWYLtFiOI4qLjkFFbjDCwEbakNpZ
	QRRdNLT3ybVhtYxMt0V9r5tRi30hhV96J9NQUqH8SRuo9bTAccuok1KuTtc55wbbTXWsb+kHuvP
	gv7YU7q+oYMEXXqAVwcfBbgwtK19tNyBrgxyRJLoB+MO+X9Nt+F3yHyPuGULIRn+E//BuleEB+b
	kJ6RQ/GC/kKIkdWf0I8WIEwyW3w0jcdR1aLq3e11AOuGfs/ptAXbTAfv6ggs5rMRa3P0Gg1zm0a
X-Google-Smtp-Source: AGHT+IERsInGKvMTJwDEekT7zUQ/SqNr1OWxECv7WnReZ50o5l0ZIy479qmOPxldyGbLGh45fTS6jg==
X-Received: by 2002:a17:902:da85:b0:216:4676:dfb5 with SMTP id d9443c01a7336-21a83c721c1mr6200665ad.21.1736280496985;
        Tue, 07 Jan 2025 12:08:16 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:16 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] arm64: cputype: Add MIDR_CORTEX_A76AE
Date: Tue,  7 Jan 2025 12:06:01 -0800
Message-ID: <20250107120555.v4.4.I151f3b7ee323bcc3082179b8c60c3cd03308aa94@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120817_554174_E8AB7B07 
X-CRM114-Status: GOOD (  11.21  )
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


Cc: stable@vger.kernel.org # dependency of the next fix in the series
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

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


