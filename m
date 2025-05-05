Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3cOM8UgYVEzjO+LX6y6P1c8tSmP2BnZ7R53s/jgWTo=; b=nOdbzaqCL88atpq7HXotmQNWBj
	JQj3Utu+duoswnuCGTNjTmCyxYTHgb5NH0OFUl89v3bdyDwmQL8wFGQZLbrfM0/72rgy3qVBmqEyJ
	MVCZkcVozH7cwx49T+lM2/Hlx1R+hBSsxvAgL5yaslpYYIg0OhcfssMHiHB+CKOsz0CbGejFxrQB2
	0ryrbYxCN5cses9pZCInxAtOI9v6VegiYuy5CoLQVz/mgEOrSl5XlhlWA/4x9CusfljBWSAiw9qLm
	SkJB/NBZfz4tH/mEJuOb4RgMlwFNfHU+3rmhRBE1hnm5MJnkQ9hOVDOi8NMoSq4n0IhHvK5Mei0KI
	mqbnUiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBk6j-00000006Cse-3IX2;
	Mon, 05 May 2025 00:54:57 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBk4n-00000006Clb-29jR;
	Mon, 05 May 2025 00:52:58 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-47686580529so46666351cf.2;
        Sun, 04 May 2025 17:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746406376; x=1747011176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3cOM8UgYVEzjO+LX6y6P1c8tSmP2BnZ7R53s/jgWTo=;
        b=Usp5sfurl114karDJFOEgGFF4Qbdyx1BDqW4oqSaHpgeDelrhRYnUxsNnHaeNBTdHX
         9fmjHbLEq7rX50aMeMejdzSClHSRSr/EEzvVWaqYlqdkKGeSa9pUEFj/acvxRhGfU//G
         bpPjJ7amVA4Q0qhbvUOpyd1IUVozTZXIPZZyV2Ti+CD/HCFAbz1JMP2InZiBHTW2NOeB
         EFn7KfA/yUOWV5uQEZ5Pdz3v0Izt7wWGoT+Oz2Cy7oo2WmDzUZ41b0FuUBU05UVRBXAm
         uE0NxLWTepEBbBcFXboSU7doaZcFa2D0fcANwhE6JObcSirPst7R9ejzWusnWFcGQuAK
         XcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746406376; x=1747011176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3cOM8UgYVEzjO+LX6y6P1c8tSmP2BnZ7R53s/jgWTo=;
        b=iafrXxFLLELf8qDPuKVRbWztXM+BnOsWneTQSBhkXMLFXVp3Tjkf0Usf3wcVwCXNtQ
         vetiCK8KXkn2tDcUli8/13WFv4oZmY9ZNETLsv3BvxKDyftGpHHdpg2SxkLWICvFUqbz
         Gt218DMNM/tU0XpN2ZYgAUOqBNOrhz9L4Z1SEneS2rem+GvlwsFhjkXQKXaYWZEiVUP1
         yoRBZYUYhfTynRInOu89C8fnPuFlmo5dkBJfM3OPFWtvWmAnPm53xbOrsCWgOprloTze
         Ufg0T6gD+mlaG5IjwL/Z1NbuI+ZMNMRVRwY5TpOITblj4LEzyM//w4F1OS/p7MwGxVCn
         YAnw==
X-Forwarded-Encrypted: i=1; AJvYcCWCMd/cOiLdob/IgrAvl7sdPhCP1/P1U40ghbXTsAz5MyU2guqkOIMbXUrJ3qzotLrawJRGdjJpFT/ZG/9OXwi/@lists.infradead.org, AJvYcCXjIIIDNcrr9VFBKwDkQDrDjOFRV19xy4dSXUsTu9qFcJQ8EyljWhH5ZXy++YhKIClhsd2lqG/RxjMx016OHrI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPCPxeSxWzKTcmuk8EqUFPUr2svifhPEHZofccHp1KDHMac63Q
	WXIhgRq69ihtJ8a4uwZ4p2EEyvrFV2fB8iBE5L46J8sMU1Uf/x9t
X-Gm-Gg: ASbGncuBajJlkgwWzrkoQ1vcReuB0N44ncTngS9ljZqQFfQCFVk3b4H5StGU+IpYpGg
	xD7fnmWHso+brW7JzExp0wbQtEQTiPX3lfjWo35k+WDGLzUlWRADxVp6Xnn3VoDF4sFVRSrX5rA
	xgobIHsyAm4YoIFzgHT2aSD3lztz1AYfrnOls3VboSSLqyWE+/HwvfRNBuhRJUmtHWHaGECO5vq
	bT0VCYu6oWPQZ+LrWzuGPxgwXvbhq5HCf4ncoie3ZVu/g7IE6CtFNNpklqy/iy9O6LSu3WQhfGo
	5ThEb2EbuG5qnOgfZgZyoJCUcf8uDIYdUuuOrmXZuf0FkY37oMaPkS/Ks8nEbmLYOJ+G8H1M
X-Google-Smtp-Source: AGHT+IGJdthXgAH8QrvMlL42VzE25U39WrDfXOB2+MAS7inWWA1D5Cqtf8YC21jMm4oGub/7c2h8dg==
X-Received: by 2002:a05:622a:4308:b0:48f:5a65:b98f with SMTP id d75a77b69052e-48f5a65d728mr29417741cf.19.1746406376239;
        Sun, 04 May 2025 17:52:56 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b98d0ef33sm50637471cf.74.2025.05.04.17.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 17:52:55 -0700 (PDT)
Message-ID: <44a4aef7-9d23-4a6e-a228-39bfd3e2a308@gmail.com>
Date: Sun, 4 May 2025 20:52:54 -0400
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
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_175257_578201_70BD5864 
X-CRM114-Status: GOOD (  15.71  )
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

On 5/4/25 8:45 PM, Andrew Lunn wrote:
>>> What PHY is it? Are you using the correct PHY driver for it, or
>>> genphy?
>>>
>> MAE0621A-Q3C
>> http://www.maxio-tech.com/product/12928/12929/12930/12931.html
> 
> Mainline does not have a PHY driver for this. So nothing is
> controlling the delays in the PHY. So what you have above works by
> luck, and is likely to break once there is a PHY driver. So i suggest
> you drop the Ethernet nodes for the moment.
> 
The chip claims to be a pin-for-pin clone of the rtl8211f. Empirical 
testing has demonstrated it to be extremely stable. Without networking 
IO the board is very difficult to develop against. I can disable 
networking if that is the consensus.

> There does appear to be a PHY driver here:
> 
> https://github.com/CoreELEC/linux-amlogic/blob/5.15.153_202501/drivers/net/phy/maxio.c
> 
> but it has a number of things wrong with it. You might want to search
> around and see if there are any cleaner versions around, or if anybody
> is working on upstreaming a driver for this PHY.
> 
> 	Andrew

