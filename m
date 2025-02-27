Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E120C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lp+GUe4s2PjbdSkthjBUeHCtnDtsSbdC5TASiMKXRY=; b=Vna4/fkXadUYVQ4q42c9t5IuGc
	TdBb89kfD5pibQP2t7b4CYDlgWR7oEMyX+FphNJ4s8+ox31AKh9bWNcPCeDd8EAuy927WKe06vgGN
	M7XErUU/MF90r30Ka8bGu07s3qFhLDql1LXaboyydqhqVBTBYGRFuIEwqDkqfWK4n8+5H4YDck800
	u5b6orXUBjx2guvUttBJky0EEbJ13ak4SCAwnEcwRVTtXc7L9Mo4bkvUWVGZGvidrienKXXneguXR
	FpkI8UH84n7M62xXlbMvX5Yo1ko4R6c7xMFHATI12RfBjkp822kDBA/ZtljMKZziandUAKdtnxz35
	RpLs+tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnl6T-00000008rLO-0nCK;
	Thu, 27 Feb 2025 21:07:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnl4s-00000008rDg-2qBz;
	Thu, 27 Feb 2025 21:05:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4394036c0efso9477805e9.2;
        Thu, 27 Feb 2025 13:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740690352; x=1741295152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8lp+GUe4s2PjbdSkthjBUeHCtnDtsSbdC5TASiMKXRY=;
        b=fSKTd24LHg3p2PM/yo/ikDUlOhUl091/JxTZ7/obHTF7+s4W6fLZbfv/kqBVeQRSN+
         unJEqKVSuYFboxVY10ZV9Ni4e2KwCVuJlfx+FR+lBWEBysqRlH8qibLkciWmKyvT606L
         cWvBIsKuIyoCfWZ3OvD6ZhIiG6PmTFB5yo+9Ny3zfkJO8iuOAt0Ng+upAfQ79qxtkLYt
         FbB+uxuCXIDrcff9QpUnTRVhe9ofu7RUD0/YrYeMKSr++EnpZbkx6ZC4E3MZfFL9qxHh
         tKRxLwQm+efMluYLN7rJoUE6VjET//7gz4Su9BcgrPkZcMxqFNTEgx5YSgK/cupjD7BS
         vFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740690352; x=1741295152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lp+GUe4s2PjbdSkthjBUeHCtnDtsSbdC5TASiMKXRY=;
        b=P/ZJ/Jjdm6lwsFtciPYJko5bYHP8C4P89/RyRfauboVL/xXtLr3FPmpjS0w1tRP6TB
         8BYe3PLGnt6/l+bVkiCkOOsmG+6w2UQRnmMHwI+RRmyXl169UeIGVGLJiTbmx2g6BwX3
         2iHDeVLv6/beIDOzb9+y4+u3jwDffhJOX1ee8K59MK7lEZE5eLu+bvPCmBpqErVNEBcA
         048AxauNVBnpNCdPqCSKWDQTeDzlVNeXihV4+e2wTz+vo6HGTSZdWBHhyS2ZbSJFqqIQ
         QWm1s6sdXbByPi7GsvQJTm3PY5xEUehWyNU0jvMD/v0K3IopFhYm/CC6LFKBlbq/YNdb
         AZDw==
X-Forwarded-Encrypted: i=1; AJvYcCUvLo76KFYy3sDFbdTFrDcl+E0/mzjGChGjwOQbiAr0JF5lO9VvL2OPTlTdYo7XWLuKvGc62Fvfi1RCXrnFa6E=@lists.infradead.org, AJvYcCVEZCLGMsMKFUWPrEiHnOmOUzOCEW6AghSz6OoLVJSzmlIRxNaC6qB9EM9r4LQfomYZ69FGjRKKzsUEc8Bj8r5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxbaFiIfWTqz7VnItmzqT7KBjEU1FFUNXU6ppZFmW2RrMqIL1TQ
	oqon8/qcrWf2dBkPYZpdQOXZw7JR0YfSTR6aTrCBtbXZtzSrPXjJ
X-Gm-Gg: ASbGncslC46v52go5ElSU2Tp8GWzEeYhCi4Qp4SR4wbBo4voShV2byuuGvhDkVl3RgK
	DSqFDbMu5G4RPtLR2Z6YvNn58GgFcgOBH/9IKDb75kI9giAJTlQm4mQXbOVQLCILOqzGm24xrKX
	9ZrZ2HO8EX5LgMvul6M3ti9cRDHWV+i8rAjyms0ZwyL05Ova5Cuw4b2VKKXFvDD9EyvJ9LCb0Ke
	efr+0I2ougXMPwiUHBfJPDQ5zEBUwXEV/qtjYIV9UJlipSiib8LGc5HB1vmHEh1lMaNyxygCRho
	eHeDAfoAd1Ca2ohlTlKp681ZPDhtF1xOxiPrqEM2AOwtCA2LkPCUdFm18p37KnDppxhx8O4z8/Y
	q/VEReXnZSU9Hjf0svvjvTWETOVwvYjkRH1VvrAdd4vLG0+G/B392hSXXBr6UAQV5+/aHeT8PWJ
	SNLkrkJ7SzC3vxcsQA7w==
X-Google-Smtp-Source: AGHT+IFV0DXibGbpZdx+u5vLD7fIQhcjS8I1BGVxPXMjVfPXgl2tTabWU3LhbhG+QYEWdCPgU69fkw==
X-Received: by 2002:a05:600c:384b:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43ba675ae8emr5869295e9.30.1740690352091;
        Thu, 27 Feb 2025 13:05:52 -0800 (PST)
Received: from ?IPV6:2a02:3100:a0c9:fc00:ec45:a37b:6fb6:f20f? (dynamic-2a02-3100-a0c9-fc00-ec45-a37b-6fb6-f20f.310.pool.telefonica.de. [2a02:3100:a0c9:fc00:ec45:a37b:6fb6:f20f])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43b7371b004sm33731645e9.24.2025.02.27.13.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 13:05:51 -0800 (PST)
Message-ID: <8069a3db-4fbc-4d89-a4d8-3d5b4cf4e89d@gmail.com>
Date: Thu, 27 Feb 2025 22:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
 <20250224180152.6e0d3a8b@kernel.org>
 <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_130554_720918_91A0BC12 
X-CRM114-Status: GOOD (  10.98  )
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

On 25.02.2025 10:12, Paolo Abeni wrote:
> On 2/25/25 3:01 AM, Jakub Kicinski wrote:
>> On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
>>> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
>>> +void *phy_package_shared_get_priv(struct phy_device *phydev);
>>
>> A bit sad that none of the users can fit in a line with this naming.
>> Isn't "shared" implied by "package" here ?
>> How would you feel about phy_package_get_priv() ?
> 
> FWIW I personally agree the latter would be a better name.
> 
> @Heiner: could you please give that naming schema a shot here?
> 
> /P
> 
Sure. I'll submit a v2 with the suggested changes.

