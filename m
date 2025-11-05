Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0C1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+akL+KyD042Z4LrBke1JL7l0fksnlBHxMHBzPhw6II=; b=T3Ei9wtlhvT5KN0eDx9f/R1csq
	2yrb0ij0hOLv8Gi0G1XfkpV+nn5kKxy8DgfatqtJ+pjAWQVzMMNoHctMT3jxwL/xKWa3Rq2D2RdsR
	pPrbhYCiBzqI+Zu0HAy6x2VI5WKcSbllW5oFpbAEFQ4wqh8uzICQ7hdd8VnQMHRYHsufTxoT9Yo5H
	q1wJA6E+uS0tpJNU3mc1pbhqJIQudTu0ZJgQwb5xJ1Q0zm40YCr4RO3KY5zgAMLLhlKFaCEHVlrH/
	inlf37dpsw/UHvD9oSYQe7aphbRvjSFCTCEx0pj2frAzKBLf7faRS6tqKQ19D5ghcXryYC9xq8HeL
	VDm7tqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYjG-0000000DGe3-1XSM;
	Wed, 05 Nov 2025 08:18:54 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYjC-0000000DGcd-2c8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:18:52 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7c52ce8cbe7so4773888a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762330729; x=1762935529; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+akL+KyD042Z4LrBke1JL7l0fksnlBHxMHBzPhw6II=;
        b=U36HaWg+KVEbpbOzMopqk7M7o6BL4R9vsICEzAwW5ydx9zGVsgOKeZPvzYsINU4qtZ
         vS/Qahz58KxVoXgzMV5nZFMF4qAD+psiVwJC7LZqJD2kXVJD1Lq0MRxwxPNO0NBQsTDE
         rDY1hunL49X8n0BVZFgXBMUBFwFMqSkOuFvDe8WvdaThSAjzqEtUZBmea3OkUCi01n4V
         ckkclSs1PUxDm7/mmUeRwfMaFxtLktUoECGDdFprbwGQ4KsVItuUAgIBOPKB8xlgnl43
         axJwwz4WT4pT1jNsLJ1Ktx4SZUwAcL5KvLPNIYgt7Rm2eI3ANaPkrf+Z0RmnBYeSNfly
         jSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762330729; x=1762935529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+akL+KyD042Z4LrBke1JL7l0fksnlBHxMHBzPhw6II=;
        b=Px6MPGvUuQa+57jwfo70nE5CXlxUdHzO0Gu6X/RXwb2Aa/K1y8ZQb2wMmziJo+h2ix
         PMBNMsDqI5gekSmpm7dN2PjIj5HLUgIfQCMYJSwCEZIFWmBtIfQc1AMakQ8w7konBN3X
         kLqImuAN53bk2bYlSK/q532wPW3vDLDsz14lA7MuxE2ckmtlXs70ZnwPzLu4IyEgClLz
         KAYWaVDQsrUYGb6I6b7419CGKlbMWV96jYoYpvnar6roAvQ9nrFfZ5COV6MhOeW8xWm0
         eVb2RVVasfCZ9Ajosc/YAGXFMJsN5Py9aejLjVXp/Y76Tt16YCA8sf1+dVwNunJiCMlm
         Gd3A==
X-Forwarded-Encrypted: i=1; AJvYcCXqR/2TCimgAxQsPBdNB9jn1JctlIVbn0gdi9aQjnf4vLaiXeG7o2PMDwnXmvZkscLsiIKunqMVw3ltkbRcAJAg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7a0XYSBembrcZl/XlPSlPcFAkU33/d2mOdIWtmGnzcIDeF48M
	ovFvrondvm90hsYJN5HcwnijXxOYCc/pVS6n6s5/smo167v4uO1Ech93
X-Gm-Gg: ASbGnctglWFudlE0tQ9MJD9w+g/oUckRsDAldM4k8TwDGvaGO5eiuiXt/4hsy89IYTB
	D9hWdHQPO4UZDuknJPLNjXllejfEjOtG7F7iucZX33Tr1rGPegzxnEZmJ8yJBsur0kZcegdFvhA
	D9ywRTyd1KMAult0K8dm+B2ukVwuaR6yTUefFBaPgIRwzPOcdWFUmxr6Vcvdi6ONrYPLHl/B1Kt
	KiFJOgSi+2yldt95WGBi7n8HPbnU2fDPeLYnl5kp3jajuUQYwsFTZ/0wFBtJ7lG+M+VC03/8ocv
	qtHI0qHUfR5sH2uKWs5A2qme6QztmqrwXAYOTWiXt5fvZN50fexOAo3SsdKWJOn4fhMdwE7JQv0
	eMsz3eQMPjs/hGiprNjS4kTm0f3Cm+fVG0TMiT1Rgz97m55cBrzycIPUj04TO0VcSakWM4qods/
	g4r+M/ZHJx
X-Google-Smtp-Source: AGHT+IFK0yDdBhfOz1NBWCKz0vAwOt4g+DxeXHtu06KoBEwHDsyVZU+NDbMVBjZzuCxM5y2NLKriXQ==
X-Received: by 2002:a05:6830:2650:b0:7c2:7b5e:8cb3 with SMTP id 46e09a7af769-7c6d141da8dmr1565084a34.31.1762330729550;
        Wed, 05 Nov 2025 00:18:49 -0800 (PST)
Received: from geday ([2804:7f2:800b:2ea1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6c2448c76sm1804557a34.2.2025.11.05.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:18:47 -0800 (PST)
Date: Wed, 5 Nov 2025 05:18:37 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aQsIXcQzeYop6a0B@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_001850_680619_A71CADE2 
X-CRM114-Status: GOOD (  34.65  )
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

On Wed, Nov 05, 2025 at 02:35:28PM +0800, Shawn Lin wrote:
> Hi Geraldo,
> 
> 在 2025/11/05 星期三 13:55, Geraldo Nascimento 写道:
> > The PERST# side-band signal is defined by PCIe spec as an open-drain
> 
> I couldn't find any clue that says PERST# is an open-drain signal. Could
> you quote it from PCI Express Card Electromechanical Specification?
> 
> > active-low signal that depends on a pull-up resistor to keep the
> > signal high when deasserted. Align bindings to the spec.
> 
> This is not true from my POV. An open-drain PCIe side-band  signal
> is used for both of EP and RC to achieve some special work-flow, like
> CLKREQ# for L1ss, etc. Since both ends could control it. But PERST# is a
> fundamental reset signal driven by RC which should be in sure state,
> high or low, has nothing to do with open-drain.
> 
> > 
> > Note that the relevant driver hacks the active-low signal as
> > active-high and switches the normal polarity of PERST#
> > assertion/deassertion, 1 and 0 in that order, and instead uses
> > 0 to signal low (assertion) and 1 to signal deassertion.
> > 
> > Incidentally, this change makes hardware that refused to work
> > with the Rockchip-IP PCIe core working for me, which was the
> > object of many fool's errands.
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > index aa70776e898a..8dcb03708145 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > @@ -383,9 +383,9 @@ &pcie_phy {
> >   };
> >   
> >   &pcie0 {
> > -	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> > +	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> So my biggest guess is we don't need this change at all.
> gpio0b4 is used as gpio function, the problem you faced is that it
> didn't set gpio0b4 as pull-up, because the defaut state is pull-down.
> 
> Maybe the drive current of this IO is too weak, making it unable to 
> fully drive high in the pull-down state? If that's the case, can you see 
> a half-level signal on the oscilloscope?
> 
> >   	num-lanes = <4>;
> > -	pinctrl-0 = <&pcie_clkreqnb_cpm>;
> > +	pinctrl-0 = <&pcie_clkreqnb_cpm>, <&pcie_perst>;
> >   	pinctrl-names = "default";
> >   	vpcie0v9-supply = <&vcca_0v9>;	/* VCC_0V9_S0 */
> >   	vpcie1v8-supply = <&vcca_1v8>;	/* VCC_1V8_S0 */
> > @@ -408,6 +408,10 @@ pcie {
> >   		pcie_pwr: pcie-pwr {
> >   			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
> >   		};
> > +		pcie_perst: pcie-perst {
> > +			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> > +		};
> > +
> >   	};
> >   
> >   	pmic {
>

Hi Shawn, glad to hear from you.

Perhaps the following change is better? It resolves the issue
without the added complication of open drain. After you questioned
if open drain is actually part of the spec, I remembered that
GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
so I decided to test with just GPIO_SINGLE_ENDED and it works.

Thanks,
Geraldo Nascimento

---

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index aa70776e898a..b3d19dce539f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -383,7 +383,7 @@ &pcie_phy {
 };
 
 &pcie0 {
-	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_SINGLE_ENDED)>;
 	num-lanes = <4>;
 	pinctrl-0 = <&pcie_clkreqnb_cpm>;
 	pinctrl-names = "default";

