Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4BBD3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=; b=awhEs85DbKK7Mj6+ylasnrEiBE
	VFpSgnw5PdjThpznJ1bRKwoij30eF/t/saciot9S1JAGf4YPexSiU56S3CJhnVtAYyQhIfNXRuplD
	/fdjtqST6xZJtwsI5iDNsv0mpxgEn8kVvTTS6zYfyOE45vLheBScZF0uLp8qATGpAldAoefBfwquc
	cVhKcG3m/Qe64tQjL747B5Mg0J50tslyBG0ApCMh3KmvVASrLPTVW1HeEU150Dfu9dNrGkAZgjHjF
	yxuSMSVg+PvsvI1RLcb6rS8dnJcTzZk/odjmJ4qdxLCduHTZVjzcoud7BmONVncFXMoaCrT++oepx
	bU0DR4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5T1L-0000000BaDG-03mk;
	Mon, 28 Oct 2024 16:55:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SnV-0000000BXV6-2PR8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:40:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315baec69eso46069045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730133652; x=1730738452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=fpA9JZgfg248bk+6RtPYOerCgQ+clOBNxKoKqEePJ/YxRCHjxhw1l63F4U6Ody1j3+
         ho2yMnEJ0IibqhmHRzM1RyF3tMXsTg3M6IZ/GgLOiYJAeVaxTRCwYC0IneqEyXM/dIG6
         rByXZH2oZFJPytr8X8TkIXUOBYmJEE7yFCXGQsjNIJmxwt49WR9kypFT0Y98T491fvDS
         lnxHxfhnsqqh2y/seAwTq1C8YNV1WtPh04x87L8lpDbtAm1gqeXjFdYUiRZoOM9gN8Gg
         tnWchHA1zELxoWaRdAQnroVWUc+gC51VCxlITiWRP8r6f4Z2cuO7sK6Pb0FtNBqN8ZFd
         seYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133652; x=1730738452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=K2DH2MFVZUbjpOf3HruaG4rSmwMa5fCCdZO1GiicuUFe+OBorir5DWNkcAqhHWo+hN
         hD/wgRuaNpme1f97uL1iLWrUIcScVTEVmUj+hQp2MIPb3JbnOqyrrveJoOaKDx7MNpn3
         5xAWTbUccV0OoWhmfnoOPP/ukBGMiLEw3584sIN+TSHIL/v3ikK93LSDvKBT3DtcvZEg
         lYaU5vwdBIFlpMN3JNlTGRVQw4KoIxeixDi+PK+nA1n3yvtB8FmeY8I2sfMv5zysPEqy
         Da/eLVCqjCdgSuzOTHOYpFvQWb11RiJnaucFD18+SGoNevgAxmI4IPlMjlcmgqoNPEAD
         vLGA==
X-Forwarded-Encrypted: i=1; AJvYcCX1MzWin9o89Us40ArrLQjgyVjx6n4RA2oPWmLqgNj7jKdJHsL7Cgipdxf0+mVGzKmS+OfXNSgWhrAN7JV39L63@lists.infradead.org
X-Gm-Message-State: AOJu0YwZIBVV49C4EqdOSWD/UeTQq9uwg/FJVF9CxHM7UIpl1XNO/Bi4
	3KUUeCHF4zxJ1XzMXX/KbMAjAbelKl+tUk6aOzIAr1l9xd185e+GwqlGzqyBhiA=
X-Google-Smtp-Source: AGHT+IHD7ecehSeRSersefttuZxWWc/yvJLPk3kslyGa7nuUur+ExAiKbF2BIlY7ADLI6KIVbs9TAw==
X-Received: by 2002:a05:600c:4fce:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-4319ad20fb6mr68256455e9.30.1730133651812;
        Mon, 28 Oct 2024 09:40:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4318b5433f2sm146420585e9.1.2024.10.28.09.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:40:50 -0700 (PDT)
Message-ID: <0f626477-7af1-4f8e-a770-39f69d9b6cbb@linaro.org>
Date: Mon, 28 Oct 2024 17:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make
 read-only arrays static const
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094053_652484_D990A440 
X-CRM114-Status: UNSURE (   7.20  )
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

On 22/10/2024 20:46, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack at run time, instead
> make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

