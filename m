Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D3ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=; b=h6F+EtV2eAlPJLUWhc3Xfl8E1A
	sj4N6aifNWrFlvmpfisc+Ik37eLrIWEXzUo769qJ2hlSpP5sTudtDLR6BdbuhCC5GkOee1z4MsoVL
	NC1gB6nOIeLd99FRGVSHEGHKWGjtXLOq1sloLvJf90v0puxtI4VK9Oc5a7aD2QGrtPZj0Eg/SRR/l
	vVHXePpP8SPub7Bexz/ozQWpL78tAAS43WEN+YNFieeKyeo0LKNWJPGJK0FS+eJSRxjvkzqGh3okL
	iaj7hC8wci91rfrM3tgH0JiV//eX23LkCcD526yYdXtWrlqUpiBHS85iv1PcOJ0oJAiwzP/v3+BUh
	o7DCTIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo04e-00000007WUs-0nGI;
	Mon, 18 Aug 2025 13:38:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvWf-00000006yNx-267J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:47:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6188b761d74so687832a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506851; x=1756111651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=CNTKIKtlU5oLlT06u/D2xLxuXUruzAhfACOwKTtQPAGUOXFvj/IRdV91WAYMIZF4rN
         Nk33sxHiUrk3fA6JjRRo0xLVVRlSsg9fStDWUFEhfczRm4LnFdGgMpiGbzHI61Qztgc/
         dE5EZcO8BoP+6waL+K6LirlThwhBthAQ/HfJp5yvMEfM9o2AIz773RmrLd2Kpq8spf0i
         9zxpxlbJxsYsGwYJgAyEcTUmyrdtPAWjRbFKTyU7F+Xqhxwnex+gdvSlMOJi56PA4OMl
         F31TP4+jrAdky//kG8VosBwRPk9WmHMfG/IqanJ+Q8UlTbVjzseXY+2P1CNSArXYAh6V
         NU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506851; x=1756111651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=ERNoUok4vGM3ggAsQe6a0HGQ4r6G+Knb5jQJd7zZaAx1AvOI1nC2KpixPuxwPDfqFC
         IqaZT7kqtu9/N6CGEZgLLM89i45/XGkLKelUmbRzl8+5ZyQWGsv5aRfYdnPwW5TefsMd
         4W4/x2L00VlNuzodvC6OFo6PtdIlJo2WgHsubbiJwxmSVcCaiSmap3IMKK9hcbrcXRcw
         3VSMhNbht3GFOXc+P/t+XFM2cn7sAU13TzFGcxauAWnk6xq7Q+BPlSyPD3bHuIjutOH/
         ZSA+nGHXHp1tCfOWFailRhpdI6Owe6piXVAmeWgTV2W82mQ+VQfDPsYuWOUTDnR6NCKu
         4/ow==
X-Forwarded-Encrypted: i=1; AJvYcCWUsV0wnuH2cvEGML+JoOBlX4lxTmg/PZCyJOcHkpSTsB1l9AdN7fpj5hRWqZMyAS2r6mGVLN9vDF/6FJJ3hrWF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7hLBPcGS1lcMb4Nk++9RG8Qa5R4tPBFzQFmOnEldBaDWm9WvG
	fXSknYlVU2W4zrQwTi9IzCViNCHriz4kT6VjAFlLTj0cKFm7sMFosInu8NaS3jd7a0g=
X-Gm-Gg: ASbGnctUaJSBsltHsvbkB0K6NqDsaQxBwNQ4MZjMuqlUBAA4E4rwIYlD/2pjbjmAUMz
	GfgTovt8WuSQmzFlzZgg/ZC/8NWlJ0cdjXp52y9FxN1HTwufb0YFn4FwmOF+BP8RVgJiVNZdLTq
	EPCf2HD5FjpyMnD8hPv43wC/Ib797mtowATrXEI+FSkdxW5zDkmI46ggBXHlUO8dqqXWBZrduLv
	J2/1ODt0Juu/o0UqOCvt4wQCeIwodfFqDgBERoct8E26Hic3tAPxFBrBRbHPqh8eqH+kRyKkWUK
	sgOdOSpJAbEq5WSJZhP/3xZX8CR5FLjvwruGhsywOzGcJT36euu09CjTegeBqCuQq4Zr/9GoOGx
	oj+GeJi7CpBeZqpUVBV+486cuEpNmZD0Sb4GXuIzNFlZTS+77Tg==
X-Google-Smtp-Source: AGHT+IHnFT/QiiX+/jyxr6JrjJHBnX2ZgiTGkz6V56Qs5+zyrhsCVsoAqUSeVCMOf8wng75ASWqViQ==
X-Received: by 2002:a05:6402:440a:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-618b0865203mr4787283a12.7.1755506851453;
        Mon, 18 Aug 2025 01:47:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-2-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
 <20250814140943.22531-2-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI
 clock macro for FSD
Message-Id: <175550684881.11777.14718777449068060989.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_014733_558648_94ED3435 
X-CRM114-Status: UNSURE (   7.70  )
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


On Thu, 14 Aug 2025 19:39:32 +0530, Inbaraj E wrote:
> CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
> assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
> and CAM_CSI_PCLK.
> 
> 

Applied, thanks!

[01/12] dt-bindings: clock: Add CAM_CSI clock macro for FSD
        https://git.kernel.org/krzk/linux/c/5576d8098052952a6c95af86ad3dcb341554ac75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


