Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D458C36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EkkCTZBIAWTTIL0zgzo8V5WU2QfnJ7YXlyAxklDZZHE=; b=iq4zJp/kf73eXw
	z01snVwZaYwOLD+6EVSVd3b/W5HGrI2+drB1tDgnWKo1ptQOwPosWg3T6r1UAf2D9Dr6hx+z3Pkyg
	tTePOdKi0Ollg0VVGG9sJvqzDg9SrBL6PwcRLajeVB2G/ttsC68faMhlzDuRECs/Zl1MAtWeE1Rz6
	ah9FlGiYBgHv1Ua4rFq27MIWavFmEUz6/DXRFjbZyFPDO1QR1QDUHXJ+XgZiFTlHdQu0SVVFj8yfr
	qrgiu9hedqDyXgxWzixcFMzP80ftOjDk1kTtmvYTiGDCKtyHVW5X8epbxSNpmKkzkGbXmssiOfnsW
	ZT/AH6mzfoyfMXMPM1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmmR-0000000AzNt-1DHk;
	Thu, 27 Mar 2025 12:56:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmkh-0000000AyzY-06TB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 12:54:32 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1584600a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080069; x=1743684869; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkkCTZBIAWTTIL0zgzo8V5WU2QfnJ7YXlyAxklDZZHE=;
        b=DYxF2A1EUdh32+2lKhm8AZWxSWvXQRhfx7kZVN+5hAViQ5BT3InbDVl+OG6RoWuZET
         1P3nrZppUMNhiJDMwJ5776LGTXG4GkHGAsEhJOivzPudW6ontCzsFwHg6Myc+UICoBI8
         cUN69vWxA+7GwjscW0UgxbEzziSAdKTZGsIWnDFyf7U6Vtvp2VvLhCogubaw5yAkiWYq
         54rMvm8/aMaZV2+TOLDBJnGd2+tAYzxmwtDkIT3sYSM7tYFyJU+CWXf+9lhYs/wOmQ2t
         clM5hkOQBjUGEIvG4+lWlFQOFjslsjTWmNHNXYBctXY2sGyZnRpmEPkwpMpi5BEqU5k/
         CNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080069; x=1743684869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkkCTZBIAWTTIL0zgzo8V5WU2QfnJ7YXlyAxklDZZHE=;
        b=bOsQ+mu2g3qlElBWBjNgDv+XGIT9WsskmKsRIshA31xY0V0Xbej9I9Ep7Yr4iPJQn5
         fnFimuKlSfx0AFUf+it/4L4EsTe6Ze8uKZcTLH1CyX7SLgE0yXgKikcDsF8gg3ow6bSV
         hIklV1ioKNOkKu/PEObOLJWtmn1V1+UlNWKXdDGJehRZeqdIU0pKeMEnvlwagmgSZ837
         pTrWkUv2Kjx0ox/JxvmvaAyhX2RZyiLERsJCHl/HdkATzwhMNabZ36PyPZJ0DWiZeOrL
         aySzJBFzNq/NnZMzQPsCajFor/GIMxaiDv4ry/k+qW6clYMOFKxGWl9U+4eY1L2zoHFr
         7qhg==
X-Forwarded-Encrypted: i=1; AJvYcCWvZFBIILKFt3cRzHXDvz+3g+MlwpZyQfOTS94Wkt4UjWtMFMlHPxpjeiut699jjnL+IvzU0fYlHzSz2TqTLgq4@lists.infradead.org
X-Gm-Message-State: AOJu0YyWcE/bAzjbqDDeTbkP8EIHboLuSSpoXhZQEuw9UTwU1yyk3gd+
	mPjNemspeXTTUI7ybrWosFsUFQ6/qlK1pToymq9w6Q36Ff+oLzLLGI02Br01lew=
X-Gm-Gg: ASbGncv7SSx9dQlB+3b9uAwAjplqsCNa81W6bobO1pGWp4q5dNd8HcXsDoqF/NppI3w
	2H/1hVP5C5S/cxQDbmwFr5nBwu5omlZxvWHmxgfQDeeGJir3aug4zQVGl9EdN67QRa/tailDCeG
	QC1msjc0OWGs/6+IQz2jT8i6d6s74yPJGec1E4K8tNmi/YdNA+Hjk+GBqlc7EK+FMLAME1qByDH
	EHCIjXo4jOrMYWUAH7hVA6vWbHwMVCeVd6JgFOIRV7FavcVX7fDDavhDtOFNswio9s7WDk0j4Np
	I9bgi5Gmeyg7w0GF2Vbgr3iH/9KP6wtKU00XIDrNemXiixFxSAkj6VXThly3a4SJ0QwnrwljNtY
	aWcZVPuNJqUeVSdB7DhyeGKl4cCzu
X-Google-Smtp-Source: AGHT+IEVuF11DqXI4fu8QPcna7hms3onAO1YAcy+0T0YnqsvYmZH1rxVRZNLDer4YXPTGOn0rM72Vg==
X-Received: by 2002:a17:907:940e:b0:ac1:e6bd:a568 with SMTP id a640c23a62f3a-ac6fb142aacmr283746566b.37.1743080068712;
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks, etc.)
 will become children
Date: Thu, 27 Mar 2025 12:54:26 +0000
Message-Id: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIJK5WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyNz3cTkglzd5IzMnJSi1Dxdc4Pk1CQDQ2OLFDNjJaCegqLUtMwKsHn
 RsbW1AGvVOHpfAAAA
X-Change-ID: 20250327-acpm-children-70ceb0138d63
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_055431_072052_F4CED170 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
ACPM interface.

This necessitates two changes in this driver:
* child platform_devices from device tree need to be populated here
* child drivers will need to be able to get the ACPM handle via a
  struct device_node, not via a DT property name

This series implements these changes and is a prerequisite for v2 of
https://lore.kernel.org/all/20250323-s2mpg10-v1-0-d08943702707@linaro.org/

--- dependency note ---

To apply cleanly, patch 2 must be applied after
https://lore.kernel.org/all/20250319-acpm-fixes-v2-2-ac2c1bcf322b@linaro.org/
due to touching similar areas of the code.

I can merge that and this series into one if that is preferred instead,
please let me know if so.

--- dependency note end ---

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (1):
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

 drivers/firmware/samsung/exynos-acpm.c             | 25 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++--
 2 files changed, 14 insertions(+), 17 deletions(-)
---
base-commit: cc024fd4c6640be5e2e0989cc98f2c68e31289d5
change-id: 20250327-acpm-children-70ceb0138d63

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


