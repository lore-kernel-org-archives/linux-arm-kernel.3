Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6B0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nZbaxd2WRcoQQt1caRaFSEAx+9Lny/NjRCBroTTZogk=; b=jRyIINbXu5/a0Z
	PRVdg3n/s3l/+InvQcZPxXmPNxQYrZ4C4ARdik1ea7BcQbe9uMfdYpeaZZ0QveP9N2Cr960dvk/y+
	dNTPsb24JRhSgxBhbWpRN44eFN5I6wK/vl868+v1diPUyMqKNPIvfHxCibu1RMd+evuavbT3J3sDa
	Hsp+qwWxZuT3S79pay7IO5567/eGcacQYAjCo7SyNChgsh9Q0v7UlvRZH5Rg1lrE1KTv893WAH3Ey
	XmwlLs90rAjdg0DO8yfqeMXLoWChMwxuklYsw+S81dsp8XXkS++3tatqcE4gTG4sUApqSIXIBNUHD
	poMtVbR+Oyz5ccmYUtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLHX-0000000Drc5-1neS;
	Sat, 01 Mar 2025 11:45:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toLFx-0000000DrIk-2fJu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:43:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1811858f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740829423; x=1741434223; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZbaxd2WRcoQQt1caRaFSEAx+9Lny/NjRCBroTTZogk=;
        b=jQx0SNdn8PbTPAcDg+KaoaGLDwzf3AxNN29VgeicqvTj8eLpUdSDn/NZV219GlGXDP
         YJp6BZSsgeP+oyiX3jf5m8INbxFSKqbXnGKiGJikL0KOl6KHohhPYx1VFhYDSlACMej1
         d/wC88MlYlfyLTNzwdJUZCpuIQ1aeuPespt+I60Nw9O8fV88+Aa9Fj6xbFcJyj4qJR6O
         Bfan08l8eo48MIIa2YpPEqoSrLPY+corIYnCKMa7/Wxu2/K7p3i2uCKfBOqjlvUpXI24
         V3nllgmycIqrqBEhsTCuHAKgorXi3QC9N9APnf0P9FkwJ0acF/Ux14HxDz9vnDylxbED
         7IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829423; x=1741434223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZbaxd2WRcoQQt1caRaFSEAx+9Lny/NjRCBroTTZogk=;
        b=kYKyfiOhsIuNI5mTD/jMYz+3rO8F1Tj20BjPUGReKKudyZTAIsctH9qM/V/2c/cYSH
         bYJucw+qhNaxdF2bOH1/8XzXiMfAiC8RWPr1RJ0Zp+7KyHgGM1Qeg3lkRjmRZdwqvVqi
         ECqTLVpedk8i/f/TvSALVsAV+aS01BNGmTD+gBov1mZrYu+0XszisMKjmsytqjYXvNqY
         C21ZTo8xWFrj6OGqKXUEufnNu80vZ7or3fEekV14Ovy/RolDw8l5EtklmaES50TMLMml
         0m5VF4mbGbX6xZ++R2LMA7gydZd3ksYGvXoVyXInEq5Ld9nipTCelZGAyHvwMXzOpXDL
         eRwA==
X-Gm-Message-State: AOJu0Yy0P2hvHLYkMGSh6fraGsPEAucpU2VlM4YWWQ1OToLYQw9aVHmZ
	CkhpFmhOGoOh+NWa+cHg4eLOOmuX0y+45MSoEMNp3DkPWRRob3Ml6+OIUKNetvY=
X-Gm-Gg: ASbGncuTNHjk8A2TWA8ofTIB+zbQr4A+EYuiFj3+LZzZi22SedMjnhnCOfqn/WjZke9
	ADnOR13/Zb5Cet3lOnKN7GwEDHBF6jeUsQONwMa6fsldTOKKBrgLShherTHZ4hNIuOev6wc51Qa
	D/89iOb1Kod7VTFKSqYosyom1crn2cwnzbhJtX5/C5P/wvjUh4SfsMZ0JFJEewbyNJmFofS/mwM
	uT7EqUSMsh93sIZ21MrxghmEcMj9bJMq64TWn83eR0iEoi/1j+m/YJaXRzkspWygeVXHTcyLceC
	+XS4VCLJPblQeJBdfoZCp7JBCQDdL5YSmInxQnxPdLui9kxSD8fn1CDHEKQVsaerxZXeyzCYhb4
	=
X-Google-Smtp-Source: AGHT+IHj61UYuOocbWw/qWMpr+RAho3zm2+puTeioLvnRLnuw4Nm2xW7pb1mJ8SKDz4411HtZ7isXQ==
X-Received: by 2002:a05:6000:1a86:b0:38d:dc4d:3473 with SMTP id ffacd0b85a97d-390eca384b1mr5985832f8f.51.1740829423579;
        Sat, 01 Mar 2025 03:43:43 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm8002871f8f.20.2025.03.01.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:43:43 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Sat, 01 Mar 2025 11:43:18 +0000
Message-Id: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfywmcC/4WNTQ6CMBBGr0Jm7Zj+QFBX3sOwqGWASUhLpkg0p
 He3cgGX7yXf+3ZIJEwJbtUOQhsnjqGAOVXgJxdGQu4Lg1GmUdooXDj4VWYc5tXHgOmVFgo9Gmu
 t07b1dV9DGS9CA7+P8KMrPHFao3yOn03/7N/kplEhte1Vqadxl6a+zxycxHOUEbqc8xc35uC0v
 QAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=evUvX4RMBfKC8FqkgyOYIu49UpyYWqsRchzfwT3wFVE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnwvLngUxy+MXzTvUcVPQf/Vn4XqYkl8kM3dwFf
 DmYVxaFXSaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8Ly5wAKCRDO6LjWAjRy
 ur9qEACDSxzR9tumJKwuhzgEo08hXMNwYrOiJWy/GhOTxgmk29YjAovMmjaayFfJqUgF7V6beFA
 RS8OXsLqcO17SXY0d8+7nvES0yXgElnsfTy5oWlfypPngGZBMH+Biq/7EvmLugypVzKweBk1eQL
 iRIFYE2ni3ce+dpFxDC5nTUXJ0B11DYR9t6EIP8Dct0YsYZ4NaCR9MWefbPleW80/Tk95sAaRdg
 kbOPiWLJbRUC6OMqxC4wv9KlsjaHY2QnUfMhbX3bekG2kSoZW3pr7oEB5wr1ZQfvzV4BF4rpJWy
 w/gz8M1oJe+mW43GReWWF1qlsMcmKbVFTbwSGOlnRZlrC7H6XA7MEm73BoNnV/dm4ujVKqez6KA
 tNTQbdaQz5/Arem/o4eNCTdcR7bAixbuhs59y5uF+iIL2ShlzZGtjYTfhHK3XpvmcS5Clwfws1J
 PKbznYWGc1YodbsuGi3reJJAAsT8vLDmSWc6HBTpWchXnF4OTcU5aDkMKwJSEvd2KlbNNQac021
 Xd+aKXq0mvd9gUZZUCUeUrC7itF/yLQNy3yHdDNVR4VJihubXy94XNjCiX58Phmy3rMgSq976Kj
 M5h01vqEECANqtD0xLX/F6NP9ybFg+t7xohWnoLPZGokCX5v/EcMtf5UFUh5VxBM33oUaPSV+zK
 CfwOuaI8VtCo3lw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_034345_683218_F6E2B20C 
X-CRM114-Status: GOOD (  12.97  )
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

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 293 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  51 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 321 insertions(+), 197 deletions(-)
---
base-commit: f7da3699c901aea6a009d38116d24c67a4c9662e
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


