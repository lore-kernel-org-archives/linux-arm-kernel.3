Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILKPl0SNay3a32+/RRSyxh1SJEExDN/cTqsidRAj8PU=; b=BKT40u1zc6kVMpGhXPLMT7RuGm
	qdIy2PKbRIWv5NvVIgA1NZk4GI/93LuWs1/HrVAzklcBQEEvY+0cMZXabhPxjVwsVyHRAkRlxN7IO
	OKKFos5HmNcf8SYmT3rUWxEiIMhWNQfoxgx9IeXY7vbt72Vhhvf6q+4785aq/9AdKT34yzibjTQGa
	T2qv7U/sSunRxOtIhO/HF5/9BW4vlOmzBBSwhia/o8qlEE9ClBdhp/FkzUqbZtH1og/8weBlYtoBn
	1zcGzaKpJgEfpoWhJrKkSnFAht0UkK/QsY5FUG3w33gqG94vVPe89wkHnkCEe6SuXwaVgamksBYGY
	xK2E01QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknMs-0000000DxhU-2sPx;
	Wed, 19 Feb 2025 16:56:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmMn-0000000DeN2-3JMW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:52:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-221050f3f00so87753605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 07:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739980325; x=1740585125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ILKPl0SNay3a32+/RRSyxh1SJEExDN/cTqsidRAj8PU=;
        b=cq4TF6uASBLgVej6GM0RqrODox1+RXrpyFua45T5c2Qi+sMzt5CmTyQmRe9y8SszJU
         fBCXfaug3rprFE81RoX9Ws+jmQ/wsjtH9bv4fAo4cqH9hSfnuV/Utxd1XYBNJjC/O6kF
         s/CuGhkBouTWl1vhVYEjgC3Cp/mrUrl+1z1r2o/hDmCB1XyGY6JIT1qjWFtWTVZXjDQw
         JQEGRZuw9WzxWaz5HURShK5QY+T9TYPEqRqFsCacgZibRMviAYeNXSrH65CNVFs7DMNL
         /UNM/eEkIWtl1dPd/i1klXG4ZWr6kHcnoqPlURMjAwI81nJFOzCtHrYsYdxquNbAooyM
         Q8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980325; x=1740585125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILKPl0SNay3a32+/RRSyxh1SJEExDN/cTqsidRAj8PU=;
        b=kZfgisu8S9ptcOoQIZyDcgj9JeSEeLu9p0Goldee/9VppKw4Ux+2H+/gV+5sY7+lG9
         P88twZxJRcT8SUiIXGfAcYJhjvPFmExnkZZiH0pUh2BDeDnbU4XQswRZU89a0HFLaYa1
         d/jU8LzbYxH2vVymvUd7Lg2/4TvuzoJOP9Fotc7k+yuQbKZ5s8U0FCda1K+Xhi1PjcC+
         Qd4OwCGMXmoOEj+ICluFDJdU1c2oKcNyflulQjPtQjLPHSNZ20tMEpI1y+hGPlF2g+Kr
         IlLYTuirSfGaPkkp6sywwbQVK0zWHfBB2wleqc/siZr8GBqXWZ1Oh5GCowwAi5hcfdYC
         tQxA==
X-Forwarded-Encrypted: i=1; AJvYcCU0tZaky0HQ5x3pLrpvv54U3cZp9zZPnnq2YT3Sq/wDux5agYBk3YYZullFK74eRpTZwA73b+gX83jgIgdkwOXq@lists.infradead.org
X-Gm-Message-State: AOJu0YyuOpH2v4KME+Q2rO3bkFf80+hnh9O8j928HgBqfJkSDnX/97CJ
	+FAOiLMwvwKlzPSXowewr9DIp8Mh/DqkJI91le7IFrqs8q1tqd54
X-Gm-Gg: ASbGnctIHFBIlteRFzy8UFZHZN3y3yhwwpPbmfclP8Tk80XQbQTRCYQQH5F3rYS/xAX
	QsW6o7cViNXvgtnsHQTef93gG8j1ByXhd11ElWhFx4+j2Qpxx655/2mF87KK59AB7Yj/X4jaJiR
	BGPjMh17qmTw4r5lxNth+Ii2B7yMHCwSybhlJaEod5lLUYq9Y70N3QxAp8TbKp4rtDIDonY8fi6
	8E3OOSooTeuKEsrGUHwJ4XOMhDJ4e+Tl9v3IGEn+Z/itkffDMC5NQab5sltUVsRnurCUtRKBT+c
	7i7GN9MCbJwdgNkZZQ3dbZ7qz8d8PWADs87TDYQRiSomA+BEI9vEXmkxeyCQ3Knf
X-Google-Smtp-Source: AGHT+IGW8+CBVhv4LqCaNkiqyMeXKPeQs7b+MCMYUpO6R3KWdsi8G6YGkHjrQBMgwy6+AQ9im63ntQ==
X-Received: by 2002:a05:6a21:789b:b0:1ee:d2d9:351f with SMTP id adf61e73a8af0-1eed2d93688mr7526340637.42.1739980324740;
        Wed, 19 Feb 2025 07:52:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dee4sm11119348a12.14.2025.02.19.07.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 07:52:04 -0800 (PST)
Message-ID: <ae40d143-a5ca-4a38-844f-ca58a06834a5@roeck-us.net>
Date: Wed, 19 Feb 2025 07:52:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, florin.leotescu@oss.nxp.com,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com>
 <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
 <fd70f78c-68a5-43ec-9eb2-3f06c5d7a20d@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fd70f78c-68a5-43ec-9eb2-3f06c5d7a20d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_075205_833607_7F0BB15D 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On 2/19/25 06:01, Krzysztof Kozlowski wrote:
[ ... ]

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - hwmon,emc2301
>> +      - hwmon,emc2302
>> +      - hwmon,emc2303
>> +      - hwmon,emc2305
> 
> Nope.
> 
> Was it ever internally reviewed?
> 
No. I intentionally do not review bindings because I notoriously get it wrong,
and instead rely on DT maintainers.

I agree though that this one is really bad :-(.

Guenter


