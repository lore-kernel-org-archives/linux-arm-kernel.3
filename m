Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3064BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaKbNQkeyDwSjQGIQ+m5SGuLh75ZMMIa7nlAuxNwI4s=; b=D+9HoFyBxmrpEd+StJQErOTZ9x
	ZV4agv1Sfp0yW8iDpqhXbywz5XxO6TOav8Vk5PgYkGjb82tVwYo82U9aICDDY+SGGnCwrZLG3hUtE
	wpTgBs2tvjoaxHf7GhP43A1AHVrxbUjnBA9lnWEYY8SkP3eUK5Qg7XHxR450sf+bUSqG7aVmTB5mQ
	GEmfUPox7Eo4io07xng5O/h+oxV9pPT+c/oX8mb7WUiWeUe1xaEs7Daysxm4AkVw3QK5TT25RnUbQ
	edmGIZa0cAVQYt6xhHgaoEpSBK3ntvPpwHR77m3Jel+PVB2NxQHkl4IMgMLt5djOBMV9UJGGVoNxQ
	Q7DaC8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9WW-00000004zEZ-00Ut;
	Tue, 07 Jan 2025 13:21:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9PL-00000004xPa-10X3;
	Tue, 07 Jan 2025 13:14:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so23091321a12.1;
        Tue, 07 Jan 2025 05:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736255646; x=1736860446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TaKbNQkeyDwSjQGIQ+m5SGuLh75ZMMIa7nlAuxNwI4s=;
        b=Gu6fSgnTOofn8ovRx0LqGSbXdVQZXPDd5jQLtHn6BJtrDrUwYjal6n6GRTbnDDSduj
         8WfJNgKLNjITs5/ssm/eM5O+grfmjUImCiNCVfN7k8tDfsQFCanJvVhO9MFCWsfQXNcN
         QX0XzFOrnIMYKtq9pB2BMAmRYtLx8PsnU/iZ8NtXhf/9APzA3mLs5Ik/Om6xvFfk+8vW
         OMm5RxgA9OmS4YI7PzovdN/fLfw/HXFDkYMLT8Ccxjo1Z8uGlPti2+wIVysnjxZDyPPq
         gB12IXCxvbLerZQS0WjPI9X+OGu/RNRTBSfpNs0J/shxmZZ6u/iaSIT+6zS2Kq4zKz4N
         Slkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255646; x=1736860446;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaKbNQkeyDwSjQGIQ+m5SGuLh75ZMMIa7nlAuxNwI4s=;
        b=w92723h8/EPnOsOrf6QKnrXKw6doaBKoqBopJT5/EgLOjMKT0RMZuGz7GXYKpLxZxq
         jiuXmJhfik5qVU2cftV/pUTp3BQsqagssx2RBxEM9k0ZTjBJRMLDGAqdsoWaYoksq7ua
         f4UqA7IjIfPtJDuiE3YCrDSHzBSaFXbh4SFEhPNwYMTOe8JulBI8tJ5FkFLS3jlNULnd
         tt8NSrKn5ciHrKBUARzHf4E4D4GlIfpOvXFaxcOYM5YtV0z+ohfRtAplBQIv46aYDcKa
         DMCAgJPbee/cyQInlPGINL3bBc2s5HIybK2cJqkz8nY5ExywPFHNunrnL9DePbVpzQVF
         YFIg==
X-Forwarded-Encrypted: i=1; AJvYcCVyxrOFFXZG/BJEihpodvxC+uPileru+RLJBRnJnRU0TEMwwEhK6IC4vw8jg3iagjXhBjXeD6NTJxCD2zHEA0/G@lists.infradead.org, AJvYcCXvaaLssSc1hDeyK9EhhvxmeXcH3XbkuLrV+3KQwl6W3LuzX8T7mnS2d23VnwN681uYuriVpIf8sHUANTFsP0A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLrEQxJWGYSTu3Qs4lfu3fOR6QAyU7M43KCo3vgv2tgrmrPeib
	OQwIS+QilNtMDBXmsnDhRAIMdqIya/Cxd8ir6IrSq/h1NopKuKgu
X-Gm-Gg: ASbGncsfKG+viw7KOlkBgZqrOG6eJSRRxMoo7uyLLiTlOn4hQfkP78P0yPXKsg7UoYO
	YlntvUU1dU4sBRaKLeflMg2fimCq7MjhocqmK44PTKEyy3BxY/dQXOeoyc21fq25bZteM7Y9mr0
	Whza2d+CFMtzvR4FOnLiTEu4dCNa2SXfJkta7YCgVOwQrAiBHgoP8Ai0snum1oFIoDcn5iHnW6W
	3stoK5FIn4duFT+jM4G6cncMzXSGd8sUq7Dq2qvksWBXEqpuF+ChxNwRjwQXtrQjEaZki+T2I8y
	j86715INqkj5z5FxIjeCb+5M2iCoPw1WHYtOnWroM0diFnwPkxlfilecKdsLoUbnwPuguwEBx32
	zOme1vecxnInxFUmnSTgUmEfGYv8OBTo=
X-Google-Smtp-Source: AGHT+IG685u/TuxRo4gOyPFhExD9aC7tMDskOonBEuq2S9e6D8OwVVwO7wNmsSRZ+5auRMu6yPKriA==
X-Received: by 2002:a05:6402:35c2:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d81dd9af30mr134224547a12.8.1736255645405;
        Tue, 07 Jan 2025 05:14:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b1asm2383448366b.148.2025.01.07.05.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 05:14:05 -0800 (PST)
Message-ID: <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
Date: Tue, 7 Jan 2025 14:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051407_287652_583CDAA9 
X-CRM114-Status: GOOD (  16.74  )
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



On 1/7/25 1:47 PM, Russell King (Oracle) wrote:
> Going through the log...
> 
> On Tue, Jan 07, 2025 at 01:36:15PM +0100, Eric Woudstra wrote:
>> Log before this patch is applied:
>> [root@bpir3 ~]# dmesg | grep eth1
>> [    2.515179] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082380000, irq 123
>> [   38.271431] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
>> [   38.279828] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
>> [   38.288009] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
>> [   38.296800] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
> 
> This is indeed without the PHY. We're using inband, although the PCS
> mode is PHYLINK_PCS_NEG_INBAND_DISABLED, meaning inband won't be
> used. As there is no PHY, we can't switch to MLO_AN_PHY.
> 
>> [   38.306362] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
>> [   39.220149] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
>> [   39.229758] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
>> [   39.239420] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
>> [   39.249173] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
>> [   39.259080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
>> [   39.594676] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
> 
> The PHY comes along...
> 
>> [   39.603992] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
>> [   39.650080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
>> [   39.660266] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
>> [   39.671037] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
>> [   39.684761] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
> 
> We decide to use MLO_AN_INBAND and 2500base-X, which we're already using.
> 
>> [   40.380076] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
>> [   40.397090] brlan: port 5(eth1) entered blocking state
>> [   40.402223] brlan: port 5(eth1) entered disabled state
>> [   40.407437] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
>> [   40.414400] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
>> [   44.500077] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
>> [   44.508528] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)
> 
> ... but we don't see link-up reported by the PCS after the PHY comes
> up. Why is that - I think that needs investigation before we proceed
> to patch the issue, because that suggests the PCS isn't seeing
> valid 2500base-X from the PHY.
> 

I think it is because pl->act_link_an_mode stays at MLO_AN_INBAND, but
it needs to be set to MLO_AN_PHY, so that only the phy determines the
link state:

phylink_resolve() {
    ...
	} else if (pl->act_link_an_mode == MLO_AN_PHY) {
		link_state = pl->phy_state;
    ...
}


