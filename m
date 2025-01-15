Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A03C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZChB+86DsNx8l3CcX3oU+ro3tDo1BkQCZxriLiezhyY=; b=eaxQvFLjRDtPiZ3V3Uu1iGOdGM
	Uv83TmZFtTHaMCZEca0X/B1JN62pT/AWMEfl5RxDnqmKym9c3EmkwMeEo1g6BhFx3Ovi/aLxIZOdJ
	dP+gfAI1eKqI37+owTbHUG6VU2GLlwtMXRdV61ZWuX4nDWezDhTOwIYCWwQrZ4F4kKPZvlfUJsgDu
	L7duvrJmZJjMroPtVVhvL9ep9PMWNbpe9SpVOsBSgnKODnaRbXLxbQl49I0xS/fygM29zDLPD+hq2
	ZCeOMNduUFFFCoYFPaWyAFovZtWLcIBR/LjHcAAaeM1CQlVM9ISQgc9YxwTKOE5SH98yb9wA2Cwum
	zQk8vpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3nF-0000000C3Bu-0DwA;
	Wed, 15 Jan 2025 13:50:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3g8-0000000C1Wh-0biE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862d6d5765so3574519f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948607; x=1737553407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZChB+86DsNx8l3CcX3oU+ro3tDo1BkQCZxriLiezhyY=;
        b=W9WfYP8AnzWigtxTOJRQXA79z/I7WI9ZlDhj23LMtMWHqOyFaA6KloQpHErPnkZY8n
         WBhANWul1T1pNoPwbWiklOK1y2kpA88vYm47Lf2omL7BGrDrXIyWzl7ShpPBSKfXmaFx
         7/O7Jr88c0l7KEeOrEgwo9ZKypwyjSLN6sabLmcLD1HY+KApAMx12AdthQELJnVpN0ZL
         +sImzeqvVMWl5CqdUkfVtlNRogniqfKDUbDVE1aO3pVpqSVmQ68CUhRT0YKYLdGLWHs/
         UVTrDcoYERv4B2ReFEQ3FP1/WaqDLuD7oVlM1zDm4YhQGkX+KnBHUnD9I6kGSOybu7TM
         3PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948607; x=1737553407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZChB+86DsNx8l3CcX3oU+ro3tDo1BkQCZxriLiezhyY=;
        b=qhrVX4V8lrnoC+FZMzSex87Zru2N/Led8xOKFS5NNPV9vLaZ9hhw3Aer2UlWPn2tVu
         XPCLbLaPLjoHt1kHOaXHKpQG4KNthKzV+eoGZhsI7vTxL0ztS/G0JiUeWILSuRGFNRD+
         jtEuRRKNrf/nkpWYy7x9Hel2hOgdRHrJRm9n2bOB/wWQ8Op9mJ7sGwCga/aUYyOmd5A8
         wyzEvMYG3/V755fL067So1esGhiKVcGZUK4UxRr2c9zopWH2r3uukMr6H5ob59vG6Tk2
         PONpako4cLtLd8ZXDIV5OByx4ZVtj+J+J70dIp7WIEHUApzQTRDU+08+Y8iuiKCLwZzz
         0jzQ==
X-Gm-Message-State: AOJu0Yw0wYFyG9Lz8fzBWi/tT1zzUhYP7h+C22JDXGhAkyJlgzvo+IT1
	WYOcKcX8qN3wD6utFcQwcueOPk3fXJXJV+3o+gyhdt7Fw9UFtDjnGSknRO1iZ3x8NCHkhEk2YSG
	j
X-Gm-Gg: ASbGncuDydtIlEiP2kxRLkZIsEyHq1pXQFpeJvJ+7I4QUzYkwdVu5rKVJrUXOZX9ATm
	5PksoKEKByJtlVyleVivFKFDnajRa7U3o0tXu+wrtqSL5ufiiTsVvZNEPJHw8ainTZvX09vWOhl
	efbgdUz6kakdzaqaPVY5xfhb7GsEYUSvbWyoKJo61DulLD+6Qp2WlvhTNiqx5tQeUBl6IDTucJF
	6XWqm2MTqUr/MbO6ib25rCuwIu9WpUGtGIug+OLLGtEVcwRXc/8yqo=
X-Google-Smtp-Source: AGHT+IG4uhAQ4MY3NJmkUgjJ48AYZoaK6GTSoKRINJ1+3S5DFQFYFS8ToBrTNYxbZSY9Yn4LcTa4cQ==
X-Received: by 2002:a05:6000:2c5:b0:386:930:fad4 with SMTP id ffacd0b85a97d-38a872dec5fmr21670482f8f.19.1736948606689;
        Wed, 15 Jan 2025 05:43:26 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64/sysreg: Enforce sorting
Date: Wed, 15 Jan 2025 13:42:57 +0000
Message-Id: <20250115134259.1864060-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115134259.1864060-1-james.clark@linaro.org>
References: <20250115134259.1864060-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054328_178858_585F6296 
X-CRM114-Status: GOOD (  10.35  )
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

Make an unsorted sysreg file a build error so it stays sorted.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/gen-sysreg.awk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 7f578216dc68..00a8391f373d 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -98,6 +98,7 @@ BEGIN {
 
 	__current_block_depth = 0
 	__current_block[__current_block_depth] = "Root"
+	__last_sysreg_sort_val = 0
 }
 
 END {
@@ -156,6 +157,12 @@ $1 == "Sysreg" && block_current() == "Root" {
 	crm = $6
 	op2 = $7
 
+	sort_val = sprintf("%02d", $3) sprintf("%02d", $4) sprintf("%02d", $5) \
+			sprintf("%02d", $6) sprintf("%02d", $7)
+	if (sort_val < __last_sysreg_sort_val)
+		fatal($2 ": Sysregs should be sorted by encoding")
+	__last_sysreg_sort_val = sort_val
+
 	res0 = "UL(0)"
 	res1 = "UL(0)"
 	unkn = "UL(0)"
-- 
2.34.1


