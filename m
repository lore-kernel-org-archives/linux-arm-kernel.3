Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C87C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+bvwgvu4CkJDHRlSzEsfX8EKftNhXZjfWiun+N9twI=; b=aOzhMY4/an8eJU
	4ByhfKSv6Apq5WeFJLLFcZ7l7P4Q7GeOOBxmz7tLebOaT8HHWNdE0EfPOLKdf474eK+m8Yppw+iiK
	CuPc1GFIm7UIhdRJ8xY4xP7FntxJWs8P/v2l5HqWNyGIGv6dWGM5Gv6E34Z3Bg+fvg4fj4m+qpJcy
	U88jipS8FFPyKWyDTQibx3uFtrFIcS/kQjKQRt1m9SIW1hD2b51ajA+JBZ9dYoU7ZRXavXC0uolwC
	DG3/efV+p6++DHL9wgeJbvgm4caHKpgM4oVMS5B82C+RZHG/caE3FXu7z9eZrQrKO1QTnHFYNaFuZ
	aEYAG0VC6KhH9U6oFaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXegO-00000008Btt-3mIc;
	Tue, 14 Jan 2025 11:02:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXedb-00000008BFT-04hm;
	Tue, 14 Jan 2025 10:59:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so8943727a12.1;
        Tue, 14 Jan 2025 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736852349; x=1737457149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+bvwgvu4CkJDHRlSzEsfX8EKftNhXZjfWiun+N9twI=;
        b=JVq2i3yt4XgLjhcEvM8qE5g2OP2jXiMThN9r2iWr6q9ovmnAY1XTdvpLlHYBVKXmt5
         DRox+01oqSgnzJgEBXGsDYdbyRhurFD7wQcqCwj9SE3JhriA5J68SZOLMhUJeOBhgFRg
         HjuzUIPr1GT/GTISVYtsDn0bT2Y7yVxkjsMqWr+nCCp0ml7BuIqeFFchBfDWR8DCEnYq
         BCUWk7I/UXDFewTBaQOcnH/i4T8Jp2w5Hr7IoSvZ+K3P9dlRl0yHDjRhaBkzw97XS1H4
         pgwSRY8Zz2DFuP3BgPJR272Q7D5/ge8EahlT05BGBv4A3Dt/i3z/YMNGeSNJIXR/dXbw
         VAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852349; x=1737457149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+bvwgvu4CkJDHRlSzEsfX8EKftNhXZjfWiun+N9twI=;
        b=b7DQ/tqD5pa2oFKbAXYIN+qxcuPrL+ED0/k8/i92RtCgmJMWi+odIMqIPOz3RmeJmR
         ypJA4GnAmtbRTNmq0X2dhvMLmOhkLovHM7MGkWH0e/7DQQcHDZ8nHhG8DfgYjM37lhz+
         iXA/as+bT6DaWmjEW3w8m4XpkPoo0IZdWTqBKmcHL3+jya1RCfm+DMR0Dvvn/AKifBtm
         XA3iQfnJ8Bhgl5mmVFD0Sum8GGCoFb8TxD554Y+KWbLNHVwWujICq3wqkzCJnh4vNmjT
         8WvcY3Xd+sFm42gLsJfMX3EgR7eFWlZe+DwzU4iTOEcaU4CHJUUGfN9IvmV5UFIOqn5e
         aVeg==
X-Forwarded-Encrypted: i=1; AJvYcCU4YezKZlYqx0AKL79bwOOY1aoaQgTtR437F3p00Tc3iE48cyET8SCkScpOiPGgvua/rGGmyCdIseogyEfQ/u6Z@lists.infradead.org, AJvYcCW94lY10UpPhNwUTYkmipCQPyhcOE9Cbk4j9n1ECNa8T5Frllc4cKL8QYfiB62uCyxkRLunWVOBfBVXV4yxgkg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbIK+aLPYd4T64OrJw1f5l5aWM8yKAEkopSOECbouxWU6sMF/r
	G4rXQB85n/nuXv0c866oHDk8NR/oECAf2cxo2TW4HfVBLPQJo8KW
X-Gm-Gg: ASbGnctUljbLzkQH3yWKqLWKoB28v+TFiNDntyqJvphcH85sW/GJjTvAUQF4pExzbP5
	2cCSMvT1njaxGajza4pwN0FHfRf40eyQoxDThICYnvHvO8gpvTRDmVbAoUr1KI//7MdDSDz5Nt9
	iP3qg8dA4zK6810toZsyWATt7/aot/LC/WgkeTjVfoYCFzAOkPsq6H7yPsKtSM0VB1KXmS7KVds
	Q8l5J2a5AvxvtFoCkZ8Pk+L1uX8h1Xdc8Yaa+EVbeyOwpzWVs7jSDuMGKsnldVXvPv4w3mv1PrL
	ykxH9XZ2ZdO6bBKgeLCL208ejMbB9fL8HQyarqhFaorheRZoRVrZVWWG3nUszhY6TU6MywhOSk/
	AJ4BK35Ccf3XybFww2tirV7ktRFpxe+c=
X-Google-Smtp-Source: AGHT+IGHKnCOMaakbmO+qlp9H2dpIL+fGfdF1aR9r2RdZWi0icXr2XaYrNo9rCMG1v1cc/9NlZ/sww==
X-Received: by 2002:a17:906:6a0e:b0:aae:e784:55c5 with SMTP id a640c23a62f3a-ab2ab7101eemr1730141766b.33.1736852348666;
        Tue, 14 Jan 2025 02:59:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9562ea8sm620531566b.93.2025.01.14.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 02:59:08 -0800 (PST)
Message-ID: <29240b2d-8a34-47d6-8b99-a371668b0bef@gmail.com>
Date: Tue, 14 Jan 2025 11:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/5] net: phylink: fix PCS without autoneg
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <Z4TbDnXtG8f3SRmC@shell.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <Z4TbDnXtG8f3SRmC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025911_058696_3826890E 
X-CRM114-Status: GOOD (  25.07  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 1/13/25 10:21 AM, Russell King (Oracle) wrote:
> Hi,
> 
> Eric Woudstra reported that a PCS attached using 2500base-X does not
> see link when phylink is using in-band mode, but autoneg is disabled,
> despite there being a valid 2500base-X signal being received. We have
> these settings:
> 
> 	act_link_an_mode = MLO_AN_INBAND
> 	pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED
> 
> Eric diagnosed it to phylink_decode_c37_word() setting state->link
> false because the full-duplex bit isn't set in the non-existent link
> partner advertisement word (which doesn't exist because in-band
> autoneg is disabled!)
> 
> The test in phylink_mii_c22_pcs_decode_state() is supposed to catch
> this state, but since we converted PCS to use neg_mode, testing the
> Autoneg in the local advertisement is no longer sufficient - we need
> to be looking at the neg_mode, which currently isn't provided.
> 
> We need to provide this via the .pcs_get_state() method, and this
> will require modifying all PCS implementations to add the extra
> argument to this method.
> 
> Patch 1 uses the PCS neg_mode in phylink_mac_pcs_get_state() to correct
> the now obsolute usage of the Autoneg bit in the advertisement.
> 
> Patch 2 passes neg_mode into the .pcs_get_state() method, and updates
> all users.
> 
> Patch 3 adds neg_mode as an argument to the various clause 22 state
> decoder functions in phylink, modifying drivers to pass the neg_mode
> through.
> 
> Patch 4 makes use of phylink_mii_c22_pcs_decode_state() rather than
> using the Autoneg bit in the advertising field.
> 
> Patch 5 may be required for Eric's case - it ensures that we report
> the correct state for interface types that we support only one set
> of modes for when autoneg is disabled.
> 
> Changes in v2:
> - Add test for NULL pcs in patch 1
> 
> I haven't added Eric's t-b because I used a different fix in patch 1.

So I tested this V2 patch and with the first link up command, I get the
link up which is functional end to end.

Tested-by: Eric Woudstra <ericwouds@gmail.com>

PS, FYI: I do however still have the difference in phylink_mac_config().

At first the link is up with (before phy attached):
phylink_mac_config: mode=inband/2500base-x

When the phy is attached, phylink_mac_config() is not called, but we
have functional link.

When I do: ethtool -s eth1 advertise 0x28, then:
phylink_mac_config: mode=inband/sgmii

And back again: ethtool -s eth1 advertise 0x800000000028, then:
phylink_mac_config: mode=phy/2500base-x

I can share more log entries if needed.


