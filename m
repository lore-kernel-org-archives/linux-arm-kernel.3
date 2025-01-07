Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D36E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 04:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=; b=NI73bkAzzaBhyD24HxJo0Q6clp
	kU7h+VqoFS8jTkMJuDkXuT92vSDR9WEhmM5BJ6t7LgvzwTHUeUp1lZAj67aRG8HEWrCo66lGDfQJX
	OTDI37WoIt39h+0hgYdy6xJHVaJkzdXITfFUjU3mO+FQmbFypDgpLfcHrPU7MM8X8C9OEyLCKSP5w
	TEpc5u3Aq7kGcqlbeCtjJyVkOP8FNY6UescFrzytTV/gRi+X6xyZhIt2K+bJxdaTmBntyhSGqbgg8
	PuB3gsfNBC6eTk4necEkV+B1fQNpUqjNezSRWp6L0ggE2gtW8mZMSE0+SxWIShkdXEugHaNJn2vGB
	Jzem4lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV10n-00000003SBG-1l5Y;
	Tue, 07 Jan 2025 04:16:13 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0gb-00000003P7k-3xSJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 03:55:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so17725919a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 19:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736222120; x=1736826920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
        b=LL3cKL/4C61qQBchbQPlkFTbBfCVJTAV3t6qSzV/aRBFVHJvoMJQN7mFvtUplhiM9g
         ViZyhosKGkYlOTWyXw42CQ7NdkJxKMqpf3OjMf7rLkG9862TI9zYsduhzLX8M9ZcFq8V
         OsYldvLruds+U/1eASZ8FYHyJkaymsi6QrNdQ2qFIDXvS2VLG2k6sf5/nTG4Qbl3h3fO
         mXB8jgRoKKxdTLJ5FWmu6MhmH2mgnSNZUwNNImqJDFAjJuaUx6YfDvTWG7c3eaJMbUb9
         NYdiew+LJWJmurcjnMGgP5gaURyuiecscIIPp0CFcgoPqDwZR37tTgEgEpHqDIkD6Xrp
         Kw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736222120; x=1736826920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
        b=IF60fVEJiqBQgzp6s57mbRPakXrQRDI6BNrP6ttqp6QMBl4chook9dMHte4ynxsK3+
         Kb96fGBfIcxnKQXj2g6GLsHQ6Srq8VG7aJKX5i1/2HdtSpqdvbtwcrhq5eLUOoAvGG68
         1Yff6CMKhfHeDBMC2SvSZz3V4Z85s34aeaClsA2aXMuCBumQjCT2sfbc0nTIJ2s/xEmY
         zqKnqpbqWbpcxN1zWEfQHuojwpKUG0VhEYFRThqejOjOvo6UxfBSqPJn+PDilVekaqOB
         ASyzdnoHMcSkzfkmB12/tlyh7yducWYXAxO+vQheVVTSWiUIwQqb930xgrOgCgj+nxQV
         CmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1psuoGlpE0iYAtGoveZSWhW/78SmwsfDLumzajCdDzttutxtPzw/E5C++nd/JAEGcUPa+59CvP+QOuffudcLF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/MBpwp5zIwTI+pV4T+ZxMvKinsDpjOZ4bS36LFAooq/KvGN2X
	KWHfvObaXhAtisDKjc+N6vyzeWhQAKQOz/QfjfkbRRSoQgP6U6TS
X-Gm-Gg: ASbGncsL5Fj/p2UEXxsfIf254jPz2z71TIcS5H6qwz70zno08moXwXmiiQImje26Foy
	YYj9+hfjH4f1TVdU88rI+fuCUVqpMcTTkeMhXfUgPBOh6SIyB5R4ugBz14s/J9X3rBXN/Imdpce
	CDeBRFqQLlsPfZ2XmSPCAdjz7qwOldQKdO5sRixTkK7kBJ+/DZCDqH4y3YXUmln9Bg+754eTYTX
	jLTDNTrBW6HFp0VsiU7zT271lUbdBNinpCl4gYQ6LoxOmETItlusEzwQaAr4A3WbgRsnU78UXJH
	V8ij2TiqGO587U4qwN0zfH1xMSC6LU+xp3k=
X-Google-Smtp-Source: AGHT+IE2K2gRs1V2fgpYN0CLM9zdF4nwVbYze0GXJZkFBE9yEldHu2WRl6ZMw9QvCXUDA6422eZIOQ==
X-Received: by 2002:a17:90b:2545:b0:2ee:a76a:820 with SMTP id 98e67ed59e1d1-2f452e3eebamr85264355a91.18.1736222120018;
        Mon, 06 Jan 2025 19:55:20 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f48db83c37sm26295046a91.47.2025.01.06.19.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 19:55:19 -0800 (PST)
Message-ID: <14ad5eae-e10d-426d-ace1-f841b5249e9f@gmail.com>
Date: Tue, 7 Jan 2025 11:55:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
 <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_195521_987485_0F1B14AC 
X-CRM114-Status: GOOD (  15.09  )
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


Christophe JAILLET 於 1/4/2025 12:38 AM 寫道:
> Le 03/01/2025 à 07:32, Joey Lu a écrit :
>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>> driver.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> ...
>
>> +    /* Nuvoton DWMAC configs */
>> +    plat_dat->has_gmac = 1;
>> +    plat_dat->tx_fifo_size = 2048;
>> +    plat_dat->rx_fifo_size = 4096;
>> +    plat_dat->multicast_filter_bins = 0;
>> +    plat_dat->unicast_filter_entries = 8;
>> +    plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
>> +
>> +    priv_data = nvt_gmac_setup(pdev, plat_dat);
>> +    if (IS_ERR(priv_data))
>> +        return PTR_ERR(priv_data);
>> +
>> +    ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>
> stmmac_pltfr_remove() is called by the .remove function.
> Is it correct to call stmmac_dvr_probe() here, and not 
> stmmac_pltfr_probe()?

Thank you for the feedback. You're correct. I will update the code to 
call stmmac_pltfr_probe().

BR,

Joey

>
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* The PMT flag is determined by the RWK property.
>> +     * However, our hardware is configured to support only MGK.
>> +     * This is an override on PMT to enable WoL capability.
>> +     */
>> +    plat_dat->pmt = 1;
>> +    device_set_wakeup_capable(&pdev->dev, 1);
>> +
>> +    return 0;
>> +}
>
> ...
>
>> +static struct platform_driver nvt_dwmac_driver = {
>> +    .probe  = nvt_gmac_probe,
>> +    .remove = stmmac_pltfr_remove,
>> +    .driver = {
>> +        .name           = "nuvoton-dwmac",
>> +        .pm        = &stmmac_pltfr_pm_ops,
>> +        .of_match_table = nvt_dwmac_match,
>> +    },
>> +};
>
> ...
>
> CJ

