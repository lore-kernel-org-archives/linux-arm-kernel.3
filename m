Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F28CA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=; b=ZcZXAqa2dkHXTfdOV34GLRpJXv
	wIE5zdsDko9vdPuc/RAkJ/TOzQEK3ftS3msdiMnp+WqYpdV5lm/AT4v/zqrLg12PYxPCo5YO0dNmy
	VpPrHp6gPotKgUw7R3L3tBZJsNndqhA6ecd/rFHp3JrqeA93kHZ4UER+XavCb3bHFy/pMuDWNztyK
	KMFpOGy3cea0zM2NRcOxbk9PErFAyxij5c9L5XFW++SH9MYUGxJohA0v9tgAYxK7qyIBnMZHqil1g
	zP6f4Wkp2WSYRxlSVNeXvuh+4eg0/i/RpDIzGplCMl1l0DY2WD7Y9ha21GAjboQNjFO0R2LErYtZl
	TzzaBZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINZ-00000001cxZ-24zQ;
	Mon, 28 Sep 2026 20:55:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBINQ-00000001cuq-0Gq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:55:09 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3920so25917075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628906; x=1791233706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=qIRMMure8d59RcC13U60T2tUjcCy1dA1b29pczJ16xqFTCQs+yA+iCdg1N4339gl+9
         GiXxTbmzSUtOO67ke2emIsHA9SoJXqz42Iy9dyp3LBftMIpS7aebNFAvhdRPyD2xgSl4
         bbpowITg+zU9KShEe6Jr/+n3Jx0az7x8vLH19nGvDxQNsBE/lFEG7ulZ91CDAUtBaZMM
         nhZ6Srs1yLH/O62XbHClYSQ6ch4qt8NDjCcHrO17xAO2q/Yw8z4DKGRavTeseMS8TBc9
         mImIECpOEIzrKtBulqtU67QRx0sCh07M0QiUAEg0mJZPlIhdbNWItboE+5Q6l7ZbzDc+
         bMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628906; x=1791233706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=IbsQEJyFjca5it6dUK4tpQqZYdYrOKuyehxePpKM92uiW/ECXyRsfkUj5alab7ewoZ
         SwXiWX9npE34anQIYlMbna8copeCsRIBNIVDRqT842YmXmTJGwSzehAKdVuOKH4CecbB
         M20xok1aODHp8TdiAPBWxqSMK9Qd+xBYKkCdxD/JHIvBCu0IbYM4l8TZTR8RkMz5Ubln
         O4W6PSzi/FXflztrxG5W8Za4dmNzZFce+1p4sZJOwItv4je9YHdUzKXLPK8gXrhhUtl8
         HMLmz7Hrr97o2i4olpkrWQROftUiMWY6po/a3qvhXzRdPOabNMe4xv/8cpbTWsg2EwJB
         l/bg==
X-Forwarded-Encrypted: i=1; AKwUvBy8C0nnW3WiIAXfoL2Q5YkkICB4ialgAvi96s5vqFFTfYSscakrb3chAdMeEI3CC5gH98DbW8PPZ0pxKnq+AaSg@lists.infradead.org
X-Gm-Message-State: AFuF++k7Pd6oe5I18TqxWJkzHML3BON/ExIY1iTYJNnD4/RZtgpDCPYQ
	XrB+ckbna3JxhQtBBZ9JaFNBnYWZQ3a055YcHbidNmnoCHfZ0BW5R7vywkKo2udDCHM=
X-Gm-Gg: AYBFou27hL2FS9Er2HAaWqrK42dTblqNNtjJEbBb3NY0t+Ni+1crwGNgKFPKLBHSUAW
	D4bSoR6aQY7rcWGzIr9Y3lPzm9vxSvax9shh8Jw/eLFbdX+P5gc4yvGzNioTINmN9AInj1zAAUY
	ETItffd3fsKobx4Vkh33A3y0JhTTD/37mgkqdS0laLxZco8jIPXljqKOiH+aTPUI06Y9Q/hR112
	ufS35jqTtDpEFsKkYA5j2otH/eXlvPG54Q3qAKBsyYWw38jjfA5e+efcknFY6VNwleAET0ZUA4T
	xq9aln9Uf11xw5ccV3aI7zfMy5Dx1fbUH6dhuoO42SY+VFECWUnTjIrTSZc5pYqXiRoi6z9nMPx
	zJwEYu6b41tt0HQ3/nnN/gdhja/gk/o5Fsjj62Ovk53UVpXvGjTi0Ihki7mq4lkA0QrDYm0dMvY
	YxDbK+Mq2dgfmObpQH5HtoHX2cQi6Up2r5b+Y1KcbXQOw5aRdt3UQE+taIX2CTbxl2RUsm14oFO
	O5nA6wNu4R6CyIh/bCmqrQYiFb5QZp9zOYib21CE1l3Dc05dPqffNlxyXzAxg==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr97168395e9.2.1790628906389;
        Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:03 +0100
Subject: [PATCH v2 2/2] firmware: samsung: acpm: add Exynos850 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-2-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
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
X-CRM114-CacheID: sfid-20260928_135508_121714_57460EAF 
X-CRM114-Status: GOOD (  12.22  )
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

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0


