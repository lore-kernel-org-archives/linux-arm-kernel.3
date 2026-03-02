Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A73EB3624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AyTmtGapKV3ZDBpXl/zEatvMugJVMPsu8CkfUGOdnk=; b=ravqJGQl2rQWXmOaPs1UrteZET
	cpncGw45TY2hjwK4GGRGO51QYWrf/s6351HfloIWND7a7ozJjRXSowLPCfBqZSU/nve/k7srWRgBH
	+l9z/Quep9ITggclhQ82HfXfD10PvKalAGHvKHBOX2Rmp7oI6NC1Ppfe5x0TT8m1LCICs2QAiLsUx
	nkzJKJmZbVNT9PAYbYoG+yvXoFCJxAeliWB34LGZW+1g73krQKH5B36UmwzkgRslgD3jMZfjCtacl
	0nA7uudAEYQZrSs7jWig5kEMn4DDnksERrTaluGsBKVmO6sGQ4XRIawjwVszb43nm4FqQwNQkx3W5
	wWzUfdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6uW-0000000DZvi-305a;
	Mon, 02 Mar 2026 17:18:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6uU-0000000DZui-0LfG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D95144561
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4191BC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471901;
	bh=+MqM9KmRITyYRwaK2vO3M8KAYNBFVTYRhLwmb87Tibc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kb3Nqe5RRQ6fZzn0hWpidUfbL2ksozo7iqaxctiNEtWQg41IQH7CybnHljjB6FoYE
	 tSqIamkvZDxigySxPoGdI/0koM8f95QpBE1nv/YQ6xf+CWYKIwIQT17nJnZKj9D1uU
	 gHmiMDtDSr6R8cgZGprDUbS0MDKyrdTvYRBJo4AKX5I3FqPu6dPUeUdM6EfGSah9/c
	 K7u5M5qykk2BStQ3UsxRnqWs0FXcuJhgCnawQcW6y5xsruO5RS0j4A0zGSRKHHFd/Y
	 ixHTWvP+28P17nLzxy813d5t+NivpygbdSHdkY8Wb8aGpAKPaQEClVjIjgG5G7dP4G
	 ZRjj3CL+wcY0w==
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270ac5d3efso4489250c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVm5PqLt28ArMyR5KfK6zQa8505DzVSwHGz7W6j+FnSk4bKeeYkaMAwHTuRFRzUkQcWg4iozrGpiCp9Mkdlevw6@lists.infradead.org
X-Gm-Message-State: AOJu0YwJJn8zbStCJ1lynLXgIh5SqmFKaKRpnvx7I+7z1q/RmTbXHFxL
	j+dqGCAAqnROQ/F5e4lOSvQwFlEa2bh3JnO3Q0FLYXw0XiTkiT5LCIwSYXRnZPFOqZ9DZbhKWq5
	ZmtPWfXHVPMGUsNsBTO47Mvwp8ehzH69HrhHmkGrs2w==
X-Received: by 2002:a05:7022:2524:b0:11b:c2fd:3960 with SMTP id
 a92af1059eb24-1278fbff709mr5725970c88.28.1772471900307; Mon, 02 Mar 2026
 09:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 18:18:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
X-Gm-Features: AaiRm50zY2ACynZYq07UnZgsPpbD86ujojZTOhhFyYjI7hbWVv0-GS9VJ_fMHck
Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_091822_160588_C7834182 
X-CRM114-Status: GOOD (  25.64  )
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

On Mon, Mar 2, 2026 at 5:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
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
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
>
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
> >         if (!match)
> >                 return -ENODEV;
> >
>
> I still find it silly to add a call to of_find_node_by_path().
> In your reply to my comment on v1, you said you don't want to add
> another helper.
>
> Currently we have two helpers in this area:
>   1. of_machine_device_match(), which returns bool, and tells if a
>      match is available,
>   2. of_machine_get_match_data(), which returns the match data, if a
>      match is available.
> But there is no helper to return the actual match?
> of_machine_device_match() would be fine, if it wouldn't cast the result
> to bool...
>
> As there is no cost (binary size-wise) in having the helper that returns
> the match, too, I have sent a series[1] to do that. The last patch[2]
> is an alternative to this patch, avoiding the need to add a call to
> of_find_node_by_path().
>
> [1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
>     https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
> [2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
>     https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772=
468323.git.geert+renesas@glider.be
>

Sure, I'm fine with this patch being dropped and your series queued instead=
.

Bart

