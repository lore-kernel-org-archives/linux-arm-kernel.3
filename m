Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF2FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGAjyEPuT0Sy+GKYtRpRtSgrFjpUx/s3n7hQod37S3k=; b=Cd97rZl8gL/bVHsJDSog1wQFdV
	ESpEZsUkplu8I//VL5ZJ9poJ6rPuDhcLfR+gV5FLXIjgJ0UWu6DWk0PNfhXaH6I/8TW99XfTwP0Dy
	wJGiy5sAwKl/A+/pjAC87Yv7vizIf4L5gxvHgfcl2UdJfDeMOm8v/E7o1qNE25I+mo/X2aQMxYtWZ
	19m4zX+Lxxa9MgJkw1LIJhZzvq2IGSgl0dmeDXOrXaraQhQYgKtjGiFJfFAkI98wIBvvIh6aDRWkv
	npdCiLVC3AcI05e3vSxPhHjpr0G+JkhA1uM7U3wEZLLQXQQmGBJxgN2N+pHhkkhg4KITPFww7AIkq
	Qv+BC4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhtA-00000008nGX-4AFT;
	Mon, 09 Dec 2024 17:49:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp6-00000008m5x-2bWU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7258cf2975fso4016204b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766331; x=1734371131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGAjyEPuT0Sy+GKYtRpRtSgrFjpUx/s3n7hQod37S3k=;
        b=IgXQkh0QhdwrqxodFlwxunpjJmzJNe4pgVtgCiP70HnkK51xQeu3rBi9jwAgDbgkDu
         znWNg/JC5XYBtD+7LFJ6Qm9LvyQrf2hWxC7PSIwujPAOyqE/3OOC4koDDpYR1ltSss0b
         UMsog4F1Zb113aOJVBw2fVaVytrxskkNykhb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766331; x=1734371131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGAjyEPuT0Sy+GKYtRpRtSgrFjpUx/s3n7hQod37S3k=;
        b=k8hwoAKNI8MUEkqkXMcqQcQ9l3hPDyNjVtUog7nAQXOV9kfZA4nafduRn3xfij5msk
         XJJrzH5m6MIm9cq7JzpcHG1PKgZ203uwQhmHQkdisorVjKTqIWOHPp4hsC9fQ5v45Ql7
         Q4LFUGef8FIRVDgjrGO9tjmCIYjnUy8HgSIb2lWpWaMVcAsuxjtatbTBZG8lrhZZ542c
         TE59iifKbba0qvDID93rw1EOhBbQQdXRMe4w1iUHs7NYMgjlkGgzbuDs9SeszltNsdg+
         5W94hrVy2wfoLBxcV14/ega9L7HQtBkL+g+Aql/WUya2AQUkqj7VraHzai0ACig4ClYM
         chzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+VS/tE8+A/tp+mFpbjaDC7Mi06DOfhd/x8hF7H23u/eI/0WI058+0w9HiuecSiwn36KNznHZLURQFpcPOhmVb@lists.infradead.org
X-Gm-Message-State: AOJu0YxZtBqEHF4NHEocEElPSWrRGDkkk1GH714KoNVS1GamgqWn99Ph
	z6++ZmLM9MVxHQ5HuPPZvVmhG5Wf9xKZsLmAWkYRAc+KD6e+HLF3CcIwXVCJ2Q==
X-Gm-Gg: ASbGncsXPpGdyu/spRn+M6sh/9IGHWRcpDVdokVHe9cjGfqDhM5Nas4eoXG5z/ekD+X
	DZVPnaAzWUQGpQvmo+z8ZobTsyBeft3z/pBCun4q6uESds4f9ZyL0juLaMqf1pvkC9Qb6g6kQYu
	/FfArBzJzm+8QK3xSVY9bOXYVPo6Kd3Y9EyHwtPuO6kTX9/l+Tjkhpo/SCwcaS3c8LbXW5Fz6RZ
	acFtZoa5fcEbUb9duAjf48DHGgCm1CETX6zk1O9cIjh8RVlEvHI8+GEE4NVj/wmh9Y4dy/Wqg==
X-Google-Smtp-Source: AGHT+IGIm2OSph5NAKJa8gdDHdlDAkZKg2Ze25JJ3panR0ayICXZnis7gphzZlRUR4Rf5fjAX/kMgw==
X-Received: by 2002:a05:6a20:3942:b0:1e1:aa24:2e58 with SMTP id adf61e73a8af0-1e1b1a79c30mr2366050637.7.1733766331535;
        Mon, 09 Dec 2024 09:45:31 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Mon,  9 Dec 2024 09:43:13 -0800
Message-ID: <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094532_657422_8FD23047 
X-CRM114-Status: GOOD (  11.33  )
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no idea if this is actually right and no way to test it, but it
fits the pattern of the other definitions. Someone from Qualcomm ought
to confirm this.

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
2.47.0.338.g60cca15819-goog


