Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D616F34C5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p/6HMiyt/iS0Y9mWjonqDekXe/RdLN17oaBrG39N3lU=; b=2oelVkzCp90L14sQOBUT3hWRgo
	JTY/5ksRiGktORP+SonVw22LuCnERvkZCfiu3mkHfHyRibAJq2369/j1UbD1kz5Pp8fj+XwQTqmnE
	Rnq63vJBCV8TdEKjm6dfjYEWwXLxUHpsyuT/wR+f3D6a0K1PCS7eq0m+HGWzFr4bF9CPe3PXAIVHA
	dZ64F53qa3I0+SDaz7ZJ+UfzYQpUejc8dMZoc4Q0byP1h6Ch9Wp8AwRPqpiRdgFklqrXdcJM6u19M
	i5oFRUuGoZ7nyNNVdl722U6X44OWPR+UdmJmXfACLzh2/XOUxgBG1q2Dne+OGJvN7nM1jvCkpAKAD
	jbzsmckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIeS-0000000Fu6X-2QWX;
	Mon, 13 Apr 2026 14:52:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIeP-0000000Fu69-44ZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:52:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso41948245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776091952; x=1776696752; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/6HMiyt/iS0Y9mWjonqDekXe/RdLN17oaBrG39N3lU=;
        b=OcVyJD8x95ZUzruE2iP86ZDibIbe2dSkcDHloLWi3DnK+UTOe2lBvG4vO5vTP3yA9S
         537TNJwSN3vD2qlt4lOQGYl6itJ9VzaF9ecqImH3m4lnuNU7Ge22bVDSCYUIk9jWyv7n
         DgvyDlzvn7FqyBjMhNDyOTSaFQE7Dte2AMC3mUMC7SwMSCfeuwCCoYwx6wO9iy7Xv4rk
         f9lDbVFvKV0srOqLkFzU56UWFIAylEjEuBnwBn8hMqUJG9vt9AoBMneHRwX39fImQzYW
         9UWLN/g0ud3xTxGYjKhi9e8uheTrOlhix3ru1KddnUF7/QXTCTn1EV82lfwgu48FEXDq
         qudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091952; x=1776696752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/6HMiyt/iS0Y9mWjonqDekXe/RdLN17oaBrG39N3lU=;
        b=qZlZ/tFfgs6kQjh/Dv5qq/PtrUr0qJyr0Yj3/RSacv0EiiB4NgDzLGOOUtIKx8pQak
         aPquwsCIK4QWpKL0Pcej9ltEbQwrYEbcNwqGujq3mZN83ZA/73xI8RLk2AoicklB6lDK
         YMjwNNkI1VolAQezgdy7PKP3JkaZ0lDxKYLwx1jtGAPg3A/qddIhjrButSHDU8CWhVwj
         CxSbFGtobWovyVkKDowsRfahaLsLVAoY1UN2Jsey3FzyFjqnGlxKoMs4Ts3beVT+eYtp
         TU8b60t90Drxa1k6koDo9bJcnErDrc2smaiPHaX2JOLtPnyinCO3sOfjnQtiNpZEHzLj
         rLSw==
X-Forwarded-Encrypted: i=1; AFNElJ9gpcSdsuU/5GGCrE/nJKut29Vzdj09/K6Oe70WQadUBi8hH47jU8sebyfIkv/tix6aiNfam14TwIz7bM6PeFJi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ybdL6WWjwD17aES0ivgPqP28syVsk/Rk8MkgumSkEEXfu1Yy
	JZvb9ERH2ZClXn0ljJykGixSPqXu4dSnMlgRi6dRroj27gR0Bib8z3TR6BfCBdf2svE=
X-Gm-Gg: AeBDies7vu28psX1SAnv6SKGrHF5OXC+ZhP5NM8ZHD4sViuuqvicKKIg0yExHb+uLx8
	HrI+kk6uHPXiIWPrzl/pDHLUUpf2sSFCnaW0bAv2DjQxDy/D2b1bpx9pHFgfE0wtuq6tVHRwPAD
	nL7ozc3N8HcxwWx4+GwC9mf52KgK6VVCuzLdY3F0ySBOyfkI6cOfQbPJLFC1u9M92FRhVLFob+n
	g8F/QZKXO2rEfVahu2hyO9Edwq2UwqHh0XLHVv0RlQok/4Sqyx0QgfMl+1oIicylB7yHcU0m6S/
	14p7LeHSnpM5VHrhJdCw4O31PnjcF9bDDozjXiy0X0V/N5JWuseJ+junSRKGRA/Iib6vo4T+yXI
	thB9dVQtokiG4MEQCBU/L+ABlCVutArCUJkhqRyn2s/ml8LwIDgTozPQEcxVsL4RpMAFs+HTyfi
	D6PM+h+rHuu8mnJVEjQM/jr4Xv8lcJ1vRBPobglO6zE2Hnsxisca/1I0neud/7jj+qCrdLBx8E0
	fGM6gwa9vA4iPcB
X-Received: by 2002:a05:600c:3b24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488d688d2a1mr187716825e9.26.1776091951590;
        Mon, 13 Apr 2026 07:52:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5344e28sm323015825e9.7.2026.04.13.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:52:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 13 Apr 2026 15:52:30 +0100
Subject: [PATCH] arm64: dts: exynos850: Add SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC0D3WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3dSKyrz8YgtTg/jiosRc3eREQyMDgyRLy1QLIyWgpoKi1LTMCrC
 B0bG1tQCLfvyjYAAAAA==
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_075234_025264_F1DCC9D7 
X-CRM114-Status: GOOD (  10.20  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..cf4a6168846c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
 			};
 		};
 	};
+
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
 };
 
 #include "exynos850-pinctrl.dtsi"

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


