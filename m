Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1712FCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20X0FggjNIZtK2wTcA0T98MzwYS7d/pU6xJcudRoIkA=; b=r6SCmFdHIKl16WpQhODzG9ROpt
	oYUlJDOTMQ9JX90PCy5rpUZ4itqGFwxgWkvwjNJId/uGfmZKKYbAXB7wa/ioRy1t+mrRsKTR2g+Ln
	LjR1yUsn6xniAp10pIYMaBSbDfiUXxyWqcdxUF+2qfX2BUqifQPPlpa25WNf1AtYbQ7FOfa/5WwsA
	+tQIN3hwb2hrkqAAoJbKudnkodBRBzIPb7OChftn3xUPygZ1wsyoVTa9jLFqNWRYzlucI5YVCm/gS
	WfYodZcxqCEPhNlMOskOXCb1XRvFhuL8D0zhvtPFzzSmDDCvCdAzp8VqPDL61yY/nVVSR8UVVn5Ip
	WMo9YOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZaX-0000000DMIE-3yy7;
	Wed, 05 Nov 2025 09:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZaW-0000000DMI6-3fNx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Nov 2025 09:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=20X0FggjNIZtK2wTcA0T98MzwYS7d/pU6xJcudRoIkA=; b=jLuvKXAAqikYylAev3w4uGBtAH
	KS6yB2PVNyYsWBiyzlGjE5ffBEUyAv0ESe50ETbDNAONs4ODlb8GXiFPaR5plY+n+aJDL7JqqZFtf
	rr8HgfELFXMj49RZ86MPnbY9hPeWqkw/aEvbb76HMmerK8FaEiL3i6iCeKY6LNl9U9quhp0yWYXLl
	QjDHhqA+E/mTp6Ns8gmM34p1ML/DKLKplaXjYRAdX8W+myO4IAQK9lsThK6BW94j3CuxwMvg/AI10
	zrGe9XVpE9okluGtiK4waBg+L6k6F4br9y0Pnb+b0Yran3ZVeR7NuMIECd91rAhUgmXrmnBpf+Nvt
	/b7rXwRA==;
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYim-00000001i6N-22Va
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:18:26 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762333619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20X0FggjNIZtK2wTcA0T98MzwYS7d/pU6xJcudRoIkA=;
	b=aQkDEf0o1hZDlA0jt/SAK7d1jIzuk83Wctvw7Khhjx221G75fVkjY6y1QChQga2p0H/gx7
	jb80JscYaEXymno4WJMr7sszvCliTv/kGLD5aPpkUxXzuRqF+LkkqfxPFih1rr28zE2J5F
	Nj4j+BNbr3lDj3fzWXfFiSEnTYem1pnhUR9c9vbgezDW3NOmMRyx8jOQBlK+rwIJRQ5dn4
	cPCszNjP4TFptEs6ceoB1Ye5Vpg52GLT54a2vP6c7ydi7ZQ3/JmqQEDGRhGO6hyULD+3U+
	nFWJc2Q+h1lvn//Uu3Vn7Ypoy5RnrjIoRappU70Tf1Txx5KyWKhpEUk1DdPkTw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 10:06:53 +0100
Message-Id: <DE0N4LA8MOJD.236O12UZ3I3C4@cknow-tech.com>
Cc: <linux-rockchip@lists.infradead.org>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Johan Jonker" <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Bjorn Helgaas"
 <helgaas@kernel.org>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com> <20251103181038.GA1814635@bhelgaas> <aQrKtFT0ldc70gKj@geday>
In-Reply-To: <aQrKtFT0ldc70gKj@geday>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081824_736389_22EAC1AC 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed Nov 5, 2025 at 4:55 AM CET, Geraldo Nascimento wrote:
> On Mon, Nov 03, 2025 at 12:10:38PM -0600, Bjorn Helgaas wrote:
>> On Mon, Nov 03, 2025 at 03:27:25AM -0300, Geraldo Nascimento wrote:
>> > With this change PCIe will complete link-training with a known quirky
>> > device - Samsung OEM PM981a SSD. This is completely against the PCIe
>
> Something in my intuition kept telling me this was PERST# related,
> and so I followed that rabbit-hole.
>
> It seems the following change will allow the SSD to work with the
> Rockchip-IP PCIe core without any other changes. So it is purely
> a DT change and we are able to keep the mandatory 100ms delay
> after driving PERST# low, as well as the always-on/boot-on
> properties of the 3v3 power regulator.
>
> This time everything is within the PCIe spec AFAICT, PERST# indeed
> is an Open Drain signal, and indeed it does requires pull-up resistor
> to maintain the drive after driving it high.
>
> I'm still testing the overall stability of this, let's hope for the
> best!

I have a Samsung PM981 (without the 'a') and AFAICT it works fine.
I had noticed that the PERST# (pinctrl) was missing, but 'ep-gpios'
was/is new to me and I hadn't had time to research that properly yet.
Good to see you already found it yourself :-)

Cheers,
  Diederik

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> index aa70776e898a..1c5afc0413bc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> @@ -383,13 +383,14 @@ &pcie_phy {
>  };
> =20
>  &pcie0 {
> -	ep-gpios =3D <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +	ep-gpios =3D <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	num-lanes =3D <4>;
> -	pinctrl-0 =3D <&pcie_clkreqnb_cpm>;
> +	pinctrl-0 =3D <&pcie_clkreqnb_cpm>, <&pcie_perst>;
>  	pinctrl-names =3D "default";
>  	vpcie0v9-supply =3D <&vcca_0v9>;	/* VCC_0V9_S0 */
>  	vpcie1v8-supply =3D <&vcca_1v8>;	/* VCC_1V8_S0 */
>  	vpcie3v3-supply =3D <&vcc3v3_pcie>;
> +	max-link-speed =3D <2>;
>  	status =3D "okay";
>  };
> =20
> @@ -408,6 +409,10 @@ pcie {
>  		pcie_pwr: pcie-pwr {
>  			rockchip,pins =3D <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> +		pcie_perst: pcie-perst {
> +			rockchip,pins =3D <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
>  	};
> =20
>  	pmic {
>

