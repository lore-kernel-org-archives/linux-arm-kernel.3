Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F093CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS2ceydtY7arO53figgNl3Skob7MFYJcnB/okNLIQQo=; b=KT6C56vAT8h4po
	bIh8Oa+6Ryc0Bh4g1bWhHco9EvlD4ksTL24coPF6/MJ7QNsb3Jo4w08N5THLweHEZhywbgGs5NLIX
	SwR5KO53VyULauFl6MM1gppSKehoA5mhLlxgJOGjqswwrgt0OBa8r7Nj7+yPsA1MH5MhyiMmkFeUV
	4tmpxvAXq4lP/SYsGgCh80W6SMcqYJU7EbyRMhWMGn/GPhC05Vm6HsxZpMI5qa577FdQsP3/Vm2lR
	JEUWZaqmqtZ3e/K3HmXbgJaH4j+nZVI2f73GlEG2IzSsJRziYO2nXwvheQw6SJXD2Fjh6nbyBztN0
	5fudvrHwYwnkoOnZj2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRG4-0000000ESSZ-0FxS;
	Mon, 27 Oct 2025 17:43:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRG2-0000000ESSB-02Fl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2327161470
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32C0C19421
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587028;
	bh=nS2ceydtY7arO53figgNl3Skob7MFYJcnB/okNLIQQo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=cjJgdn31XIKVTvn/EQRmDwJvDk+eUYujuuM1rf4nIDHf8QMPJnsaHb8ZwxrF2X4w7
	 FN0rCQrr22UjMCXMMgvOCfwTtIIaq8QQuJHGtcJtp1zYhWg7OlI7c3y7HLJAE9kgPt
	 vQYvgjVvfu1tubtbxXnq+MD4JJDp/ev7VlBbHkVjeKVBPME8BlPWj8AA403wkDCBDb
	 D5NU2EANOWv/4e4ipiDfu3b2owrASECX4K6qOre8VZbpFj9Y2Xdym8XURQurHZFHg6
	 Fhl3bvO0LfuVtgI5uP+4Du5TuyeHhVsjdV9i9H+HE0oDjHCEtkR5OMQnFDjdmxDloj
	 pDnqcStXCz6/Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378d50162e0so57553711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp5MTVvZlcXB+Js0CSsWUPRWD454v+Fdp/WdIE2qe3S07EaU4xOOvRJzCFkFMk+kCNUWLMQFnNdtnX0CgHfoNt@lists.infradead.org
X-Gm-Message-State: AOJu0YzZsleY3//iV+DTHvV4kcGq6GdTmYFjGfOIIzsq0wTeuHmlEmGj
	XlTGRlP1EWza6bnKqp+uoFpek7g4PzeoMZ86PFhzy6qAU9B9iuniCvWHtwB8NCg0jokgMm6bfnM
	0MazbDn4HnGqGGIM6rtfbQzLvX3tFK3c=
X-Google-Smtp-Source: AGHT+IFUgpNOk2/lm1vINh6P/T+9hrDdSIGL0HQ0DNlL7efemsNxiG/a9dBuTEttStk6lJAJUQFTUsvRn5K8JymcC2E=
X-Received: by 2002:a05:651c:4112:20b0:378:de30:74e6 with SMTP id
 38308e7fff4ca-3790774baa7mr1284371fa.25.1761587027036; Mon, 27 Oct 2025
 10:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-17-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-17-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v6545EkcOCXYj2GzVNh0NK2CzqLEgHA+3yA0WcHu9jDiMw@mail.gmail.com>
X-Gm-Features: AWmQ_bl_-VKJDXdC4sK8FJlKiPnwMqUHPzZ_DuY_Cd04DihfBUomCFRnXNe5gis
Message-ID: <CAGb2v6545EkcOCXYj2GzVNh0NK2CzqLEgHA+3yA0WcHu9jDiMw@mail.gmail.com>
Subject: Re: [PATCH 16/30] drm/sun4i: ui_layer: use layer struct instead of
 multiple args
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
> This change is equally a cleanup (less arguments) and preparation for
> DE33 separate plane driver. It will introduce additional register space.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

