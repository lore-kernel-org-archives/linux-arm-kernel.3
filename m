Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD66C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mamoyFKjWvwAuu0GxO6oNdptahRz0WsLGovVsb1KAic=; b=hT00I0kcJsMQg4Qh/2oCmphOMG
	+rKTUTSsEd7Xk6oMx7gDJqfrN5cd6Cr6YC+kjQjTNIIucIkGCzwTEjm7P1HldYQTYUJfasFIhrSzU
	4BN+CGvmNnzoCjNUt0o/kX3sRdf0ckp63dPI8bJiunG1V/0AWbhuRsXLplYCfHveDBXBBQKQvxExC
	xmOmu8mv3Ae4yUZ/RTVvUl+aJpfHQT0Adyv+K4lzn2GLZRnF3UiyRSKAxJhjX450A3SVUTELNXS7D
	Tfr2AKOQLipgaTvA9s2iPG5hKXhe+NMVZMZmqzLY92/0voNXnPObxJWDP4aaRyRIaXtrz3t06Nq61
	Uau8Ngqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiH1-00000002MXj-33WZ;
	Fri, 17 Jul 2026 13:06:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiH0-00000002MXL-1XO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:06:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFEE642E50
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AAC1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784293597;
	bh=mamoyFKjWvwAuu0GxO6oNdptahRz0WsLGovVsb1KAic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RCShuLEoeLiLiieUuzg3cC0Ahs9bSguy1LIoYnrIkaUhnloavxbkEmnUcLdHDcXtn
	 TFY/BJ8mu5wbSKaNwlnWcCYOEKU66/yzUJCJNHk85YJIeMJD/IyiOaAfAQPuJcP7XH
	 em0fFXG69aqY53k3a85wUf/y7/byv43YRYh6ptW//iTMkmk1LclbTzOpU7N//hhzvT
	 323dUYxRht7EOlhCmtpNfXtinxe/7HdNwNWR76pDec8KwOVWqZt1bKm7XuNfQwv9FP
	 WFMmVx0E0m7BfjTVmTKBd/Hr5X5nnRogGjJBfA2ftKe2oZ3HGSWBvcU7juS8ham3Wr
	 iUgZi/PV6I4NQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e03c2763so352603166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 06:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqbbbidWHVqEsqT7qINhC2S9P0ZDuBpkC3ZQuywbXcmtpVmKamypPQbGP+cW91tDBl4+x0kbtgjZgOz7Wal59L7@lists.infradead.org
X-Gm-Message-State: AOJu0YzE+FjM8g4PXYHiAok96SCxTMyD3ZtD3X3S9H5+AXnos1Y5PuBe
	RYCXyHiyf4J3mN2muSDjg7OZfNCMqExjW/yqeApkFYq2uULVCaI3huODQm+CeixJbe9r1g9+3LW
	yNOZc+DsqCJ5PDv/Ufn7azSdk+sBAEA==
X-Received: by 2002:a17:906:6a1a:b0:c16:ab18:55bf with SMTP id
 a640c23a62f3a-c16b417051dmr138404466b.31.1784293596209; Fri, 17 Jul 2026
 06:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com> <20260716174237.00004b79@oss.qualcomm.com>
 <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
In-Reply-To: <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Jul 2026 08:06:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
X-Gm-Features: AUfX_mw6LJXrxe2IQurrdLfm7PIOYMWKcR5ywCkgwLq8okgu2522Hbb9oiRx92U
Message-ID: <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, jic23@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
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

On Thu, Jul 16, 2026 at 7:59=E2=80=AFPM Chi-Wen Weng <cwweng.linux@gmail.co=
m> wrote:
>
> Hi Jonathan,
>
> Thank you for the review.
>
>  > Not sure this doc helps. What are these interrupts for?
>  > The driver only uses one of them so why are there 4?
>  >
>  > May well need interrupt-names to allow gaps in the list to
>  > work but hard to tell without more information.
>
> The hardware has four EADC interrupt outputs, ADINT0 to ADINT3. The
> conversion-complete source for each interrupt can be selected through
> the EADC interrupt source registers.
>
> However, this initial driver only uses sample module 0 and routes its
> end-of-conversion event to ADINT0. So the binding does not need to
> describe the unused interrupt outputs at this stage.
>
> I will simplify this in v3 and document only one interrupt entry for
> ADINT0. If support for the other ADINT lines is added later, the binding
> can be extended with interrupt-names at that point.

No, document what the h/w has, not what a driver currently uses. The
only exception I can think of here would be if only 1 interrupt pin is
usable on a given system. Then it would be just 1 interrupt with
interrupt-names to define which one is used.

Rob

