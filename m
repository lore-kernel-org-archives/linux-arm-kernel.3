Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D7FEC1424
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbCy8PRJgxvl7inL/4lV7PwnbNxjPe8sBUP9fng+MLM=; b=3pk6qzce+wlhT4rkg1BE0KQkz1
	5qrki5yjCuNgDY1FpMyPLj42rKUfer1t8lgtlH68y5eSyNCI5AQGL+U3fIfeDSNqz3oLje5IV8hjf
	xDs+EHnAd2dv1IN0Jh7VIe7OJZs5Vg0bXr9+wTiRdIPB+4gTJspIT0TjB8kM+VZ0cuIAlG41ZNGwB
	wnmqlx7aK5yBr5dPmM8fwEGMl7OKDdgIqBto89FdOEYW8G/IHueMZmthAclaLfIg6YAqbvKc9RdNq
	KPyllDGuloRcH/CKj1oBjXUYlYgtXelPnJm0odUK81bkE067E3XG8mclRY8Mr0893GDOobJTeMixw
	kh3YzG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN4c-0000000Ey0I-3SWk;
	Tue, 03 Mar 2026 10:33:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN4a-0000000Exzp-1GMy;
	Tue, 03 Mar 2026 10:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772534002; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VQOMfMUATbLwFue8XJSnkr0LD2wH17JwAI9UIvOezcp+iYBiGn5GMa8hTuMXp98SlSh/JhYh13tXhXuLAbpRyw/qkElSn3m8lgy5jacaqEhjGNJrVKa6neymwYkzn5ZgdRG7MyiOpoJepPo+cRqtWFSDv/jhzeFwLIufTmPYIL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772534002; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PbCy8PRJgxvl7inL/4lV7PwnbNxjPe8sBUP9fng+MLM=; 
	b=DZZawfMRM3zu95Z/jVMjT57aYA93Ay49vX/9a4FqMW0KSN8Aeed32scT61B1Wy24ZuRPBRdZ+uBOhvrlwA4qJQAdYPXk2Hd9+ndhRJ/LpFOSIr4QbmxxOcdGvacdoSFjTPBxfq6rYJvQ82k36V4DvCxiz+0X2EA4+4hZWdbA6L8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772534002;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=PbCy8PRJgxvl7inL/4lV7PwnbNxjPe8sBUP9fng+MLM=;
	b=Ed+TPOC+fV576dF8loSHtbyPLzFwTZiwE0U3kbDDyPrHVKq6ZFnKJa28v9G8oUb+
	WWsd5SV+xqHo4DPH1RnlroVnd1c2xuRVvK3sicHFl7Pc5e8uROzOBQYoviysuCllr94
	mU8FGSwcwae+mgp+QB9IeMYgm7ZVh1qXi5GsYWtY=
Received: by mx.zohomail.com with SMTPS id 1772533977967751.4643569015835;
	Tue, 3 Mar 2026 02:32:57 -0800 (PST)
Date: Tue, 3 Mar 2026 10:32:38 +0000
From: Yao Zi <me@ziyao.cc>
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <aaa4xodVNaY0gmBA@pie>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061732.918-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303061732.918-1-lizhi2@eswincomputing.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_023352_412792_14528FEC 
X-CRM114-Status: GOOD (  13.00  )
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

On Tue, Mar 03, 2026 at 02:17:32PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 50 +++++++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 54 +++++++++++++++++++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 131ed1fc6b2e..d558f0fdfb38 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts

...

> @@ -20,6 +22,54 @@ chosen {
>  	};
>  };
>  
> +&gmac0 {
> +	phy-handle = <&gmac0_phy0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio106_pins>;
> +	rx-internal-delay-ps = <20>;
> +	tx-internal-delay-ps = <100>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";

Since it's implemented in the DWMAC IP, I think the mdio bus is
SoC-specific and should be put into the SoC devicetree instead.

Regards,
Yao Zi

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gmac0_phy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			reg = <0>;
> +			reset-gpios = <&gpioD 10 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +		};
> +	};
> +};

