Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E9BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T/xS++I1bJomI4Kci5V1It9kyGfSsYpAletpMKbjaU=; b=mJVoSppG1N3ki0YDp5xQY2MWkj
	b0JiXi/TldQLxyegObRV6hw2Y5IEyWOkXn4Dm1Yu+Z7yOpf2DsSYtmbijX9SAXSKTlxRAvm+Sbx9Q
	DAJTvBVUcXV/uFKnST/K6nC87UQKFhBLDKy8H2E02biNfM01t9/M6C+UwkB/0xYTBizIgy1N/qXun
	n07qXnhuIXMcR3I/xHmjFRlS4CqWU1rpkxdy6/qX9uW6mSMuXoaQMXaUY5UmaIHc3Gfrc9dHSfy6b
	u3kHbN8/fMc5iRL6VOKEwiQPefeA3EFzkPnK/deBnNrZumKP4XZI13ObFdbLjiR3/2RLy6Jf8YbkU
	UW7TikGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze27-00000003XHw-3Vc0;
	Fri, 19 Sep 2025 16:32:27 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze24-00000003XEo-1mm6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:32:26 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-30cceb3be82so1932656fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758299543; x=1758904343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T/xS++I1bJomI4Kci5V1It9kyGfSsYpAletpMKbjaU=;
        b=jK8nXKuhS4p0H/Iufw8QfixFi5vNeZrXPMLV0GPsPPJJsWTN8i3JyBFc83p/AYrl+G
         eu0kFvBAC0hE/Nr8s+yCoYhVnnguDnhUyU4gg7piyN80ibO81VEFFOEMyAA+cgK6lAV4
         Vqz3uBDBDUnu337PTcMEqBs5msyi5KFUwlKxLPMGStX6gdCQm+sj+NYjzYE444U+WNZR
         iZG06RWdgTboMkbdpzmBPsxKoNeruEZ0wVDlXWY/MSOsPdrvJkT6kdyR05H3KBTpsASk
         pVwj549GyLc/hayqzn9zaQKdSm1G/VREQks029sIURoYc4GscSFCCp3K5qImN3QoQoyR
         fdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758299543; x=1758904343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5T/xS++I1bJomI4Kci5V1It9kyGfSsYpAletpMKbjaU=;
        b=kQePtyxE+kRHckpfKO6n37K6CaexPuaWNVSv70WqG1YwTTdqzHeqLFTyiyYzO0vRbj
         YSWuTys42OUPG1y+dtfj42UYUCseHU9ZrZTttfOBWxS2OOwgsoUwz6On5+bWVfhstAdj
         TQ3WlNSAC/gtScUyBvlW+CnCY9CprvhMSuviI/29T3bV9G3ZGHsPWkKiyfAC35hkuNRl
         9a3J0qe5XuRwgIp9htLUrLvnpFFA4EGc5zORzPQ+BWPq71oFtkwJC4bugbeKhd0oBkDy
         ZAPfHpJrS7fFFUJUW1gtzXhD1wadAttcng1HQb2+7C9YSetMOnzSKI2q8ZGzDI63BYQd
         RAng==
X-Forwarded-Encrypted: i=1; AJvYcCVgAzpRiqpDH7unyuuhXGcUV0KAcNYzOLGhyeenlRklOlmtxUmF2IKVYtuW62F4jiHxBbFCZfifEt4bVdyT3dtX@lists.infradead.org
X-Gm-Message-State: AOJu0YzknhHJqJCm/RZcADH7Nv9ooVXKL2cEz3gBXibzTwBNgl+dU0RA
	5ie2KYjEr3wiYnw5dAOr+uqY855GpH68f0YGyzJdU53l1t4BkX9uzmn7QEH3VKbXpvYkOGmA3Jk
	seBwbhc8/Xo2fAw51a8qKTc7VZFy1VAI=
X-Gm-Gg: ASbGncuiowBuxdJMshnu3lR61Q6vj+mvpYKLPrbjYfLkXqfFCyPGsG5Rj1njI/J21j7
	C5umnnKGshd6qjA/wi1KPcxs9r5+OUcabdOknOvYuUqP+Uz8h+2PUG3wlm5nlPPCIkdF98Py0Rh
	Ui5YgOkzG8BoHLFxPwWDEFjJ/24RcfqJkGL/Rl4SgCGjt4rL2DBoUNhWJVOEwcon2GgOX2FCsqR
	MAlrVWx
X-Google-Smtp-Source: AGHT+IFHybkxatf8JRVHGLWr4iZSJNFbs5kTvlDX9vCOD89cpbWHtSqK9/IcGzh8ZYPusuoWrz8jW9C/VxhnLM40hC8=
X-Received: by 2002:a05:6870:d60f:b0:31d:63f9:b247 with SMTP id
 586e51a60fabf-33bb5c70d83mr2082379fac.25.1758299543310; Fri, 19 Sep 2025
 09:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-3-jjian.zhou@mediatek.com> <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
 <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
In-Reply-To: <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 19 Sep 2025 11:32:12 -0500
X-Gm-Features: AS18NWAefeyCXylp5yJszotuZguszwXnzyqYVpM1xMwzFsIBtdJ2c5oL63b9Kvw
Message-ID: <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_093224_639862_06B7BD90 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek=
.com> wrote:
> >
> > .....
> >
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +struct mtk_vcp_mbox_priv {
> > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> >
> > > +       void __iomem *base;
> > > +       struct device *dev;
> > > +       struct mbox_controller mbox;
> > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > +       struct mtk_ipi_info ipi_recv;
> >
> > Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
> > allocate one during the probe.
>
> > Also if you have  "struct mbox_controller mbox;" as the first member,
> > you could simply typecast that to get this structure.
> > Something like "struct mpfs_mbox" in mailbox-mpfs.c
>
> I read somewhere that this way of subclassing is not recommended.
> Instead the base class should explicitly not be the first member.
> And then container_of() should be used.
>
> I don't remember where I read this though. But I think the explicit
> container_of() is easier for understanding the intent.
>
And how does container_of() work ? :)
typcasting the first member to its parent is the simplest form of container=
_of.

-j

