Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A9CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iWF+2k9j/V1bncQePbeK9Xh0Y7J4Zk4ncvSD7lE4g4=; b=RDeCQHb4F6bQJPrl6iFzYDjaKv
	hA3+wICpUHzaD1Tl6GXpcSCLjxb0r9nc/b1pCktN706HBhKQE+54CTWfzskKlpKYWZb9iM5JoY9QG
	ugJDY9EPW1I4YGl5j0cuw8xvGfA+6DknDvEqca1WZmzfVYpdgGsq1Zq2sCyBo1yBeL3gWtjQ8dI1+
	nwZwNlqr4dc9sOI13TnkwdNQKTals7jDRzCejl5o7tiOaDk/xhPzuwPp0cBjek8exGkK+4JziIjxf
	i6fV12j6bTLu+2GPWecroNL6yi2pzabBrdlDABXr8tg3jh0hAmvPIsqtSMFg3/3aVbQAdjykuwuJC
	afZkqAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPeU-00000002IAm-1Hp3;
	Wed, 07 Oct 2026 11:17:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPeT-00000002IAS-18sT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:17:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ADED43AB8
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F97A1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371856;
	bh=9iWF+2k9j/V1bncQePbeK9Xh0Y7J4Zk4ncvSD7lE4g4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bhI/A3MF4J0vNjSVGIxRV/vIYHjyi3kdn07CFLD7AkEg98TtTGDtU62NJHNFEN/qm
	 ViMZqu+R81HWoMzUo96YzsHjeHEdQWXxnGoiA7ulmQZUaYqfr0KCiheqAVOlb2TFzs
	 hHFewDn3BzcNh+R6HvrB8nVo0r0WABmxi/GawMl0TKrA1meI2W0lo1WbNUVEdPo3/Q
	 /fTVlavELpUnz+TxU8knbAVHhHxmQA40Q5ajHirQfN2N6jFg6LKDT26OSOk8EFDcpR
	 ipYmllBzZdaw1ZCDhfBBlEwiQo/9pIpBGZZ35IzFaD21xZVmS1L3Q8X0CA/wHqQ+0I
	 HZ3J7f8p2GDgA==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed188ee81so2114356fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZfjYHIeVD65lnp98E/Ox35caHNOuIqmIUHXSYHRBETVR/ROkWxGUZ23dr+zOMFvms31orVG0iyeZrCGyoBkdH@lists.infradead.org
X-Gm-Message-State: AFuF++kMjYste8pjhTJqucZZoRJfNIHUbAZREUeHDuikk7m0F34knHvc
	XCucHu00yvmgZALKJ5B94jWYDywh0AI7luBOmUV+RRW8hmh6PIFmaT2Q/QXKxIdQq3Tvw34IfO7
	eYaplHNHeUrc5impgFFgbOPZojGpn4gA=
X-Received: by 2002:a05:6870:c193:b0:49d:d2cd:67f3 with SMTP id
 586e51a60fabf-4a2597076f5mr1839969fac.49.1791371855820; Wed, 07 Oct 2026
 04:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org> <20261005-scmi_bus_fixes-v2-3-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-3-34a51338875a@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:17:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXDbRRCjSREYvFWy235wm3NnrJembGG=AW22ydW9o+9A@mail.gmail.com>
X-Gm-Features: AclHuK_X36kw7cGl6aPVuSMhUZsTQjMCbHVjKMBdB6tTAhR1mtf3ophJkl6YKXA
Message-ID: <CAD++jLkXDbRRCjSREYvFWy235wm3NnrJembGG=AW22ydW9o+9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 5, 2026 at 11:06=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
> "pinctrl-imx" name. Standard devices no longer have exclusive request
> tracking, so the i.MX and generic pinctrl drivers can register for the
> same protocol/name pair. Their probe checks select the appropriate
> driver for the platform.
>
> This solves the issue that occurs when both "pinmux" and "pinmux-imx"
> devices that share the same fwnode as only the first device registered
> is assigned as the owner of the fwnode. If this owner device fails to
> probe (e.g., its driver is blocklisted or missing), it never reaches
> the driver_bound() stage and the system skips cleaning up its supplier
> links. Even if a alternative device binds successfully, the system
> still looks to the broken original owner. As a result, all dependent
> hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
> forever, halting the boot process.
>
> Note that the solution doesn't support same fwnode being shared by
> multiple devices and associated fw_devlink feature.
>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Reported-by: Peng Fan <peng.fan@nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f3=
2@nxp.com
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

