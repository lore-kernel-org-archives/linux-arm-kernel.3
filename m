Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1079FE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 03:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X46UpLW2j+eyZ6ykAjkS0HlxNYklVA+kQjtmNdaEaUs=; b=hpiW119V/a213g
	KRjB4tV+f8hdDWmGo6mUfuZx1SyTroiHUn5keceWmfRmPYHTx+C6D49S7YOhuFHuNPJrFMX761D89
	iJGsVUafLouPNVHVIf2oKMcrsvL6d2iariC5s41t3chjz8f9Wb02C4vHd07kzOZs3OrZvICux8eCM
	1j0ARJ2ZdhMKyysX4+tsfW8K3wfgGicJWu+lzDNG/RsSX+9L3lzUar92M1JEzKwn3sJPgERTgC2Bd
	xckteEnbS6PLyGwrYocK8kTwemak//Yocs8vf+NqvMytqN8WuyeTMYdLakk/GswHGHzH+7FOFWRjB
	sSOXQ4fMja0UA9HKVlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsv54-0000000Aox6-2HcA;
	Thu, 19 Feb 2026 03:51:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsv52-0000000Aowr-33OR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 03:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9C936132F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64916C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771473115;
	bh=X46UpLW2j+eyZ6ykAjkS0HlxNYklVA+kQjtmNdaEaUs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=La4X65W6UQ6ne9cUU6H55pRNgKhI5jBhi55Zj0Ym0G63aaG+rrIMo/D211v1/gLha
	 H1GXM+6YGhdTVtrs8FjDryYB/hPmC3HSasw/WgjAlLxjduM+XY2FBOyA8nWrYEwmoT
	 2ljArH4oOzoRAexxb2BYaijdTPgf0FWEhq1z9z4XXTMC0d8LT92P5/CJeEuQld9kit
	 7Go88e/N5TRnEQveqS6MN+1MUl2EXFGXs/aGgjxSrQg66MBh7EhtuJBBFi9YfkEETc
	 1Lca7nwdZ7ObS3+3uGPzD2SpnPG1wn5ncXtSs/byesyvzCbooNxyQQayxh0T49Mh7t
	 tatYqoBVncgcA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-387032e855eso3964051fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 19:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVo8sLVBeK/5BdXYZLyxWw6kq/cBPtY2U+gDsnFTSsJlM/18Knn0/srwhgpOkx4EFn/P7/iCHqvVEApMoJifHdx@lists.infradead.org
X-Gm-Message-State: AOJu0YygaPw0KPWYVcXhqJWoqqtvg/sBXVvPoPm3GE9wKPqvUw3bxhav
	FnzFPhmdn0WccfDGhRfYM03Raa60DM2Jv+/Alu/daV7MjfeymSDVXkfkQTCqS8HezBcKwVm0yGT
	eOQaCkmHbUfaBZwYhCm7nwDZN6C1xo60=
X-Received: by 2002:a05:651c:e17:b0:386:4776:2a04 with SMTP id
 38308e7fff4ca-3881b8da106mr46506631fa.16.1771473113628; Wed, 18 Feb 2026
 19:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20260218183454.7881-1-jernej.skrabec@gmail.com>
In-Reply-To: <20260218183454.7881-1-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Feb 2026 11:51:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
X-Gm-Features: AaiRm531971J2FLwKv3FM0ppn6z4yZUtNAfD_zMfFtAHtrup-P3e9dbLMfVsCt8
Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: mixer: Fix layer init code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 19, 2026 at 2:35=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Code refactoring dropped extra NULL sentinel entry at the end of the drm
> planes array.
>
> Add it back.
>
> Reported-by: Chen-Yu Tsai <wens@kernel.org>
> Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvj=
ght5hAKDa1RUyo=3DzEKXreg@mail.gmail.com/
> Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of la=
yer code")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

