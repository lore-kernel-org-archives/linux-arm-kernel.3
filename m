Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91B8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d6XLJYbI7HUMV7gx7S4Fj3cUrwWbeBAJ9EUdAHuqM6E=; b=c9Rn0uT9TAbItS
	MTmQL+9eWKBjuTkvDHHlyROfiVuWVwhJqRIR5w46JbGqwa9G/In6G6Izx5AUrKXGq1A6+GF0m38od
	+b5HVTJMnCKXruh8eAT+LhBxdCxVFTVOjpMBBc/v8HoJ2eIgXBf9T5L3pEIqkiPRKX378Vlhqkvhk
	LBpgeTnx81QHlbWbbL4mN67Cpxqt/vcVSo9XoocprhXnazG9nM/+aXJGbXZtsdYvq5LzjmpCWoyzd
	bTCc5VOMyEWkoBVu+qyKfAId71lLEx2ZJS9xVuUV/8vRT4Sute8KYvjaADnB8TyB0LnLLC8eL+vC2
	KxfF3bxTHT4iqGfU0kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Af-00000007dyx-4A5B;
	Thu, 01 Oct 2026 03:09:22 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Ac-00000007dx5-27ii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:09:20 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso29935415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824154; x=1791428954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d6XLJYbI7HUMV7gx7S4Fj3cUrwWbeBAJ9EUdAHuqM6E=;
        b=Sx98xYHY0N3lM2tNoWdVJIb0qY+0nDa63iOKaKqgC7JIS2+ZIPT3A1bcK1/52cUtcx
         BNe92nQPBWggnwm9J2O10E/+CsTuDN7nFqpvYn+l+3lArnssjOtIKhdU/opvq4xWFTk9
         Vg+JkHkG50IBDfYg3EkoKBgdUmdlUeIsEmzVqbwLTAZKUNTzZFQa05JeTfmEM1lGMhqc
         77Cr+lMkAyxKvCFkuL7o+He1zF5EvUyYpeaEPQVWp9aMkUB0DTPZBZdeagNuNGRlD5bw
         qGmlhvi4sXhGBWMwxHVP5x+u33Th2iw3sCp8Q7OLaP/fVN+tbokbqlckhEEsYuuAW9ax
         TyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824154; x=1791428954;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d6XLJYbI7HUMV7gx7S4Fj3cUrwWbeBAJ9EUdAHuqM6E=;
        b=iegrXYPLHihtneKl7f3TYYUgLpp+udPBq5zDxwn4n8xg90qYwa3gl1OWUhika4RJis
         TSfSCMBNkgvSJnTsLP0mEVPa06nIX19ZboBV9tKRKwWdvNhEfPbkjWrzNnuDZBqtfIjH
         N88NaHi3+Vlxp2Dw3XTDjHK02Nhmg/qNUUdSMCagay/95m8lTRjf9dFsvXPkREXOSuRF
         sHc217qppvBIMwOluKK7MHVYxGXr4kpeVlyRZ5B4jDJBc2peq+cSXR1UD83hlMaSkHpC
         3Pzta/A2ffogFXwgeHk7BL/0tM4gVlaxy/jaCKunDHs8jN6kPpjAk2wkpTVzcYRsM4o6
         mEzg==
X-Forwarded-Encrypted: i=1; AKwUvBxVAsI3C3oyzrifomNjb/O2uew9yaZwcKlz6eeqsNdqeRTZdpx+QzCp5Hftj4PotjPUSE01NenoQUT6+fjYFzhl@lists.infradead.org
X-Gm-Message-State: AFuF++l4UDvZRj8wqvn0jIdQFF6Wwy0il6RjQrUUV6zwBlYOz8ffZIhM
	itHooelPMuw+uNRqsASMdLwMf4YdCse/eryX09IbPvV0kbr/QPQKbqJAqb09KyXKOoo=
X-Gm-Gg: AYBFou2bg6qmM3LbyEkpVl+Vna6w2XPLiPeMUpLz+XsgKsPIHzhWUtxW9lYxV6p+Fkh
	Z5QWy5QJkz/CIYsxkB9/cI41OyW7lPAkYU2dDfin7QDgCwMWUXLXxPCodyTKuZTb40zfJwhi+7q
	zT9aqyu0JBb9HITuVu10swCeDv3XG9D4DBEeC6YXFBKaR+E97+vuxZeoW94hMAOsGnzQLjwr2q2
	mFbxyRVn4GO0jSCaAjomneALhBjmoQWDbX+lw/Y5ABbOF4KsA4fw3iwGTyNghXUV59pfrC3UCZ0
	HtlXU1Bk9FA5Pe8TlUKj2FCsMmZn1TaIJ8KvYJiFZ8UDEu01kbDdb3vpiOughsde8UzV/VO4Lk1
	07ycCeGjN3Gxgiu+1d5f25nvnceZTXDZYLiyyXBehYFlv1Wow9yy6lv/EvVkAONO5a8m4HOehU+
	8J9THtBxXPwIkNNfNwovpUBUyOFkFUGb2eXOWl6NvH0tyIV8XlY5pM/F6NXbduSlNagraWZ0GIW
	j2vGZtLtp0KCyGVnV0KztRpBU7KBO8BR0FKjGK5MECEHyy1yjE1dkjZlwJYqw==
X-Received: by 2002:a05:600d:4448:10b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-4a01b11bedcmr39473525e9.21.1790824154410;
        Wed, 30 Sep 2026 20:09:14 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:13 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/4] Exynos850 ADC support and soc thermistor
Date: Thu, 01 Oct 2026 04:09:11 +0100
Message-Id: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfOvWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwND3dSKyrz8YgtTg/jElGTdJBNjI0NLS1NjC8skJaCegqLUtMwKsHn
 RsbW1AF3fQIBfAAAA
X-Change-ID: 20261001-exynos850_adc-b4321995389b
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200918_594410_249F56C1 
X-CRM114-Status: GOOD (  13.42  )
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

Hi all,

This small series adds support for the ADC block found in the Samsung
Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
development board.

Exynos850 ADC is also called ADC v3 in downstream but my understanding is
that SoC names are more prefered.

It also relies on PMIC 1.8v regulator which currently represented as a
dummy one.

First commit adds compatible for device tree bindings, second one adds
support in the driver and last two place things in device tree files for
E850-96 board.

This was tested on mentioned above WinLink E850-96 by reading reported
temperatures from thermistor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (4):
      dt-bindings: iio: adc: samsung,exynos: Add Exynos850 compatible
      iio: adc: exynos_adc: add Exynos850 support
      arm64: dts: exynos850: add ADC node
      arm64: dts: exynos850-e850-96: add soc thermistor node

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 22 ++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 10 ++++
 drivers/iio/adc/exynos_adc.c                       | 66 +++++++++++++++++++++-
 4 files changed, 97 insertions(+), 2 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20261001-exynos850_adc-b4321995389b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


