Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0B7F4612B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+oWMSCKxMSzMwfiT72a6Og/7ntIqLA0/09brtyvtUs=; b=fxEq9NOtQXFPiFQ6olSJHm9ic7
	29UE97lKr6RhclupwYiECyB2izWQSCZUy41j1d4hx2DgNP6Hz9PBr6FUdoFtjq3+MX32HjuyqorcD
	BEQJm1huRjEliFTqzJQDFmyF05REJKbvQpX3qs4A2xjmYs/lFXUoU49g71VJAm2uSm43nYq+ji8Ku
	JCW99ZyWMSxTfsV2W81hTnXSl95UjVXwasaTQthdW0xxSDBvqkSYU9ZHgWU9JhvYKtXLea1bgWbTc
	KvTztWiMfUbM2Ma9RCM7i7ufMmkqSMK8Vr3Dnwqxxkkkq61glUy+9D08QAo0GxOmrOWe7MjOFnpnQ
	I92vpleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gXH-0000000GwwJ-1Qve;
	Mon, 23 Mar 2026 14:45:43 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gXF-0000000GwvY-04FC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:45:42 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so2617221eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277140; x=1774881940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I+oWMSCKxMSzMwfiT72a6Og/7ntIqLA0/09brtyvtUs=;
        b=Dp0SYDl8Voe97mBkT6cXp2MNlNGVspYwlSfsPD5XcJBss5RUHtt67AGjvSjWiHT5PG
         NzAsolExUuVquRKIq0Xs71Cl459Rwzpjo9tQ6tLXO31ug4LAJajWq5Qokbm2jS/mLbjE
         bj4OmMZDIN1ZPKa6zBGDCAYZ3TT7PEP7VHiy9nykw+YZmI8S9ooUqI84SDI4grBmuQOQ
         bZo9ZCU5DGgB92oR6mEGfZ0DAhMnQBriGBQXTH+XUTBMvEr5DM0BgyNC4lEQ+ETH78s/
         rFfWR7n8c2f7Cw3rqoMANoE4Pq028impptodY0HGhCKKBlp/INgKYCKNehhCf3Fm49DS
         W1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277140; x=1774881940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+oWMSCKxMSzMwfiT72a6Og/7ntIqLA0/09brtyvtUs=;
        b=lJdyfrqTvuA2A0ws3E+EpBux5hTMnTYv/WsbPZh/EZssl2Eua7aw/XD6skIRXoE/+4
         AhXGGkfxGjnP9KQxYzxzrk5f4mMaaP+GLBwltoURJXrTwSgzlNnoxZ457BCo/q5hK6Ok
         E1xbRKY9KtseNilsyiVYtke/KvioCGB6TpZaDhwFeSaFU8gtXup4wuyNNMaO7IAYySYG
         3Xg2RzZQbG2Tf+uV5pXhUJCr6Xsb9a/Kx4r7KWEbaVlfGasvuqW+5ArdAGoUFzdTEPAd
         ovPS81BA0sRTSkJPwfKbtJT116a6fhzC/E/WdvwjmUxcNtjiZgIP6SQ/xgEe88pW27PT
         PP/A==
X-Gm-Message-State: AOJu0YyPNeprQo65v/fWkRi8DtXFXSkiSSozZ+fncIbcSodVver/C48R
	ru4d9zZptEPGZmfwV3g4tftxqcSekCbZ1z1ajDUFSIwPcNeVyPnQ8SNA
X-Gm-Gg: ATEYQzyIqatNyPX+qJLsNkY8anlURCVfQl3OQExzgaW1iZ1PtOu73ZO4bsuJ0Msknrd
	BQRpv3gwqafcRHCITI3P2Xb+HbUEjhVPKYvIOx/06UAmCjSDkMf/YQD1OK08yF1QGtV2R+LUM4O
	vR/ba801hUDfFLSOhgTb46uanyGgtBv8QB/5shVy/8iuWfLi68YbGGhrDX/iYDz+PTAPNitoaoi
	Y5vc46yBo0/xv2R+c0ymT2NZ+sKGXuHhO0m8d6FxdIiFbBDcCKaYBGxur8CHHUWly4qdZ4IUsbR
	muHtDmK+awSAco6nlYbfg+uDDDYA0Oe5oXN9wCFQt4oX4XUS5UKQ7npImZfLkwXseu651t84cOH
	GNXlQg5VFgdrflgwfllLBxl0kdBl1DmWDJUEmxoyaj0GoZXFjcFJmTXoY2TnDAze7LYed7hILt/
	mF6XQBbMQR2JBZsNz2+GawyCtSklmpnyTMYa50Dq1OMT5moOHQTody+AFpSQ1fsvWoZ1xZLNVz
X-Received: by 2002:a05:7300:a883:b0:2c0:fec3:fcff with SMTP id 5a478bee46e88-2c109712ae0mr5271934eec.17.1774277140029;
        Mon, 23 Mar 2026 07:45:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29d28csm15457195eec.19.2026.03.23.07.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:45:39 -0700 (PDT)
Message-ID: <696f0e32-5deb-401c-9b98-830c6bfdeca6@roeck-us.net>
Date: Mon, 23 Mar 2026 07:45:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] dt-bindings: watchdog: Drop SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-7-mwalle@kernel.org>
 <f124b200-09e3-4e73-a100-f47007732e8f@roeck-us.net>
 <DHA13HM1GIJW.1E7XCMY349JX7@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DHA13HM1GIJW.1E7XCMY349JX7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_074541_084311_3E65BE5F 
X-CRM114-Status: GOOD (  12.26  )
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

On 3/23/26 01:45, Michael Walle wrote:
> Hi,
> 
> On Mon Mar 2, 2026 at 4:01 PM CET, Guenter Roeck wrote:
>> On 3/2/26 04:24, Michael Walle wrote:
>>> I was just informed that this product is discontinued (without being
>>> ever released to the market). Pull the plug and let's not waste any more
>>> maintainers time and revert commit 354f31e9d2a3 ("dt-bindings: watchdog:
>>> Add SMARC-sAM67 support").
>>>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Everything expect this patch was picked up. Guenter, do you want to
> take it, or should it go through the TI SoC queue?
> 
> Thanks,
> -michael

I am fine with either approach. Wim handles all watchdog subsystem pull requests,
so we'll need his feedback.

Thanks,
Guenter


