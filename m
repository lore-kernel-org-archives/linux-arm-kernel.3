Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F1EC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8WHpVw6+CCMHP4RqzFXXcm3T39z37n7bSX4Jxw/YXU=; b=fRF7DdMlg6uVtB/VChzxzKXX7h
	95uXeKsRpYhnMI9MNObUq4gR4dJoDXppOsrikPJn5DY0YwlLJP10+BgWkka0vHXU1m0cSzLGWIlsa
	SPVPCCW5Jrdp7JbGOUTfbwdJ2/q4k0XkzJ3NW0xmwSVwW1P3HRGCbjHH9vdj5A82J+aAyfGTK6Jzb
	TwtvmpB4b55930XvRQauAl8kH7vub1LIAlUbszcYulFE+pQ0YiW3gvFJb/EmunCoQblGmSSmQqrNS
	tpoZzNAzDsrStBoB9V0owaSom6tzFQ3f+Bk1Mfj2HP/K6Fp9p6cV0cSDSOyTwEmVIAyS7UZoUxlA9
	PKxKorXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgwD-0000000DWkx-2eRa;
	Tue, 11 Aug 2026 07:30:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgwC-0000000DWkP-1psE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:30:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B099600C3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5403D1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786433415;
	bh=y8WHpVw6+CCMHP4RqzFXXcm3T39z37n7bSX4Jxw/YXU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=P7G2kvTVjt9BAmJrnjupT4mms97ylHc8icBv05GVAzpUSpLJpOH1C7GdZ28teb/CP
	 tLkEGY0SEzEA3/zwnzusAQKJxRRBk3ldn9iORpeIF7908Pyjd2/jdMpm5/pbToefTC
	 azhqrrCJgTp5/wzPLyJJ0imRgL2tdlcDbTiZqcbvfzNytVaa6J5/zXmEWXl2iLErPD
	 5/By/hMA78dAnI0l2fRGOCq0m3rfEG+LexTHQkaVRngd1/XtqL8aGvkjjkWxQfj3xq
	 K7lGy4mcNUtV88D8/8nuwnNH+myv2wLuBdhF/TkyTkEWQlC80LLS51c5F381NmVZ9n
	 My3Cb6XCQhNtA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so16047821fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 00:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rom2x8CAAMVXRz1WfWcKdXX8hC13lzJqWVq0CKdq3FlOBvhU9eVfDaLwaui0k1WqUkUKfHQ8vcreDyJsw6wSHxr@lists.infradead.org
X-Gm-Message-State: AOJu0YxYfx6YgC3Zf0fgeqEEapZ2zWljjOiV72rs6qZWX1jcdb1a3E0z
	/A3nBKtbNNLserHsLDj3hEXG7xhoKHMYnvfiLoRU1ipzBJdUKlv7KudeK6+l9C1X6c0H3f4YLbv
	/U0ekhfco2283smykiwe//P+RXEmmQPob7dAZ7AjI1A==
X-Received: by 2002:a05:651c:144c:b0:39b:374a:afb8 with SMTP id
 38308e7fff4ca-3a0f8a9bc43mr1705191fa.0.1786433414081; Tue, 11 Aug 2026
 00:30:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 07:30:12 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 07:30:12 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260810213456.1268831-2-marex@nabladev.com>
MIME-Version: 1.0
References: <20260810213456.1268831-1-marex@nabladev.com> <20260810213456.1268831-2-marex@nabladev.com>
Date: Tue, 11 Aug 2026 07:30:12 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdjxSyqAxUmvqZPpSQGfFe2BZB98Wqn4D6NxPHo2PDo6A@mail.gmail.com>
X-Gm-Features: AUfX_mxorVfTOjx3cPX8jWYGtrfL5nLyxouAJBW0LD2vHOnfI6cP-TL7yif_Blw
Message-ID: <CAMRc=MdjxSyqAxUmvqZPpSQGfFe2BZB98Wqn4D6NxPHo2PDo6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn: Expand EEPROM description on ifm
 VHIP4 EvalBoard
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 10 Aug 2026 23:34:39 +0200, Marek Vasut <marex@nabladev.com> said:
> Describe the EEPROM write protect GPIOs and labels on VHIP4 EvalBoard.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

