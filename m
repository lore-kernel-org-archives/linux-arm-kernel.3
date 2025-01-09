Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS6TlRWyTSRfC4D8CM7324D8iXz+6nRl08PCaLYh1SA=; b=PygmeywvOJ7/Bh9qNEvD0i7SsP
	55X7RNp2L4saaG+gfHrFp6/dqR3zXBGTmQbVB+egHojSFLNTwpIMGG4P4zpGvoLD2sXGBfH/DCDbA
	3hKDlkyqfBYEu2iiNSajxLYqA7HuYzNP3yob8YoipQ5HQeinhGz4ROOv5+DYhLamaqAuK0nzmXwvr
	iJrXt8SiMyko8y7HrpuAdyMMPnLMJ9vLemuPoGnTWS/9Vce93RXngtxVtA1u45EIxqfMSzWMLuBrh
	piTXWATJuuscoTkv4D5wvpWkR+kKDEdyMpOQhZIuRdh9po8K6jGNHzTQ4BmHVEq7ksXzyjyC+drTG
	tIP2dzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoMH-0000000BEmA-3mMi;
	Thu, 09 Jan 2025 08:57:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoL3-0000000BEYy-0l10;
	Thu, 09 Jan 2025 08:56:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaf8f0ea963so141752166b.3;
        Thu, 09 Jan 2025 00:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736412982; x=1737017782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS6TlRWyTSRfC4D8CM7324D8iXz+6nRl08PCaLYh1SA=;
        b=c1JLu7rtbmEGhBEi2dNfjfJiZ4aWvy7mG79mw6oHz3lUfhYlkCflquTQ3AcsapZVbs
         HcpHq2DDOEw0cU/6OQzagDLmgUeQw/fDNGR3Ts8XTfASiumG8HrLfL3QM5dXiXi8M+mu
         AyxGF5jISmhE8tZjLgtFCM99kvmzsxl5DhznvH6hoeVd587U2qznJ0BNlJ/mDrJmUe30
         fGordZJPxKuojST4Vv9Ax7vcQPNZEB9h5mJl3PbNOoLFbqtVhnZ2KPGEPIxSzrLgBdcC
         P9Wip9HeItGEHC0I11a/1P7J9x5TqbuOQfX9w1yd6d1q6Hz/UYHfZwviYXHaToz2y1E9
         Zs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736412982; x=1737017782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XS6TlRWyTSRfC4D8CM7324D8iXz+6nRl08PCaLYh1SA=;
        b=wJzKt7/0OXWmq+NZex9hTKyi0zQFwkhg4aB815ZcyLXGoOFTgs1xkZUgkN0r008UvU
         Y458zWQCbKoo96J4+0agpeNRUzDggTYXPSbmsL7hwZogR8FE62fKCR9An8F1kt4tZcwU
         pdv6nKiny6KGWsHwt8iWdelIGmJYFe9Qr2GMM6V8pFCRKCjxfNxZbT2ZyYk2eOIbuz6A
         FvzQqDBbhQBX8ix1KnrFsFZC/ZFbHWsexKqhmOZEy4ZMiE8I/5uBaYChP1bBCIpD644K
         2lHzgxHRhX0ynctfmU0dMmS1GMISDm+b45it34q8CSrdMuDPj7Xl8NMKT8uGdKR056Hp
         4fjg==
X-Forwarded-Encrypted: i=1; AJvYcCU01IJhZyKz0mlaWlB0eYfKrVaMoW4l2OwHXGrExq3LyWSmoivMRB7wJA3um0nT7PQZO/JpQXdmHkVdiwK3hZE=@lists.infradead.org, AJvYcCXmIuwbGZns/uUQb12IUByfB0ZXkvn2snZvJcVy3rVtiHJPpz+8ctGEwf3uaRYavh02dnj4LAHiVKFLh+sV/fM1@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLQl9+efSDT7d2X0DSurAB8p3vqG74B1Yi4s8okpcwbguTe3s
	3mJFc1hip40aONx1tfzc5UBFrPPI7XsQ7eGF6W6sTd8CmrC0tDD1
X-Gm-Gg: ASbGncuv1skb8O7NlLOrD+yHmftTd/2mnUzW0/ga0EtK9lnX4EN+ZtRt9yHXBl+5Szg
	WtkwdXaGBwEG/72xLJ/KtKWYmUtBCRGcUfD/aZWved02JaCmKVOtsL8nUfla/AcQ0py6uHoUcpe
	JJ0XDImPhDeoMTndW51EIG08NfG890LWIXUQ2iK25G2LkmcmoMIB2zYfahsxY7ZYjz8yfTsuSCo
	TSiyR0EXBvzJgXISSXXWfGSS9ozExAhbWyy6nQw+7uTjGY/abI+SktLtBRqVdGPkgisqwoGHwdq
	o4qaeNMgQcpS1duCW6TANNZIYhn7oYCo5XxYjYuMuVXXgQGrx/Ec9Ar2cYgrpJbYh0H8CWw70my
	bgVKY6LodlsbthThXmUT3gL4bUBQpsWw=
X-Google-Smtp-Source: AGHT+IH3My3UUh3xFM8ZgIgF0aWMNmsqTttAtJxwpSIcvfI0XILfisWjLOFCeDXh+SXgbl3J8Hxz3A==
X-Received: by 2002:a17:907:3e24:b0:aac:2298:8960 with SMTP id a640c23a62f3a-ab2ab6fcf7amr446231766b.35.1736412980929;
        Thu, 09 Jan 2025 00:56:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060a4fsm50179466b.15.2025.01.09.00.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 00:56:20 -0800 (PST)
Message-ID: <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
Date: Thu, 9 Jan 2025 09:56:17 +0100
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
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005625_228002_7F8482A8 
X-CRM114-Status: GOOD (  25.76  )
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



On 1/7/25 4:03 PM, Russell King (Oracle) wrote:
> On Tue, Jan 07, 2025 at 02:14:03PM +0100, Eric Woudstra wrote:
>>
>>
>> On 1/7/25 1:47 PM, Russell King (Oracle) wrote:
>>> Going through the log...
>>>
>>> On Tue, Jan 07, 2025 at 01:36:15PM +0100, Eric Woudstra wrote:
>>>> Log before this patch is applied:
>>>> [root@bpir3 ~]# dmesg | grep eth1
>>>> [    2.515179] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082380000, irq 123
>>>> [   38.271431] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
>>>> [   38.279828] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
>>>> [   38.288009] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
>>>> [   38.296800] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
>>>
>>> This is indeed without the PHY. We're using inband, although the PCS
>>> mode is PHYLINK_PCS_NEG_INBAND_DISABLED, meaning inband won't be
>>> used. As there is no PHY, we can't switch to MLO_AN_PHY.
>>>
>>>> [   38.306362] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
>>>> [   39.220149] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
>>>> [   39.229758] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
>>>> [   39.239420] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
>>>> [   39.249173] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
>>>> [   39.259080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
>>>> [   39.594676] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
>>>
>>> The PHY comes along...
>>>
>>>> [   39.603992] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
>>>> [   39.650080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
>>>> [   39.660266] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
>>>> [   39.671037] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
>>>> [   39.684761] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
>>>
>>> We decide to use MLO_AN_INBAND and 2500base-X, which we're already using.
>>>
>>>> [   40.380076] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
>>>> [   40.397090] brlan: port 5(eth1) entered blocking state
>>>> [   40.402223] brlan: port 5(eth1) entered disabled state
>>>> [   40.407437] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
>>>> [   40.414400] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
>>>> [   44.500077] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
>>>> [   44.508528] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)
>>>
>>> ... but we don't see link-up reported by the PCS after the PHY comes
>>> up. Why is that - I think that needs investigation before we proceed
>>> to patch the issue, because that suggests the PCS isn't seeing
>>> valid 2500base-X from the PHY.
>>>
>>
>> I think it is because pl->act_link_an_mode stays at MLO_AN_INBAND, but
>> it needs to be set to MLO_AN_PHY, so that only the phy determines the
>> link state:
>>
>> phylink_resolve() {
>>     ...
>> 	} else if (pl->act_link_an_mode == MLO_AN_PHY) {
>> 		link_state = pl->phy_state;
>>     ...
>> }
> 
> Please see my reply to Daniel. The PCS should still be capable of
> reporting whether its link is up or down irrespective of whether
> in-band status is being used or not.
> 
> While it is correct that PHY mode needs to be used here, your report
> has pointed out that the driver is not reporting the PCS link state
> correctly when in-band is disabled.
> 
> Given that the current state of affairs has revealed this other bug,
> I would like that addressed first while there is a trivial test case
> here.
> 

So I've narrowed down the problem a bit:

At first state->link is set to true, while looking at the bmsr.

But because linkmode_test_bit(fd_bit, state->advertising) and
linkmode_test_bit(fd_bit, state->lp_advertising) are both false,
state->link is set to false after looking at the bmsr.

void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
				      u16 bmsr, u16 lpa)
{
	state->link = !!(bmsr & BMSR_LSTATUS);
	...
	case PHY_INTERFACE_MODE_2500BASEX:
		phylink_decode_c37_word(state, lpa, SPEED_2500);
	...
}

static void phylink_decode_c37_word(struct phylink_link_state *state,
				    uint16_t config_reg, int speed)
{
	...
	if (linkmode_test_bit(fd_bit, state->advertising) &&
	    linkmode_test_bit(fd_bit, state->lp_advertising)) {
		state->speed = speed;
		state->duplex = DUPLEX_FULL;
	} else {
		/* negotiation failure */
		state->link = false;
	}
	...
}

And I can confirm, if I change the part above into the part below
(removing the if statement), the PCS also reports the link is up and the
connection is functional end-to-end. Not that I'm saying this change is
the solution, only for narrowing down the problem.

static void phylink_decode_c37_word(struct phylink_link_state *state,
				    uint16_t config_reg, int speed)
{
	...
	state->speed = speed;
	state->duplex = DUPLEX_FULL;
	...
}

Also worth mentioning, up until v12 of the pcs-mtk-lynxy.c
mtk_pcs_lynxi_get_state() did not call
phylink_mii_c22_pcs_decode_state() at all for 2500base-x.


