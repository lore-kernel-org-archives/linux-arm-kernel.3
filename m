Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88566C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM+Uv2rAwVXzhOGxP6KAZNgm9EHUs0viW3Tg49mr9j0=; b=GkLDgSWmGqBEjog7idSIScQgDn
	gY7MXt8m6VyRJ1NI849rcafCn3BaN7QZHHjYusE2icq8siuo6FxvzGcIzIhDMJdVOSZ+8VFiwpJru
	gDAUyY3wGrKQYELKBnTvSul/9dko/1mdt/SHNMP3+4m1BsgdD90+8q1NWy3Wx3tJ12VgHyp64paWU
	ZcuuBaIDXbx0jiZyTJQP0Z7bD7sRY9wwNHtaWWEIwWFtz9jismIlgY9LJzVsmUi0xVuKHKHp0mqcu
	3Ay69am+Ei297sI0xD91WeEz/6dn/RjqFnuyG9Leg+8D2s09eLLDaIWCEri5Susljb3ybYju23lYW
	hZFYI/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnjk-00000009hqg-27lN;
	Tue, 14 Jan 2025 20:42:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnfB-00000009hLP-39N1;
	Tue, 14 Jan 2025 20:37:26 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso331106a12.0;
        Tue, 14 Jan 2025 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736887044; x=1737491844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TM+Uv2rAwVXzhOGxP6KAZNgm9EHUs0viW3Tg49mr9j0=;
        b=X4MNvGNGCyJfO7F7X61ZyEzfkoRGWrNcECeLcDQuGLwCdMbjxFOeYbXnnGni11dMaw
         7AzWjgj07ePbo+45apvIUgoa/D8ZU3wyHj9AvcXzZ3etF4mDPhEES6j/NSdu9zThUEqM
         8UgDhMYcpfDfEgCbWvg5wQiExEoPBSqCA7fFmsiEBnxS6mRtFcAuoeyCy7RXY0ksX346
         MTxR52epsmh0ojKeJzyN1Y6AIKHZFssZZiz3L6g9Q44aANELPo2qp6uZNY0DzbNxxobj
         7ZFIurCQ5Muvyn9op1WbbKCuDaMDxkFDG0N4Ce+A6u9QRnrgr4Ri9P2jouDH42GDbSeJ
         bycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736887044; x=1737491844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TM+Uv2rAwVXzhOGxP6KAZNgm9EHUs0viW3Tg49mr9j0=;
        b=LvOSSkZagGaUZ12iz77eGN9OOkXQ5zqgVbT2DcWbTnrCmEhDQN4tpNLLB9QrDN5Zgj
         1eRJd4H4m6LENddgaTPVhSe4dpGm8UZsAZLBAHJPBMXqk+DDW1fZUenHQF6YE6Ecz680
         DKw5veMWMSk9JWAav90aOerTPg802wy52469KgS3KRq15vyE4m4HXlYhhODex/JXs6Gb
         tk990auWbKFZQr2L+ZvyvFvHfmBaQfPT0ZCEkDnjOlkYQlBnuM9lHTTexg5+p1VdehGw
         saANEzm0pJwYH4gyzddWzF0QyD2Wdxki8k9pjp6hZIs1NjNuHD5Dmj0T4YL6/Yfypwcz
         ePHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5xtxqDzUGFuuU/dpleoCYBc8WGDyw6DNx8vqeY6hf9f2ShDJTqLjYPAFJnzTer98poNrSEz9ymxP8dzbwVyly@lists.infradead.org, AJvYcCU8NiOumi2tOn78lDIptoOn+l62RPcSdKGbVn/rElqV6AFoo0fNCFHguOwWp3JsCne26oFrBm+D3OeGXoRR6go=@lists.infradead.org
X-Gm-Message-State: AOJu0YwC0bCIVrNJaEp5/gkWiCMaiTb0vZSBgYAIKL0WQxYriVplzMv4
	AtVzGgAYvlQgaIGdeJEuM7MZk8oSb5fzZJ9mRLE1GEShKOR95G6cng0WIatR
X-Gm-Gg: ASbGnctgSNQtzyvMhrBcgpcvck9zkD4KVFMLefL43StR6vhlG4a7rv6V/+ZgY1JQMDZ
	/robPrFct5O8JBjDmHFm5j6PgUKr6UtVGED7KPYpvyJqb6Zepil3Uvp8Hd5e7mtfWClh61Kn6GK
	MDfvw4prxzRcB78pRgJQWiRhdNFGLy9TaEYKMFhLh2yh1Zkje15w1i80W3rHlpw5+oNCFUppogg
	XKmczsq6uUl1B/k+vDGyUnxsDdtMy9Ngs5ODhRsqc3WoBbnaHJWT1AUDZ8ZEUMDtngO8Vm02Ers
	MpI157Qrl7LobLcxn/+xl8os4E2lU1s=
X-Google-Smtp-Source: AGHT+IFQEXml/UJ1SmO7RTz8cpqU1evb6c+nigxt0ziAHVC34T7jXKhSq8MBqe+UKpQJZTg3WhWgHA==
X-Received: by 2002:a17:906:dc92:b0:aa6:7c8e:808c with SMTP id a640c23a62f3a-ab2c3cb6e09mr2218493566b.17.1736887043902;
        Tue, 14 Jan 2025 12:37:23 -0800 (PST)
Received: from ?IPV6:2a00:f41:900e:91ba:e7d6:162b:2195:d63b? ([2a00:f41:900e:91ba:e7d6:162b:2195:d63b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060bccsm663468466b.22.2025.01.14.12.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 12:37:23 -0800 (PST)
Message-ID: <91e2bd5b-71fa-402a-82cb-e68d3295804a@gmail.com>
Date: Tue, 14 Jan 2025 21:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
To: Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
 <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
 <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
 <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_123725_794635_07FDD35F 
X-CRM114-Status: GOOD (  20.54  )
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



On 1/14/25 19:30, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-13 14:12:28)
>>
>> On 1/13/25 22:52, Stephen Boyd wrote:
>>> Quoting Konrad Dybcio (2025-01-13 05:02:58)
>>>>
>>>> Make controller->node specifiable to both benefit from Joe's refcount
>>>> improvements and un-break the aforementioned platforms.
>>>
>>> How is it broken? I see spmi_pmic_arb_bus_init() calls
>>> devm_spmi_controller_alloc() which sets the of_node to the parent device
>>> and then spmi_pmic_arb_bus_init() overwrites that with
>>> 'ctrl->dev.of_node = node' later on in the same function. That will
>>> cause one more of_node_put() than is expected. I don't see that removed
>>> in this patch though, so the leak is still there?
>>>
>>>>
>>>> Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node reference in device initialization and cleanup")
>>>
>>> I've dropped this patch from my queue. I don't know if we're really
>>> doing anything better by managing the of_node lifetime in that function
>>> vs. letting the callers assign the node they want and manage the
>>> lifetime themselves. Maybe we don't need to do anything? Presumably the
>>> parent device driver will unregister the controller anyway, so the
>>> lifetime of the of_node will be ensured regardless. For subnodes like
>>> qcom SPMI, the subnodes are child nodes of the parent device so they
>>> won't be removed. If they are dynamic nodes, then the caller can manage
>>> the lifetime.
>>
>> Stephen, the wrong node gets assigned in the qcom driver with
>> multi-master controllers, resulting in probe failures.
>>
>> Since the introduction of the commit referenced in fixes,
>> of_spmi_register_devices() sees the controller's subnodes
>> (which describe each of the two masters) as slave devices
>> - meaning no "real" devices ever get to probe
>>
> 
> Ok, I see that I was reading the already reverted state of the tree
> where the 'ctrl->dev.of_node = node' assignment came back. So there's
> nothing to do besides drop the patch in fixes, which I already did. We
> can then apply this patch to drop the duplicate assignment as a cleanup
> and to avoid a refcount bump on the of_node that isn't needed.
> 
> ----8<---
> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
> index 3cafdf22c909..122140b97579 100644
> --- a/drivers/spmi/hisi-spmi-controller.c
> +++ b/drivers/spmi/hisi-spmi-controller.c
> @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
>   
>   	spin_lock_init(&spmi_controller->lock);
>   
> -	ctrl->dev.parent = pdev->dev.parent;
> -	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
> -
>   	/* Callbacks */
>   	ctrl->read_cmd = spmi_read_cmd;
>   	ctrl->write_cmd = spmi_write_cmd;

That works for me, thank you

Konrad


