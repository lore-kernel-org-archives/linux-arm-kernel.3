Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74210C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BIxNZpAxXmgtUZVoY5Vf5YilI6JIk11YmgayAzmSTM=; b=BrM2N/uV29gafSrX49M6HNojsU
	37Uto9z1XK05Vsubz6Osh4CIxGvL/N30ba73RDL3EFnkxgoAgaUigRxiMHpnKQBnPQwk3tA6xE6B0
	yXHvMoNHC+luH4PD7JuBfV8tDVdp4vAPfWpfDddFmg3S707Pbf9BCKe8UB3tCQ9c76exqUGKcOsle
	SL8RXqlrP074MLLp46D5Q1lErVD2Riz/vcnQ9Q9HZQfJm+pGyPpxJJf/ZAqbFA9pYUuQDOfmUYXIX
	WosUQrFZPTbTFs31GjJtMiFAXTRX2ciX8qypCoOp+3QH6sweyTz77JAHhZt3oQZUEAFNjKBln15aC
	P1WfKKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk4I-0000000Fjhk-2oUD;
	Tue, 25 Feb 2025 01:49:06 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk2n-0000000FjWU-1lsR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:47:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30737db1ab1so39630521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740448051; x=1741052851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BIxNZpAxXmgtUZVoY5Vf5YilI6JIk11YmgayAzmSTM=;
        b=arKeGKsURDcSuNzEebDBDjx89ZsCrFMhDar79l65e5lccPFtOCLFlCUHsCg24YZkqg
         sfv3fzjk59TrIsTbTGBb1IW3DVAMm32JsQ19QdemmpTEcTVaDCiE6zeUmLd+c6sAPz/N
         FO9pQWylJL+cmeYncNVfDguubKgvfsUxGT2fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448051; x=1741052851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BIxNZpAxXmgtUZVoY5Vf5YilI6JIk11YmgayAzmSTM=;
        b=QMi6qqF1OGWW84ViyGiWicWtgzEZtkMWDo+19eNECd9eyoj48Sj7uxtVe154OV1TjL
         8qAr841gF3VMD1HyoZ9k/X0E5DIFMYjK0SEwft2ON8YpkWNEnNxBWtu2RUbY51zy91xd
         9ozdg1bxCWgLdgzSNLFp5xH8+PH7e6wwDidTH9PyuIJCfEqwGaY+3Hnl28GoMDpzIlH4
         L28KzSv/qJf/F1PAsbZGlKMDGL0aJ5fxJQq2wFlUb4BY/zGf0qDq8FJy2VEj69GvwPNH
         Mn57DnYqS2mLVj1qV85dMmHt1ddYgEJGvQWIaeqyTag9Ka+NASuIY5f5Da/PTfuyGWgD
         wILA==
X-Forwarded-Encrypted: i=1; AJvYcCXmWnlEREX4bB8C+dp6/ApUz5BlY4ak2vb/33c8l9wyTvIPTeN4W8yG81SUllUDTMADPROpckhlwqc10b6WuMgR@lists.infradead.org
X-Gm-Message-State: AOJu0YxkNMgj3+yMVC0Ar4GLmXnguFSiHcwWiTW/thQABFOH2QD/cTVq
	Ax33V83ukdYk2zsZnThylAgq7xrzunGWrQgVasXQCzjP9kFGBJ9O5IFU2jWDdrk5+2TPDqYV44F
	u+que
X-Gm-Gg: ASbGncv9BY0rAkEYMfZf9lFj9fTgNhxxfh2ZY1wuXn3Nty0VQSIx/uu3nDdmQML8Cpp
	C9o/ilezBZbs6SOL+guvc69o9ToJBL2q77CXwTRCKBphGYWSDl+IDHXyRF+b0DspqeRwj3LVbRM
	THc36n8K9og7w2Vxu36IjnlIi1vNxwMi3OidGOdolHlA6SmGu8YsUZneNq3svNbyFmrKzJYg2pF
	QeCUPLRv8zJEOyXAUuPa94VEJaISvj0spPAhQO6RcWjlxtjKtRVMAbymigg1w2VEGmF5Hyo5O5g
	6w5LXBEbeOyVN2LHGEHShOX8J8whzrVU/GC4m0URHjPOtbmBHQJ5v2mo/yThkuSqseQSQw==
X-Google-Smtp-Source: AGHT+IH+VgLG/lvVqoH8Zq6ej7BYWgrgvYAA0Zb8mrY7qzKfTmkmKJ3nEO/H6IN3Dc2N13Q7/P5ypQ==
X-Received: by 2002:a2e:3a0f:0:b0:300:1dbd:b252 with SMTP id 38308e7fff4ca-30a5b171b21mr43343661fa.7.1740448051307;
        Mon, 24 Feb 2025 17:47:31 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c54sm909861fa.3.2025.02.24.17.47.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 17:47:31 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30737db1ab1so39630461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:47:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7qjb2YyDp64w4MLlzg0E//fc2KXXfkLiYnA4mFqDpogZA9JQkN2afVR3UiXn0Z/tDbajzk8WAkUAx1jsiOyad@lists.infradead.org
X-Received: by 2002:a05:6512:10c6:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-54839268617mr4611865e87.38.1740447670508; Mon, 24 Feb 2025
 17:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com> <20250224081325.96724-6-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-6-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uu+EvZzuFmCvq5qJ=FeBjmLTtfGT4Aq6QBSoH=Sen8PA@mail.gmail.com>
X-Gm-Features: AWEUYZkhmeaAQLOMDj5xS_yarIgfu2NVlCE358kcuOa-b55Ak-RhS879p-uOQpk
Message-ID: <CAD=FV=Uu+EvZzuFmCvq5qJ=FeBjmLTtfGT4Aq6QBSoH=Sen8PA@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] drm/bridge: analogix_dp: Remove CONFIG_PM
 related check in analogix_dp_bind()/analogix_dp_unbind()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_174733_457331_889D1CD8 
X-CRM114-Status: GOOD (  14.19  )
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

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> Remove the check related to CONFIG_PM in order to make the code more
> concise, as the CONFIG_PM should be a required option for many drivers.
>
> In addition, it is preferable to use devm_pm_runtime_enable() instead of
> manually invoking pm_runtime_enable() followed by pm_runtime_disable().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 30 ++++---------------
>  1 file changed, 6 insertions(+), 24 deletions(-)

If someone really has a reason to run this driver without CONFIG_PM
then happy to hear about it. Until then, I'd say this is fine and
matches what most drivers assume.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

