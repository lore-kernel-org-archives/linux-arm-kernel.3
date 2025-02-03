Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23103C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oal2aMH2hPYfw3LtDtrd7q3DEM09V7WsU6DrXT1jLCY=; b=i4DXmEtdOf6yxUcN9vzJUhkPo4
	Gbp6ZQKeebCOk6Azh/o7/afRtK9HQwxv5Faa/KAg5DPOBEpa87GvGQp8hAGPJNOl+oE76G5Qd8Ti/
	7W2fnaiN5t1bQ2ubEKT/gc1RtoAmcW429XnK5BkLM5bq/RREyW+DISra/aE1LTdKMTdYoLj+btfgJ
	1JSqoG4amTePckfZ3T7UA3mKpnnN4jPzS3wRJctNHhXQfqSdPi6ba4mxGJNFQK5B8KZUzmIzQhpsF
	GYHxxd5AZ3uzz5Pgx/fRjtLciNYGnIUr1tEg5BtV28zv2G03DlGIl0l+mRkSqXYtGHRDiEg4m3xVD
	lA63a0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3w3-0000000GeXu-2oDY;
	Mon, 03 Feb 2025 21:24:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3dz-0000000Gbwy-0htv;
	Mon, 03 Feb 2025 21:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7F1D5C6939;
	Mon,  3 Feb 2025 21:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29347C4CEE7;
	Mon,  3 Feb 2025 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738616770;
	bh=cBsOd6wcSiVV2e1fytZZdNGIp2DUe5yMg3BzjkT0Yr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lN0NurEP59jw3KFihk3UbtTdOqxRtqK5UFsYGY46T/FDOIUUOGEXuY5wOgZrFnfyC
	 Yop1IGJDUrXUuZnuQxWXBF4Ifxr+rq9ms58p7eR2x5lW7B/iKbbxc+OrpSpFmgBLIm
	 b4JwC4pIQ1La+mgOAMowI85qTQxRlZZZo4lZb6+2d37uIZzmF8JCzQxaeMz77O0UWU
	 n8Hms12AU1JnJvdBRI7G7USTCO5Y76axkwKwNKI2sklF42+2nos7xR2M5DbaIgn6p9
	 m6NV+ESbC7j/m6FqLnkt0oc4P8WNGg/XAPoRIiBrgpRuPNdk9zHUwCLaeEoIYENAjI
	 n/bxcXfFKO1oA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso5570703a12.3;
        Mon, 03 Feb 2025 13:06:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYW9xjGZJyBth/vWNkqdOat6HXyWVysJc8VXffg5H/k6vVYQGv4vqvZrfDVLyJzdQhrJ4I9R3Thonu1S+p+h9i@lists.infradead.org, AJvYcCUrWYBTw1CPnuJfxofnRm7RK8D9R5aNteBfTxaMccMa6SF2tFa8n6r59/XJzT91iT1eOoEfEMpgzLFJpU/+R74=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+/Bg5acEm0dbKaYjvaXf0I8+omL1vgJDXNQWlz5RA4FZmk81D
	Fh2p0kgBbgm4tYGx5e3ywDcah2KwdmgejGqwrLJzHoIv0AY7tKnNEt/b3QAFYzn9ZSYq+YrmWqo
	P8kyWKW7L03stEJDGWy7nAjzPbw==
X-Google-Smtp-Source: AGHT+IHeWZHdJjC4YN+OOJHAB8++nTLMgl7MUL+pvf+VvcXzFyBuc+YptThIQgLhGlBcwS62U/h/TbXO0dgmymUExPY=
X-Received: by 2002:a05:6402:274a:b0:5d1:2535:84d7 with SMTP id
 4fb4d7f45d1cf-5dc5effb1c0mr22570412a12.29.1738616768432; Mon, 03 Feb 2025
 13:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
 <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com> <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 15:05:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
X-Gm-Features: AWEUYZnrMYgeFmznny2afQJcB_ErB5ngAuWrI9ehgUSHGdkfF9dpCy3oKUhDEGQ
Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_130611_305388_139D32B4 
X-CRM114-Status: GOOD (  23.55  )
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

On Mon, Feb 3, 2025 at 11:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Rob,
>
> +Cc relevant subsystems.
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 03 February 2025 16:53
> > Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
> >
> > On Sat, Feb 1, 2025 at 3:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > There are lot of drivers using of_get_child_by_name() followed by
> > > of_device_is_available() to find the available child node by name for
> > > a given parent. Provide a helper for these users to simplify the code=
.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > > ---
> > > v1->v2:
> > >  * Updated commit description.
> > >  * Updated kerneldoc comment block
> > >  * Avoided code duplication by using of_get_child_by_name().
> > >
> > > Note:
> > > grep showed the below files will be the users for this new API.
> > > I will be updating these drivers once this patch is in mainline.
> >
> > No need to wait. Please convert all the net ones and send this patch wi=
th them.
>
> Thanks for the feedback.
>
> Subsequently, I have send the patches. However, Andrew[1]/Krystoff[2]
> mentioned me to wait till this patch appear in -rc ,
>
> Can it be fast tracked to 6.14-rcX?? Otherwise, it needs to wait till 6.1=
5-rc1
> and other patches will then appear on 6.16-rc1.

Most maintainer trees are based on rc1. So are you sure everyone is
going to be fine with a rc2 dependency? Generally, new APIs don't go
in without a user.

That being said, if this was 10s of different trees I'd reconsider,
but since most of the callers are in net, I'm less willing to apply
"not a fix" to fixes.

> [1] https://lore.kernel.org/all/96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn=
.ch/
>
> [2] https://lore.kernel.org/all/7fe9dad9-85e2-4cf0-98bc-cca20ff62df5@kern=
el.org/

It's not like they are saying to do the opposite of what I said. If
the dependency is not part of your series, then it needs to be in rc1.

Rob

