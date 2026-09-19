Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0005C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=; b=NES7VhVg9fScAtdA8okjEPVzsJ
	tVglH0ssasPXwcTqX1oY+335R7smQGE7fw7rDsbR2T7reEKZ2dtoyBWKrwVNxkrWS9gzCtdrQSRAW
	BgX6Rv6Xz3RDIHvxn8qrKWe+CCg4Z5mwiygpxSz6a8v2rrpqjAlv+kVCYtazdVwOWM5bbM5p1mfvy
	T5549vNSyK2x/96nYQ6Q82d6Ad0+STOSdU34FYh9fVeJTHapA7l+4wWgivYQhXUKzcym046z6a8m8
	SA+chb5C0vfLG4nTpIM5voUh6kMkv8Z5X+VydOQxMA1EMyQv/Bmj4E7l6fmoUWWLWIypIXIVnjbQu
	QeSXq+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v2Q-0000000GJUd-068p;
	Sat, 19 Sep 2026 13:23:30 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v2N-0000000GJUD-3q0X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:23:29 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so889606f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824206; x=1790429006; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=IsudXASPkHo15x8v7DQVL698ezwy3A8YHXa1PvyJ/MB6aQSi99dOVaGL3v19mke5N/
         dUwTEyEi2e3PCsSTAgJD3Ly0UewgStYQ1pZ+qirqt9iDQZ5utY7YrKXtTz6JZM0yeZoa
         t/nnIcO07VDoQf6jdNKtQNYRwcXQ6jPy27Mbmn2y+AwgJ2h0Q7lY3GWVTUde78eX1wnb
         W7n9cYLqVN3r9oM9FXF3k9pSbqAVh8bc6kLaMeThr0wzlY+yxuO2zu/ojSB7A+XtH3hE
         zPsRdc2RLfcxME4pHqXnr6YGWLfUHV3d+IWutSJi44sfF/bw0/Tgbg1XaaqLC/OJaX3P
         ckUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824206; x=1790429006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=aE5IwXWN3G1zamkiunPJ2AfEfv5LZf7lmvdCZU3Zoj4hMdgvayUwMF7vQyJ5vIRjOM
         YvA0mx3trgIJB1VNfl/zvMUUSq0DSmffNEURKRb+DZnRrsLfO3CCe7ZotfQYUtx+ycoL
         yskbuwx5ncfOaYDdeDSjTQyZWeYJhutVrVqdV6B4BHmrdfGm2LAZlZlRXQuwzKKAzjMj
         DQPmTT1dRrKoeGwx8DCzl4Kb8F6h0+u+I/KlFfMUEeBIkar4+ruC+P9F6HaKRw2uT1uU
         XsQQhAdAqCPpDMy8o9ED8jk2mqqVhIsunLfSVcqTgd/Fdzqgy2cdwPMBYpGbtNXun9T7
         DW4A==
X-Forwarded-Encrypted: i=1; AKwUvByPxk942qfRX+o0K93F0zBYuoWC5RFG+mM86fBsZ7Ca1RV44KjtFsc1BXVbd4ezUjF2Qz9exqfrOcaUiKCPGBkT@lists.infradead.org
X-Gm-Message-State: AFuF++kVyM/70RV8mQunxrL3LAwGeWPF9bv14CpKR+IC5TMM+XLUZu6l
	Xg+nkmf09hrHQ+yI2h59YaRli9L2yTcIvDk/koLMNn16pRvjZr4qhc+uJJjWwV0QrGT4C8ZRGdv
	Ma754B3E=
X-Gm-Gg: AYBFou3pk8e4MLzRJvBFBm2H/yyGrKOZz28xrH8YrE0BV7m29kWZplAUCbqk0DT9RcR
	Ud4nuBImddvpdjS4XzwZ1Q8TF2HwSfjAbg3YghE2fpJmSg0qcEejTgCmZdXrv092vZ+WEh4tyOH
	XK3yCF/KiOxDluvGktCLwHTdAEey0dXhRHX4b1AGMdl13h63FzevKlvg0KmNBeJxkf60+D3JQN0
	3s9AIT6qFyYn4GtDjUsRQwgvEV581QeIqCBQ7ZJAYP281rwFxayLF6qYI8cet08cGTTEB8ZM0AT
	e6o8RXqr4E6t2sq+0ThzwuwZ5nPd4TagddVy6VDjKrO5JJWxeJ692sXxrgaHcCSl6E8rc4T+/x5
	PerSZfRWhXixUa5VY07TFNt6/DZcCUFywvM5Ndtii+3+m1lXbH7kMPOX2VQBCFRt6BXZyCt9J8h
	iWBmr6jj34SyLZIgGI0YhJoeQTC991UmCFtLA5bQNLDFX2l0fQNWP2gNsxUcndV8lNdz5WtU39+
	jER8IEWCOonwMKp4CZfopVo/T7DxbiQ7jlDY52zXGPuI4EkOtIGsPna7nT8ickN0ps=
X-Received: by 2002:a05:6000:41c7:b0:486:fcfd:45d4 with SMTP id ffacd0b85a97d-4871e216bcfmr8106032f8f.17.1789824205769;
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245a869asm6815705f8f.37.2026.09.19.06.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Message-ID: <ebbbf57b-9c2a-4b6b-b705-31cd4bd0a617@tuxon.dev>
Date: Sat, 19 Sep 2026 16:23:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulation mode
 and OTP access validation
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_062327_964169_941D173F 
X-CRM114-Status: UNSURE (   9.65  )
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



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add validation of OTP memory accessibility and emulation mode status
> during probe.
> 
> When the boot packet is not configured, emulation mode allows access to
> the other packets. When both are not available an informational message
> is logged to help with debugging.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

