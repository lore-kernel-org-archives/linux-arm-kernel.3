Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E50C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2gfAZkyk4xRufN2QtIfS1D7YKImCe6b/UMEIBj5tRc=; b=TECX4sdGT11Jgc
	/addS2e7CIFop716QK+LaC2L8mKHIzBgT8xaQU+KUwoiDaAoQtlbET7NGPQUcfs5FwuV2fMLtoYcR
	rsemI0hW58PkpD0ZzdIBPTXxGXoRILB7xu3sGGZXt2f7qTMrTvbkULw+Q1/q1NMWAUS6YpQRH0qW1
	yAGxqgO9d7YeImA5twTkzqEoNQZgATe/HgsEBtqT3w+mB6j4joReiBXtTF63irTuE3cYV1WuIQKrG
	MYeX8J8d41wseUtvwWEGekJuHgAj52KWKrZwM3dpNJ41mmJq99h/qm9q5x7XmCYvTlnCZqQTze1Jp
	NuNjht/f7tprgZmXyrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw6d-00000000B65-3a28;
	Mon, 03 Aug 2026 17:05:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw6c-00000000B5b-2GBc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:05:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC1CD400AB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EF11F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776737;
	bh=c2gfAZkyk4xRufN2QtIfS1D7YKImCe6b/UMEIBj5tRc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i9cvgNP9dhJ9/8hODj/v53iE5zr5IjnSJUupoeqUbKw3P2H0cfbsLBzGFGnTN/mtt
	 6KlL8YJlDpqGXQhMH0f30Tzg4TvF6JsrjO7Cg8Zf0hNW8703Lbc2QHSA7kHrvWQXhx
	 jDOhT+drKPuEcyZUrZsWtuPg6sj4ugxPcLXXFE8HbYxIpOWn/GZqmssSee36Yvztu8
	 ZonxqSyRQxl9FHnhYL1CZ6f0H/k33GA0iKDmJrvI+E0s6RrgA0o3XZW6iIU7C13QsV
	 VvTaVtsxFWNS0NRxNmxjRku1YnFdM9Fhk1DkJRr8z06EmyDOWjHJAy615q7H8zxsk3
	 EdKeCdPCCMGOA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so35194591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvsQs3J4FHzTzrSWtA13DfYHkWy7Kf5A6gMIaQnBnwGBDQBrV/hSA92GzdHxwc8Y53elN1Rdg1ZPds8m5hulUw@lists.infradead.org
X-Gm-Message-State: AOJu0YztDGsSdszrRhcFHz/qH1vEvxaCq51rG0Fn3iaLN9076pQR/VXI
	N5e9ZFJHStEbyKjbbzFfyQbmRN8ZmIJ/0kR1lCL/TLnMFuqHwQn+3BnP69O8LisDBW4tO9EWfln
	FZPC/Nk/7F+XD8T1uZ4iI8CWPwgA0i3g=
X-Received: by 2002:a05:651c:986:b0:39c:828a:ec34 with SMTP id
 38308e7fff4ca-39f861773c3mr21982061fa.17.1785776735852; Mon, 03 Aug 2026
 10:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:05:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v65c1EPRHV-Z6XzFZ5zzAktNe-Jwa4xVg+uEKLa53nyo+Q@mail.gmail.com>
X-Gm-Features: AUfX_mw5xi07aLKCN5EAF4HzTDdU9oLlVE2csye4cS9ilzpUotzn4YEaJKAhogk
Message-ID: <CAGb2v65c1EPRHV-Z6XzFZ5zzAktNe-Jwa4xVg+uEKLa53nyo+Q@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/sun4i: dw-hdmi: Drop TCON TOP port reference
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

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> When the HDMI controller is fed by TCON TOP, the port node used to
> enumerate the possible CRTCs is never released.
>
> Fixes: 57e23de02f48 ("drm/sun4i: DW HDMI: Expand algorithm for possible c=
rtcs")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

