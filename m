Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F9D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93zNIG70yctC/o2F6/8pEzAVpRB3wDBmDkdUnANafeo=; b=IDoRgI1hdbW8dxf4hj1lerDdyB
	DIaSBRB20cB24TzGJbYGzMNtgo6S5eriklsu6f0easjkb7LhohOcRoKV/ASa8LDqd8rdsfuoYnPy4
	/3HCLrudW8uBnPjwHOXx7A0FWnhwkkBVwd2g1l14PtMrriUomwYKqkums2TqW1InVCbiFYXk3oqGW
	LJ7ZFcDsVqrLhZoCLiRETbcydeQn7ypuO5HRkunXpU2vIoODJHh+G0+hYGeOO6IfzynNd7L084Y7q
	iJigCDDBJSVUolKTfzDnujnp7rKNNqQaT112w8l7f1rGA8cEyUSM6CWTSPcTFdOgPr+2mNc7Cu9yh
	/pKJcavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyKw-00000007O5o-2Mm4;
	Wed, 17 Dec 2025 20:41:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyKu-00000007O5e-3XGm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 20:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6BD560018
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 20:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7E3C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766004087;
	bh=m+NGJvGmb4urpfziB2n2S8uyWajpGXAoCxUHE9tBX0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ggwMKfIEEVmg/z3iJ20zptR+342nL3MSwCkf1CbpqqLPxZV5WJ22KsrWwA/lr/iYd
	 6D6LzPQ4gcsahpC3nr+8Nv7fZOGGaJ2D07AaZGY4rG4RJmB7oKW8lPwZvVyhIRNX0C
	 Diztk8yUWdeNVqpyPW8RxVcVAmbckC8O5wAtYlDLx7Mi7TJEN1g2iDFRnN2M5kX6DV
	 uDbGgj3y4w2unjiVhDYxeZGkc3qpwDnbr+VdYj6/SxGrE56K8MtC8o9zIX56cRSvA7
	 LTaP3uNgAmL1R4frYIk5e0BPI4c6GKw+YWHqA2ybKMn33RioseVfEK9+kZWgiuiLqA
	 eX7IvUbDhel0Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-649822b4b64so9434349a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMOpeqbb/Ov8/kOAdDEgXQU1R6B3ZIMEjQjjQfrbwWfvKu+ujHCz2ZITmNyJjakKkrqIg4np04JOjXaoDGwz6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzOmqM7M/2u7As0Qble625N7b2ew5dsAG3ykoZYnBW2XqJcRdH9
	JoRAMf9SK4KQxITw032rATYmq5rcboVoS0tdJI3qrfn5pCCEbCbhxUML60ae9egeRHzarJLQQIo
	Up0PxlmSLnI+KNcHW6KV2uYpYz20RIA==
X-Google-Smtp-Source: AGHT+IHVj3VdlynG/5Zxp1SorxpjcAJfgTUO5NT+kBjbK+YjDVtTifflWtOBxnZqixTIPdtNI7wwltsMKCzYVtPNolE=
X-Received: by 2002:a05:6402:26d3:b0:64b:412b:a1a6 with SMTP id
 4fb4d7f45d1cf-64b412ba1c9mr3294249a12.13.1766004086133; Wed, 17 Dec 2025
 12:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20251216175914.2791200-1-robh@kernel.org> <aa064ecf-1714-4d40-8658-19952392cae8@amd.com>
In-Reply-To: <aa064ecf-1714-4d40-8658-19952392cae8@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Dec 2025 14:41:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKdrN5UpUWQVQXpJjbTy1gN9_FhhwOoX6zVpG+zZVAptA@mail.gmail.com>
X-Gm-Features: AQt7F2pslnRnOQwS3k8GuK0iuEWjAgkgx1SkEN3Smf-dCaJjbj1CVhpbDXoEzus
Message-ID: <CAL_JsqKdrN5UpUWQVQXpJjbTy1gN9_FhhwOoX6zVpG+zZVAptA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Dec 17, 2025 at 6:39=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
> On 12/16/25 18:59, Rob Herring (Arm) wrote:
> > The "label" property is not documented for the dlg,slg7xl45106. Nor is
> > it common to use for GPIO controllers. So drop it.
> >
>
> Correct it is not documented but it is at least used in Linux also by
> drivers/gpio/gpio-mmio.c:810:   err =3D device_property_read_string(dev, =
"label",
> &label);
>
> which is also not documented in DT binding.

It really should be for all GPIO providers or none of them. IMO, it
should be none of them as we already have "gpio-line-names" which is
essentially per line labels. I can't see why anyone should care about
a label for the controller.

> I don't have a problem with it because I can't see it used anywhere.
>
> But there are other devices where label is the part of binding. And IMHO =
this
> should be more generic property.

"label" is the generic property. Not sure what you are suggesting here.

Rob

