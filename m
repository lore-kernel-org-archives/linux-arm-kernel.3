Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34546CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg1AD3f/1jWyYR3P0Z5p8wEPI+MYZzqh5FcI4v1k2P8=; b=C46fdHQGS+HLxPBeqrk3Q5bYxS
	QEO3eG12cPJjJ0RElk880g9lHeJXKrfFmNfZhye0d5ly8Yw1eYIW3IBFnKPe8AO+wNIJe3dY16ysv
	eGwLqZvRr7XZej9dklyEHaYsqXEZ2x3Zm4LsiMEx9cf+5+Qv3aZooj58FvMbV0XVZKckxROSR9P4Z
	Bf2PL7rOlK6gIRA4P6FaBRPEdo9JOxvhLmF2xEtZoTNbDYWVTVZpyQJDj8dkg+vF2sYAYZgLGrIL2
	nCzEEYVdLhMrSZ9vkKigNiXv+IVnCaMe0pvMFIT2h5AEHnRUwqdmyavpzrRLKTMvAzyMtszQHie2Z
	2orCuBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaG3-00000008usP-0ffC;
	Thu, 11 Jun 2026 07:55:23 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaG0-00000008ur3-1i4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:55:21 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c3154fa46dso2865607137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164518; x=1781769318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg1AD3f/1jWyYR3P0Z5p8wEPI+MYZzqh5FcI4v1k2P8=;
        b=S0erQI63n/MpgMQyHCSj+7TsNrCzGc1G/bpRlc21IWvF5P/NhlYmXnkOtREeYP+Hph
         LbYz7tYqEjbh2aKFDZ2fcZmQ9FoJZUQMrHhtbds3UlQTa+PyrNpIqV4AN8BDLdbiShIE
         vE4A2vri9NOt9x10ITBcPHTveHwjMF2SangbGIN8crYnGRAWfnz+J1/7s6rYYLlgNHtK
         u02lzBNaO6EPEc6rBBS0zQJIHN+pQ9owY45RYcfeeGtiLNxzVaJ7mV6lV1n+jfzmyGyg
         6d8HlG/UvClMLrft2XTPohOHve/rH864LBJ0O7hC5Y1X/ZyOzmDEwsQZW+NkoCf34VHL
         cskQ==
X-Gm-Message-State: AOJu0Ywv2vPrsn6l7v41DQYBgsBg8yAohUsd2ciFOsEEnJraydImkdYZ
	58+z4v28ckQXiXVDz8G29VA8GfwlAhVJnQ/ol7dnYTR+i1/bdUXuaNxZgxy3rdgjKb4=
X-Gm-Gg: Acq92OHyXaFDf8rOqFg5po3AJcVGzQX9T97ikbSQOoDx8M5Upa6tfhmLyapdOVlY85c
	1M3foVdjw3F3tsC+LEPYVxEVdc55ijqL9goUQH16jM957SRtGZLhNzKsbCvXJ8/0fRBS9yTWvVu
	koP81NOSs5Q+jTIS4ssjp3phckzuwtK5rErgm4VU/gUdGpLSAn1vs4Be9nZKQCY6mxgQwOKK+RO
	5x1UOiUREZd6rPCmgwrFQZCatfPAkHBcUP/CsbwJxb/Idhz6N8zCfSYJ22YA9gXGAhV8kStH2Wc
	gDQ3S/hs0BF8orBo43LIKmvctOuZ78uWige+5mD50qkD693Dgl5zv/LqrHsHu+kezW6kbKy0yvj
	FbY6rk/zdB/WBIFMJgn1rnwBbyqqTHO0epcI9g11ZeDw1QIHjVJqk20qBclLTxJJ9yeSE6nyeLm
	LY3jMcQL0Kr0NcQ9HwXVUXEWhkMuEcXV4SN6J7JuMl5dy+JM6PBDotsFV4UH6uEb8mIZ3t9Yk=
X-Received: by 2002:a05:6102:a51:b0:62f:34db:9474 with SMTP id ada2fe7eead31-71d5f9c6774mr441627137.20.1781164517686;
        Thu, 11 Jun 2026 00:55:17 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71d92b9c5d6sm473460137.10.2026.06.11.00.55.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:16 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9639a2d4c53so2560202241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:55:16 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:631:28c1:155c with SMTP id
 ada2fe7eead31-71d5d8a78fdmr441637137.7.1781164516527; Thu, 11 Jun 2026
 00:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
X-Gm-Features: AVVi8CfMFk11kDzU1W7A90vpbtR6Nnss2ELpEbzCC4jdTDTJHmSm7MM16QZwFsU
Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_005520_447163_3FAB313A 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

