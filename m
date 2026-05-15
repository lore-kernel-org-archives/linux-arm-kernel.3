Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1008CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Gq0+69BzbH6lC7+bTVsEXzNE4pKUS6ML366m/Lt5uc=; b=FzWI4KwPISHNwe
	575SwLd2DPJ47TvoozFddSSQ4xscPwefYlowFx1q0dXF8QYN9dkSC1FvQ3mjBGH4A9Xzsy3e27aM1
	mDMVP8UbvCwzZoui7oBwrvb8hRLHqRAzJGOBms94ybmEL+FZRbcWeSdUVNDqXBIA8BgLQb1ukYGwS
	KlSUgRsAWTPUAkC3hDADYSOneXUrs8mQNIbfgO5gOY5t4BPs0pv33XvXfVWh/gKUh6HWvfUS1PaIl
	2EHeaWfQVKXCCn8ViW/XJ7JcqjOjHkgcCV77eq/Tob/5zxuQi3i2BODvmlVq23iACUAGxGfH134em
	Cj6g1tLYi1QXuvFQlfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiY7-000000079UB-2Tvd;
	Fri, 15 May 2026 02:45:15 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiY5-000000079TX-1m5c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 02:45:15 +0000
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39397d63804so99640221fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 19:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778813109; x=1779417909;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Gq0+69BzbH6lC7+bTVsEXzNE4pKUS6ML366m/Lt5uc=;
        b=D0TWb803/PE+Ai5IuCfXaboiUbgBOJ4kllAqL1fUNiqwuHIjFAM/raKu6z9A4qYrpH
         Z5tsPHEnSoHDokn9dKo0U8+C7Pg3cEHdijfy8xKYtTNMqcLcskSiMfafWqFfINw9z1HF
         sw66J0xwa5o6cm4PUnFTKp3Wk5s3/N5c19LkKLo5DRWTwgFbCcO2ac8Ar3b+4snNuseK
         X2UAb3YQTP86HGVVwc6y9QY3j9Vw1yQlNwyxue5thCm82BHuM0daYgvVDSDn+cgMKNaP
         tZl9mC96YfepJBv5bYKwz7holhOQRxXsHaO4Jba3KKaDvVHnfPIt6YHfUS9Xsf5f1mXu
         ISbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Fu7crLaMbhjgMzn5jMcsUBUeL3oH0l1Iw1j40D2Dpd1evrQzHhyFZJPLUKZ7kmWw7FBHZQpMMiZBMGxWeIEs5@lists.infradead.org
X-Gm-Message-State: AOJu0YybCFucq7qqS69mHR/eeUSgoRT6+atSbnkp8iJDlaAy8zaO+Va6
	cCoKCi0o/NVjZc0DjR230F+YNGaL35EBfX4jl4DaDUBHhiC9Gu9Bszw+MaCb2veo
X-Gm-Gg: Acq92OEyK9bk/0mIJMa1FyrCHv3oV1FYBVz7J2YvI4yDg9ZH1kG3dSCcDPSC+GJa/oc
	bnYD5tlMobwH3RSumVMsjYI5rj/BIaiKGBSkuGd0jfrq+B2K5qN5ZXNPK2z0R3ib8SgduElUNOF
	o1zgMj84dIJACKEQXqhCdKjeyI7HlmYze+ngDZiL/tsHhqmPnxgl0J/QQoxol4r3sNfWaBARQGr
	wKTCzbMwSRCVKLs1HO76t9Csu3vbIP6tFOwBJoJma36KzQ6pae72A/SHwVzkSkFgLOiIFcfis2n
	qf5ryaO/biOTS44b/Tz+aBJcI/pUtnJWmH+kKmak6rqv8N5IUsk7XuhezsqLdhPH/RDP+CL2Pbf
	Q/KtbgalBsYG+D0C+LLVpwujN8n3D4DRpHjPGoKLlltXHwQL/XWt4VouOb4esyw0pgq4fpXkwKM
	+9Ho7/WEnaPhvOAw4tjm3uaX+G1h0AqeiU2KybBNOZ+SPAfv0sLdJHI5A=
X-Received: by 2002:a05:6512:a92:b0:5a4:d21:de07 with SMTP id 2adb3069b0e04-5aa0e600e2cmr478033e87.1.1778813109247;
        Thu, 14 May 2026 19:45:09 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c4fasm903876e87.5.2026.05.14.19.45.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:45:08 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39397d63804so99640011fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 19:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PE0s+v/+8tf+fvarClrmTmuTTbYuYPaneg+MyI3EyqICUQPgLf78+1WkEM+0JF+82+wsPPWJW8f7v6mtdAjTn@lists.infradead.org
X-Received: by 2002:a2e:9dcd:0:b0:394:987:945e with SMTP id
 38308e7fff4ca-39561d5819emr3540321fa.1.1778813108037; Thu, 14 May 2026
 19:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
 <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com> <agY70wRwrkdI2pk4@skv.local>
In-Reply-To: <agY70wRwrkdI2pk4@skv.local>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 15 May 2026 10:44:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v67c3DKq=Bz_HU45xwiyAh8JhMv+uOB6+=7JVGtJNE2UTQ@mail.gmail.com>
X-Gm-Features: AVHnY4IAFKEb5fFsOKR9Ml4CdBf0EmQCbXRlmyRzS5WkYLAAPCuf1-bVK9uD2LU
Message-ID: <CAGb2v67c3DKq=Bz_HU45xwiyAh8JhMv+uOB6+=7JVGtJNE2UTQ@mail.gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_194513_468914_EBEE3937 
X-CRM114-Status: GOOD (  16.18  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2026 at 5:17=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
>
> On 26-03-14 15:33, Chen-Yu Tsai wrote:
> > On Sun, Mar 1, 2026 at 10:50=E2=80=AFPM Andrey Skvortsov
> > <andrej.skvortzov@gmail.com> wrote:
> > >
> > > From: Samuel Holland <samuel@sholland.org>
> > >
> > > The register address was already validated for read operations in
> > > regmap_sunxi_rsb_reg_read before being truncated to a u8. Write opera=
tions
> > > have the same set of possible addresses, and the address is being tru=
ncated
> > > from u32 to u8 here as well, so the same check is needed.
> > >
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >
> > Should probably have:
> >
> > Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> > Serial Bus")
> >
> > I will added (via b4) when applying.
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
> Hi,
>
> do I need to update and resend this patch?

Sorry this fell through the cracks. I've applied it now.


ChenYu

