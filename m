Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCCED0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=; b=A6In8Sx54tb5hnTSJ2NE7/dEKy
	dj5rNbSPRQBv+xk71Wd/APA4GbuoJkF6pl0iOXBzE/4SpJ/pY7Cwlk+7W4F4jiiyD/BABWFDcbQwK
	+nKzHUPM986vh1AvtBriOO8FryTNl2sGSJQLxDKIGMDb7OgC8Bn+LnYg00VA2EafTMLXnlwHsD54e
	X/5kG1pV39M1pnzX5wobGGW3H3hhVUG3c0YPR69S4tzt3yplPnhxRBAso1QS6clBpsn6cMqaVPHFQ
	9ROVPY0ZyW3gUL9PPrQHua9v3dRYczxCpgaQEEqGa68U3Bma083VJT0O2paJyKEsYXMFrpzk1cce/
	w56+KC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rEF-0000000Gu7L-07Wi;
	Thu, 24 Oct 2024 06:21:51 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r9h-0000000Gt9Q-1hiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:17:11 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso313178a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750625; x=1730355425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
        b=LFz3il/FYnrvLS0T48Bxh3/IqJjJhlEBBnxpFAVLDjlniMIcEqfl4SuvIigoWpDo6A
         YKm0uX82xojVWbwEDjT4SSEudwFXKD3CoTJCiX19CfeGHiG7bNpsI9MD6p6FZGXyhCvr
         fquTXOkvf0ieq98Fp7q69psfAT5tA+oJMbgWAzfPkaJeC7J0OoD1opmAauOGzVFZ8lWE
         TH5zoy/kBtNgoISnzA5E39oxpwZQlZIcBQrSt1w3hsWHclAZ+7oaS1KEJPgZDyJ8G50t
         yhSsApAqMa2pAf8vwMXhggJQb+7OkQBQMDnMj+SDf9JAIJt7u9VjmGiSil3jCElqAJdW
         XTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750625; x=1730355425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
        b=PXRP7mSr2pVJVyU2SpE0pPHEDiPs5zafmhHpZ/ZmE6Q4kzij/bNzXg92fKFpBKFAFU
         EOEaab6EtA0Iz6wu7UyYIqlU0zmqGZwGtKeo57tw9h3GcFk0rm8nIrMiByqRcbYAPgHk
         Fq2AgCgj43eAXTmaisHNQq0yr9I3bhe5CcO4h/jAxdMB0plRKCTt5Alkn2d9mcKheB5R
         VEdRChKI9BM/vMr4ty0zNH7ZP7nNDQ1RJeOtBMZGcH4o01SBYdd3uu6vNHsE7/bthtxx
         dAbutsFwEpaI3waUyjrtr85V8LuIiCgnzcFtV5teaJj8ouHJymgMZ6RIQOrcVJtta90k
         VvJw==
X-Forwarded-Encrypted: i=1; AJvYcCWSmgbTgZv7bfrl3TtcCjt+BBlXNOfEjbaWLshb2lgyUVP3gOcz8LRZ4p1W5nQmr9kJlJf/fdH6+Edklek2feYB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr3JM8WtKB6IhAkWI8gmCr3GuxL5keSLJL3jFq+Oa77wmBUTon
	olsM8gMVXDEUOrv7/zRjcPV41GqvK2J7IZTIwOBJ1tKGSvAsKCoeakqaEkeAgjisqAHeQuM5MSD
	U42P5ZUyMGvfAgrOQ6KDyIg5glClXxKocvFDe
X-Google-Smtp-Source: AGHT+IFcCYtp7nVgkoJ5rzaztD8OtipNso126UyODrDbPTgNIyDaB+s9edBYS51aMEHDl37/TiPH24OOcDTayFV74a4=
X-Received: by 2002:a05:6a20:5da3:b0:1d9:83cc:ef90 with SMTP id
 adf61e73a8af0-1d983ccefdamr1940597637.8.1729750624651; Wed, 23 Oct 2024
 23:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com> <20241024061347.1771063-4-saravanak@google.com>
In-Reply-To: <20241024061347.1771063-4-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 23:16:26 -0700
Message-ID: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231709_591451_60B62E29 
X-CRM114-Status: GOOD (  19.45  )
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

Greg,

Can you fix up the commit subject prefix to "driver core: fw_devlink:"
please? Don't want to send v2 just for that.

-Saravana

On Wed, Oct 23, 2024 at 11:14=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
>
> It would make it easier to debugs issues similar to the ones
> reported[1][2] recently where some devices didn't have the fwnode set.
>
> [1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
> [2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index a4c853411a6b..3b13fed1c3e3 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device =
*con,
>                 }
>
>                 if (con !=3D sup_dev && !device_link_add(con, sup_dev, fl=
ags)) {
> -                       dev_err(con, "Failed to create device link (0x%x)=
 with %s\n",
> -                               flags, dev_name(sup_dev));
> +                       dev_err(con, "Failed to create device link (0x%x)=
 with supplier %s for %pfwf\n",
> +                               flags, dev_name(sup_dev), link->consumer)=
;
>                         ret =3D -EINVAL;
>                 }
>
> --
> 2.47.0.105.g07ac214952-goog
>

