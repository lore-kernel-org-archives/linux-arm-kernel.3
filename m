Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF27D32D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=; b=m19H+x/J9R1oXmMou9iKCWQYTN
	bY/6JYbvv9MPOAIGdQ4sNYyDUOHiyIzDvAxR62DdSbcsk8Nn0bXutcluTKtPJgt6WoBE+cRLx/0t5
	S74Jf+Gy32TFaXc0k/D7nqIxP3R/LE7up+vMse6lo4UJNAukUn9VgCol9kCsDmmPsV76ABTQD0Ezu
	tcmBpk9w9kRmC8IUu8czfRVuRs2YJe4hX0JsgDfe6JsPykRMIeXs1cqYaaTiHQpeXSxYepsFpSVT6
	F8uoipnPaZHmUusLcvT4XuDhHQqM0E2YD5/a2G9469PsFJpPeTP/U9iiS6bRKWOcrPP7LhM5TJEx2
	6h1IV/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAohI-000000039mv-4AUf;
	Tue, 12 Nov 2024 11:04:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHA-000000034XF-1qdM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:37:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315baec69eso48343065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407855; x=1732012655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=;
        b=M2dkF7j5D4w3B3U0fmvKmvRVKa0ZvyJFfUwnjCejA0UV2QH89Y2Lrrtj6nUqAIUKaB
         uL+V3OL4ZErL6SRvWs5U208VYGOG+JplPMJA2roNMzKOcij3/ifqL1GxZa/EdvSBeAdo
         p5qkzZDkQl0ReeodWmEKqXj4DjzVH0MUFq2SH9n8PDh01h8JWOUgDExPvFrvTMwNtoyg
         ro+ZC9sOoyOMdIHgwY+aZmvMWTJARPaSoNUjHrwzb6sDLXtPfZCTwADsjb++D9F0uX2k
         neH6qq3Bi9B5Grsfh2ndYD4cZHsjSDabJSTnHc8y+ovoR3O9be7XULWe7eSlVpGj+P7i
         znvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407855; x=1732012655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=;
        b=w2pQLoNio4RGYyNkCPWR7vecIJ6Jm3R2fSrfEjZr2as0oqD4X55aaBEzB8BGNTDI6W
         0hFwCzycKVgtrXfWWBWO5f5BXUlXraO6GzU8VhzPrqkg2OWyitWPi/yts/mJc3ym+DLk
         FJdnZ483JTqxj9tYzcTuU1eU9ZAGBgz/RAj33sEzQ/9WYTp9l/IT+ItTYpkVYVqvO9jl
         cVJk/r7EzZ1svLEqKbjmA7vbf/RKZSs9LGFouIBL8LBT2W7Bb0jeIMXClzY2cF8AUmO7
         SVh2T3l9Fz8VWVVOC2FIzyDFJWUzDYSlTm1SXjSIQRuQ2tz599C+CczdGNIm2okL3QfI
         v3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXu0wjyBDey19uK+hLknjVdH/c16VjVVLDppU4D35bIPKTG4Idiw+e4UsjjGLtxmwXuvkNiDO/AYNnzcU2x6xj@lists.infradead.org
X-Gm-Message-State: AOJu0YzY89ZTZALj7rxwAhqlt2/r7BKCB+sK+8E5eGZV19NqjspKiJFD
	bfwyhcVa672MzvvoK72MHVa16vRFYFDgMSk7NhM4x2vMfKI3WZS/+B1tjLbgI5w=
X-Google-Smtp-Source: AGHT+IEJtm4ivV1htjbZWKRvdvQU4deS33CMMl/XnYQuXPgkmNTFagTge7vJGgMMOIhXkLqCtkpxGQ==
X-Received: by 2002:a05:600c:1e03:b0:431:518a:683b with SMTP id 5b1f17b1804b1-432b7509b0emr146282075e9.18.1731407854903;
        Tue, 12 Nov 2024 02:37:34 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:37:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@arm.com>,
	Mark Brown <broonie@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/12] arm64/sysreg: Add a comment that the sysreg file should be sorted
Date: Tue, 12 Nov 2024 10:37:00 +0000
Message-Id: <20241112103717.589952-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023736_507572_12F66427 
X-CRM114-Status: GOOD (  13.91  )
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

From: James Clark <james.clark@arm.com>

There are a few entries particularly at the end of the file that aren't
in order. To avoid confusion, add a comment that might help new entries
to be added in the right place.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ed3bf6a0f5c1..a26c0da0c42d 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -48,6 +48,8 @@
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
 # item ACCDATA) though it may be more taseful to do something else.
 
+# Please try to keep entries in this file sorted by sysreg encoding.
+
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
 Field	31:0	DTRRX
-- 
2.34.1


