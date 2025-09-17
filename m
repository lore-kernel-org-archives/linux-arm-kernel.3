Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2676CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=; b=DwXh0GMnGZmadfSyZozl6SJDsl
	LmV4XXWVOKO2y8Dxijkxoow4QXOwpP8ZMYED01QnsUTuiQ+5UukAhGXTTi6NH8N7H4Ceh8UpGkaOG
	4RGXJh5bm7mI/1+VdUD1Au1kRGuRZRHeci6uCql4HUDLmeLSYhE0frftjoCH2UR+AkVAbnGQG81Mk
	qok8t667F3TSda2XgAzw+SqkROhwizzFUlKMfmTM/cvnU0/w2fnmwdSu92gCaH0XD+jS1S73gDdDA
	UnXscrdMGWPue0JHVVd0eUodpNXLYrAVrgevA3YuF/ctlkesMRXdj4Tk0g6ReK8IH6Z1239fNoGZ5
	siFqkcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDG-0000000CFjW-1nSd;
	Wed, 17 Sep 2025 14:32:50 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDE-0000000CFi1-0stq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:32:49 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ea3f6ac31d7so2766772276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119567; x=1758724367; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=LAMprJAXB8Ugc2AMJ4HAoG99DFuD0B9qm1bBjy2BuGCWGs29r5jjMdOK09GRslB9d0
         oDJslLJwbvjiVGbc7Y9Mloc+W6ZynxvTUj0WGR1k7vometSil5AahdjWM7aMV1/1em3f
         1wPag7ixntEHXWzOvi6h0IZQIldmfbmyf5fvnwuFIQ+hFGARBLOayw7sMMO4m7sslNbo
         1zrJOQWCCWS4zupCHv5xqnj2PeBTm68liHKuQ7rzNJFGDYsJDG7YtMvvIFO2PRYWoRHP
         Mkq4hghTGlOA65TN2Ivh+E/H3ZicTP16k7mR6l7FfDAOLBfBkQm3/hTROOLRFwLqHrMB
         orfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119567; x=1758724367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=tW1IvbGJ9prtX2FkSsJiY/2G3y16f735mbzdabFL0cy45GPNKEccEclVSKVXMyEH61
         gzzMX2a2azrt0mtDkDPWbd2AhZIaFFfBe3kBpY+0vbLlz1Js0qIn67Z2iFqDycyFItRp
         11wTNx6JIoC4Wxpfgt0sGGLSx6USLW0ngL8ujcxG4uRxVk6JLdHz29JKQmO7q3wHJSxF
         gj1T4aPa0fxO6sAqPS853XWkGKllyi6WnHbONLcsEnjjriEHhy4IPD8bfNsZHtlJb3ny
         GPF14wQH6sEXx2mvWOSWUGNi3Gbx4xis/fgQDACg+eNfUpakjlbCejl6+lWq+0TqUI4P
         g9ow==
X-Forwarded-Encrypted: i=1; AJvYcCVRYYcY2Mw8GB1UByooRIObmvlsnqcvQyAu/ys0OfJ/WpodF6DHEEjG9o0xVruOkB4xQ7K3CuY9F6q/X1Jiznui@lists.infradead.org
X-Gm-Message-State: AOJu0YyuDjVlgXtxJY/+B+FgQFG9E3zGckkKLN6t11kCuZESNHDRlOHt
	JArdteDheyoz4oPBl9E6RgeO4OD+xN0MSdwF1Ntw1wuvujB7MxX2Rsnebjv/P58sK24JTR2/woG
	tZB9oUYMHOuSHqfj8eFHFHkT74OU3dSd6lAjQzp26vg==
X-Gm-Gg: ASbGnctvKxz+XDIT95GTXkatR7lRuCcVGwzAFwkdKSBK/ttSyQR3lWZHmSwbvJSgkJM
	5hKq+h2pVkLxVwml6Vdv+t3Spvj2FjEyzPfbfcev5nF5wpSyxhOyByrWSJszzpTXlIn1dxoH7vg
	KFXVsoEktTqUaYRpfT0WmjOa3uzUUxOixs8Acp3ouiwAntKF3k7EXKZkHsdxFOTEUIs9/Gq0WQq
	xmrxtYi
X-Google-Smtp-Source: AGHT+IF8958qtxMgepRmmh01erhzEe2CCKMaB8p0aTdmbEk0KITYYPXFKjQVfYFyDlneSgtW8sFxeX7TRTnXN5JBV/c=
X-Received: by 2002:a05:6902:6c1b:b0:ea3:d667:affd with SMTP id
 3f1490d57ef6-ea5c06c1586mr1899822276.53.1758119566841; Wed, 17 Sep 2025
 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com> <aMasUV14w0Dc1ki0@redhat.com>
In-Reply-To: <aMasUV14w0Dc1ki0@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:11 +0200
X-Gm-Features: AS18NWC-l2ZajfsWo9MjcYD2GJjmouYf3pDYfF1nnijLrVzTzi40JFoPMgBPLz8
Message-ID: <CAPDyKFosHY_aVP3EdzXJj4=DvZCPfC5c80oSwTEeyyV-7MRQJA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_073248_257401_0E86238B 
X-CRM114-Status: GOOD (  15.19  )
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

On Sun, 14 Sept 2025 at 13:51, Brian Masney <bmasney@redhat.com> wrote:
>
> Hi Ulf,
>
> On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > appended to the "under-the-cut" portion of the patch.
> >
> > Note that prior to running the Coccinelle,
> > airoha_cpu_pmdomain_clk_round() was renamed to
> > airoha_cpu_pmdomain_clk_round_rate().
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.

Sorry for the delay, applied for next, thanks!

Kind regards
Uffe

