Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B66CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dFt3gYfNqGa3u3KzJ+AyiV/voGtt/ZhOXx5ybVFlJE=; b=BDzhapp557kith+nSnydHmH2oV
	bCi2v2U3D4C9gvGjwaRDuFgs+PcnY5kG4x0G49HgEbLuxoi1K0NeEWs5kYOzG0tE1sSdI6Oe6//aH
	PXyrPI/w7BkjIxK5h1z0LJq8HffSww3szAUVxCD3IYkUy3qxRwUBfMavHKtdw4zzsRM9sO/RC9qNk
	qR8REV/qS/AldAO8KgOKR1C4vm3T5jy6VEAaMwK+eNM805SCva/fOEE3+O0RdtZXxTgJUcnDytyEa
	HGu2umeegS9I+/5kzXiL4sWaiU1y4OirY4vOSZB8kiHrwhmVT+nP9InccC/+i5RS5sydNwcoqk4Fl
	Tq7Lb1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHuu-00000007fqo-3Azy;
	Sat, 30 Aug 2025 09:30:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHkd-00000007fBb-0FFp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:20:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3cd99b4bb72so234260f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545597; x=1757150397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dFt3gYfNqGa3u3KzJ+AyiV/voGtt/ZhOXx5ybVFlJE=;
        b=Lz0w5cotk0Dy3lyDHbjhA0mczWuwEGZJfviEM7si6qvbCML9/b5hkkKjwqj6Ps1qHK
         ZtMPo6hlf4NsBkC6WguX5ZMV0zHaEl98v8cMXN9IvbOoB77RZrnFjDGvXw6ReHFZzX9y
         H+r1odzFCUcWvArY1ZKBYpV8bg3l6Spkbq9fjXQMwAe+RDJNyM21kl6FPtLzZnxJQwNd
         dDe5wHjCa8EidOc2FnNIDHYpfi/t7gcIzi+GSB0ahaO0/tHC2WpwsW2gTk8eZItoTysW
         YUWA1D1Va9977mkUmRLhlKfxoNUleX1N3jCZkzut0RgBJyW4Ov/FXgQdOg6kxZ7wgElv
         xFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545597; x=1757150397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dFt3gYfNqGa3u3KzJ+AyiV/voGtt/ZhOXx5ybVFlJE=;
        b=rVp4aqPkpc9UqkmMpNWnqXVXtzrm24uMn58ogiDK8jlTK9VI0oaw4gDm4/GKlhxw4j
         f+/iNSIH5pv+BFTb/l53GfA9Bc894V+6dAMOPX2nYoSMfJYVU2e+i2Bw1qHv9efltvTA
         h17i1cQ9nKcg6KLLYAfZBVhX7G2B92wxs79HwtOlL48livVb0h/oAIlak6mj4vJ7FY+B
         cKcEUxfMEeGERK0/QGCJ5YqhasrvJaglgNCKXWGl696nehKKkoT/BD07b00bamHDvQvt
         8pwTxJQm+peYfoiOUyOOERHNvcn4N3odB02PwkGRWSl7Gq4y8VUElSSm+hSQURhmkQx7
         IZdA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIYVC0T3G3Wmv+spfohA1L5eq9oZWJGBGuu8NJROf6d6PhkPTOzWX628KR4SAHG8UM0dzaV3sVGJ1JCAMw0zm@lists.infradead.org
X-Gm-Message-State: AOJu0YzaxkTOrvqmAD4xgwvabPsLIT49JQAkXSlWCM+tjDsyd2bsd7ed
	WPPuq9M5OY0ZZJiX/Bq4JL+LYd2Ph0iYebUvkckZhmaWbjuP2csBTMJAIEi7gJoGesnvnkSG7V7
	7iCYf
X-Gm-Gg: ASbGncvDBZ0GutqNNlvZo2flZX1v96aMFFUgrJ2O41pJgWysdut1dOAfMoxHCp4WQDw
	oo3t60zVnVrgAJmcjuGfOyL8MZbArPp0ghv6xa/J9JZJrupVFILa9WQQojH1J0z0SCxb/+8dL4P
	PBRdx7rn8/UkXF07nQ3bLBhrtvE+3poSE73GjQIp0e2VvZNclxbNBu5+JRsUGtjnaJLCx9Fcev5
	e/QWKXIgDVfGiVptT0uXbiC5DlrNMrd3uEkKkXsfjApgreESk5+0YnZbZwcXjl/Ovje5dWq7j8I
	ZhXHBWJKp/L04P+mYg9tUzxevMPfvoNbeoJp4uRqlfktJtrWFkp5QgP0gW0yNEhJdp5G59TVCWH
	/hjzcqB9kSJKp608zridrPXcbRORrBVbTjEVnZtLc3ZbuR4FcnQ==
X-Google-Smtp-Source: AGHT+IGNPQduLpc/IjF1WNJ7fX3IBlI9xKKXL9Jw8b3Rr1V0XpqF83lKcev9HsYcQdmGh6fZ98hleg==
X-Received: by 2002:a05:6000:420f:b0:3cd:cb0f:7203 with SMTP id ffacd0b85a97d-3d0f6b3570dmr1860657f8f.0.1756545597544;
        Sat, 30 Aug 2025 02:19:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] arm64: dts: exynos5433: Add default GIC
 address cells
Message-Id: <175654559607.10738.12399335584590280087.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_021959_101588_6B01B8D0 
X-CRM114-Status: GOOD (  10.41  )
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


On Fri, 22 Aug 2025 14:14:24 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   exynos5433-tm2-common.dtsi:1000.2-41: Warning (interrupt_map): /soc@0/pcie@15700000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@11001000, using 0 as fallbac
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos5433: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/b3a62f6c3573e448e8b0697a622e7bba0ddf9945

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


