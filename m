Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DBECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=; b=PNbsB+ZuhJ+G3ADjmgy22qa3F6
	/mbVKGEvwJLrUGyYBcj6lqMOWKzxbXH3p8l7ckgnlU8gOK4qEk/3TLktynl/HCkIgFxnmxdgCg50f
	5MZge9vQ0Sp+t7ofXCTr3dpjx+t7gtXrCLRNmRG7/C4eTgS+PAHn8TaoiQjaZq8d+eL7UsmkWHeZ7
	kbrcptZesVophff0lo4z3bVeNf+trP58mjG68mIqJlO7qACwsLBuwNl5X/v2W1ld4EBmgoBQxgj1b
	tYCp/WtXFFsVRE5nhEPEooyy8W3UiaYg96vO5YGlWJl9L1OilQ96ji9ULmKKVQZc8bAH5jE1MK7A1
	AxZmQeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOOw-00000001StM-47FN;
	Thu, 18 Sep 2025 23:50:58 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOOt-00000001SsO-3f8G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 23:50:57 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-3357b8aeddaso2332775fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758239454; x=1758844254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=;
        b=eg3uFgQZ3t84aZl8ulL51SQLAS+yVnCfS9U5EWy6q9J9hmhi65Tu70B5Hu9GMlc+Ll
         LmweggCazn9wDL9tMKaDl+qFf9BaH01+9XAxx+sfx30Gh1fvhw1qQIyi4eR9vOkV9/ml
         lVkRZGV27y+o48MquXcJo+EP9C6G9tNFflZ4KDHzKQ/TD6+e+MsMlGFtYKcHocCpL4JS
         eQqAYRPuwy6tfWsB+JbGek1wnukPykl040JY4xXLmH8FzjoV2CSm5j6CZT69bJ1hflrT
         rjfa2bycDJ8P4zloyRA/TmSGYieIxGwfI1XS1dGHZ/lvEjmI0mJl48WrPxeHOsH3F9Yd
         PTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239454; x=1758844254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=;
        b=Evz7PLp+BRowIAZw8mn6bSovBgw149rNOaiSUh61eyMY1VeRawmr7GF6hT+/Xl4GBP
         2J5ZEGG49h6BKxa0Ts6u6HmSX0kxQUHLQ8vNErMJ3CQhBT/E/5soj6UehOVRnAIXNHkz
         DGfIQk2mTXzXCXjcx66gbpDzfPH2DpUzh1m3aEuOr4IWxvXjlVjKuH7msh/0a5/fSv8F
         PJ1/0A7oNgoieS+Oivo5YNMmiL2ur0yKbje/TnVgxwNZVNMxJxeLd0FG7O9+grOD+Xxj
         /WiyVMWXQMuDlWzP8KWGJ8sAK849ThaHWcZZClD+gbqzKt+CW51+2mMjA2LYzDK5b4Lv
         vZKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z/4PU5S8wA3RC9jBtYp+TwxRjELY2Z2FmbgiOfbRY4kfg5QBgyYjmZ1clVc/lPD4h57V4dxjJ7t0MZSLXM4L@lists.infradead.org
X-Gm-Message-State: AOJu0Yzaio+8YMGd+gfQh6o1YHuzsPKz1fjbCX1/l5Tpj3nkU2VIVdJM
	D25CPM/MJJWpgxPje7b1J9Bkz5aZVux7nMKjIjAul12X1tL0qEvmdYayEXXFsB4TOf/KosEzi1s
	ujJzZvAiQLRhmYzN4kvM57uQcjQS6vmDLuHq5
X-Gm-Gg: ASbGnctwgsbsTn8zs66+Txie2GvcNoDa/z8e4WQh+c6kfk+PohDQ2dbJJq3++QmiV/g
	hbXS8ZaAstSEMaNZHMOH2JLjDfERwhGcqJX7Gf59lly3gvA4kob0f5FYhVzuL2T3iOoId2yJHLA
	Y04J8mZ0wUK8MswO75SCjIMM3U7kcRaIhkkybP42Cz9boR3GZpIwQka0xP+VWoQCcwOdpBsJRIh
	3s+izTNkh6xwIEcWsyDCpgNh3I=
X-Google-Smtp-Source: AGHT+IFl61ezr6lGg9Y8huzd4lUuItQQFeCjeYkcbAulR0oeCohvd0FtJ04m812XYlXTYo+4qdyMj6+Phytv0CLbQXE=
X-Received: by 2002:a05:6870:c151:b0:31d:8964:b4aa with SMTP id
 586e51a60fabf-33bb3ab9686mr861868fac.6.1758239454270; Thu, 18 Sep 2025
 16:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com> <20250822021217.1598-3-jjian.zhou@mediatek.com>
In-Reply-To: <20250822021217.1598-3-jjian.zhou@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 18 Sep 2025 18:50:42 -0500
X-Gm-Features: AS18NWC4m9av00lwavoKLMq8wYvsb2rbN1xJZakR6WVpJIjFSlMM8j-tfAib_HE
Message-ID: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165055_916165_497FE7B3 
X-CRM114-Status: GOOD (  11.83  )
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

On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek.com=
> wrote:

.....

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct mtk_vcp_mbox_priv {
Maybe 'mtk_vcp_mbox' is a more appropriate name ?

> +       void __iomem *base;
> +       struct device *dev;
> +       struct mbox_controller mbox;
> +       const struct mtk_vcp_mbox_cfg *cfg;
> +       struct mtk_ipi_info ipi_recv;

Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
allocate one during the probe.
Also if you have  "struct mbox_controller mbox;" as the first member,
you could simply typecast that to get this structure.
Something like "struct mpfs_mbox" in mailbox-mpfs.c

....
> +
> +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox=
,
> +                                           const struct of_phandle_args =
*sp)
> +{
> +       if (sp->args_count)
> +               return NULL;
> +
> +       return mbox->chans;

return &mbox->chans[0]   seems better.

thnx

