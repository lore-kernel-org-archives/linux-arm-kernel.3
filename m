Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D8AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR60eLgUfNNIz6B0v46FKwzAtiy9XGoPTayqxcAz4UQ=; b=yqhYeIoU0DxMhPuBxKUOGNSh9C
	ii+tHHlExLqNsJSsvZw4PeoDRrDhoI/Av0rKi0/hmvGJneX/3T9Af0WH4kWMq83UpHV/3xE2tLsDf
	VKcjtbpHq89q1L0Lc/QHA6+cmBscYwzOboujx1XJ041T4Np9C2L1Db7vTwPUv4SaSdVkfbbpeiWkf
	DZt0xPzf0+6qt35S/rU4SOoTowCAP3ni/dEon7w1a09cJH0kWXbbEnu7eUYuqZJt+cloFWOF6+Y23
	N0Ghxc1BDKV6dVlmQ3MzqmcNSyDCMZsgRunMGb2fm2JMt0gL13KjNCRptDNyBTAW+0J+sK6vVVmkp
	qofFgsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbOy-00000000a4p-0SWe;
	Wed, 08 Jul 2026 23:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbOx-00000000a4Y-1pNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 23:09:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CACB660EEF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1D21F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783552198;
	bh=LR60eLgUfNNIz6B0v46FKwzAtiy9XGoPTayqxcAz4UQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZqLGG/LaE2yyMqM5XS0hIvwyGP4VAC2nYijzaQlQfIaDqC4xDUQr93yEZe96t90jy
	 VymKJ+2dNoXJ0R90xBkWS3du9UT3kY79XAn6bzUKknfEpUTxnHM6QE7X2l+BB0xYbo
	 cwLCu/lnPGJjQS3pil9w7fjr6vJN/rv+nWiHl6vwGXiVOcVBJ0Sg0UuLfA7DpObG8X
	 3dtK6Nb/81VPz7HN1L7VIbbeezTa9yQCWAGc/Bb0heQOcjAxtvPDGvlr4CsC+tQDDf
	 XQ9VtCE1WQQ5Sx8FsNYcHIPYNyyrcoAuBxDyDOZ8Y0d+4eXb8TBqQwXlD7MHuq2KVY
	 /XVaqMZw9G9iw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aec139da7eso380537e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrKfe4Ntll2ikM9rPyi0SmUntfNpPJwB8LQ+vpNOsqwqVBDkU7I5+YTPvbDG9VDF4rPzCClO0Lu44X17doGIkdi@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWk0BLzTgfCH0GNYEpwLUA6VXy/UYCdwdAANzh8iSsWkP33ah
	aiZnbW95YJ98CZY9dM+xyHqD/NplRsdtM6vqD+3Ls0EuFlOFAmsE4BhM0gY8Hmk/BkLKqaGjJ8E
	cVGk7u9yQhlfXYr/tKlrJLv1XxmvK0bk=
X-Received: by 2002:ac2:4f08:0:b0:5ae:b5d7:7844 with SMTP id
 2adb3069b0e04-5b016d1b33fmr49718e87.5.1783552197150; Wed, 08 Jul 2026
 16:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:09:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
X-Gm-Features: AUfX_mwW-7N7MmlP00AndlWeAaBl8FEBrFYJNUhifSWGKsGcvxauySd-Uj-hISw
Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related
 CHECK_DTB warings
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
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

On Wed, Jul 8, 2026 at 9:49=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> cleanup st,stmpe touch screen related CHECK_DTB warings.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (3):
>       dt-bindings: mfd: st,stmpe: add deprecated properties
>       dt-bindings: mfd: st,stmpe: let interrupt property optional
>       ARM: dts: imx: remove undocument properties of st,stmpe*

Those look OK I think:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

