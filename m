Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88EC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 23:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT4RA58kZsgWbSkRHLKZhNgsm4pyPu3PviW5NDVxO2s=; b=B/I9x2ewVAHqnfrF9P4W1tp8n+
	j9iboYoIUhWLK8tp/5GxPfK5IKE6Cm2LK5ryKlDhRveZ07emOgaUu5rAUfxjCAM5hZjY5cynJYdsS
	1WIz4OyWwb8kWbkVt9n29rS2mEONjAoXvWlaSYyXKMsBjKWyGFC9IOKfIMo5WpOXS0Oi+woHloZD2
	amWDK965tVc8nCPRSGRFSPZ/OUmlbG/eOWZ6WDJ5v9ts7szfzth5islqUW856m4Rhjp9uKcfW+c0d
	QBVSjDrVLcafIFXDUeunCwPN7EOUMfFu9Zv4PgR6p0AHdqU5O6ACTQ2/VJtLYGE3Wyi0/rELpkp4n
	jv5lGxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBj5h-000000069Lt-0zs0;
	Sun, 04 May 2025 23:49:49 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBixj-000000068fx-2ojK;
	Sun, 04 May 2025 23:41:36 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso40002366d6.1;
        Sun, 04 May 2025 16:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746402094; x=1747006894; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pT4RA58kZsgWbSkRHLKZhNgsm4pyPu3PviW5NDVxO2s=;
        b=UxG7Ezltz27L383xXbqjq4/wD5RaYBmWaUOFzT1/lIlv6oeQtOp1UAA58Ola8x1gv/
         LCggvOpuRa5NhSUuT9geP+nnH2AIlovcguOXxr2t8B/C6yySOaWyGedBbMhGLmt5T/o1
         pl9MT8pfRrenrcYTsXxfdLlLG8Q9egZaJ1DHIFTBwWOdqEJIBQdDz03FdanXh5intFZD
         FQyZ2TDV7OYsyPU0Hbv9zwst/q7pZ7DZzS/V8JP+RbF67zVGkEIpx7jnI0vCOKBpEFgl
         EDBYC/QYe0rnkhbj+2M0KyJJB+JHAPYzrNutyuVDC5FV/Tdar+dxf5Oz8Z9uwjpUi26y
         qYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746402094; x=1747006894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pT4RA58kZsgWbSkRHLKZhNgsm4pyPu3PviW5NDVxO2s=;
        b=D5CXxu0w4jeHUmBCbyWPe/V703WPxuI6z9pJCMLWK38OONDzZLFsRXasN6p0mw2+SU
         X50c5LlFImjui0EXj8N/Dpq0Usor+RJdIotv+vh4TGog2LYhDm4+XV8mIFXVKXWRG5sP
         Zh1Z/XXn89iGxelnyLYqHhNpJ5g+IWDntT3crdNN/iczMU8HzmdKGnfsfUvVhgn0pck4
         o3lYruu2L+Zqof1Zzjh1mzGCZzvaBilIWhVj8ev9bpaLb9DzhKL6gmrI89pnzEZTsL/0
         FIuNwiHESYWTAtThIuOo0mnP7Lq28bie3u5TfV0OEp4tVHy/hm8hGLwXTd5C92f01IJi
         sYSw==
X-Forwarded-Encrypted: i=1; AJvYcCWbO75aUul5qbGzFkLoPOVnVpSz6C2r39sD7pU2r9ZUFdTmGYRsWgULJ94xmZt6nqSQfMewCdnpX5W+/5cdLEkp@lists.infradead.org, AJvYcCXPzfc1hd7KCcIxCCOyn2oaSlAOaD5aEnxYVeOgs2J7VHOd/pbyPYXawQRRGS3FF8QIC2XqRON+QEuFOjvQvNc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAf3gnSpzQlcW8scZhcGIQD2TJX2ngLhIoF9fg8pSNaraqns5y
	v7u6tqOOMqqrVivL5nszLVq/a5en7B1S6SlQC1rpDtgPk2BEM5ZQ
X-Gm-Gg: ASbGnctKady+SirUKqXLSXxv+iLYlmLF6VLzIe+VVohT0ClM7xWAC9wOYxUfuRv00bX
	IdJ27gJ/4Tfiiz5crFzcvZZtwxaY1fv6r5ComDG3O/9e+4QwLPZz30DxCUyhMvIszZSopQeifuX
	5KcvZAzFUZidyGhBoXSxLZiqH9gT4+ay2n7YuSxXE2+jyi0Az0pToFxR9gOIs4vokPV53NJQRhT
	5moo8UVMvIK/pAfKfF+ZwDfd5Zq/s633W37rOJ9kvTbN/Hefj9fxgTtuH6YXLPEoxO2Kt4a5Xvk
	gF637DfiZp80DndpbEn7OjO3bNN6Zg4d8C3wUjr4YcxHZCSDhdLkS+uC4/lDHw==
X-Google-Smtp-Source: AGHT+IEuS32WQXdYrsUKx3W6fkH04iM3f+qJZnWVRNzxohjJqcepLThyrNOUzuchkb36omAniuxWKQ==
X-Received: by 2002:a05:6214:d83:b0:6d8:9c92:6555 with SMTP id 6a1803df08f44-6f528cf17f5mr81249826d6.29.1746402094429;
        Sun, 04 May 2025 16:41:34 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b05b0sm48091906d6.1.2025.05.04.16.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 16:41:34 -0700 (PDT)
Message-ID: <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
Date: Sun, 4 May 2025 19:41:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_164135_714520_ECF281A3 
X-CRM114-Status: GOOD (  15.64  )
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

On 5/4/25 7:01 PM, Andrew Lunn wrote:
> On Sun, May 04, 2025 at 05:02:33PM -0400, John Clark wrote:
>> On 5/4/25 10:12 AM, Andrew Lunn wrote:
>>>>> +&gmac0 {
>>>>> +	clock_in_out = "output";
>>>>> +	phy-handle = <&rgmii_phy0>;
>>>>> +	phy-mode = "rgmii-rxid";
>>>>
>>>> See Andrew's remark on v1 of this patch.
>>>
>>> Hi John
>>>
>>> If you have questions, please ask. It is not a good idea to silently
>>> ignore reviewers comments. Either do something about it, ask
>>> questions, or politely argue why the reviewer is wrong, because
>>> sometimes we are.
>>>
>> Hi Andrew,
>> Thanks for your feedback and the link to the RGMII delays discussion. I
>> assumed you suggested switching to phy-mode = "rgmii-id" from rgmii-rxid.
>> The vendor’s downstream kernel uses rgmii-rxid with tx_delay = <0x20>, as
>> shown in my post. I tried rgmii-id and removed tx_delay, but the interface
>> failed to get a DHCP address. Reverting to rgmii-rxid with the delay
>> restored functionality. Any advice on correctly configuring rgmii-id or
>> adjusting delays for this board?
> 
> What PHY is it? Are you using the correct PHY driver for it, or
> genphy?
> 
MAE0621A-Q3C
http://www.maxio-tech.com/product/12928/12929/12930/12931.html

> rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
> possible to use this SoC with the correct 'rgmii-id',
> 
> 	Andrew

