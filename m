Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=; b=IvMt8mckUAIZ9Y
	81pxR/pzrG8VxCh6hn38WPb9SeyMccOLY5Fa8Yf/L0GKRtR3PZr8Bu69sKxA5c5d/jk4BJqP5edXK
	iIHzuh/UL3jAqTol0ltttvUiUMc19lVhshG+090hSb9NscLCr5VV5/1yjkt3ersxNXbRHfza29QNf
	ugTH/Jn+qymYxZjr75qeKCLlANroubnl3L7cXph7P9iwxGRUdFmuYcQlf9wk7X+0IxiZRrv6w/WoZ
	ueTmdY2MM/jLevTB//83lR9oh45K1DLJgLZWpd9QYdVdQBPKssJJrzT/DSu3b9kt++3sSDKbV8sPP
	LJBpn6Y2ogFmTvtyeDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRMb-0000000EUAz-3BpI;
	Mon, 27 Oct 2025 17:50:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRMb-0000000EUAq-0HFM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D53A61474
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0837C4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587435;
	bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hPc5udlmqmgZFtCyuwcvoyF0vHryNuhDjCkhPV1vzvSz+5k+2XSb1nJqPEqXrloqQ
	 G2H/VFN54GYkbFKD79Mkp4StJfyREDjFMCUtEi0BmhHc1tEngsDtuoVi9a93NRHIOl
	 NNNXLuENNF113z078ll+QdiiyPQNz/hEam9FePbsg6URFCREKBL2creHYabr8WuzZO
	 I8jgr50Bh3OhHcEczSO+P9JFyWX1R07GUOI2A7Ijm7kf5KXWTkYuSxmiNjVn1/dVjX
	 l9hsHViKHnowTnALtdy7v4H7Lxl++R8UNr6rb+V6Azqe6gGJVXlo5FXS90iyPKT+BB
	 zaenp7vq3KRzg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-362e291924aso41243261fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMFPTH9KPc/FHvBQkjFQ3PGi/DDHfPAehbz6af8LKGA/6xFCdvMeKZL8r7DIHD0cKcatHS4L8MYUztTzhokx2/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqsfa/Kzt25z2/G06B/RHRce4nwAllzOWgqOB2F56k9/ybkquu
	PISo1qI/LADREewtfphG5mcIhQzhPshFVu+0I5VzUbJTVOiceAVVYkzZy7m4BVb+7IjvaA98dlP
	bF497/TQN/G2R2/dapBHQa6l3MfqfLuc=
X-Google-Smtp-Source: AGHT+IEpGNxxA7VDQv+o8rVV0qXU7mdmIaNInPaLQFSEX+7AAmZL6Vjak813oddK9k7tZDInWi03lBY0pbQ9WFw1kig=
X-Received: by 2002:a2e:9f10:0:b0:378:ddbe:2d93 with SMTP id
 38308e7fff4ca-379077813a2mr1483941fa.40.1761587434294; Mon, 27 Oct 2025
 10:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-20-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-20-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:50:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
X-Gm-Features: AWmQ_blUGjau3HSQfAh8dWnb5YOCLFjTOutdiwr-yTqdCVXgYeAKGne6ORl8okc
Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
Subject: Re: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer
 for args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
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

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer related peripherals should take layer struct as a input. This
> looks cleaner and also necessary for proper DE33 support later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

