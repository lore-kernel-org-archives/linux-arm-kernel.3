Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8F9CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=90ocVc/YJC3isdTykofnEb+YfRvmtfJI6WUnAmF/m/g=; b=Dy2SnIB35ECpPA
	f1eDpikP09dh/dPdzM+IhvvVhPgEob12x2Drl9wn3Rcf4X+bhfPk8bJHGQoQH9/vPew+sNXUEeAAx
	BQq2k0KXA26+Y7HJdfq2UEf0B4+O7D7BM7e6lK+sH3IqtczZJvl/Yyw5Xts6VvjIuYrXFGmbMTX6a
	/yxEK3UigdSGGYXURi8W2ZzfjFUjyKT+FII/44G1plWffJJWmANgy7/F1/4bbsLL7BLOMMVX1Iwm+
	Vx8jbMckQzrnJGCJ/a2b77eHYn1NPAppFHc2kHDOkPnPi4Tq2KqI+iBYGXpmLCKRNDveeE0LvfxT9
	XKvqS/xegfY0e1/+sddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQn-00000001dsN-0Qbs;
	Tue, 02 Sep 2025 19:12:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSEk-00000000R7J-1plw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:43:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso16948655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756824233; x=1757429033; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90ocVc/YJC3isdTykofnEb+YfRvmtfJI6WUnAmF/m/g=;
        b=v5fzQmI8XHS7XF7HKtpzc+ssbgR9jcEacfHwtM+B+c1diDXSRwOi4gWbGpTmZvtVch
         /tTn6yVrSohbkPcxH/cu9PCDA/WITR74LCl2FpeoVZ75dFh7gkdEoTmmUI2sV6C9YR8e
         3n0a15Qcj0vv1nTmL62GfDOX1CBIrVvz9CARB8515YKKBYU03l8StyaQwb36MioHHPqQ
         Qwqh8YhJ3avxgYuNcjEHMzwTMpWrYpk+gbS7jhq1LjUpHhbv+nL0MmykGqrVM3PxiX2N
         sUQwT4daR3bB86Rx94MBkHayGFkgXvSBEJvV635j8MNrZF4QLSArW/x3RE3ivfUYLuqV
         yFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824233; x=1757429033;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90ocVc/YJC3isdTykofnEb+YfRvmtfJI6WUnAmF/m/g=;
        b=WCgtDledGrd1TX6boRhOIauzuo0olKghkkUsyEGXSUecIYfL/cuowi5w/fo8BHrNXT
         3w/QXbpZDKGNfeMELwf5V9t7ngPXVYe3jMpdCaSMjCVkYFD0pciIdc4SBczb1d66zF2d
         7fnFUwyNLzxpak5R7AUziFjHQvnm2im+u/xot4U6+G6SE7J3RiwO1IxuiVcmjmVyhD0p
         13sm+TY7s1pnYI7bLqW+hrWrINCNaBqMg7byNdH3apkcfR+USxLc7L9DmT+yrew/mkVo
         C1aUuXvNV0w5jZeLc66rxGp7zo3vXNKahp3QwiWmfl3CADAJCzR3ZDYTR+TjKW9u6Poc
         NNDw==
X-Forwarded-Encrypted: i=1; AJvYcCViI4BNGBLZP+HXC9ijO0CZnRMuW6pbyB9KnA1kWbdVw1JWewNSme6PHundVwFbj3VccUDN5K59UXnKP+XGM5+a@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWts5N/f5WA1800Swjxpa/4zMssCu184yHKS3erEMI/gZVKkh
	BCY/Yob7sb9wADJEDyjY0gMmxO6iv0NJqKXgtBuVfforPzLobZZw2ne0EzuVcoEj5jk=
X-Gm-Gg: ASbGncvQAY18aeKTjMmn+aISe6q5xFjPF3rmMDLU/RqbL81n1Mb1V9kShe5ab23IgNB
	sN+4K6qj93hOSPNSpKhS3nCTitpKHED08Byl8xUd1i096Ngdr/ijVlaoWoQvPW3U0+uCfMmkh8o
	HFETuZXrKLN+U9GJM5Zq7zAn+mWz6IP+Hsz1K1CaEs+byWWukRxnnv1jtK+Ta/Obr7oRi+pGfbD
	P5XXwnuYO87YcSVLoU5vz/8qu2G6hXqs/e6Gz0fqKTPCH5K17FbSgyRsv/enDQYgh0vBdOC3q08
	sO5ceWf4+QzlU1nv8xFTp9tdaCQfdA/zZoWR7t+t2Dvaas7S9eNtIXObTFpeIV1iOXonf8izdkO
	XwWRtN+nNvtCodRP+yKy/mpw5dK/MCUDXNwX8
X-Google-Smtp-Source: AGHT+IFMkODIxexa64qaDsiP0rdu+jkcSKh5+xPuASKAkLpcnKLSE7yMQp/f0qku1r+x1P9TGQiZMA==
X-Received: by 2002:a05:600c:1d24:b0:456:fc1:c286 with SMTP id 5b1f17b1804b1-45b8553d964mr84047225e9.1.1756824232406;
        Tue, 02 Sep 2025 07:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:5982:3242:38ad:8b12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab093sm209604635e9.22.2025.09.02.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:43:52 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH RESEND v2 0/2] Enable TI SCI INTA MSI as loadable module
Date: Tue, 02 Sep 2025 16:43:48 +0200
Message-Id: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_074354_483768_4AE1F7DB 
X-CRM114-Status: GOOD (  12.11  )
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

This series enables the TI SCI INTA MSI driver to be compiled as a loadable
module instead of being built-in only. This provides more flexibility for
system configuration and reduces kernel size when the functionality is not
always needed.

The series includes two patches:
- Export necessary MSI functions from the core kernel to support module compilation
- Update the TI SCI INTA MSI driver to support module compilation

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v2:
- Fixed patch subject
- Replaced 'symbols' with more precise 'functions' terminology
- Used function notation with parentheses for exported functions
- Link to v1: https://lore.kernel.org/r/20250707-timsi-v1-0-80ae43b2c550@baylibre.com

---
Guillaume La Roque (2):
      genirq/msi: Export functions to support TI SCI INTA MSI module
      soc: ti: ti_sci_inta_msi: Enable module compilation support

 drivers/soc/ti/Kconfig           | 5 ++++-
 drivers/soc/ti/ti_sci_inta_msi.c | 5 +++++
 kernel/irq/msi.c                 | 5 +++++
 3 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: 666f6d7e7fadd8132f310a87d1f8ae08c3966e4a
change-id: 20250707-timsi-c66a2816c84f

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


