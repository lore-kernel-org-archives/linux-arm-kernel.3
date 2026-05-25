Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B90ACD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 03:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=; b=hJuK8sUYZ4dKHQ0gP3IdksSgw5
	oUmpPtOyiar0RSDJ0CY/sUuVQwZSYgeFjEiihOHrq4OLMzhIiVTuWozELHgoJjXkZaXc0xFXLJGW6
	69E/CqaOjRV/JllhmVmbc6+dzkxXWz9LERZcz6/lzNXqSRZ5LsPLAH0sXubOWVsS0H+4EE9OqPTAW
	gFs6h6sPrcayEpd533Q0D4R/O4eHwxpVXWhq7iPskom0rqNWbjXXy9ahTcgjeHtUg0hbOA7h3h3LR
	mF0sZpiACNiZ9OGN1hPGHexPjMc+uuP9ikMxXsvaMY8nkiMhCS/WJaC0dmYJb9RGrO5Hs2HaEBzsB
	VusvD7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLxE-0000000GBhx-1zcJ;
	Mon, 25 May 2026 03:26:12 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLxB-0000000GBh6-3Odr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 03:26:11 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e612d0693eso1880011a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779679568; cv=none;
        d=google.com; s=arc-20240605;
        b=hi8fsqAe6RsKKgJHdb9miHL1I16h3Pi3bQkvdVeAK0MpD9OpwhVbFKBe//PNJ6YYMt
         mV2R9szOrYh7vEaXmgLKT9UoBg4slSsMwu0AsoF846FeZtUTxqRn25ks5VjprTtA+EN6
         +IL6Y/rHiOnWtXZOX9KGM6jhIJ7XFQ3BS+O5qHeuS5UvcW13PjrvsIsmDmOrhRiXQAdB
         hHRAZHPbQSXcjYPM8/+EYZBtM/rSwm01U4ZvHjjk0rGn5d4HkU1eWzae+0AvKYTbKh0e
         7uHNPZU4u8NPtbaFR2A1fDgsibdFMXB+9vk4pMxtexxqq2exZsXoPZE9U1IYice7gXbG
         63VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        fh=OBiLJ6ffZaRr1yETO60a2ZSbr6xv045kG8mDzR4dkXo=;
        b=X3vbvqHGA5OeS81zlXLEzOCG+IPAEOsKqhZbhw/eHKSzHQt07U2ISDR3RFSGEvSdiZ
         KjDyIs3bCme5vh+1x+PcKZXVo7WH1uy+Tp/A5KE9Il6Z7zhbff5dFta0/DRwTWhl6awa
         07EC535AaoDlhyK3C2RAHn56Vku/X3pDKPQzyDfwCdMBhjUP6juAoJ1dWWNgBnd376ry
         L1hUgXlB3YYz115rCarXdwZAJcPc02Utgi42xKnWQP6i2h5vGgGTv2Ededl+Vb5iL/E4
         vFEjmsDIlBfWuuh2tYAlks2Pf6g7jbtVoCMv4GG1+vr2aXUPCcG0CTncvtEGR328GFNx
         8VaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779679568; x=1780284368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=XWwrnsJugVCEmehETZyI7D4Gf6qXQZNiefe5JBKRuJY/hzEpqDw3l2+cCw44eNZYlS
         Wu3j3w6FCrUFm3Uxfy+v0Cl8jc9pUpwpgu0o08ma5kJiEgwsqjR6IoViHierf7cWwZLL
         Nm93ObIKapAogpIhLBggYkNRMK9QDR0NWhSYiRPrAxoJRMFKevhiN6eeY2Hn+dkP+zx7
         6Cvwfybe40cvZG8mSs/44wHqip9BcLLJtmnuCkOnCpjVLT0USlYdRKUtVx5DvajODIqp
         RlBoBz/hdFkQgh3jYdR60Po9jp601uriVdX3mMHDmCWQszrH0vvMFmNt38omkVXlQxHV
         lfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779679568; x=1780284368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=GNBQgxT6HearXUhuKOtJlfIs1n4hxpa+vB1SWiXcJgQItpaxEUn4vV49N4Gg/5m5sr
         6hxbRJ/blq8QETq0cKqLuJgo5zB3qrHB8LZSbCvuIUotVAc3aUDGmaMrTAYNcKC8lEY2
         +jd0UvBlCozY7s6bgU/zgwCAJiE6JFQphDOOSfW398MhXVJnPGuMFgDgc91bvfrrVdxK
         5ACmnd/mpC9MJPd1qbiSbK/6EEHl/ywtRrEC23IebMKqSgoh3Vsp2SNmmF0+Oi/H+WMc
         T1LS4smWu0p6qRaOGIp55ly7Oq1sAe2wKwKQzSnw9abz+GtFAsgufU9dzrGNXeCsjqbm
         +wFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rd3qyllR/BvttbNZiDkiUAzTuzVSq1uWeIs6OIzhD7F5AWD9c6zJIdbDNc0Pn8R3KCg78lrkg29pQIxML5nc7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XbPK9/IC+D5CR+fNQ+BQMUNsfcm6Wyyjo/NTGMAbx3n+fEFC
	aSFpQKhgnagCjWTxKMXa72+N6H1kPVSJoNWelvS6RHuA96B3kVt0ceRkYWqJ3zMPnhwRSNxS/Pc
	5cSvemf1zJJXe5DepiCNvyp6oEeRhgKA=
X-Gm-Gg: Acq92OF9zFPGk+cVHjuv2krH8a6w9Majv/xvvq2XG9JKLSQu5sHi+rdeiOAEJzGWK1r
	0ZZgGX22JKWQvPd+SxCa0kElr1TnSjyvRstkSNXQskD7LUQllj6PZOZWlBFXz8OxnEYWTCF/tgy
	wRWSTnCVA2HCUsoXaM2JtS+aXXo4pQVPESvkUGM0Rig04HDLZrToL1tC7c4Fn75Y2K2yPrG2aRa
	PKJFM/vMQKGXdXKUdDSrKGsajuKyyQFP8NT+sT9GK6ZWCSBGweioc5S2IJy1Z8aDVBSBlOH2JG1
	14AjOZNJ9th+m8+Dplje6xbJvjXnlQVi8QOGeERkosE44SUIwsI3XgwIkfzoGsPvnhrc
X-Received: by 2002:a05:6820:4b09:b0:67e:2ff7:2a6e with SMTP id
 006d021491bc7-69d7eb501dbmr7243815eaf.18.1779679568125; Sun, 24 May 2026
 20:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-14-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-14-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 25 May 2026 06:55:48 +0330
X-Gm-Features: AVHnY4KUuBcGh4fPuvaF9wKJBQKBE4TDK2MAAseg_T5QDDf0jB-H1zPi4i_Lwlk
Message-ID: <CAMxPZkjfWckb89HeZ1aZU6szkvfPm6J20HH2+O2C-ZoftR1YsQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_202609_858132_AA843998 
X-CRM114-Status: GOOD (  20.87  )
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

Hi Paul,

On Mon, May 18, 2026 at 2:01=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> There isn't anything configurable about the params video device link,
> but the v4l2 core complains that no op is provided so implement a dummy
> one to make it happy.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 77c2d06c0436..b7ef33fa2b13 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_p=
arams_fops =3D {
>         .poll           =3D vb2_fop_poll,
>  };
>
> +/* Media Entity */
> +
> +static int sun6i_isp_params_link_validate(struct media_link *link)
> +{
> +       /* Nothing to validate here. */
> +       return 0;
> +}
> +
> +static const struct media_entity_operations sun6i_isp_params_entity_ops =
=3D {
> +       .link_validate  =3D sun6i_isp_params_link_validate,
> +};
> +
>  /* Params */
>
>  int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
> @@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *=
isp_dev)
>         INIT_LIST_HEAD(&state->queue);
>         spin_lock_init(&state->lock);
>
> +       /* Media Entity */
> +
> +       video_dev->entity.ops =3D &sun6i_isp_params_entity_ops;
> +
>         /* Media Pads */
>
>         pad->flags =3D MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified that streaming through the ISP pipeline works correctly
after this change and that the previous .link_validate() warning for
'sun6i-isp-params' device is no longer triggered.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

