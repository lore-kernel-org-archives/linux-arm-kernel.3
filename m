Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC022CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=; b=VXvx6urbY2iAkWDr2qk7n9HXB+
	gU/WU8qJ30wPJayJYsS9xDqu7pzoFD/whOTWpUklMjk/A64EOe3oZwcmnV7E7e+DbNIUxvxsWgzpV
	3FvvR5t7ysEkqEmnTVIkvEeP/iDYU3T730Nsb24NdBIMJJi3BPKKNv066aCF+1g4zeBdxWXZYO2dU
	V/jLZRaZia1atEteEPRm6qaoSpqewdOpn7Lk3AmSZcmTO5Xo7zGzk1/50rfGfOJPGupla14qG7nNs
	1cTf+ZuNy8DTMO+shjxVhbHQxaQxPRb42HloEwiNxgfBSW8QNis+MfB/UIDGjiYwgSXELJup/SCzj
	3tqnbCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2dd-00000000Xkj-03Hl;
	Tue, 06 Oct 2026 10:43:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2dZ-00000000XjY-3kDc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:43:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso934972a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283389; x=1791888189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=qV52DGiCpA307MnP4aFPfpuFQNAhw+BRDcfSy9XKLsBgpmdzWQ9IZyF6XJc+lU6jOj
         rdlnR1lzWUr+7E+0lyDGYBFrcrkuH3bIY9I/trrtkCF+jrdNBWoGWTwrD8kl+D/iGlTJ
         xIAiZ52j0K2PvKwRQvbMIdbbVm/f3CyBxfypSqOvGSGiR72D9j48crOwbo9OEpOo6vx1
         yZnTbGFIF3QwTfhrggkYBRBrmgTx7158K6G4Oq4GVtas03XVT/VgS2hDislxl9gcCNgj
         OHro6xG05zcLfex5WehWJIt1wo1q+mC8+W8UuNy29sMdZpMRaFNbWLK6FvhZHuJEu121
         9kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283389; x=1791888189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=voyFKLUS8Qc/CxNkP+X4Qa6V27MxfrFkuG2kpPgJfRzbC1R83JtdTgjhzaFkYqj+V0
         bYTxtQ7ds4QGN6wQHMLEMcdK09Qv2tTyAFJjy0Cq1wy8DVatrjhLGUUuZQ5dDJF+2wzz
         IL3PqIECDwhXHdJ69GYln9oumiLIIK3DsyL45Pc1NNkW/g1ticLw8R9uk631i+zM078l
         wWHVkmGAfEpLv59al6M7g34Iggd7Zk4sWaTFN3QvZR5A68on44tctim/iYjjYTCb7tbr
         1AVCgskZxjZwgK02UzCh+BBnvkrZUCzG9YMC2WfLbvcyDeKyiTn7UrjPFxcqpiTGNFz0
         s6jg==
X-Forwarded-Encrypted: i=1; AKwUvByuEPXbWkiHZGLS9CaW7u1Ogm06oGtMyUN190qjXYITcNAJrfII/Phs+lCRanw6uUn+w4Wwsj+80jbYYlendyP1@lists.infradead.org
X-Gm-Message-State: AFq9FYKEJ1qJ9cgsbAMK9/6WkrDiKR9RpIj3bRaxQHLyaBIzSpaeYsII
	u/yB/id1yhnd1xyoSW/FpEUSzPs4DtLxQrVRZzKeI6Z2O6GX3tkR7AGd
X-Gm-Gg: AYBFou2bse3G6TY8AVfP6Y/LD8KhSh2eeKVCfrGdLKxRJsoWYS7Vq2Wi45al3r4vJDg
	WV6nnuEwttUucW/nHDnPpdSkODdz5duL1P3aStNYhGG0L0NML8GrG5pKmr5M+CIhdzi9wa4S4Sp
	oQERwMO8thJLs6e70AcJyh6Uu7DbYQgiTzQXFqL5GbKMNmLyS1LGcx6YuD4SlIDSXmszLm0D2Ys
	umK4xg9oqaK36+Z3hvQFPNXxCFVZBeItp0WUkC+7n9JWytvh+/hzlqsoGYWP2fF0JX8BaIcc92J
	YLHpcORq7d3/9efFZ/HDA80qS1M3pVnF7aQRg7XezYW7jr5aJB+5xityHdetU1XZVf/RS0zR6ki
	3j0cfb2yxMe2iBRI+XBMwcq6GkKlcMzZ4I3nsLAtWbFloTq5xfdXDSv9we1zAlWoKRo+kCXZcuj
	LzCu9nwlx9SCWqb4OGCH8Q53HDAXsT0jkeUYxGIE0zGPCDkkFTUNVgjgLv8xAm1THyQ4V3vYoBH
	wN1Qu3J+EDtEYpRd1RCWBf/wg534UCNbge8ywxEcJJOcqmjUcOlNPqp0d2IgSmK8Q==
X-Received: by 2002:a17:90b:280d:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a8736b5a2fmr730235a91.45.1791283388692;
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4184018a91.13.2026.10.06.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Message-ID: <e646b60a-cbc3-44b9-8014-c9aa76ccc3bd@gmail.com>
Date: Tue, 6 Oct 2026 18:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com> <asSzYUA5W51Ngn4X@parshuram>
 <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com> <asTP4lI3psLy5GCg@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asTP4lI3psLy5GCg@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034309_946686_C60948CE 
X-CRM114-Status: GOOD (  10.88  )
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


Vinod Koul 於 2026/10/6 下午 06:39 寫道:
> On 06-10-26, 18:22, Joey Lu wrote:
>> Vinod Koul 於 2026/10/6 下午 04:37 寫道:
>>> On 06-10-26, 09:37, Joey Lu wrote:
>>>> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
>>>>>>      */
>>>>>>     #include <linux/bitfield.h>
>>>>>>     #include <linux/clk.h>
>>>>>>     #include <linux/delay.h>
>>>>>> -#include <linux/io.h>
>>>>> why is this dropped?
>>>> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
>>>> __iomem), even before this series - all register access goes through
>>>> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
>>>> unused include already, and it's dropped here as part of the broader
>>>> rewrite touching this include block. Happy to keep it if you'd prefer
>>>> not to bundle unrelated include cleanup into this series.
>>> Then it should be a different patch explaining this
>> Understood. I'll drop this change from the series. I'll leave the include
>> unchanged.
> Nope, pls add it, but a separate patch. This in unrelated to this one,
> and should be added but as a different patch.
Got it. I'll add it as a separate patch. Thanks.

