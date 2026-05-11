Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD6CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36Y76l+8L/1TfCN9D9kVNldinwW1l3CEh723aHYy5Vk=; b=G5GWZCBPnmhvFa
	8Y9ImXuLSXdWP7HGK7niQvQBDUCHsMfnGln48plSn03kexX7xBnqWo/GsmoBx5MsqQeMfLFdcyGSF
	yOr1dplSKFZu2+seJONBegW41WlmZwLV7oKIsCwEi18e2UNs+aUivfLIFouCfk57bBkHMrTCISzV+
	IO4LgjoORwtVs/qtCS3PaJUtcxAm3T7/GTOJtHJ/bdzlt8ihGZ/40okXZiOdMlTXcQGH3gUOmoIso
	4+ODvO0N36WzFWU0soKb64Ql29D3SmcRE6qV98XJ4vC8OpaBAeHSFTc4MOZIa2RUpvFLZunEAAYQO
	x4ZevzLfvSppMYkPEhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWjz-0000000EeLX-48hl;
	Mon, 11 May 2026 19:56:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWjz-0000000EeLL-0F1r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C9D6001A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B5BC2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529394;
	bh=36Y76l+8L/1TfCN9D9kVNldinwW1l3CEh723aHYy5Vk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eldR591fT7Hwm3wg3SqMducQlfxaAEHxkYFLr5Ef3J7xYD7RoGnrXJYcpIjwkbtlI
	 6RSGX8VenN+l3okSDgTObaQdzW3nKaDtkQVQyz8HbpeUcAiD4w8JYhNVzMHW0NJuai
	 Fm9F+Yn5JPhIKa5Ik/qO4zY6JsAApRuhtp2FRBfQe+euX7te7fPrt360tBOQLnIEiP
	 8HDCu0DSrtyY5qYRTuX2fTByWiwkbgJBvri7Gjjl8axF6vpgQqJ8Ng5v5fCoIKq5ko
	 I/7xfZLtRUW+fmv8qOK9KeMzhDU2X9Xbg8rMH4QBz8jAhhqftXszgIap+OhcVhV4gp
	 AG3w6MEIHtqhg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e97e73234so43511161fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 12:56:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+AfCpJ/pU/mdlw1qulc6nWbkwLtdIj6UvPoA+sxXt2URZvICfZik2msOfjolGB1t35AD8Rv8lY7fRZms5LIKUY@lists.infradead.org
X-Gm-Message-State: AOJu0YxcJruzF47kWwyJ8HwUtBl59ND+qHXiVVTcmhuIc2QbpbuKohvk
	LXiotHZQ34l11ngds4H5Ci7zizsaZ67EsUioWvpFBl3nLyu0/PDbcUEV/SlGDxO5MhYTC/vU0jy
	qagX4ssz57hri2W0pzznVpRlUYlKWe6k=
X-Received: by 2002:a05:6512:3d19:b0:5a8:99c8:94bc with SMTP id
 2adb3069b0e04-5a899c89686mr7561830e87.28.1778529392892; Mon, 11 May 2026
 12:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260505160902.1425532-1-Frank.Li@nxp.com>
In-Reply-To: <20260505160902.1425532-1-Frank.Li@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:56:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=BhoYCvTLvzCQyktRUiKsRrVyadUxOjCvLL7wxwBcR=Q@mail.gmail.com>
X-Gm-Features: AVHnY4I-LNT372-vzpWf6Qi-_cAA5hInJN5Jx7npmbBI4rxSPCplPzmHk8NUQv4
Message-ID: <CAD++jL=BhoYCvTLvzCQyktRUiKsRrVyadUxOjCvLL7wxwBcR=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: imx1: Allow parsing DT without function nodes
To: Frank Li <Frank.Li@nxp.com>
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, NXP S32 Linux Team <s32@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 5, 2026 at 6:09=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> The old format to define pinctrl settings for imx in DT has two hierarchy
> levels. The first level are function device nodes. The second level are
> pingroups which contain a property fsl,pins. The original ntention was to
> define all pin functions in a single dtsi file and just reference the
> correct ones in the board files.
>
> The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without functio=
n
> nodes") already make moden i.MX chip support flatten layout.
>
> Make legacy chipes (more than 15 years) support this flatten layout also.
>
> Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node =
in pinmux hierarchy")
> Tested-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

No reaction from other i.MX maintainers but OK, patch applied for fixes!

Yours,
Linus Walleij

