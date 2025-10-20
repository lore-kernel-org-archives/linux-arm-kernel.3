Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1977DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/1IqfcCUA9YLagYCycxbsY/fycVFokt9Tw0XGGRWeE=; b=IU7Bmq7tjcu7/Z96h03hblzqO0
	fy3zQgrxpBEIz9lqwYcl3wSXIZMN0mDmttsJG40yCvMqGQyGq8EBli4Y2nM260LX31P2BscXE1M4V
	e43D9Gs0zukhQDY5k8BrZahPPJwq6mRQZMD0Xi3KUEkfnxFzrt8El3c+nGxbyQSuP4vBtV2d8AdhB
	Q/jcj4jmSjNfthm/ziGxA2tL80t9iL1PHn+lLRBtGnOJAKZ0XHsaVeLk1kmEqAcSjkXfLxSCrKWLU
	mrbIv0QSDtqk5MMqugCuXtaPJ4dZLdkdhdn7Q/loKQ7YhCMWLooG99DRBSaFItkgZUA7wVu0PLrgw
	uYqRq4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvJm-0000000Ek2p-1Q4U;
	Mon, 20 Oct 2025 19:13:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvJk-0000000Ek1c-2eIi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:13:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so4800225a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987595; x=1761592395; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/1IqfcCUA9YLagYCycxbsY/fycVFokt9Tw0XGGRWeE=;
        b=QQbwW6DDavcQrKlDskzfEQG7NtyeX02FTQgATlvATzXfB0vtoby5V/2R+18Wbt9GvG
         Clm67wplgN1hmCtJFJ4AV/V4NG4Smi0PaR54P7pwSZiBrGJRSGd6LuvrEObuav9hcrev
         ssAi0poktLWT9g283WOVIWImnqhrkBKMsGwgFGA2YU84pu58hUZsYpOOirbTMGHgrvwj
         Kk3xIhRk+Aj91z8QVk+9DDvc8DjkQsi7XaImnqdesbgTzR31vUKuI5GfnnvwKoQRe6kx
         TltCpR57cAADKJuv/MChUtrZHhR8Uy15uP4SiS7nlMedzrQ9BQi01HDPbYeYa9KynjNN
         UQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987595; x=1761592395;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/1IqfcCUA9YLagYCycxbsY/fycVFokt9Tw0XGGRWeE=;
        b=eb/ybE9e1NcnxMcxbRVLxMvcF6meeFlPmFHghz7mf/s8GfB9lZTAoe8d+BMizsY/Gl
         o3FuO7gt+E+KnRvVEz38/YpGEPbOMhcVAwVioo7wq0JiVCJG7ZU9sHimWZhmBgzxCPwB
         NZD8wMMke0OOA+cwkc8rymsZpewbJ5dIiiePw5+xPggfX/sswTIxanqth4H6WvtfKiAp
         qkhzqGqLDo7KuS8/jBnuifWFItfmHtnxuIBHXlyfQQQQneJKelG18IMcBMNUTKHXUNYK
         SA7hTu+JBpZTrxmd9TZJ8qBVUueSyt3cvrhqhw332TtcRl6ftbt5pkKDtinZlSielnTL
         d41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaXnw0lqeXFZQX0wFdkrFEkcbdWPQCVoEKiFxXVo0ewT3K1HgMqxw2nMrIdCyMjetIr85XF6UU77YDBaPYT2hP@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9eqrzH3ecQncUbTXsDYE/6R3Kli6QxY21gkupRrUqrEvnwII
	wvyakI18SxfPHvVp9cixThLJ844Ika9pkCEN79TBgJTcqL6eHHqOLfc4LCGYzzFK73s=
X-Gm-Gg: ASbGnct2Ut3pKIkgdbB8DznW7opEYKBDSBcFJ3gWYXazdqiNBj1kYGuAOHxqOOvALcP
	OrVoYKXLieyKMYDpLgqPIvKwCGjM+33OYZWf2RLK7VoE5BSpDorx04NdXgGbAH0NSL4O3fqo3Bh
	PtGSmwkPCvTlS0Huva5HLiLx5ZpeOR0TgHtefBKcq3X9v5S1UbcH463uQlkSGVr6d/0R6avc28f
	Re9u7L8HZJQkWpUh8BMdDKyg1fce0BUgkeEDrUOrbfqYLm0VKX1Gb8EYY128x81UuqoCnDvyHTT
	/DpWNYq3tNYDFAjSdNuSy+ellOAPQkPpun02WL066e3Qu7ry2Zzb03PQO+W2VRQFVIV8GWrBw+n
	SWX0890i+gDMd/1yrx1dCepvJw/30TFjo27K8ZlM1SM6hM93xXIc9GJBmkA+zPWvx6Ffj8xeK4t
	0MXodPG9IS
X-Google-Smtp-Source: AGHT+IFegYM0qEO5npRuzThv182Pha2riR+uFui+GrzI4KaHnCKvwdQOowJPKiLUY+i2Ba0SSvxXbA==
X-Received: by 2002:a05:6402:354f:b0:63c:6537:43d2 with SMTP id 4fb4d7f45d1cf-63c65374608mr6780582a12.38.1760987594661;
        Mon, 20 Oct 2025 12:13:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a93998sm7234434a12.4.2025.10.20.12.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:13:14 -0700 (PDT)
Message-ID: <1b33d759-be0e-4bd7-b7ca-586d35b1c1e6@tuxon.dev>
Date: Mon, 20 Oct 2025 22:13:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/31] clk: at91: clk-i2s-mux: add support for
 parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <276cf23db4b81668bedbcb7b2dd310b62c2ad025.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <276cf23db4b81668bedbcb7b2dd310b62c2ad025.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121316_678330_C6E3C7F2 
X-CRM114-Status: GOOD (  10.89  )
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



On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in i2s mux clock driver.

s/parent_hw/parent_data. Same for the patch title.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-i2s-mux were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

