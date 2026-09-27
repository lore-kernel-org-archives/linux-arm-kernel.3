Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDC4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=; b=ItaO6snN3lt9TfVI0zQXZlDSph
	4BbcPIQFwX6PuDyyJXJINt4pZ7LAiYleu+XoafFKIXxnZhvMUdqGeWhC+/N2r8Kukqz4IZWsei43l
	968KG0g9P66blg9aYyn520XGoCJwGYBBoQ6N1NdEIUo+t67NfiKL/nVJ28mvmMWZxegoKcWffEvX8
	f3vU9K+ATZhkcwYE+oSGy28Q3KGLh3DfEkMtmowZ0zCnpUejBlmylCiETKy7+xGLXdGTDhfdAo/ei
	2uRhURgj+FgAqAptxiFTcq7+g4pyaS8nqole0SODUlpaPd8omCYfpPSpCg1Jr5jaTOCumKzu3gOwW
	uvAWg3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsIL-0000000GdOX-0JH3;
	Sun, 27 Sep 2026 17:04:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsII-0000000GdNs-0KHl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:04:07 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff72474fso4100525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790528644; x=1791133444; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=GEAlZ8Vt4zTx0vG51YB+ihhGUWemOKNSQtFYKjFyfZOf9AO6Yw7INrR5K3j82CnCCK
         +mJRGUY2XlYJdP80t/mBqa7mPBM5HiYxxgCIme0sIib56vCo5esi0HHFoAdXsXtbY/5Y
         qrgd0sgXQDo9eARQPMtNsQ/IspB2mV4G9S3dj3835cXXbaClUF/OH51zARgQU1mWAIMO
         w8Y+t37l/Szl8ptGZliN9HX0T5tvGMB29OuybU/ftwCA4P5haQvMfYfq8kaUEHWTX5eM
         sZH0nk7L2n3wOzV0KdEs6joPkd58Z/Pg8z43QFQpTBeDaC6TGLG29L+hU32D4OuhJTax
         gyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528644; x=1791133444;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=WP1hSq/m8bMhnfg5a7uuKI57wXJhY3BkUnZxIKiSnm4dsgAR6BvH2ln4W9mTYZTzkO
         PIkQEDROj6tMKnsKnnp7QptV9nkW28G6XYVMJ6YXknyWfjlnYt5gSGzv2L3K95L8ch+n
         iyNylgsNU4cyYhOzJ9TRSufdaylKNcmkexCMrobBO6+m9cM2lRPclFc7/KF3cXcxCgjq
         Ynt7y+I5bNQJGn3p1rLZ0VmDbVmfBPEN4Bx3MdJQPPZ99/+9pBf6CvXLLAnd0wXCudYz
         iwVNlWnYB4oJ/Tj+UryQX59T9C23dbMfaOS6VQI72gNh2QHuCSm+/GcVAef0n+oAOZI9
         1QYg==
X-Forwarded-Encrypted: i=1; AKwUvBw1hDt8Jk2Qnfk5LDWCByI5ceeAAORlh7xlMz1CtyZ0L5ImGYG9RBssSKd2mG1/e73S8dh4vjyIy9u1XjHoSpOW@lists.infradead.org
X-Gm-Message-State: AFuF++nR9hPUxKHpcds6V0qcCHxRjMXvdWXGhekI3xMvAGZ+I/gDykFG
	+96QpmO2TkCEqjIrh+Ebpn9saqL+YJmg37cmWyGf0TAyazZI0lrZesDJ0y++dP5PZ/o=
X-Gm-Gg: AYBFou1TqslX4iRNtUVpPMkDvHX6O6nQLgT2WrvxPMxXGmhnYzeK1EM+BdrcL7kk8vW
	T6cDKF1pIktz0xEQmyqwLxv4itQxtqZG3Lc/yA0Pxcwin11iSLvPs3brmGHXJ5eFbKWICn2wm2H
	ThLqe6XcpFfclKqprFjtJEt+ihSPjZ+aahrP/5bHA+UOzdtQ2ALNBUn5zBNXWZJfCWoYxmTl2Jh
	keMd1KpIxuyX3tDd4KaoNrJSFDj5WHShyJGvtdGA6FjdaU1lt9H8KMGDqZ2qb4qYjlOgxucF+Oa
	kQO50bWNQ0rsAVA4bC695aNRSm3/LsOQ02aRthalpaHKtA6idJPHAiHkFxPaXRXt4mz5GA5hWmF
	K45LiHTHAk1rOz7yB8Ly6XS60jAG8+i4jT0ARTkp8UO+aZz+hF779wcxv9cKK5V0EtjYE90kBe8
	XajrzmBQJSgje/rae236gUsffmZ0qTsLaiy8Y//LJlG8fi41t25TtszTJBYZlSos4u0qdmmtw+p
	0WnTAVjQBSWTPBZvg==
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr23998885e9.34.1790528642770;
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm19992213f8f.5.2026.09.27.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jacky Huang <ychuang570808@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
Date: Sun, 27 Sep 2026 19:04:01 +0200
Message-ID: <1jbj9iaany.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_100406_135835_9F741C45 
X-CRM114-Status: UNSURE (   9.06  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On ven. 25 sept. 2026 at 17:10, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
> possible parents, but the driver never registers the corresponding
> clocks, so these parents could never be used.
>
> Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
> and pclk4 and expose them through the clock provider.
>
> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

