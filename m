Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C89C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 23:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7uD5qXzvc6aMulN+BeaNa7iatoiX4T3pgrjFm94VSk=; b=BW9xCb5on+7yb6ZMjPIt09p0fO
	Iu2Y+/H17hCG7IIvuZKH462Cva6mZ5M0zthiFj02kWqzqHquV3qGLj7wWaNTCRe75d3WA7lN3kt9w
	+haWMJIarOKtt7ooobLiJqJ6eR4JJmNvJW3xAiCy8WNztuS5Epw3059r1IwDIZtA9AsSW3pjfkjsL
	PzsUM/uS41S9j0iCzGk4hnHKhtlyIyPR2VTl8drAHCHDbTr/j6fl35rZp1QBdwYDwwVuqUf5gGgHM
	pT2gbooFYBA9/esQYg++fs6TnpMvZ14e2AhNb/DdodU+7TRPEUWTjnLaoZ3YRparzoqgu9JJnw0qv
	wq0Ts7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70L5-00000005OiR-26X4;
	Mon, 21 Apr 2025 23:14:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70JD-00000005Odi-20Z0;
	Mon, 21 Apr 2025 23:12:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223fb0f619dso50605275ad.1;
        Mon, 21 Apr 2025 16:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745277134; x=1745881934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7uD5qXzvc6aMulN+BeaNa7iatoiX4T3pgrjFm94VSk=;
        b=ONdZsEfVX8cpelRLo8IxvNf1L9v4LrX0N9X0U2BKMdW+jDAMqjY1NzxWIrVRI3OHks
         oqk4zXtRCgeSS7U4/k+/o3Ck3xYoPHEcWnMOEuPcqy1tTNBt9Sl4WqLIDiJXPIV337XP
         vgESHNYcCYaB/4gKbMNUDsxvEjgao2JP9lRBvxoVTXH043WdodwijPUwPwLxyqO6avAf
         sj4kXta1dubbwT+hoQzAoEliGcQia5I5sP/isUeLlbHtxw08Jek/50laJIcJXwdisBHI
         5AaqfypBM5SJRK1fBfhX6IudVB3fvufW46j7jESCajWvTOzf1kjJw5MEO5D92LpUafh7
         YyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745277134; x=1745881934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7uD5qXzvc6aMulN+BeaNa7iatoiX4T3pgrjFm94VSk=;
        b=UcpWn5JhbwCTduookI9FQDQftOlneFMpo89/fGUP3sC0xxU/vkK/Q2Deh50h3igcdo
         2u4wFW5kAkRZ9uDcc7R5BcwHJRKKcyGLZMujSFBP7oxnQCfyRn+PcKnoJwsMifQxtO5K
         WZyMjgbqX5WmGj2+No68zh8TX52w3CTq3ipBeL/c4c8Tn+fONUGKpJtYr29AhNJGQ+vH
         YzTGL+ybExr+8LyP3JDB822C29q6IpRJDHrSlb14u2UQeEttCDCKJaIpPs6MV0JcumJf
         xxRtfiKxIa0jN8IJJBDKUjtspDbomwS1B1ZECy5mjmXbxmlkrT7cwJbP3YpV7NDQob8f
         wU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaclnnz7u6MpPjaOZfx/6UwonnJIK0srWpAvh8I1D0rjlzfgoYhCMCMkE5Ke62fpDVukCs62QiAAmhxVUZyOA=@lists.infradead.org, AJvYcCW3LIl9GsKyywN89GtMzXXs21gh9fIz/RqBuMDpTPc04D8nTURNJEMJvFrEZUGQhFkTxAZIUP0r2Q2gdBm9RVnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzXiAdoefItZV8AKXP/MTeH0+WgsRijRu9tEfDVwm7jN4yW9ljF
	sFMJLIbwI3wUBUKPIDnEBYyc4euS/WvHmmNbllA1y1xY92j7ceEz
X-Gm-Gg: ASbGncucSxlw3xc6s3yw8BjgxKRdU+dJbEyAsfLhoW6wKaN0Q9bIhHvmlG8M86X1AwQ
	Ij5XbrBHvpCxcJYJwpv86JQ+Sl7ev5VcXHYio606RRRvS9/beBMknKLN/atpg6H7KQn7VXccouK
	2OI5Z1bmIiw4pK2XIEwYCLvVr3NwP56LV9mh+yOH822sGUZ1Vw0pl1gHhcEC6oyrUsx1hNszIvE
	b9Q0K8Q3G/JU3H1WTih95TiF6qcqADy3L+tgoNQzvKUQpfs7kkbFjV9nRQur+XuEghJbyuRt/hb
	/uQ+SryKLyr4p9Bhf3NsGPl+vjla7yy44QGqcex4aiE2pmf6ZGau/g==
X-Google-Smtp-Source: AGHT+IHT5fKKS1SMCd+Tj+8NxbOpVvUcbxkPakCnNVQ1oPl2cEDp8mNkaefvPYVXcT9AzKeGfB9Oyg==
X-Received: by 2002:a17:902:f706:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22c5356dfbbmr179816285ad.3.1745277134121;
        Mon, 21 Apr 2025 16:12:14 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:4561:1890:fe60:cec1? ([2a02:8010:6606:0:4561:1890:fe60:cec1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm70766835ad.166.2025.04.21.16.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 16:12:13 -0700 (PDT)
Message-ID: <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
Date: Tue, 22 Apr 2025 00:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port
 functionality
Content-Language: en-GB
To: John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Marcin Juszkiewicz <mjuszkiewicz@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20250419023715.16811-1-inindev@gmail.com>
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20250419023715.16811-1-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_161215_526835_D478CFE4 
X-CRM114-Status: GOOD (  23.85  )
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

Hi John,

On 19/04/2025 03:37, John Clark wrote:
> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
> regulator disabled, gpio-58 out lo) due to misconfiguration. The
> original setup with regulator-always-on and regulator-boot-on forced
> the port on, masking the issue, but removing these properties revealed
> that the fusb302 driver was not enabling the regulator dynamically.
> 
> Changes:
> - Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
>   and vbus5v0_usb to allow driver control.
> - Changed power-role from "source" to "dual" in the usb-c-connector
>   to support OTG functionality.
> - Add pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>; to the FUSB302MPX node
>   to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
>   ensuring the driver correctly advertises PD capabilities and
>   negotiates power roles (source/sink) per the FUSB302MPX’s supported
>   PD protocol.
> - Added op-sink-microwatt and sink-pdos for proper sink mode
>   configuration (1w min, 15w max).
> - Add typec-power-opmode = "3.0A"; to enable 3.0A (15W) fallback for
>   non-PD USB-C devices with the FUSB302MPX.
> - Set try-power-role to "source" to prioritize VBUS enablement.
> - Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
>   usb-role-switch for dual-role support.
> 
> Testing:
> - Verified VBUS (5V) delivery to a sink device (USB thumb drive).
> - Confirmed USB host mode with lsusb detecting connected devices.
> - Validated USB device mode with adb devices when connected to a PC.
> - Tested dual-role (OTG) functionality with try-power-role set to
>   "source" and "sink"; "source" prioritizes faster VBUS activation.
> - Validated functionality with a mobile device, including USB Power
>   Delivery, file transfer, USB tethering, MIDI, and image transfer.
> - Tested USB-C Ethernet adapter compatibility, ensuring proper
>   operation in host mode.
> - Tested USB-C hub compatibility, ensuring proper operation in host mode.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index cecfb788bf9e..8f2bd30786d9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&typec5v_pwren>;
> -		regulator-always-on;
> -		regulator-boot-on;
>  		regulator-name = "vbus5v0_typec";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> @@ -188,8 +186,6 @@ vbus5v0_usb: regulator-vbus5v0-usb {
>  		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb5v_pwren>;
> -		regulator-always-on;
> -		regulator-boot-on;
>  		regulator-name = "vbus5v0_usb";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> @@ -465,24 +461,30 @@ regulator-state-mem {
>  };
>  
>  &i2c6 {
> -	clock-frequency = <200000>;
>  	status = "okay";
>  
> -	fusb302: typec-portc@22 {
> +	usbc0: usb-typec@22 {
>  		compatible = "fcs,fusb302";
>  		reg = <0x22>;
>  		interrupt-parent = <&gpio0>;
>  		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-0 = <&usbc0_int>;
>  		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
>  		vbus-supply = <&vbus5v0_typec>;
> +		status = "okay";
>  
>  		connector {
>  			compatible = "usb-c-connector";
>  			data-role = "dual";
>  			label = "USB-C";
> -			power-role = "source";
> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
> +			power-role = "dual";
> +			op-sink-microwatt = <1000000>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "source";
> +			typec-power-opmode = "3.0A";

According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
port maximum output is 5V/2A. So I think "1.5A" would be a better value here.

[1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6

>  
>  			ports {
>  				#address-cells = <1>;
> @@ -1135,9 +1137,8 @@ &usb_host0_ohci {
>  };
>  
>  &usb_host0_xhci {
> -	dr_mode = "host";
> -	status = "okay";
>  	usb-role-switch;
> +	status = "okay";
>  
>  	port {
>  		usb_host0_xhci_drd_sw: endpoint {

br, Hugh

