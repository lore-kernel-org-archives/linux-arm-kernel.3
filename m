Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D346CCA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTb+HR144WzaCHAGjWTq7YSgDtzJUyYbacPJ6jqxs7k=; b=rZeUndL7r6EHh/p+V7NtITPADy
	x5DAD5NMoBC6TnEfnmA6y1V/BODk5H/gnEC9bE/q8fEGJ46EEETysQT5fvrjNszEf3sAANPRXvk5i
	8z4aMM1NsdBdnztjtIedQRtbcoIhA/SGPFfWY1breUDspZ8yGqk9zVYhGygWWV11VX/BGiqwIwg2X
	57eWM7BCIA9i6K0/aFCzR1T9bX1CyPFkmqGqsojW6DiiGlrAFrGrYGqcAL1O9L5sHJOctOMTRXELy
	FTi8fL7BA4mZlXlroOXhfMlbXUPHJ1/k7+UsR3U6WTxNlaoKDXeKwpeePv5CpVWzPpM9NSLtsQuta
	EP4tqheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rqj-00000006yXJ-2nLs;
	Wed, 01 Oct 2025 08:06:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rqg-00000006yWw-2XeV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759305965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTb+HR144WzaCHAGjWTq7YSgDtzJUyYbacPJ6jqxs7k=;
	b=CPidk+MCoIl2utJTqPvC8oBQYuWopQl1j7dp2fODF4jl7FFnjAyNKmOOf+Ow/miAzP7ypa
	4LTTJtw5tP8zyYPDHj2j+kvHt6MNEG1dmPjna0oOsJBST6B4ToZEdx2b1zyFuPsoaC5m4X
	qN9hawuPuaBxjCN699CPdp/MGPFV+xM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-5DCYlSi0OlmIZLCYvk7XEg-1; Wed, 01 Oct 2025 04:06:01 -0400
X-MC-Unique: 5DCYlSi0OlmIZLCYvk7XEg-1
X-Mimecast-MFC-AGG-ID: 5DCYlSi0OlmIZLCYvk7XEg_1759305961
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e4335fa87so25983995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305960; x=1759910760;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTb+HR144WzaCHAGjWTq7YSgDtzJUyYbacPJ6jqxs7k=;
        b=OlT1RcAublGszkRBuQO6S7rUMfE1tUQdeBu5yidiBi2X2zjfmTlSCWyA7IFF7YOy9o
         Sp+fK6qxbXW7ELrQTpNXlhyIv62gxW3TShmxQiaC4uZymKTELE2HsSW1LPrK3xUOUJt5
         JfXWFps0UAuM7V7+GvK5Z+nf+sx6amVYSojem9IklYYS2GNl+Z6tR3rJlzacyjZwYRpr
         UhpNNmuwaZVY7LJsTWS1fPbsEEWVBhdAMXtgPZN03OzHaDB7xvNn9wdSxptVdMkigAZR
         lD1BkJfp5LlFArEC70gY3udRMbHPhBAtC2vATba4IsWcoSIvEoeqeDFpLDNymgd9UugP
         /+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHoUEl6sIuRn2Y0md6xHPbrhkhR4/FSozLiY+yBEicyDuGG/Uci6fNbGDHQdWbu6q0HKIikio0+DJg955uWr+4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc5Dt3X8wjBzLRXr/tO7FRxmpspkOPyBtlxGpQWuQcIn9ftkgh
	NfKc5FKDcxJHqw1V9uJvDa2o9eFD6L62NTXlhtmu0j4dDqRUAznYFO2OS27tpPRLvXtbcTtjPY+
	iXkqX3hTs9tesshPcyEWL/vDym18Jvaqpc8FQj4Gb4znc0tjuFX83zUDFZBdRn9sfAklUpCknkU
	g+
X-Gm-Gg: ASbGncvB7TwZ9D2Y/j6rh42Yhn6o5I/uMFU96yDlTqFYEeLVgu996IC8UITZVMC8zMD
	Zcn2zU6XRCnS752GE8VMzhYaGhpcfnSaCAYh7Tl+qqDeEWkz97psV7G4OBxlftkofNXT5cC/4+3
	YrziwHVA15xI6glGLpTMnndOfShkoZmqWN/VZENlFBl/KFa+J5trvIyA0OkNBdNuQp1cOdpsyfe
	pTv7acQIOWrLSMJFVXVXui8ciZdfw3873FLgNVOEhb9GWlg7pJW8WgoTvvf9cJcRfjfIKcGCHXF
	N3ghfEDpAkKDNzZi2xd8wJVSaoLE5Vq6xpuAFOv9x9ObtqKtC3BWcWYY/nUCH2kYfcgJ2/VfzqR
	nAAmjFlC2Wt/CIiA1bw==
X-Received: by 2002:a05:600c:a404:b0:46e:6339:79d1 with SMTP id 5b1f17b1804b1-46e63397ae5mr11782885e9.5.1759305960540;
        Wed, 01 Oct 2025 01:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK0k0YsqKjJ0KQb6IWjzPtVVlPN29UZlYbY/QuFx9mxVtSijrKT1lChFjdgZCBijgjZoxIGg==
X-Received: by 2002:a05:600c:a404:b0:46e:6339:79d1 with SMTP id 5b1f17b1804b1-46e63397ae5mr11782525e9.5.1759305960082;
        Wed, 01 Oct 2025 01:06:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c44bd75sm30723575e9.4.2025.10.01.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:05:59 -0700 (PDT)
Message-ID: <02355e42-9b63-4ea5-a75f-0f4e20323379@redhat.com>
Date: Wed, 1 Oct 2025 10:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org> <20250930172022.3a6dd03e@kernel.org>
 <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
In-Reply-To: <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KJGwHwdDfmlrvUbBCYdE3chliZfa6_pwskMEWFJxEkQ_1759305961
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_010606_720410_429C7A53 
X-CRM114-Status: GOOD (  16.19  )
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

On 10/1/25 9:25 AM, Paolo Abeni wrote:
> On 10/1/25 2:20 AM, Jakub Kicinski wrote:
>> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>>> numbering. This controller, according to BSP sources, is fully
>>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>>> The glue layer around the controller is the same as found around older
>>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>>> this is the second controller on the SoC, the register for the clock
>>>> delay controls is at a different offset. Last, the integration includes
>>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>>> a separately controllable power domain.  
>>>
>>> Hi Andrew, does this look good ?
>>>
>>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
>>
>> Adding Heiner and Russell, in case Andrew is AFK.
>>
>> We need an ack from PHY maintainers, the patch seems to be setting
>> delays regardless of the exact RMII mode. I don't know these things..
> 
> The net-next PR is upon us, let's defer even this series to the next cycle.
> 
> @Chen-Yu Tsai: please re-post it when net-next will reopen after Oct
> 12th, thanks!

To be clear: given Russell's ack I'm applying the series now, no need to
repost.

Thanks,

Paolo


