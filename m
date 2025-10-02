Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08725CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7P+sGtXRhq0usSaYxPiIMynq3nyv26DuyfZTuxL8VWI=; b=H4W+uvRGrqmcG8
	3ugWpsBRhl3tFWjz5YF+xBfnDbjU6f/QAz+Xx0KsOwT5ejqZDQlp9rrO8umOKngTm+2EI1bEg1jrY
	x+jAQ89taqr5dOPu2G2FxLWmRzZQKopBWWZkFxMMEo1hhQT+uIUFw2swdnF2P26EDjg115uH00VkJ
	a5kYYYQWEzwGVxbx+HprXpaUzDPVQGOmcy6E18IZTAAyAmZypgxXfZF4791FrYgL8mCdmzZCnrkYP
	B+P5fstgmYXBMa0steju29w0bDr1vlKm7z/AknFWq/qDwi9vc8rurmIxw5UyhbBOsztXbJAeZ3A4/
	nhTx9f/IGmBhG/H7a3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GcR-0000000AGh9-3xRw;
	Thu, 02 Oct 2025 10:33:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GcP-0000000AGfp-2k7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:33:02 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b457d93c155so164499466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401179; x=1760005979; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P+sGtXRhq0usSaYxPiIMynq3nyv26DuyfZTuxL8VWI=;
        b=WS1XXGcl/HlIGsoW7U4qwcRsVsFcV0LizucT7tAJCJbhJgLVVFNtcNavfPpBONHYAm
         Wk+zzDpPQSZL/RDgJHJZ/zGDz2ZO/PkG2KuE3ky6YH8/UxJFjoz2RtLToWzxshqKGR3l
         sBLZUWLOSzrCNkZcbVKE2WP9jQV/cPUiaXNOD+dvBurjJ3xkIKrP8XWT7JfM65VSfyOD
         0IZbK8CJVvdLfZlOPefidg3I5rGTnJNDa26kG5vGB43dJKZa4Lz0pMcRTRD+T4UifazL
         EbCC4cOAM7eQFVxji/mSHBUL5RZCHrx1v54E2Jwh41+McAtBHWSPZpbfTJTuczNlOll6
         99KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401179; x=1760005979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P+sGtXRhq0usSaYxPiIMynq3nyv26DuyfZTuxL8VWI=;
        b=MBFZe9h3WcCyRD7BCpr2DICTJ8qvBHc5+A9Mtdx+9EysIT7rb672ckN4S3kLlqVLf2
         e4uI7/efVnoq8/MN54hZdQDHvTyxhww7jv90sGh99NO2HNnvg6M8wyIpu/L4p5WJOIcC
         FQCe+nKoN9br26JMGD+aNPK7wM/yGNQCGDlDeatM3sEG6GD8XFkUpJwi9EiNwBzzbQIZ
         DtNqijf6L72Y1xtp9wji7ZHZf7FXLJOSOg9II94AkTLBiUHWwAqksz/9fwD6FIxGI7G1
         E2ravAZrnljZhaiaJlABhcqRiR+V3cHLNjcL2Awv6LHyBPJ3FpZK6ZyT94qW3zePo8Ja
         qs+w==
X-Forwarded-Encrypted: i=1; AJvYcCXzqWsPQhUw+FvBED951jzO1lLe5AUppU8SH6T889mr243bC+2nruv5hm1hYfAkagOqrKeAGUOQ+DnoQtNbextZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWGvLnEI61/T/irWv/0hJKNezwhIlZrClDMdYJIMZ36DvZb2M9
	WuwDre5g+8WKDq4hrVOX9CmoTvFhkTVbHkFC6KVQ45VMsDcUa+4y+Sr+zg8nKD3F6b7Do+Ul/y8
	8ic/jFns=
X-Gm-Gg: ASbGncuM74xDKyO74Z5aA4lhlgqkFy4kclEQowyO+l6UFknvUiPx62AppMtG8Ihy16X
	ohJwA4hqBkQiuJ2lFfolICcVu0Kt2BO75B9HzQvnlcuomptsA61Ng3usul2ICWdsetphQ65vlQk
	rqkaE+qlNaMGpZGhqE2mzqQsb5Q7a4xDAT/gE2lZY7N22aThP/XiCbKerG24cfVPWo8HCZCDgeA
	yNTjSUZ0FY5f31xFKp0Zj4xx07w0Gwj/2gg0O3Ve8/z75QT4xkY+GtS8tJWDMbj0Nx0IEyHQBAq
	R7QMAxYdQX6kTr4GcxWRJ8c/+zg6bxR9ZzvUXZvfpnTKaAVVsEalH3wd+9c3cY8Xa96oDtjQ5zA
	D6xVvCoF2QYoSlVzjo0X+DzObhO89i/JSkqh9PIwu1+9N4x4QO0DrbN7w4TCqbs9Af53VP1bzTJ
	wYn+TVzM4pOl/ZLlJIapYukkw163/SOP3WVBZoXalF
X-Google-Smtp-Source: AGHT+IE55OaBBhFZS/spDOtLmb4PerdgYY5yS2Ckb/IGy29/YmfIffHAN0iEIq0aghfbW8MKNL/xbg==
X-Received: by 2002:a17:907:3d94:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b46e30e957amr846825566b.19.1759401179405;
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4871167172sm170262566b.65.2025.10.02.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
Date: Thu, 02 Oct 2025 11:32:56 +0100
Message-Id: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANhU3mgC/x2MSQqAMAwAvyI5G2grrl8RD1VjDbiURkUQ/27xM
 jCHmQeEApNAkzwQ6GLhfYui0wSG2W6OkMfoYJTJtVIanehIv54YyK3W42H7hQSr0hR2qKcqzwh
 i7QNNfP/ntnvfD35ip1hpAAAA
X-Change-ID: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_033301_709828_1F6C88E3 
X-CRM114-Status: GOOD (  11.37  )
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

Accessing non-existent PMU registers causes an SError, halting the
system and rendering it unuseable.

For gs101, we can avoid that by creating the underlying PMU regmap with
the read- and writable register ranges in place, because on gs101 this
driver controls creation of the regmap.

This series updates the Exynos PMU driver and gs101 in particular to do
just that. For gs101 this is easy, as the exynos-pmu driver creates a
regmap and we can update the regmap config to pass in the registers.
For other SoCs it's not as straight forward, as syscon_node_to_regmap()
is used which doesn't allow passing a custom regmap config - those SoCs
are out of scope for this series.

With this in place, invalid registers (by drivers, or even plain
debugfs), are now simply skipped by regmap, leaving the system useable
in that case.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write

 MAINTAINERS                                 |   1 +
 drivers/soc/samsung/Makefile                |   3 +-
 drivers/soc/samsung/exynos-pmu.c            | 136 +--------
 drivers/soc/samsung/exynos-pmu.h            |  11 +
 drivers/soc/samsung/gs101-pmu.c             | 445 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
 6 files changed, 797 insertions(+), 142 deletions(-)
---
base-commit: 5eb97efbe6a375944984e7fb69bb632d2879c841
change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


