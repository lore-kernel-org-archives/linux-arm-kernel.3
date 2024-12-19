Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5EEE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdqbLeOnG/CNjI8uFDgPDBupu1L0ikHkLJQEPoxLge8=; b=KfLOI6C94SVftlVCHYypCO+GyD
	m+BxgntpqQSMsqANqDHik+mcfbsgaVlkzgR5ycO+13cVj2L6Qun4j33+lUE4K8T75m4bxXOw/VlTy
	+z3dUSWTvYTTJEyk1UUMFIwg4+J66uZle8QBnolJvhYkkmx6q6sWjp0d4Dr/doRPqF9Lf5aa0yL60
	pBxB4kfWil3sAY/c3hHI2C1giiWYeHJsXIcZEBfZz0wNL48UkVWqNwkY1PJl6wOCz/JEKDAxX9WJE
	m8U3gBNp4MnW7WrD7e7uGV1r45k2gE+HwtnaeDEXlY1f85ntcnG8/wRVX0uzJKqKe/Q1xLTqw96tL
	EoU+YKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONrS-0000000383F-2Ffe;
	Thu, 19 Dec 2024 21:15:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONoC-000000037N7-1fIk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 21:11:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so883747a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 13:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642707; x=1735247507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdqbLeOnG/CNjI8uFDgPDBupu1L0ikHkLJQEPoxLge8=;
        b=Sca2UlIcCRkRKk+fLpMT/waDFyuete7qGCgBvOwMb6CAAc6JNkrfLvbO2DSyBGhXl6
         cKKImWyPnYftCcktTor6GUlhIvxf8FjHEO/nidSemJLF2WIYkGXEsVbdmzvfZNF9/BjQ
         Ac9RkxJvcIRfa+cTvGHV7R/zgcOLISM4HFEc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642707; x=1735247507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdqbLeOnG/CNjI8uFDgPDBupu1L0ikHkLJQEPoxLge8=;
        b=Byo86ZzGvG4wOzSoPXgTGyDZgCX8w3/3fJhWoCI93/DuFDofV5qhHfcEslmGG1fMbc
         aY8lWzhhDOTn1xU35OftXrgrtZOaBJwEVb5j++0o2pKKeJwkdh+DOiOGXOYUBw2nvx85
         JL0QBsclHuWajrjAjUx35AQUXbq8ZY7JTQcEzhzpc6GeMh1vxx2nkHJbsx+Azydsr8KB
         HJ8Zjloxz5rtTeJC1X08J+AOtd0xoul4OD6mAXXr79m6JsGaebx2CkTSLAyxVTpTex4o
         6QwwsvPUqkur7OYPMdjHAKm3V1wBf5y+xidy2Gv05gtsrrkdAFvWXxvrc+jX1gcEgWnN
         DxjA==
X-Forwarded-Encrypted: i=1; AJvYcCWxi1fdEfW2JRcTQugoGrCl2MaxM8PO7WeGqxhCvU0vHPEaNFvtPkVaZZ3Q2DVPR9eVymSg/qjiDaxKlM5V4qrA@lists.infradead.org
X-Gm-Message-State: AOJu0YyKhwDWpARIL1Uods8v97dTy+DxxrusVC6xzeGDYtiluVCVnCdW
	5XKcd+qXTQV0whx+4Hr/wdLyxTW7TJGSr76snMUr8s3JJG/8fCK0/QZXNKXcYw==
X-Gm-Gg: ASbGncvamMRAwWuPFZ4/PBOvzKsYgPPoBGfHpou7KifS+ls6Dme4PdW9RFebWJI/vj0
	1av9lpeAG+20izzhjPE8gIAgBLl37Uv16AHWoq/+u6OAA5Tui1/EBy/bNf2nnkYV/e0jq30uEfs
	XvQvCV1SMo5KBXn11B+Y1MlgqYu35rHRldjTwH2vaCu894/udqMLcaFX0DpWXfsgnH06GdnyJr7
	xhVhGFYgwi2Nxlv7f6+KDLO+tXyJruG9ZNMwTUML2IYxtKkTqPmBOsi/bXEPE3Uq7HFjY6ialVd
X-Google-Smtp-Source: AGHT+IG/mLE8f3nNqAfPDbUjzRxUJWzlsRtGsp6JD85mHJm8QntMhMFrw0g+6zwm/W9Dds8OjaF2Tg==
X-Received: by 2002:a17:90a:d88c:b0:2ee:b6c5:1de7 with SMTP id 98e67ed59e1d1-2f452deb516mr716393a91.2.1734642707254;
        Thu, 19 Dec 2024 13:11:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:46 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
Date: Thu, 19 Dec 2024 13:11:10 -0800
Message-ID: <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_131148_437723_6974031A 
X-CRM114-Status: GOOD (  10.65  )
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

As tested on one example of a Qualcomm Kryo 5XX CPU [1] and one
example of a Qualcomm Kryo 6XX CPU [2], we don't need any extra MIDR
definitions for the cores in those processors. Add comments to make it
clear that these IDs weren't forgotten and just aren't needed.

[1] https://lore.kernel.org/r/l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq/
[2] https://lore.kernel.org/r/tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa/


Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New

 arch/arm64/include/asm/cputype.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index c8058f91a5bd..8782d4721f81 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -200,6 +200,16 @@
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
+
+/*
+ * NOTES:
+ * - Qualcomm Kryo 5XX Prime / Gold ID themselves as MIDR_CORTEX_A77
+ * - Qualcomm Kryo 5XX Silver IDs itself as MIDR_QCOM_KRYO_4XX_SILVER
+ * - Qualcomm Kryo 6XX Prime IDs itself as MIDR_CORTEX_X1
+ * - Qualcomm Kryo 6XX Gold IDs itself as ARM_CPU_PART_CORTEX_A78
+ * - Qualcomm Kryo 6XX Silver IDs itself as MIDR_CORTEX_A55
+ */
+
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
-- 
2.47.1.613.gc27f4b7a9f-goog


