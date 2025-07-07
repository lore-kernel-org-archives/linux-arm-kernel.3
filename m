Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D324C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/l9ZtZZtpv5TdHCIxJYxYTLPx5NrF8lUAqMdxgF68/c=; b=pr97KU3J07nrtb
	6ZI5lX0epHpPQIlD209eJtK2kIydbxbndXSsLdoDWRDMppQ/gLMSmcj6F6MXBgn7yETlkwjBUFnbf
	O+HSzqyrEYoLnjpFQYxKCwSt1QjqAlFqIw1UVWhfMuCcJ+A6DxIMfQEz8QwI5Cjhn19CmfUuVUAGZ
	mDqCGZRHzzJIXrPFaEUW4UPxJnoPqjJeFmar5gmif2WPtnYSRx8vG3Jfh30I2PMyVrtJr6mjdOru+
	gzrHtw3+tyinwwqJbCIyl5knnEmQS5bI03PuXtbOTPA4TJRLtAdV2MwMAZ7rBGhhUe9lOVlYYxIY3
	83xeDWZGBXCLDb/WjrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnwy-00000002tdw-2HGC;
	Mon, 07 Jul 2025 15:40:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnsu-00000002snX-44rJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:36:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1658150f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751902559; x=1752507359; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/l9ZtZZtpv5TdHCIxJYxYTLPx5NrF8lUAqMdxgF68/c=;
        b=jzdFu2+nHO2GSju/yMYROB0Xe+SoY+KnkDcPukhvy0isdXI3Tumnc5C4W1wxdOU+Eq
         D3q0DCBgoMwOL3+xWKux14CLTzB31yO7eRVQE2W/N2QRTsXzcbv3K3E7SDb3lK35pt/c
         21YxCthcwkENeLo1FvGINlUeS2cM+FbkJEPVhMcMZLmPix4r1lh2vdGsTlFuilAZhDuT
         n43Tn0NamZiThOefI6oMcvHpQVzkAk/jif76Qo/DQWdu6b6a/59SZ8UbQjKbH5LM7lYc
         iEq8F88oMymEIaP3YZ3Ye1T6bQy9M7w5my4RvO+U93OJtnYp4kiKkfpJt+mpXDvED/+A
         eiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902559; x=1752507359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/l9ZtZZtpv5TdHCIxJYxYTLPx5NrF8lUAqMdxgF68/c=;
        b=YqxjiqgGeuoNq3404q1J83RYNHM46dVLvmZwqx18VOjt+zINxfZJcGTwsQokI3q+35
         vlEPVhEJzPY/CEicp8ewzqutDBQAkbjNoQEHDurBga/ET7EjtD1ruTYMHLdmJhWaqcol
         jBkfzmASy25+6hxQhHSdZcabRYcenxgH4AVuv3yJ7MkXxSQeyLJWhVDDp9unOTFErmca
         GJBzCbc3T+8Lfk9lJJNTzM/doRQmizIWJWrzPwVlMulMcVeF5vyeEcOlm7T+ILSdxLxv
         ikJKp78UcFcKm7KnYVa2QxsMJ0uUBp0uVcNZmnPFSYrxvv3yQBoTaUzItXcivvuQ+QPV
         q0tw==
X-Forwarded-Encrypted: i=1; AJvYcCX6YJGb7SaN8tclZyn26nkCq+s57SEK6J8pEcAIfFt93Zw7aYtPJcJ8vZDXky92hOxv/CxzRV5uNgegfYo1v6HB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7Y/oovND5oF0CsqmrXe8QBpggwd7Lnalb0QAhrfn/tlrN2YQ
	ylFoQPm42hAIvqUAOFufsogtGNp9YC5vL4gYKaBl5ID6pvBjTECxMUrND+EvTEGMJEA=
X-Gm-Gg: ASbGnctC4/0El2xPrqefuiAAQjfgQopuxC7zu1MmTa8q7BhLjIkyjnOLnNq5OANzk9c
	Dp9m29RW1798iL8mACLmfPO84lx7U/+4eWeSTitX4/25CmxiQhIupCjtML8QUdQDjgZrkYunT1h
	HVtOPfmAzjaVIpqFkwH7AkgVf83xHGRLTBQd1vLy1DRjpaglq8UjPvuEMn74FsgbfhT555KBAFJ
	GWmqw44IfDVg/zpGVoSd6/O8gjdT4IFflyFVsyB8o3HqtDpp98r7BDe3GNUMHXP/UyWiAT3XnQx
	tO+LdiByp5xE8qhS/oVKkE0KbxxuTtd30bMvxhVyhRnLXZ7SKxzedLsm9HEYFf5vxA==
X-Google-Smtp-Source: AGHT+IFOqLs3rtH7O3Gh9y3XbwlbxGcrr4OrTjS1GR3bH2LIxoZE0mcQMkU1Plw3a2J1R3ML2aNxVQ==
X-Received: by 2002:a05:6000:41f8:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3b49703e3c0mr10826505f8f.44.1751902559317;
        Mon, 07 Jul 2025 08:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:43f7:96cc:da3f:e6bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd4dsm10409968f8f.7.2025.07.07.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:58 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH 0/2] Enable TI SCI INTA MSI as loadable module
Date: Mon, 07 Jul 2025 17:35:56 +0200
Message-Id: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzpa2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNz3ZLM3OJM3WQzs0QjC0OzZAuTNCWg2oKi1LTMCrA50bG1tQAUC7g
 0VwAAAA==
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_083601_249428_D2BF08AF 
X-CRM114-Status: GOOD (  10.94  )
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
- Export necessary MSI symbols from the core kernel to support module compilation
- Update the TI SCI INTA MSI driver to support module compilation

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Guillaume La Roque (2):
      kernel: irq: msi: Export symbols for TI SCI INTA MSI module compilation
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


