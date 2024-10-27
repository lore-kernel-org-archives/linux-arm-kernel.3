Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D1CD13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLTmMIJID3AGFwWG59EcP60iKJtkbZG1LGkHeuiSGE4=; b=DmaUUo/OjnLXRUsTiRHMO1WRkL
	P+tk5Fj4edO84UJ5FmD11rEeTbP2HzWF6HyaAIQf9Tv4JM9NKhXvFJXbkrqrVNkzQwkmjyve9TFDP
	3eq7VQa/XRn9dVveLydpcK28M6QFfQ1SiXDVlKPbuyluZ3wrGADV2WSZVrVB35inHE0/wDDhRcGUI
	+agPjsp22J51pwulUsx1WAXk9tbfOh0VOtErX3a1i0lD4Pj3elibUJ324XmuUBDph11WcjmfL2QfM
	eNpi+RyOIyyEGrbftZRtKnBt4fw2TNQa+Cubp0ljDiZIhNF0qcOOjMuGLin7gquwLrQxcajoZJ05v
	ppWzSlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59dk-00000008oNo-2njC;
	Sun, 27 Oct 2024 20:13:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59TP-00000008n9e-2ms0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:02:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315ce4d250so4229315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059370; x=1730664170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLTmMIJID3AGFwWG59EcP60iKJtkbZG1LGkHeuiSGE4=;
        b=PpWbe8xPllABWQL0k2YLKECPpcKE69vgq0ROJX9GQsDr/Nq4YiM3Es4s3vqlSNxxvc
         E9XGI/r8D2ShZUbKpgNsHWAeAMaIQmgieWSwiSbKnnVQKlxsNXJ5j6xZcBu0tdAV//4S
         1Z5wJS0MmviTO2lXK9jbjVDTJqbHIsu3Xgl3iTJ/80BqFp6G7y9Bk1sTDfbWF9xFCPLR
         giK10JwDH8tXvGODsm9x/MQXvQZtjO4RvAPffOYufOLK6XQcN/SyfWoL9+5gz3/gpTC2
         KY+AK5UbCODKNiP+s/wQfibwCNxDBm9sjX3QIw7/3Orn4MfFY4r/wk6gMUOrzXpOZuvS
         WeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059370; x=1730664170;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLTmMIJID3AGFwWG59EcP60iKJtkbZG1LGkHeuiSGE4=;
        b=FrGRXzI4ojdSrIXgQYq6cpHFMIHYnb851asCQmJ0oW+3ZiEBDJThtgcFco8xsZHrk2
         JVEIwrENSNmPuAjOwIf+ZC8a0EJAHlVVZ53jqm8TIBqOkJQWRLrYUPNJ1igjjjl+CaTH
         QPKDmTlYMR/h8NUKZQ+u6vGydjo8NVTJqso8+GnCqzt4DaF7exFnPrkD8RfQbYqJbZG2
         0yga0lRd7vWFR6qSckIbIXcXeIhVwfkJlk030pRM2ngyf9rchY9xm2JBP3DlQNEENn93
         /U97RcNf+er/woDDnwWFP5gFxsl/GLDmxIM2JNhgISTCPkfkuGd/LwipBKAPLC6jw/E6
         pLKA==
X-Forwarded-Encrypted: i=1; AJvYcCXcNxwF/4CpRDLr1uA3EslqI3/bltrHIa7I5UMZn7ShDoSbXeWkE7McL6CTbYxHUYqir0zUYdKt1bZSgU/OZLZW@lists.infradead.org
X-Gm-Message-State: AOJu0YzU2z1N+bhvYwhCVRvG1bjt8FDsnczvgK+C+cN92nuvagP6TjiX
	fYra0GcgV+H24kchummFiwYvVU0MuwZGo3ckUtYXyNBG/HYx+6YlOJooL0I6w2s=
X-Google-Smtp-Source: AGHT+IGFy5ReZ4pQxsghQ3Q5SAkMg3xbszhbMlXqP7CNsuS41wn845lvrqrdk2cF6zHoSJqbcmaS0Q==
X-Received: by 2002:a05:600c:35ca:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-4319ac6f88amr19362195e9.1.1730059370093;
        Sun, 27 Oct 2024 13:02:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d50sm7526833f8f.76.2024.10.27.13.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:02:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-3-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-3-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 03/10] dt-bindings: pinctrl: samsung: Add
 compatible for Exynos9810 SoC
Message-Id: <173005936806.12757.10682268420257045105.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:02:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130251_739300_61EF9EA1 
X-CRM114-Status: UNSURE (   8.46  )
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


On Sat, 26 Oct 2024 23:32:34 +0300, Markuss Broks wrote:
> Add a compatible for Samsung Exynos9810 pinctrl block to the schema.
> Exynos9810 has 9 total pin banks and it's similar to other Samsung
> SoC pinctrl blocks.
> 
> 

Applied, thanks!

[03/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
        https://git.kernel.org/pinctrl/samsung/c/47c3309d58b5e6fd3fc425253491c1ce014538c0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


