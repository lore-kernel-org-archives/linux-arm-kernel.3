Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C203C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=; b=E+KFh3s7HVj17E/nxnkJA8wUy5
	aVVKQ4K2Lp3pyCVE66CNuLQJqFWmdxek8z3EbQ2nF8clVH2JE5p/Gplpd3Q3Xc9RDmmN0n2c0UUkF
	YMro8TgIz9kNTcOAnn9AFe41rV9gVpswfA1jl9m7oPwdK+VqZPouSiiPdHK4Y5ZkR3JE7qCilBq4/
	jMsBrG77gvOVkrGWKZX7yexvz/XDYaT2u7Wmw4fXqcgTLk90bFkG1WkFTo3755SdJNWdLTXTRL55x
	IhDnLnjY+OHm4iVKJW9afqovyLCsNNIfBeiCA7lGyBwvx0tKCe9sBY9r7Q6fYSxInvpftGh85MTmQ
	PCHnw8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yyn-0000000DbIH-0kXC;
	Thu, 10 Sep 2026 07:13:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yyk-0000000DbGP-012z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:13:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so53542445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024428; x=1789629228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=SV/JsOfGfyE+XdJ0Bwq5PUNRK+8uEnl4T33b+PE0oKgLBtv3GM4WJeONKe8VpAevUX
         Botz6nAornFqqoPSPmK/sQ49ExUq4fQWVMtE9NVjcwfivfuMaClZE645xJ2hiykWPHMd
         5PY/F6nxtfEO4cYBTKABk0XbDXJK2ePx2zcTOZl72fuCyNFLEZOo7WR8U2PDNBuHikzI
         oVf81+oKtCx2Pet220Ok8yEcZX3mvZyr5iSLoOowAd9iPWKNhkaWcCE9798eEIqeLFc4
         jTu8OFDJWQ8P82ZOzbOjyMusdn0lcqQCFrMWq4mIjdg/g8Y6vQF/CbdhWI01jdz9AYYg
         UW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024428; x=1789629228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=Cg4o+1FyGj/CYWZ9PDaj5oxZEgTJUVJDCoBMf1mhSDRmiu7WU7SCQjkvdCJrGLgoUi
         v+sJZWSk2F9RpHADxzc7iOm7yKe8gi1cyrxPpihR8xDY703YIHZ/iBYCKHinY6rFQR9B
         CaiSEXf0AtdGQ+/GRvSBaMHRgioN+w1BxwBGrpg7LaN5cySOfHWiPe/hujBBUW1Jwnb0
         BBX4xQe6lf7TOWoVxBCfykVBUEhlALjU+89Y9r9ymay/oYSfaabhxa19rwh3cfZRP8dI
         EJh1xrEhTu547SYnm3fvcc2fLbgJcU0mK9aWiMarwV2DgNf4xb26sGrfaPTQRo4sOY4Y
         oThw==
X-Forwarded-Encrypted: i=1; AKwUvBzoYCkuPxOjAMLuRuJqCcO0Vdn0X7dxOYSDwRPfcs/v/56n1kCZpIjH0aMTbDrgGKqJcOMEY62dFBNxrHttk+El@lists.infradead.org
X-Gm-Message-State: AFuF++n7NQmGPixwboZG2MXhpBgEqKKT/v+dbb91kQeplDomH2x/QyhU
	SQ9qXLFb59zZgZ3UH/yI9Dzm/dbzCUx56+LzSFLQMIZz4cA9QKzxxPzsEsghexbYNr4=
X-Gm-Gg: AYBFou1XBeD8lSGUL7GRNJflU69QMmqcriIU7x0NSiGELFvwBmYt6e2dmLfGAmm5E2e
	qPvZjVqPUKEA8i4ZiP3EhkxsKWGeCfdEPdwgVuodd0tKqQsJpqNdsSYPMkGWvg5mOiTRQl76PW+
	MaYcGxrNkUUiEmK1zNLG8oSSHenWaP2+Ab3DJHDpLkGgD+od72ncN2ojH9b0hV0O7rI1LAD1llO
	erqyn28QhRPtpQ7oiHR/3eUyTHgJebaqOOrNJ0Q6akn+PZM4wqEIPH9CuIFJ6hWwqhWWOJAwoC1
	a34sYbAcKQEWWpa8QRvxU/euRHnBKuW2voJFfR3O6E3lA397RJtLjpLwxtptI+/stgmtyxcQQrf
	lyof/qCqfw54qSDm4E+/OaTTwDuwuXL0CE+LjWmkrp+/hqewxzwv02MfLmRKqbw1J0zN2cuybGD
	PO9eUCZXegMCO5i4BodosRkDvKvH1lwIh+hn6lo35PffPw3dsrojgrDVwLJM2zjqyxhezGGMR8E
	+0k+wPpIj45hfL1oPMShDkI51Is/pdwYn4eEVIvdJOW8YEeZNYbTISVHKRNa6FsBA==
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr379662315e9.16.1789024427828;
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm51612002f8f.4.2026.09.10.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Message-ID: <d2e31f11-24ab-4d2e-8f49-d625e1aec930@linaro.org>
Date: Thu, 10 Sep 2026 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_001350_071832_436BF7AE 
X-CRM114-Status: GOOD (  21.87  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/5/26 17:32, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.
> 
>   drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>   static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>   static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>   static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>    */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

