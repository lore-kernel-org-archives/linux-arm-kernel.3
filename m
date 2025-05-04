Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7158C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG5Q7M6LXC8ceUGjLsv7jt8ZOhJNoErjR02gyORXoXA=; b=NbYxRH+t8sKsaA3g/ICjmeaWgC
	25MgUKOUlGLJuFGtn2zKIys/nG7sqe6KPUO+RCu7RakKVcyDfdhwT80CVGCz7Gzz2WEaGrFx//i5e
	IOP+X2wD6mL8DMLnOAJawpWZeOtAnda/teJyRenVakwpsSBkIzakvqNNdvYbLiRYC3r1yqydoOBAE
	E81HSgys2cr7k0SSNC4JNHNS1NnzKhHS/jS8UqrCXYmAmPXx8Rz+Hn8J4Vs5ntuf91C1Wna1eW450
	5nRzs53uBi+i6UTdCd6rvIAHqBuJCNV5C5UxlFaePNEkPjU7uMqamsM6z7n12k1T5lomvb7BKvzBQ
	kgZzRXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiRS-000000066La-0Kaw;
	Sun, 04 May 2025 23:08:14 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiPY-000000066C9-0HFI;
	Sun, 04 May 2025 23:06:17 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c54f67db99so572137085a.1;
        Sun, 04 May 2025 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746399975; x=1747004775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WG5Q7M6LXC8ceUGjLsv7jt8ZOhJNoErjR02gyORXoXA=;
        b=OqW1qw2bB0pvsHsqs/2h8LYN4MHQQ4hHyB7sWZ03KGxRGOrWXBseIQw3FHgqrjdpuc
         td5zwZNXlujMuWoR3DbfG4vQwn0ub/Gp8In1gYTgnsCdxFneUfx8W6kAOsfv97cjZBHO
         l9DxIu2Pq3MyAm/P1rrTA3LM9nBvXc4on8DLqXjslT93ysCeRYqCCqmGZitpCrkafnfL
         hDwqeDJmRztLvJp+R6j2ERslMBQRPZ0rmH8ugqcOoURM16VsVvEiZiFy5RQ5G8+OcUtY
         GGRojuOJi1jv9YrTZ1Fxw/wAKhKB1iVv47y8DHsnvKjxwTO3A6l0lPCO9NpHDqQmB9MU
         jU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746399975; x=1747004775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WG5Q7M6LXC8ceUGjLsv7jt8ZOhJNoErjR02gyORXoXA=;
        b=WRiacPQ426jKMOX+MaHOUAEt0zi5md4rCXPiz9AvRHWgH+bxW7dfvckbchyN91nkTD
         Kkc33SyEb3ocH1JYFq6O/aUmpdZboav8u4XUtm8BPXt3U74wFqlVlEJ93tDf+H7pMLC8
         +XBUgHsT2Qfzk/A3xR/Od/b9oa+fs9Y8nClQ1Gwq/CCtygmjyT1d9CSmhKV1Bv9qMxyd
         6AzxzKSu0srwn4Srzul50hLp+mDyVYGw58wfOexKWwra1mP/DJ1QVB2NUzcAHklA1J+g
         mQ3DCt3q8v32H45lo0iSXDtysCknV4DLGaAEC83A/iMSVmwPF/A4arwDH90mHrj5X/uR
         zMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2QyIF1r4YVWY26ejTimokpo0VRBNkztYogOTfMhJ/+BL+zhK2MR81O4kyaOAFl57sD8KHzkofQ448s6NkqpY=@lists.infradead.org, AJvYcCUpypKmqtKXfgkTJgxOxEd42jTJFE1SFc0RClFSD0T2K89YO5ZQcw+AcbTDFLF1RloiTs8MMs2em37llQrd88sP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbgzuxh2C4E8SB+Z11YZSsikyaN5Hrgz45RJZr3wzEgxExg5WN
	regq+N1PXaTi35A48wMu4fJLo+kTmO5uEk7GOyADabUHi8LS8aYx
X-Gm-Gg: ASbGnctWPHLG6Y3dP+YKbW1tD3/5HqjCxPnSVo6BY2Mlp/hh0lfYdfeFjIlr2uy98XR
	xndW1QsNGnMLAblB18XLQ5vp4OFXw6BWBPy5F9vD5pD1YagmyYPSn6dRJv0T8RvCoWELLsxGoD2
	SqRTn62YUc0LDs55PaYIXYMUtSgzNP7p1eFFIqt7XojhvHWMep8/Z9XnXUpiX9PghZ+LP00sjqD
	S8RttvXtnXSWW6cF23FXtDdsgqzS4BV9F2p+ILzIBkBfxAmKmlRJAnI4BqnnsFWDHOCYoU7583z
	PkIz6nwrHjYF0maMyH+/VRnK7eke159/mY92oa/GM3+8ubhpKGZMaOuxj/f/4A==
X-Google-Smtp-Source: AGHT+IGXVOmqNZtnqI0MebY7SuNjt8ChHjXmPGL86trlt2xMX3O3Zn4OdIXuAF3VZCOaQ2cofukTSA==
X-Received: by 2002:a05:620a:1995:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7cad5745825mr1588016285a.11.1746399974646;
        Sun, 04 May 2025 16:06:14 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b530bsm490164385a.6.2025.05.04.16.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 16:06:14 -0700 (PDT)
Message-ID: <547dab4c-a96d-4196-a092-ca409e2ca8c5@gmail.com>
Date: Sun, 4 May 2025 19:06:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_160616_126113_BC7BBD90 
X-CRM114-Status: GOOD (  16.25  )
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

On 5/4/25 7:01 PM, Andrew Lunn wrote:
> On Sun, May 04, 2025 at 05:02:33PM -0400, John Clark wrote:
>> On 5/4/25 10:12 AM, Andrew Lunn wrote:
>>>>> +&gmac0 {
>>>>> +	clock_in_out = "output";
>>>>> +	phy-handle = <&rgmii_phy0>;
>>>>> +	phy-mode = "rgmii-rxid";
>>>>
>>>> See Andrew's remark on v1 of this patch.
>>>
>>> Hi John
>>>
>>> If you have questions, please ask. It is not a good idea to silently
>>> ignore reviewers comments. Either do something about it, ask
>>> questions, or politely argue why the reviewer is wrong, because
>>> sometimes we are.
>>>
>> Hi Andrew,
>> Thanks for your feedback and the link to the RGMII delays discussion. I
>> assumed you suggested switching to phy-mode = "rgmii-id" from rgmii-rxid.
>> The vendor’s downstream kernel uses rgmii-rxid with tx_delay = <0x20>, as
>> shown in my post. I tried rgmii-id and removed tx_delay, but the interface
>> failed to get a DHCP address. Reverting to rgmii-rxid with the delay
>> restored functionality. Any advice on correctly configuring rgmii-id or
>> adjusting delays for this board?
> 
> What PHY is it? Are you using the correct PHY driver for it, or
> genphy?
 >

This fails:

&gmac0 {
         clock_in_out = "output";
         phy-handle = <&rgmii_phy0>;
         phy-mode = "rgmii-id";
         pinctrl-names = "default";
         pinctrl-0 = <&eth0m0_miim
                      &eth0m0_tx_bus2
                      &eth0m0_rx_bus2
                      &eth0m0_rgmii_clk
                      &eth0m0_rgmii_bus
                      &ethm0_clk0_25m_out>;
         status = "okay";
};

&mdio0 {
         rgmii_phy0: ethernet-phy@0 {
                 compatible = "ethernet-phy-ieee802.3-c22";
                 reg = <0x0>;
                 clocks = <&cru REFCLKO25M_GMAC0_OUT>;
                 pinctrl-names = "default";
                 pinctrl-0 = <&gmac0_rst>;
                 reset-assert-us = <20000>;
                 reset-deassert-us = <100000>;
                 reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
         };
};

&pinctrl {
         gmac {
                 gmac0_rst: gmac0-rst {
                         rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO 
&pcfg_pull_none>;
                 };
         };
};


This works:

&gmac0 {
         clock_in_out = "output";
         phy-handle = <&rgmii_phy0>;
         phy-mode = "rgmii-rxid";
         pinctrl-names = "default";
         pinctrl-0 = <&eth0m0_miim
                      &eth0m0_tx_bus2
                      &eth0m0_rx_bus2
                      &eth0m0_rgmii_clk
                      &eth0m0_rgmii_bus
                      &ethm0_clk0_25m_out>;
         tx_delay = <0x20>;
         status = "okay";
};

&mdio0 {
         rgmii_phy0: ethernet-phy@0 {
                 compatible = "ethernet-phy-ieee802.3-c22";
                 reg = <0x0>;
                 clocks = <&cru REFCLKO25M_GMAC0_OUT>;
                 pinctrl-names = "default";
                 pinctrl-0 = <&gmac0_rst>;
                 reset-assert-us = <20000>;
                 reset-deassert-us = <100000>;
                 reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
         };
};

&pinctrl {
         gmac {
                 gmac0_rst: gmac0-rst {
                         rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO 
&pcfg_pull_none>;
                 };
         };
};

> 
> rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
> possible to use this SoC with the correct 'rgmii-id',
> 
> 	Andrew

