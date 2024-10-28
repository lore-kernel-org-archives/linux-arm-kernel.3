Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5802D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e74bDnvczhbgPY2hFm8VtRHbs4Ka+p6FF5bmoD6B5w=; b=wbRUcHpTwUJZjatB7W5RGMAX7i
	nE6H1VGn9C8DKcmJ1Xnzlv84NCB1yG+pPp90DlGysNLiQp8S6ex9W6lr0Ezr9kA1JPVM3U7e4bFuR
	XUxGPtyxo8giPCyuBUMlS72w6C7VDazIzZ6SxSWP3bwbRbowMdfhrcSXWWEh2p4hXUz6PDcXXeyDl
	DFnN+/b8au3PwWtHPB8qCL8sCgZ0ikApgPnFZywAQENhwG+J1KbMne7r0Nafj+nXzhFQqCks6h89T
	tdht0M+1t6ByF/FvUAUfqZPJpEEPmyOlm9KiN4M0TglioVFPZ9J369RH+sF3bCDYuioBRHw7dIgrz
	FHtIjKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SAj-0000000BOtg-1Bay;
	Mon, 28 Oct 2024 16:00:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ro8-0000000BKwo-0p9G;
	Mon, 28 Oct 2024 15:37:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f1292a9bso5183728e87.2;
        Mon, 28 Oct 2024 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730129846; x=1730734646; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=7e74bDnvczhbgPY2hFm8VtRHbs4Ka+p6FF5bmoD6B5w=;
        b=i8fTz1P4kjwJfC/me7vlPLN5A+OsF31VgB1NzrrgEzAq9LvZXiiMuaGWQpwFR9S0Yz
         COEPCAri8KX3QHb8l4iyISJL9+5+4i1aVXO2XiRYS7/VmjsirHQkdpQu6R7BGEROESCT
         CiUtJzCEMw2Skvq6Wf/H4m64Ppxjv+1dRHEVk47h5J1vZALN65JvoznluwcT99MrMM/0
         8n2+BQYJpTrhcEK/H5r/ommV2PM8YvEMFN3KHfbOSKRU3yKJRSU/x3eNoXpUiLDnVfmu
         D2n2Ey5iGKhaNF2xRN4Wq8F88ivcVz69Y/2zjz9ycGh33+SAtbJ1zadD3uE3phmkkz5O
         67kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730129846; x=1730734646;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e74bDnvczhbgPY2hFm8VtRHbs4Ka+p6FF5bmoD6B5w=;
        b=QUHvoSQHJWUwlgSueMwsPwDXqlvCXKpH14/T/7Tvd7e5llraytQMa7I7O4Lf4o3rX2
         kJjHjQAVvdeoI3zWXsX40ki2H5iUNbMa/UxFSg+iQoH0wGay3smV0oqHoMEv1akgRqLV
         ztxZOz42l9XTyHrIizCOSvxJ61LAmo9ffWKl4+wEihqVjYCwI6//Ct3LIfCpZiEbL/R9
         zGu8wkqzYPn6E2oHIhSkb0NxgvMCmTAslSluQEvk4zejpwn46Ek0G4GZqks4bLVSbcXG
         Q3pCJ/Ca5iQS6SGSiTe5mAOlh++LqQELf/KGHEAgZzP+7ODoeAQX2zIN04A35qB6Ncuw
         jZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmHVSMt3hKx8InuYAI17/sDtyG9rfhJDWS3yYq8iSfNbs8glG5sg8L8SogWoQrIaynzePUKB3Z86W9iVWPcxI=@lists.infradead.org, AJvYcCVbWbu1bu/7WwFQkZ6AKj8TAeJHmfkaEkSq6JmrEnJ6l2cwZmr0BNwgh26AarQZP8VIaVlOuCy2hbD567XhnteS@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQUOHNevgunEsKh5RkckUu0Gcr36UbQB1idqnhrPOK99FMcow
	Lzh8cR1tKItPBYWhRjME7qhGZA2Acg2q1Qeki7c/aEMtlU1pWVqPhZ19GFddTRA=
X-Google-Smtp-Source: AGHT+IEKqRcc/BlM5jdtPFigKOcuoyKaziXHTFpzuCBlf/+AQSM1aLQDV5fQ2Q5I6XrKnFzSoZmINQ==
X-Received: by 2002:a05:6512:401f:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-53b348cea2amr3986159e87.22.1730129845496;
        Mon, 28 Oct 2024 08:37:25 -0700 (PDT)
Received: from razdolb ([45.12.135.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1dcbbdsm1110984e87.236.2024.10.28.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:37:24 -0700 (PDT)
References: <20241017-rk809-dcdc3-v1-1-e3c3de92f39c@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
    Mark Brown <broonie@kernel.org>,
    Alex Bee <knaerzche@gmail.com>,
    Lee Jones <lee@kernel.org>,
    Quentin Schulz <foss+kernel@0leil.net>,
    Linus Walleij <linus.walleij@linaro.org>,
    Chris Zhong <zyw@rock-chips.com>,
    Zhang Qing <zhangqing@rock-chips.com>,
    Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH] regulator: rk808: Add apply_bit for BUCK3 on RK809
Date: Mon, 28 Oct 2024 18:20:55 +0300
In-reply-to: <20241017-rk809-dcdc3-v1-1-e3c3de92f39c@gmail.com>
Message-ID: <87v7xcp7bh.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_083728_254477_A80FA7BF 
X-CRM114-Status: GOOD (  16.68  )
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

Gentle ping.

Also Cc more potential reviewers.

On 2024-10-17 at 21:37 +03, Mikhail Rudenko <mike.rudenko@gmail.com> wrote:

> Currently, RK809's BUCK3 regulator is modelled in the driver as a
> configurable regulator with 0.5-2.4V voltage range. But the voltage
> setting is not actually applied, because when bit 6 of
> PMIC_POWER_CONFIG register is set to 0 (default), BUCK3 output voltage
> is determined by the external feedback resistor. Fix this, by setting
> bit 6 when voltage selection is set. Existing users which do not
> specify voltage constraints in their device trees will not be affected
> by this change, since no voltage setting is applied in those cases,
> and bit 6 is not enabled.
>
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/regulator/rk808-regulator.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
> index 14b60abd6afc..01a8d0487918 100644
> --- a/drivers/regulator/rk808-regulator.c
> +++ b/drivers/regulator/rk808-regulator.c
> @@ -1379,6 +1379,8 @@ static const struct regulator_desc rk809_reg[] = {
>  		.n_linear_ranges = ARRAY_SIZE(rk817_buck1_voltage_ranges),
>  		.vsel_reg = RK817_BUCK3_ON_VSEL_REG,
>  		.vsel_mask = RK817_BUCK_VSEL_MASK,
> +		.apply_reg = RK817_POWER_CONFIG,
> +		.apply_bit = RK817_BUCK3_FB_RES_INTER,
>  		.enable_reg = RK817_POWER_EN_REG(0),
>  		.enable_mask = ENABLE_MASK(RK817_ID_DCDC3),
>  		.enable_val = ENABLE_MASK(RK817_ID_DCDC3),
>
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241017-rk809-dcdc3-388632b4da03
>

--
Best regards,
Mikhail Rudenko

