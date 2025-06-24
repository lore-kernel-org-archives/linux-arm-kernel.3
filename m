Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E3AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFcrVzxUEB1S/HzKHEfngpEGCMqUhWHufb0plvtAAGA=; b=M0k9UGbA1Wq02+c5N1NqYczoG8
	fDNhhtxVWc4WfA+wRY32w4dSsVvZL/nfhUwIkFdV9ilGUKBdBmnC2h93jE0f56Y85s+F3HNoGqaLR
	bLogCHoJnZMuijn78bMuYiQhdx0WhrWG2JIM7qwmxHciAexPgZWuAWB7OSJ0nJwCEYa3kFPNNBs6P
	kkBmBfJuW3D1EfE8cgJ7snWxvMaPOLQdj9IoJXhWKYxlkN5i2t8Ib72no+YKbVWwI3jOn3WEIKdvb
	4AhTZXCeB/uDkDx0vFH2BvU6TU5ptRWm3iudAS3Zx1HKPXhRc/WVHezJUwBb6DVGwXsL0PZlR2sIP
	3TAH2YfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy9A-00000004sXd-44Fr;
	Tue, 24 Jun 2025 07:32:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxuF-00000004qpE-2CQ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:17:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso218888a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749442; x=1751354242; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFcrVzxUEB1S/HzKHEfngpEGCMqUhWHufb0plvtAAGA=;
        b=SmHszix0WlNdEUmmMtC16oPDFfCzCWbqktCbLClZrL85OKoYylTGmfSIVom4sBtrsQ
         5IGUjlcqetkzqKnPsPEXK9wckoqoKeCmxpkLCHHvqRJWLqEX1mxxIDBPdj+EHSkUb7gZ
         DAeXEZzvV/DW9uMG6ILYuCLsqaNIdG0su5Bx9UeE4YEPa1lMOpWcgAVnoges15mBRtDa
         QurFzE8z7wvQcBeSPCXurnfSaZFdYW4VNUKcBXJLOmPJvlTcMADO1LEn2boJbHuJhqm4
         8waQAmyFErJfO6Uf52zCwxyZMaWGeiNj7mR3TLjsveAkCQnvzN9IMMDNKvcs0lSaT47K
         VT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749442; x=1751354242;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFcrVzxUEB1S/HzKHEfngpEGCMqUhWHufb0plvtAAGA=;
        b=N9wVQSfOHtrMdDT4jC3DrB3gNMV7ZPj0t0q0QHTmmegybQ52l7FOFKY3t4+eNi4VPA
         P/VPYJW9Mg9KILvYr0v0cgJFmBuSVLueqNkw5FYP5lLCLIVuW8rpWCRPOr6N0tCCpHRp
         6ei+B4Out5FShVkv42iswJc1tEvrx7e/SP+3ag/m/DJpyEi4a3YjAnuJEsuy02KKdB+K
         YZucyE19jJwz0fWnzzuC3aZxiCcX/b4yGSPiwvwA8weInCOTarcX/Tsffx43zEr9F8+d
         diA7jGB2KPqvZMsDp6+THpsLQCWDMpvqMmEr8WOVwjuieSR8wVaKg89DEY7e0Jt12UOc
         Lx3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7QlUj1TlppNvxi2f4TDGajdgr7BEUoJev4S3jjeevADBQM4VR/3x4VVNihy9ZrTz/E1eh1qUjFl2EvU+Q6UNv@lists.infradead.org
X-Gm-Message-State: AOJu0YwjGQBU3SUSiBPoiPEbfSYauZOQTxNX/YE5lASTCYPZ1Cxon8gZ
	OElqpsV2RSTa5CWELf+wzZJigxTg080JET8cSQ3CWbGlHSMX8fmtXDc5L3YPV5CH2ys=
X-Gm-Gg: ASbGncuJhAUsLe0MZkmfxtRDDOutmSgjJfgIm6bl9n8yKqC2f/bh7H7qoXP8h16jVZ4
	GAI0i60Gj5JwLzdaeYnpbdCYKGNkemwsVyscAlB+VkURI+HCnimfHuOhaw0JwaUpObCQZ0XCHyq
	YC4w+14coCYV969Pgg0qeBztfYcIIgBkYz1+h/beBk/dc/X4B3WrNKbRiRYuhUM3vSG7Tf3V7x5
	i4T8ModlpaLstfPvW7/Xs52ezkGf9qs2b6Xh1JFCo/rwwFZTNn/08JY+CuAc5bqwz+nVlXVT+Gk
	h8tHLhpkLhfefY98yGjFT0YjbFZeDFLoqFSWXe03QpRhlSVmvI0gMyyh+twfyXbpwLk2lnkd0h7
	0yPZivA==
X-Google-Smtp-Source: AGHT+IHDBqsRD74oW/38B1NadGOMpbn1e6oDld5G+sNW0edHiEBc7YbTzm1EOFJjzNfF+PtIsVilgA==
X-Received: by 2002:a05:6402:5215:b0:609:7e19:f12a with SMTP id 4fb4d7f45d1cf-60a1cd1ce00mr13959431a12.18.1750749441913;
        Tue, 24 Jun 2025 00:17:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4a6307sm570954a12.74.2025.06.24.00.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:17:21 -0700 (PDT)
Message-ID: <70547271-95d4-4da6-815e-1a140bf00859@tuxon.dev>
Date: Tue, 24 Jun 2025 10:17:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] AT91 SAMA7 SoC Clock Adjustments
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1750175453.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1750175453.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001723_565551_AEA1831D 
X-CRM114-Status: UNSURE (   5.21  )
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



On 17.06.2025 19:08, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (3):
>   ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
>   ARM: dts: microchip: sama7d65: Add clock name property
>   ARM: dts: microchip: sam9x7: Add clock name property

Applied to at91-dt, thanks!

