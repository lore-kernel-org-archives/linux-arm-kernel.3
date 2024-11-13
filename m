Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44908D637C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMBQ0m5kkXEHoCVQTc08uTx25ys042yRR7+hzveSg4Y=; b=cNCELJVbRahtWtKvCZNwvZOFZB
	7m90uKcp7nMA9F+qE+mDUqG64lhtjIymBeQKHN5GInej+9RLcDwfWezhXMFR6G3JxjFdpggIKaQcH
	wXVfefEKenQd0x68iLWQP/upmqc+fO12srCPOQlk7CIMg0Vu53ylBP8uGEJlnSPuUIHXrrIbbBSvj
	LRGZhQl8ui5nFmF8mSf1bEzGiz30GYL05XSND3xCocINZ65ZW86QkT2SC5IWxm98lN98aegjfR6yI
	StDb9IFQQOQ3PMQquHgmJpU/B8LAQ2+JMN0Hwr/msdafXdwkQzNtbED5cOz7OVMFZ+4wqC5fvIpsR
	zmwc1f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLGa-000000086QQ-06dz;
	Wed, 13 Nov 2024 21:51:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLEB-000000086B2-1Z9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 21:48:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43152b79d25so62155515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 13:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731534520; x=1732139320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMBQ0m5kkXEHoCVQTc08uTx25ys042yRR7+hzveSg4Y=;
        b=djSsXV0z0jZvd364b3N3/2OT6cnXFvpcNraLd0BL8Eq+Yl0BMvRtKDJp99yNV2M1wV
         bLPCLBGRZ8qhgElH9OkeUWsLtIDN2IHQhzH3xNwlP4N77acBvJMdxgUd8muJNCZw4WTz
         zcWA5Z9C8c+sDIrVvRX/9T2m/7nQwSBYButQAjNBYId/Gae5I2A6cQWEVzToFfxgK97B
         cXKtq4UYrJG62mmWelVEMQBJPmlX2/FSi/j4rTk7fjjIOsZFlhxP0q7Gbo1Y+p1OjUue
         U1SP3By+3i31w8dh2UAeKJxZYsCDBEQh1Km5+adrve9U6dlnihYpBH70272dqdhZq3wc
         82BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731534520; x=1732139320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMBQ0m5kkXEHoCVQTc08uTx25ys042yRR7+hzveSg4Y=;
        b=MmfX9/6sTXnkYeRjQjVJzO15tvH/CgsGUmYFutIZypunky4H7HZqoVoNNCH+00bHqN
         oNv+ctJdmONnyUTe6Km6OwKTI64N4SGglHHzWeq8PBvVUvvsilidMVpci13AD19gfA1O
         j/Q7bH3PUtBsgZg8GQH95uY1GZLEBJY9zZam1pchul47Wl3wNYBfd7nGRCyOCuZ9TVHE
         hYdbuEV7HQh/Pe6yOOziAjzdS5qdtZ9sqepO2yHPELuO/6YiYP1Jx4YvOsrrquHM3WVB
         WR4PgmrSE2az1AachlaWnDRIBA1HAykGnh2n4Lj8LPeJnmGmKTFqO0nyPlZjQvO1pVp5
         +jpg==
X-Forwarded-Encrypted: i=1; AJvYcCVTXglhqnwsGkgR0R+hR1QYN5xKaZMgAo5Etsdkkps811rikzzxauHGuTq4WC06KVYHIsTlm265TBQLWH/JWW93@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFkAYNSoTFrKe1LXjSYVEs+bo5I/nuhlCOk4FYz1on3wa/mel
	RlQ6wwu5NunvVpSjjtr5jovaQAP9d11NCnfSO6zcC9J2nVF7Sj+yrwqaYw==
X-Google-Smtp-Source: AGHT+IF7IA2PJ6jEa2ayjriGxpiOGm/okZs4V0FnTFkzwl6CmZTJ3E2MG9UnN4DPJYwhj4gWZnioiw==
X-Received: by 2002:a5d:47ac:0:b0:37d:5282:1339 with SMTP id ffacd0b85a97d-3820df6136cmr3727419f8f.22.1731534519604;
        Wed, 13 Nov 2024 13:48:39 -0800 (PST)
Received: from ?IPV6:2a02:3100:b00a:5a00:ad7b:78f2:9ae0:4ed8? (dynamic-2a02-3100-b00a-5a00-ad7b-78f2-9ae0-4ed8.310.pool.telefonica.de. [2a02:3100:b00a:5a00:ad7b:78f2:9ae0:4ed8])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf6926ad39sm970199a12.60.2024.11.13.13.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 13:48:38 -0800 (PST)
Message-ID: <392105cb-3f73-4765-a702-7cce0c6ac62c@gmail.com>
Date: Wed, 13 Nov 2024 22:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to update
 eee_cfg values
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_134843_441807_8BD52357 
X-CRM114-Status: GOOD (  31.81  )
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

On 13.11.2024 11:10, Choong Yong Liang wrote:
> 
> 
> On 12/11/2024 9:04 pm, Andrew Lunn wrote:
>> On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
>>> In stmmac_ethtool_op_get_eee() you have the following:
>>>
>>> edata->tx_lpi_timer = priv->tx_lpi_timer;
>>> edata->tx_lpi_enabled = priv->tx_lpi_enabled;
>>> return phylink_ethtool_get_eee(priv->phylink, edata);
>>>
>>> You have to call phylink_ethtool_get_eee() first, otherwise the manually
>>> set values will be overridden. However setting tx_lpi_enabled shouldn't
>>> be needed if you respect phydev->enable_tx_lpi.
>>
>> I agree with Heiner here, this sounds like a bug somewhere, not
>> something which needs new code in phylib. Lets understand why it gives
>> the wrong results.
>>
>>     Andrew
> Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.
> 
> The current implementation of the 'ethtool --show-eee' command heavily relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by the 'ethtool --set-eee' command and the phy_support_eee() during the initial state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which returns the eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable for the 'ethtool --show-eee' command.
> 
"relies on" may be the wrong term here. There's an API definition,
and phy_ethtool_get_eee() takes care of the PHY-related kernel part,
provided that the MAC driver uses phylib.
I say "PHY-related part", because tx_lpi_timer is something relevant
for the MAC only. Therefore phylib stores the master config timer value
only, not the actual value.
The MAC driver should populate tx_lpi_timer in the get_eee() callback,
in addition to what phy_ethtool_get_eee() populates.
This may result in the master config value being overwritten with actual
value in cases where the MAC doesn't support the master config value.

One (maybe there are more) special case of tx_lpi_timer handling is
Realtek chips, as they store the LPI timer in bytes. Means whenever
the link speed changes, the actual timer value also changes implicitly.

Few values exist twice: As a master config value, and as status.
struct phy_device has the status values:
@eee_enabled: Flag indicating whether the EEE feature is enabled
@enable_tx_lpi: When True, MAC should transmit LPI to PHY

And master config values are in struct eee_cfg:

struct eee_config {
	u32 tx_lpi_timer;
	bool tx_lpi_enabled;
	bool eee_enabled;
};

And yes, it may be a little misleading that eee_enabled exists twice,
you have to be careful which one you're referring to.

ethtool handles the master config values, only "active" is a status
information.

So the MAC driver should:
- provide a link change handler in e.g. phy_connect_direct()
- this handler should:
  - use phydev->enable_tx_lpi to set whether MAC transmits LPI or not
  - use phydev->eee_cfg.tx_lpi_timer to set the timer (if the config
    value is set)

Important note:
This describes how MAC drivers *should* behave. Some don't get it right.
So part of your confusion may be caused by misbehaving MAC drivers.
One example of a MAC driver bug is what I wrote earlier about 
stmmac_ethtool_op_get_eee().

And what I write here refers to plain phylib, I don't cover phylink as
additional layer.


> The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver are not retrieved by the 'ethtool --show-eee' command.
> 
> Currently, we are facing 3 issues:
> 1. When we boot up our system and do not issue the 'ethtool --set-eee' command, and then directly issue the 'ethtool --show-eee' command, it always shows that EEE is disabled due to the eeecfg values not being set. However, in the Maxliner GPY PHY, the driver EEE is enabled. If we try to disable EEE, nothing happens because the eeecfg matches the setting required to disable EEE in ethnl_set_eee(). The phy_support_eee() was introduced to set the initial values to enable eee_enabled and tx_lpi_enabled. This would allow 'ethtool --show-eee' to show that EEE is enabled during the initial state. However, the Marvell PHY is designed to have hardware disabled EEE during the initial state. Users are required to use Ethtool to enable the EEE. phy_support_eee() does not show the correct for Marvell PHY.
> 
> 2. The 'ethtool --show-eee' command does not display the correct status, even if the link is down or the speed changes to one that does not support EEE.
> 
> 3. The tx_lpi_timer in 'ethtool --show-eee' always shows 0 if we have not used 'ethtool --set-eee' to set the values, even though the driver sets different values.
> 
> I appreciate Russell's point that eee_enabled is a user configuration bit, not a status bit. However, I am curious if tx_lpi_timer, tx_lpi_enabled, and other fields are also considered configuration bits.
> 
> According to the ethtool man page:
> --show-eee
> Queries the specified network device for its support of Energy-Efficient Ethernet (according to the IEEE 802.3az specifications)
> 
> It does not specify which fields are configuration bits and which are status bits.


