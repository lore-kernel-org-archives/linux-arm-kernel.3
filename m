Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F97D7496F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyAGCUlm+brXr7pmh+HChqf8cAz1yyIjxqldlF7yhcs=; b=n341TdrfpImFDszmdRyQ0UsgIe
	59U9dUPgvmmz2YJ5AnC38upOefP/oW64ZvKHtmQhNIPtF+uQawqOoCsAciUiXR3NzFWNsmtnW6W4B
	Z2TVENg2Nmhe+RJHhacs9CuhjU4hz0AzNjLrZohEKdIYwE8VnfSI9d95k8OYGS7lpo1B2Sh7I488G
	6QKkKZA+Xa4PAMXkvwH2YYpsF2fX+QpIzzkYWSmzuDrbkKQNAVKcRXMUy+Cn4l3nB0zMvoUpkPwcc
	G+B/U/ptozcaPDuviCOhm7JTnnHJ4meNmNCdguZD1LH2MXu1pwHaitzjmfzdEQyy7yHrDk73G96F3
	HhcXDhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWtG-00000009y78-2pS0;
	Fri, 19 Dec 2025 09:35:14 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWtD-00000009y4v-1inV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:35:12 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso1580284a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136910; x=1766741710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyAGCUlm+brXr7pmh+HChqf8cAz1yyIjxqldlF7yhcs=;
        b=AoSJUMAmel4EMq/oeNKbgfZsf0cVsu7p0QxZfghKPfpQ5nmSFJO9wXlfqtBdHOsumW
         hVQgD+l6aLoWu/T2qYMWbQbex+IATCfgsuvJABynsebpfOQyM/4iuieGankEdO42RdzD
         nw5Z4BHOPXe0FPfiNBhCVZHO1zTinMC+l1o9C3Bnaeow5FBci4xoBlqyeBprX8ylO9xy
         9QUjuugcqquQnpcsPjV0ChfF+Lu7UWG4JyOzM9f6ujEQ1aWa1/GZ1LbGmW4Vi81ms2sk
         03A5/o19JfD2+nGKwlQPi7pcKJRkJQXcAVFd26Joj0e/j2+8H+1KL7ELkZYBqGp57nuD
         7WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136910; x=1766741710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyAGCUlm+brXr7pmh+HChqf8cAz1yyIjxqldlF7yhcs=;
        b=RYR1JdXhRDc7DECEOuTtmmpUoV+lnk40YGpz8PgFTEF7AsBGcW+JvB0BUoREh63xQj
         fRHlN14tXXNdWNGz9R5PRL8kycKumWHZ66qO30neHxtpqCEdjjfCYLq+5oEa+LqS4msP
         TymBjFXZSApt51YhqWL/8b0VTUwZQo6SRuZ4l1tId8cf/XQisPRxkuOnStOsKjoJeasH
         3eqxH1rc+3wWQxGLN5f99qSjCEOhgp6doizaPI7eM+fXMgv/Tybk0ZUNc8g2YoVGWZid
         pwerAjFe0y1miRoEZIqZC49QJkWQHtz64FcesOiUh1tMTt0QhfZLy6X7e6fIY35pPjO7
         /MPw==
X-Forwarded-Encrypted: i=1; AJvYcCU4wtvDwwUn+jMr7fv8lcphHuU0pZsDw9y5Nb/0kX34N8ngV+fzCXNpjaJKB0a0m7fSdpIA64Qr16GvkU/U5BM6@lists.infradead.org
X-Gm-Message-State: AOJu0YymnRJ91dAo6QDf/TCFeg/sKbLYvzbyc5fAEosK5ftAU4nXqqIq
	H6n7E/NFGs8gjgEQ+IPfl7RRoYwn6N7hD3Hfzfl5zMdAW8Y0bG8xkpqKd0X79E+JtsXAdK4xQTU
	VuTF1jJ6GQhXDRi7TqwVnoNgiFzsx+TU=
X-Gm-Gg: AY/fxX7uXmaBbMoeiCTdsP6w942R4lc5lGPfa2ZL+zke7TXnR+8VXZFiDHwAJnW4SHu
	Wl2OfGz+1F6hN5Rg0L6cOhLYXDZltjyqzKw30e8+R8ayRyjgUWKie1dK7SfiNmV0G8jKLjGD9h6
	U38mhRinFRAFO9dFSooaWMjuYm93KxhTrPxcHVdGXAhMO/jXPbeNBPbqWFl1fgIFst3UZMlWI5J
	uoTXclHpQscLZ9lrgwaIQH6uzFcZvNfhqmmzmnKe9zDkI9H53wYznUM3yXxj/C7T4EJETzjkDKC
	dKaVTW3/Y0z2QSI3D+ZwlpmO6Us+WpBi9X3mQvmtxMUKEf46/Xu5bd2US1Mne/eIpmRUCuwawHb
	qcgIaKdWNXQ==
X-Google-Smtp-Source: AGHT+IEC+GRfBHy/wKtqpZsBBkP6Qw8fpQs3utuiawRsmustP1cLTt5mwJXD98PkDBYzd2Voi6o2nfAACcKqpL0sZnw=
X-Received: by 2002:a05:7022:2586:b0:119:e56c:18a7 with SMTP id
 a92af1059eb24-121722b4e90mr2430820c88.15.1766136910154; Fri, 19 Dec 2025
 01:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20251219075447.3672833-1-xu.yang_2@nxp.com>
In-Reply-To: <20251219075447.3672833-1-xu.yang_2@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Dec 2025 11:34:56 +0200
X-Gm-Features: AQt7F2qZpM6npqbvUvhl8gYuuDP4SgIr_o7BiZ-Bvy86V9dJT-iXFljB710VpjI
Message-ID: <CAEnQRZCZJnkXCM2ACf3dXQ-ZynRB1q2zcarWLAZO_1TsL-1GcA@mail.gmail.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control register
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_013511_457954_AEA8A186 
X-CRM114-Status: GOOD (  21.55  )
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

On Fri, Dec 19, 2025 at 9:56=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY=E2=80=99s diagnostic features during normal operation or
> to override some basic PHY control signals.
>
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index ad8a55012e42..cb2392008ad2 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright (c) 2017-2025 NXP. */

While you are at it can you remove the (c). New policy
from NXP is to use directly:

Copyright 2017-2025 NXP.

thanks,
Daniel.

