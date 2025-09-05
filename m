Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79908CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ClMPDF0HluOKzI+GNmsNWO4LtH4Zjjqg5QR4CqPXIM=; b=iS0JRYyuQUDFxD8t6IgOTJj7vF
	VcXmnXpZO61A111mZWlyMXAnewGSxPgLSItwwJy11gIdxiV2oz3LO4N89QcIcFgdAmbw0cx/yHLya
	MJ6GP4/VbL9U2FlEmiZ9DnghPTHPW1v3erpARwOfD4mEyUC8/isdWkAlTToxvKzD7r2oBhMTh7WCe
	K4k4l3JSb85Sg7pEUq7qjVpMtm2kz3n2i6nEoX2DDGECQOGhNwoE/dD1NmsYzR9hr+7sZZiQvhkgL
	7isRMxct7eh8kVTSRnW11UgSHc0l3upcgRJd5ye/cQkDh0kZ7P4aJUbfxsmx9xb8EWuOd6PvqwiZ5
	slUH0Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ0e-000000030EE-12pA;
	Fri, 05 Sep 2025 16:09:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVX2-00000001gkd-2Oby;
	Fri, 05 Sep 2025 12:27:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so2920296a12.2;
        Fri, 05 Sep 2025 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757075227; x=1757680027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ClMPDF0HluOKzI+GNmsNWO4LtH4Zjjqg5QR4CqPXIM=;
        b=fzZe3AsYb9PrJDmbWyjr+d9hT8cC5/iXFpHM/+QLXl2OO6+koJ9bUJ6N0tS36k1MmX
         mdNk7EiKNm1ZTErGxCcdA/0IzNHp4/emskX3zTSkEaenBhBDrMPu6LgLPNML/vx4Gptr
         3fxBzOutwzdV9WI4VQ/z0M5yIEeOMpIVb7340LMZaJJwu906SsWl7ojay7mNz+j2keXj
         rTnIGg5BsxlOD2PzZVITPryg3+zmgBuQXy0geB0XtlOKmed6KQdkW64loU8rdN89jzh8
         DCe+n5Kl6WvwRLs2nO+3mgTgekcE85PF4N5BcwnHzjrqNoU+BSh7NB+rpTb3ptpi7AqV
         yc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075227; x=1757680027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ClMPDF0HluOKzI+GNmsNWO4LtH4Zjjqg5QR4CqPXIM=;
        b=B1c0W4L0l4+yCFwDTTjBBSMJZLcyubuo81idKSpjlmuHxkm+7V0Sb2aIaHW5+8C3us
         P053DtpK0FceK7CBoKWS6tFLjva/aWq5NBh5AZvi/x3ZPk/m2z8xGda937PU04Ej0qBd
         GeD/H/Bgg/X4tJeYK+7x+UbYJ7aVutIZH9yD3RZFjsXeKoAjoKe7bfPwnHqRekZl7YZy
         cqztvR0iCJ5WhArQPuXN9qFSLU8EDbWGeelyizNA/w18UHmT30TjWY+uYuCB+zeQJJcT
         EgscH5Src+AjCTXHgmoLCjHrdXq2lQwZqZthNNyfb4GK6ZJJrbL+3ilyph1/mFkqVOfi
         qfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcDNy2A/BlOhfojpX5CP3LacfTKpkZO8uNvKgtagTULL4vY3RqXW/o0iBGxFySEhxw/gSFHfwcmFWXZxp51HU=@lists.infradead.org, AJvYcCWhr8KnPNNS5OgJgDBlOT8/tz4uqcdmD33aujxzxuiijGj7YlHic3SXOPObU9bBksCqWIOA5mU+RNFVcxD9S5xq@lists.infradead.org
X-Gm-Message-State: AOJu0YyX4GOX985zGHfEK0Fs4ZFgelgExEf6n8tLuFFww3MH7niVLnkp
	aEQT0pE8hm8vqk/IHMH5hjsS2Y3sJQyX75O7Pm8nARgBgnfw3vBWZavkWsSLas99Eu30uM2AO+k
	kdHjwhcQeIx4e56+sWjZjaw2FqvdlNzo=
X-Gm-Gg: ASbGncuqK8cJjxKhG8JiZm5u61mRe5Zj18pnE6ggZqjLke5vnGzx5/+xaVou1AOi8ch
	LBZv/12di+2clY4joXBJ9gMelNj/QxrntyvvSGO0OB2Gv1LtlczMWttiRsJO782XgPtkauQYrIv
	v1fYFPlFx/qcZyoKG/X/0xZWaBoZUfvah//laJfbu2KesKIPcDu2mxmcxZIq/b/FU1wq6wd5yWt
	crbXDAXM6DtSgqAlg==
X-Google-Smtp-Source: AGHT+IEVNnP/U7LUIDN6Mt8LbSIFuDZj1YfEJa6iYw06p0ZNddA0TQZZkmZqSMAeaPrBEuNv6h+hGZaxwhQit2BdnWI=
X-Received: by 2002:a05:6402:27cf:b0:621:b7ba:ef76 with SMTP id
 4fb4d7f45d1cf-621b7baf1e6mr1486424a12.35.1757075226560; Fri, 05 Sep 2025
 05:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
 <20250905025632.222422-4-cn.liweihao@gmail.com> <2267196.NgBsaNRSFp@diego>
In-Reply-To: <2267196.NgBsaNRSFp@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Fri, 5 Sep 2025 20:26:54 +0800
X-Gm-Features: Ac12FXwgzlnAMSQyI-WpHzpeUd7ApymhPLAVoBjM7YjSfL1afRnvVV71jtX5KA8
Message-ID: <CAPEOAkS4gPiXddXi2=RqY7oJW60ewwA54=OX_Ljf1zpAgUf+_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052708_606568_4FC8865D 
X-CRM114-Status: GOOD (  12.73  )
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

Hi,

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=94 13:53=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Am Freitag, 5. September 2025, 04:56:27 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb WeiHao Li:
> > Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>
> another process-related comment :-) .
>
> (1) You already got in v1 the
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> So when sending a v2, please include such received tags
> (if there are no major changes to the relevant code)
>
> This prevents people from reviewing things needlessly multiple times.
> So patch 3 would look something like:
>
> ------------
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ------------
>
> (2) As can be seen in
> https://lore.kernel.org/linux-rockchip/175690195013.3771488.4358707862248=
73257.b4-ty@sntech.de/
>
> I already applied the two clock patches, so in newer versions don't
> send them anymore.

Got it and thanks for your patient explain.

Yours,
Weihao

