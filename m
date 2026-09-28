Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BEDCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=; b=P/EKRDSfOvxRw3
	ZO8T1Xwu4y0x47xJ+mc+9Wzb+a0MFr6FlXB355YKGBFmw1w6ciokj15qcZUz4ayQDRz4vUcUdYPzT
	FWlRFjnMPWzGxmvnCNZSPqh4LsRNKIbhKEB4tjJTmgytX5WgLopbYHZTw4IVyZkREISEb/XwSli/U
	JxSNd2JsLikRiyUgdgXACK5IBijnkJxNNIztb2ey1kktwumatYbpERULUr2X6LN0D+U96cLeZYDJE
	7vsRh7xdV6mMGttzh+5NeWo04/jY7IvYXewaZfyqRUujeJWPxteD3Y6gwpKSlLA2SpwsFbf9dee9i
	J9yWVpxldwu+P7iaNU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINR-00000001cvV-17X8;
	Mon, 28 Sep 2026 20:55:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINO-00000001cuV-2Vrc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:55:07 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so8299225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628904; x=1791233704; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=S01e/U5sqSn2phAY9ZlS+EArAb+vMGfvz5RopA0RXfKCvHj0DLCwNoMFeHMeBZOIgx
         nw/h0ifcMtxzHkTZddPPGDmQj6A++0znQ3H3n+otZWvf3e4wBXwwKv/s+TfGI5n3yOU5
         XGPssccyImqB3OekV59MrC2FdvMasWzOwLjAWfIbbLvnHoVSZvRTACifxKp/I2OYq8RN
         T8DbBIn2adypoplOt8dpmiQAgQkVoJ+7TSC+f/GGeyxduyqhUfNkz2tF/3p5g/+caEmi
         zqYYt0ikXXc0bKI3icltlqamONByS0LavdP6vx+4c5pxyChMzjUcDsXZKh0bmVZM7DXT
         gpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628904; x=1791233704;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=W0mt/yY8WKLaLQoUgASByJ9xFhHjNlmDvfB3JJu/FFBMYOFvV50CGB0goKTlXVADkO
         RvMwKOw6SkHTv/4T+V8S6iT8S6fu0fa3xK/aHHg/gE+g6ldZW31TNFIjqLllWcIJj8s5
         ySA6SVgtsrNP4EdR6/zX+n/dmmpUJegc5nBN/3rFKRuJIMDEsDqXrVEjmb/xygk9F8Nz
         HP10KyKtfXehGwz2wu00XKBVugTUXBiimOWJIG0MM6+gqSWMMSwEaOoTR2uEK0hUEbpv
         BHDI8MsgX0Xprw5Kvf9a5/X6RQP772TmJUJMjvJSmD/LxDVxABNBvSjc/n5jxRRcIFiX
         0bsA==
X-Forwarded-Encrypted: i=1; AKwUvBxrWqf2B+fmsrl/VexJPQv8FuNU3185wczy3muqd17ibhy+bz8rjF27Y0heWUm9GdJAgse5TW6TBOmoPBzCE6s6@lists.infradead.org
X-Gm-Message-State: AFuF++lbbTNffFR4i7YzKAJ+nS9zoWixRq745od5AuJ0q89+vnjNYSzC
	ddo1BW4NNqKAiJpYymynayLggiRdo5pThiD9XzyWteokKRNleFpRed24cuSZMn4vodQ=
X-Gm-Gg: AYBFou2FAAA1ACgvjx9qtP95HEWRIbn7yvIu4aAck5QInnF/WCbcGeRzu+/Fc5z4NRk
	0/l3fUl0PQGh7oTRh0iK55zv/nnLzHnBb7b1isV2S4EzIGXpEsk30M6uacVXh63IMxdjV4+2so4
	7+eWsjT8sie+W+RTSZpiV0o6Cx3IoaDCNaJNvP/4vOl9UQDZNF+F8BBH2JrUd5kNR7sXJhLLQTc
	9e5CiIzdbnWyS7SKDoSDiPg28cNsjPPY+utRPXFEDSsrgXLZ4+mupctsdGLUiS/tcfaapaw5jfN
	eo8D+RTGxhzbyVAD0c/OUXp9QpZAv2LC4aXtulnwtMijplKtpM1CPoOe6OqGfMG1PI45e5fwvM0
	CuWen4F79Jfx7IxbcpnwXjKc9YsZiRdkCmKXBkId1hliUaXLibsXFY1YLPN8+3diprKgKCZOoHu
	I/c0byt9pX8c0uDsIOnX6v0gekk5rC2A3ttqcTACcoJXlwmvWZ89aYKbSSlXwKhuaX+IVATdbIV
	IL7t9pFucaMAHmHXeKvTlX1bq4l73DAFDZ8b5kZ0iobNB+4yijPBhh8VPJVUThJsAlkQs/7
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr175925425e9.31.1790628904029;
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Mon, 28 Sep 2026 21:55:01 +0100
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXUumoC/4WOwQ6CMBBEf4Xs2SUtBUVO/ofxUGHRTaStW0SI4
 d9F9O7xTSYz7wWRhClClbxAaODI3i2QbRKor9ZdCLlZGDKVbVWhM6Rxcj6WhUJbhw5blu5phTA
 +QvDSo7LU2jbXKj9vYVkJQi2P68Px9GWh+2M56r8hnG0krH3XcV8lwy41KHUBn+6VY+9lWuUGv
 ZZ/Huavx6BRoSmLslH7HeXGHG7srPjUywVO8zy/AVlusXL7AAAA
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135506_674154_BC3808C8 
X-CRM114-Status: GOOD (  16.31  )
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

With this series I expect for ACPM firmware DT node to be:
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

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 drivers/firmware/samsung/exynos-acpm.c             | 10 ++++
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


