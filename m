Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B174DE65296
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=; b=iJjJhz4bCH3IREZ73cwN1upgg3
	KPvmoyrsqIi2GPfnHi+gXT114VDaFf6Qjen0Wq18/oxlUdHW1UnOza99WXKERj+5E0PJ0oyKgYAFS
	bfva9Yuuc4Z0MXMzATCwMAJytcdtHTvvJnFktQ+IXqvi2oq5L0hbqBW9sFc0IsrvpCqVN/nH2fhfg
	x2v2JUprs9nb1OaVuO/zg8+Fkd8SmFH9yP/n6T5US+rp1caz9urDYqnlELoPeGP/NUkOMVmIGb8tU
	vdx1FnKZBg+tLpX/LiD57HpU+nARYi/fWpOgw5YgxLJ/rW33IoX0VrHJfHBrZ0fM0EZHTXkiGwKLn
	b7VmU7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcGY-000000045Fk-414s;
	Sun, 01 Feb 2026 18:33:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcGV-000000045FE-1vdJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 18:33:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3011577f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 10:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769970821; cv=none;
        d=google.com; s=arc-20240605;
        b=hJZrD+M+QfHCRewO5lctiwjrjSgsv3aXF9/XlUlvekqmxv91TAUh8p7HIkASBPjw/o
         rYYzKEd62afBerGYRgDAr5CRkVuSZ34ejc/ceW4MgMqr197t1EdbvcqnQ/GmLqHc3A60
         xHTLIfQCe+ciHbYlOvtGDjVq0VmAqd9IvdHuy0UOftJ+uR0kTkxAWEvhAW9eUq8aWTaS
         XhEkXtp1n4qM4j0FW/AMaidiTKVi5m/db9HHCRHAX05PbnXHu4UFVMQz7SkWgStUD/oQ
         EiwYZadK2VYp8pKVvenVCGrIm0CSCjfPbopbdLYxi0Fa/6OxlHaek7ZziSztx+RlLrKB
         uL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        fh=KF19Bma8HoqFWA8x6O0zuLKGW9sp+EntwBaWz9/ERqI=;
        b=K+DYoND0En/xGYNSYAKLDk6FQy5Zfl/pQs4FQ6cdd9K9Hp2En/ZuZE9P9g2XeYE2jx
         ID0gTQxGFj3UHChNI9OzTBNaQrhqlCYsZyJDrxdlea4TlVaVCz5x1ZN+zHsBq8PEjPeG
         ruLw8ZcRVWceccmLm+yUCVGH2KUTMmYO330aLwqgbXsBtXIDj8iErhkyDvTBabCJV1dE
         cgiurKmPq0KAGS+8wQFL5crFzu5pjmgCIJBCgSbm52NHWqpSog3V3iKlnLhKhUb7BgeQ
         B9FhtYGpiZgsC1e2ghSQ9i0OCMzIDAEqwNIH/L3jXUPAGh8KHWVelQKb5KKPAMmXUsC/
         +Fow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970821; x=1770575621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        b=WdQGl2IrKcAUb5U3dXis3yaLei3EfH5F4TKIZGamC6lJY9WrsNKU666QzrHMlrFrxW
         xt7j1WhEeWbvHpultv3XUCaBGOeXvT7S1BntPS3IfqwQmLJOTl1q1OTDp83hALMP6sNm
         y3V188f3whfX43KYG+n8i0dFig10+iDhL49SsRnWiMGrhclzwpmfc8GWLdeDnfyEHItj
         sHLCLyb1sNDF9Ubxn0mvhHoyAspVrjFvQpwaay2TKPiGii+RG2sqEuCDtD8KaClm0vSE
         hFL4cP1hxXL2wzcMiaTa6SGueT3xVvaSPBOmp3aPgISJs3U/teZhypMYLKHmeimBEDE4
         ENLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970821; x=1770575621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        b=iyNSLS9fTZbf2V6/MgZO/Gb+UEKI+6rX+xgvcaCM+QkfMdHzDYkaUrtUThLqqWaqEY
         7NACkBHyJab8bBh0iqwXoRtzG+7D9EDaGZQlS5rUr29loyFw/ypyNbmz24SMHXPm/BZF
         qCXxIDiaCj+K6o7i5mW2+BW4BtjGvTILZJcqMdFhOCQ5gfWY8oOUrRhAXwf26VtC4ZAK
         dJiFRGm5cgpyOYWkD6bDcI4CMAEdXrh6knAK8cInAmCqLrhfh/9gCFgihjzq4EwarZ+v
         Iwn/fg9S3ezusW6MTmbjlwS4JXMBQmnFN9F5T29t4/i5/vyJnRLz9GerQALPccR9TgTz
         u02w==
X-Forwarded-Encrypted: i=1; AJvYcCX2HlwOkajF1blW15V8f8Eo6mqLwls2sQWy/LvStLDnO0fl3XS/7/+rlAYVthYmlBLvjnNpJSb/ZxjCNIoypjCW@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ2DVyPBWjFSqD7aSW3GYFrnlj75ypQHFqqY241IM/NpPEhbrG
	M1Uq35HhBXovaG0CJBRjdcvgWxuiTTp8PFj8JiJycdfykUKI7DExzqDTb2nXpjvsqYtvwQO3hnl
	CweQ8Zu5dS7gE2x/ABni1Mi8MpKzOtf8=
X-Gm-Gg: AZuq6aJa7oV3/eyfogk0DlKkPUgYCUiu0C1aTUCG8IhSMuN5FzTDbqxR0qSP/MGvCPe
	SOpJpFzmGFXAwYV+ARcwS88yThGp4CpC9/cD9DXG46MyYPr2Vht/7ILcANKlkRmzlXbF3GSe99t
	pkJgq2/+tK8wPJ5N/J2PYySohxT9YAZ2Q7FQ8RFyPg9m2ps/eB4fEBGJnt34bVuixunWln3pt2r
	TlxKlaTxus3jaPmZveSVpBxSmXahZzkXL9D6TRaF41n5rPJy8hQQgcC6FXlROivoHU9FH8i6/P0
	wCgrk8JE5uS0cq+x3iOwgUQ4i7/L5+Pvd6ntF1yjJaqzmfNCFwDIRlkHfVpaONvbT66V
X-Received: by 2002:a05:6000:1ac8:b0:432:8651:4071 with SMTP id
 ffacd0b85a97d-435f3a8873dmr13278042f8f.18.1769970820751; Sun, 01 Feb 2026
 10:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com> <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 1 Feb 2026 18:33:13 +0000
X-Gm-Features: AZwV_Qj_oRyCrNwk1d4EkOcOrEcSe3PZ-OQGreA6B9xVWTkAhiCPU1GA5dw0no0
Message-ID: <CA+V-a8tj74WYJ=i5y4rg4OEtr_rXh381w9+s+ycn8qjajC4QxA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_103343_517724_69E56CB8 
X-CRM114-Status: GOOD (  16.79  )
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

On Sat, Jan 31, 2026 at 4:14=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
> the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
> compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
> GBETH by reusing device data of RZ/V2H and can be extended to add other
> functionalities later.
>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Collected tag.
> v1->v2:
>  * No change.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index be7f5eb2cdcf..19f34e18bfef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gma=
c_of_data =3D {
>  };
>
>  static const struct of_device_id renesas_gbeth_match[] =3D {
> +       { .compatible =3D "renesas,r9a08g046-gbeth", .data =3D &renesas_g=
beth_of_data },
>         { .compatible =3D "renesas,r9a09g077-gbeth", .data =3D &renesas_g=
mac_of_data },
>         { .compatible =3D "renesas,rzv2h-gbeth", .data =3D &renesas_gbeth=
_of_data },
>         { /* Sentinel */ }
> --
> 2.43.0
>
>

