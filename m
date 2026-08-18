Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B23C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxoJzPksuK2FDItQJn1AHAFzrtCR8dkvo26/KvGtqwo=; b=OckQ1te/8COXW7uChP6uIT1nRW
	8Ws66mGpXRh8AB0p/+F0F8JUPTJmlpoTByFUfPA7+ON+b4kAQpRr92XcgDBUizbEe05Dz5aqz3/Y5
	diObIrRmieoVjdysC+9BTs8C7YKAwvvYW8F16j0cIaBxBk6GFWGslTTsQ+w9xgON5wLo5Z/Fnu7w+
	NKx8xrOqevTYiE5AdQJdsiazLtd8+0B7rAD7fBUCdFejr9kDqqbh2zETvKUothOOG0r74JePW0/ME
	l4XT+iIkIyWgs2saz17AQFN6XYX6ASmBnYjayhYQJ3cLXwWqWzhBLI9qsbMgzetifBE+Nmp3IbJzv
	+zrf4EGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEsl-00000007UgZ-038a;
	Tue, 18 Aug 2026 08:09:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEsj-00000007UgP-35Fj;
	Tue, 18 Aug 2026 08:09:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2A0B44038;
	Tue, 18 Aug 2026 08:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690BB1F00A3E;
	Tue, 18 Aug 2026 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787040552;
	bh=KxoJzPksuK2FDItQJn1AHAFzrtCR8dkvo26/KvGtqwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gMDn1pQmV05dOdAY/pzoI+YyNdsCaN65uiMrqKC7ujrwsnbKmc+WDTRQjXuw8V05m
	 qYXYyUA/IHhp3OcXyxIzRK/ynvWv7mL52b31BzAsiVPnOS5wFrhnV9aSsz24QpS0oX
	 SvmWezaxRBV1BAaSZGeR5tkRZ6JFdNNliMEvPnv1A8O1UJvZVMSf/LKEERRNvS3BJ7
	 vxF4/LgC624RTmgWmngE9tCqYmENzTgbjUl5emrNQ9OEdZtyUbZp2BnNzHQa21Uuzq
	 YiyfaxAAIE85WLhYOcI3EW0NY0w5ak3SIBUh4OAxxVyI/zYzPTsp4uk6AtmzBvtAxt
	 Qg1+dBXUEsJCg==
Date: Tue, 18 Aug 2026 10:09:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/9] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20260818-imperious-thankful-perch-dcaa44@quoll>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260816213849.1044073-2-marex@nabladev.com>
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

On Sun, Aug 16, 2026 at 11:37:03PM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
>=20
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
>=20
> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: - Fix up Sob/Cdb lines
>     - Fix up compatible string in example
>     - Use additionalProperties: false
>     - Expand description:
>     - Use clock-cells =3D <1> to discern OSC and future PLL clock from th=
e PHY
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 73 +++++++++++++++++++

I do not see any changes/improvements from previous review.

Best regards,
Krzysztof


