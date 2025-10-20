Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C641CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQYtr/7sEDmmMLc6ugUR4fjhLSuMYN4opd792ZFPWlQ=; b=j7J8fXsyCqk10KZAPeSXOvV5Br
	uXOfGaIveIpMjthpVJm026zMHulqJEoJYdVTYMHvIRlNevDzhoUjA8x2n8f0kRuExsyBHsBdVIgxK
	xfWkcLi2CJ1aPzCpHNoPwOoiodVFRkvcstlOxtnqzuv6a3j1a9aLTVRIgZCAxhBHiz8GZZTSywgk/
	x+dxwRLwf0856PjYqfnxNemWOg6vch06JD0SO58hvyzDucOsufpL/5987AUHGL6vOmW8DJQMa8OTx
	OKz4dTGij5lz+WteifQ0M+xA9zBwlL67kOnOUSTLUYgit9KJcK/JMfoRn9QQW+th1HvBJ8HdhPQQ1
	gioEVjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvPT-0000000Elvc-2O0o;
	Mon, 20 Oct 2025 19:19:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvPR-0000000Elu8-0E34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:19:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46b303f755aso49635795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987947; x=1761592747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQYtr/7sEDmmMLc6ugUR4fjhLSuMYN4opd792ZFPWlQ=;
        b=TA6J0vW/sODKJt0su7oUgkTRgD4jHKZZ4mDZ4dk70PJa2ArTPiO/eio9M7xCaZSiG2
         hzbrUD1NYgzX9/dUdsDm7X7nzC2Wz62Lfbkb23fYPnJGKdinMrMtiSaiax1jPlQat56v
         Qo2bCS/wMPgEPErcuyDNXNFxKw2Q6kaXgRtcn+GTuxMMRuEKew28z/747gneWm8dB2La
         zM1cViGoCoXUJaS69WYQ++woNH6f2DRgorW9u7UZse3DqajOgTftRU5SwVF19vAtyfaC
         bxqC2V6CCdY7SuVEbZtvzULJGB7SU0pBrTtbK1hZqAoqdW+XX9M0dObPqYrwLsG3Cpbr
         t21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987947; x=1761592747;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQYtr/7sEDmmMLc6ugUR4fjhLSuMYN4opd792ZFPWlQ=;
        b=UbICC+AHIKBZTkk4FPe1BgVKCejZRqT1QhpQcK5Ar642h/CEhnPUCzNsr91dx3IWZs
         S1U3vto68oiDtiA4hhReugWnLDIpXgokSktlSdxJa0fiEbdEEw7MS2Ydu3RZ0PxL8pE8
         yybPwmXde5WVp3mA2Pcd6hXFY+U7vDZ82UsHs8MMFv3CsJyEOigNVTJjUxaUpDO+Iffz
         vm2Z3/nQZzN9TiPpLQugWenO2FtcAyDtcHneeZCHFh2EwI6YQ3O0ctxdcZ1dURni13Ue
         4YelsQ1QlNY+llrAfHPawwDMZi1bCcwwX2VDKfgar5FJ+3S9GT/jmHMH+uD+lbGUkQdB
         rxYw==
X-Forwarded-Encrypted: i=1; AJvYcCWN1wIyRGhGicAALBcD088xte8c1CGg1xUTcNOgrq1xBCMIjtCQHJUmYKLB2m2gUCsBWpuS1fWBamXKD+QCywNx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6eCS+muFOc2rvJkt9eVm3caEm2cZv01urNifUNWDfG6kdJKgg
	DLjuUWtWTJ5+OdUYsuBuuRcjEQQ3qA+ljFTd83jsVh+YBvqYFOxECwkmuxZBLypMHXo=
X-Gm-Gg: ASbGncsiXbY1vbmIwsV+C5L9X9PWTWFelu1gzPmBMPYencIe/q6evCTZ+XLvFRUWOo5
	coxheG4BGLMR3tRKnhj453Jv/NTDSeH9LVyqzJvg30Abx7QfNwG1hIGQkH9MUqFwCZZe20gq2Iv
	MMm+HTCwsKHdUh/3rTzf/t22DLw58XO45bOlRN/KaaC4kWaij3lP46g4AEQGf8PsjkLccz+WirO
	uFP4cTebJwINv7qmu5vIgEe9VB8FajLAp19o7Ks+9FKyFSoWoQgc9RLwW7H/Pnd9qjLlDPtCLhW
	h9gg8G8n4AvY0JvXom55wxSUcuxn1mnxsFVXigCV0uJV5sHCI7mlLGAq1RewSXqxW2KwfRld9TP
	cV2jsmZxnAHXrQ787zXW3SXb25qTF36kNxdhP+0VlohoyYuAbH4QV0/54SWDhMn3ENcsosirahi
	NNtaZm/Q+jn4q9rAm87q0=
X-Google-Smtp-Source: AGHT+IFVCGpeA2+bow5Xc59mcHd54jCuOxCx/IBPo7BEfszluf4T2+SmNyRQJAdcjVO6TmsyG6PpVg==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr107545445e9.4.1760987947193;
        Mon, 20 Oct 2025 12:19:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16419723f8f.4.2025.10.20.12.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:19:06 -0700 (PDT)
Message-ID: <068736a0-a5ef-4905-b311-9376e8fcbc16@tuxon.dev>
Date: Mon, 20 Oct 2025 22:19:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/31] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <a2f7cce73739fc795d17710a3bb017158c090735.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a2f7cce73739fc795d17710a3bb017158c090735.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121909_111018_6983577E 
X-CRM114-Status: GOOD (  17.16  )
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

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration

But only a small part of conversion uses parent_hw. Could you please
improve this description? Same for the other patches.

> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama5d2.c | 157 ++++++++++++++++++++-----------------
>  1 file changed, 85 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index f5d6c7a96cf2..231cec1f80e1 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
>  	.pid_mask = GENMASK(6, 0),
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	unsigned long flags;
>  	u8 id;
>  } sama5d2_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> -	{ .n = "iscck", .p = "masterck_div", .id = 18 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "iscck", .id = 18 },
>  };
>  
>  static const struct {
> @@ -164,12 +164,12 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
>  
>  static void __init sama5d2_pmc_setup(struct device_node *np)
>  {
> +	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
> +	const char *slow_clk_name, *main_xtal_name;

Please specify in the commit description why did you changed the variable
names or keep them as before. Valid for the other patches in this series
where this pattern appears.


