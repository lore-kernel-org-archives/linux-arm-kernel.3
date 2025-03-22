Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B34C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 11:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/38SpXX+t/RyNGR7UIeutSrg3vd9sf/spj62Z5/lVQ=; b=Vi2AKapDC4b+b1SIugqsP2G5cv
	e27ot2lZvjJ16f9+lEFoEZTtEnqhxo8F8moFNf0JW5XyrKaRsEuzPAO5zqcCdLURTR7rxVWTEI/k3
	49Bp1F6ofJZTdUmK5wuCztvPoVXmL7suiEwWBZc8+jR9OD1R9qRoWwk95TL98rZ/HZViEMugO8945
	zPN8YBbPaJY/0cMz8b2FXM05yZ967aUGYyuLivfWy5M0iRdxa7U84n4CfrsEkFZVILfVQJvVWk0eP
	st5hYwj4y3oWvapRGTucdH1Kz2MMO1Hox7bZNbUx5uSUPnDAVUMPCuteq0l+NMKyFmFYCG9qDYuF4
	WMUgS+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxQI-0000000HMLD-1260;
	Sat, 22 Mar 2025 11:53:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxOc-0000000HMGe-2AX1;
	Sat, 22 Mar 2025 11:52:11 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6feaa0319d8so21259537b3.2;
        Sat, 22 Mar 2025 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742644329; x=1743249129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/38SpXX+t/RyNGR7UIeutSrg3vd9sf/spj62Z5/lVQ=;
        b=Mdb2m5yP1OKjajWnxKGlKoaTenMWU/3tvBA21BXGyAZ5UnbO7b4itzGusbFk8e3DbS
         e/rW722TR2Q+1Uv99VexcEWi9NOcyBD/YW4yFBsH0KFUB0euA1ccucx429Y+ANQtFx83
         s8VQtlGm6n0gUKWEiks7hnOG3fprKdzcmUeFnOKmSfx0dp+ZNPDx8+GWamuUNam4BhGF
         jCk7H9ZEvMUbVVOdIQlzRAqjaE6EkvGIqTI+193uiK3HLIf4tCyUuxGKmfBbCcmMgAN1
         sZmPWYvNpjolmRrvt/K8whQseCfP13EpIlT0XnqhCG+H7hSAbLGd9mNJd6Tms9qIEZCw
         G6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742644329; x=1743249129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/38SpXX+t/RyNGR7UIeutSrg3vd9sf/spj62Z5/lVQ=;
        b=kzmb/kzCk/NU5uvaV6bmz3CaQZKhdq+ATXBm3HNA8p3NX1DRpxtO2U8ovd3AyPn7/L
         KEPQxSMqTq57pI4fRSh9fiVll37ghtKnwnt9BA3et1gnrCQ9U/k+QVdGg6tt3InbqkWF
         RhPQGvSMm8Ze5c0WSxptUGbynU7aTerGNGp63FDhoYKEhjZrfhi8ldF5j9y/v+oWlPJP
         qSBir5A/rviPgQ9/9Ej7erC9rx/J9d/Ev4Z6++9e1jWMoyVX/foTBYsgpWyzXWfkWW6T
         RomBm7FooNfciIw/uRLhllsEfPGRLZsn1PM0Kx6BzZcfYBO+kcEoIL/g/uFGbOPoftP9
         38XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMGzjyQzWN7EpzYwox3/PqwQFQE6KVmHuh6qkMbBYkWN/Sih99FcWWbOrBnk8AAXzv7u8+1uWKIAmitqNvtdk=@lists.infradead.org, AJvYcCVoIKoVRnPUZt0ZuAN6JKdPZDlLYFhdTooJfX9R1ER77fZG1JC6mOcWjmu2dLSgi41nhsMHz29kqkbqaTcEG3e3@lists.infradead.org
X-Gm-Message-State: AOJu0YxXsZzSCbBKvqcBnARO7XbP3HAcN9j71VIlfRCWSpp28mUeusYw
	xrmIp81RflONFMFqkbgpd0pNjO5tFYtILcsonZkBX5kanolhaoWK2K3VAiSDHD2iPej7vEfd6A6
	BL5s1NgK/3Epi9u1AhyEtw1zUK4g=
X-Gm-Gg: ASbGncvcFWMufLxlQt5KkWnRIJY2U59kqnJKQMUdmLu/Imw6bWbTvSfbsVd9458bQvj
	4FfwzHiXo+yUcJf+HFdeW+pfYY5W0Ia5phd2Tcfin2shOLDbm9lOjon4UmnNeRPl9Z369h/Ceht
	xUZAIUNqsx0I4zrMzCO7/FQkpu
X-Google-Smtp-Source: AGHT+IHEIH+TD7S8LIB0pgaC3Heq4ilCGl8dSsQ4Y2jB1WCnC9MH4oZaTqBRO+rXtE+U3iicvoBJ0yr1yUCPg/w5PwU=
X-Received: by 2002:a05:6902:2845:b0:e60:5d76:f79d with SMTP id
 3f1490d57ef6-e66a4fd7596mr8057025276.43.1742644328776; Sat, 22 Mar 2025
 04:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250320201914.48159-1-qasdev00@gmail.com>
In-Reply-To: <20250320201914.48159-1-qasdev00@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 22 Mar 2025 12:51:57 +0100
X-Gm-Features: AQ5f1JoRh53ceEml7E4eB4zyrreqx0RIlQoRBpJCDeq9YDF93pFOkWwS8Y7fB0k
Message-ID: <CAOiHx==UCeMQpywQJCLPQqipEW0tK9youRxdR5+_T1LuGp_EHA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in mt7996_mac_sta_add_links
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chui-hao.chiu@mediatek.com, 
	Bo.Jiao@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_045210_557374_2CFCD7BD 
X-CRM114-Status: GOOD (  16.19  )
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

On Thu, Mar 20, 2025 at 9:19=E2=80=AFPM Qasim Ijaz <qasdev00@gmail.com> wro=
te:
>
> If link_conf_dereference_protected() or mt7996_vif_link()
> or link_sta_dereference_protected() fail the code jumps to
> the error_unlink label and returns ret which is uninitialised.
>
> Fix this by setting err before jumping to error_unlink.
>
> Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to ML=
O support")
> Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_=
add/sta_remove callbacks")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 91c64e3a0860..78f7f1fc867e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, st=
ruct ieee80211_vif *vif,
>                         continue;
>
>                 link_conf =3D link_conf_dereference_protected(vif, link_i=
d);
> -               if (!link_conf)
> +               if (!link_conf) {
> +                       err =3D -EINVAL;
>                         goto error_unlink;
> +               }
>
>                 link =3D mt7996_vif_link(dev, vif, link_id);
> -               if (!link)
> +               if (!link) {
> +                       err =3D -EINVAL;
>                         goto error_unlink;
> +               }
>
>                 link_sta =3D link_sta_dereference_protected(sta, link_id)=
;
> -               if (!link_sta)
> +               if (!link_sta) {
> +                       err =3D -EINVAL

You are missing a semicolon at the end of the line.

To also do some bike shedding, you could initialize err (with 0 or
-EINVAL), and then change the err return to return err ? : -EINVAL;.
But your way has an explicit error code assigned to each failure, even
if it is always the same. So I won't claim my suggestion is better.

Best regards,
Jonas

