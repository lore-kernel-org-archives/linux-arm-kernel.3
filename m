Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24083C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 02:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK4KlxY3uUa17qisCA7GoD5gggjvWR4zuA8FgG9CVRU=; b=HO1VKHxeusHG+KY39v8WXB6df3
	J0mc3tnkz4qfRZjDYLsJp9jcXIcqx+axKesxYftwrmMlU2Uta3taegTo2pD9W4mPDDHXNocWw+XF2
	op5KIkehxZR/lled7peKWEdIIYEKzXqF40vorUCP6MdjkCG/m9Hq8YdqQnWMidw+eI48mkwcmfont
	hCfBHUKqHho0199WhaKv+ktQTYrhpSAixMHz0xMSwK8If0PiX6US3wcTwPWvNCbcBi+azwMxc2YxD
	heqvM6vDLoGJ4gkR/YFPEmWxNOw9uI7XgKrYE2797CVC+cyTV49b7PjfvuVsTRBedaTcXuvOs+xOC
	nXVFvu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsuuq-0000000CxPZ-2NZB;
	Fri, 14 Mar 2025 02:36:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsutB-0000000CxIm-1r7p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 02:35:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-549963b5551so1626763e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741919707; x=1742524507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK4KlxY3uUa17qisCA7GoD5gggjvWR4zuA8FgG9CVRU=;
        b=aZkVeF11QKup2hhSDV4Nf15ZRNl7mn8hQg0aPNQlMazblR+pU2zPd5pMcfRbIOubge
         O0GOOdvJjJGR+hceTKoD91eg1MNY/BKoWKh+4uIpMkHNsGZund/A2xpV6qqFRAh7aTSG
         aT1lDZe7J7hTNZLzaYUYV3x3EEC/nPo5Nprlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741919707; x=1742524507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK4KlxY3uUa17qisCA7GoD5gggjvWR4zuA8FgG9CVRU=;
        b=McN+jCV9fqn9uTXxkyZhHVjmuDyjFGFV2EdhbHemaNwLo3v9nFmGLcPNbCjZdU95qF
         xdF0M9z0SWRv7UJn1uHev8RRTQtoFI/M0Tmr3XpYa+dtwmVT+j6gI4rsiZRarDaGweaA
         01lZHEgImc0PCkH05FOxHMoUaGWEgtU7CcvNH97hGTEMjqogSerESF1fnIJ3A1OPYJ++
         /hSsCcmdTzuuAeDQ6WuL4pB7jGB3x+zc9ilnJsU/UEgN7sGf8z3Beu9orU8lyrnDwuj4
         IbCeBZhPqGIlMXO1V/Q1n7jJa/SKvXs89qqNu5mtc+WzKFLXy1opSEJJMH7sMENPGevs
         Gknw==
X-Forwarded-Encrypted: i=1; AJvYcCVXJtzhUDeLatHjYFzeEj6OMQYVFeusoSvw+ll/3/9OGc6lcq5fsBBzBRTGEWDvbtHg4CKZK+NWyhDEEuMrHhZ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1gl2GlgsmWcCCbkIUdKYLk7wZzLIj9qyW9t8s7zXPl4aTcZ0z
	SfPq+FKVJtbuUt/9h8OQzTyVRAXeSSj+DYPauMLV6H6Gmcv4yYRnX0dDFLvPf8u/Exk3wuBYRpQ
	+e6k1
X-Gm-Gg: ASbGncud5p2HUXe1hISKOdHw10akllmghnp3FI1iQjZ+sIJvXb3kbjDuHdn48lU+VZM
	+nbGQu4YwvX6Du0k21XUcjuCKEfzy5VYF9btrB8iYgZX+TEZoxQFZlmOWu2rulqpkOGgxJJMq/A
	apoKQ+uqeLaIungt5fxpiaRTstRTfwdPvrZHL5kE0xPDhhYy6dDCEbvmkpD6WL1xgUNbbe5ENrU
	7WrHc4q29cER6HMXy2eYctVnpdUm2l6E/+3PmmLzjU5IgjKI7IT0EhLvat4ZyPILMeNEOm/Nhu/
	kz4eFq0puz6WYgDdkJ73QdFKqbbvX9STMe2SfUBNvEMk5O+fYlhMKsGDcZcFT3X8Gl6DA1RZ0pU
	H9yEkJSCADYGVWZCDo7g=
X-Google-Smtp-Source: AGHT+IF9rJfapup6v4PKqx+0L//wNE0WY8eUk1TSQZadfMRGHdG3jUcqC94edi+jEGZooXc1bw6Ipw==
X-Received: by 2002:a05:6512:3ba3:b0:545:60b:f382 with SMTP id 2adb3069b0e04-549c38e7059mr227866e87.17.1741919707111;
        Thu, 13 Mar 2025 19:35:07 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7beceasm389510e87.58.2025.03.13.19.35.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 19:35:07 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5495078cd59so1726943e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVmnv2kUJZinG5lNMDHXZxWjeOPxqg8FfEpl2H1VQsPNGP8T+8U7xdYCNkquVy8ko1mM+CYPNBzaPSyef3fL9B@lists.infradead.org
X-Received: by 2002:a05:6512:3a8e:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-549c38f7d9cmr254376e87.27.1741919283647; Thu, 13 Mar 2025
 19:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com> <20250310104114.2608063-8-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-8-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XigZ7k9ZmyT8wEeJKB79ef4ut7XrKdmXGqLbwdbxwe_w@mail.gmail.com>
X-Gm-Features: AQ5f1JqOO-vARbb-qxWvQyFu_Kv3lXKxcHR_dDdzPTPbj0JZAG253PMvReLZCQo
Message-ID: <CAD=FV=XigZ7k9ZmyT8wEeJKB79ef4ut7XrKdmXGqLbwdbxwe_w@mail.gmail.com>
Subject: Re: [PATCH v8 07/13] drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserted()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	boris.brezillon@collabora.com, l.stach@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_193509_479402_F5EAB940 
X-CRM114-Status: GOOD (  18.02  )
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

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> Add analogix_dpaux_wait_hpd_asserted() to help confirm the HPD state
> before doing AUX transfers.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 2b76a9cf3bcb..b7e143b3ff75 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,26 @@ static ssize_t analogix_dpaux_transfer(struct drm_=
dp_aux *aux,
>         return ret;
>  }
>
> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsi=
gned long wait_us)
> +{
> +       struct analogix_dp_device *dp =3D to_dp(aux);
> +       int val;
> +       int ret;
> +
> +       if (dp->force_hpd)
> +               return 0;

As mentioned previously [1], it's _possible_ that this should have a
delay like we had in sn65dsi86, though maybe that was to deal with
legacy device trees? It's been a while. Oh, I remember. It's because
even if HPD was hooked up to the controller like it's supposed to be
we don't actually implement HPD in the driver for the eDP controller
(long story). ...so we worked around that with a delay.

Right, so your code looks correct. :-)

[1] https://lore.kernel.org/r/CAD=3DFV=3DWoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq=
97v4GAgvmw@mail.gmail.com

Reviewed-by: Douglas Anderson <dianders@chromium.org>

