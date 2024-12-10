Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E3FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvsJcHnWFJkaRdXIOYYPtjthmV89MakBwrZsJYDK4Qk=; b=uQQF+kyfKQPSjGqajA/2CUj8jx
	hUJCsAuX7Uml/76Pl0KzKfAI2L84Vb4PHKoUnYpe4xLCdjnbrPMpyrFgL5nqw8ytjICFFgmisaM1j
	uYDlC/rZtYPy6JJAtZEO73Cy1PfGobmCoyZzDZf+a8Nu31oRdAIDCp4/7bjBQdRs0NNEJQg/z8QRy
	sb/RvVN8E0OFoSlXCw8KSqFYBGi4fhUrAp2q8x5ZHsO2AekEyFpupNrL8aldPsBiwy43TUUY1Itf5
	zkDFiqV2KQnorJ1xYmDqYzNM3TDqZlXTshF+x8ezSWnKFiV5JTrWg0EmVXRbl6h/kzwzz43cF/x2M
	hlpTMiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0g0-0000000BdWS-1ALm;
	Tue, 10 Dec 2024 13:53:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ev-0000000BdIY-3NxP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:52:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385e06af753so2467934f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733838736; x=1734443536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvsJcHnWFJkaRdXIOYYPtjthmV89MakBwrZsJYDK4Qk=;
        b=deSvjZ7CQomyFbGmvSZKWefqwEHBSnqHaOjRP9sd6VcVQgVNt/R/NPR9EhZIsl/F0p
         ffgT1YDCnczx2D4yL1Bo9Vzjki+p8rSPBlMx9WWsz0BOY17qPBZ3QSKgTuQnG5UrsdW8
         1dV/nAAPHrlNEyFLSyDHSz9jNwa3TNm8u0Yymmg1xN/JHPnw9MynDNbtaEUbiUBoezAQ
         qErKSD7zrGLrjJ7Ih9W2cmLLl5WnLA/Fr3iiYMoByBbGXCf7QSEimhNT4eXYa3OvroPx
         xoU8EkdnvBOpsVZVDpu7GqGDNkep6Uo8bDg7xA+tyhOQle4kTN/KFvW1EA+MxNAOrYyu
         T7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733838736; x=1734443536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvsJcHnWFJkaRdXIOYYPtjthmV89MakBwrZsJYDK4Qk=;
        b=LaE8dRwIEIANBUJAxvBx9HcQaozPzYceIjBy/QjKFyMngZfUrgAOw/pQO7VTvFxh0M
         +lfRMsukNcK/CS8xVzXk9oVDVpZ7z2aXEGnYYgei83q3Y9Vd7mD/dwMUuwbh1VfBJiq7
         4ckL9o1iWTcSvs3+e2at6PgJ1UzAfihU0MYuMCxQe90J3d4Q2jdHvoHVqZtXSCafrJje
         4xnbE1KEvtypTOir+bHMxCoGbHm6cSdQqeFH8zHMknk9+H+wp5ovdEqjLV7dt/KGLPoZ
         Ugxe7Krovv1o9psFiZWdWL1YCbi245dBhkZp3txahdmmjWgi3rvsjXEWZXwec5Q6vFXK
         eRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZfRGHRl7+/VNRPGm9g0NH2LFsGMTQDq0/BuREcZ2Kd9uab95IYvEv1tPOG52MNDJJHWUmmarLKZVByS9gFOGK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1WWgxFVNV4ckqHYWh56QND9sgM9O6DxYFUSodm/oGxg6nScbq
	AI2hs2Qb4wc5BW/LfZTODTJlhF40wHN1xKmGQgUqKgUeb4WVh8hx8xEK0fy6nbI=
X-Gm-Gg: ASbGncvBWqcf8PWFgJp64uNROVVNeS/sb4wB+CBwE52Y4S1cbpIVJFg81C2dRPA6rOX
	UUDL1Z0HjlSTkRC2nNg2UD0GX3g1GJhh1/URFbWklLp7vmILxCGqfzGOzxKlTCfL8k7EaHfx60W
	o0tDDwRWk6lyIsypJMwaks55946qf4pPEtaZDbvZv/Hee2Iq4JEFZKxb3xvoZIW0rdVtsQYvqgd
	sKVahaM9jCPzWu+h3jE/S61K4jeA3RgXZAjLwco2D4jHbbdhlfEbQLjix94EOfWeIt3oMNW
X-Google-Smtp-Source: AGHT+IFQ6nYMzgv6s9MPm0QEXnXj8O3sBLDqM8CxTrOU96IG8xBvdz2PcHy2jFxRyvN3ca+1FwMClg==
X-Received: by 2002:a05:6000:42c3:b0:385:f1f2:13f1 with SMTP id ffacd0b85a97d-386453e2a8cmr1917700f8f.22.1733838735834;
        Tue, 10 Dec 2024 05:52:15 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3861ecf4119sm15806378f8f.14.2024.12.10.05.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 05:52:15 -0800 (PST)
Message-ID: <3e16b2f5-5aeb-4988-bf6f-63c7309f53a4@linaro.org>
Date: Tue, 10 Dec 2024 13:52:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
To: Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable <stable@kernel.org>
References: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055218_673634_11DE3EB3 
X-CRM114-Status: GOOD (  18.63  )
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



On 02/12/2024 11:22, Sascha Hauer wrote:
> Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
> and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
> introduced NVMEM cell bindings for reading MAC addresses from the ELE
> OCOTP. This doesn't work as expected due to bugs in the driver:
> 
> - imx_ocotp_reg_read() interprets the incoming offset as 32bit word
>    offset, but it really is in bytes which means the driver reads bogus
>    values whenever the offset is non zero
> - imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
>    word aligned
> - MAC addresses are stored in reverse byte order in the ELE OCOTP, we
>    have to swap the order before passing them to the upper layer
> 
> This likely went through unnoticed because the bootloader normally adds
> the MAC addresses to the ethernet nodes and in this case they are
> preferred over the NVMEM addresses.
> 
> This series fixes these issues.
> 
> Sascha
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> Changes in v2:
> - Add Fixes: and Cc: stable tag as requested by Fabio
> - Link to v1: https://lore.kernel.org/r/20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de
> 
> ---
> Sascha Hauer (4):
>        nvmem: imx-ocotp-ele: simplify read beyond device check
>        nvmem: imx-ocotp-ele: fix reading from non zero offset
>        nvmem: imx-ocotp-ele: fix MAC address byte order
>        nvmem: imx-ocotp-ele: set word length to 1


Applied thanks,

--srini
> 
>   drivers/nvmem/imx-ocotp-ele.c | 38 +++++++++++++++++++++++++++++++-------
>   1 file changed, 31 insertions(+), 7 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241023-imx-ele-ocotp-fixes-f7b216171e1e
> 
> Best regards,

