Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11061CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv7IaACCUzIWH4jmcnmsJlWAx3z3kfU+CsmKqPSjqn0=; b=C1c//Btx7bFJ4MC/Krpr3nmP/K
	nmbdIocvvO0cbfNWR0ItprGnTg1E8QwLbfstKoRaI4ycIMs+QrrZdM0XbHDdKmHqqo+mPl7DSVDRG
	J4ZJbLz6LoZ1M+t+Qvr8EiDjQd6Y1nn7RsDsYglAXY2inLXH4ia5+gEjXm6VW7aOX5a223Vy/2o7x
	NWgtudb0TRo9tcX0OAoC9cNA7lavMmS4vNAfoje8Z4WJKeY/IbIIBDsbZQwqvqMMScazCqod7P9Ql
	pGoARSHL+nRKqhutPC+41S97D1b35Sia8PAJz/8jCUdeoPfSgHKfG7/QGYz7D+XfkNRDCQkFxat2t
	5iQU8CNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUcj-0000000CycN-2PPI;
	Wed, 05 Nov 2025 03:55:53 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUcg-0000000Cybb-1dnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 03:55:51 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c28c21aba1so3869224a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 19:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762314947; x=1762919747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wv7IaACCUzIWH4jmcnmsJlWAx3z3kfU+CsmKqPSjqn0=;
        b=h9h3Z5Sl89b3le6Rlbc0qVgriaLZffJbAW7/FeHb2W8DoJM7LRWEVxXbyIzCH2b2rC
         rzF5UgtCAhNHR3bYPPR8iefqAwznNS4MrK6vInk521HsdK9gscEgwK/RQgl0Dg0mtYv2
         P453C612DWX3S1LslRoHQEE1q1J90o1eFpOOkVNi6ZwP/Bn/t3kO8ZpRLV4+i0MV01it
         K5vUTJuBEAG/isB81zx4hutgNi7bAb6FaKUT+EdUnsASP8bMrfao0n3j0Wpd3/pL/N2F
         WgkJTSkTsMopcsITyRXLffF+y7rm50jqron+wKOu9rtcz2ycl0Rf4lQdrps0BWzsj9hU
         z7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762314947; x=1762919747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv7IaACCUzIWH4jmcnmsJlWAx3z3kfU+CsmKqPSjqn0=;
        b=EOqHvMfmUXLrOFFUCqXj9GnKDmrjJUQtVKylY77g8Ngeu4IFJtJr35iWzMuRybFS4S
         b/fUNj1t8Ag7kSzTCLpNx8AYpHv56X8ZdTzqdJDII6VSX7jW+FuBLvrrApWMkaW06p1K
         qh5lTLPlCoMLjIYlWQyvXgLSe757OMb5JQKJkGpewnXGGiHFKCNpRWB9tvVxskXV2FTi
         oFPn5nHnpp/hnEb7no6+4TuLrELD2yBYxk3LXGXnZvOap7Fe75s6SKNaR/Izwwj833Nk
         LX9gpXOYFzxO7kbKaWeN7/N6fVjrqcSfhmu0mmREeNhefdM3eEW7NcEC2LZABRdIXuQW
         WXrg==
X-Forwarded-Encrypted: i=1; AJvYcCVnmN1MAlGsbfju8xoUTaFevDzanE8DLh7wOtj6Inhg1iIXAsXOT50Woy4AO2iWBBFPYyBRg8u+QysbBybSUQdC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qvkhwUoPLN29MvDhfBN+hcyirLIbw5pkZbySpOu9he9A/BYU
	dDITK+vDRhYAyAWhd//TqFM14PWg8inQj5oeR4S5ecntkaIXUKxhn2AM
X-Gm-Gg: ASbGncuNJitDDeJpWWddvJFb8t9t0qPYH+BaXTvFyPyXApEVSIDWo7cL3CLhc7F31Av
	bu5Yl/+aIX0VjnN5rPExDJ2Me1HGtRNB2ZeymDl0o7OpD9ETOFJqTUqprg4Sp+qCKnpX6ilgEQy
	8dt4iGcFCPbZ4XcdUMndM2s09ctX+B222WYBQOVFweQ6/roUDJJvTb/VxZXqBhkjQqvkFcPMSo4
	J8YfSc4Yy9L/zc+OMmFKTs3W15RRd6nFjc0Ra+WtvyVXtWOcLtZPdhI7j53vSt2XziK0PDNR6QD
	f1dCSOs3s6ZeU8fyuEebanfmb85KC45GDHvKhJZCluYt6LYgKY0CP9Or6XMcguCa3Jz7daykD7k
	gkBvTUL7OE5H8jVLUlElm2nxQhzyu2Kd+aOKm3me89iQAE2CZDZvf+Wp90ps/mww=
X-Google-Smtp-Source: AGHT+IGWD1WRog8lycQihpGXGLWzNtQQjp25qDmoblZFd4CJMmxeCSVNZEnsc+5uJPofTa4YPXd5Fg==
X-Received: by 2002:a05:6830:91a:b0:7af:1d61:1055 with SMTP id 46e09a7af769-7c6d13e115amr1105444a34.21.1762314946928;
        Tue, 04 Nov 2025 19:55:46 -0800 (PST)
Received: from geday ([2804:7f2:800b:2c34::dead:c001])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6c246fb2fsm1599542a34.13.2025.11.04.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 19:55:45 -0800 (PST)
Date: Wed, 5 Nov 2025 00:55:32 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <aQrKtFT0ldc70gKj@geday>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
 <20251103181038.GA1814635@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103181038.GA1814635@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_195550_478783_BAA9FEF1 
X-CRM114-Status: GOOD (  25.66  )
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

On Mon, Nov 03, 2025 at 12:10:38PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 03, 2025 at 03:27:25AM -0300, Geraldo Nascimento wrote:
> > With this change PCIe will complete link-training with a known quirky
> > device - Samsung OEM PM981a SSD. This is completely against the PCIe
> > spec and yet it works as long as the power regulator for 3v3 PCIe
> > power is not defined as always-on or boot-on.
> 
> What is against the spec?  In what way is this SSD "known quirky"?  Is
> there a published erratum for it?
> 
> Removing this delay might make this SSD work, but if this delay is
> required per PCIe spec, how can we be confident that other devices
> will still work?
> 
> Reports of devices that still work is not really enough to move this
> from the "hack that makes one device work" column to the "safe and
> effective for all devices" column.
> 
> It's easy to see how *lack* of a delay can break something, but much
> harder to imagine how *removing* a delay can make something work.
> Devices must be able to tolerate pretty much arbitrary delays.

Hi Bjorn!

I did some more testing, intrigued by why would a delay of more than
5 ms after the enablement of the power rails trigger failure in
initial link-training.

Something in my intuition kept telling me this was PERST# related,
and so I followed that rabbit-hole.

It seems the following change will allow the SSD to work with the
Rockchip-IP PCIe core without any other changes. So it is purely
a DT change and we are able to keep the mandatory 100ms delay
after driving PERST# low, as well as the always-on/boot-on
properties of the 3v3 power regulator.

This time everything is within the PCIe spec AFAICT, PERST# indeed
is an Open Drain signal, and indeed it does requires pull-up resistor
to maintain the drive after driving it high.

I'm still testing the overall stability of this, let's hope for the
best!

Thanks,
Geraldo Nascimento

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index aa70776e898a..1c5afc0413bc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -383,13 +383,14 @@ &pcie_phy {
 };
 
 &pcie0 {
-	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	num-lanes = <4>;
-	pinctrl-0 = <&pcie_clkreqnb_cpm>;
+	pinctrl-0 = <&pcie_clkreqnb_cpm>, <&pcie_perst>;
 	pinctrl-names = "default";
 	vpcie0v9-supply = <&vcca_0v9>;	/* VCC_0V9_S0 */
 	vpcie1v8-supply = <&vcca_1v8>;	/* VCC_1V8_S0 */
 	vpcie3v3-supply = <&vcc3v3_pcie>;
+	max-link-speed = <2>;
 	status = "okay";
 };
 
@@ -408,6 +409,10 @@ pcie {
 		pcie_pwr: pcie-pwr {
 			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
+		pcie_perst: pcie-perst {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
 	};
 
 	pmic {

