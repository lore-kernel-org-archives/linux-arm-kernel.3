Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7895C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=; b=WxC4JcCK5UnydeKo0xpAvHBaCG
	V14Kmwhs8OD+AymYfMS5UxNjQ9wrB/PQVmpVah1ZbMlegIOsLVFF8guDLA3SfAINQcM74osulLKFe
	wyVI6DXLcOit4gjumF2utN4C/tRiufvaRNE1RtU/36wes0+vLCopD5Sj8Zdz8jOhes0aMv1bmxyxo
	OWlgUpQQJG8W/EW7QeiQl6W91g/drWdh+9HbJgl3VT2W1FmYNH/lFQUOZSwkc52haVhHxNBWPaU3l
	q2ja64BTosgA7Yh0SWVFlqlac4ZAz/OOxVUmzkcrtxBuKI3O62gT4sJ4zYMDXeXkgIosUUja5B+cI
	B7IqQn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYyc-0000000HELk-21k4;
	Tue, 30 Jun 2026 13:58:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYya-0000000HELJ-2gMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:58:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2326645a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827891; cv=none;
        d=google.com; s=arc-20260327;
        b=VgYoEe0ZdPsn6NXR/aUlFFMdxrU6deke/IdUELvROPbsA7q8iyUowuY0Cg++R0LrI2
         Ffgzak/+zT/eTKsY82Ysy90GJH35vfZfnaGooiVPZ29tzE6E3/RaKwBfCAXxq8jdLSAG
         mm2lBGjmBR6sL47nuZa/J4h/xVUnXzqTJH+usSUYuod2N3AYekdHbEt7talNECRAIP7w
         Qojal6iS20IStDLd0j3rO5cot/uYn9sIJx73l5qV/XK3gHU9WVbks1wrRE3rtqcEBgk9
         6wG4YfcsYUnOtbN0/qL8sUpDsVDthIEvZad3wnpNavo2wUxRIJfZAsVplr7n36X1EWTR
         x3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        fh=aF4QCM2eaw5OdKzUxJhaftVlPh+l7VlFsZnJrcbK/p0=;
        b=QmAUdoRGBb1NW0TJjnW8JXedHQ0On0C9gho15BgNpsYIAWfya5DTtDaZZZOA0VGiDN
         T9q4+43ldi470Ey3LwLmWjTceyp24tcIg3T7hoVfAPHYCCuKGR3FqBpMS5kJrClgP6hO
         9x1cWS5qqiP1yHO77EJoqf+sTrkejeSM1Lj3mM+oGUijKy54HsqEZbjObmcKdN3qgb05
         jb66bLlspNzX8HTe/JkZbpYE863s4ql33NTuKRe9/9hFCpMKwsJ1K+F91eqeOOisCOL5
         rlcBSCVHU9xis992ZYV1AoeBXa4WoG7RYonKutNFbDoZOC9t6hKiy8G2XNvDq78+Vvvt
         yA1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827891; x=1783432691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        b=LGvjdxK9e4MHQEPSIvNR3orYzAkWlhV9MOgoKEifChs861oInY8ghf/s360G1AEHJ4
         rZLErHklz+SQYyzb0u453TW49eHHxlpkC7UWNySuASPbXhHu+zM8/p24L4PtNFU8EHCN
         l/ueVpZeeVWx7Vpf/GKR2KliyLZPykTMYuqUB66H6UBOJ/cWfamzJmlzCdQuOx+osw5C
         wYCZvCKJpFC8xgj2AhrEhWlWgBgfDLQgrkMveuKpLMX5v/zxDVgBO/w886lz5j8lFTNQ
         V0wwkrqdntNV1VsJfIbnG5iMFXsl7DC7yDDsZ91H68rhgCpjFswR/a/TdWszwcszAHeP
         345w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827891; x=1783432691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dThq0NIU64s8SXUZTmGEveTtIxD/rG8X9vpGRvjciBA=;
        b=Zf3Vu7uZYtfAfQxFIUUZP8GRLIDUtiwNOfIXzAtDFDccP6iGfOps5uVO948nEmSSSf
         IbRAziiozdQykJhb2iHmztRwTkrGLw8ECiUykrXXJ5+ElQ7o1brRJyaPpZyKNtO7L+AU
         Ds1WxWpjKXU44ta43WRR/x97rwRdU1ewZ7nNEIRoQ7PqjoIQ4kcj5qJWJcZRbJFmVI46
         ODNBdA5Re3Hea0Jo/3hvzJgpazu9GTKoF82g5IhbeNrtt2+cQhsC4lo/yhTM976Pcooj
         j01vNIVvn3l1Y45f9jSi0zTp/Yj2tS+UT5hziWHZShh0N4nt35ugADeVgQU4nPGYCWTO
         CCeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8LzFYfETMcUcrm5R5nZoRHAm45MPzktk200HQoI8zEO2GQFMvy8GUqvmoU8yuIQ8iTeonxpMMf3o+a9pq58nA@lists.infradead.org
X-Gm-Message-State: AOJu0YxC9zyqPMhTnHnxIzBx/Fda+suPGJHnTBZ0RNJBhHMGACA/h9g6
	vt/NU/kocVOKSt7jV7kKkxcZETg1xQaONpv6JPxk6zbJvEqNx5KK41vVoG8PO5KVnPsrx80UxbT
	lPDCbbUotp5tlfeFftGF/32sMMjjseWU=
X-Gm-Gg: AfdE7cm6KxMlum4//FMHxZvqMAq1hyuNCn4r85asi+xxjd6dsuKkD14Uf0IQEGhsxsZ
	YC1cM9ifRnGw5TKFoK43Vo9g/kMriWB7y/fRlKWK3O5MHkNK+0wqnfsTh5vLLQ+03XYxL/MYcle
	yy/EBlxi0lL3mQRqBUaz2FsJvfrNMtyW8pIh6UxfAAZHrbtg6mgAK0kbOADr30qpvDFXxWFlPlW
	1t/wsvavAqWBr02Lm3kZ574ZquM1hvAa/94iZtziaSm5bTykebNV1DOM1cNnDiVp0/liyVxRD9M
	SdcZDnyLptysQDRCD2X12o/tKR9OAmUIeZ/B0ZWtvi+4iG8i/bno
X-Received: by 2002:a17:90b:554f:b0:37f:9ce1:735a with SMTP id
 98e67ed59e1d1-3805277ea31mr2372294a91.27.1782827890882; Tue, 30 Jun 2026
 06:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com> <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
In-Reply-To: <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 30 Jun 2026 21:58:00 +0800
X-Gm-Features: AVVi8Cf_KTraIW_3Ita1I0FfaOSBfOCUhalTydnfzUXS9XHlfuG8lIeC9Qbzit4
Message-ID: <CAN4SLj2F1Cmr4B4Ccs=H-eWj7EHYXmZsz-n=RPZVL_YxePwNJQ@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065812_681293_FCE86925 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Peng=EF=BC=8C

On Mon, Jun 29, 2026 at 3:21=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
> > platform_device *pdev, const char *ocotp_com
> >
> >       ret =3D clk_prepare_enable(drvdata->clk);
> >       if (ret)
> > -             goto err_clk;
> > +             goto put_clk;
> >
> >       return 0;
> >
> > +put_clk:
> > +     clk_put(drvdata->clk);
> >  err_clk:
>
> It should be safe to directly put "clk_put" here, no
> need extra label.
Passing an error_ptr to clk_put() could invoke WARN_ON_ONCE.

Best regards
Felix
>
> Regards
> Peng.
>
> >       iounmap(drvdata->ocotp_base);
> >       return ret;
> >

