Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C56FD4F08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYPLk7h92BFVDAkv9kaTL4iC1VWtOgmt3soJigSph2g=; b=T0urrZ8y8NvwnGpyyoGwhkCBKB
	TmmZB3+bjM8Mh+ThqovIREyQpGd1M649ecPI3Y5KxGlSmThQ4oIc2n1R0OoZaoLc+Q8zAkqQ/V988
	o5XMC8rTdytNIoFbK96EfV8KHtQvqinr4/j7sScnYPEHQrQr1k6+ZB95AxPV1CsvqI4+WT5HYj675
	GcfySAvzFTlnZhfquHLSrmwNxWEjSyKZSR1E5yApYQxqDQdqbH9VJjs7r0FKByGlMvrrOmrDwRhwS
	nfF39Q1JYy4uLwNrUnfi9duJyXfFUPNMXsmsQ/BFqV2ahDWE2iI3U7OYzRnvujbiERXa4kC6vUQTV
	onsaaRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01K5-0000000A1z6-3KzM;
	Tue, 10 Mar 2026 17:56:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01K4-0000000A1yk-13VE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F11437CA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22845C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165407;
	bh=YOSJC2IC323+lNrs0NtYPEZYxLcLfviCMZ74PbxeQWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T891cqZjCsowv29AzQfcFL0AknJgbGGA/+t29kgZzsKOpL3zJFo5+Xzs1n9KnSVyO
	 EJOdjAz8LiS1HWoC1dXuTXgosvnBP0cI7jfiqStkGfcHz8CE46C0dggAfbhNLiSL7T
	 IgPO0jXIPCxXdI6jESSPLrbehdj56GI7F7m5u+ZAuPbn1pMouFW8+HNAbovSMNR4WC
	 imFrgFQtB73nKITcUwfBberr3+A4Yc2RB5NhizwoRSBazcz6okLW64v7jDH9TERV4e
	 ec9f/wSS5bfNdo7BfN+NMUHhlqI6aE+wqS/nR7pbS54SVMCMJ3rA/DWSTw14bbeS3T
	 L+LhslUTq/hkA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-662abedbeb7so2892131a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 10:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdIQ9e4Q6SnmHWPTg88d3MefeqXcLLotq7UGmFXMp20P1D1Ko5elfLGf7g2LxdinlXTp7BQ5msax6S9jrMq1sZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7Ar1YM8jzbMqDEZicvrQXtNMRAKmQKbfhb08VUGnVYA0Vq/+
	c084HA9Wq5cjAcQ5uR7TJ+SNXWOk/mwMPDMbXQ2VL823KPPBVgx1F0Vx9rxzRPm9KjH4YH9Bakk
	GcRFd/ew+lv9a+M8Zceam6UvMBU2D0w==
X-Received: by 2002:a50:9e27:0:b0:662:ac7e:aab9 with SMTP id
 4fb4d7f45d1cf-662ac7eacbemr2012863a12.8.1773165405616; Tue, 10 Mar 2026
 10:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com> <20260306004931.GA875708-robh@kernel.org>
 <924b7631-0b75-4ecc-bae2-162abb4bdc31@gmail.com>
In-Reply-To: <924b7631-0b75-4ecc-bae2-162abb4bdc31@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 12:56:34 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+b8vGzzpwR3waB79OjbyOT17S3W6htRv+3q48YHpDrjQ@mail.gmail.com>
X-Gm-Features: AaiRm51MMEXEqnOLjtLKD0uik8Pyp5xUqnmZcuciK2BL52Q7_ByxKePxBEdEeks
Message-ID: <CAL_Jsq+b8vGzzpwR3waB79OjbyOT17S3W6htRv+3q48YHpDrjQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_105648_328757_A1AB5B34 
X-CRM114-Status: GOOD (  14.84  )
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

On Sat, Mar 7, 2026 at 1:46=E2=80=AFAM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
>
>
> On 06-03-2026 06:19, Rob Herring wrote:
> > On Tue, Feb 24, 2026 at 01:13:01PM +0000, Charan Pedumuru wrote:
> >> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT sc=
hema.
> >> Changes during conversion:
> >> - Include "#address-cells" and "#size-cells" in the properties since t=
hey
> >>   are required by existing in-tree DTS definitions.
> >
> > The DTS files are wrong unless there are child nodes and there aren't.
>
> Yes, there is no child node but these properties are defined in sam9x60.d=
tsi for the compatible "microchip,sam9x60-udc" and the yaml fails dtbs_chec=
k if I remove them, can I send an another patch for removing these properti=
es from sam9x60.dtsi?
>

Yes. There's no requirement to fix the .dts files when doing the
conversion, but a fix would be nice.

Rob

