Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A4ACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qrTxLA4I8o8v3b/IBW8RF/TdQ7lq2xCRJqsETjYLeM=; b=aKNLGadafeSORH
	BOGKVpK7ZylMpxypqNQU6bi8HMQtiG8aEdctPZpH5jKSiNqDDBXUQk3CrRyjtZAMo19LvJgbU/PFb
	9sp7PY7+FhieOCYW8+U6575g/4f0cUop3/x760r5FfEUcpxCs6Wn2LMGAki0zTknS2R4wx3iX2Mp5
	ccr7eyI0mj8crBccWzvJVgFSYlPqeS6AfVbMc/vjr0Je3NNcxYZQH1qZ55CdnAEJh6sDIw3ENkT4E
	p2KYWQmpCUiqXp7L3HSySkzCQz2qQ0Mb4fhLxvYS3zZJjnF9SVbTohBHkSKVpruMz1SzmrylIZPab
	asksL1Xm2BXNxNsCsmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGrT-0000000GWb0-3Njg;
	Tue, 05 May 2026 14:34:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGrS-0000000GWal-2kBI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2035861143
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB15CC2BCFB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991697;
	bh=1qrTxLA4I8o8v3b/IBW8RF/TdQ7lq2xCRJqsETjYLeM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=NoKtBwyRtUm29XohPg9Vga7qRpKLoSJAiXprhcVvuKvhWjRLaq4OhM3yfiHoKFeEj
	 +NdIf79aoH9Noor7TQDGf5pTuW8bsEsch5pAJBOIH6OtNuNCIEXSDSuRE4GoIQCAcV
	 EjYKmDqBeR3QIkS/NPWXSH5KeScrs6t7km0CkVNkILE61DmjczrmwTIHuqr0QEnx0o
	 9I38oHaw0eBjADetlE/6gArE3P0tjlB9mEYTLuI7agP3zUQOsV2ZBqoH/2ggLUO6UE
	 CM3FbFP59P0tDBashJX7cyiNxTcAQHYNiq7k5TymiLNxMhtC4rrBCKRu8gpnxWlp9o
	 hJJbUTZqKpEKg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7d984096so60142441fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yL+TqJc4LqhCaoaksZb9chm0qa6snXWt4JnIybVJfhsi/QZEajalnsj8keN8JELJx9cp4S3qvIRX7jltVeXaK@lists.infradead.org
X-Gm-Message-State: AOJu0YzmzpucFnNerkqJ7nyd3kewVhyHgl28mpcVrOdS6d90HWyJ9DrX
	xlujCqG4gE229O1CJ8Mg3RA40w9wKd3JgSJ5/GdpyVpX4CfBD9Fme2lCEjY5DCWj1qtjNZgGjPM
	2o1i+QLF9Ky7zxYFXNKOUIWe6fOHXa84=
X-Received: by 2002:a2e:a591:0:b0:393:ba06:158f with SMTP id
 38308e7fff4ca-393ba06170amr11719431fa.16.1777991696235; Tue, 05 May 2026
 07:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-4-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-4-7e02178a93ee@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:34:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66r8mJ9Qqexs6AwLeG2m_h-1zCeaMoqPMXpysQhnS483g@mail.gmail.com>
X-Gm-Features: AVHnY4I0j_jYZqPgBwS8DEio1jLky1bndj5AzLllz7WoZK4WiA5673CmQRhWO50
Message-ID: <CAGb2v66r8mJ9Qqexs6AwLeG2m_h-1zCeaMoqPMXpysQhnS483g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: h616: add hstimer node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner H616.
>
> Tested on Orange Pi Zero 3:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

