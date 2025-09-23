Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE1CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=; b=ciNy0E7FgRQp/ZeWwmdchKE/st
	yEKUg50bzxA1o5/u1tEuWMrPs7DTJk/dcshUlCwTK/Agv8JlabIdq2YphU2Z4jfC6Q/lsqi/V86Gu
	Kx/gE5JRHONj9BSrwjgAh1Tt1jOtFfomJvaQaExH5gkxw6U+mpK2um0TPGCyZkzUfusvStaHB5Jq5
	VwAbn6eyd/XoGDd+kaaoE3R5wqAiy8S8VwVWOSj46C+IFXU2Dyc3VvHE/RIvHR5qBFkKFUTcPW9kE
	MIC8Q3TZENWsVmW3TtDI+z6N1wBLCsPk1Kw4t7fbtklVjhlXAp7DmJMWsd+yVvHDvN5PcgdAu00bT
	LURtqnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12o5-0000000DRur-3AMo;
	Tue, 23 Sep 2025 13:11:45 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12o3-0000000DRt7-1cFw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 13:11:44 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-33158d9dfc6so5014009fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758633102; x=1759237902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=;
        b=izRmRRYANfq7iSPIzIS9//b/PkQtMWUYwmR5j95Ts4GrkR02itY1NupAsBsP1H6D8U
         Su77dvM+GXD/eBH7LQuX+21yar3buKmDKXU9nvD2IhsFNmtM26e6j3iuFE7DyeeLtQL9
         Kkfb0qt+sE6arlOWJ1Aw2ECth858DvQViSmufxo841iqkD3DNJRsOY6Pky8VgYFfIF3p
         qZ6RWJSwtRDVnrMqzj1hvLlZY1v2UBmP8BxNVJcIDXdHNH8OafD5h4ohvnLgQduWXaGc
         b+vkisdCn1B/flNm1WGKIuFfFfX1RpPtgmjE+vUVeSfH8KOW9DVfB+uxBfS5I0vPZZCf
         FY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758633102; x=1759237902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=;
        b=iYM8lfAFVnRqU14yTBN1P2V46d0VIl5ZK8t+2e5mMG6GiPezIAcURabtL5v42Y/dGT
         LBJtPgiIBqpSd/YL+bxWR906DRjcKvT+vv5iWDhj4e6YkEWDqpEwJVE0c4wbIzbUIgbf
         MZI8725tjy433zupH+ry3Ze3eiPLzR3PrWlEKskE1IlC/q3+QYJTUm4s5a95xb7yzaWu
         d46Dn2AGEEDVRfusozvqwfDU7IhtjF05FYPuemffIZMiISexu0ecgGj0BQejBxWQt4O9
         p6Ja1GeLRTdnVACFAk1IK41wfJ821ro33jxv+c8cHnfQK2AfnqGsl/Ft8Xo2mw4BAHYk
         BKew==
X-Forwarded-Encrypted: i=1; AJvYcCWcLr8aNBU6kRphD9GEU2Q+8DfvgOucHKjqBkTIzklY2eQ0JVpIsBFvDVCwcATGbhVkc86TjAwDfuDBxMqDIFxY@lists.infradead.org
X-Gm-Message-State: AOJu0YwDgUnUXD9xxGnv5mQgGXlLCMy6ftf+r8HjAJ11lwVl5DN8n+4U
	k6uK70Byt6lTdX1ePAc6A9URHCdOgz6KpP6l2Ip1P2Y364GF7Z3SYfZSvRpzMhnMTLNcLQsbwFG
	OVZql6etDkgM7GAYuflbrXx3QbqZqQa4=
X-Gm-Gg: ASbGnctmwqerFw1w2dnw3yvvmk2ugB1eXmgq1njJarA19BIGuUR0iCIYjfePvhtHwMy
	lt9AFltY7+qlR9sHaedHSEAeT6SpTlcpKJj7N2eljDr6H/2Pp6j54Nc0BpI5aFibolsVlzKH4zX
	ei/eeDtv4izHoXWMbCMTNTdOuVzlMRP8gWQ3Val0KfIhj/OPm2Ag23TpZQwZNRSOtcUjP5tpO9g
	zvVPaPT
X-Google-Smtp-Source: AGHT+IFk37z9A5OnXp4wGR0Qz6tmc2B/fCuFkSXnr4AQAOqobsq/8dZcTNp3FhmVzy9qfW4xwfMc32NUWauN7gIvh50=
X-Received: by 2002:a05:6808:344c:b0:439:b1eb:300e with SMTP id
 5614622812f47-43f2d445abemr977911b6e.33.1758633101752; Tue, 23 Sep 2025
 06:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-3-jjian.zhou@mediatek.com> <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
 <24a916ece6971d3ab9156dd8277eb23935e9cb13.camel@mediatek.com>
In-Reply-To: <24a916ece6971d3ab9156dd8277eb23935e9cb13.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 23 Sep 2025 08:11:30 -0500
X-Gm-Features: AS18NWBF4NguOxMN8xnesFe-YY3RY5n_pyTUQl_94Lw7IZuBIdJPh4k0eaZQ2eo
Message-ID: <CABb+yY0njdWUd=HWT1rSYSpNM9QoO_jf6piY9ny1enB+rZZF+g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: =?UTF-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_061143_428056_6B6C90DC 
X-CRM114-Status: GOOD (  19.10  )
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

On Tue, Sep 23, 2025 at 1:46=E2=80=AFAM Jjian Zhou (=E5=91=A8=E5=BB=BA) <Jj=
ian.Zhou@mediatek.com> wrote:
>
> On Thu, 2025-09-18 at 18:50 -0500, Jassi Brar wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek=
.com>
> > wrote:
> >
> > .....
> >
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +struct mtk_vcp_mbox_priv {
> >
> > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> >
> > > +       void __iomem *base;
> > > +       struct device *dev;
> > > +       struct mbox_controller mbox;
> > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > +       struct mtk_ipi_info ipi_recv;
> >
> > Maybe also have "struct mbox_chan chan[1]; " so that you don't have
> > to
> > allocate one during the probe.
> > Also if you have  "struct mbox_controller mbox;" as the first member,
> > you could simply typecast that to get this structure.
> > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> >
>
>
> ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see
> https://docs.kernel.org/process/deprecated.html#zero-length-and-one-eleme=
nt-arrays
> #81: FILE: drivers/mailbox/mtk-vcp-mailbox.c:24:
> +       struct mbox_chan chans[1];
> +};
>
> Can we ignore this error?
>
It seems single element style is deprecated. While we know what we are
doing, let us placate that error by
       struct mbox_chan mch;
       struct mbox_chan chans[];
and set  chans =3D &mch

