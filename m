Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D84CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqDaomdcEkmPt/kMkSkh61O8nncSS4SHKIlJjYIogSM=; b=Nli88cVGGJowmmC9Na4ax3AlOR
	jOYbEZxBot6/pUw1bdGpuMn/WwvHr5JtIaLcMTHyIrGmXTrMqIYr91C06RHDXbmK+b9YyVhkyU9Rt
	cNdML5CgA9TbqC5mkWnXYblQsU1pbG9jiHOWHhSMIKrLy6zzPi8Rl/XuCvZhilkFEG0sXJCXBSpqB
	O/hqkgOXMCfGgsXqSe5aCmAQjytsSemxXTc0dxKhFTIYz6Ou/WFH+/lcbEhUT7KbX2N/nu9dZK2sL
	8LKO6nAWeCM6EPHVj9vPRpyjiu6K+lAUoFZwjdD+Z23wBpWt/8NOvGkVWXd0KljlYoYDAl2vD95Sm
	swcdqc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2BB-00000006Hpw-49BF;
	Tue, 09 Jun 2026 19:32:05 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2BA-00000006HoW-1Rqf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:32:05 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-48611ccd5aeso3473101b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781033523; x=1781638323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqDaomdcEkmPt/kMkSkh61O8nncSS4SHKIlJjYIogSM=;
        b=t0vgbCeHXWP8Vip0NxhXQoTfh1UdD8jSzkwkCRrYvssX9J10OZrhH4pl7NP4+MoqLN
         kkKgbIlyD+00eu68ETerj2GVgC+Aqn1i2b0XITEwP2q8NV8prltH4G5hilQaXDCcqDFO
         ib/6RRFnyMzXtb1qWukAVERzlLP8Fw2zDA4PvVIzdX8T/7LyC/iwkZpgi2jWmcKOEYvR
         D+O3D2/TqtMxdLoDeYiZWrln+e3CgkwJEZ2bqurelswP6UA3C3YgKAmqz2Lb6cO0I4X4
         rCBkDkj/8FOKe9k9R8cYLHqxw86zmftwSZJHKjxof++Z/6btBpoduUMduQ42zNPfYa4c
         Ci2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033523; x=1781638323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqDaomdcEkmPt/kMkSkh61O8nncSS4SHKIlJjYIogSM=;
        b=U90IN7k6JLtGtb2naTCUZZpy/NqmfPY/ndzYF0WwLZMaCakkNAbGqI5Qkj0mDO40RE
         A6rPFnBYg4h8Eh60/WyVwZqkcmiF2C0DXAm/zoJOWsIQpvb3oEJfpCU6rWoLCzoYw65u
         b1RYUmx8u58SrpCVLKrwe4hFmXeq9SqswQtA8T9vVFmTSfn9ICOvvhktpfdPNObmpmus
         0SFOmXXAW+iyw/sJM+uksWUYurA6+Dr0AGEAmmYxZtO90mJ2raY+iLDRsO/T3tSDYKmV
         brqHrWMEUyKifJoCJBZoSbzR2FQuloIBiGtkiwiGP5MnCZZhqRVDZV2kq4t1VC29ePAE
         qosg==
X-Forwarded-Encrypted: i=1; AFNElJ/lucJ/rsI+dcdAal2SqDDRLBXN8YCBhvn87q/OuqbDbHpJD1Fms3KQw/o48pvNR+XOb92Plbp2k+C6CAB7MJ+L@lists.infradead.org
X-Gm-Message-State: AOJu0YyEtqmIIOt5iC+CHpbrb4Ohi/XRsZmCmQ2Cc/Qq7SmoVL8xBc7t
	YYSJ2ufZDqHo0F5zrVPZ8+UXaN4rPo4MetPvUvxnwIOx+ZohGSwCDkSRG8vA+fvnbsw=
X-Gm-Gg: Acq92OE58HK3CbHXJKAr3HqYCiYiYUzOFUDYc2dU9DlmRbRW32bhAL5O6bSXVvRiDcL
	DAUtwgyqMH0wCyTSVsZc42NaPz1FONd8fImKDegjtnEcPAd8mar1re0qRlegYF2UYeuheX/Xjue
	8Xi2BJ2t7J7/bBuHpW9GHB57oYot8pIQMj4L4qbe9wyYpgA7mmDZDgqPxKZsEQPkj1rOTxbKkWI
	NdjaoOQiW0yw4NdjeI+eKZE/FYqNTIIZa2bM8lIq8Z/Ipl6QYdC2gIaJK6gK8bad939wmgn6zIR
	6+RUEq+TCgiYd7kfc8zY8vnesLKAckYTTvKExX96dwUWAKz8iR1kzYHve2kQjDM72Dewmg1WoIT
	3ZHmaPWxZmDR0Mox9eE8DYpKecOy8LCYm5xm9+ndHUYbTpDSfVBe6EznNh7Omlzz/b98LNT5Q+U
	Tdtl2GRPfi1Kpa/l2WXK9O33AHxNwCaXkiZg==
X-Received: by 2002:a05:6808:4fe2:b0:485:7c72:786e with SMTP id 5614622812f47-4868df054eemr14537468b6e.21.1781033523165;
        Tue, 09 Jun 2026 12:32:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b32f372sm16507092b6e.0.2026.06.09.12.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 12:32:02 -0700 (PDT)
Message-ID: <47a9909a-da5b-4b12-806a-1b9542cf8bc2@riscstar.com>
Date: Tue, 9 Jun 2026 14:32:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 13/14] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
 <c60d1819-18d7-4d4c-a997-586599323d7e@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c60d1819-18d7-4d4c-a997-586599323d7e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_123204_417793_1A380F1F 
X-CRM114-Status: GOOD (  19.79  )
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

On 6/5/26 11:05 AM, Maxime Chevallier wrote:
> Hi Alex,
> 
> On 6/5/26 03:00, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>> that can be accessed, along with several other peripherals, via two
>> PCIe endpoint functions. There is a main driver for the endpoint that
>> decomposes things and creates auxiliary bus devices to model the SoC.
>>
>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>> MSIs.
>>
>> Add a driver for the eMAC/MSIGEN combination.
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> ---
> [...]
> 
>> +static int tc956x_lookup_max_speed(phy_interface_t phy_interface)
>> +{
>> +	switch (phy_interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
> 
> The SGMII definition we use in the kernel is the Cisco SGMII de-facto
> standard that only supports 10/100/1000M. Some vendors use flavours with
> names such as HS-SGMII and such, that's basically SGMII clocked at 2.5G
> with aneg disabled. It kinda becomes 2500BaseX then.

So for SGMII then, the max speed returned/used should be
SPEED_1000, correct?  And for 2500BASEX it's SPEED_2500.
(I'll fix this.)

For USXGMII I presume we'd use SPEED_10000 as the max_speed.

Can someone explain when the plat_stmmacenet_data->max_speed value
must be set?  It seems like plat_stmmacenet_data->phy_interface
should normally imply the right maximum speed.  It looks like
phylink_interface_max_speed() has a big switch statement related
to this.

Thanks.

					-Alex

> So all in all, we don't support 2500M on SGMII.
> 
>> +	case PHY_INTERFACE_MODE_2500BASEX:
>> +		return SPEED_2500;
>> +
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
> 
> Maxime


