Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD71FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VehFZeMVxeEcvxBcB6BdQEKU+LkAx8OrL+503rmhaFI=; b=CVlXiVJg0LhKfXNbI+Bf0rYTH+
	PuoHlSXaAIIZwDTPHPsSBYA8Rb7T/wauNvlRWVN5C5TCFUGN6BgTyYOxs6X1rx0BoY/gI7Dhkh3mu
	+mZtwnHNmVmi5DMHF6xmdeoainYeScyvobUtrg2MeEU9dG22Fca1w2cfj5Pahtf3OKgp48ZGavX7o
	K2Q8zuYKhFni0RB87BEeppXhTRJsrPjRDK7BcxRuvaP2T8L2+XtR6MfCh+GWMDuwEO3lqi0K35cib
	jRMERUQ782+KPkZW8daAkDHlNXqbCcjHmIjUjaSZodGbIVwljvGS5fgdtqRibV6JiP2eApAMEKvEn
	Jt1n8AeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tucwX-00000006xJK-1xxl;
	Tue, 18 Mar 2025 19:49:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucuq-00000006xBb-1zEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 19:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D53915C5927;
	Tue, 18 Mar 2025 19:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D797C4CEDD;
	Tue, 18 Mar 2025 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742327275;
	bh=dFS4pl/4sy8BZRtwnSnognCsKFnhbc5h4Elykdy92aw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sMI6rMYzCjhn0kSukwMOEzlshenueJLzySVgYPx599Xjiw7OGx33J9MKvTlgM2Rn3
	 os32xddBS7q5gfJYm0SDxmli1vrZktT8XQ82irpNyrvzTzDWEQ2+JSRmIJjkLHb3xc
	 n3f+GFkIgrUnnw+/hlIRYRw06hIuX0WrhBYi9Puw7V9QXNW8xJBAPlMUAaxAOMlHF/
	 NJyzxwvwKW1newvOSOMSc8jqy1pYCkDat0ybewUD0gvuxj3HmLwZhvu0+91+aOnwSS
	 Zuy+Ql3Se/k1sFRJCjRaRnqGSzTwdqeVQbxEFGZBuxAujGOIqQ9F9NP4XQoYQQRY4X
	 RmwFKQuKu20vA==
Message-ID: <5ff8d26d-65bd-4b99-90b1-ae01f0ee9eb7@kernel.org>
Date: Tue, 18 Mar 2025 20:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] pinctrl: samsung: refactor drvdata suspend &
 resume callbacks
To: Peter Griffin <peter.griffin@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, kernel-team@android.com, jaewon02.kim@samsung.com
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
 <20250312-pinctrl-fltcon-suspend-v5-2-d98d5b271242@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-2-d98d5b271242@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_124756_605952_E8EEDEB8 
X-CRM114-Status: GOOD (  19.08  )
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

On 12/03/2025 22:58, Peter Griffin wrote:
> Move the call of drvdata->suspend()/resume into the loop which is
> iterating drvdata for each bank.


Side effect is that now each drvdata->suspend will be called before
saving registers. Please mention it here and this lead me to one more
comment.

> This allows the clk_enable() and clk_disable() logic to be removed


For suspend path - yes. For resume path - nothing changed, because
drvdata->resume(drvdata) was called with clock enabled.

> from each callback, and also avoids iterating the same loop again
> in the next function.

...

> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 963060920301ec90affb2ee6d758d3d602ffb4a9..375634d8cc79d6533603e3eed562452181e2ee25 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
>  		const u8 *widths = bank->type->fld_width;
>  		enum pincfg_type type;
>  
> +		if (drvdata->suspend)
> +			drvdata->suspend(bank);

Here suspend() is called before saving common register state (was
*after*)...

> +
>  		/* Registers without a powerdown config aren't lost */
>  		if (!widths[PINCFG_TYPE_CON_PDN])
>  			continue;
> @@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
>  
>  	clk_disable(drvdata->pclk);
>  
> -	if (drvdata->suspend)
> -		drvdata->suspend(drvdata);
>  	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
>  		drvdata->retention_ctrl->enable(drvdata);
>  
> @@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (drvdata->resume)
> -		drvdata->resume(drvdata);
> -
>  	for (i = 0; i < drvdata->nr_banks; i++) {
>  		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
>  		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
> @@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
>  		const u8 *widths = bank->type->fld_width;
>  		enum pincfg_type type;
>  
> +		if (drvdata->resume)
> +			drvdata->resume(bank);

But this is not symmetrically reversed now - resume() is before
restoring from saved state.

Maybe this change is intentional, but then it should be expressed in
commit msg and in commit why this was chosen.

I guess you decided to do that way only because of code:
	if (!widths[PINCFG_TYPE_CON_PDN])

This code should be symmetrically reversed, otherwise it just raises
questions. For saving register state, it does not really matter, but in
general if we assume driver-specific suspend callback is run the last,
then driver-specific resume callback should be first, no?


Best regards,
Krzysztof

