Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6808E6918F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+NleAF5wnamCsArGsGIgVjUTeRQdwurqWtviiq9uEg=; b=mIG+OiARo9hEo8oaC5TR/npyIT
	L/iZmKwULSsL+WbSWwCi3hRozgnfJhxIz+a772L7OocX6G4v1LJEdYE4xS1D9ZrgTAWSkMGJnEOhu
	PTVue8NQ3uDZRAnCUhDLGRqtkPeLsRJoW1vYRj0e8LB/zQ1103daXGTadw1Y8VtveuHMcffOwOQHV
	/JZ5kXaeulLQDetSjVtrR/mMjr8k42mylqBTtavkv2z2Iuga5U8G/Wthxk7XovBAVk7wh+k8Huk8N
	ds5Ftq800KWHFE2+sEZNuG2YFd0xsAYn4+U5Hr6eIxkc6TxM05ZTXrwWU/GthbFcpy4iK5niqRmC1
	1R0sSOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZde-00000003Dqn-2zGy;
	Fri, 22 Nov 2024 19:48:22 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZcg-00000003DkW-3mH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 19:47:24 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2969ae2c99fso1549776fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 11:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732304841; x=1732909641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+NleAF5wnamCsArGsGIgVjUTeRQdwurqWtviiq9uEg=;
        b=NK9c/qp+sYHG+eVB7mMkmvlxxBQbeOGxhoY+GW4Q7G6/rtpS16VXf/ovatiU7dcGtH
         KlEwntStba1cXYPZcZioz9LVHMcB7VdhFiV5iaKfVV3QRl/NQx2Qq0qJ1FZQxJXLQlwc
         pNtTrgr0TcGorx1kzIL0e52gsziLpqWGTlr+OGXaJquRhnigwhGuGnqYQjYdaWK8MhwW
         7ZUQoGDc8H9R8zgywt1nk15OEq8nk+0dcr84h8EbqgFdFdgAHuZDfJXO6iPhP8tl/nHf
         8FKyf2wevamDFvKiOmfluMVcCa4qtgvdbYtnFsW9DoTC66ca9X/9U2fARTW/Y3ZV0dyU
         HsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732304841; x=1732909641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+NleAF5wnamCsArGsGIgVjUTeRQdwurqWtviiq9uEg=;
        b=IrAfDn0lxYxWAYiTV5lwnqXwu8Ygl0N3Q41D8hk9gWkTbWfM9/mN9SJfsiGqCYSTnD
         Cs7p1TN0HzWctW6CAFZcdW6MXLFk/bFXWWN+xKFUOP0rnpqvP5buEnyLUexF5ScvLxlH
         U4IZKeFYzUlgRdlRfoYOGK65GB0S/ZW4+56L7ZIdzoj3tCeRg6PXp8NqZRcEf7emm+NW
         w1VCxR273/7IAHADnAQPT0gEq8sNIOPCujlOFeo6JmYnY2hbif/swYGFDiZXxS3QkIbQ
         z8F2uqtK8pKjYYcaZWk3ciykRRrVgNzJloqVZgh+K7/m5wyHjJ9HqfgZ6skHQzUEZrK7
         4Fqg==
X-Forwarded-Encrypted: i=1; AJvYcCUwOaxEC7HM22ZrtNo7Z3PxuIdCooRVFDcEM0bnenGh3ZjfDqw498sNjAvzQtHF2ICdeddUtA0OkbjT7T39oYpP@lists.infradead.org
X-Gm-Message-State: AOJu0YzUWdj0K232VPAPmJGPl+yuoKh+yvYtYTgMnKY2+6+4vajkOusb
	DWJ9f+yEePpKDa++Qsjg7b1ZVPDb1gGPTudha76LqPaeGRWJyiiF7PCpGIQ8IyyjdC3sdZPsbeN
	XX/bwhZ7/57x84/KJ1MgnqncQOSdTZKnu
X-Gm-Gg: ASbGncvU24+F4lNtT5kNlViqd17ibUEVvrIUkccuhOI4qpdQV6Od7gMecq2mrsHmPXm
	zdLE149oFuiE0u//OAGgjdnmVr3au8Qna
X-Google-Smtp-Source: AGHT+IEM0Bxq7iO/4ObNr+q9HZYS7UVWQqiLqcaiN0ov8+bJQgLI2Pu6S3I1iEtPK/kuQrcgZ/eJXlxS95mx8EIDIDM=
X-Received: by 2002:a05:6358:98a8:b0:1c6:99d:b832 with SMTP id
 e5c5f4694b2df-1ca7971277dmr431218655d.8.1732304841232; Fri, 22 Nov 2024
 11:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
 <20241121210543.8190-2-jiashengjiangcool@gmail.com> <b3ef3855-f95f-43ad-9a2a-3803c1f00046@kernel.org>
In-Reply-To: <b3ef3855-f95f-43ad-9a2a-3803c1f00046@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Fri, 22 Nov 2024 14:47:10 -0500
Message-ID: <CANeGvZVg1uxkBNGyHvcnNP1D_Uq8gaZuTzqhB8S8u9PjyLTMrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: mipi-csis: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_114722_938200_0BF4943F 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Krzysztof,

On Fri, Nov 22, 2024 at 2:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/11/2024 22:05, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNO=
S4 MIPI-CSI receivers")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/dr=
ivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > index 63f3eecdd7e6..d1c938065475 100644
> > --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > @@ -940,7 +940,9 @@ static int s5pcsis_pm_resume(struct device *dev, bo=
ol runtime)
> >                                              state->supplies);
> >                       goto unlock;
> >               }
> > -             clk_enable(state->clock[CSIS_CLK_GATE]);
> > +             ret =3D clk_enable(state->clock[CSIS_CLK_GATE]);
> > +             if (ret)
> > +                     goto unlock;
>
> You should unwind the work done, so power off the phy and disble regulato=
rs.

Thank you for your advice. I will submit a v2 patch.
Additionally, I noticed a redundant space before the label "unlock," so I w=
ill
remove it as well.

-Jiasheng

