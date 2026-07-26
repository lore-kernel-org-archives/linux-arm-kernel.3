Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD6CC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msgew1ysgPiViXJb501fpHVo5cSnGRcQrQI7SElt2Ww=; b=fEd1EkQpKAGrXz3cTU50KBM+iG
	sMVCdqJRx3Js+QuMS/tbbljnRhQP/zMDBRUbPopwwjFLIHtNipNDFWg8WPNH8DwBtarlf/Rfnmlnf
	642wnOi9CF2UkMt1/miJzC6irA194Bpy5RYYMGOjRUCvh93YFckMCPNjF6WCN+1Wkckwj+X83TLnm
	it3NUHPhqY0JiuigkjbGlqFu0i5mIzFze7mXCa7GTe6BdYiAGnqJxSqB/xyFQ5xiqOB9CxYGUjo+w
	mEqso21v3GgT+klE9fbMPKchzzkmZ32TOEtupgTKMxN7GY1LdPQ179wRTh2a45UcqhmhRtVgHezI7
	JIdY7qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwxQ-000000016NN-2Z5t;
	Sun, 26 Jul 2026 11:23:48 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwxO-000000016N0-1Xik
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 11:23:47 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4a483a552efso748791b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785065025; x=1785669825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msgew1ysgPiViXJb501fpHVo5cSnGRcQrQI7SElt2Ww=;
        b=fwpe0R2K15PplaUPj2FyJ1w8HjWkWqVZ6ku2tV1m3v3Bs5D0zQF77JoMuunB+/DIuU
         NC6iMh3017lgyTbT2haGiFxRhWTsi2lt7LGKYIl+mt7TxNEguxxproDhrwFoab5YXWq+
         Pbe7QRmxov71crSqvgASai6LtRCk6wFm6EHEGy1kPuG86lwBJN9PRbCb7+NyNJ0jiX9m
         QUVzg/AED5aB8jex3YeV+OeW0EfHCXr/0yNi6p/zCz83ac4ZhTf5lFW0SUIi/o2wScrw
         QQwk4alMh2r6kRq8W4+rOgfSfXClA+AdGReSzindXBBLdPS+QFMw5Wc+KfXkdvOvKsqR
         8qLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9AH6q+5nsyB6io91oJxSTlUwTOk6gMKPxYrnuyccZhKRW1+d1XrvyOnnm62UyLOgGLrOffczEzQ5vCTPPxgJ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3vndFAwU/+t43vU4igM7TbT8ERrhehePTM+uaRuSFZxWUJou5
	wjFBhVUtXsydrITL1Frsj7qRfvmsX4ETlk9N8ymuK6TnBimHmwactjhakjl2puTHHw==
X-Gm-Gg: AR+sD10tsF5Vbv+5H1qdVlZ7D0NI0Dj4mk4jnn5RqwQAtAwR6r/JdRTWhkqNJyBll0C
	QmdF0JmAyjIVbOC1MPAobzlK1TxVS8YrgiwGu49U9bBNnErmtfsBEzvyUIU2OrstvIWHeNALwCm
	mSYNtox12/tYma3CHtUksvDm6MLqdkAPWmbG58V9kN46v0wXxIO5tS7kVLtTB1ndi8OpO2FJamy
	uDvSuNqrwwhcFnly4GCaLKHPTEpb2E9s7NL1tgq90pgoy/unqpoPJMYgRcHJ5HNQ202qGYV/X7X
	77IxOO3x4eGwgY7RjzpbQE7rmnDCp8T8EzuuZR8rls1Ce9TUkr9ZCMbRLhJczSWbs2kTurkFSBT
	tdMBmQDV2p/1tCM2icEqb8FdBFeTjNS2yni/tCxbyWkFPE17Heqb13SutrH7EhGMcQg9v7j99zT
	ZEw660r8oB813kgsdT+Y+7FboOLtgVRUGPcY8t0+OScQ5rrwuzD/XdCikR/LSR/B9UA50nIXtT
X-Received: by 2002:a05:6808:1b27:b0:49f:a87e:2316 with SMTP id 5614622812f47-4ab6a13988bmr4465898b6e.31.1785065025133;
        Sun, 26 Jul 2026 04:23:45 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0f2c96easm8942782b6e.17.2026.07.26.04.23.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:23:44 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-44cedfaab6bso617896fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpumU0QuY4YK+O85/BopNchsbu/QnvVFjKSfgG2HX9gM87GjJm6ln9nIvFvIck1H97B/YP1yp08aR6VrOGKIBRk@lists.infradead.org
X-Received: by 2002:a05:6870:5254:b0:44c:e350:a0b7 with SMTP id
 586e51a60fabf-457f26c5cdamr4287252fac.27.1785065024643; Sun, 26 Jul 2026
 04:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-8-fourdollars@debian.org> <al59d-zgEV0KCPIp@ashevche-desk.local>
In-Reply-To: <al59d-zgEV0KCPIp@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 19:23:33 +0800
X-Gmail-Original-Message-ID: <CAAT15mNfnXh4CDAwQjtH8ktLuah4r+LBgUfm8m-6p-fMOkp2Kg@mail.gmail.com>
X-Gm-Features: AUfX_my8CtrOnBHu50rHPfcv1-YAcfTginQh2XY_p16uaufWTkXh2Yz8qHzk07o
Message-ID: <CAAT15mNfnXh4CDAwQjtH8ktLuah4r+LBgUfm8m-6p-fMOkp2Kg@mail.gmail.com>
Subject: Re: [PATCH v16 7/7] spi: pxa2xx: rename local status variable to ret
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_042346_408761_A75FC303 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Jul 21, 2026 at 3:56=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 12:21:16AM +0800, Shih-Yuan Lee wrote:
> > Rename the return value variable name from 'status' to 'ret' in the
> > pxa2xx_spi_probe(), pxa2xx_spi_suspend(), pxa2xx_spi_resume(), and
> > pxa2xx_spi_runtime_resume() functions to conform to standard Linux kern=
el
> > coding conventions.
>
Hi Andy,
> It makes a ping-pong style of changes: Previous patches add more status u=
ses
> and moves, and so on. Instead, this patch should go before all that.
Agreed. I have reordered the patch series for the next version so that
"spi: pxa2xx: rename local status variable to ret" is placed near the
front, eliminating all ping-pong diff churn.

Thanks,
Shih-Yuan

