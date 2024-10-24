Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375CFCE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TNe2Ym34csTaEuiRW1/O4gceO7dqGqww+esQnWO0lg=; b=Co/ctXO3xMWWP2qT6ckjtJuesH
	I0DKE0m2ulGrmk8PGZCH0rEyNFVuqsYe6DFPQsaL/BrXd1g22/MZBwETkt/xYMJnvjtodcDOHRIrM
	qk0hEuqE4XCtd2Uupl5PgQCH6HLpZshOD+LeNGM8uRsiAqIZ2pFDD6IHvpE+rr2XWtojr8ql1xVge
	eV2Y3KaHve9XeyzvdHqP2VUxRS+/QBq3BMFClAfydXLIyt8nMwxcR0cr6fiWdZuHCA0FnaEaiFwOr
	W76x8F91fht6f7Xgbgw6PQSeDXBKj+8NNbzF+vs8itJo1Rt2/3VX9hAaWhpj1nBUruioe6HkIJAq3
	LVXJxzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Q3-000000012ue-0p9F;
	Thu, 24 Oct 2024 16:10:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40N5-000000012bH-17yE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:07:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cceb8d8b4so5904345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729786054; x=1730390854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2TNe2Ym34csTaEuiRW1/O4gceO7dqGqww+esQnWO0lg=;
        b=Z8hGQS1W9nNnaZPts3eoaVGSTgFa/TBaMqZwawLInu+a+1R+Vhx1azN3He4vQKdBZm
         pw+eil0IpknfNmvU0ykXECATKHW7QziBqcW/XJpHjy6taJHfZyOGeCGmo4Udu0VQFu8a
         IF0TcwvJDOLYSahLAEoCXQaJXyMexlnvrrPo/CVR9OrLmfMZ/fzPLpRomQZhG6DSG/C4
         iBN+QaNlEwX/btt0gNWBfb7vFyzHPGOw0DI7sDTSPIx2bR6a75zmksetZgpbQjslFw1o
         MGk47Am2qJxdvBpG+bLlQFgDTyOy3P8XljWiVu8CxFmJJpexcX/kBsaL9ZzSVOn8t/SJ
         rIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729786054; x=1730390854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TNe2Ym34csTaEuiRW1/O4gceO7dqGqww+esQnWO0lg=;
        b=ZP1qQ9DC5dmW1qATnXA5ZBIRlESp/+8q7MFqIYq8Xr1qZpN1cpzM+oOiEXg8H+R1AN
         E2avVp2l0wdoowZ/TvoYB1/je++V3ofzlD7rFT5rGDzbAo0+1/fHGUjan8zubERdzvps
         v7Lj7qorXtEXbY/9+Q6xHqiFZ8dtUPXTvVRzEWHrRAxMjZTtbeOVDN4U/qdyP/Ph3z0w
         ViVu+fUH7Gepkkh18VBq9JuBKTyEkpMTtcdTK6WsxQ+Bfdgk2H5i/8UC0fCJO1Gj0nVq
         eNO+Z0nZAOvZT1GF0q2K7gubsiOInkWx+gXDIdy9fdeQUU5IWSQaUjb9stv/ouFTp3he
         rvPw==
X-Forwarded-Encrypted: i=1; AJvYcCXkd17o1bTFqxzyon2VuHPik22qLFYizNlZIGgkz1OqTPH41r0HrbSt14/aTAdXIc9LLUluXe/v92JDE6Vo5ZQK@lists.infradead.org
X-Gm-Message-State: AOJu0YxsS6tNuDpnkaklBKOgFqi+38LZsQTds9vwl/IqidkP7zSUyJYb
	KmtaOQu3SDARq6SXtImWPb8MY79gdQHRUtxCxrdRtCBjDOWGDTbi
X-Google-Smtp-Source: AGHT+IHelvnAnzzyZFpgXYdYPCQlFtmHXCy4JGArTTYWPneli64ZPa28QteTqe35EW6LYZvcNZOMTw==
X-Received: by 2002:a17:902:fc4f:b0:20b:a41f:6e4d with SMTP id d9443c01a7336-20fb89650ffmr43374945ad.15.1729786053504;
        Thu, 24 Oct 2024 09:07:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0cbe5sm74037925ad.96.2024.10.24.09.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:07:32 -0700 (PDT)
Message-ID: <ea1be8af-0948-46b1-a1f4-fe572861cde4@roeck-us.net>
Date: Thu, 24 Oct 2024 09:07:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
 <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_090735_365756_DB2F8CB0 
X-CRM114-Status: GOOD (  12.93  )
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

On 10/24/24 08:40, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Oct 24, 2024 at 03:15:46PM +0800, Billy Tsai wrote:
>> Aspeed PWM controller has the WDT reload feature, which changes the duty
>> cycle to a preprogrammed value after a WDT/EXTRST#.
>>
>> Billy Tsai (2):
>>    hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
>>    hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload
> 
> Huh, I'm not convinced that extending #pwm-cells for that feature is a
> good idea. Unless I'm missing something none of the other supported PWM
> chips can do that, so I hesitate to change a standard for it. I suggest
> to make this a separate property instead.
> 

Agreed.
Guenter


