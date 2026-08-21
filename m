Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A9C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=savjDRzypaWpuMo2A7Z9mQU2Ay+uV7mKsZsDzwVuIC0=; b=tpJsJsY3WXUsaZ
	IqMdVqocnktNrxSZyysXdi6X76l+srPAFCIfyTNR8DJ3UyYlnG5mo5UqFaCGboZyRrzU+ANfF7Qvf
	XHP1F8MPUSEmZNXL9lvMwmEXwFGKfxOJ2q08FnSmpuew/15RKyqZmMj0gmY16lWscqadbVLPl4doS
	9J3qTHeemeUP6M1lv4uKXK3vSh/Tgyk1PPAZuBpwkFKVuNjx6Hf1e65Vv+6ST1qr+KLwDTJy6r8V7
	6kqf0/LPvK88iO8aAhvExvFx3CqJmhKSTh+1WddUCNW2ao2EhhGVRG/MlF7rBm5falcpky5u9bDep
	pjJl4WR6rR4vaJ1bvpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPV5-0000000DRfP-0Zq2;
	Fri, 21 Aug 2026 13:41:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPV4-0000000DRez-05PC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:41:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53AB84342C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 13:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3802D1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787319697;
	bh=savjDRzypaWpuMo2A7Z9mQU2Ay+uV7mKsZsDzwVuIC0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fpY13xRBJmfBoDF0Fi16I++w19fcPtMULYKneBUd0KSJbWscayXh7wqOrDgsaHm8A
	 rYs0RZEtuNJhV6ieZrtXcsGmNiIxJeCA1Ze5BtW3sxt7MWxAJceR96nKAfoDyvPTM3
	 hKtYTFI4zUytKB/tdMi46Y+xL3CDqEvevF7eOVHLmVqtp7drDbnzDb7JJrdcAlHQud
	 PScVVEgzOk78JUCsthSjeVMaZbnybWIuA0c8FxJQ4JaxP9vL7OyaSTIcUiDkpC4amX
	 31Gj6tzRjS4/x+rnIns9c/H3lMfFms2dSUzuIzSMfXr2MWdCH0RuS0qPBPW8hUWuk0
	 IxpZ3/UhF8+yg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso9505741fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoANPh/hQ/Zascunv95DlPM3s1sfvwznRbb544+MZG8DisOHNF5giHWlS2xHxvKEe1ze1zOYf2uckHNAqpCApaD@lists.infradead.org
X-Gm-Message-State: AFuF++nYTEWNJJ2PZt8DfKINHNseFS72r63tWlDUxhAC+W9CdDN/+BES
	9H3kwUvcXlfjqU5rWV6DmcKB4HfJiLIkY1k7R2xJCG9oyIX4etErE+NmV0vxAqkzE5aeH80YXxO
	31caF8sqhA86zU4sDBrLkO2kMUPZYSD0=
X-Received: by 2002:a2e:a554:0:b0:39b:a75:e8da with SMTP id
 38308e7fff4ca-3a1aeb53dfdmr17313911fa.3.1787319695666; Fri, 21 Aug 2026
 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239944.git.geert+renesas@glider.be> <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 21 Aug 2026 21:41:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v6468b2sH8uiKtdaLM+T4vw2i69SiH4uf6H3iOhvF4aCJw@mail.gmail.com>
X-Gm-Features: AcwNN1UwlPg8igVRqeTcbGzuXti5pk8Q0JsLEMMpjQ-PubogbpTOAywOmnQUcf0
Message-ID: <CAGb2v6468b2sH8uiKtdaLM+T4vw2i69SiH4uf6H3iOhvF4aCJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
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

On Fri, Aug 21, 2026 at 6:03=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Chen-Yu Tsai <wens@kernel.org>

