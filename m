Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC191C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=; b=uFVxmvSibmjlcE647Ia3g4D8j4
	UpoVdS2VeZkH+1PsNEsGI3+8CmLgw7NZqD46/RrhaTCO8TvXQMoqkY1kpqsIq+OLZ87PGHGZT/zOS
	BncIIjdjS7QBeinEXOtvKN5iX4P+PXk512gPCK7gXLmC9uY+rFONJbI5AadNXxNVmPgfqB8nqxgjj
	fn6S+2UOTBJmIk/33LWZUXLGbWJ7RhWAmxjuhz4ktBY2ZEBPC0/PWPFJrmAiTKxNjjxiGMBABq07n
	eRstAVz0KQHZOAGAz9eUyroMFWxiJvLdp8z1xRZ4lQFhGWQuC2mKZtO0DpTPKwA13iro0ZJ8dKJ4K
	0TvRtdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOdH-0000000EdoR-0PEH;
	Mon, 28 Jul 2025 14:15:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOYd-0000000Ed1C-0Q0Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:10:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so902882766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711825; x=1754316625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=pxZ5fWer3uqrZo+r49gS6mWh70PMe8awmaaONMdo/rEEHwsnkYNTAp4XGkYJeZ5qeP
         8ol08PGfXS4UuSfHrG1B4wxUxVWXnvdOw4f3GquncUPNOGHuZsYg7sn53VTG8sTf77Lc
         1uB7oWu78XOeUp3vGR4tsryAw4OAwCftWv1ucw+grPUgLxLtxwfI4tvvX1g5YLVL6wCW
         HaneP4YLJ21ZvZN6B509ks1Q8RlXz/ODalyRDGd5UrMU6ZCHoql9J0EFU9mu3+aXymnF
         jyOSN+46pB+4fxjQ3zypo31Fod8BxzbszDcDFNDy20lAMC1uqKVb+IPc6QF5sQYcojRP
         lmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711825; x=1754316625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=tIpmo+WBf8khFxHoe+vF+di0lcWwEt/H2Ce/vx6t3VCK3xK3lJErNjVD7fTNLsNKs3
         6HH6/n0eonJKJn9dz/nN109SbDngX1wewFPCVWyFSR4DRvB5F6M9bYXZxY5Kz42zNVcT
         46apHBfIdpB9lTuM2G4o1Efg4/j/jAO1dPKrGihYrGFmnO2697dpi2EGAbfXtjTEPsru
         HxOkwbEeZjjLhtRR7HYta/PgFSTDVHOYMytdypOA282Be72mpv2ETH9DD1PdUpjZ+VrC
         /rAuO6V38nb6GiewTKbgeA5aSZ4beuKslWEyyX9KoD6CavZk1idRxiorj4uUWOuZxbHk
         81bg==
X-Gm-Message-State: AOJu0YxA22U+w1Oh3MOevKqpW7WyXoXcMrLubGoqZfQr6oY+Ofiyz7Jw
	JLw/tzlw4Yv/zoeSbUPB1exAIysyxJGN5AH3skxzELT5DsZYWaDFc2i3fVeQG4CjghI=
X-Gm-Gg: ASbGncsyJdnr+a2vLd2nQlfabGhUahhe06hyeugUhheljH+aRlEUWSy6naxHcfGIh2k
	Lvkyxa+zxrxajWWr46G3EcorS2dxEtumz7aRrqHn34wDD4bTcxp+qiH28COKLmM3gbrj9hdc7BP
	4Pg1gHiwMkZBcULAAfjuxDseX2n1kgRPgExFW+HV2v6hnCtnLt/06U9fe2uVgrZdRiArwRdKAYb
	3HAaJoyJmsi8PnUOKe3MZ/ks3BjLFIBXjOfGhLWKRHQuk3+5hDaXde9HXPS+K34uie0iVNWSwt0
	Cgwkqz5zELVx5OwzSThBtyolqTAW5u7hcDR56pxAoyLjvanoSnn+BA9SXC4IlGyAuzHROtbEkHO
	0450MILU9JrmszdRMQ1umN76Jb89q4qR9xS8fuNheUJ93rWmDnKDuI0/+8cnocU0=
X-Google-Smtp-Source: AGHT+IFw4HemneYmErhcNEVhL/wWhjoTApex97MjdvezqczWzvkDScv5n0Pf+ajLxJrV76XF66pw0A==
X-Received: by 2002:a17:907:c2a:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-af619aff29emr1265342966b.52.1753711825333;
        Mon, 28 Jul 2025 07:10:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a669c8sm420485966b.72.2025.07.28.07.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:10:24 -0700 (PDT)
Message-ID: <5eba28a7-3d5a-4323-b74c-1bdbc738b9f4@linaro.org>
Date: Mon, 28 Jul 2025 15:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] media: qcom: camss: Enumerate resources for
 SA8775P
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_071027_141395_EA4F2089 
X-CRM114-Status: GOOD (  12.21  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Enumerate csiphy, csid and vfe resources for SA8775P.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3a11c0a98eb1..b6e80088d1df 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4185,7 +4185,14 @@ static const struct camss_resources msm8996_resources = {
>   static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8775p,
> +	.csid_res = csid_res_8775p,
> +	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
> +	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_sa8775p,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
> +	.csid_num = ARRAY_SIZE(csid_res_8775p),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   	.link_entities = camss_link_entities
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

