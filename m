Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80583C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=; b=3Sg6414XdvExUw4Kjxy1j9skCs
	rCjPm5iuaR56Bevm4BcisidFZDzW8NKPX6L/dz/Prl9XZJiSQtTzNGJjhxDhuKIe92VtASnX98FQR
	yNpNotaZSgCChfdR1jW+oQQRhEB0DJLG1OEzI3Q0ZjldN7wxCsp5LdgPDCVZiVKYknfmyu2cY4TeU
	g+s0M+RhKfTrUYvbwBrj8E60PQEFQktE3RbNEZA7BJCyL8E1EJrYiUNj+bQvFUngJ5f94XUiZ5ozd
	btrVUOBycxch/0VVY08i0JV4awvhNndRKC2Zi5vWR5lQWPdf1JHodSRKrFwMDNtWtZDlD7jJ/oW8j
	o+dJNA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XA0-00000002nr8-1Ync;
	Fri, 04 Sep 2026 16:53:04 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X9y-00000002nqK-00xU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:53:03 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-78a220b5778so1083671137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788540780; cv=none;
        d=google.com; s=arc-20260327;
        b=KXA4HTNhwLCDVmLULNjCsgg/ZuclOVivwZp5qyJl8Ds8rqR2naThFlEEt4GkkYJN+Q
         XRtg6nCFo8RMQd1VFYXjcdboJshM5v6JZoGuGvU5IXnAnFv+b6NMz1FOiwcfvvJwSkSt
         mZp7nTE5hEnK6cE4NbewHFuRQ9dZ91X+PmbKWQuHN/F9YETP+q7a1dt6xB179QueEkfn
         2hbxQMeC+J6SPJ57JeqC4jCaV0+NpfNrFZ5ETjgRPvjBvJ534D5jEZeq2fLsV83knvPU
         YH9ZJSpW1m5pirmgu4xsIe1F0Skz4U8EPC16yKyk640iYa8+v1jhNxZhPix9Qzrl1jQb
         BlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        fh=31JmeCugydzyHHqWfFD2fYbaek7sC5XcNANSsRY3egs=;
        b=b3LTO6wXMtbdidIMvLiCwMGv3UNxwBgX9h2RaHjdfOaiBFq29CC1o0jpeFaZfDfVlM
         KiZGfWaoGMzimRxpdNvUp3JULi1yNWz7RUHIwVJxOe6+aLHtTTibtUVKrU9sLrZ6yS8M
         TXdAX/+9w48/W8q5SEOYryDVluBWSe6Xv4iYhuNzjJr8Rd/SF7lubZBPsrp13VTaovx5
         oULyQb3dQcqvX9mvhkD1U1Wl3X+XI6OUXKDXg2HMmGUOE4vvZkCyhBLhUF72oPQ7GC/W
         dXASAYXgHR9zexNaZVIqPchWC93TDVW/PrOulwpCq72iDO3e4i0eNpxQ7iaP2cc+K0Jw
         FzVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540780; x=1789145580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=spfIwYV5jt54i+wI3gH7r9S2tYaRwMVGhke+FQXWx5D0iWaCXUqBmMdm5zH0qpiE0d
         9ukYhY93qPMxgOzSrKlettpig50dFQ8n5wqUwQqQWf/9i+JK8394aHfcozOhhQwQ6vs6
         K1g591HTI0bfmn5ftsGnxZ3qKsDHDIojtKDP6ZfISsH5v0gTpyvBqG23PDfDUaVR2jf+
         JQfEQIT0llj0xtk/uRwCWZvpSHuGWIMGlKrAf4GHE63hMGioJfmjCz+Yk+YjDRK/UE0d
         TLjm30MWacZ10yd4RxiD5YIDZjGf+lokUk6zdbcOrf/pDZG8gkxC5U6uz4Pn9svla7Uq
         /1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540780; x=1789145580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=pMsr6gbMedhMNUS9Us+KVfcF3U19BniNZl5wfIdlbV3UNApzu8rH203WH0jIDAhcCp
         HQGaNWJaFdubPHEGdSaJw84vL7WkmYd8agiuLu4ib6hWL2l27n9ig39iXB0ZGexFBmXx
         cL44KwSNGWzKv/Ub3bqZIux9gHvveA6DT+3EPsLHDB5eLuXYGBgJJydmfrwDa2EzfFJM
         YqkHW98dBgm1gBDLi5kVyRp+SulaWX73+ot0q2RtePzmp8qubXI0DRLo/ZmFroc5KeKM
         EqDtbdB/7RcYP4vdPGonZ32VjkpoBuaKlNv61NimUom3Ph0DyQBIPoIWG026pU9aC+d2
         JiJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqvYRliKKUKUUoIVyDAWiO8n1KVFd4o5Gx7Xhph7zckORlqCwQLhiuWfG9fkFEQsV8Y5ZX32AoA9Q/mqGrKO7h@lists.infradead.org
X-Gm-Message-State: AFuF++nqaOlXlQkvuHXoxrccSomlZOgY3NllvxQTnJFv4FnSI0wmaTtq
	VaWFQ+uLCxGVl4I+MDbJvsB4mMGbP3Wk0eg+23gpJ+pZgtOJ8pXpIottW3fkUA4HEJl8hXv+/74
	OEXzc2o+Pk244h1/VvM56Lg8mB9eqNV0=
X-Gm-Gg: AYBFou0wedL2xvDS2RmQbDkpEkJEtUE1QDTwXUHl5yFR9nViBP5acmi3ZhyKfxFMv54
	Wcqm6q5Uncqym6GRcvfK9PpvxQXbXVfaAEFcvLbbxxvN/lvFIhDP4wJttg9yhLLIuDVSrECIPj2
	frz0SzoJkwoC1+dMQh3fQQRn2dMGzD3Twb4KwI1/9r59K9mtXPRFSYvInrxji4PPEd9akOf7b2y
	oDIXvr+iyDkiZY9VRLwMO9SL1pE81LILv8mBSNnTS1ZB1DmNsBqWG985acOOgdDmlb8as7/DfXz
	FW6cgtTVN4co/G9hY/z6CZUSHbj1nLO1P1bW70h+BCutLcezYKnXaxPQ8AUQnA2dvfLOrcj4UX4
	fR1At7iV9mt364twVGS4vBrKpKmQgt19TigSZ8hK4hFtGJ5hqJKhcF14EHRuD6jX64BmagHoBMv
	jBOLse6hTWOaTIEbcvAcMvOhRmhr93FOGZIPuWDQ==
X-Received: by 2002:a05:6102:4b01:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-78a4a86b686mr1500572137.6.1788540780511; Fri, 04 Sep 2026
 09:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260811060651.227431-1-james.hilliard1@gmail.com> <87ecf911jr.fsf@bootlin.com>
In-Reply-To: <87ecf911jr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:52:49 -0400
X-Gm-Features: AcwNN1VzoX6Wx03j6h-GsWo7X9YwKmv-DqDt9ZWJFHiKu2jY-uxo82M8zbL9kdI
Message-ID: <CADvTj4p3kFN+4NeeouXscPrnHTWKbauVcYXnh2uW1OGHUL_sbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095302_046482_07C0F4DB 
X-CRM114-Status: GOOD (  27.06  )
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

On Fri, Sep 4, 2026 at 9:25=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 11/08/2026 at 00:06:48 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > ECC maximization forces a 1024-byte ECC step and divides the
> > available OOB bytes by the number of steps. A NAND with a smaller
> > page therefore produces zero steps and a division by zero.
>
> No, steps cannot be < 1. If they are, it's a bug that must be fixed.

The zero step count is created by the Sunxi maximization path itself.
sunxi_nand_hw_ecc_ctrl_init() unconditionally sets ecc->size to 1024,
including for a 512-byte-page NAND, before calculating nsectors.

The controller attach callback runs before nand_scan_tail(), so this
division happens before the generic ECC handling can reject the
configuration or fall back to software ECC.

For this case, would you expect the Sunxi maximization path to retain a
512-byte ECC step on 512-byte-page NANDs, rather than selecting 1024 and
then validating the resulting step count?

> > An explicitly configured ECC step which is larger than, or does not
> > divide, the page also produces an unusable step count before the NAND
> > core can diagnose the configuration.
> >
> > Validate the step size at both points where the driver derives the
> > number of sectors and reject invalid geometries.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 45ccbce91551..ad314c0e30b2 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_c=
hip *nand)
> >       sunxi_nand->user_data_bytes =3D NULL;
> >  }
> >
> > +static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step=
_size)
> > +{
> > +     if (!step_size || mtd->writesize < step_size ||
> > +         mtd->writesize % step_size)
>
> I don't get it, mtd->writesize < step_size is conceptually
> impossible. If that happens, it must be fixed earlier than that.

An explicitly configured step reaches the controller attach callback
after the NAND geometry has been detected but before nand_scan_tail().
The Sunxi binding permits step sizes of 512 and 1024 without constraining
them against the detected page size.

Could you clarify where you expect this invariant to be established:
in the raw NAND core before ->attach_chip(), or in the Sunxi driver when
it selects or consumes the ECC configuration?

> > +             return -EINVAL;
> > +
> > +     return mtd->writesize / step_size;
> > +}
> > +
> >  static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32=
_t oobsize,
> >                                       int ecc_bytes, int nsectors)
> >  {
>
> Thanks,
> Miqu=C3=A8l

