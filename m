Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8890CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 00:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udoHF/ewggrli9LT0yBxNvcwZCggkGncBKGw8/rNr7c=; b=VvoW1dEqUWpaqSG2Zaj26J3HRs
	zX/+oOSj3o7Us/uSva5e2c4vpbq13FPDzND2yL6JGeeO37s1SRf9TItuwLcdsfsDNkmuBaAd4Qvic
	LBTO/xB/4Bm4UjQ9R9iP/QMHgAzE6We+ezRONl/WZBhP5SRKHbUEWflFBaN8If7lnm4x2pb7MbSI8
	hP0s2cJ+SpnMP4OMt+weV+jmrDQv2DGyFyfOnUzxyA7wqFD/30uk/Y3v6wdxgPtFmXMqh8ZdDidUj
	5FUQkuMJr8/16u8tq5ob19IF71qfPNSm2o6fjW0OTGJj7XCNgvhZpIQohdxR2PuslFcllmsyKEQyn
	7DzejKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrNI-000000061Zd-3zbU;
	Fri, 12 Sep 2025 00:10:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrNH-000000061Yg-1aam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 00:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9D6444BAA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B647C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757635846;
	bh=As0st2mk2L0Hyv308eIrHbtQh5TjekLWLPV+ifYiL5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qMpIx4IgtVLlsi6LiDk9WM4G5NIXqk2vJMlQcYqfNyIG0UhdfRyvChYLEJqj5snxz
	 bj3B/Q3dTu6d2YvnXim26H63nFoGrtEM/v9se8CDOs+Hy9pBdd2tFXz1OD6/bVcLVS
	 WNhcKqH1ifK6Bpw4omCXCt7SiuA2uUwlJUnvDn1bpZXXZM9eXJSMR2pM28+Im41D6p
	 XHOGIcdrMSb4yG7mmuQ7wORO2ehoA3OKIXQVaqlECxI6EfjdAQ9x2T8vKfIcYGftjE
	 Dpm4GWqaKbbHcreuu5dx3YCeDplTMzTkWpG3wgVIOUggX7s81pzqkDmCrld/jWxhNb
	 XCiyGWaNOoCUA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so1641834a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 17:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPW9HjqdOhgcv+CcZ5RJtbohZV4Ej833HA5ZR9ehKUl1vuqvwfEbWAWuLc4BO0I5zj6inlJ0ZsSAML8vbg3AbV@lists.infradead.org
X-Gm-Message-State: AOJu0YxYDLnIv0EXww5VfHoBooG5RWmuXA6FbPaJbptrT+ez1Zh5LTvN
	wcWkVo84DJljPiFTf3vFtHAWiatD75A/xd+dags1XjVyeQBweE03F/m+E48X4NcH12Tqvgf73+s
	G7kkAO45NipHA/cTZYlVyhmkRjyI+c8s=
X-Google-Smtp-Source: AGHT+IGlZB9ve92AUsjeuNU1Q5ZaXqNU8y7VQEYnPyGvDio1YpPC6YK436PmiT1NHNvhnGHWryG+F5/8KZPOgJm7JoQ=
X-Received: by 2002:a17:906:478b:b0:b04:5435:901b with SMTP id
 a640c23a62f3a-b07c3a77fcfmr91410466b.62.1757635845021; Thu, 11 Sep 2025
 17:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250905084059.26959-1-ot_zhangchao.zhang@mediatek.com>
 <20250905084059.26959-2-ot_zhangchao.zhang@mediatek.com> <a7589659-0352-4d47-a3cf-f2433cc512ec@kernel.org>
 <CAGp9Lzrp-cfn_GiLrHCU629wEAxWy=egOMrRh6thYbymu+QXjA@mail.gmail.com> <0760036f-db69-487c-94b9-a6e405dee0e8@kernel.org>
In-Reply-To: <0760036f-db69-487c-94b9-a6e405dee0e8@kernel.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 11 Sep 2025 19:10:33 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzqk-mXiNq2iSrTk-Ed40_2j3GSuLMJcWoE1_iy7yY9-qw@mail.gmail.com>
X-Gm-Features: Ac12FXz8IhbvaLWT27HxTo9duYFHYYWRiZ_PiuVbsnFzUeOWnt4swjEH76TSLOQ
Message-ID: <CAGp9Lzqk-mXiNq2iSrTk-Ed40_2j3GSuLMJcWoE1_iy7yY9-qw@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] Bluetooth: mediatek: add gpio pin to reset bt
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Hao Qin <Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_171047_459797_F5AC0EC8 
X-CRM114-Status: GOOD (  19.38  )
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

On Thu, Sep 11, 2025 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2025 01:29, Sean Wang wrote:
> > Hi Krzysztof,
> >
> > Sorry again for the confusion. I believe Zhangchao is still new to the
> > upstream process, and we=E2=80=99ll work together to improve this. Sinc=
e this
> > series has become a bit hard to follow, would you agree that it might
> > be better for us to restart with a clean patch that addresses the
> > review comments? A clean version would make it easier for reviewers to
> > focus on the current issues without being distracted by earlier
> > mistakes.
>
> No. If you cannot send v7 of patchset as real patchset, sending again v1
> won't change anything.
>
> For seven versions contributor did not bother to respond to feedback and
> did not care to read submitting patches how this process looks like.
>
> Effect is this totally broken v7.
>
> This patch introduces undocumented ABI which kernel tools, if used, also
> point out.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for the feedback and for spending time reviewing this driver.
We=E2=80=99ll continue with v8 instead of restarting from v1, and hope it w=
ill
be improved to meet the requirements.

                          Sean

