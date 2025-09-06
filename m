Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813B3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqNxXQ4nHpsF+qXR4Dx8odJeFWSsZU+70lFnX5QCDhY=; b=t+5Uukd7CAlq7jsXYxBo80Qq5R
	5o15OcnOFIxQ/XVqGl1Q1ZATZ+ZU09UbhdX2GdqMtgSVeg4alWPxPY/R8pQ1P9Y0GBZ+bNBE+kFT9
	fiVXOnRYTFlS3XlFW11rR2gzNxx/+hIVcVKEbyo7dq/YWvbdNzWo+ENkdjPvZSYCaa4qbeaKAqrfz
	rkMAj/UaT2Fz/V58mY8C969CSbVzqZW25QbPZC/y3x+x2L2Pu4E/M5Q8ddxpOtYt9MCbXkbOqXs+D
	xTzo+BGKdQaVbVSVn15Pifgs8lPu5LIJ3+6qTCTcZsuqGqKQlzVaNrYjGYqHYiucJ+5qZM9pl2Opz
	gRPlFR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhsV-00000005ujm-20VV;
	Sat, 06 Sep 2025 01:38:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhpd-00000005u9c-0Uyr;
	Sat, 06 Sep 2025 01:35:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso1461164a12.3;
        Fri, 05 Sep 2025 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757122507; x=1757727307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqNxXQ4nHpsF+qXR4Dx8odJeFWSsZU+70lFnX5QCDhY=;
        b=MRJXptyMgn4DZMV5pOQFGnzQ6C/jWVcbbSs8tkEBA5jIpJzhPpvG2JiIJqUkARL2zg
         et9NSp4lBNIYx5E8yCFvzmNzVlMbSUMSQslSkFnui13lrwxeejVGu7MV/m/Cs4QuVgO0
         v3xoS5KdQkdvJQEPwOoi54JNjQev8Y2eqLAK4kTW6gJMqdGV7K0beE3LqmGPxOtcrJpj
         aAG+CeuNIRpAHn7G5xv6F9yXUyaOd+4vJ1jLai4Q8zK9BIFUvHldvQs09er1ID598ESq
         7Bhyl7bWrFshPjUW2HfVrbkmMkGP6MFXO20qWc4cV4rC1orEQsseGrSoC4IdIcNPD/db
         sZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757122507; x=1757727307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqNxXQ4nHpsF+qXR4Dx8odJeFWSsZU+70lFnX5QCDhY=;
        b=sBD2Mv++NOMxwAig+ZAu66UPoIxrbXvwxSe/DeDWSnfAJRKhBskzazVQ+1KMMC+d4B
         Nzr+ALVSGFomE2Si+Bd/XGuHqNRAycyQnlG+BkFX6y+ErejCJ55VCs7sQ6p4zHY1UHas
         ebfJ/JBkxB6c8KcOCfrBo9QdEicFvPCTgTOGpW9LbrqVq+8tFnXRvqOIdSTSC/JY0877
         5xI+oo1B/8//KnAo19LYAzoGbd/1PaA5Z6E+gVe1ANPhA/orW3woprK0agb8LDrs2jh7
         2q+9OLq7lf8o9yX4Gmx2KWbA5xddXUsR6iYD1bxRy+rQ0jeizQyVvD/pOpx83l7ALILx
         o6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuiPBwUaBCSFIimbl0THMst5xa8D2NGbmT3ORglbchbl4SEykYZG0ov9itEODeOZX9B9s7bBKjwQiHI67KELM=@lists.infradead.org, AJvYcCWVxMY+f1gheAat53qqMuMQRFaPmNAlyGAUymKLkxGCkpxx2rYmv+0duAQ6O2CxkYQ8yO8TKTSHF2Gv1M1gjBHW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+eXu+9wqVlv7rMg9vvt4aBgZ3i4Mi5gy2XIQ/g5/AMlBSMcH8
	R+UmiAtUgETXVhXvY6tV+IuF/WECmGLsyKk9hJA09PxJxLvbbrVCZXFuMsW3lrBv3AYPUuH1Lan
	TKLvbwnLGN///zqej3WwQqUr0LOsZKAI=
X-Gm-Gg: ASbGnctdZ4ILQM1RTS2Zu2oiXv/WxJlD6A2h9tqzE55Ldf9RYr60jvaETmSfAMJd+IY
	NpId5t9/gJ55FxkGisOGCCUE9+NwunTc1vsSgvqZm31gr65PVn2CwsdFzDfVevTaPt7gjKg+mCo
	avl7HtlK9bn7fLqVjQ+V/GOV3xkU0nvmL1awljhKHQB07mHZxG+j8F+fPBmguxCPnmEwFQKgtwp
	h6A0TNxi4dzkXwePA==
X-Google-Smtp-Source: AGHT+IHUk2XfEP3oZ1qlnnJyiPfNm42Q4P5RUupaRScX2mRrTgQl+/WpyWfrV8JDjZaSVCFI462i2vBCUsBzJ3JREIg=
X-Received: by 2002:a05:6402:370d:b0:61c:5cac:2963 with SMTP id
 4fb4d7f45d1cf-6237f944ec1mr747810a12.29.1757122507114; Fri, 05 Sep 2025
 18:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132328.9859-1-cn.liweihao@gmail.com> <20250905132328.9859-3-cn.liweihao@gmail.com>
 <707aad1d-fcdb-4c66-8d96-41cf1a1b02ce@kernel.org>
In-Reply-To: <707aad1d-fcdb-4c66-8d96-41cf1a1b02ce@kernel.org>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Sat, 6 Sep 2025 09:34:51 +0800
X-Gm-Features: Ac12FXz_ebvQ7hvtXykd69gMxtD2syeHiyJATPrpJ61FnCFXWiMfi64X3YV7b4Q
Message-ID: <CAPEOAkRTVtKBsmiGTbKOCar0oNS-C3dRXqdpuowroRPH1bFS7g@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: rk3368: add CLK_I2S_8CH_PRE
 and CLK_I2S_8CH_FRAC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_183509_161209_79799101 
X-CRM114-Status: GOOD (  13.53  )
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=94 22:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On 05/09/2025 15:23, WeiHao Li wrote:
> > We need a clock id to assign clock parent when use i2s 8ch as audio
> > device, CLK_I2S_8CH_FRAC should be CLK_I2S_8CH_PRE parent so we can get
> > frequency we want.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> > ---
> >  include/dt-bindings/clock/rk3368-cru.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindin=
gs/clock/rk3368-cru.h
> > index b951e29069..795e721957 100644
> > --- a/include/dt-bindings/clock/rk3368-cru.h
> > +++ b/include/dt-bindings/clock/rk3368-cru.h
> > @@ -183,6 +183,9 @@
> >  #define HCLK_BUS             477
> >  #define HCLK_PERI            478
> >
> > +#define CLK_I2S_8CH_PRE              500
>
> 479
>
> > +#define CLK_I2S_8CH_FRAC     501
>
> 480, no?
>

Neither of these clocks belong to the previous grouping in terms of
type, so I chose to start with a new integer id here.

Yours,
WeiHao

