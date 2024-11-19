Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F1D60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=; b=bpce8oKHqcbs5BbgmhYm7u62Z+
	GSBLQ2gMUn+74DFiuPOgOUYLF0RvLyp4tlmkVe4O8FQ/ja8lo9dVnwv0Pp+RDVZsNzl+tI65yKJ+5
	4etLIj1Je45HvBFhxEh+3cgFM5SKhGFAAuABVbcbTSWnr0yIlT9DEVUv3GZ0FCiiinDEu3SIIGUGo
	7lygtelUPcJLmZjInfyhM8RXk7Y3yt6+JMNxuZzWSoU71a6gqMStBLyVxHgB4JhKMTApjtjMdtbov
	05DbnZ1JtuTiTtO7Gzr0mQzoV1FQoJjl9FyuPoWCngc/gajVUv9kiVxVWv0xeHYSQC9ToztqqoocI
	MalYscGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLAe-0000000BzVf-3QBy;
	Tue, 19 Nov 2024 10:09:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDL9i-0000000BzMe-3E1B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:08:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-212583bd467so2747855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732010901; x=1732615701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
        b=UXJnRUf+IwctLXuLsod/+VfXtla9UtAmI9331WAnhLStX9ONyNaTnT8ImMAkKPXhUd
         1SLnPZoTI4x/byTKKZCTGpVD8bTSW3uxnf2aDhFsK7WNjhZuRUMoAtQhtQKquW3ZbiHA
         pg4CBSrof9B1EX1wN+9+wg/UMkXNNZGqJL/1eB8WWQqavn9bBEFn9dGKQWDajQIwahs6
         UJ9KPkM4XdKpUx0ff55qgReGYqqwfRyVi6lk5S2lADLk7js2dvkx8Xc36FvBO7ONGcEA
         O/LinBOw+LAy/0QY21GFqaMirj82xQxDnPoOXWbbseN2ClnQJox//X+2SdQXnZSH7ecY
         9TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732010901; x=1732615701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
        b=DeDxifKs/NpOhSp7qe9KlMYLzPUk55CXapaiLYPQIzky3nuG36i65VjGNNTOME69Pk
         1cxVB8AhCVoKX8aqRhIZQhWpmHm4oIgDL4E9b5VEIfTsDDt6/OzvpCgWyikpNixMwm6Q
         ANNGAQEvvr/1gfLmJtwh/zDVUHKBZQrCEyWiACg8Q3IkoAR0Dsy4s4Z1ArUapZZiI1le
         NnTTSApEVCGVFFp1lsb6eCtHX8xqQN+9NGNsTeLnVxH3BYdg/uPradp1KvVLLEextFCi
         rsev+czLO+XaNPJrblpIeR9JQWUPW6Vkz7mGeaDOkw29jnlvd9OEDieFRhJ5BP1kTe3+
         K7vA==
X-Forwarded-Encrypted: i=1; AJvYcCUqgf1OtmpctnnLFJcXGhJsBkO32lLYTUJoufLNhhOqU8VHLHHShwyPRJnGZiNyL+eDpsOGoVoD9tgFUY6r7i1W@lists.infradead.org
X-Gm-Message-State: AOJu0YydfvIklpcMGtDZIFjdrD+K2uY5CLZ8doSfdYLjbrh+EMXg/G2x
	9tsulipR7wEMwCXYa1AOaF90h6JdJfhzT7vBPAd5DWr/ADAV5Khb
X-Google-Smtp-Source: AGHT+IEAjyQGdRHNm7PwkX2khYpceIhQ92EAPL/Ia7j4slTtR5ja4Ryry5i8z7VVQ8n6txgqIQJr+w==
X-Received: by 2002:a17:903:1d1:b0:20c:9983:27ae with SMTP id d9443c01a7336-211d0ecdac7mr237798475ad.48.1732010900702;
        Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2120ac39585sm41966965ad.261.2024.11.19.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Message-ID: <191ebf4b-231d-4ebc-9ff2-4916ef718970@gmail.com>
Date: Tue, 19 Nov 2024 18:08:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
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
 <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_020822_806383_B9136573 
X-CRM114-Status: GOOD (  12.46  )
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


Andrew Lunn 於 11/19/2024 9:48 AM 寫道:
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay = 0; /* Default value is 0 */
>> +	} else {
>> +		if (arg <= 2000) {
>> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> The device tree binding says:
>
> +  tx-internal-delay-ps:
> +    enum: [0, 2000]
>
>
> So only two values are allowed. Yet the C code is
>
> arg / PATH_DELAY_DEC
>
> which seems to allow 16 values?
>
> Please make this consistent.
>
>
>      Andrew

Oops. That was my misuse; I will change it to minimum and maximum.

Thanks!

BR,

Joey

>
> ---
> pw-bot: cr

