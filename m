Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23258C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FJoKkivoTNtHINOjagJJ4U0TVNQrepQ/joiDIuSwkg=; b=JZta1i3OW/KspSk3r4SG17WI/o
	IZW4rdkQbRbYOhDyXXrOXqYLrnJn0W1XOeaAgLircq44aZyBMuXsVpejVjFdgHljn6+6hX3HKfyuo
	nW6nx6mkxMCZcNOPBJT+V8sQGCMu+4VYp9tWPejj0Kh04GfF7YMDWEyy4+aLncV16QYlpRzPjU8eU
	FuzkddD2Dazx/CAEte7OR0SKqJxFgE5wI5rx8YIYA9LXoc2Cg8Pckxtd444t0RM/IdUiwHdB3vxwi
	D6iHQvgJgL1qoKAhaCILP1QH45E0snECLi38yUMu7KK8YWYqCbDvCMHhm+Cl4HPJNKNHPa9tro9Sa
	3SU1gG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qQ1-00000008IXV-152p;
	Tue, 08 Sep 2026 07:39:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qPx-00000008IX3-41oH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 07:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9FJoKkivoTNtHINOjagJJ4U0TVNQrepQ/joiDIuSwkg=; b=YRArQK5VNYmj6ynPIUod5EhkEt
	J6SBZghAN9aZffYdNtz0epo13PvUbvMGMBMilDaHODfpaBtg2WuVws6wN9krXbQOnMWzKKA9ev9is
	PpbhLQm3+MjTg2huxqDB+0F3CtqPUO+k1Zd/ejSl21OOxCfF9c7KX5Ht/gJ5CmpgauX4zWh0TMzux
	cgHzBQA/69nSSqj1nvZaFPY1BwigWxo9DNC0GmAdVqt6cjNyByjwXoB8tRqnDV63Zl8aze6ti7LgN
	WkXaSEJsibkNw5+aHeiopREdu0lRBpRB9/1DTfReIiRosHE1zb4YbovSLruMzMfbz9bzOZw2IrSXj
	/0DTAE1g==;
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3qPu-0000000H48z-4462
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:38:56 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73720e58dafso2910606137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853132; x=1789457932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FJoKkivoTNtHINOjagJJ4U0TVNQrepQ/joiDIuSwkg=;
        b=M3+x7q6YU5z9uns4ObaQaHjlcD2L7cgelQbx0tECqsHsWjIvohlDA8xeRJxJxSHx5q
         U9HqGIGi121eAW5LFO3PeqU1nPHpfmKbeU4SNRCWzaWqHpPkyZsCCwxBwrjckeQHoccm
         LRUPrEYe0T8DAy5owrwx27AC9uOm6c9LvsJF8ObeSD2V+Qnq9AKRdHm+nJktwIL+i8Zm
         GpH4Mf5FzNbcrurEWqoaL8IgB3DX2QJ+m/BkIcR9dUB3ua9V+yVvpS5SLlLRuPWOYsOu
         tc9TS5HzjdpTfaAmbY/vR4lhpd0DoZ5bE251PuqeHJI/hDWVzGFs4hfEf8Vo4GAJ0YQq
         kx/w==
X-Forwarded-Encrypted: i=1; AKwUvBwoZofe4q8iEfScKQE5iT93XWGzjqIICgkJHkrmjPkHC375psUeryIYtdom1oKHEX8Zg0WAlnoykiqA+vlQQn5r@lists.infradead.org
X-Gm-Message-State: AFuF++kzANo35SHOSsyLInADsO+S+SWBthiPmgx7uPuvF0dnpO8b1EOl
	M1Ils8LRMAIAvsgElHchHSsMi6dNHXgnrSZ9nyhNug2ygWmz+XIiDOwRU90RhJwn
X-Gm-Gg: AYBFou2GlF8oQdVF+dV0PA0YRxDv/A1r+akUpik+1l/OPm11qYyZR9t6W0P333uaXnp
	aEpxQ3MQfLln1VqszwxgXHqI9cG4RjwG+dHPdteULBpztMn+HAvB0Ap5av2lYs/wiqByQSYkWIl
	OhBcYKN6maeIY6T228h+G6Gi6MXyyXtecQBm6SQGzePqLTjqLkM+MnufQtOZbDwcdJRzbX6dAqH
	QVSRj68NunrK7xdeGjJAwvQOtISqrok1vPIvu+UR30fz2ndI4Z5EcN5YJ+8ARHT6vck0DrV0yO3
	D7jcQOOdAnoBoBZ5jFPAyopuL4idaCbu2oMPqXGDRSurVZAeblDavJnxbOA/cirxBPyFADVtGPW
	IrhAL04G6OdDzIIiN1FupuF5qI20P8idXvbc3koE8xci/IpSPR7f/9Tu0oP8ZGIN5iaLCgMT1x9
	7Qf5t1VjDeHukitJZNa51RPSvqF1GuBy1dejmPCZgAESYydIV3CSR0/HrlulHYLn0nHmn3ZOP41
	9FcPl80N5IAhOjagdmv4d4c5A==
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr11738073137.6.1788853132218;
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ad27bdsm7907786137.6.2026.09.08.00.38.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-782af6c753cso3885386137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByh8oGsWFspZhi4UrHBt/BVmdWyNL1/pUuCHHbucFO81zrurnT0mNaTH4ep/TSfWS0THnK+yEU98Eb0D+7UHkco@lists.infradead.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12540904137.3.1788853131839; Tue, 08 Sep 2026
 00:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
 <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
In-Reply-To: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:38:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
X-Gm-Features: AcwNN1W_wiXo_u_6vCxRFTrWJy-fQIHFj_Po8KOr7IuAmZBSsWV3hZnj2lA4-7s
Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_083855_175925_90705CDF 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, 7 Sept 2026 at 20:46, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK i=
s
> > currently modelled as two TCAN1042 instances.  Improve hardware
> > description by describing the actual transceiver.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only due to lack of hardware.
> >
> > At least the TI AM68 SK DTS should be updated, too.
> > There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> > ---
> >  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
> >  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
> >  2 files changed, 17 insertions(+), 21 deletions(-)
> >
> Apart from the sysfs file name changes everything works as expected.
>
> Old path                                               New path
> /sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
> /sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

