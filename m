Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FE21049514
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01GKf65j/jScrwoKQ+C2Gxr6oYYNcBqF+y3kaUEjbLo=; b=w93A6g2kpsg4ztHlt5PI0CHVt6
	wd0gu4zrBENDGAaAlis7jo0N12QNJhIwpRoAwLYFwt+Y3n8TQxjg2CL6QaXnfa4BwkvzE/ptZoaKS
	w+7YRPI3vagjDeUHyYyRu7fphH7Fg5CppNDdel4xKTYCKAx0+1OBNzchIfy/W12oIuVdiNfeySC5S
	0V1ZE6LZ4Xtf0fKgnGAjQNF4MGXSLdgcXWwB0xZ4UMv5xFMb7dMFyey3ackAAAYTZeXcBk5ZrQT/1
	sXHd8MDW/Syh3qcHGJ+8TfaM59Fa+tB/cGwUaqHY2S8obOfNLuEB7Iolx55XVjbwUkWGG5GhbD5rY
	hasKUPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoY-0000000BH67-3SUY;
	Wed, 11 Mar 2026 09:25:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoX-0000000BH5H-2Qjy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE4E36013E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7196CC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773221112;
	bh=01GKf65j/jScrwoKQ+C2Gxr6oYYNcBqF+y3kaUEjbLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MF3vSz279c7gxTZF7NgmWXEwUO6gRL13DHvShsuI2CRziUEddwspHwDaaJCHkRV8i
	 1e8zOtRrOs0iqe9JzaJ68RtW/nQ1cvGHa1wiWmmW48FlI7kwj/kEddAkxcXjR1yDzp
	 SJIQlrnxZuj6GGfdBmJRR8x1vTwehdyhvu4FbSRfBaZTFT8aPShUh3ZNLiLOPgRB95
	 yQdLMmafhM6TBUlKOPZylVs34PzLhbNs5nvhVRvc3stp3hfCZaU9UkVuxIOh1zjH1Z
	 +6oVrXcP7tP8GQ//avpnN2ZW+fNxiu/UD5Y1l3+K74rROfInQkbqpAvv3i0u6ejBkK
	 xqNFoTovsi7HQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79800183233so11822477b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiQCfazM53f1HkCEBThA1rS6LWjyWW4x27rRQJ73ZgCIuAJy4IsnJ9nEon7N1crqg3n5Cuq8pu3BzUcuFNbmbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJRuEyguimInetF7UNJpEyKb1F6GGj0+xT3FbWj8quS/Sj62XD
	2r/gc/qzeL2CDdpBRaWZYRNlzzFmLl/TNZOEZ+Wny60bfUd6ViR1QJpbdHhJ7epW8CQ1+wI4V9d
	u2D4f+WTGa4Y+88AdwpyNRjUNU1Qwtrc=
X-Received: by 2002:a05:690c:6d84:b0:794:f400:2bfb with SMTP id
 00721157ae682-79917f593b5mr14822137b3.26.1773221111798; Wed, 11 Mar 2026
 02:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:24:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
X-Gm-Features: AaiRm52-5ccgCpLSKuxxaehFi73jWhXjY0Lv_AX860GJVRZU0Kw14nXERH-rf2Y
Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] hwspinlock/treewide: refactor consumer.h from
 public header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srini@kernel.org>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 8:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers. Also remove contact field in favor of MAINTAINERS entries.
> Fix the users, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO
> Acked-by: Lee Jones <lee@kernel.org> # for MFD

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

