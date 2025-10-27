Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=; b=QVh0KwijiPg1Zf
	VwKSIDFIJWZKfQx04a9QSBcAdVaUoWYGBQ3pFNREyq727iupLRfdxmsv2Wxj+XgNG1yhBRntrNXqk
	4cs8DdTH7ICzPgc/UfzIFb6ZeUk7a/L5+tJasSFcyekrIpXPMSNy+k5wXPahkdhLkoiLNrjT1cSMG
	toy0NYKw5ZIKCSr5amSgpnEcgri8IfHNX3hlhpETfieRZ+q4e/YS1N4qgqLAsz1lgB98lXLx/DYL9
	wEh9HW0ygmxmVIUORsV72Ew9xQBibvSNSaoyxDn3jBUY2oAlYX+3HcXJnTvQGFTxO1+lA9cjUYgtv
	VlWteXisMchgF9/qupew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQ1d-0000000EJ6R-2DT3;
	Mon, 27 Oct 2025 16:24:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQ1c-0000000EJ6G-1mgl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B7FC60528
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F238C19423
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761582291;
	bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=upbFfh9cs0w560m5G42zUAqRYxPzCQhWJ3nOUwjD6MeOlDBIWPgR2G3a88oLebvnT
	 ujk6tCfOjiUqdVgy2MFjKvN9rMWrXIN5316szN6mMd4+uAO0sLp53eAa8x2WovxYUA
	 jxkiAu/00FklIY5zVMLZwqlAGkLcplG4IkbTAqj73DLth/o+LT4ZC333P15SGKcxjk
	 xgrKa1lpY+9VJtRSx9RdhKoB/gIKqlvkASy/W7JdUeifItJSnyB4R1Qs+J/H0/GZF3
	 lLTaw30AqORCfJ+MkMFkyaZL3SVfAfD11Zee/TPOUWl0UAIy2Qx4wFs/swJJfCRylJ
	 dcudLK20iB9bw==
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-9435969137aso259507939f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwOnRbvOjPHgVT98zwfRJ5nlTHlL5DiAyV10O7M9VzVFKnE4jlje/s4KehLd7fDZgVjfw58ThhoNBxRs/JvQ0v@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjybDGQEGWeCzACyTgMJaitH+UL/WUd+EXggFqukf9sZin+pg
	dN1uCPCptqmN585MjARSDRQ6/pm1HpyXyo6z9asaKJFe6BYckOr0rsq+QbgNqWwbiAsguSkMvWf
	SbFkDWsrDRsAwnbCTrYq+4lgeXWpVrwk=
X-Google-Smtp-Source: AGHT+IHHe/XtS2GG/wdvqgHvDv+nRF07AMUFFVC6D3jwE43Y2hKkIN+nB3wIPE0Qg88P86L2vzXtvE/tbccFLfpnpgo=
X-Received: by 2002:a05:6e02:3f04:b0:430:c8ad:81d3 with SMTP id
 e9e14a558f8ab-4320f86b4f8mr8500885ab.30.1761582290543; Mon, 27 Oct 2025
 09:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-10-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-10-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:24:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
X-Gm-Features: AWmQ_bmGka6WNi4gU3CVi9HH7uDknXm3j3l2W4WzjmEHbPbF7rcEUtNrr-KxlVo
Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
Subject: Re: [PATCH 09/30] drm/sun4i: vi layer: Write attributes in one go
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It turns out that none of the VI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework VI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

