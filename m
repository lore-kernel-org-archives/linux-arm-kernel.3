Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF9CF6482
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqlxq4GLND3K9ye7P0GyW42Oo76McoBw2YQlNfxTONo=; b=BCKXVEGc3wQZ9a5VIyJqHK8v5o
	5TqNfQ+3ZPW7afO4xWG7BNIbRCsPl+WYmBlVtTmAp5oh0uXviU91x0Dx9KNiIFjbZhonVl3aJGzPA
	vDlz4Exs1NlLhD0KJEE9ssrflMJS5MBxUsAbCF6QKdPgUOk0GpX1jX+6l0s99mFePBeHIXk03jP9j
	cD5ZxCHZYXjHftar70ofp6GMXQhce/2a/daDIrlhv9aH9aVSUVXML/qCM+kkKL7I2JfLZixiRdKzv
	Q863uZ0Y8myZLToJ7lL/xbR82RHBSINsCOjAiGYy0uashGQFlMo6ErXVlinE/gK63LB9tPQI7GpUl
	mZOUa9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqAU-00000005mCu-1Xks;
	Wed, 19 Nov 2025 21:56:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqAS-00000005mCU-0hwQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 21:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CE8B44378
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A70C19422
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763589407;
	bh=Iqlxq4GLND3K9ye7P0GyW42Oo76McoBw2YQlNfxTONo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WxfU5OYO9Q3RBqQ2EXbAaENgvkMfSqe36o5BkLOpNArKq45XVYBYf9iEh5V63r/ba
	 eDmb1jl1BhEsTOr1XFFCls2m0SMMMe9MT55E52NQZA+UBLUtRJnbiSvya6ACJUkR+q
	 OgioWjT87Z76w7RL4v2q440/eHVIc+aVwnxSWP/oSVUQMUAE31bEZ7+4gzpcamBT64
	 qmg19F8udI3IxPz190JvpRllPe/YXRB0XWyhRCcaJgpopXJi9BvnL1rOAyyelCsTJk
	 uiVM5GXXMsiXo+cUAaU4zulMxBAGosQS01R5w4L/fPvOeidVTEyh2Lft48M4Y4o3nO
	 JlYc7LcbOSklA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so297021a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 13:56:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSsIUf8fJ/AhMkngvfPqeyvk2jZAkP6RPbH/Q8Rr6fjtPldOD5uroXljZ+XMZzE3Lfowx6iS/oHxYOrmuIsIZP@lists.infradead.org
X-Gm-Message-State: AOJu0YzxonOnmfj8pOpj/D21iRlC4ZqzAmE0ueetqrmdF+aqPXVINYSg
	cYVyZywzOJGEfhRWhhnBsbvT7AYlvWhMXnyckEWLetfpCSNNGiEqAzzwM+2hqiUR7nob4T2J9L3
	EJt6LBKazIU/4ryCHbQ8Qm/BGaNMNyA==
X-Google-Smtp-Source: AGHT+IG84EJWxanbiYx3xNWly0j0HLza1i6ldgaRhiCAN5QoYsLc3V6uABYjj4th1Y+IGbn1Abrg9uwT+QyU+6qhTsc=
X-Received: by 2002:a17:906:6a0d:b0:b72:d9f1:75e5 with SMTP id
 a640c23a62f3a-b76554b825fmr65344666b.20.1763589405712; Wed, 19 Nov 2025
 13:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20251117211316.725960-1-robh@kernel.org> <002fad46-adb5-402e-8eb0-e4c71b862674@ti.com>
In-Reply-To: <002fad46-adb5-402e-8eb0-e4c71b862674@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Nov 2025 15:56:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJNOeKViuUwpLf-7RzBDB-EMm35MumJsGZ0deX1cLx3CQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkj8Gwj1YjO7fbmvN2gv4HnRREDyfmcz-Q4kQMeMDDh9iPZgJePyXNl4vM
Message-ID: <CAL_JsqJNOeKViuUwpLf-7RzBDB-EMm35MumJsGZ0deX1cLx3CQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: Add missing applied DT overlay targets
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wadim Egorov <w.egorov@phytec.de>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_135648_228504_9B227AD7 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Nov 19, 2025 at 8:47=E2=80=AFAM Vignesh Raghavendra <vigneshr@ti.co=
m> wrote:
>
> + wadim who posted something similar:
>
> Hi Rob,
>
> On 18/11/25 02:43, Rob Herring (Arm) wrote:
> > It's a requirement that DT overlays be applied at build time in order t=
o
> > validate them as overlays are not validated on their own.
> >
> > Add the missing TI overlays. Some of the TI overlays have the first par=
t
> > needed (a "*-dtbs" variable), but not the second part adding the target=
 to
> > dtb-y/dtb- variable.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Look like there is more needed change needed.
>
> https://lore.kernel.org/all/20251119123216.1481420-1-w.egorov@phytec.de/
>
> Could one of you post the superset patch?

I'll leave it to Wadim.

>
> I have already sent out the PR for v6.19rc1 for TI tree? Is [1] plan to
> be merged for v6.19 cycle, if so I will plan for a follow up PR with
> newer version of this patch.
>
> > ---
> > This will soon be a warning[1].
> >
> > [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.or=
g/
>
> BTW, with above patch, make dtbs seems to fail w/o CONFIG_OF_ALL_DTBS=3Dy=
.
> Is that expected?

Yes. What's in linux-next now is fixed.

Rob

