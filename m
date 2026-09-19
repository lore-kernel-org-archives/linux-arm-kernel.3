Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF7C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=; b=aE5v1yD++PRZ8Nj2aIktqA2nWt
	rmfosUHAC/KXW5rNf4PyOLNXjd7B8U5aJ9OLtLQKyrkI+89+cgLyQ9bHWxNe5WB6KqG98s82Clqdv
	MsyAsktuZ9qs5euI6+SjQmnm5wO+br0lEdarpQX6sYI/Pg6t0hGKWgcec9ccdBOpnYP5+edskc6S1
	YxzkOVUSvSfHyaat26KgYF7QMR9a0wVuuljnbzji8dLuq3yMq43kU4JRj4dKCZp/eRdTWkennUzVr
	2CH4OOTJPH2o69Y7E7Gm16aXC2GUH0mmqTYFmMZtfoiCxX+XCLFkMw9sXDF6iRzLQKFgoBI2epiUG
	eBegcqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nxF-0000000FyHe-1L9R;
	Sat, 19 Sep 2026 05:49:41 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nxC-0000000FyGs-0lzS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 05:49:39 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1400536a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796977; x=1790401777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=NseFanHp/cpwJ2a7+A7lqaBIhYbyitqds9i/7+0yziUMwbWF3eqC0k4DejJC7qiNAc
         UQvRCeAPFtxmr5nnMU2TksE8m6VEbeXZFt2Jlx7LCjd0e1Yb0pR/euxIAhan+L+wiHCO
         RD4lhRgfeBhrDH1iwLyoyATGWlvaszdzTGYaML5pw8rdUf842j2Z9Sr/Y63m2ya3CV2Z
         arirflcx/r1wLLjNrfRMLXGYYpWO0RLmCoSbVrEcio5eni2awoIr29J5fN4WtEHB/rgN
         EadQuE2kuzo+UF1vX9IkAxjRJNTsVe72S0sycsfCSetuq1N+BC1qgL0pB0ZxAUbrOFnD
         igaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796977; x=1790401777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=kIC43vRklxQRFQIepYIlb4DFNll+yS0/A6UlBNv4r2quocu2ds27Ui5fu4Ga/86leT
         j/R8Q5uJDlTKFSyaOU96JGRtuls0jXpmIIGxmtR9Cb/iZ7qqrFN6Sqx4nE14Sh6mI6Kv
         BekgJ3g9z32t8Um0/ykrLg9B4Dv0NbBgU4kfxJsCdaunqPKFNKKqb1Ug5e0cYnVwI7ck
         J9wy8zOwoqjqrL11CIpd7enJkygSirG3ko1+JwaDB0flsFNy0bkXjIQcdA9njYN8IzJ5
         I5B3YtmJbDUMX/T5UNZr7sbqaSWsKUqlOmORyqb8KLP0R6aKARgKnrSWcg3iivr/KCPk
         s9kA==
X-Forwarded-Encrypted: i=1; AKwUvBxEaAfFaQ+So9iLdNNRz9V9k4Z0UrPrClLvMvR7+N5m13Skexu+pZWY9o+OToulp5SryIB4bzrK1k/q68vDtMY4@lists.infradead.org
X-Gm-Message-State: AFuF++ly/r3Pz9cHaBxLJUKoyvcOznmEWREW18eSmL6Di24EnvJD7bNR
	FLHoWuPTqIa9W31kNJog7O8Fg4pUEOap1Lji1Vx5R5nKu/liQ+u0K+WY
X-Gm-Gg: AYBFou2Z6LQ9Fgjl9Cnc3bCO3RFZIgT3ZMk4ZcKnjRtUvbHeLanK9ZkT7q5Z8omU/sw
	2coIJKa/xAsADNqejFnVTUUCkMJUOF8QNmxDWXPjO4tmKYRxpHmWnn3yv1U4uYYhftZwJjonnYz
	sQOgCTD9yMmleVMbue8U9N84jliVsoClGqxDX2QxcOXr+7pwqcjwApr8OUa7JB2kg5Tum2C/oqN
	zuOTu3BEelYQ0bmYjIJE9TfJBXAg5b6aeQGTpjDWjp10tXntVv3OXVEjkOsx+Igu1BrWGWsIobf
	1n0TZC63GGzPgatCiqVtK9FjkD5PptY2hdkF3Wb9qgchs7R+8Frz1rbAiVZrMeMw4n9xtcmIst0
	BNtn1ZY4zh6jEaLz1tc+7TGVjwcUaqGA8+9PCqgV49LLYm6hcAc6RyrM2wUYyEkJ24X9RntCHZk
	An8qNHcvfTZz4OkQ5U0XlpTNy8LOPCwwUSwz68PBP4H5lpv17xVg2CnkeCIQAzCTTShGabO6Ul/
	qfbu8J4g0Z63FWVr4GBWSAtHrrU58JMj4e5HHhFfcjR/Zy9zK+VAp0=
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr15914399a91.12.1789796977038;
        Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm2791939a91.17.2026.09.18.22.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 22:49:36 -0700 (PDT)
Message-ID: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Date: Sat, 19 Sep 2026 13:49:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260914031859.385224-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_224938_253624_B4D9AD89 
X-CRM114-Status: GOOD (  16.47  )
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

> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>
>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>
>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>
> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>   3 files changed, 137 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> index 78534d613486..0a068abda6e0 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>                          power-source = <1>;
>                  };
>          };
> +
> +       hsusb {
> +               pinctrl_hsusb: hsusb-pins {
> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
> +                                      <11 12 9>, /* PWREN */
> +                                      <11 13 9>; /* OVC */
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
>   };
>

The outer pinctrl group node name does not match the MA35D1 pinctrl 
binding. dt-validate reports:

   'hsusb' does not match any of the regexes: '-grp$',
   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'

Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
ma35d1-som-256m.dts.

I tested this change locally. Both affected DTBs build and validate 
cleanly after the rename.


Best regards,
Jacky Huang


