Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRNAVvYYeCRwQ3a1xM+1m/wJzn5pqIvsuHf0zaTzy2U=; b=Q9ydfo+gvLvkVyu0IWlkCjU6px
	PtmEbxLy293xVGBrQJy7L/M2pUcbO+VNcx3FvjqAptopFghHQkPb8mXeZAQw0R0OJf9on2za3MhET
	v5f2ANoXccbvAiJOeD0YlecRmLgV1KysuFqp1tm4gCAh0Saqkcbvl1tfKYX/wDlB6H+XR9TzJsWLO
	k1UGZcYLRlpFpipiDkEma+lkMjm2WFUcyCCAdwEos8/il+JRAv/iBncLLBtCPzRz/Ec3x1HZw07KW
	GGJhxUz5XnsMDAHb3ctdtr2LkfUYb8QyKEyEVNLYc5kjZhsRbzgi8rVjjsR95F+cD+UVr0MXIZGdE
	epbZoAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7i5-0000000AhlZ-3BLK;
	Sun, 23 Feb 2025 08:51:37 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7fG-0000000AhMa-3Gsh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 08:48:43 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so3082407276.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740300521; x=1740905321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRNAVvYYeCRwQ3a1xM+1m/wJzn5pqIvsuHf0zaTzy2U=;
        b=PeQNb3R63niES0jx+iLzvU2DKtg0FSNiQApbbbqjKgi3C98H6ajunz8Q8Td67K5GV8
         bhA2nQBi4lrI9a+OSS/WlsZyRGWQoaG9BRX3YPxGhzVC2d6N3s8jFGV5WeX8wGzC7tGH
         OM9/s9RPojvNKcE/h3u3rUY1SiJdET4y2xrT6urNWgARtV1/tuC2V64uvANrF/NPdyNO
         SsAgaYFraTzBBCElJDr2qG2tcKAXxUjUZE+wakMEAg5fdRaIT9ccYgthek21kZRHGqyJ
         I/OP5Q5HnaBW5rYElSgG9n3k+xp0OAWPznDSMA3UN8LWeoSmnN44YNgJ4YQEVJbd7VbY
         gxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740300521; x=1740905321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRNAVvYYeCRwQ3a1xM+1m/wJzn5pqIvsuHf0zaTzy2U=;
        b=bwQT4IUmhRXDwLLeL+dkYiCtphyhIEifbnRK6osVAmZoes+ZrMYOfgQXgUOq4Pl15Q
         ES769cL6RnJBNn4DKIhyMjzOdH8KO8CfDZFQ+U/1daeXcLL5dVj2+gLJeT2Mnm3iwO8w
         Itof+O5jbN4gBuhhClvlLmTQQ5qIWODKHmKVcvKQpvdrU5ddbr4hB9XR7ZswczAUPSC7
         gmJCiqB6aYNx6xtKAkGkOI6Bpu3govKHNW2w2v1hMWAc9En7e6yZOM+4KMLSVMNicRK+
         6P7XfgAA7ULIDX6tNDHkLudb7wkYEkj7mZkF9l1BEFFFAyPY+9EBSVML4KR6NQCzqQxz
         e3+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUFf1HUAs6PZ2PKml9O08otewBTgucydmu1RLi9++49d6k++/xPPHcBfrLljlq1Q2IWqrlNRWDYI0vOnn/7ibS@lists.infradead.org
X-Gm-Message-State: AOJu0YxkSl7WoUiERKxzEHEW5qfmBsqf3RZzl6IUcmpBBEZ3mfTChKN0
	tngiEy7tDQ7jY9+wkvKrwSIuXQrK1J0Cex8UD430WlNRMK+6u6IzSRdhZDA4koxnhS2Yaj/8D42
	7ztJStHnEaJFGQG3e/p+8HCzwbC4=
X-Gm-Gg: ASbGncsJheyHc4VrsqH6uwqZH4INkhuF6YnZYEbS+KTL+UGcOqv3Es29kuluRl6bRXs
	1vcOxVIGLSc+8BPCMVYWD4E/IvunmkPrXwxdVZaogyh3QdpikNVDvP0hOKtF2Z/z3jPDI6yItZM
	ltP7jvXhez
X-Google-Smtp-Source: AGHT+IHb12XReeyoJDdKwjTiybo5Sj6fWeU+stjIr25RfUjMsbR/05GXSFVxnSxTw+cp3RjuECFwksFzSO61LWq7Pjs=
X-Received: by 2002:a05:6902:200b:b0:e5e:1389:cb40 with SMTP id
 3f1490d57ef6-e5e245e7139mr6807165276.13.1740300521431; Sun, 23 Feb 2025
 00:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-4-6d3e89b67c31@gmail.com>
 <20250219113422.GA26386@robin.jannau.net>
In-Reply-To: <20250219113422.GA26386@robin.jannau.net>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 23 Feb 2025 09:48:30 +0100
X-Gm-Features: AWEUYZlT7UA0f04bSLad26HmgfbyXA2dYAU1yBLaWwGCtq5yfIfuPEY4zNm_Co4
Message-ID: <CAMT+MTR4yPzC-NBLT6uLhveHFDWpwwn=hUzU6=WDc73+UVEMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: apple: Add Apple ISP driver
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, Eileen Yoon <eyn@gmx.com>, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_004842_841240_B3434B68 
X-CRM114-Status: UNSURE (   9.49  )
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

On Wed, 19 Feb 2025 at 12:34, Janne Grunau <j@jannau.net> wrote:
> > +     while (maps < end) {
> > +             maps++;
> > +             maps = of_translate_dma_region(dev->of_node, maps, &heap_base,
> > +                                            &heap_size);
> > +     }
>
> The hand-rolled reserved memory parsing looks like it can be replaced
> with of_iommu_get_resv_region();

I have looked into it, and `of_iommu_get_resv_region` does the wrong
thing. We fill out `reg`, and it grabs that instead of `iommu-addresses`.

