Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42844FC72C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKbq6Bh7a+kjLQkHJJe2ZOL6U0kPS8uGQ50IsiQKUaQ=; b=sSk2A6Sc2mBM+cqGRgtfUssW4w
	3cAnvutHyDgzeH0evxsH7ruYXJRNqLwF8cQufE1kC+hyjI6UzHLT9j8Yp72rJVUiME7ubroYj6mkL
	almG3hZgxDb53ZwbJzPb3jnggYfIc93MO0eEuL18+YsFHe1NXJekG/E3TO3aLqPJIjv3/4u9l5Ooo
	4dzFBp0FTCI0UvwlEP3FmJiVcaVrRG341Fr2dhwd/uivM2pSgV7nO/R7TtS5aAbDUIDKkMRZ0ilFm
	fhJIOlrTVkjjfycaaQdLm+hDjJa6we98CfxXKvvxPcNy7weDyfaAVkwVktiP1uPwZj/uS/4eSYmju
	97406ezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IWL-0000000FLUO-3Bht;
	Sun, 22 Mar 2026 13:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IWI-0000000FLTj-3zTx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 13:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F7DA438C6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2E0C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774184826;
	bh=U4G/IHK65Lt4xZiDkJ4QwR5+PobqwvwSVmCDcYhqn7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wbg/enLDqjr4aYJ5z7Yj+DV93Oa129HFg7Sakl/iL2uaidripxfeZK2vTofLWLe06
	 WBPKHmukFh+omidL4UIErpe7WP+Hbk2mgu4/mO/616mBDIgTGju5jaLFRsujuN1wm5
	 JJJ2mviuENp+qWRxs/6FrSdepdL9fUSLACpywcSk8WkWkbFyoU8wGS/9nS1VzuXZFN
	 ddtPRRxwIFPytD8LidUbOepgEC4sAoY/FjsbXP1DG19OZ5UjOjh2/73gJASTPRigb8
	 m6XuyHwx3ukNJts//MxDx2qKPzZ76DrH1zP+Uwsem1xcc7kXQrJWNJEKFH9kzDgK11
	 waoLQ3ZH9wmGw==
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3693428eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 06:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPNT3afd4DW28FyUfDN8NmcZkYNw8u/Awq/8sm9bpBsY5NPlX86YU9woRAm1693rxixwSbp04krMEVYDIWT69m@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQK288u28ol8DkpGHcondCshB4WXf4f6nuOXibJC8V4ZsCRJx
	iWcxUBNxTWudGX85kTKSz8kPNUevJE18S86hx4UUIx6ciF3TTmWMCV7gW2mTwObDk95MUjtiF2/
	XVnD+ujrcjHJznmPCrEl9/YXm05ijeQ==
X-Received: by 2002:a05:7022:23a4:b0:11d:c22e:a131 with SMTP id
 a92af1059eb24-12a7263dd72mr4213470c88.3.1774184825290; Sun, 22 Mar 2026
 06:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260212192605.263160-1-l.scorcia@gmail.com>
In-Reply-To: <20260212192605.263160-1-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:06:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9OkywB=+p=TWG7GcoR3dfuPE3GLAdHpFKKs47n=x58Ew@mail.gmail.com>
X-Gm-Features: AaiRm53244OfRV3JHtb3IQRO_s53Fjj8DO5UiCOTvEXuDbtFjMzRwZUMDRJPblw
Message-ID: <CAAOTY_9OkywB=+p=TWG7GcoR3dfuPE3GLAdHpFKKs47n=x58Ew@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_060707_040222_E57237A1 
X-CRM114-Status: GOOD (  24.57  )
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8812=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> If a device has a framebuffer available it might be already used as
> display by simple-framebuffer or simpledrm when mediatek-drm is probed.
> This is actually helpful when porting to a new device as
> framebuffers are simple to setup in device trees and fbcon can be
> used to monitor the kernel boot process.
>
> When drm-mediatek loads a new fb device is initialized, however
> fbcon remains attached to the initial framebuffer which is no longer
> connected to the actual display - the early fb is never removed.
>
> We can gracefully transition from framebuffer handling to drm-managed
> display by calling aperture_remove_all_conflicting_devices before
> registering mediatek-drm. This takes care of unloading other fb
> devices/drivers and disconnects fbcon which then automatically
> reconnects to mediatekdrmfb as soon as it's available.
>
> The function is invoked just before drm_dev_register() to kick out
> the existing framebuffer as late as possible to reduce the time the
> screen is unresponsive.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> v2: Moved the call to aperture_remove_all_conflicting_devices to
>     right before drm_dev_register()
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a94c51a83261..02effd9fc698 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -4,6 +4,7 @@
>   * Author: YT SHEN <yt.shen@mediatek.com>
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -670,6 +671,10 @@ static int mtk_drm_bind(struct device *dev)
>         if (ret < 0)
>                 goto err_free;
>
> +       ret =3D aperture_remove_all_conflicting_devices(DRIVER_NAME);
> +       if (ret < 0)
> +               dev_err(dev, "Error %d while removing conflicting apertur=
e devices", ret);
> +
>         ret =3D drm_dev_register(drm, 0);
>         if (ret < 0)
>                 goto err_deinit;
> --
> 2.43.0
>

