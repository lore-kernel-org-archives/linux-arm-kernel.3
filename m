Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE988C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQNw2leo+Ol5kg5pwyn/60G8pbTVujZAHkW7U5wnbhI=; b=H5cONgFXKRho2M
	d+01M3y/wLOmz2Vi5rVA7J1Rib6Grc/sHLc7EJjhLjKx9r2TVqn/lcnh//lFQL2yDPCfxsGVIb5dR
	bfOSb6btT7A42iZTD5SqoVr0npDfvRzhRy0y3G80/RMEjlxmjRdvJi3bgxux9YzpMz2WujY/IWplJ
	cUXrGnoJ0sEnAFtMHyCFvTa/bHtQfo8MknK0vAkHs2VYPYx6xrbe8lbmVhjkH9J+vhGKlfHgO9TEr
	7Zh248kd1Qsef66D3w7SM5Xzr3qm7qa7ZOh8HnUfRuNDX3Ryw7zRDDJRlSiVTYm7rSXQQBLTaoZ9d
	m5nzsl2dWwV5ma5c1x3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBV-000000061UF-4Ba4;
	Tue, 15 Jul 2025 19:19:26 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubian-00000005kxY-1eB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:33:22 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553d52cb80dso61522e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752597196; x=1753201996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQNw2leo+Ol5kg5pwyn/60G8pbTVujZAHkW7U5wnbhI=;
        b=bOI7pImgImVk4G0JaP2wK0BnxprvSShjPOCRo6hdLQiRMY6DmGuJSwZ1yJXLsEOOTy
         ZT5wHdrUR+Pc6klEBnOYuCVblDdjYmQvsjeE/caBWa3lY9ZH6CjZ4HRqNXAwLYyN3qPB
         rmBxl7G9WveAwjxUEjD6A2uKaM4v8qPq+sh6ax0YqZLSig44IAXtEMYM0v0ogFLiLQ/T
         DiNcH9vMOlLvqsRAHGWc94qad3zb1wbND0r2b0r3KajaJ+tL1u4Buh1gJTm1mdZzsnE0
         7egdYHaf2xUfaGHXf3206YbWro/wA4VGhhVjZzSr0l8hcYbMtNPhn9eUIe8drN3sWa3N
         LCzw==
X-Forwarded-Encrypted: i=1; AJvYcCUSsGdqiKEAAtyxjMosaLfUY1Ik16d6mp0YKlm+OkjtgaDd7yvTPM5WeqS426I0TqIje34Bi6GlBnq+V8RjcC/l@lists.infradead.org
X-Gm-Message-State: AOJu0YxX4OTNgv6j4JrHPqC7izvZhqoBHYYGGhusY+tKKZVf1NABaykF
	PEOdf8EDewuYU9YdlTjvPgiy6rTECih6FcRP87xpHwJ6f7o2wWXJN0HD9XHyArIR
X-Gm-Gg: ASbGncuJRwYVBT8iR68NEsCtRzpaowqYgcgAOh0z2O3ldAGGsOKCKjqKqj/S/xDktHF
	SyTLcPYyfU7D9HqyvXutIByL04Grr0r/qdztrqf5JeNIA4GmMeda+e8TalBgpHiE3/Sa4Am9Xwi
	efRmBqPEc95wLNQD+fz3VZS1OC5DfJsRtCG4qyLwQSSIUZAFTFM6CGvNAzlpCfLfN/VNMcpma2T
	JXn/q1b7rOwcxYkPrRdolUBBgd1SH/tjJPiJCiTLU3wn9VlGIQHUT3h7FkXIWCrpzZTMpYJXuMB
	df8CvIey9GN+nLjCJFcggPXzhQPAqBCbjctrnUrI2nOVNeqrzHY3gkHd2OhC/Er6QBth084wV+P
	85QUixBRee0gFngBdCqUyNI7V6b9q83JdVLA+UWXh3Zhd2LoSSuey9fk=
X-Google-Smtp-Source: AGHT+IFHy4qiwNK/u4DovWZOtpP8BdZyJBZ4kA/yD2GvPAeuK0VwX5yA9m8lYqaL8ymejuv0v++Xeg==
X-Received: by 2002:a05:6512:130c:b0:553:9d73:cb15 with SMTP id 2adb3069b0e04-55a1c4927a6mr1530049e87.15.1752597196068;
        Tue, 15 Jul 2025 09:33:16 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bb8acsm2372680e87.51.2025.07.15.09.33.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 09:33:15 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so577921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:33:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJR2tqp+PwARB5LNxUvytWP9x6CuoKuQWAWuKYVw7E3R1rN0RM5DM9XAeF88Oj2Zi6PrZj9dqsKHXDL4ZWC8lK@lists.infradead.org
X-Received: by 2002:a05:651c:214e:b0:32a:7454:4410 with SMTP id
 38308e7fff4ca-330811e3685mr8516981fa.16.1752597194142; Tue, 15 Jul 2025
 09:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 16 Jul 2025 00:33:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67XWOQQnFterdYixP9JjXAop0=nOpwwtj7Ede6THaMdUA@mail.gmail.com>
X-Gm-Features: Ac12FXyC8zkOlZ-J70-qmRzAihPtcAEM5lb3HzZX18bW3blmNya4r0lMEGeXzOk
Message-ID: <CAGb2v67XWOQQnFterdYixP9JjXAop0=nOpwwtj7Ede6THaMdUA@mail.gmail.com>
Subject: Re: [PATCH 04/80] bus: sunxi-rsb: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnd Bergmann <arnd@arndb.de>, Zhang Zekun <zhangzekun11@huawei.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_093321_433196_35966E95 
X-CRM114-Status: GOOD (  17.11  )
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

On Fri, Jul 4, 2025 at 3:54=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Could this go through the PM tree?

> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ail=
us@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the las=
t
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 \
>                 pm-runtime-6.17-rc1
>
>  drivers/bus/sunxi-rsb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 7a33c3b31d1e..82735c58be11 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -373,7 +373,6 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 r=
taddr, u8 addr,
>  unlock:
>         mutex_unlock(&rsb->lock);
>
> -       pm_runtime_mark_last_busy(rsb->dev);
>         pm_runtime_put_autosuspend(rsb->dev);
>
>         return ret;
> @@ -417,7 +416,6 @@ static int sunxi_rsb_write(struct sunxi_rsb *rsb, u8 =
rtaddr, u8 addr,
>
>         mutex_unlock(&rsb->lock);
>
> -       pm_runtime_mark_last_busy(rsb->dev);
>         pm_runtime_put_autosuspend(rsb->dev);
>
>         return ret;
> --
> 2.39.5
>
>

