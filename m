Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F841CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+3slhELo00fMq3w//kko/evMNTGZF1TLZtlTKBnvEc=; b=Hlq/mwtmtq/uZxp8t0Dk2C4ffM
	NNNYvYdiYD6iCpQKUPGeEJ6eE4kiAEXtaSu/ZodZJ7Xt5A0tvWAKr8v4BIu1ouIXefC4cu8WBCwfG
	CaKvJ5m1gF+UyPaQm/no4hY0OP1TriB7MXxNd4kh3v8Fd2256r5mXON+x6pGYzntLm1oNCleDDrJd
	gzhWUqvuQcizx2MkBJuMD+C9ruG6n6WtPDDq0iNOzW86mvHqd9m5i2jYYzni399dSPUOdBTuFISQp
	MWCudeme2XkIDhrFU4uhGh1ZSxd69RkuchUtUc5mG9YNl3RClX3UorS0UT7UsbVcsoAQhEENWYHBJ
	IdC/jl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvlO-0000000EoPG-2xht;
	Mon, 20 Oct 2025 19:41:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvlL-0000000EoOD-3QWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:41:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so5260704a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989306; x=1761594106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+3slhELo00fMq3w//kko/evMNTGZF1TLZtlTKBnvEc=;
        b=mu5AKwE1+yGZmWXfU33SzsB6skzF+FceJE7ft/3rPShdFJ0pI14sf4jpqpjyJnyW20
         iID9R/ljpSIMDvGqlaFUAekUIPRu9X41o5eSxQb7c4t8Uasx8UDbu/5Hw0rev9NdClui
         6UAN8LKgCAj7qiSA+8JRO/x7nWTrLokB/PlOKAvDTBf87EL8ca1g75umA1++N6LjOB97
         smZVLtLEd5oNLO5gF5t9fxdP1iGTyAgG94BNHYBTxCXDsO1JlGWmxSo5hmUIb8Lahgj6
         bsCTlkpPpRlTi3Zd6mQ/meGTwwk96UnJSEb1K2plxRuFVKDGTDnuShmkP7qThWqbftBV
         lFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989306; x=1761594106;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+3slhELo00fMq3w//kko/evMNTGZF1TLZtlTKBnvEc=;
        b=lHX/IUCx75AqFeaTYqkeLcbHwbNBFVLVxYkcErnn8th2WIDVAN0JNBn/tS0z6Uqp+a
         u1GPXM8RmVjKys4WZl1sbsnnTwBJtV6aFjlt/jpvQ9jDBwPaS87LNP5dkf9XeSINdN/z
         BItyNxsHh4uak7o+JJcbMqcGLqjT3zEG1gSbDc/QD+LjT9COSQIe6XBN4b40u+G4tYtL
         fdfWBWifQ6pDLUuV6yYfDSD5QQrrNG/J5RdxDrZd+F+8FXABcCaABBlFZ3QlA/nEMey0
         aNZd8mLwhxOJu3joukKfga4RGA72IhrAmkTOP33unRFs9dPR3vsd7LcfXDokWkhHGWM0
         8sRg==
X-Forwarded-Encrypted: i=1; AJvYcCWvwjT6RbjJ+IRM6o22LSPnkFJu/iZTw+YkbPtqyOAkSG9XN5CQlOyIcgmF+KJAc8ojkGeAOdXoGsvtJHTnSqrc@lists.infradead.org
X-Gm-Message-State: AOJu0YyF8bGHpbau+xlKmujxv3r/0Pkr/HaPhATd2KNt08dhjOCZpcnp
	Gm7Dkdegmu4sE5ajo0uA8Rna33ap/Dk6dEdhsfKjEpyCWAq5tDvk/z47kY2s6fmPs+E=
X-Gm-Gg: ASbGncugup5WMkFXChrAIk5KZ6Z79miivzEUa6e62M5qF3gDSvyZO2723iZsTaK+LKx
	1AuDV21DuqpuPWkUg5sqNF5Ff4Hyv0yhOTtMRERWNxHh+ispDKXG0Fni5hPGd8CAeM8qU75Nn95
	gHDfP+9NYprWwrRI2LKHPJXuQ+xtzwhkvpr0yqzuCQuKJXfQoXQiKUU0hDomYAkT8vC+h/ad/Du
	LMkB4Egn0XbJirguamjPw10ST33aPJPRZK8L2sHhlzoZ6YkyqDwzzYF5vAn55O/vNZQjSdepXSu
	uVGz3QbUIO/rirEruX04z9o55zkeYSnv6Kmba2Hoe5j5ol0zMBrX//2TG7YrKtt95KrzxMAp1Na
	tMyYOLcUOqcSGgvTBBQHPdMMqxw5fkxnQJL45hOFQMqq0RYSBXGhD+DeqqWPMAKRbM4uvkCH7eA
	dWsNTsIwA+
X-Google-Smtp-Source: AGHT+IHDIxoLORK8TXA5ZD6/WsOqHWJqq7Eq+n+YHr0BJm7nwggP3jvxI5a/xsatvpj+kR59rawzjQ==
X-Received: by 2002:a05:6402:4306:b0:628:b619:49bd with SMTP id 4fb4d7f45d1cf-63c1f6cea4amr12864517a12.25.1760989305960;
        Mon, 20 Oct 2025 12:41:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430145sm7409668a12.19.2025.10.20.12.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:41:44 -0700 (PDT)
Message-ID: <5650e47d-97ab-49a3-8342-7aad9daa5a1c@tuxon.dev>
Date: Mon, 20 Oct 2025 22:41:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 05/31] clk: at91: clk-peripheral: switch to
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <b0635913503630a8e1880b0b9ba8656465020181.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <b0635913503630a8e1880b0b9ba8656465020181.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124147_865674_3BF1B437 
X-CRM114-Status: UNSURE (   6.68  )
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

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for peripheral clocks.

Could you please explain also why as done in other patches?

The rest looks good to me.

Thank you,
Claudiu

