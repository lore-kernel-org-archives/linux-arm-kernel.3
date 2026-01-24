Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60FBD715C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=; b=vwsfGtxOrt/Dp3DBDfyhbovmlm
	d15jwJqmqbylKsoP1SeaybmX3egyB4lYI6GuA8BEGVPW5jbO9LV2nAPmbcD2yexiytVT0slmQw83N
	3Vj5DOGv3fjQM3auTlOYywxrybLUUMT5B9uoW5JzbMer0FE5i8Lw6PqoJm99lVKNYIsy6+uxzExLD
	D+a+vgbXxczpb4SLkFL0/zvxCakFXqPaWCkjkt5nPoDx5ueme1RM5bMe7dQP8x6f9TSkKhmSNj/zh
	87m790Kz1Mq/XQTuN98ylVCeyOoLRNlk0IJJ7KYVsewsI952Zxa3Llxug4Q1uq7NoCigj9Fj9JMuI
	Nk0v4HrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYQY-0000000A4o0-0nkA;
	Sat, 24 Jan 2026 07:51:26 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYQV-0000000A4nZ-0NAd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 07:51:24 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7d148dd16edso2526932a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 23:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769241082; cv=none;
        d=google.com; s=arc-20240605;
        b=fU8G06iN9QD5jfe1x7vIevDDB37bxwnsS7JkOCsFSEnwNPCK36coyzqToY1u4jUAaN
         sKnWL2vHFeK36P9d7/ySlAEJMXJJDz/I6HLA9Ynoev4YZK1QcVn6kuKlL6fgYPzP31nW
         D0PnPfxIiMEFq+Ukpr6ePximxtxN68a5CJutDVMm3RlOY/p4HigG5nvFY+fE2HDdRtx/
         zurP1UmgaxXpHOV29iu2zTPQXJqRm8daI3KsNz76XGOORmBiEaml34gDUL33ry8kRTkb
         Rb76k3p4DHiGFIlUq4OdJSjYz6ayWC3+ugpbK1e9IGoiI/jewKycS6R5ogTsxqU1Wqpl
         8wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        fh=PyltURcftGfc8aDTGjoBLojfolRlK27TL6nMtbZY/eg=;
        b=bxLVXCTOIashCp8o3UP9Be7YWgRSAXluX+kZfq/ETOZjTDNjUgn7yCWmF9AsFXlbAa
         HLozcM6A3aDBZR/hAecU2cDzWFFsm5UcYspw9V8b38GsqV+GGvi4PAggPgU4GqC9s/7g
         F8TwCoX+ARF8X3e3/mPqTwpgjvZEbJbx9+gFC0ZDW9LA6Xqr5Me9uf2h+yNVeca+EKlQ
         cN0C/eLh5YcdprWeiUZH7jCgdz2+5hg4gSbBJQiKE5LZp3b89wT0mQHc0pO9ynfyM4fa
         vL9oSXKhakIQjuEgVBinLf2677wjQX9fVHv+pINMsXyQSHdfqPPtx/SLa71tqjZNeJz0
         Jhfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769241082; x=1769845882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        b=XHDf4pb3lFFaLnCQXiE/hs3d1uUOWxTMBXbvLwLyOCsiHOfsVsQJDNKxeZQsphKYIx
         POcZ16Mn1z2Y7L2y4XXJ9PUFBXjkmQ+ro57/bI1Pyz77UsFYkTXTUgKLGDvemY1Hp4+p
         6qbRQ+fcgjh/41Dbg6dOocFwMQXmA71rvcWQL5nHxTwa+6oC9k/+5c5amV+B1gCjMoIU
         WQERS86zlts1sO9BLL2M+MDhOQqQ0Ms3S7KjaIILOeIg+AL1deL5MiLKo5q+uB3HJIZx
         bop0cL/OgvDHBi3XWB4yQ6zRCGqrtvEbOIYm3Og2AiTvwCFVPJhXio9ls/NyIi0ZsJ4u
         7Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769241082; x=1769845882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        b=FKi/D10VodWWq4SmvJibYbfGusn1Phh/iUyrQ1PoMVKA3KQmoLj3cGYfLK/wZk2/xV
         VE8QhXp4p7nc41rCPX/6lR2q96K8Zs36Pp9WFjyIqwC+kFXz1kr6tu5tanUrkk32sYCw
         slmVSF5+O8fFVMclTrYf5SfQDEhx7f4VmCPBCKpjXP14jOuS2522966N1f1KcTyHwneC
         t4osF0Vk0tGebggTSxr3xYDpDSszbli/Kf1Uz5EGYOKpxrbfQhxD9C3eczd69O2NpQ5n
         OJFNhS3LdWk+MvC0Vh7hI0HkENUdzQHqV75LpAHyGl9u0HDCybCL/HWCR24ILif+BYVr
         GakQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfRrVuu7HrRUuaxG41xR6Y7xzrZhNvhZDB78fNuRuOQqKEfDA027vVlMYDlLiDowjCLnfMU0RRrFo0TF+PMTYT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgi9aoEwX83lKT8c39gq/B7KGTjKbkY17DvmoCRlMq/a3vjYa2
	X3oK4BtYGUEGrQsuG+T/rKe102mJEkv51jR2+a890eFsSKPUdiq0dZBFtEPXuC+l+pcfGN8uhoL
	rVlbtRLIzfI3h28IGYi2utYe74ax/ZYg=
X-Gm-Gg: AZuq6aJgYS8h3NfsbvXDraZzoKh7DWnhpd58HJMvHNOyxeIwxqURZ/OAQq/DtBVvUSh
	5xT74+n2WZkXHdOkVd5tHL9rk93ICXxSULW5aPior9gaNpJ7jMN6Moz4WHVGCzURXsCFRPlK6tO
	z1UN/3bsOPG7/tKJmA1B1Iu3bUi3FBK387mgUSL2wYl2KITd2NcEFyHoUZhW5BAigyF4Br/dtoj
	2FqoPfCf6Y+z8o/w27w7hLY0ot6hcJchjURC8MRj8jFqvPcIyQCi08V0o4YetNmBRhiCZaR
X-Received: by 2002:a05:6830:2813:b0:7cf:dd0c:2ba6 with SMTP id
 46e09a7af769-7d160b75f5dmr1749708a34.22.1769241081694; Fri, 23 Jan 2026
 23:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20260123153108.19204-1-sef1548@gmail.com> <20260123153610.GB415966@killaraus>
In-Reply-To: <20260123153610.GB415966@killaraus>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 24 Jan 2026 15:51:08 +0800
X-Gm-Features: AZwV_QjLPNg70DdGm5kxku022oKvcNcnWP5Y0OSlkS426TMHf7tJQBcfDugGY1E
Message-ID: <CABZAGRFnWAyqNUrLF2e5QCM3euGiVxDBCgucCmJw=BJyPqic6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info output
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kusogame68@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_235123_176194_44BABE16 
X-CRM114-Status: GOOD (  21.24  )
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

Laurent Pinchart <laurent.pinchart@ideasonboard.com> =E6=96=BC 2026=E5=B9=
=B41=E6=9C=8823=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Jan 23, 2026 at 03:31:04PM +0000, Nick Huang wrote:
> > Refactor dev_info calls in xcsi2rxss_log_status() to use the
> > str_true_false() helper instead of inline ternary operators
> > ("true" : "false"). This makes the code cleaner, more readable,
> > and easier to maintain.
>
> That's a matter of personal preference, and I disagree with that. Please
> don't post this kind of refactoring that doesn't bring actual
> improvements, that's not a good use of reviewers and maintainers' time.
>
> > Added #include <linux/string_choices.h>
> > for future use if symbolic flag printing is needed.
> >
> > Signed-off-by: Nick Huang <sef1548@gmail.com>
> > ---
> >  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/=
media/platform/xilinx/xilinx-csi2rxss.c
> > index 146131b8f..e0c5b2ceb 100644
> > --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/v4l2-subdev.h>
> > +#include <linux/string_choices.h>
> >  #include <media/media-entity.h>
> >  #include <media/mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> > @@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subde=
v *sd)
> >       dev_info(dev, "***** Core Status *****\n");
> >       data =3D xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
> >       dev_info(dev, "Short Packet FIFO Full =3D %s\n",
> > -              data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SPFIFOFULL));
> >       dev_info(dev, "Short Packet FIFO Not Empty =3D %s\n",
> > -              data & XCSI_CSR_SPFIFONE ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SPFIFONE));
> >       dev_info(dev, "Stream line buffer full =3D %s\n",
> > -              data & XCSI_CSR_SLBF ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SLBF));
> >       dev_info(dev, "Soft reset/Core disable in progress =3D %s\n",
> > -              data & XCSI_CSR_RIPCD ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_RIPCD));
> >
> >       /* Clk & Lane Info  */
> >       dev_info(dev, "******** Clock Lane Info *********\n");
> >       data =3D xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
> >       dev_info(dev, "Clock Lane in Stop State =3D %s\n",
> > -              data & XCSI_CLKINFR_STOP ? "true" : "false");
> > +              str_true_false(data & XCSI_CLKINFR_STOP));
> >
> >       dev_info(dev, "******** Data Lane Info *********\n");
> >       dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
> > @@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev =
*sd)
> >               data =3D xcsi2rxss_read(xcsi2rxss, reg);
> >
> >               dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
> > -                      data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> > -                      data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false=
",
> > -                      data & XCSI_DLXINFR_STOP ? "true" : "false");
> > +                      str_true_false(data & XCSI_DLXINFR_SOTERR),
> > +                      str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
> > +                      str_true_false(data & XCSI_DLXINFR_STOP));
> >
> >               reg +=3D XCSI_NEXTREG_OFFSET;
> >       }
>
> --
> Regards,
>
> Laurent Pinchart

Hi Laurent Pinchart

Thanks for your reply! Since this refactor doesn't introduce
significant logic improvements, let's stick to the original design to
respect the maintainers' time.

--=20
Regards,
Nick Huang

