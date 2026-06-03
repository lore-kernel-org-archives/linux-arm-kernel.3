Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126F9CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVdTuQdmZHYEnxjt/VTYFuuNhfhMD/0cQDhgpbVYh54=; b=s8ZoLNlTQeaRFlyUEnj3vye6Ye
	fSDMWTUQxm7Sf1Bm0de+wjVIMfllonNy8rg3eYUt64FHJy6G+umclWWLOdsFQx6IGbjdH4Wa1eh4g
	1Q15SY1B/Zo0roYBrDeN2H3Vr4FrtGSnGBxLOlB6l8wCQZIiVKQmBftggLxBMD7Io0LJlwutKAkXW
	9YgC6IrPhVnjFVq6R0c3Rw5+kR8pO5QtXgChLamdjNEhYYE7+/AdBPNWxhywrXsdKYOe1W1fsNszt
	THR8lw63G4g1PzIeFU3MU3FOlqFGcIuUppRXqS3G2XN+G1r7LZNMbids4ehf8j0j7N/egE0NIMAFQ
	8vNqkqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiqA-0000000EodO-06lF;
	Wed, 03 Jun 2026 10:28:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiq6-0000000EocP-3Aqu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780482525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVdTuQdmZHYEnxjt/VTYFuuNhfhMD/0cQDhgpbVYh54=;
	b=AVCa/YXtAkxXUC5wS8FFD3mEtw9e8M1ocj4tKe7kBCFlOZhDcybRK7PZE2zUMOjhcv6teu
	DgWKo90ZidjMGo6qqLOijVubW+Av0sCOVRNCkQK6PV+nE/4eNxtE3eWU759dEruQdy81uU
	w00iTjfBDL5i+7vFRcL9Q5NNttFA3k8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-oWitalpbP12LfyIwYSEZNg-1; Wed, 03 Jun 2026 06:28:42 -0400
X-MC-Unique: oWitalpbP12LfyIwYSEZNg-1
X-Mimecast-MFC-AGG-ID: oWitalpbP12LfyIwYSEZNg_1780482521
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3967739401aso2683621fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482521; x=1781087321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVdTuQdmZHYEnxjt/VTYFuuNhfhMD/0cQDhgpbVYh54=;
        b=mLwcyHBXfGw9PjbgoEa9ic5ym/CatDy3AY+5EdH/jMLZ7QRykTq1unH4r7y53vDoG+
         jA09/7wLytx5iGmyeMK6l+NwHGNmAQjrpjuUaND5W4YLh4R3mjWeVt0A/5cf849brR0a
         pSN8YpalO/FAweed2b7FT1xSSpfg2rM591GYhQLSKgKSAfKBDhCBWRtp3fHnY3MnzSGO
         hdYo8tZg+WRTrIWiRBU9I/V2Er9HzRAIhYF/ur9KKrpda/0z5ApjE5TJ+r0ngEl8YER8
         YcP+6lBsOn1DNopHh6S5UvuXjJiTaGTaIM6koMY9WJdQ5MGG1ZOcX/8gVPXZziyU4+U/
         D2OQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QyfN4o953AJzTDQ79pdgLamJHmmaw3cdCK4bYYxURny45C1hQOPMxINL6SRX4PdYH8Wve3qR6TeSRV6uA6ybD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu5VTcLmmiSlAJMBBOmuCfMKAA972hjlj9a4KO1UvfksUmNqQ3
	b7AMQhNWeUUvQwBz8oWpqTBEoKi/jUXl0IaM3lKopuq+vPtGELJLTkQnEI5TEENiLlocWavKUos
	D9rQqpOuKzeaYqo9rcehNwxEY749fjjiQ1wPKDx8w/5770MjJRgCorX/YXNibIayqILNwafLZrR
	x3O3GvQIxteS8Dv7MY7P2PtDBgCyb10qIw3LPQjQC0co+ahhqkPdE=
X-Gm-Gg: Acq92OG2XxfphmYmW3goi/MDOWwS0t/lUZn3tWsiRLA3bOK+52320YQ1QQm4kTESyUR
	lMftOd+4b5vVUpGL7N5W3FfO3wuj0XbzRL5B+4dICxZc77kE2jRqXzFBIm625rAspRUcvTSAuRl
	uobfiGAQbQ74Sblt5IW6ztYbqMlBtQ8vNoHXYZiXPkVCeZe3fYweYBnw08jUhAkJ2fFl0BJn1rQ
	TSH9+cMoKp4FnvA
X-Received: by 2002:a2e:a378:0:b0:38d:fae9:9aa2 with SMTP id 38308e7fff4ca-396ac1f98dbmr3702201fa.1.1780482521045;
        Wed, 03 Jun 2026 03:28:41 -0700 (PDT)
X-Received: by 2002:a2e:a378:0:b0:38d:fae9:9aa2 with SMTP id
 38308e7fff4ca-396ac1f98dbmr3702051fa.1.1780482520475; Wed, 03 Jun 2026
 03:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com> <20260603093941.ysev5do557hy2rui@nxp.com>
In-Reply-To: <20260603093941.ysev5do557hy2rui@nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 3 Jun 2026 12:28:28 +0200
X-Gm-Features: AVHnY4K243RGdZFkCQVWXj6BAHeNzA4KK32K9WJ-HAOfKjnlZ8EVyBxG-YNveZ8
Message-ID: <CALE0LRuqZhm03QbYg-ZOJcKe0XqCLqVZ8j-4o07QuBF-OqX9BA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 0/8] can: flexcan: Add NXP S32N79 SoC support
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: goOlUrEbP5cRBZHW6DdqB_WKLopiEILlVuo5nRvq0FI_1780482521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_032847_482290_B34F9F1E 
X-CRM114-Status: GOOD (  28.62  )
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

Hi Ciprian,

Sorry in advance for the noise, for some strange reason I didn't get
or find the cover until now, so I added my tested patch in 1. Doing it
now properly.

On Wed, Jun 3, 2026 at 11:44=E2=80=AFAM Bough Chen <haibo.chen@oss.nxp.com>=
 wrote:
>
> On Wed, Jun 03, 2026 at 09:13:34AM +0200, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > This patch series adds FlexCAN support for the NXP S32N79 SoC.
> >
> > The S32N79 is an automotive-grade processor from NXP with multiple
> > FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> > other SoCs in the interrupt routing - it uses two separate interrupt
> > lines:
> >   - one interrupt for mailboxes 0-127
> >   - one interrupt for bus error detection and device state changes
> >
> > The CAN controllers are connected through an irqsteer interrupt
> > controller in the RCU (Resource Control Unit) domain.
> >
> > This series:
> >   1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platfor=
ms
> >   2. Adds dt-bindings documentation for S32N79 FlexCAN
> >   3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
> >      configuration
> >   4. Adds S32N79 device data and compatible string to the driver
> >   5. Adds FlexCAN device tree nodes for S32N79 SoC
> >   6. Enables FlexCAN devices on the S32N79-RDB board
> >
> > Tested on S32N79-RDB board with CAN and CAN FD communication.
>
> Tested on imx95-19x19-evk board with CAN and CAN FD communication. No iss=
ue found.
> This means this patch set do not impact the original platforms.
>
> For this patch set, feel free to add tag:
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
>
> Regards
> Haibo Chen

Tested-by: Enric Balletbo i Serra <eballetb@.redhat.com>

Tested on the NXP S32G399A-RDB3 with loopback and high-rate traffic.
No regressions observed:
  CAN frames transmit and receive correctly, with no duplicates.
  Frame reception showed no errors during stress testing.

Regards,
  Enric Balletbo

> >
> > This is a resend of v4 with no changes.
> >
> > v4 -> v3
> > - flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
> >   (not just dev->irq) during IMASK register writes
> > - Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
> >   each handler on S32G2 only processes its own MB range
> > - Added received Acked-by tag on DT bindings patch
> >
> > v3 -> v2
> > - Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
> >   flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
> >   processing when multiple IRQ lines run concurrently (new patch).
> > - Added flexcan_irq_esr() handler composing state + berr for S32N79
> > - Ordered quirks used by s32n devtype data by value.
> >
> > v2 -> v1
> > - Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
> > describe the actual hardware feature
> > - Appended new quirk at the end
> > - Switched from platform_get_irq to platform_get_irq_byname usage
> > - Updated interrupt description in dt-bindings
> >
> > Ciprian Marian Costea (8):
> >   can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
> >   can: flexcan: disable all IRQ lines in
> >     flexcan_chip_interrupts_enable()
> >   can: flexcan: split rx/tx masks per mailbox IRQ line
> >   dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
> >   can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
> >   can: flexcan: add NXP S32N79 SoC support
> >   arm64: dts: s32n79: add FlexCAN nodes
> >   arm64: dts: s32n79: enable FlexCAN devices
> >
> >  .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
> >  arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
> >  arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
> >  drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
> >  drivers/net/can/flexcan/flexcan.h             |  12 +-
> >  5 files changed, 316 insertions(+), 37 deletions(-)
> >
> > --
> > 2.43.0
> >
>


