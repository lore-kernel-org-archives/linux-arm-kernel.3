Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B95D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XhAt7LMsgvpB8v/kjOzoMgfr7UvUpv4cZmXKtrjIrA=; b=jTNoIoGNRdr/Fl
	tWnQgb+qMH36ihC2gRKWgymvsM5WWHu6osYl/rOqghFmmNIUzMwUDZaq5rmOmYhVkZ8I11LfeTNUK
	ZJhhYJXyEDACq8+ZfiNnVxraAZ6izOyVALglUXLJARY+mHgn6jWSH4Zeg16ggUWev+bnz8/NGHIRe
	xWQCi9LyUj9nrG0ddNFkavLaApQHWndRh2h0gVZjsgdGEQHtIkuTg5FvzyoQNDTJNH3ClFmw8yB7o
	nAoe2fN56TtdcREioVVPEOhqERFVnEebAsbHWf65tevHHPYcQrtB/abddUShtRya06R/AJGghLaeD
	bURyr1HbBZlHLTZ7mnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7Z-00000006wYg-3gTA;
	Tue, 13 Jan 2026 10:59:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7W-00000006wXb-4AsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fbc305914so5272358f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301969; x=1768906769; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XhAt7LMsgvpB8v/kjOzoMgfr7UvUpv4cZmXKtrjIrA=;
        b=DXBcNAtLyCzzbpjbaWRwgUYWWKx9rwCg2C82cWbMClZYj+zE6ZbyVSqpL4ZAz05/GK
         XZQrQpG7UGca1V797WxIm//0pa663wCb5IEKrrJMHkfdjdwPmkClAqOdIBOOD4zX08+Q
         GCWuvhqb1wZAAKElULWAn6lGVw41hJi75Bdb5CoBGJ4bQlNr3c68C+yW2WnWKuDMuPac
         ARPCjdhOtjs/81Y+mDgy63nS169+6EYEKoEl1BDoWEcOYhugOYaSGXvtsB5uqY7XS3uU
         t1A3gVkRuUyTgBOeTWqvnSUdhLlcDJU8r5UB+L9SRRGBRWTpfb531wezAtMcfEGdtoZa
         OLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301969; x=1768906769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XhAt7LMsgvpB8v/kjOzoMgfr7UvUpv4cZmXKtrjIrA=;
        b=BUcZm+u/809RkV4lw+eBs6phSTaGIKPovkiMUE14amujIlp7pyK8I92qoHF4wRPP6Z
         tRtlfY8hsy0mrcAqarnPlVK9B2M2ilaq/hcM6NH/HJQojMI8O2WA4pw1H6lL2zx+NwFJ
         fK5LKW3pIPzXgErn7D+P/sq//fCANosQxTO404/o8vnIFw+3np46/aOhbxbxGFP+ig0f
         n/kjm/UKk53tH2TZMuN5swO3/exHNYyhAAdq6Ax8w8b9qiwBesX/FlovemuI7SiGxQXZ
         za0G2mIhTtjRiPAQ+Wq4/beIs6DHu7RIv2LOH7yk9y5Qh9i7W7fHRA8JY1ZCrDuOD/KH
         OEkQ==
X-Gm-Message-State: AOJu0YyG8QsfcMd9CjZbI16EGIpVojCFPF9lAafsBnFZS9vF7oCDeYnc
	GLbU4jmRvwWKiwULIPjeVgYJPyXGDqbaVODyE7ubCeV70Zxfbv0sq+oQ6U/yxfj1VVE=
X-Gm-Gg: AY/fxX7ImBuohqxbzygmv8vHVAL7qbP7wxsBQf6AvK6Ntyg+phj38LANEY6vbJWL3Fl
	YHFSM8wP6BXaP6NaISlgWY8ouYYNmBbI4u4jCO4rLKMlVpwD5htxtvEcwnvS8t+KBE0KVvpzFa8
	CYiX4KBXYX1znJFk3T19rPytQ5J1zCSXXQdZjUcUm+bcmHGyMLj8NoACev76yF5Cx7S3kr400hk
	Ky7GsIBJwTN2BcQAOlhdVmvkY5o9VfFt17mSlhsIZp/3UHs3MU864iDACxWTZo1gMWHQz9EotGA
	imJMmzovJntb4pj+9PmExOlUNlsrKgpzXaUDmCRn5FHD0G2GXBnFUk/PC320ocmz+mOAuq6fWY0
	zNn9swhwyGF7WZSxJA5xrDYNswiwlXcCioWRJF7G+UAQadk9JiQ736N9DabQUBv2rPmNJlEWQKv
	WDpceNGCBCyreMms8yujZzxHr7p5QjyhbfAG52EzihfN8=
X-Google-Smtp-Source: AGHT+IHPP8E397ddDu3o9zgJP63v4IoEWOOqp/lbdVOOIhYtrhd91pvL0rOORIqkiDNS3f3ry5RnIA==
X-Received: by 2002:a05:6000:4387:b0:42c:b8fd:21b3 with SMTP id ffacd0b85a97d-432c37a756bmr27436701f8f.57.1768301968536;
        Tue, 13 Jan 2026 02:59:28 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/5] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Tue, 13 Jan 2026 10:58:57 +0000
Message-Id: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHElZmkC/22N0Q6CIBhGX6VxHe0HI7Gr3qN1AfKrLCcGymrOd
 w9trbl1eb7tnG8iAb3FQM67iXiMNljXJcj2O1I2qquRWpOYcOCCMQ7U9CMtW1feA8215MKAkJA
 rkoTeY2Wfa+x6+7DHx5iaw29sbBicf62HkS3r33ZkFChjAiSIIyotL63tlHcH52uydCL/uidI8
 sblydUGoICsMqiLjTvP8xsvu6O39gAAAA==
X-Change-ID: 20251120-dpu-clocks-7b825d05807a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=CHO2mHwrm92wINaWstQ8U09Ky5omfheOG0ViEni1uMQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiV2dj/A4la90pq8Wq3OcJqogArhyATRztD94
 Xi05WVnQ66JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYldgAKCRDO6LjWAjRy
 uvzVD/9eazRIIipWQcMIGhXHhDnbX12Xk7FphJC2LDJIasxsO2zJmF0JEiZItCVxRH6Q/vsPn6i
 2Tmv0aIg3rjiBz25ONamSVsBVWKnuQf3hbfwe+jxyL0LhS/quJG7mcbG44PvJUKv+c9RO7tGab0
 +fWWOfaw+o7u+tqLzdWPQmB7VibTRBZ1n4aEpFVXZ0TeN2N+XSfR2ZgMeCG6+fj7pViDFYqB9bC
 /LVv8zcm70ISlqZ/AmCj7w6NImCeRcW2D7nUs+5nvbGY/W2BzxDOJOegyskmJDwHzDJv7ytvfet
 pPGsbeVJQiU/cDaI66ioPUmJ/tsbX3ZsFijLW1XYrBquvoXwdRPor6uDXjNAqWT9eohCC8SC5yU
 BjH3VIN69FzboxL2IGduOZRPbRQ4MMp/SqL/T4Y5REhOUDV6ze9Qe9BnqfBU4aCXK0C+4eynj0i
 5mRCtY3KROIXtHW0Wby24JBMJmxP403ZAwgnwNWh+IYAzMYoi1dpW19f0JeJACnvTGaxvJVRqrX
 7KeHLa6wPbeFVl/U+udLk/DPDXD9xZhNbarn19Fki9nqH+KMalllC4T6YfNJnuy8xB1kQ1UfeoQ
 3bKfl7uAStXfVi4G9cGxbAB5YVI/eJfAkdT8t/6rmILA/re2QvqNq69wvw92KVCwxkDwu9PVbNC
 9egFCemFXC4tR0w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025931_071052_2E8C9C98 
X-CRM114-Status: GOOD (  12.58  )
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

Hi folks,

This series adds support for the Display Process Unit (DPU) Clock
Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
the IOMMU and display enablement.

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
- alphanumeric for cmu_top children in .c & .h files (André)
- collect up tags
- Link to v2: https://lore.kernel.org/r/20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org

Changes in v2:
- Fix alphanumeric ordering (Krzysztof)
- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
- Fix dout_dpu_busp parent (Peter)
- Rebased onto next-20260109
- Link to v1: https://lore.kernel.org/r/20251120-dpu-clocks-v1-0-11508054eab8@linaro.org

---
Peter Griffin (5):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         |  21 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 358 insertions(+), 1 deletion(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251120-dpu-clocks-7b825d05807a

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


