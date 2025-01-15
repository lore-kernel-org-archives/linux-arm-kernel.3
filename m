Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82875C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=; b=clICayVhKUkPUXSE+aqzdS9WgK
	oPG+zfI/XcRNlci2Q7T4CdNJYNtfjPI+tTRe7/eRzfCRkskr9OJkv7eRkGqAhDrNpJ0Nv/crSqNhi
	4hIL2GydC/E1M6ny+juqW52NDPRMDylKfpg/0WBvVedD0MAQ2ti+j/tNDSZxuyIe932DBWeU2YD5t
	ELSEZym+6PwbS8vCF/gi6jG65m7QQrE0AOvNH5XyhcEDllASjxpzSBRldas/fCzwVG5juix6MaMSP
	v6A/ijwxONhbRlUNL7C+ExeJta/MpeHY177td4+wRIllbgaVgeYvqSDC8oD5VCzL6olVmk0eMxxo3
	VQISfziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6IB-0000000CSG0-2dr6;
	Wed, 15 Jan 2025 16:30:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Fg-0000000CRcZ-45Ej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:28:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4362f61757fso66846125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736958499; x=1737563299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=;
        b=dZIUlMRDO3qE1YUL1w2DC7xaDD8MlQRrm6uDcqJrmmB+J35iUYQ0hU2tM7It3q/px2
         TtgU4DJNjhKgPposW5QV5iCcHGQ8dIYYwVjHuu4U2yY0vqcnUQnMzRudI+HG+Srysh2F
         rezNRAS2+GyfKPKy49Qv1Cnwe0PBCXALSzYITUSkGF9Jp6RBnxFYyDn75FHFHEvz4j8/
         +03DpP9qzDtaQLZ10+EiWBl0HzV1Vq/2F53ithZg2xLorSMr7JHP1B6LDSTC+R8kLhUy
         TIM2wIsGYI0EcdGsCnAYV/DDbECBSoWKr4qtfyF/ep1M3Al8FlehQ7D7KpXi49dzrcxK
         GmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958499; x=1737563299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=;
        b=M5t7QtsomSazbAtZ+Xuxlg/v3tDT61pq+XqRT/Z93Hqy+FwNv3sL23InnCR6PBycM9
         I/zGDX1p03yISBaveQqBMbaFX9eLyjG0O45t85mq61vJv5dXGLcLD1qwAfN95Qsm/YTW
         gisr1pxNYY6a4i9rIPeJKqrjiwLHxhxHxdjATSiSt1uKCe9o8uXUhUR1eNVOnZwNcrVB
         5thOH7Yk9kH70k8wCbVAtJr/OLSkFS48CBITT1HZuPioudYcnMgiNtqB+LIlyadDMOmY
         Ga/sqvq8ugapPMkTE3IAAcBaAr8FMSa2k1XF0HXeBJbmLiFqJviqEosbQ5XxpWcn6Lm9
         9XWg==
X-Gm-Message-State: AOJu0YzPzisO2EFfb19xFyTFdYMZcRAJcgEDdPytbteghaEKuyTKV0f0
	YB7gAhlRur3snm0HbNKasH33c/VdiI7kpY+Sjx/cBw44qtxQtmwWDYg9U8Q9WOtXS1YrTkuPeV5
	D
X-Gm-Gg: ASbGnctXWPWyjP7BzRhuhRQibNwsmlLEpmDRC7YtoPWrv1DH8Y0jS6yYuXG8Les6r18
	Jy4a0sW8V1+t902Qv2XoGyJviyYSo8fShuQTiW8l39V8s8V67g2F0NhnseEN7yngpjbA4rrAedP
	raJm9LnySvrzZSxhZw0jof7PnOS0M8U+val1KehBN8dzpKn47MrR6Ede/RO/2r6aSF3X8o3zbqL
	JuBWAjG/OOd2SWX8RPbavjc+LtzfNZ+ivgmr2hpDB4wV+TTR0/pqYU=
X-Google-Smtp-Source: AGHT+IEYQxfJb+fGUXEj5FL1voCc6arCFh3k9mxfCcviGqqyVZFZPgPost2RecIw2PNDbBcm7fTJLA==
X-Received: by 2002:a05:600c:1990:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-436e26ae2acmr31032085e9.6.1736958499113;
        Wed, 15 Jan 2025 08:28:19 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac61csm28620115e9.14.2025.01.15.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:28:18 -0800 (PST)
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
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64/sysreg: Fix unbalanced closing block
Date: Wed, 15 Jan 2025 16:25:55 +0000
Message-Id: <20250115162600.2153226-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
References: <20250115162600.2153226-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082821_014751_4D059276 
X-CRM114-Status: GOOD (  12.48  )
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

This is a sysreg block so close it with one. This doesn't make a
difference to the output because the script only matches on the
beginning of the word to close blocks which is correct by coincidence
here.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 762ee084b37c..bbe7df69da9c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2074,7 +2074,7 @@ EndEnum
 Res0	4:2
 Field	1	ExTRE
 Field	0	E0TRE
-EndSysregFields
+EndSysreg
 
 Sysreg	SMPRI_EL1	3	0	1	2	4
 Res0	63:4
-- 
2.34.1


