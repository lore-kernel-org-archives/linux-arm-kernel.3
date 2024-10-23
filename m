Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47063D2E02D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZZ8g03ccexKW0AVt0r8Py0OQvrq3R4oM4t3ytFYc5w=; b=LZ+vTzFRn22WFawZRata7YCh6y
	MN/esyi+KLfx5hQvQnK+3frEbk0M0BqcjPyTgtX8rDQojPmC7At9XYR24esgMn/SazYMZ+i4ujh3M
	as0nN3T3qP41Coj2MpKeTX+eNwku1rUfywxKHJ07kc4gZqVtGBVIlmFbqHp1gcF7/tExTOYOb/jaA
	DEgOGci/aGGZBVSd3biau5NlGGwhouK4Qw6xJ47K2fyVQU+fDAij3YHX2kueRKDMCTqY/7Xy8E4PN
	dc2ggs+JDprCaXtHduc0z0jby+RezKc/QK6hoF3FCQJfqXpro7gj7h0hdyCd71FGX8/H4HFGVe9fj
	jyO6gnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XUp-0000000DkoW-2G3f;
	Wed, 23 Oct 2024 09:17:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XFP-0000000Dgbh-3hsh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:01:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso751919266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674101; x=1730278901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZ8g03ccexKW0AVt0r8Py0OQvrq3R4oM4t3ytFYc5w=;
        b=ZWE6cYyk0qN0a8j1QKJizwNCpOFmiHxgkSnTTIf8q/ki0xtBCSH2Dg3TFBpw9d6pj0
         IeRPGxtsyZuNOkgX+/NqhR8yp1eF80g8uB91p/j+Uv6otGatTrk/p1fQr8okaHeco2KU
         4Xsk/Eq+xTs8N6Ro+DzzNJwEywPgNGynmk637NVz1JSJnQM1DZGoCBrWy5nf4s5veEt2
         pW0iPcwl0pXUqiwemYdh+WdKtpnOA2vfwS88d7bcLMVPBorowdfnjPZ9ePqU/vpbFw3O
         jOWLwZwo22Zb/d3mb2caMG2DFlDKQ5fgC6RaTJJTdC+R1cyfFDx2gk3/8ZB803FOgDBD
         YMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674101; x=1730278901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZZ8g03ccexKW0AVt0r8Py0OQvrq3R4oM4t3ytFYc5w=;
        b=a6ghKLYRGKPaAovksai9oRK8bL+dP62XbrZcwXVcSnmd0aJbeAx/iBGpKIbGIcEE6Y
         J6fRKXuU4lj/tv2sfrqh7CJ63X6ovNa2DXThVBOOUSBd2WhT3p1YczZ7QNwPsv6lIG1v
         4spflNs40YB+f5+jGr8cM23YqIl7xUqXpSG4RvNAhQH3BfYmJJUstq05/Sm5XP4eLn6q
         fEogmzhXoL/I2SU+LYJAthOJKSufsjQJ6gduDbq21MdBJdEKYv052Th2jj8zV1DoYIq0
         VY8GUwQEQHIdUMEOAfAdp0UFLXfmCLajGlp2zD7zFZsvm/m5u+lKwigWpEirFqOoLOuO
         OBhA==
X-Forwarded-Encrypted: i=1; AJvYcCXjsHF3c3zCfb0sxv2l7zbm+kiq4iDkIxa9T4sWLqKMQvwJCC+09XbebgtQEyc8Y92ZqzVb+9UqzIZGILle2B2v@lists.infradead.org
X-Gm-Message-State: AOJu0YySY9SU25kbzDugd2KlllyjmzjOM3Zs2Vcpa/KPTQ4WyIIsle1X
	Kjn0Y5owGNfJC8oWkasYc1ule+zJrI7w2UE7r53qg/FkxIjMz6f+Swk0aK6g
X-Google-Smtp-Source: AGHT+IFnhZOlq5eXPBtpu2Vh+a+dV/cdp/AY/xiaG+pd+XArp9A5rMI/bDwXWr5Li75rBOIWXMD7tA==
X-Received: by 2002:a17:907:3f0c:b0:a99:f656:2bd8 with SMTP id a640c23a62f3a-a9abf91cca8mr173667966b.42.1729674101140;
        Wed, 23 Oct 2024 02:01:41 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a23csm442767466b.205.2024.10.23.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:01:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3]  clk: samsung: Introduce Exynos8895 clock driver
Date: Wed, 23 Oct 2024 12:01:33 +0300
Message-ID: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020143_950474_DB86C3D8 
X-CRM114-Status: GOOD (  12.77  )
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

Hey folks,

This patchset adds initial clock driver support for Exynos8895 SoC,
which allows clocking peripherals like MCT, serial buses, MMC, UFS and
PCIE. As platform support grows in the future, other blocks like APM
will be added.

Support for the following clock management unit blocks is implemented
in this patchset:
 - CMU_TOP
 - CMU_FSYS0/1
 - CMU_PERIC0/1
 - CMU_PERIS

Changes in v2:
 - Drop headers for CMU_CORE and CMU_G3D
 - Drop Sylwester and Tomasz from the dt-schema maintainers
 - Alphabetically order compatibles in dt-schema
 - Move the required block in dt-schema
 - Rename clock-names items to follow the one-word convention

Ivaylo Ivanov (3):
  dt-bindings: clock: Add Exynos8895 SoC
  clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
  clk: samsung: Introduce Exynos8895 clock driver

 .../clock/samsung,exynos8895-clock.yaml       |  240 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8895.c          | 2803 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    2 +
 drivers/clk/samsung/clk-pll.h                 |    2 +
 .../dt-bindings/clock/samsung,exynos8895.h    |  453 +++
 6 files changed, 3501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h

-- 
2.43.0


