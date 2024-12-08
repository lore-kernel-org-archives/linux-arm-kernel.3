Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FE7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSND8gKPpnPHIOd0ZAFXzWeCT+o/x2u1iq0um13sDc0=; b=OSIZxPSxz99SpIlaVRWjsv6z34
	FBOsLisAf4MA7XJ3gIBMpx2hcbv3qmQ4e5zxYDNddGFBOqBD/tHPXMVOFzX8BQdx/nbB+ySRFtRsy
	C4EakqmOdsXHUQbolYKZp/rEHNj3yUWD/nK1HSK99HzK1rdXYEe74odpwBCItcxZcqfaAwK1wi0Ff
	oGT/OreSES9U/KZ5G6SPMb+7rTIAH8hZV2S4CPTVf1ULPJhv8X26FHfT7Y9wtbkuRgTlWTrn6kyU2
	VUfEFbmYcTKeMg4Mt/4qTfgfW/npcFiXLM5zz/iBELnSmnZwn9PNPHelzI9K+l7f5ZiDd3i1l+OVx
	z74Mh0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJYT-00000005Uyx-3erH;
	Sun, 08 Dec 2024 15:50:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJXR-00000005UrG-3Nxz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:49:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a1833367so20744325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733672980; x=1734277780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSND8gKPpnPHIOd0ZAFXzWeCT+o/x2u1iq0um13sDc0=;
        b=WrDfG9q3x/KfGofcBkjotyN8jhT1quDGif/6RmeLs/OHq3eFnvy4VaLNgUHlgdpu4T
         CFeVHuNK3QtwuJCmDihUcWuPWYGKfXoK4hnF7scKfoPuO2qMS9Oo31Lg0uwSfL//0MiE
         gHrm8gDrx9bB/54as//UtPO40TwWY9OajW1L94lJnWY8pbKRW0FYOs9fxfTEB+tM8Beg
         5aB5HGGAuPZj+kCa3uyM1EnhSFopSJXf8Nuoi5MXi/1Ht79ajfZlBVoFK8q3UV3Za3lu
         eKZcNQIjtmpx44m7EJZSASUeFUm9VH+Z+W+7xbbfF61zvqbDCp/bwYXLdf28Ju/e83dV
         n6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733672980; x=1734277780;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSND8gKPpnPHIOd0ZAFXzWeCT+o/x2u1iq0um13sDc0=;
        b=DjjQhPNhuJ/Wvm30lx0GmyHre845X3VHKdpHtzeTbLTLc/VMM9bFAsXfXnal2N+Jnu
         Of7ofIa3O9jG/Zrs607SEkKAgWIGZczPYahSPUCFV7Qcli5OUdkjfGS/hqgzc6cJLLx+
         Tqvlh0yDUeNNA5rPdwNHhEviOB/guS4TqavuqMO/9e5dnH/RhwSxvkCuO10h6FhuoAMY
         Z/6/OIw6HKR5gNlErNrrEphwrniYvYQcoqTX7rwkmahf93KqGdyWJqqbuUI56e3nRHJu
         Tjal2OqG6waqdyV31No8AxZvHeKRI6ya0Vu6XXM0SsTpe821R0hOdiTbo0WfU8ufGNc0
         yYEg==
X-Forwarded-Encrypted: i=1; AJvYcCWmAjB5VzDqJu2SHJ6icYAraW6zL4Qbcz/FVqW7VyE0W3g8DaauoscSEMdjmsSNfiGdkYRu8bLWVu9wuulFtHtE@lists.infradead.org
X-Gm-Message-State: AOJu0YwQyugpeA7YUzOEr+zXBuqctZT4JlsB/QVt0ZXV9alE+jpY0t+2
	XQ0UrQAS7WGr/AjeZlq8FcYXbfCsJeI6F8s2eW4bVF4Ckc9KIiet8rMBbYDRgWO2yQuMGMVEDZe
	I
X-Gm-Gg: ASbGnctItZ5ZUVMRvG6LW7zw+j0B9jHle8TmPEDrOqQTUWc7jan9Vs9MXdXdIOlcNx0
	qAvEjH44QuhUhoBpz/ZC2xa9f/L2hhvpLwO/R6aGBbo+axsVxyJwAvWbKllR+ZdIJZiVhr1GsMb
	TbrxRRojpac0vMiDHKMK7sP6hlcxjul07aMoPAUyPjAcPHZb9tozkU8BO7S3aWPyCteMd+Ena9v
	3S7XTrmVBd4YYJvHCjt75MJAQuJLIuzzR4Bm24SRt3kDs+uwvXrCBsisWA=
X-Google-Smtp-Source: AGHT+IGq4cGYPhA6KCSTjdpGb4CgHZ99GQRGPwYyuWrGpVCbMvRBa8NBW7ybgFDZX5516r+i/hv+ZQ==
X-Received: by 2002:a05:600c:4e45:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-434f2af711emr18175215e9.15.1733672980031;
        Sun, 08 Dec 2024 07:49:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eba653a0sm50093225e9.22.2024.12.08.07.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 07:49:38 -0800 (PST)
Message-ID: <a93bd8ed-39e2-4f19-99c0-1d9c11c694df@tuxon.dev>
Date: Sun, 8 Dec 2024 17:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add power monitor support on sam9x75-curiosity board
Content-Language: en-US
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241122080523.3941-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241122080523.3941-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_074941_850986_201B6261 
X-CRM114-Status: UNSURE (   4.58  )
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



On 22.11.2024 10:05, Mihai Sain wrote:
> Mihai Sain (2):
>   ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
>   ARM: dts: microchip: sam9x75_curiosity: Add power monitor support

Applied to at91-dt, thanks!

