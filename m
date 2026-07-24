Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B79C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10CPAHBrRRFmM+R7Ydgt/SJbeQlykc+ccPFO48gPVcg=; b=oq8V/ebuve/jtwGFDmj9WecL9A
	ivFGf4lMLg/lwlRMosho3mNuqpfFanFnkQITxl4gtPHXx2jng4p48IWroaO05x7BwR3zydMh64ys8
	PfQVHhQFgapPBQeaLh+ygHvaGLw0PSXHVqSKk5CJGd8Fa7/GKHRS4+F91x9HHcqNffdCglGRELr4E
	lE1lX8ldcfDbOn6YHytpNSJosP3kTxZL6dl+K8DsISmZAraKEfIImf+yF2qdo0UxyJGz/2Ln2bwE5
	w8lKTQBycOzorObEIP9sX2S+Vcnc5xRNIT1RqlJQ8iOumi/kCG/B4m65STwaOzr3Arf3SGLLXI5pL
	WVPLlsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAkB-0000000Fjct-0SkI;
	Fri, 24 Jul 2026 07:54:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAk9-0000000FjcI-1yD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:54:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B667243A47
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE471F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879692;
	bh=10CPAHBrRRFmM+R7Ydgt/SJbeQlykc+ccPFO48gPVcg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YPV6NsJ0Ow0AXXDdeczqxf9MGL9GBUKNGBZhAZeduWRP9YnEIgOYcuEdcDEM/uyIm
	 1Wtt/3DMDqClwUPKJVttxfy11QquBWeN3/LcFEZVoMaQJx4kvaDPmGzex2zLAaoer6
	 f6N0O0YJkar8io/jUQoP2ULTWojDafojq/akXfkTziO4OdGPOvofYLz59g4WBysOVM
	 t0ikiweebECdoO2BuK5Lyxb7CTVc9d6UjYX4Fza5KF4Uv0Tal+KOtMXQBprEJFzwSW
	 GclpigNf5Fn0uPokNuk9zEdZVWkOzGqyzBsbMhcZkVEjwW2YK9d8UbSLllpA0wS4bA
	 xkJZkPtFSOSfA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01910b499so133153e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:54:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpYgMKdEi3lL7kjBlKrbnBsVl1ZkyonqCV1y00D2uQTrT3l0IJnijxrvvnW8Chb0J7ackXxfVqvwcIP99kb/Fnz@lists.infradead.org
X-Gm-Message-State: AOJu0YymXQrgQqnmAXH8G3vgj1Ois+XYHLIOMKixIUHiiR1BAB6qFvcq
	4yWzPYpwhqzb0P9AYCSsNs1TBPMQ2kNU8AlEnMG7Af0xAdG2dZgfBeBDpDQs8jK8lzal4w1rwZu
	gkeSX+xJ3geFGp+SnPtIjjZ9kE1wW5ss=
X-Received: by 2002:a05:6512:2214:b0:5b1:5f9a:96bf with SMTP id
 2adb3069b0e04-5b2b313aafbmr1200818e87.8.1784879691401; Fri, 24 Jul 2026
 00:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260704122324.80274-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704122324.80274-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:54:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLkxRn886ui77G0Y5t7XbMypYDKpa+ff9x5kfzRY-_jptQ@mail.gmail.com>
X-Gm-Features: AUfX_mw8d-NlQ15u2foM1w6pRk_M1oFNcy6OoJCUo76i4Dn_-d4ZfWchNAD0pFo
Message-ID: <CAD++jLkxRn886ui77G0Y5t7XbMypYDKpa+ff9x5kfzRY-_jptQ@mail.gmail.com>
Subject: Re: [PATCH] soc: ixp4xx: npe: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Sat, Jul 4, 2026 at 2:23=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

