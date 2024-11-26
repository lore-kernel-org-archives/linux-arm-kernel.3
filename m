Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39E7D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=; b=BfaaXX8moE6nd8doHCS6uDd2jb
	XeGjZ8CSEVcBjOmIel7ywmRTK1k+Bg5KHOLGPUnaM1TNNStfwpHQ7NshdnjjlCtOxALuirkG9dBJe
	nESoAgYToAoozrO/3ZbpUrh0TFACRAgpnpFO+vYhqo5LgOwLowu7r2JFVHQeBHRJPD0MwOBpJtHil
	ZMWa5LWT5r57CgyaDmtmatJlKZ4aRBFfI82ovhlpFhUwdR5l92phApbexgmk33kdndVYo32/Nq/H3
	XyI9Q15m1D/5O7fYWJWh1sLIejSxteqQEK4PBNh5MO2IdBj8rUtpnsm9x3TiRpXJiWDFiR+bI2Y+D
	IvsG9sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs9l-0000000AD2L-1Fry;
	Tue, 26 Nov 2024 09:46:53 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs2m-0000000ABd3-0ruK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:39:41 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ea49cc8b88so908752b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732613979; x=1733218779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
        b=OfewtGpzEgi9KYpM6Foyso8nOqMbKcf7iht66CXhHjdSYz1Z/2t853J9NN87wdHOmv
         OJj0dKlowRU+nBKsh7EiPJjsB3BOlCHP5QKRGigllfCVNmPqiUL607a0BWwMjXJk7FUA
         wrnY/jiNONifuptAE2We3BU36PpTU0ILE6ibdX5Xzk2peVeTsHo4USa18F+PUh5oCTXF
         c1JMGG+OQV9iZnqGJH5R44m4p4mVrzxgBzEG9Z8h6puPozePU+MZY1gCB7QT5NEezpr6
         0M82G30tbrpMkoGwHEL5StdgjWb0loRTC1U43Y3liXAscsfM6GYGAA4OGEW6vCR7d4Cb
         H+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613979; x=1733218779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
        b=Nis8rj/Prz53oWNqbtU/NCWvQ9yuoMfRltwAmA0yn3HP498voZxGk64PJt9S69h9Zl
         cusBF/J59VdIpEWAwlE6GWTOX4KWnEY9Gacjza4nFZ3sbU76EiU9P26sKEVaEQUf8/zQ
         mENMkL59/bh0ltIfAhbRQd+aUfOlH02nUw/dyn6X7vzAdgijOSjvtJOgIQ5epcX6KRKM
         tzY/4H1NdEt0KxXUsEldaj0OsbDRIUi1YJQ+74XaBKMhc2+vbCkqQGPV7VSqO8jVBWrm
         YD3gMD9tzWTqbtNQ37Hggm42i0MRvvekPwvX2Aij0vcDJqVq/DvEMR3+gvSat6J91l4G
         EZvw==
X-Forwarded-Encrypted: i=1; AJvYcCWtgA6K0EoxjNcYgpajXH8AFE75hYRzg4RpkPQKQ3F/LX9NX/dxPqwJOAyE/CIcO/SLu3/Rm19GwDchPix+tRhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9byS8tquFS8M2nMgNHVmNb8z2eR1IbF+5K7JJTf0a/qU2wPqF
	Ras8zV0AQia7HaWIRHX0JBBrhktAzmTlRYr/IKMpZEMekOgwaPeG
X-Gm-Gg: ASbGnctD4MccXqx5VRciMnZg50Qxa2C7MnrrjhlnUv7HFK38ui8Ak2dp5qq05wUZwjz
	4lab93kyHOiZ4xJxylUZ92Kbkv/9kEBSLeKKRDgRTYgTj0eOlNQ+KX5EscEWdIxjdywEbhibQkO
	mD3t3J8glWjFI8TpS3nXkQcwgBQnUIMOFPHT/pD+k+TZGoKmISwahardvGAl+AlJ1cwczBSDBAN
	e5w0LwZ4kJQhZ+FgxYMMGHIOxWS+VFDrHxAGLLGwMsxW1PkB7+zaQ4ZZXBZ/7f49D0Wlkv7u8ce
	BK3/x3IRMYt/lZYhzf/4nNY2FRaT
X-Google-Smtp-Source: AGHT+IGrPjDu68pnnnryOtllFazbBZWaKbpvb8qp33lzobhDwUA1rKma6IACU9y0c2nXW4nq4Bk1hA==
X-Received: by 2002:a05:6808:2395:b0:3e7:5cfa:87d1 with SMTP id 5614622812f47-3e915aef033mr13135476b6e.27.1732613978760;
        Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531247sm8159148b3a.104.2024.11.26.01.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Message-ID: <75e4881c-8b04-4b57-ab0d-e7eb18b31a84@gmail.com>
Date: Tue, 26 Nov 2024 17:39:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_013940_240393_A5D9995F 
X-CRM114-Status: GOOD (  10.50  )
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

Dear Uwe,

Thank you for the details!

Uwe Kleine-König 於 11/20/2024 10:56 PM 寫道:
> Hello,
>
> On Mon, Nov 18, 2024 at 04:27:07PM +0800, Joey Lu wrote:
>> +static struct platform_driver nuvoton_dwmac_driver = {
>> +	.probe  = nuvoton_gmac_probe,
>> +	.remove_new = stmmac_pltfr_remove,
> Please use .remove instead of .remove_new.
>
> Thanks
> Uwe

I will use .remove instead.

Thanks!

BR,

Joey


