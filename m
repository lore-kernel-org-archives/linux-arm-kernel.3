Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E2EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbQ9UdREJ/WWisdiQ1Got7ahhLovVEcdSUeHC5P/jK8=; b=SCorjAkJU0jv0rqG0pJjwSWWnv
	Xe0tUKGjVqkusPhyYRLRFkIF7oeIFUdLRoBXifSIGODYj9ahEb5Aq/n/+bvvyXo17w8shBbX43NkO
	2TEzeDsEmxTnOyNZrZ229tGqZ/62DkYt471BgvhbNEPSrBI7u1HZGnGz6jAAAAnGvEI1AqmfS/EDp
	3dZIzKeYlv7gCWzvBIGneGHrfRTtyqduYZxORsqAfNvFE683AN1Ctm8IqLmbG0+qgLuR/oVagnN+u
	bN6SJdaMibWMdiUSI/1OIZ3tUfdmcagYCIFZTBUErWuAqS0dS1Ta+wCPQQ/3UMwotLgHyuiSkZsZ8
	Bq5BGsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AD6-000000009Ut-3QVo;
	Thu, 03 Sep 2026 16:22:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AD4-000000009Th-2wMV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:22:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso787715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788452561; x=1789057361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbQ9UdREJ/WWisdiQ1Got7ahhLovVEcdSUeHC5P/jK8=;
        b=aHmgU2c5j1Q9sTLCAakWvYLHi/XL1hFWZLlpP/mccO9GU5c9j6AIbzfUhCCJCrOFCu
         Tr3vJUgPext0WwHauB+J5PEmefSPUkl+QZNK5qyPw3eRmN6h+FwfdJIfa525a43N3e9T
         R+rMpl4sboaLsvHphGnaNhSktmq6B+1aNKpPQET3UD6hePTC0YwXSjVcNjAmYWVrHBXo
         unVuK6TL5+n8IpIGsQU23p0KcOoBSIjH3WVIaMdKe9yRpFq3DL9+37p3gnfjsSNO3EOq
         kLlq3IbtNpSxTiof6wZszxUM/q7coXopdl75UU30kNgP1OZH2ICSXpzXsnB+sR+aG+Cp
         QzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452561; x=1789057361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbQ9UdREJ/WWisdiQ1Got7ahhLovVEcdSUeHC5P/jK8=;
        b=RpJkGF8gcjzTyq+EBrNU2anrfl9wqEEZqG0kPOLzawd3o1TDFnwgQVm9dAhOQV8/8O
         I1zXDYJpft632CtUMUIMoLgSDWYkm9rufhbXAXLjLwMC7ETjbyu1SLtlrJzwLpE+wuSf
         bPrqeOqvlWAC/fRa9aHzv41yh8h3Xjpr1Ul1z20BjYy2NnrTmbkSKt3EJmZyJu0DOa89
         CaFUr9JegmDybMEwVc2AEqzpVqyfyZxQc41fSzNJ0A0kT76+etjnpj7ZJb7UEtp+WHxO
         H5GpM2xIzpNqsC/foY/OMun65fLOSyuksY4p67jn4XgKsEt3rOrpTGLxfpbhDULksC6o
         yJ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7raSRMjKLIofdWlAWTmEL4lcfiV/qGHMxMNI3piJAxT5w2VeNtNM+oYmA7UVdVhYt249YNZUTUallhHmgYZaT@lists.infradead.org
X-Gm-Message-State: AFuF++kHq1Z+u/HXmtnHx3GeBFT/Ux9sUpb7InJTimiuH6N6u2Ixsx8P
	NsGPTSAM46xEHK5PoSM20hwj3waWd8VvZPJnrmz8dy+rFP8Vvdt+VQwQklDcSBfxZwo=
X-Gm-Gg: AYBFou0YOadayab55ZuK0/1aTIS0QU070f8yq7pspnXxziZmudLTx5UfKn1d+x1C/Ac
	+5h5u98OKcLD5XSJun7SR8XBjyY0enozOjXjRnoeOwqtYffCZpbpKp8N7wM1eNSkgAy0tqfP/65
	nN3iIBtaTp1PxF9euoMHE4UTQJ2bKpLgFmWA5sUfzNX5V6yw9w6+8wXgcRWLFP7YzV2MfATTWFK
	MjyVS84/LQgssv9+01yZilcG7NX11eXAsjvnjJZB6x7jJsBSiiwbUfm/W5tf/wAKYzIq8IXTYjz
	4cs3LbleVYnavTBOsWtSNw+OLMQBiKDL1LfHsf3mSK/aoIjVI9dnfeGCP+4uewRHzigMdiieSiF
	BSz6VZSlMLHRER5Zx9zViozYtFPzRdc8OU1YF+nqJTp9l2jIjjDqByodECcsiiSrego9Q9UxScv
	DE0yq3QEa3F5pUPbEK5rkp6kdI4lG2sidTkpqYo/IxDrmWFYlvOIw2QNcXVnPURoCOBbvF
X-Received: by 2002:a05:600c:5309:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf5bd3418mr25301905e9.10.1788452560717;
        Thu, 03 Sep 2026 09:22:40 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm110440525e9.4.2026.09.03.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:22:40 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 18:26:19 +0200
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <apmfqyeWahoR0wab@apocalypse>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
 <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_092242_757287_90BC9528 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Gregor,

On 18:04 Tue 11 Aug     , Gregor Herburger wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..81aec81c5ce12 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -69,6 +69,14 @@ usb_vbus_default_state: usb-vbus-default-state {
>  		groups = "vbus1";
>  	};
>  
> +	rp1_spi0_default_state: rp1-spi0-default-state {
> +		function = "spi0";
> +		groups = "spi0";
> +		bias-disable;
> +		drive-strength = <12>;
> +		slew-rate = <1>;
> +	};
> +
>  	rp1_i2c4_default_state: rp1-i2c4-default-state {
>  		function = "i2c4";
>  		groups = "i2c4_2";
> @@ -94,6 +102,14 @@ &rp1_i2c6 {
>  	pinctrl-names = "default";
>  };
>  
> +&rp1_spi0 {
> +	pinctrl-0 = <&rp1_spi0_default_state>;

Is there any reason to avoid defining the CS pins as pulled-up gpios
in the rp1_gpio node and then referencing it in pinctrl-0?
Something like thie following:

rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
	function = "gpio";
	pins = "gpio7", "gpio8";
	bias-pull-up;
};

&rp1_spi0 {
	...
	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
	...
};


Many thanks,
Andrea

> +	pinctrl-names = "default";
> +
> +	num-cs = <2>;
> +	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> +};
> +
>  &rp1_usb0 {
>  	pinctrl-0 = <&usb_vbus_default_state>;
>  	pinctrl-names = "default";
> 
> -- 
> 2.47.3
> 

