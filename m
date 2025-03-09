Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0899C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAqFx78SArbrBH5Q1+Ilkti3+dZ3JAByQkBS9egtY1g=; b=A4v2GEGgvQMnT8rriU4Vu3XhPF
	MPjmeweA8NLKO+T4U+pg7aAU1ZSyIK8FeuttVhviM58rRUQMC++W4HVPCrQhrTVkbOxF9X7xPsR/N
	74wvo6LV83zDfKUuNSaufBcqCL1sTlminxEs63Du8nmojxr63z98w033dG3+NqkbjKy9pz8yaENMo
	q/siWuPSBKv9yToBO1OIvK+AkaUyJT2viJt19Qxce3TjIeDeH+xRrToiNZTf0kp7pCdbZBy0BSpGC
	u/2T1Q/sKtL20cz8eyEyGV7fVMErIRcz6SKjMaxYDA4NldoQqRqHLcmatjdnb8Ayyo+kAPUsn+59S
	Wuvd6vmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trL0d-00000000vC6-1iWj;
	Sun, 09 Mar 2025 18:04:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKrJ-00000000tYS-09Ho
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:54:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39127effa72so256307f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542879; x=1742147679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAqFx78SArbrBH5Q1+Ilkti3+dZ3JAByQkBS9egtY1g=;
        b=Nzhto4H6K4M3vgg5Ds63S0a7IDYOndh9U1Vc8/ECmQm+hzP//2lyRHHtnc0YVcrGQ5
         20rhcPAWod3DYDX5jh99HoKRpxYVvenqv/JTmNm2WKNKf/F/bJ+KIh43hlk/Do9Y87va
         7Wt9f1ZXxPoXpGq5M3ckIpHY5+WLGn9MzLmKp789n1Fv1ZW1175Dp8DqogAA5bwHMmKQ
         2EsUz/wkr9r/jn4w9ycErVFeA+3a6AHuQRKuE0pV/AlvVg0gpBXrXza80RiRx+poP3ip
         BtVVZTKgvaPpeAPMAixTyMBCSoFbmAJF9CPc3NVy+dW/pLk4fTNrjrlxFBsK1naJCeaH
         WM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542879; x=1742147679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAqFx78SArbrBH5Q1+Ilkti3+dZ3JAByQkBS9egtY1g=;
        b=g6UGZCKzvlD2M6TBOwJogRmce/QP0xoVjWSn40TOsRM2i7EHuGBowiXvtFHiNNPu+6
         GEA0t0ZSTgQ6pr46R2lOdxoMPpi/cBTkNVL/tY6T5efKBxjQ6DYG3YXACrqfdmdD3xV5
         gtTL31vUMu1eYa9U1bgKSn6MGnOfNEadtnuygmf5cz2AhdFBNjLSmi7PNzOGuXGSf/kN
         OJorCltCaTUo0MRqVQ1u/me2YUw8AjXAXRtWVOE1oOuGohO9326zQH2RE8pXn837ZC1F
         MR89jbEbZk2srEUXsLptQ/MxuDrSPzTmiv9DPkwS5McUj6BlHY4zIu/wfnkQbZZZ44Tb
         qWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbTGkDcslf4X2fFeOrpZlsA2ure2PqDuT8/vGPoGyZ2B3zqvKos9FANwt4LS5oatEDv5b18ZvGFptKbRxDqbPz@lists.infradead.org
X-Gm-Message-State: AOJu0YwfDIeaBU+bJaPDFmhnacJ4OM/d1te9C+tYLivje5FYzD+4MDBH
	SHf+6v+L3PYVEJ+ZR9qXpUog8wyzHGnkIXKgwG3R5GauJx+YHp4bMVCrXzDd+DgNuOJezB/HH/O
	c5Ao=
X-Gm-Gg: ASbGncv7XxX9t15lBWxjxLIE8sgFHE3WMj0IRyMSDfg0wAg/R6pIrspxYtXJ0MmO2jr
	HBvv8Ze6csK4WvpRJf4DGP5Ru+NT3LAZz2mqiod2sWXuusHlnsK8cUyYdJW7ovQA00ruCkNY0Kt
	L2KVUmPUnPh+TOCSk/gPAdmSdeR4jEm7V12sPMyJwx+U2bFZphpslM78tJI3PXR/sqvHrLttDjk
	x9gG3KCSFR6G7Z4GmkHTUF+kt3wePQw+RCmUCMGfK6jjJZm7ifmxJ9w4wYqgeU+A4W8LSdEa3jK
	3TfQ+KHHmRS7zjRa5HOsrQBm5T9PMZC4FL9c0wkTwpKZOK5sAQypM7tpZAS0
X-Google-Smtp-Source: AGHT+IFYzKEoA/0BD629Q+oyNq4LgcHKydsos0JaNMt90Qxi5qetmVUanZhNd8Ow0nb+R9OCR/6Ciw==
X-Received: by 2002:a05:6000:178e:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-3913bba4880mr1367921f8f.10.1741542879038;
        Sun, 09 Mar 2025 10:54:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c106a1asm12425578f8f.100.2025.03.09.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:54:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250307081341.35197-1-krzysztof.kozlowski@linaro.org>
References: <20250307081341.35197-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-usi: Drop
 unnecessary status from example
Message-Id: <174154287672.7465.7756190815598140333.b4-ty@linaro.org>
Date: Sun, 09 Mar 2025 18:54:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105441_080511_44974A5E 
X-CRM114-Status: UNSURE (   8.24  )
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


On Fri, 07 Mar 2025 09:13:41 +0100, Krzysztof Kozlowski wrote:
> Device nodes in the examples are supposed to be enabled, so the schema
> will be validated against them.  Keeping them disabled hides potential
> errors.  Only one child of Samsung Exynos USI device node should be
> enabled.  The node in the example already selected 'USI_MODE_UART', so
> enable the serial node while keeping second - I2C - disabled.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example
      https://git.kernel.org/krzk/linux/c/8f299df1b75ad0939f1340182c265de019eab438

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


