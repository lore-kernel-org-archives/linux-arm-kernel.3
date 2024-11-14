Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2FD41D46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TykqvJZu7oobTkYrqspWrFCa8xwHBaWMCZeSIBVlCZw=; b=EgtRKLORpQ6I9iB+h4yBpq9g6m
	Tj42DrG714l6rNayVzuDV21LvVZfaHm8gbDL6Z//uSttHA4UkEKUsLSv9U3/eMJYIoyZYz/KFX5yZ
	UzX6ZDMRCtejxDKJp2btH6t2gTaqLMKNqyd1u5rMHD7qJit9M8FOodoctjqtLAF/0INC3EBOS/kXV
	nGg7L/AF/yW6lHKEAbCpWdk19SoP5A3xU/5vZnmEaYrxlMY9N9bvg30XtYV/CpREtbVcmgcAc3u+9
	V1dbTi2c7BLYmqMN4duJwTnirpkWYAWZl8wneqE2lLCmDGwIzpvTm8d35IyoA7hBEQ3UC/pii/BFO
	iI9e75tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYYm-00000009q22-3PhV;
	Thu, 14 Nov 2024 12:02:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYRU-00000009nn5-1ddb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 11:55:23 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so37009566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 03:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731585318; x=1732190118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TykqvJZu7oobTkYrqspWrFCa8xwHBaWMCZeSIBVlCZw=;
        b=YhsSygB8KF4cCsLTDa3/cVWjXUxmziSKkyCN7EsFhRc2XOY+5zZmM80VdjSt4YeR49
         pT3FKkJ6r0SG5NPvGV7e+ks6BAMb3CYbYzrg1DC8iEW8PJjD79bDR3Y6gm/NMAVtG5Kh
         lxEA0JbbWW+m51SFMKtUKG1/gFBApbiTgnU1rP24bS3jsoJpHJYBtfrzonKoDhwyyJgQ
         NrmoptopdjFN7kRNmo0e9ftiEzE4irP5+KnmQdfu00wU4ZXSEMM8nesQC3CEpRseZMq5
         OkZR8J9gstFBXyS95quvEkvtDHX7jG5ALnjmsGlSStsuZU3X27ptR+2Y0RRrHdhFHodO
         /CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731585318; x=1732190118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TykqvJZu7oobTkYrqspWrFCa8xwHBaWMCZeSIBVlCZw=;
        b=vhtYO0D+NAZM2LaqFSeNzyCtRRLl5rSd8wekpb5zk21ZTIlxMWi3XBx052TGlMAyDY
         yrG++4a5AXGwie7MAfEyYkf222F+aWqD32UjXyjJGMAUSA7JlJmtNkkV3kcdZ4qIHeiV
         /kNNMBdg5TMXtqcJ0zxSnM6BgOhB1uPl44RP/3e5asC2RjugCBZeqCgzXDTN53pMiwkD
         Cu4/A12MNn5vaclsdRZpqQcNTAD8cezz6spNxjp7CTiqHxtH/kTeOMAcvALC9xQ37oqC
         RXxuosjgQMCHwFmgwQIoItc+LLPX9oJaoMCJU6Xy8gzyJ+8Ne+53kCpTuVYDfBRhxUIs
         ypIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/p01MFAfpRcZCWFtUgG2XIYMIpOHVZygDUnNIm25E8iisOCrDM3lNRCFu2c3LKO6hALsLMcOYMK8Tk640zQdU@lists.infradead.org
X-Gm-Message-State: AOJu0YzwD7FI3/6MzqXlv1Y4iQEsV6a57AsRjFu2whbsRVbWHY6EiOAA
	xW5NFsfEVj9jiiMud4pbcVgjxZursCpVKpWhEdAZbTYER0usIyTCNnx3c7lp2n4=
X-Google-Smtp-Source: AGHT+IE/1TBRDr0zrGfCx62LhZdMXdC4i7gKZ6O1OikOKLIOjOf9iNHmbMOKdG/5UJAwkvlasJ5yig==
X-Received: by 2002:a05:6402:1cc1:b0:5ce:fa33:6c9f with SMTP id 4fb4d7f45d1cf-5cf77ecc8d2mr1814721a12.27.1731585317798;
        Thu, 14 Nov 2024 03:55:17 -0800 (PST)
Received: from [192.168.3.32] (cpe-188-129-45-253.dynamic.amis.hr. [188.129.45.253])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79b8a6f7sm495171a12.18.2024.11.14.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 03:55:17 -0800 (PST)
Message-ID: <296336ea-9181-4c85-92d4-4cee1866822e@sartura.hr>
Date: Thu, 14 Nov 2024 12:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/8] net: lan969x: add RGMII support
To: Daniel Machon <daniel.machon@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_035520_506633_F27A65B8 
X-CRM114-Status: GOOD (  24.58  )
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


On 13. 11. 2024. 22:11, Daniel Machon wrote:
> == Description:
>
> This series is the fourth of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
>
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
>
>          1) Prepare the Sparx5 driver for lan969x (merged)
>
>          2) Add support for lan969x (same basic features as Sparx5
>             provides excl. FDMA and VCAP, merged).
>
>          3) Add lan969x VCAP functionality (merged).
>
>      --> 4) Add RGMII support.
>
>          5) Add FDMA support.
>
> == RGMII support:
>
> The lan969x switch device includes two RGMII interfaces (port 28 and 29)
> supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.
>
> Details are in the commit description of the patches.
>
> == Patch breakdown:
>
> Patch #1 does some preparation work.
>
> Patch #2 adds new function: is_port_rgmii() to the match data ops.
>
> Patch #3 uses the is_port_rgmii() in a number of places.
>
> Patch #4 uses the phy_interface_mode_is_rgmii() in a number of places.
>
> Patch #5 adds checks for RGMII PHY modes in sparx5_verify_speeds().
>
> Patch #6 adds registers required to configure RGMII.
>
> Patch #7 adds RGMII implementation.
>
> Patch #8 document RGMII delays.
>
> To: UNGLinuxDriver@microchip.com
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Lars Povlsen <lars.povlsen@microchip.com>
> To: Steen Hegelund <Steen.Hegelund@microchip.com>
> To: Horatiu Vultur <horatiu.vultur@microchip.com>
> To: Russell King <linux@armlinux.org.uk>
> To: jacob.e.keller@intel.com
> To: robh@kernel.org
> To: krzk+dt@kernel.org
> To: conor+dt@kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Tested-by: Robert Marko <robert.marko@sartura.hr>

> ---
> Changes in v2:
>
>    Most changes are in patch #7. RGMII implementation has been moved to
>    it's own file lan969x_rgmii.c.
>
>    Details:
>
>      - Use ETH_P_8021Q and ETH_P_8021AD instead of the Sparx5 provided
>        equivalents (patch #7).
>      - Configure MAC delays through "{rx,tx}-internal-delay-ps"
>        properties (patch #7).
>      - Add selectors for all the phase shifts that the hardware supports
>        (instead of only 2.0 ns, patch #7).
>      - Add selectors for all the port speeds (instead of only 1000 mbps.)
>      - Document RGMII delays in dt-bindings.
>
>    - Link to v1: https://lore.kernel.org/r/20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com
>
> ---
> Daniel Machon (8):
>        net: sparx5: do some preparation work
>        net: sparx5: add function for RGMII port check
>        net: sparx5: use is_port_rgmii() throughout
>        net: sparx5: use phy_interface_mode_is_rgmii()
>        net: sparx5: verify RGMII speeds
>        net: lan969x: add RGMII registers
>        net: lan969x: add RGMII implementation
>        dt-bindings: net: sparx5: document RGMII MAC delays
>
>   .../bindings/net/microchip,sparx5-switch.yaml      |  20 ++
>   drivers/net/ethernet/microchip/lan969x/Makefile    |   2 +-
>   drivers/net/ethernet/microchip/lan969x/lan969x.c   |   5 +
>   drivers/net/ethernet/microchip/lan969x/lan969x.h   |  10 +
>   .../net/ethernet/microchip/lan969x/lan969x_rgmii.c | 237 +++++++++++++++++++++
>   .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 ++-
>   .../net/ethernet/microchip/sparx5/sparx5_main.h    |   3 +
>   .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++
>   .../net/ethernet/microchip/sparx5/sparx5_phylink.c |   3 +
>   .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 +++--
>   .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
>   11 files changed, 488 insertions(+), 28 deletions(-)
> ---
> base-commit: 12079a59ce52e72a342c49cfacf0281213fd6f32
> change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a
>
> Best regards,

