Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxA0/xODbA8Zs4oCf0F+FHwMb1uTOtVumOYf0CCHEfQ=; b=w4fdnNTnW4QDuuRDCe4EMsfAC4
	8w742aD/CtggUcKxPDJtYHcjC/958Qz6jyvGk3ntZ/oi6OdWiHX+kDzhnOf8Q1ftrsoIIlyyFOAzd
	ZL4mEzLrZvZ1RcmURONu6P5+QDxvSE/ZycFgUHjyIBmac0lSO+tbDmQrkr9nvti8IlQcD/g5qQplH
	SqCaufEMOvUnxxtjDI4lQM/+iS4e04oS1Rrn7QVmi9hT8/OKHcpX+gqb+fw93bie5veAgvaEDZUDo
	NZ8mRqJDyy6c5qBvgN6zTZGjtjV06JUPDNzD9o6pDIwNFtgzqw6bUpS112argwpMP4Rty+y8LDkGn
	S0Pu1Bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy4W-00000004rfc-1lyl;
	Tue, 24 Jun 2025 07:28:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxtH-00000004qfr-2KQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:16:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10520399a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749382; x=1751354182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxA0/xODbA8Zs4oCf0F+FHwMb1uTOtVumOYf0CCHEfQ=;
        b=W66VUBhAZOC5lUYDCsOU1DiULMTw6djnPCNzIz27HpBWAZn+KRhyVfWIKAOxZyp46j
         QylU0UNoRHSi047pgSYT+CArKIDpzPQZl4pFVYKwysBI6n3JpejhU/44TvrGijSAk3Zr
         UNGWaLCMq28/yYfPazLoSWR5DUwMjJ2ahRw4C9R9VtgWIB64KkgZmHd4+XYt6SDbwXI2
         5k4PjTezLfuD0CWD2d4Yfxm9bnUXEHHDLpQkefdbPShPlGPAcqRXK2CLLZ/QwmjLp+aU
         goxfNgoDsZJVb8qr2VGhNHORl4Xad8mHQmLjnPvN1QGA97K0yPPPQACZ9uHNk7+MfN2J
         RYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749382; x=1751354182;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxA0/xODbA8Zs4oCf0F+FHwMb1uTOtVumOYf0CCHEfQ=;
        b=BECAk/KJhiB69NcUC1l5/pevCCkR4q1HWPIRdsiglPezH3SRAqwu3NeuDvzKYjT87K
         L5EMpyGkdbrGcwufGqJViQ5cdoo6zi2js4Q2uKYip5gxaclty1v4M4uEB9hD/zrLFmYO
         DW+6QmJZ48LC+SgyogWvsr9HeCgd8N/22J4LWjcYOuh1F2YNuU0koz1DPjkmytbFzNZr
         L5tgCM7ybkUInukICfAvTuaJyc44QN1N0236PvDkyf+6ezE64g0k9jsfomiRbbA9b/Mq
         VaZCtQoPBfbSRy3Y1Cv+FvXN+Z6nEz9r2hpDaODJnk/KWVIVimUFudPZgZRfqYd1FATu
         QVmw==
X-Gm-Message-State: AOJu0YxmFH07FxfZce/vqdFIqmPWB2WIN48GHNDB0cLBsXThXXDYAbYB
	MKgM0ffq4HftDl0ZblcPqfXfkvR/XTxsxedHhZFvZ/ASmbV9SNQ/p7zUF/My0roSdWA=
X-Gm-Gg: ASbGnctUrfjEPiItsb4zJrIufhhtzK9jaALPabbt/t3m2GZbOiG7en09+jAJ978TxSN
	QETw+/RUg/sBO+Gpw1xNn1+5DXJrYubDFr4XWSx+yiJrE7kjhw8/+pdxwLedBqpHsmqWUb8u1QR
	l/6/69Ox7NfQPlkQB7Bn7V2LDsd99xrb8VPR1per21jRkA9Ziv4F94Pk/m7mouDmg89ASbBVqYS
	SWW8d/+Jb+0/MmJMofb7RBSmaw3kqqJYMM2Zn1VOSS76VooYRgJs4oz7iOxvPqU421R76Algf8h
	m0+GGun/Fgr9HokPEf9eCQqI6mJRzD3drt42T7O5xIrrRJvSwmmbbhNszMLaeEjQXkM1c5Y=
X-Google-Smtp-Source: AGHT+IEIvoyLVExbsj901G5YecE0DTZmVKURSAooPNdScT//IubtDuruuFRqmIiyK2qZUSEs6b5sEA==
X-Received: by 2002:a17:907:c295:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae057b6cc35mr1350560266b.37.1750749381746;
        Tue, 24 Jun 2025 00:16:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e41sm821198966b.121.2025.06.24.00.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:16:21 -0700 (PDT)
Message-ID: <c99a0367-f948-44d1-a3e7-91f03327dfab@tuxon.dev>
Date: Tue, 24 Jun 2025 10:16:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi
 compatible
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20250617140502.1042812-1-festevam@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250617140502.1042812-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001623_609191_35790D67 
X-CRM114-Status: UNSURE (   7.52  )
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



On 17.06.2025 17:05, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The at91-sama5d27_wlsom1 SoM has a WIL3000 Wifi SDIO device populated.
> 
> Improve the description of the Wifi compatible string by passing the
> more specific "microchip,wilc3000" string. 
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Applied to at91-dt, thanks!

