Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF0EA4FBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+Cpj50sruElmHklNhyHuwozFbgXojBuiZpoYG3iicM=; b=fLwLIr63yqq4b05Y27YOqr+MvY
	Z+rdHLcB6g6LTbohoEzKYwxT94pchLd6VBUA2e10GaJw5JHiy1+dRzD+hyM5z2hyNFZxUh5KScNRW
	VEOYvSAjKP3jT1jTAkPvA8EinTtkoGPRDhnPliTClvZMRCRlV6Te+YBe2OdAGc5scYtrhiZhUT5yQ
	F3ek7wXT9FZQ9W/lYFQcPVyu7dc/568I8TNAyFqbh1dRDtoeO/XQH7E12yLNAVtQDnc6CoX/ZV+Na
	w8i3PKHs/BH2HWqDnn9L9l/VzqY9o/0AMtHSleBp7WwrhdWHKzK1qLmbdeDcENnNlNGvTYdoEg7/S
	S/8wZLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWGL-00000000PAT-3wfp;
	Mon, 23 Feb 2026 13:46:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWGK-00000000PAL-2jlw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CAD960103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6517C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854371;
	bh=xHD4QsgF9yMDfM9DNpu+nmQETYKEDBFK3tSyRcSPFXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GEhfoMxgLPcp6nwBkt61gmLigCTkVgwWzwT0WQNgF2v2B5l7cMU1ELQLt3YHmIdBn
	 5SAQ9FzxXxdkTsua8QRJaj+XmvK4QG19qdTYwSzCjypit9H1KiTPwRh7FtCZ6tkqcX
	 WXpeV/sajncXIUIIM0tJHwJ+863yKm8QK5ecZ7hYMEBA+EhmHfW947NBkxOv/P6+k/
	 5GU11vmBKyLibQb0nd9eewN2w9Z4NQ7gR1ADROg8pSR6Ed5Wd9ZTSFn/kjg+XTxOHP
	 BfaZYFe56E19NFL/uM6za8z+9EKP3PS01Q5PvG/36tELIOBRvrtFao503jbbYj73m9
	 ywb3HTeKvIDsw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e62834439so4862246e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAOqazvYOh1UqD+7G0DbuHDvGDPs+HiGfIm1UwJ07y8hbpArv3G9vy/8jrGT+I5uy+dSy0mseXcvi4dA0E/u/8@lists.infradead.org
X-Gm-Message-State: AOJu0YwPu9iL6hKeWdez53LfUQl+/nE0JAQKaKwlYwj6f8cQw2PJg63X
	OrbXt+IGXnyea4xb7KfapDUTNJMFiQSj67LwGMcw5Q4fBFKR2WLi1YRyCJWKyVBBoiBffNhM8jp
	dH957mtWIBnSnIjcwpvUEkgmDAqmh0KFIrAavcM993A==
X-Received: by 2002:a05:6512:1553:20b0:5a0:ef6b:f613 with SMTP id
 2adb3069b0e04-5a0ef6bf704mr1540983e87.1.1771854370177; Mon, 23 Feb 2026
 05:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com> <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
In-Reply-To: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 14:45:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
X-Gm-Features: AaiRm53YdoncmLlrYwWxzOjKhAAi91ZYzJ0VCyHsDsiPleMxR8Z5ZNNGKc2eDc4
Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
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

On Mon, Jan 19, 2026 at 8:25=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> >         const char *soc_id;
> >         int ret;
> >
> > -       match =3D of_match_node(renesas_socs, of_root);
> > +       struct device_node *root __free(device_node) =3D of_find_node_b=
y_path("/");
> > +       if (!root)
> > +               return -ENOENT;
> > +
> > +       match =3D of_match_node(renesas_socs, root);
>
> I am not so fond of these of_find_node_by_path("/") + something replaceme=
nts.
> What about adding an of_match_root() helper?
>

I removed other instances from this series but not this one. I don't
want to grow this series with even more new helpers. How about
addressing this separately?

> However, in the previous patch you used a different strategy:
>
> -       if (!of_match_node(imx8_soc_match, of_root))
> +       if (!of_machine_device_match(imx8_soc_match))
>

Because here, we really need the match structure later into the function.

Bart

