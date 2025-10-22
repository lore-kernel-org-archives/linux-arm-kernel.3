Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3906CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6bRIK7N0Lc6wOEz1pBT1Kkom/tSArzPgk5+y4nbPsU=; b=CP+9TbEy623AQmbZUWduymXZDi
	pIFe1rdcf+/ooIsuZmfaYsJvDDLeqLIrRtIEQhvEJBEapWOgsKQkvdQOqEB/OgKyX0dFCsQcpco7T
	lot/PkV07+CXsOvYoeF20xZMHqSMoILpOgrmscC2sFwAg0ANidTRBZuSvn7AiKElTQlbktXQyl5EO
	dau7OnFQT+4RjPpthQefqSsZAMECPRYXWaZtaThHcIRg2z8xZkYTezz9jb8dIdGiqzNwoQJQZQdqC
	gWELlRy+HrpW+iWNtRUcIvslx0YuahHWY15bfNc/Up/jRDaqHGXcaufar70r5JF5575ha0M3SvsFy
	nqjrITYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz7-000000031Ew-0TlB;
	Wed, 22 Oct 2025 13:34:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz1-000000031B7-1AFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:34:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-427054641f0so1049251f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761140069; x=1761744869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6bRIK7N0Lc6wOEz1pBT1Kkom/tSArzPgk5+y4nbPsU=;
        b=xeZ5g7glTHQH7naU5Answ31IwLTHEUkC2BDWu6YqrVYFF56C9UNsVDTBBrh6UnM3N/
         Ckld1rHhwXxm8O96t4/+dsDzHZQ6Eke1N3CvMIFi798X6uXuA8y/mjPufrTU8zhrB9Aw
         q6BIIzDNcscazGb5i0Tmb/Zse/kotEimE9+Gm9fAIEAyS4QnKLQAvGN5iQenyd6l31UA
         oI6SaFN1OK32lGBSVBW28DaiAm9rbaBeUsE7LoycB1FwDKHiFjJhuMkXe4pb9gvrCnpx
         tiAHo80WBiUeJcqRnJpB9mo6LFAbF27RrPOE+zhwAFjBOw4qIzYICPSuMXAgFn8rPQUg
         GSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140069; x=1761744869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6bRIK7N0Lc6wOEz1pBT1Kkom/tSArzPgk5+y4nbPsU=;
        b=leyn7xnUkcHi8eHMAfPNoTvjQ8N5jW4kW7Dutfoep9PMMxMO2w6NrKrNCqvF3LMq7U
         Ol0WrBRcTAHTse1+iar7ALqPlVE+KPmNBGkjzod/dNudOtQd6nYDm2aSLlX3315oi7r6
         9XN2Vypejkdtv+n12GBx/DTk8tWpvdc8Mj3pzJtnvUwl0DH+XUwX3Mw04YY/w2vvh8Ef
         sEXb84pgCDjQKFwIQlHSNu1/W1G4nsSR7Tbiw4XJecMBrmtvT7VP6uVAu/NXXMbHo8tN
         ssnl0yAh2LN5GD2gLpWcGumtvrx8eLQf5FS2z2MJcls1vhaLI78ZHqQg0BtGM5u4iPsk
         ZIoA==
X-Forwarded-Encrypted: i=1; AJvYcCVT0bQsEYiIvsSYw1jBKfeBJgKMiKrG/XmEHjeGQr/F/9VdulI02hJiCDtJFK15QBwhRzk6iRtwnOI3rDXw1FLp@lists.infradead.org
X-Gm-Message-State: AOJu0YznvV/SgEHo2NwRqMV5SvM7/5jrUEDlVMjES3F7YZt8OFdJQ60V
	whJ4rDGT2oR3a4ZVi14ms9E7SUFASFPB7BZO/GXpySibCc6ke1eIlVWcvQfUHhrLSqc=
X-Gm-Gg: ASbGncuCiysn6keGPNXU/d3JahFXSRHyFc1YrEYZU84Lj7/eRFWim5g5zheUv0FX+9S
	d7ULH/SN2DFRaoxNg9UDfDjOTib87A/RoLAX9uN9D2GsXmy3RiFMK3PTY9srMLOzy0AiqCor7s+
	JxBdvFLfrByv9Sqa0YrPZ8OkQJnNV4G2RNLAybPFX9Fi3SrhhVZZ/epl/VkrJFup6+n/DhQHuBt
	lCUdxfuVAmym3Yft0G2feDdJucfyJEaABhb9wDZ5vsTZbCDW0Pm1BKmW7IYNayYvALeKZmD+K+t
	Ztoh5biXu8jAcaV/mhJdvFpqX95WJMThgWiw14pD1alX+tjHOwYzEuVF5P6D5788TOYOIq34a1A
	SkY7oBA/8nN0k6X2puzEZ28gSrJPFgHjie7UrAVIG4Xraayvgs1pB/SaicUaXD+/GsF68WCvnYa
	WdZ8k2LyaLWId3xomrRn/csg==
X-Google-Smtp-Source: AGHT+IH/eS0bO2rVpOyBa4Ba5RIcrattnMm2FYtHvflh6MkB0GWk0k3OOmlqwAxRAezHhj8eTykIgA==
X-Received: by 2002:a05:6000:184f:b0:425:86cf:43bb with SMTP id ffacd0b85a97d-4284e55735cmr2864362f8f.5.1761140069463;
        Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42855c2fb92sm2981201f8f.46.2025.10.22.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop redundant functions type
Date: Wed, 22 Oct 2025 15:34:27 +0200
Message-ID: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063431_348881_B20FA688 
X-CRM114-Status: GOOD (  10.44  )
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

Referenced pinmux-node.yaml schema already defines type for "functions"
so $ref is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index ce04d2eadec9..0eff0a0ee9e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -42,7 +42,6 @@ patternProperties:
       function:
         description:
           Function to mux.
-        $ref: /schemas/types.yaml#/definitions/string
         enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
                spi0, spi1, spi2, spi3, spi4, spi5, spi6,
                uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
-- 
2.48.1


