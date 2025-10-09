Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F022CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8Y2hQ4PF+BjFgeq/9cHEzG8SplUoZPxKltHoG6YiyA=; b=OE3SkP9payPjlQ
	NcwcxVzmwYpMhwxw8jtfS7OClE/NZoyIG5Mjwe4KtsUODPnMgiYEc+tU+IObOi2NywQZkHhHi1h4R
	QU7pxeexofql/tdSlaob/1VLLUmoWr04z+bXJ/jta2npyZhULq3fhjLCrPFrwXlI9RtrICFqQgFtS
	aMMUeidURarwtkHD6PcKny/UuVf5O/v6uatrSSF+QNvhzq761Mu6iJZwkDS9b1bz+nCfx+VXDPKQ4
	7f41ZI01fRYzlekrNuHSEGSVqAGplRg+jH0bOzOFrglkQohbfDOTHxz/p+FOnQ9rv7kPgikhcghkG
	GuI2A2D6S40ZTb4bwJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzl-00000005f9y-0p2K;
	Thu, 09 Oct 2025 09:31:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzi-00000005f87-41MJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:31:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b4c89df6145so100837966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002289; x=1760607089; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Y2hQ4PF+BjFgeq/9cHEzG8SplUoZPxKltHoG6YiyA=;
        b=azNonjsA4lJCNs6zuVdbhjFEEk6/xFWsDN4rhvke5LQ95EZIatrhtVlMlZWFKOmbbl
         tfKEGnaalhxoGNdRNB1mGdST8v49v/MNHc3nDTkFsjGmLtCHMTqH/f4uRX88nVJ9GN5b
         YvsfG37T0vZbJS+63Do+I9STPOz9CGWPkpIQxLaqwivzhZ4204lcVRerlV8pBAihhM2P
         BZ1ruAN+FrnHj0oIFpqplKr8IeBSCh/+CD8vXglMiU3CrULyP+rilsYVHbGbzuXCpX8h
         bGbaSJQ/pYoZcRVpx6yYmTzA8DnUDNIsyjcSlD85g3f/m49/D/CDEV07/3tv9kjk11vb
         2XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002289; x=1760607089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8Y2hQ4PF+BjFgeq/9cHEzG8SplUoZPxKltHoG6YiyA=;
        b=eqFu+cQPDvkb2dM75nCLGTmJC2R0RTcRup15RBtZ04yOfO3WAM8IhSEPHiQnc5PrTH
         A1mCl/7mNRoKtXOFMSIMZT1Cszp9KfH+sXvpuq5aIExR3CHgKIvRjBgvym4xDh30oNwG
         BEPUY9GoKP/Y58X0ajl2/KcEQ5WVmtZFGEl92gR/hp40e2lKdowuXbJQ8jAuITOwZc5n
         XOuNACdNVlDTpxE4hwKJWU1/mDR7TptqLX2V2T9ajex+nhx+/pChS+mlhjT9z2N8rB5D
         LjqGDmdObmY/NguSr4Yg8vWP3zN3aJMvJFoI5N/1gDLUp45Fs1JZ+GDXWILibUJyW5wP
         Clyw==
X-Forwarded-Encrypted: i=1; AJvYcCXnVJfD/DgSU6ewCUOE+GFZ8SRENIc1P0oVAgLi0Zv+IO5DRbozQ0m2lE65OSIl8tNfR1f8NN6qHusAdQXw9EHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5vhCaQuoPHrTWKSQ8Uiu1NUkYLc17vRqnhDL0hkDRD0k8O1Y5
	zUXAUFJHxjPuDJl4g3nWLAuamQ/YMiGggBE4Wj33QYDhJ9zM7RQBF/NsjbvAyBeMJiesRHJZpZo
	PgyXZb9U=
X-Gm-Gg: ASbGncuMq4Iopzx0Bx8jG7tD7+16CTcoFBEqC71G0nNg/7dNUG4a4w1DtqYjT4+jet+
	wSmakwzCrvS+RagDOGuoSLG8zMHogNEXR5rHiBO4wIH+7D1LL0dlxKxsovGfra9GF8X7B95RRNq
	IJ406wuwBMzJkAtG3zb1onCO6tDQvV5FdDNPJ7eB2DPlIh5NEOC2V97BuDhW3c5gjbTbyrmIM0+
	VF3r3MxRJm3vQFHDg4Adj+Z2cpkPA1feL7vgzefKHOJSemfHVSVx6wkCkH/PQfnC15CHJ0xaYUL
	JdsotddovpcV6y1hrjaJSwwUdO6Kqd8f0lnckX1HmnGwPTyuDkwT8T/8MZFTDlcwC1svBycyCNX
	ve8Vm8wFonI7FzwB4TWFvqbf/QP9fwPHY4rDhALMNmW8jwDHmIm8GLKcfXFnePNnR1oJOgzQPey
	Q+NrOOByLx7QVEIinb7PVBh0vucv4HZDMEK9R2D+s14u3zj5FxXq0=
X-Google-Smtp-Source: AGHT+IGbdEUE3PNoZYCS6NfJhqFXaPk0SnM9PnNIqtON966v5IoYDwxlU8rH3tGA/l00b+ZA3818Uw==
X-Received: by 2002:a17:906:6a14:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b50aa48c4cfmr690831366b.9.1760002288707;
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
Date: Thu, 09 Oct 2025 10:31:24 +0100
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOyA52gC/3WNwQqDMBBEf0X23C1JRKs99T+Kh2g3cUGNbKy0i
 P/eVOixl4E3MG82iCRMEa7ZBkIrRw5TAnPKoOvt5An5kRiMMoVWSqOPOuU8PlHIj3bGxbYDRaw
 uprRd7aoiJ0jrWcjx6zDfm8Q9xyXI+zha9bf9Oc1f56pRoXZ16VRtFLX5beDJSjgH8dDs+/4B4
 FuICL8AAAA=
X-Change-ID: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023131_018380_FB1D48FB 
X-CRM114-Status: GOOD (  12.78  )
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
Changes in v2:
- Sam:
  - add regmap_access_table forward declaration
  - add kerneldoc for struct exynos_pmu_data
  - update gs101-pmu.c header to C-style (Sam)
  - ctx -> context
- update commit messages as appropriate
- collect tags
- Link to v1: https://lore.kernel.org/r/20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org

---
André Draszik (3):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write

 MAINTAINERS                                 |   1 +
 drivers/soc/samsung/Makefile                |   3 +-
 drivers/soc/samsung/exynos-pmu.c            | 136 +--------
 drivers/soc/samsung/exynos-pmu.h            |  37 +++
 drivers/soc/samsung/gs101-pmu.c             | 446 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
 6 files changed, 824 insertions(+), 142 deletions(-)
---
base-commit: 78578f59c6d2d7ece395fa438c7c82a25c9ed9e7
change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


