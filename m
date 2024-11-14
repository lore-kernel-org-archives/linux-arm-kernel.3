Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AC4D65C68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=; b=4umEVelZQT/MVtZiF31BlrORUK
	9T9XGpDLSVyEh8igQsmMT0u6BnTrIH8BS3TWaUclVfwKjaYY15Z3fAh2ueDitmqfWDlEIj6IMeg6b
	D/XfZaCwxOrJQY+3wnWqXEG51j9hmtSiaDCg1w0oJiqsVP0x37QkeYHVEx9lxVET3LDteBCYwQwCB
	UcncVRV6GXfr93ccNOFSDK2h0QakMIvl3lwioh4j8saiSkkU+m7zsdChOZuJOhs9J3y4dGes+Y/ni
	umbW/mjXGgJurzUKmYZnjB/AdSWhqKK51vHOr/LSHzOLofX2bG/xRq+CeB1V3Jv5MVYSi7RLLlcQt
	G+ZuHLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWVU-00000009QES-3ANo;
	Thu, 14 Nov 2024 09:51:20 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWTd-00000009PwL-2bxA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:49:27 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5ec1ee25504so159216eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731577763; x=1732182563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
        b=SkgEmvibCLqg1Z14+/p6Q47eq1JssoHVcLN8mkQ832Z+mxjgbcJJ1ynLE/C9VrRXaB
         FTs4hLO2CpskWmgtSYMGB9jgCXQ95pYVFmd0GMxdU1Sooeeo/Zr0IAP6T5Y6xG0iIEoE
         qLBmzE1bq1fdidPdcU5LrL0f8OFXKI+YsNpufJOp3+MRMfbRZF2oxGm5oHLZLCHB5N2R
         t4Cwjaz3Urkcx4msEPCUUN/7gVGR9WFZi+eBZHAWpeE4WMV+mEi4guWYa9bDRb//jnPQ
         VBF49XvCYq2H8ygskWFJAt6CvYQ/3odL49sQwGVq9CTTlat1kQ0RBcRncEiSLk5+7eB6
         SEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577763; x=1732182563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
        b=WVoq926VVBjm4LIoMqqA2IdUva9B+dzDdyv7Ww0asoUd5+tiGMyAcHzYUvLKat09aE
         NRmqofK6ssgpes/8ln2U5DIFiE7ZZ2ByveCJrNW03DdxH0FOf5wjCPF/7Q6biL7XBoT3
         Zm0No4lR8QgxodzCD/IzzMe58/lg5JH4VpeFjhIW9Uad0h/w1ARTR6kyqMyP7W0RPMV+
         FPbz/O5Y0iUoUsdwxymUt+dwHaQQ0NFvi9kXEG3G2MsjECQnhg/jt4PkD4Fwig6rEE4K
         /wnfC8zvKsWCGgNzxWbaRGkJd8iYC8URSBDMJs7onvCdj0s0e5wjK2KVHKmch3gtwVuY
         deYA==
X-Forwarded-Encrypted: i=1; AJvYcCUWPEfgG7d9Gcp6S4ANvAgSg6RHx70n8ZoW5nhJeo+WvRFmW0hDHWSYu8hd8/NCKkWnfLZCY3/fMhXsHX6AIrEx@lists.infradead.org
X-Gm-Message-State: AOJu0YycsfxBaCSlduZXs4rmnL71eh3jm1Uv2jmSYz9I2+n61xhJGvnO
	2PqX01SjoUam2DW8Oq/5U2fvwPePg8wDl4ZNEZgR+LWX5+uReX/K
X-Google-Smtp-Source: AGHT+IElpYeRFs0SFCU7YxvfDnm+J9VKwBd+r6YY8KKPQksjpdgonuoZU+lvxZoNdrIbZVA3+RzO9w==
X-Received: by 2002:a05:6830:631c:b0:718:c2e:a193 with SMTP id 46e09a7af769-71a6010a842mr6854545a34.10.1731577762840;
        Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b37e01easm713510a12.24.2024.11.14.01.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Message-ID: <8e55e276-f2ee-4679-8e0f-ca5afb3653fc@gmail.com>
Date: Thu, 14 Nov 2024 17:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-4-a0987203069@gmail.com>
 <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_014925_698141_E495FD3A 
X-CRM114-Status: GOOD (  11.38  )
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

Dear Andrew,

Thank you for your reply.

On 11/14/24 10:56, Andrew Lunn wrote:
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay = 0; /* Default value is 0 */
>> +	} else {
>> +		if (arg > 0 && arg <= 2000) {
>> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
>> +		} else {
>> +			tx_delay = 0;
>> +			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
>> +		}
>> +	}
> The device tree binding says that only [0, 2000] are valid. You should
> enforce this here, return -EINVAL of any other value.
>
> 	Andrew

This will be fixed in the next version. And I will correct error messages.

Thanks!

BR,

Joey


