Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F7CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upz+BP1PpvZRL3Gk76mNduNNnZ2k0rnk5kAxI2QKcA4=; b=jmohajPZpENpGLLXkIQdKwoaHg
	EIJ+xrY6dYV2IuiJKq+MD8sFGr0v0D1ceSWxsiKr+4kexYSFMJepbbKSNs0pVJKWUXUZ4DnqeWi0h
	oheTdcVrzbVbHyQw2kZjglLKTcdtqZeyM6NUU6VAqZ19T6NSd5dzv+LjPuN/6eR/2FszQYjmd9JCj
	oj4uCrKISgYAUSOKz6DspMFlPpvU7hButxIGDZvAHXWQ40K3TP5Kyl78jki/auSy8IjsoYhlqnoaP
	0hkeWqdDGV3O78TFIctVUYi0k58NNEJFIs+7XxU6vdYbVasHLhikOGag+106np1zvL2WMC1R6YGRD
	r6Ju5rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHj-00000004mYQ-15Yn;
	Fri, 09 May 2025 20:25:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPf6-000000045Cx-2Fup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A0F545072
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 15:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7B7C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746804560;
	bh=u+Whabb4TQ+V1V2yliDhCWhKigIzzI/sTbPFTZHRF9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Iuu3n4Uyj9Btr+jAtfZQO2qjS0zZ7RvAv1/Ep7KZB1PHN+vV4+FOjUVtgkxDFd7nW
	 PvqhnTI3zFN4yCj4jYGc05jA6TjJnhGSaN+tBmwcpN+iBnBRlYuGBJpE56EKG6KWSC
	 oo/JzeXV/yajvU9K3qL6UaXLlhw5G0C8qF6ibeEUWzdJW0Ht1YdQy0uiJ6fCx1hpgK
	 yzc6pWnMbtHTNEc1jEOjW32Vj3yHka+rYotvt+YUdJrp63YXFHzNKAguZdD4uAMqM4
	 FE2jB20XFkgQaM4GpFofMJbRwfRV366gf1cy+5s6dQgjIahNBlif357qgPt94YruaW
	 fFKee0/9OzeCA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso403064166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaoyRe5i58RgE4RgY+VoAcVi9oR7B2iCFM827IWBoSYSqeUjooT+BRCKW24yh6gMqnF3oEM2/qAbNdMWUwwIXC@lists.infradead.org
X-Gm-Message-State: AOJu0YxcLbfPTqp7+JDRdshy0zuOVrizXoLHp7mtQtfUJ9GP/MReC2j8
	T7/ObyRF8P0XXuQDDqlhP30wxx5TVmOy/KKZupEcz8IgqhimPbyclDT0DexfrjqToeob0RKhx3y
	plkael0rNcuR5WLn6+2ptXL0ueQ==
X-Google-Smtp-Source: AGHT+IFpczEUqnPNYIDG6QEN4AY6S+XPrH2ZeIjVtW3vGPBCT3ZbrywOOs0Ayv9anzhiuXSkFJbKCQ8a0cunW/1ogxI=
X-Received: by 2002:a17:906:34c1:b0:ad2:2b35:8f8b with SMTP id
 a640c23a62f3a-ad22b3592c8mr93912566b.23.1746804558571; Fri, 09 May 2025
 08:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250507154924.1602842-1-robh@kernel.org> <2025050935-suffocate-snazzy-c5f3@gregkh>
In-Reply-To: <2025050935-suffocate-snazzy-c5f3@gregkh>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 May 2025 10:29:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKjssqGOO6H9RCneo86fKop4bQtiKNcCq_95fOk2CP+eA@mail.gmail.com>
X-Gm-Features: AX0GCFvTiTZ5y8MxQ5bk6A7pgLq2QXkWvtig-fgmbVa_BSqfAAnHtSv9O7h6O8E
Message-ID: <CAL_JsqKjssqGOO6H9RCneo86fKop4bQtiKNcCq_95fOk2CP+eA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: serial: Convert socionext,milbeaut-usio-uart
 to DT schema
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Thierry Reding <treding@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_082920_596157_BE3BD523 
X-CRM114-Status: GOOD (  15.13  )
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

On Fri, May 9, 2025 at 9:51=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 07, 2025 at 10:49:22AM -0500, Rob Herring (Arm) wrote:
> > Convert the Socionext Milbeaut UART binding to DT schema. It is a
> > straight-forward conversion.
> >
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Fix $id path
> > ---
> >  .../bindings/serial/milbeaut-uart.txt         | 21 -------
> >  .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
> >  2 files changed, 56 insertions(+), 21 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-u=
art.txt
> >  create mode 100644 Documentation/devicetree/bindings/serial/socionext,=
milbeaut-usio-uart.yaml
>
> Are you wanting all of these serial "convert to dt schema" patches to go
> through the tty/serial tree, or will you be taking them?  Either is fine
> with me, your choice.

You can take them. With all of them, we're done converting serial drivers!

Rob

