Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpLNyektUDJ+Wy1bMHRPw9xz1Qvt5LipEoHKiCF+WW0=; b=EMoftyoXXFlCk3A0RSZ46OsCqF
	/X5j7wvQcJRVtD+klU84ZFJh2d8Jor+OlfiIgJ3Ymnh4HayHutihaI3sm5TJb4sa0ENOYXutyPZ9D
	ed6VTqQX+npP/KtJkhAqN3HI+U9IM/3azx7pxRE0zrhyo+rrRoP8lvCDV9Vb+kb5DSWNvT9bZtTMi
	Qc1SYjm5pbQOqMbXJXbvc0J5cb71fO0AvsdEuvIejbzwK+IChEu4ptH9OmGDCpj3J0t75nZgIoAAA
	Yd8Zk1MoCAjANA8Fbq8PNz4HL9BoGR5iakCF6j6aDqfBzHAy3W4QKB/DLlr97WC+RRPlpzruKTXRI
	1RJUKUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaYV-00000009DiY-3CYG;
	Mon, 26 May 2025 16:20:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaVi-00000009DM2-2byt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 16:17:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2322d8316f6so1561775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1748276229; x=1748881029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpLNyektUDJ+Wy1bMHRPw9xz1Qvt5LipEoHKiCF+WW0=;
        b=lsmpxIR77F6JE8j1jHxZHnNXtpTx8VRXl1Y8Q3O3oXR5gSQsQqqp0jp5blzqFIww1l
         kWOzVmHuCTjAdlDPYvKA0JIOG+e4wWXr0/EQvhcIvU4w4ux2RchIep1q7Fr0YAwOoU4J
         6HSpdXXPLk7vRgIGAlVCdMY7ucmPRylucnvrd2mle9dVgd6owl8c6oCA6jMZsBNhhKbb
         BDT7MPyRaWUyVa/bmqvxAkR8bO80h5eqOoupBKI0+cdMSSeAEIjuCdeyd25KntKbUVvl
         CXeLEehEjEl5GrWt9zFaQ/j7pREhT/xr0QmCrhpCjNnxpSqhclLktB9UFba6LGUcY61M
         0wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748276229; x=1748881029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpLNyektUDJ+Wy1bMHRPw9xz1Qvt5LipEoHKiCF+WW0=;
        b=VKTzzK3iFu7W/fVLyZPFnjzT9QC7l7sfzy+m+RxxIzzKSdmxOGWZdDGltfDtUlUfT2
         v/4TBF9lC7PI9uhuwo8KMxDch7CynUgHBt4bs77ATWiKd2Bmx6Sun1fKJEXH0mHvZNAp
         y3dITn0kSMe9IYAFtIk9KIsf3tEVWAA6iF7Wy2I2IwulZ88vPTuVA83q5Si7aNCbIRaS
         7kpKSweo2DK0pYVOviOA3heQi1X3X1g+rayerr3szgTLac3OtlTny43lkJCsDVSMjszG
         S5aWW67BL5CTNjiNN0QGp1tTIk78wGlFtt0Ma+Z23Un9hiEPMnOw7RTlTx4/xwySIi4i
         /w/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf+SYdEKHHRD68fFRHh744cuJ4dMY0vTwuzb/d2sMUyRGWIG/AiOIiblgXgfqH+KeidTJWysjj4diufXPgzIPb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2L+GLgJj+tP23OkUUPzHc5RUKCdQD6A2mHqMMQqypGv6xM2xg
	eMWzlUmG5wwAbEivo8WzefjuenfWKiaPr4QeLhuGTTOJMSveVYeMqAYNWoLubpHaNBc=
X-Gm-Gg: ASbGnctkbkOiWkxpPcbN0mK9RHrKngM6Bm5Y73JHWJTzcIBhvJVId1ucWCiS4nkajow
	X7OCPbtmIS/SO0XUv+x1D5/gO4Bbt9GD/0i5VKhZlWsav7U0P4q8JQSUzHHiWkNx+LpL7zp+TIK
	y1u2hgOnTDkiahXW0LqITdqi1luyIvRjizC72Qnraz7RAccfV5eabcFynJF8yo1I+rdfWiFO/qu
	1YTrvl5yky53l1gOiVc7mIonS1nA+ybHKy2CvVjjr+yyQKpgONlko7G+mAoV4tzU8j1yIDkECSh
	x+gFWXH/+Nno6PevKQjQ1cEWOu4YCpUjZWuRgfOhcYJSeJcgaqeD4eHe9lyzpCOXvoZJ
X-Google-Smtp-Source: AGHT+IEhAY42K8o5WUtsFhwOWKSys2t+FWegKVAVXKM+NEJ0A73fVF3hLcAex7C5XJx2ISqqHBdL8A==
X-Received: by 2002:a17:902:eccb:b0:224:1579:b347 with SMTP id d9443c01a7336-23414f64ab7mr53080415ad.7.1748276229149;
        Mon, 26 May 2025 09:17:09 -0700 (PDT)
Received: from [172.16.1.45] ([45.62.187.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341ccad6fcsm41723455ad.170.2025.05.26.09.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 09:17:08 -0700 (PDT)
Message-ID: <93ae82e6-44f4-4f2f-b3b6-71240f84500c@sima.ai>
Date: Mon, 26 May 2025 09:17:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: set multicast filter to zero if feature is
 unsupported
To: Yanteng Si <si.yanteng@linux.dev>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523221938.2980773-1-nikunj.kela@sima.ai>
 <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
Content-Language: en-US
From: Nikunj Kela <nikunj.kela@sima.ai>
In-Reply-To: <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_091710_682848_A5E74F95 
X-CRM114-Status: GOOD (  25.56  )
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


On 5/25/25 7:09 PM, Yanteng Si wrote:
> 在 5/24/25 6:19 AM, Nikunj Kela 写道:
>> Hash based multicast filtering is an optional feature. Currently,
>> driver overrides the value of multicast_filter_bins based on the hash
>> table size. If the feature is not supported, hash table size reads 0
>> however the value of multicast_filter_bins remains set to default
>> HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
>> feature is unsupported.
>>
>> Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 085c09039af4..ccea9f811a05 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv 
>> *priv)
>>                       (BIT(priv->dma_cap.hash_tb_sz) << 5);
>>               priv->hw->mcast_bits_log2 =
>> ilog2(priv->hw->multicast_filter_bins);
>> +        } else {
>> +            priv->hw->multicast_filter_bins = 0;
>> +            priv->hw->mcast_bits_log2 = 0;
>>           }
>
> I didn't read the code carefully, just did a simple search：
>
> ❯ grep -rn multicast_filter_bins drivers/net/
> drivers/net/ethernet/stmicro/stmmac/common.h:611:    unsigned int 
> multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:26: 
> plat_dat->multicast_filter_bins = 0;
> ***
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:512: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> ***
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:536: 
> &plat->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:541: 
> plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:542: &pdev->dev, 
> plat->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:523: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:527:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:528: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:516: 
> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1527: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1531:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1532: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1568: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1572:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1573: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:543:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:633:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:679:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:31: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:84: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:98: 
> plat->multicast_filter_bins = 256;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:365: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:369:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:370: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7240: 
> priv->hw->multicast_filter_bins =
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7243: 
> ilog2(priv->hw->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:570: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:707: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:479: 
> plat_dat->multicast_filter_bins = 0;
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:456:    int 
> numhashregs = (hw->multicast_filter_bins >> 5);
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:485: 
> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1057: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1061:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1062: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c:43: 
> plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;
>
> and
>
> drivers/net/ethernet/stmicro/stmmac/common.h:265:#define 
> HASH_TABLE_SIZE 64
>
>
> From the search results, the default value of multicast_filter_bins
> may be meaningful. And I think that even if some hardware does not
> support this feature, it should still be overridden in its own directory.

There is a DT property 'snps,multicast-filter-bins' available to 
override the default value for a platform however this property is not 
taken into consideration in case of xgmac. That being said, 
stmmac_platform.c logic can be modified to extend the property use for 
xgmac also however the value will be overridden later based on hash 
table size read from the HW Feature register. So only zero value will be 
usable via DT in that case. Hence I thought of setting it to 0 in the 
else part of the code I modified in this patch. If you think I should 
extend the DT property for xgmac, I can modify the patch too.

Thanks,

-Nikunj

>
>
> Thanks,
> Yanteng
>

