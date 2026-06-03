Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DD8CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blZ2Gd4REKJ2Ou0LNr4qVkmCMj007v4mx9yV2Wm+6kE=; b=QHYwA2hoBbfN0ViA8wIqt7ALMp
	E4tdDEMIkzMl58XMwEbFaS2gzGDJySvhJikGeyDnZQurHa5fMrXOVRrHyqvT+GvjdiIJdLKit4qWI
	gNBbtOaG5HVXWjFdK7bj8321jm49AnVDS6V27WrlFDR/4UXonwX70no2kBU/ZFDscC4Rgqq7LvN0J
	2QQTeFM33YlrVYwUJ3fvzNS7ooyV8OxZYe2DJ/0MW0zUx0tdL8gYmZJr9wpH+MSomxpajw1xGPRHn
	BEkT6oAUHNgnrZeQJSI/fDjJlIXPR79No+1SQS9q4ngVD0BvIm43y7sXOxdlT/vBvEMlFgx66nblt
	OLX/e2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfIe-0000000EOmm-2YSp;
	Wed, 03 Jun 2026 06:42:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfIb-0000000EOmJ-2V19;
	Wed, 03 Jun 2026 06:41:59 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936BA929;
	Wed,  3 Jun 2026 08:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780468891;
	bh=q3QoO4/fdcnDdKNPMUrRwhJUlgJyK+9LTYw9k+mqm7A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H4b3Nn73S5ABwcHogJ20oGDXD/c7CBvkmU5CptPoMsvUnpT9mVXp+3MFrvks0hfLT
	 BNgATXhTYlguJ8CH9hsTMVgpUlWQJWdQsaAhqG+6Ctxbwpo4ulGS0g5ybJkO8w75Fw
	 uRuM7y72YI99rQBVlsv+E9l5g3YZC8A4EEohAB3o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
Subject: Re: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Ingyu Jang <ingyujang25@korea.ac.kr>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Jun 2026 12:11:48 +0530
Message-ID: <178046890878.1525445.10660936368234203663@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_234157_800632_8B31FB76 
X-CRM114-Status: GOOD (  14.04  )
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

Hi Ingyu,

Quoting Ingyu Jang (2026-05-15 01:01:48)
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
>=20
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
>=20
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Needs fixes and Cc to stable,

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Cc: stable@vger.kernel.org=20

With that,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/m=
edia/platform/raspberrypi/rp1-cfe/cfe.c
> index 8375ed3e97b9f..91e9fa0341e06 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_lin=
k *link)
>                 link->source->entity->name, link->source->index,
>                 link->sink->entity->name, link->sink->index);
> =20
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->enti=
ty))) {
>                 cfe_err(cfe, "video node %s pad not connected\n", vd->nam=
e);
>                 return -ENOTCONN;
>         }
> --=20
> 2.34.1
>=20
>

