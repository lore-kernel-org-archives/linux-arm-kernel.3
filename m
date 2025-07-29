Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9137BC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=; b=w5lq2bp1UYC7Jorwo6QgKwieUY
	Y/1VJ15k0/hRqByQoNVI1+uaShkIYRF1mSM3w5PXvExitJ0LA3/GSBtpvT1t6VurNn26WSp5wRtSg
	KhuEfrMLCWZe96JQozpmVGlvICs0tsu/dp31ZCrK/8et0+v/xpjt15UtlNGNVU+yhYamBp6HqmfYn
	bSnXFlfblnLmmOWLk5LuD2LSwO95Chg+ofIJLonIyCiPxxuQe6qJ1Bu64ptRKW7xeTXqNRiiBkQsV
	Z5qlMI+6S4WaE0OJyPjc2UzsbkMtSiM6gYZnzxdfzHdESWaXRZg7oTJegftFFhubz1IxNeMBMj5UU
	YD2KwTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uge0N-0000000G2Nh-1kKX;
	Tue, 29 Jul 2025 06:40:07 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdxu-0000000G2Em-25w6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 06:37:36 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55b72633aaeso1201885e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 23:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753771052; x=1754375852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=UxmFoUjfEFukCCItWOQ/e5qGBo4Fzh1pLvDDbs3+xkeeCxKZXeW77arwSdLciev/XA
         2LKQqfzA5WsX5Bu4S6/QaJHnbpbkPkwrLgcVqN1FavJRi6cpIDGGqC2z8FFZacuMgXXg
         8JaG/FvQZciaM557GOx+yN6CBu/LdWeszAxOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771052; x=1754375852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=IHE0HfoJI1TiW83jq90qKx5OlBMJJsIesOE4kKOsAXko5Ng+wVBCmD0T4c8jOUpJLS
         /OAeh3+wYB5KY+31v+zljnYQv7LMR03+DL5sJliZPCE6nc6F/JIQdRhCnkcI4EZCWG01
         rrPLZzblRasm7GAb8Hg1KR2Sq9ANZpFEUcR6yKWinBcWXkhmPgVPAwcaw6qHgl19lyNr
         YfR2TbFi57vnwEMYWyRum3ttz4GavES2GbY3kkbZ+QdWj0h/lMarBSkzfTkbfogWwiet
         qhSh2m6IV7DfCvAsR41Lu7iMn6MgrC1Uqh6643oUf4Hy/NaV923EyQGAr3i/QHc/9Wgt
         MU+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZLoryzPozJw2+TE9lQqjdSBmuxTduN5LFGbV16UxqjXWkf7MR0KyDSw28bZkTPZ4rYW4OaELKM93uI3ydgOz0@lists.infradead.org
X-Gm-Message-State: AOJu0Yysjk0+Ic8LfuBlP1UMbOOvQoVnpoQMvAuT7YNkLnFZaY32B46q
	ayUFAqxgU+kl1geYgs1KI6PckquhOe+2JfyHO/RCrpucZvvHeE8dscsx4fO6eQJ7Ii+U4hAXLeI
	iR0jpy+T8MnBgQzAzWQGlcB6DWg4oiY1C++u6Xkqa
X-Gm-Gg: ASbGncvJzcSX1AuCH5BEGFbC34q732JkpgUOveu6ub6x8y5p4iSSnwWezx/CIYMYhv5
	tUzg550GWuUJQmtBrdX8tWfUG4rHsM60N44G0MVivCRnzHA2//f9eYXmSFo/nc8vHJfnZ8ttRMH
	McJ7zWVZmBcdXzrwo8SmfxB20Mkfr49trTld1PkoO8jLBv3tjM3/FYDWbmoKUY2O8/VHCocxi8i
	QpPQC4hHVErqTtQxeBhcqCDD5nxqnuYOSxA0vE7Beyn
X-Google-Smtp-Source: AGHT+IEgvlc297To6fHbXdTZorsH91fq0QGaKclycxBL1IjMJRB888ehZGOrD1mGdyChv8MiWaDPZvyajrhgWyt/Rok=
X-Received: by 2002:a05:6512:3c84:b0:55b:57e8:16c4 with SMTP id
 2adb3069b0e04-55b5f4abb78mr3766968e87.30.1753771052463; Mon, 28 Jul 2025
 23:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
In-Reply-To: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Jul 2025 14:37:21 +0800
X-Gm-Features: Ac12FXzoxBPnyvKXGXlu3ix-9ADJidAZNN4VQPkrQrPMR3ZfP3Di7o5rHnp5ZrM
Message-ID: <CAGXv+5HCnAXoPJmh4ewSF4ay=qRVM_BK0w17yvjbx9efktXX_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
To: Terry Cheong <htcheong@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baili Deng <bailideng@google.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_233735_003666_671E9CB2 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, Jul 23, 2025 at 5:44=E2=80=AFPM Terry Cheong <htcheong@chromium.org=
> wrote:
>
> The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
> Updatae the MediaTek drivers to use such jack type, allowing system to

       ^ typo

> determine the device type based on jack event.
>
> Signed-off-by: Terry Cheong <htcheong@chromium.org>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

