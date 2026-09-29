Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEA3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xcqkEPYdqVvbehfVnfP1K4y2ZexuDH7FdOmjxY1X/hU=; b=PPJEj8mF5D5g1u
	cB89txJaRNtFZeQNFNbGfIP3MMBsBzQUuSA44j3k09JtA+dlkbMOfHSb1Zbi4x6qVbxhycXhsHUQa
	mZIwlPJp/pjng3BJ3BWWw8NZuuJhND3FoHM8JjfyWYWDpIigjFXR50OD0cWmaeHZr7h+akcJB6Qjd
	VBI3VckiM2X5AX7DDjqsXmj7LbHDO87o3P3bojWz0SbpCauJafk9johVT0JTcmrd7wrlYXS4rvNoc
	htMEU1y1lKYfH2xBFitttygy0qm2oRTVbC0sxoPQKFMKfhaGHtQBiI9OEGgjAgO+pMz+hhte5yrFb
	Kv3YehJ+LKsJ2VfqssKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJV-000000026cR-37gq;
	Tue, 29 Sep 2026 02:11:25 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJT-000000026bl-2VVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:11:25 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so2294905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647882; x=1791252682; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xcqkEPYdqVvbehfVnfP1K4y2ZexuDH7FdOmjxY1X/hU=;
        b=stL/G6e1juYGs0Z/ehCGCaAtRulm6YUXUfxmetmUl1En+mDqH0rYcvSnKwZH0LV0TK
         0Mqn0qyc+L+E8jPJZOfVB5ovr/FrPierzcw5Hn4RL85TWsvnXJUs7QHwS0t8IyM2mp2h
         r0JULYsWYZl5u40UfEY4JjnTF/Y0tONP8dBR/vWdD5CLxX0uuNqe1dMfNSuxsSuc6exT
         Uq5X0gKZDAp7seVZ2P8bXZJmHpvtnSll0pWQF6ZgQfwnYEhtxS/eCC3RkmdIVSKpytw7
         VM++cQcM9Mdl6QwOAFZyahSUQ0nopygU5xBMP7Hy228wpO8xPkQqA5Qk994/+cOy7OJN
         OtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647882; x=1791252682;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xcqkEPYdqVvbehfVnfP1K4y2ZexuDH7FdOmjxY1X/hU=;
        b=toBzb+Ju3YF90S72XBnpuxwqUIqIXOJDYhOkPQNqa4TL9DzQC8Wwuky1lbQpqH0C3L
         80SWvt0DcO7LT0UYrGISrcRIBJQFFS+3PM+aZm3TqQPbcJeWwzlS/Jf/8BauKTZ0GFE3
         L0FaFBTNeD93tRCFAQL022S3Q826s5cXV8GTAu/eQrUWiJ1dbvNt0EfXqqUBxtYvVflE
         uIP6VLgxjhDQWDxUit6KtVFnfwCWuTjAZxgSI/Iafodg8g08jC51aqpqFS9atwU2P5Cz
         Z6vdK8x8Qj2dIFn+fgfFP5L1xkVb14g3mr520Sxi8Up89bUAI5xG0b2PzcwLya4NXgx/
         sc3A==
X-Forwarded-Encrypted: i=1; AKwUvBzAyM9OpbCr05GhtucxuapNkl1VFasOej15UomnZYhXhWkxodyCfiEFRXEGsxYqkATt/3Zg/30PK0gI3ewFrxQR@lists.infradead.org
X-Gm-Message-State: AFuF++mtdhZ3G2VgR0oDAJWtIiwALydwpLzZWJnBxnzd3dmPsRuom5CC
	Oic5ugpaGkaBSnMSbXqKgPO5RtfC9zDpBqecXeEWt3snio2BNaoGmszq5YOunG9ObRHVHqQ+UTg
	ThoMvlEY=
X-Gm-Gg: AYBFou08O09sWXqq2973TdXM+A3xuNWapW/0sVPnQeGI+U+D+lH6VE6IjMMxQV3N+BQ
	QwgchKw+JhqW0G5cO2bCxjRVTBL5SG1i4jK4wGaJWKjZSmaNhjlqcuqGBl349SWYjRmXIUFOCNp
	HRkycAFH5nFcaBhuqy30Bl1ZCbu4qPgDf1+9rwHxR1UwdZvakkBSIfX4SFZeNeT0UhMkTEUiTdk
	mWPHK6EjSNAOHwaaAQK8Mb8DbTElsna2li+dByEXJZDxRB+5cs1iLs7GTxXeG+5DgSJCQlV9E9S
	gi5Lvc0X9HMl2QLKUcQ3JJ/6rl9v25Fk9xnU6hV3fq5yZLYcDstEqEEnj05Ot6pl+iYzsH4sLu+
	3ykTUBIZyYNb1jGS3VGh/HjAcBOQ8Cund82Ehygpb3XcgL96WdAcg7rJ05kLRHZZ0Snx3q7D31f
	R2pBvPYrrXjHVh+zTKu0hUEtnmdMXAuOMStSz9PdMYzrlbP62Rjjx6j8tmeGHvYifCdavL0ofbZ
	pe5pq9R15wm7KLaFjQVdhzZJE9HaB5Rzi9ocWwBj5vVKPz/VJ7buOD9zlHDSA==
X-Received: by 2002:a05:600c:470d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a00d778efemr13043205e9.14.1790647881718;
        Mon, 28 Sep 2026 19:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Tue, 29 Sep 2026 03:11:15 +0100
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMeu2oC/4WOS27DMAxEr2JoXQb6+JtV71F0wShUQqC2XMpRE
 wS+e1WnQNFVlm8weDN3lUiYktpXdyWUOXGcCriXSvkzTicCPhZWVttWN8YCXW9TTH2jAf08QmA
 Zv1AI0mWeoyygkQKG2uj60KpimYUCX7eFt/cHC31eytDyCNUBE4GP48jLvsrdzoH4Rv10z5yWK
 LftXDZb+feHe/ojG9Dg+qY/6qGj2rnXD55Q4i7KaZNn+yccbP9caIuwMx16CkPdDvhPuK7rN2A
 at2pMAQAA
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_191123_832611_F42F5C1F 
X-CRM114-Status: GOOD (  18.27  )
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

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string and adds clocks
descriptions for clocks that can be controlled via ACPM or by Linux
directly.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes on clk-acpm exynos850 series
which seems to be accepted/merged:
https://lore.kernel.org/linux-samsung-soc/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/

In v3 I updated the bindings to be more forgiving about missing clocks
in DT to be actually be able to implement this in DT:

firmware {
	acpm_ipc: power-management {
		compatible = "samsung,exynos850-acpm-ipc";
		#clock-cells = <1>;
		mboxes = <&ap2apm_mailbox>;
		shmem = <&apm_sram>;
		clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
			 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
		clock-names = "cpucl0", "cpucl1";
	};
};

and further add cpufreq support on top of these clocks.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- converted clocks requirements in dt-bindings for e850 into enum instead
  of consts, and added uniqueItems:true -- this allows to declare only
  supported and tested clocks at this point;
- Link to v2: https://lore.kernel.org/r/20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org

Changes in v2:
- Re-worked bindings update by adding clocks descriptions and hence
  re-wording the commit message and adding constraints for clocks
  and not yet implemented pmic support;
- Rebased and re-tested with cpufreq;
- Link to v1: https://lore.kernel.org/r/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org

---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 +++++++++++++++++++++-
 drivers/firmware/samsung/exynos-acpm.c             | 10 ++++
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


