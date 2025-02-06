Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928BFC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEqIZa1c20GE/uxbotqVtezGJP1SyvKYBSzc37trZCQ=; b=YdAy3BSf009Kua
	iUKDk5BBt12ERxoOWUJwcGPOJU9zE2gPkVjpz2qKu+lWueNz8n7lUtZwDEzeDA4+v5l5Msd5OZL6f
	kBKMt11NMl8Ok9hRyrSCGtKtrfnQix6fqSG6vkQkIlmCVmX7tI/YzhcliHL0n6Qa2OutUwiSOqU4n
	XHN2FYuuXODyOMaQpsYUL9a2wVs5E5YBr1y6hqeuemHUhO0ar2TKGaZG5fUdykvFkRHkfoDG9MEa+
	CmhQEXBT6d6NU/jTHdEafZFSULv0kev9irb6ojylIg5jW3HddFljHbxUthEVUt9wjZduX02L/siCq
	nfQBKSC53HAYvFrb1Dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwvH-00000005gAm-33bM;
	Thu, 06 Feb 2025 08:07:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwk7-00000005eyJ-3UDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2B7B5C1179
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Feb 2025 07:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B384C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Feb 2025 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738828570;
	bh=AEqIZa1c20GE/uxbotqVtezGJP1SyvKYBSzc37trZCQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mbUKCJAVnd0gw2qkD0wGt5Xv3Dzk2KGOVX+35Yv+F0p6hPPIlRumruFvwrTqICD/N
	 x2t5shCnOeLv4YDriUkDZh8WcLm752b/HYA7Z29AhC7rWORWfg7ehS/+NQiBZXiWLz
	 /0kE6M0ldvEhx+bUce072yyFZSyoeh5c2HrDhsGy9vy5ODJMXv/W8JS3YJ+0+t+Cwj
	 ABlEUsziAfj8PCCRSSDJWExO5/2C1ml5cKCk414NCsfI3DS5eAZvstBqnGz02kVwni
	 sHxcHM3nuIPp+Kq6WRUDPpIYf+boA+2zhKm3TiW7V69lThAELBggeNyqwPnW6YbitG
	 gez1EFLTjk1YA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307bc125e2eso5131461fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZuurGek/8n7vWjCt6/CGEU7sn/d2641F6IzbtOSMJHwcXkAFaxnuw/ohlLucKqZSKrydVeolJp6gXvVYmBvFB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4oVeNsnln/DgGTge9cmXnLzKHpltbgfQ9eO0J1Jgnjg12OBbg
	tQ2xlDQ9x3+Ixsm72QaCCWjeLnqDcvLwnf5XV0zqo4zriu+kpJCXRwaf2sJWBibGLyUXHKJosyb
	OVp0GbHtRYNv5ux52E+9Ae//bIug=
X-Google-Smtp-Source: AGHT+IExYizR8AjRlIGIimdkZfX+9X0NRegGw1UkCfbyc+3a2hXIE82esqSCVnis8PSKgDv1Ot7p7cslZ7ZmlCRaP5E=
X-Received: by 2002:a2e:bc13:0:b0:2fa:cdd1:4f16 with SMTP id
 38308e7fff4ca-307cf314576mr19836061fa.14.1738828568791; Wed, 05 Feb 2025
 23:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20250205173630.112020-2-csokas.bence@prolan.hu>
In-Reply-To: <20250205173630.112020-2-csokas.bence@prolan.hu>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Feb 2025 15:55:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v66yUuG=P5HRgVtLL7y+W49pP6DS6sstQz-qY8CwztdT2w@mail.gmail.com>
X-Gm-Features: AWEUYZni_KKoOE4E3mzLNcrihoeiCPzzxX66FMp6It2qHidhpuTepzOXlYpsAbY
Message-ID: <CAGb2v66yUuG=P5HRgVtLL7y+W49pP6DS6sstQz-qY8CwztdT2w@mail.gmail.com>
Subject: Re: [PATCH v3] dma-engine: sun4i: Use devm functions in probe()
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_235611_909681_C53B7D2F 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 6, 2025 at 1:37=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.bence=
@prolan.hu> wrote:
>
> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
> to add new code, as we can eliminate the "goto
> ladder" in probe().
>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Acked-by: Chen-Yu Tsai <wens@csie.org>

