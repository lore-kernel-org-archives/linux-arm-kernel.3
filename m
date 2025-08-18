Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFACA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=; b=Wx5nv7pChcNCFSURikONaTbixt
	BLDlI9skEJrDR6YTFrW3LkSkQDbESvHmmtokht4rOX2piFNKhJ+7L41NLD8MN+5NNxOhfJLY6/nva
	GRUDvQmy9y/OwLZ6eYwTORmXMzRanJRCgOG92qXLkODMtbY2oFxKcfU6Yf7A9Smf712Z/dVkNGbcO
	AkkhnSZOlcAVD5iEmjfw0bRWDliHjnsVpzyS1c4teUrt0N5tvzowSp28R0V5co02f5QkaLolZeBoL
	XGfRXzVNsg6t/VEo/lXfJDHpO82yhew6V8NwW9YbJDpUTAnLuvp+gW4RtBwGy5GKDbfce5OOIEgFk
	sQgJ5sAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo04h-00000007WbX-3q8c;
	Mon, 18 Aug 2025 13:38:59 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvWh-00000006yOM-3s0M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:47:37 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso47292a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506854; x=1756111654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=eiTox3AMjgOEd679lkalvqTuhlOvS3FANj07zY9pD9hP9QTQ3DPEnA6TKsAQfDgqJu
         GD1JIg+nig9Zd/Z5mEfOC9RorhHrjy85kq4mL/F8/X9q8nTfH53TsmFgmN3nIab4VMDe
         4ke7wV7oean0xs82oPeG2LGDrQl+r86/EH1A5w9wnMpsoNq9nJL/vHODDxe3HRSurt7h
         zZdqLl6ZH/P/LsdjrZL7XnhKL2YuneJOBbjrsD634hZyo1wzXUygKw8wZDH6cgKCP3oU
         Z/qFayu6TqUlcqFuLmJVpLpSMLiTW2kCMUVJKF3cMa/BaBNx/U0cdoSG6ESF7ByON5XA
         0zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506854; x=1756111654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=uk19SUXbH8o9x4k9dlboLuoGORtNSwGK/CXme0zrPIxgrb2jkMwVXzYwoqvvbd8E8F
         HYVU7o05MoOvBK0NSP2rMb6TRdCMBP5XaVq6D3U3EfViCg7czYoWhevXGOd3P+hHPneM
         KmjbHKcGd4xkorYO/JejbzNwReSxg6sMo4y2zhzVpwUw/hv7Qn3UojEVGjxd6qGB2Zar
         BNKkeWLfUMo8AfcWdGySM+X6Wg3sym9DBQ5E/yloQfQIbhUxZVAf2wMHpYdcEgLdt73E
         kvGfX2GjLVlUmUoyJQZB0NA2ylHVB6VE/G0OchDLaG3Zji+jBUanZ54iViACYzKd5zW/
         YLcA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ygGgI49gz+4t+3M7O6x/oPPVGt6Wj1qCV5NGzdSsHEabJU+bTyAOGrGxPgCI90cQGbRiCFYuq9p7w+HkJP79@lists.infradead.org
X-Gm-Message-State: AOJu0YxeCU+NZ5AgO02GFwdbpicE1I+4+TdzEVOObcVD0T+xI/vBbith
	8EStg+FgCAtXpqwodjTLcDmOjbbKWHURREORGBlCrptbX1qbCztwUm1dcFdTwTdY/I4=
X-Gm-Gg: ASbGncvoppFTmSfKKDXRYHzLWfLrJvY5djzkGQzOghNgUGk9o1okGg8OdMGMcj31Ijy
	QX1/KKSA2Eq19qAwbcttivGJFKMu2AcIXKLXoxLxpPEKiXkfHcIdmdc9YNgDFFO6RMrX6bsakf9
	qY2vD3e4MlmXoeQfPuzxD50i3dq6l9O0HRXMIw99rO6FCPaDmohcHbU4wzK0XNpT9iK6XQnQ8Dg
	GWHqcinpTNX6pisLuSJ+d/xKzH4k6RUEXdbHjw4m9XLRq0PkawVyZaoQWoJgDbBcuAw6KLMdYzW
	vUFiTNlu5pAHNfXP7D8uns7hLc+okaiWVsX+RNgfxYvoWCaHKJYVbCUQdoxcsw5V9cy5eP2QrHj
	+cdxbSqBzEsFSCvJ4QkP1UbZWX9bfD5FGPf4Jh/8=
X-Google-Smtp-Source: AGHT+IHknpi+jVcAiHPe7qLq8tMu11yKP03M4lXkXrorN3kjMjAvXVfdd/sJwjbdKxYg4VZrpI7G9w==
X-Received: by 2002:a05:6402:1d54:b0:615:5cc1:3446 with SMTP id 4fb4d7f45d1cf-618b0f1c504mr4641443a12.5.1755506853905;
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
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
In-Reply-To: <20250814140943.22531-3-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
 <20250814140943.22531-3-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 02/12] clk: samsung: fsd: Add clk id for
 PCLK and PLL in CAM_CSI block
Message-Id: <175550685171.11777.14695565851704310683.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_014735_974523_AE5A3B54 
X-CRM114-Status: UNSURE (   8.59  )
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


On Thu, 14 Aug 2025 19:39:33 +0530, Inbaraj E wrote:
> Add clock id for PCLK and PLL. These clock id will be used for
> operation of CSI driver. PCLK is AXI2APB clock used for register
> access. PLL clock is main clock source for CAM_CSI block.
> 
> 

Applied, thanks!

[02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
        https://git.kernel.org/krzk/linux/c/1a713bd3b0c60d826bdde633919bedc1fd38df4d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


