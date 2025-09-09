Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D48BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs6PSVWsZetmovjDd8/UQOAALgqwhMIdtJCi5l1e3lk=; b=UPNCXdZZA6fDZQhss1UpCJurlg
	7ljVrcW+fZ/a5+oNCQeYfR+dTQ8z8PbEpp0n/4L0dDE2KozY+pdt/U66zroGJSpFEqOK84STAXMZM
	ppwDq/L8qFGwk+CW58S1B2Lu+jMaG/esc8qO7gMcXeUTEPY9Gte9TLYcad9Mbdd51p/WtOAW653BB
	OvuOdq66cynvPt45E2uh9kuWhn2Nu0MsuttwinCRZ7mGPGQ/LSPjxlJo5YjPzFhXdg7t1zKIgTkvv
	FONjUOQ2k7/zhBvDMkH5PQpqBSszFbjL/0A4tzHIleaVjnbLB/ypONj2gIiJFIH8sHwr0l0K/6sCd
	qu5m9eWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yZ-00000008rvv-1OiD;
	Tue, 09 Sep 2025 17:17:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxtC-00000007DVB-46Ak;
	Tue, 09 Sep 2025 12:56:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3913540f8f.3;
        Tue, 09 Sep 2025 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422561; x=1758027361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs6PSVWsZetmovjDd8/UQOAALgqwhMIdtJCi5l1e3lk=;
        b=celC/T7XGGhKOrM4lOQ+34/EaOoH0H+bRiq9DVlz61jn7fekZnRl/FXEvcZ9N/1dkj
         VM+tHrU+DG/dg/+h4XgHDf3+/fnZKDBpuyCrjLeVZsT5Zmxgh7HYbMOw353/uFjo+o6T
         lewA4aiLuwpOXtXpIlWSKrO57s3Z1kFbmmgWhxnxFMlUGY0WeRJU03lj81waekcyyU7j
         XLZUMll+sFkPJbe2UO2d8iOPJ1a5Cp/zrivbMGHZx7aH0SvKk/HWdn5/ohsZV/id6DfZ
         G1HvpLeLaLiyF3abIIDsvHPEtP+yjiqsTc7xJRc2XdMmfagr8A4yu1WoNsaI2jwUiyt8
         9Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422561; x=1758027361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs6PSVWsZetmovjDd8/UQOAALgqwhMIdtJCi5l1e3lk=;
        b=RSaMgoVTT639C7bbUH10QeNgaiZV10d8S9ZnUKUYudznRxfSVHmmJsyLDjLo2AmkCz
         YNUPGK1VScx9q4xpi9jTurqB4OPcxLQN8vZBQJiVrFonPle1GkVuT7utVEyIYdfKX/Lo
         cf+95cqaHk/Ps4TFnpCwTESCo1+DDwvlO4HubtbD2k1Ri5oKDxDZqUeA0NtgLKYTw5Uf
         eOlb0v1e5qFRLouwf6yzFs+mzY4OV9opHzmcgSju7v96rOncdE4gD9O6DtWpEvSFWn2K
         r2bGssD/A1r7jbSrMR98eepXdq63CW0QBlFmoZnuFw6R4L6vqB/McrXerR+ZGZw0WKdn
         5D+w==
X-Forwarded-Encrypted: i=1; AJvYcCUT61XYwelBmRSoU/KNxbEfdMVCrIkVZbC63xrrUpPYlsgkqTpR+r8OEqBB75AvBJIMiIAYAotXbQpAujWFuko=@lists.infradead.org, AJvYcCUeT+xkkPvdmQYqhxAxlfdvnZXqmoZCOs/7wyIlruKYQZ/IUqS0UQbZmnhceJo8F2Q2loKaIpmqiWX2Ywr6YobE@lists.infradead.org
X-Gm-Message-State: AOJu0YzADY9Ck7YZCEjrW6OvhCW4qUspQfTZlCuLCEXo192KXPZcqh6/
	sklREkGdz5fK6SUem0DM3AymoeiPLPNCcZZWFuxlH66VyYKrgeU5IHK9
X-Gm-Gg: ASbGncum5BV0jkrhXBNLmtJu7yiTwD1voWswWEntdUpzIcq7EDNO7UVs5CNa8eVlZDL
	iGbAKL1f6uersWPe0btSZAtdnxPw1Wx4Ogt1GBxKx0RsK/dWdd5kvt+5/tAF4Jw8R//axIae0YF
	PcsrjAUdspfukLE68m3DLS8Hry/sx2qhHWZ7DzQtwSTbxdu+TV0Ax3KlcECaw2ohyLTCjYgj4rS
	HJvYG8OUxSBmOUa188P+I6C+y8A8igjEdmRteoEddHBsceOFOYnoy01Nb5sbzRS8wen+wOzm5s/
	UTgYJfGfYaRFiLHKqM5ZHc+pLe3pyhduY9Y3184RMAqT7O3b53UbnEDKr2M5mckAQjXiyHl/0MW
	UUqUKivWtgdma8S+r0h9IbSPOj7IvTgY=
X-Google-Smtp-Source: AGHT+IHWoxi8ul5BBsyoKDm8D0Ls7ROcCv3GjqOTzlR0eW/G4T6hIVWnLPePdLCCK8/yFYt8oIKJrg==
X-Received: by 2002:a05:6000:40c9:b0:3e5:4ad:2b38 with SMTP id ffacd0b85a97d-3e642309230mr8046948f8f.9.1757422560962;
        Tue, 09 Sep 2025 05:56:00 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca2ddsm2628865f8f.23.2025.09.09.05.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:55:59 -0700 (PDT)
Message-ID: <ee677e0d-b63f-412c-8dbf-c3623ca70407@gmail.com>
Date: Tue, 9 Sep 2025 14:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250709111147.11843-1-linux@fw-web.de>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_055603_025895_7E103ACB 
X-CRM114-Status: GOOD (  30.04  )
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

Queued patches 7 - 13

Thanks!

On 09/07/2025 13:09, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series continues mt7988 devicetree work
> 
> - Extend cpu frequency scaling with CCI
> - GPIO leds
> - Basic network-support (ethernet controller + builtin switch + SFP Cages)
> 
> depencies (i hope this list is complete and latest patches/series linked):
> 
> support interrupt-names is optional again as i re-added the reserved IRQs
> (they are not unusable as i thought and can allow features in future)
> https://patchwork.kernel.org/project/netdevbpf/patch/20250619132125.78368-2-linux@fw-web.de/
> 
> needs change in mtk ethernet driver for the sram to be read from separate node:
> https://patchwork.kernel.org/project/netdevbpf/patch/c2b9242229d06af4e468204bcf42daa1535c3a72.1751461762.git.daniel@makrotopia.org/
> 
> for SFP-Function (macs currently disabled):
> 
> PCS clearance which is a 1.5 year discussion currently ongoing
> 
> Daniel asked netdev for a way 2 go:
> https://lore.kernel.org/netdev/aEwfME3dYisQtdCj@pidgin.makrotopia.org/
> 
> e.g. something like this (one of):
> * https://patchwork.kernel.org/project/netdevbpf/patch/20250610233134.3588011-4-sean.anderson@linux.dev/ (v6)
> * https://patchwork.kernel.org/project/netdevbpf/patch/20250511201250.3789083-4-ansuelsmth@gmail.com/ (v4)
> * https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/
> 
> full usxgmii driver:
> https://patchwork.kernel.org/project/netdevbpf/patch/07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org/
> 
> first PCS-discussion is here:
> https://patchwork.kernel.org/project/netdevbpf/patch/8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org/
> some more here:
> https://lore.kernel.org/netdev/20250511201250.3789083-4-ansuelsmth@gmail.com/
> 
> and then dts nodes for sgmiisys+usxgmii+2g5 firmware
> 
> when above depencies are solved the mac1/2 can be enabled and 2.5G phy/SFP slots will work.
> 
> changes:
> v9:
> - dropped patches already applied (cci,gpio-leds,unused pins)
> - added patches to add RSS IRQs, IRQ-names and sram-node for mt7986
>    note: mt7981 does not have a ethernet node yet
> - set minItems for Filogic (MT798x) IRQs/Names to 8
>    needed to update MT7986 binding example because of this
> - add sram:false to non-Filogic SoCs
> 
> v8:
> - splitted binding into irq-count and irq-names and updated description
> - fixed typo in mt7621 section "interrupt-namess"
> - splitted binding changes into fixes (mac) and additions (sram)
> - dropped change of reg (simple count to description)
> - change ethernet register size to 0x40000
> 
> v7:
> - fixed rebasing error while splitting dt-binding patch
> 
> v6:
> binding:
> - split out the interrupt-names into separate patch
> - update irq(name) min count to 4
> - move interrupt-names up
> - add sram-property
> - drop second reg entry and minitems as there is only 1 item left
> 
> dts:
> - fix whitespace-errors for pdma irqs (spaces vs. tabs)
> - move sram from eth reg to own sram node (needs CONFIG_SRAM)
> 
> v5:
> - add reserved irqs and change names
> - update binding for 8 irqs with different names (rx,tx => fe1+fe2, rx-ringX => pdmaX)
>    (dropped Robs RB due to this change again, sorry)
> 
> v4:
>    net-binding:
>      - allow interrupt names and increase max interrupts to 6 because of RSS/LRO interrupts
>        (dropped Robs RB due to this change)
> 
>    dts-patches:
>    - add interrupts for RSS/LRO and interrupt-names for ethernet node
>    - eth-reg and clock whitespace-fix
>    - comment for fixed-link on gmac0
>    - drop phy-mode properties as suggested by andrew
>    - drop phy-connection-type on 2g5 board
>    - reorder some properties
>    - update 2g5 phy node
>      - unit-name dec instead of hex to match reg property
>      - move compatible before reg
>      - drop phy-mode
> 
> v3:
>    - dropped patches already applied (SPI+thermal)
>    - added soc specific cci compatible (new binding patch + changed dts)
>    - enable 2g5 phy because driver is now merged
>    - add patch for cleaning up unnecessary pins
>    - add patch for gpio-leds
>    - add patch for adding ethernet aliases
> 
> v2:
>    - change reg to list of items in eth binding
>    - changed mt7530 binding:
>      - unevaluatedProperties=false
>      - mediatek,pio subproperty
>      - from patternProperty to property
>    - board specific properties like led function and labels moved to bpi-r4 dtsi
> 
> Frank Wunderlich (13):
>    dt-bindings: net: mediatek,net: update mac subnode pattern for mt7988
>    dt-bindings: net: mediatek,net: allow up to 8 IRQs
>    dt-bindings: net: mediatek,net: allow irq names
>    dt-bindings: net: mediatek,net: add sram property
>    dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for
>      mt7988
>    dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
>    arm64: dts: mediatek: mt7986: add sram node
>    arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt
>      names
>    arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>    arm64: dts: mediatek: mt7988: add switch node
>    arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>    arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
>    arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
> 
>   .../bindings/net/dsa/mediatek,mt7530.yaml     |  24 +-
>   .../devicetree/bindings/net/mediatek,net.yaml |  64 +++-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  20 +-
>   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 ++++++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 285 +++++++++++++++++-
>   7 files changed, 497 insertions(+), 12 deletions(-)
> 


