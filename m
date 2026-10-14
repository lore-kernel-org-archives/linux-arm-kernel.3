Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E22ACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 05:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FulSn6OJfeIHzDnwk3zF+TElaTpZOeiPd2UC1814V+U=; b=OayhouwytTZI8Sy1l3ZYidGomT
	a02Iq/fSm9xDC9rNKk+yp2Aep+4ttSqpn9bk7cb5ogivj08DxxCc/kX7gCew+lGq17oIwfL4xf5ml
	5zQpNmH24SdHGrsQtxuJjumKLFPn/gs/80GL+4KqoN0eyeezcw96YSBv9ZEPwxI7BqwPadxqCqhGD
	s7HIsz9wxrB1IjYhl9flcieRYFs+7QgG3rWbfJpwi++8idComV4S+SjP44latXaNHs9YqETeSd9gp
	0vnupennk1OjDFYUvwSzj513wKQ4XY0ebSLeZvYs75h5i7hoDO/m7YH3CGgMEtxho0Rmc1RFtJf+n
	PodNdw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrh5-0000000EYgK-37Dx;
	Wed, 14 Oct 2026 05:38:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrh2-0000000EYfa-3nhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 05:38:27 +0000
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EE6B0201E26;
	Wed, 14 Oct 2026 07:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791956301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FulSn6OJfeIHzDnwk3zF+TElaTpZOeiPd2UC1814V+U=;
	b=D65J5Mc1W7aGTZbC5Kr0FJQkrVhgRmBZs/E5IVZe41xe0QTeH1CjlVxnU97EotB6zloDtD
	/qryNloec0QF2XK6bfYngITa8dlv+rYui6u/yoDuuWxmxgyqEOudDRxTGKGPzMwZDV3/iO
	MnGZBMN66bcZYv3a3KE6xTKbVj4K4x3DBKQCvPxAN9Tcciul+FRxNros+md1aoETq7jZMt
	pwDxXdmxNfdGb4c3FzV240jt9GdSZYXTUiKMpSmFmZjNZr7N7wX+TbpdS2lBvavJaKmn/3
	IMPhf9f6WaVeTB/sjcrRgnV67eN9lnU/Uzgd/XvparOr+jzSd12VTYKIkQsL8Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791956301; a=rsa-sha256;
	cv=none;
	b=HiYGDgXPxnLGdyyDGdK3NF/UcQyqOsbBbTYI3MQGR9J03xmRuHBNtzcxZAcT4FSswwpeSU
	zi76Iehe4u99O++kbDbGZ/RHurSnKOArXb2kTD6Z1afAz44RhdoN3oQSClGJnUdpzQr2M/
	pPEpFXs/I2Z4KqUhWtzP1HEexuKT6eMLtxyTdUn1HDmZfDUxQnHUMZD8vEGvsAwJeIAzmu
	X11gwfYY/LxExD3uqze9VUsEVD7l2zoZi/fggXBP2ciGmv/+FkFNKtGBtnFnb88B39tfU2
	4FTMrqHg8hpFjo3yUkV/zLwM0RB/35g43uoyU86aKqKeulM3uCZtINmdIB7Vfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791956301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FulSn6OJfeIHzDnwk3zF+TElaTpZOeiPd2UC1814V+U=;
	b=ckm4czR412QiT0dT4TUaq26A19Hdcn90xw8b7xfthzJC31bF7ySu9Re4yTM4ja5VN4Nsrl
	uWpcrYzrC5yctBCY7kF43WmqLbRi0TbL69pg0JDxocdkAFIECM4hlT7d60ZafSOm5339FF
	LqA0J7cUMhI1+9ILrFYFc4nbGJZNkJAT1+/pbVOR1uJfcEBdNjdZATA17eQ2wUNlIexVTY
	uP3m9ID8GVc7FvhPdSALFS+dqpZqXbRRsd0A8ibcqLwPROlzXLqZX5qY9Q6s/N/s5rHF1B
	ygjrEs2RmQi/35O2kg8VW0IKIoNmMJo1riwUDReg9xE9Ykss80g1dBsIrcYGHw==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Shawn Guo <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen
 <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
In-Reply-To: <20261013-musical-brown-mamba-ff87a8@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
	<20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
	<20261013-musical-brown-mamba-ff87a8@quoll>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Wed, 14 Oct 2026 07:38:19 +0200
Message-ID: <87v774j0z8.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_223825_096882_AAB4B0C6 
X-CRM114-Status: GOOD (  19.79  )
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


Hi,

On 2026-10-13 at 09:31 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> > The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> > similar, apart from the Display and touch controller.
> > 
> > Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> > variants to use overlays applied on this base version.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
> >  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
> >  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
> >  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
> >  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
> >  5 files changed, 91 insertions(+), 99 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 475e1ad9116e1..7c1b61249778e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> > +
> > +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> > +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> > +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> > +	imx8mp-skov-revc-tian-g07017.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> > b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> > new file mode 100644
> > index 0000000000000..33ddd08a7adb5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> 
> I do not understand this. This is a board, so not an overlay.

yes, that's what I did up until v4. New board with new dts.

- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

The boards are all very similar apart from the touch panel, but they are all "real" boards and don't share a SOM, so dtsi is also not correct.


Best regards,
Steffen

> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +&{/} {
> > +	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> > +	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
> 
> Best regards,
> Krzysztof

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

