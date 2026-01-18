Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1969ED4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=; b=F8m0VcAmu+imJ+2tjSSOGpTvS5
	rzF8nGKj1zOZvCm+VcyMo6PBjz928EbKqN6mCdPv/kHGLgmGKjKKYuG+8n6fn48fz5OS9xqbptitm
	157jK0As1sUEX98UiQ1Im6LtYcoMhh/w4oshxU7UtOBtCEQe8qeRZ31x6ZroQQhjTpRJ1Yh8q6hFK
	UHRxAuef4Pj/ohoHOi336QdV4NyaN0OeeD1UABAlbHfjoN8QNEbQc+0l4gXj2swJp4m2OkT+giBoh
	ux1hAqcnDiJGmcuL9XQ/iRhLzlZoLtVaLu1jjNZNeOizdp52NQuvZmJPsbTnAbACVb6lyEgMMJn+V
	BMKodEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSPA-000000003kL-0ZnN;
	Sun, 18 Jan 2026 13:01:20 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSP6-000000003jd-0ude
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 13:01:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78fb6c7874cso36883517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 05:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768741275; cv=none;
        d=google.com; s=arc-20240605;
        b=huBrz5DBgrMM0K5Aw1hs3NnFTrwb3A/eXgo5mPb1YzqjusTPNKSimzgkk85wEgMNmA
         yFHbsnXmqYa/Bfb5NeBPle70+1nRoGhynty0RhpPpCFxZc8XnpciXZu5tQLEdLjwY3aS
         ALGl1b/3dLUknEOc8wceVnrC++rRJCTNFegkqDhhGZwJO4nXEUu6pysYUlMOTAg/FxF3
         J5k8mbiwEx8HH46W9SW1UGcQK2z62KiC6I/HOY1et6IfDr1k3BVUtYbGriOxVeVu59FV
         QMxRvrlZ1s+dVEhhKNVUwMtFwgcez3WETMa3UE8ldehV0QtXtFO2v6xZQj9gPS5GqoDa
         GTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        fh=YiL20BUh4CVBMi3Mib0oMhdt9ahiyzkmFdWeOH5IDjQ=;
        b=b8HDRnzoFJfrvB56VJwMLuS48xQHCiyQeCze+cBK7hd/3Z+PlzulFTEsn/ztiDl5iI
         57iXDLCcISG8YUNsYXK+wU+R+M+Vqn/3soLy6MJRFtuh0FOsPGZBnBfLiq41bO+k59uX
         IkuQwjIyZ3JuWRJAGVMgKsBi2OEeuHWIweDG4lshgAnfPKcpJ/WdUuuLeIRw9aRACAnC
         Vlc0YE85YpboCjanFvS4zj4qFbEtctek8k/dvYjYcOMvEBYSfG1e8niOpPV/qBA/j+Fx
         4c6oBlRnFV28Ve31mhTrccAxQnBJrDZDwYcOpWZUhoX+jTjQeNDyuLiIHYf3Vo7cQceU
         7b/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768741275; x=1769346075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        b=XtPW49ZXPh8Uh2gcxBBd0x9MKgy7peYjsIM8/fxRTBxRTdXFveMlBuQtTE5pqoiUKP
         ykXYcEVHyd2CP6fA9PQQ2LjfN5gPk2p9eC3hMtzYklUh7nRvnE7R+vuLT++EcE5aT0ex
         1qE2o8AhJFZudlXCywix02yLDTU3cfNMIWFp1nb9dKqLWy7R0PXeCdFegAwlUITPuuOu
         5GSYGRhW5EcwlwL4dMitQGaSxkGmzYfiQeKFjlt29iWl254GrYcR1moTtB5P79F7I90H
         KpZlWKfV1RdLVxprIP5FRgERaG19/ALza5nuU7KfTYATpIjp8VWjbmoRZUXZP3bN4/TF
         agqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741275; x=1769346075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        b=eGY4F0acaHYkrE+KzV4xkXYp6xqWi8AJmQ/A41zDqzYf06d7HTSOLzav79wT0A74WH
         Oxqx9MxAChLkeraH+9uQbvFMwi7ElGnpRuhyfy4rJ5ro/xcPAtXr4mxAUKiSaHgA3sNS
         DESP/jzrk1y3X4DNfk2VZvbQ1Ojdd1wC53+AHgvGOs8DCo2aa02iN3VrszLNy8Fs3C44
         tWTU+YrQElUN+GEArqt4IR+zzQVvFsxgKLx+LUuol+3dhvWciwfIXa+uroW+W4HKdlmK
         7E0pb9msLfM4npZZYnot5lm0m3H1mglM0QbBR2mkHHo/vrqc0TTL2zm8cH5IK8qZFJUr
         nScg==
X-Forwarded-Encrypted: i=1; AJvYcCUm0mrHkHaTbZJLVKkMqrwPMSjcSZtGB+QpLTOmjEId/tXB1c0/i/cGm0uBCkYaWlhAGUkkei1THU8Na2u6Wxdp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ANo1+QQ1wEyDCTwdJO5OUEd9NO8v3RGNdm7guqKqYnSqM3wy
	7LaUQNQBpR5oMrVdvWMSxWCMclI5MjHyeQ81YCozmj/aPLZ8E9uTNWpgnQVbhvM8TkZxRiVr3Oh
	KSUBToO23nvjlmMmr6tfDqZtyPLn/oEg=
X-Gm-Gg: AY/fxX4DsSkHIjfBXAA8kw6KmtubaFVWoOaq0ki7AnLfpX2jOKyG1GsBIrgVjcc8Mcl
	amA44QPaAq2hoGDrhJmzac1b7jqRLDP0Kf3qwPSh53iZcTohvmjmptQ8uXvGaSX3Ee+iyBKeF4w
	HJC84mN06BknhRrex3ad5bKNTefv22OxPyw/BNfgXxbvrJ0ssutK39pKRTqe/94wJqv9+CfOhlP
	H5r24cTUkONdhzMpqWKS/yqZYgCsf0mz0uUIGdWUJJdPmhyF8O7+moy1x8K4zpAQo1C0tsZ9NpD
	oI9XCkVSW5fLoTW9Fd+j7pigUuMb
X-Received: by 2002:a05:690c:9c0b:b0:793:b353:9dd7 with SMTP id
 00721157ae682-793c683524bmr71951307b3.53.1768741274889; Sun, 18 Jan 2026
 05:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-2-c236e09874be@gmail.com> <20260117123247.GB58217@robin.jannau.net>
In-Reply-To: <20260117123247.GB58217@robin.jannau.net>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Mon, 19 Jan 2026 00:01:03 +1100
X-Gm-Features: AZwV_Qg0kRBEifh1Sp_fpTXxWriqblhk8t3g8YtA9hXlnvyNjUGbX9JPXHLuelA
Message-ID: <CANpmGNuZjYVEu-0mGezuy0mLpnu9Cg1aBooJV=hAr+-BJW0yiw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mfd: macsmc: Wire up Apple SMC power driver
To: Janne Grunau <j@jannau.net>
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_050118_257247_8271EA6D 
X-CRM114-Status: GOOD (  25.26  )
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

Hi Janne,

Thank you again for your feedback!

On Sat, Jan 17, 2026 at 11:32=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Thu, Jan 15, 2026 at 06:08:16PM +1100, Michael Reeves via B4 Relay wro=
te:
> > From: Michael Reeves <michael.reeves077@gmail.com>
> >
> > Add the cell for the macsmc-power driver so it is probed by the
> > MFD core.
> >
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
>
> Co-developed-by: for a single line change as simple as this is silly.
> Please just keep Hector as author and just add your SOB
>
Will fix in v4, thanks for pointing it out!
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> > ---
> >  drivers/mfd/macsmc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> > index 1b7e7b3e785f..358feec2d088 100644
> > --- a/drivers/mfd/macsmc.c
> > +++ b/drivers/mfd/macsmc.c
> > @@ -46,6 +46,7 @@
> >
> >  static const struct mfd_cell apple_smc_devs[] =3D {
> >       MFD_CELL_NAME("macsmc-input"),
> > +     MFD_CELL_NAME("macsmc-power"),
> >       MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
> >       MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
> >       MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"=
),
>
> This patch does not apply on top of v6.19-rc1. The base-commit helpfully
> provided by b4 does not exists in my tree. I assume it's either a mfd or
> linux-next commit? Please note the branch/tag this series applies to in
> the cover letter if it is not the most recent -rc1 from Linus
>
It's based on-top of the latest linux-next, I will mention this in the
cover letter
body for v4 (i only put it in 'Changes in v3' for this one), thank you for =
the
pickup!
> Janne

Thank you again!

Best regards,
Michael

