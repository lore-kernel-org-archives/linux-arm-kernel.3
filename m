Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DF2D3EE86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiBYDdwf7o92W92u31+mXbb6d9oGiuCDv1WeALnfb+I=; b=DCcLmZ1FH6Z8CbvgX8G8I4UFFc
	QHInEjwYZyiRuV5GkAPAjFGfHaRrHyDrL1yMdA0dEma1z4ZM0q+J48Zp08kB2n9MbLKrN2uFC4oeq
	Z2yLRnK3G93gF+RjgIK9TFNjgmTkC5XUQYfb/qdub9tjkfBO5svgheFwlajZCBIOPDP9aL9fGA95N
	tGhNSCbVKry9MLQJOzJm/vcy7SlnuefYzsi7DTRIiV4C1LYmAcoAy+99PTLPJbUaOoGSA4pbSxDLF
	6Z9zQuDETL5k3/l465RnDBaFkpCmoH9+ucVzSPQ9HQMiz0vEKuJdvA4unfBBdhStvXFyY/5nw5lIp
	66+9r19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix0x-00000007Mua-0arQ;
	Thu, 22 Jan 2026 15:54:31 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix0q-00000007Mti-2njf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:54:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-34c3259da34so690191a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 07:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769097262; cv=none;
        d=google.com; s=arc-20240605;
        b=hB+yZK5YZqiAGCQHhcCoKlKYvBvJiKgBCS+u2se55atwIU4m7sJWBOVVqkvNKBjzWY
         zYfCHKLKk0U6bxuFr3AM+eU166rOlXDtq1kJso73+u8OelyDac9siI7XvRSdZgpVRrui
         vTojmw9A6/MWd4XQmeqiLgg9vRdsPLlsTsPun1mbnENMM0zVUIXvNc4HregEvvImppIn
         A+pvvx9FBkmFTjHDCeubPAku6FQL54CZpYUbbTpTptgkf/k4WTX5H9P/brB95H36eUC0
         ju5EuG2sErW+j23Mc+ts7IvQtNFrLRPP7GAGbiRiPDTG2jWYr/PgF4k45eZlp0kOtCdG
         lqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YiBYDdwf7o92W92u31+mXbb6d9oGiuCDv1WeALnfb+I=;
        fh=8T/BuQcHEL5dun5hcHRIIWqHuTwsi6h7XhpMRBXtrtw=;
        b=JGx46ixzM6InB1peI82U2nkzXIWOtvSGMM9h00DSUqrv1cAunbN+llDJ+AgSG8jUjE
         it1JZUYpjE3q47HMS3KzqIElaK3Mw+aEX+R07yN3EvFE2Bz1V1UZNKY8LUnE5owePDuY
         DKhPe83oyh4QY6j+45RLwpJ6CVefvICuEpYowJ7NL5MwL1qTIVufuQryT2BpJTVg194g
         0fAZd0vhrFAOHA7EiCIcMDMsS+srAjsaXYD+LO7NqfOglTaFfIFvaZcbwX/0vBa5Eb+S
         CiCy/3P6rYGyuAnhlCQtHy04shUS0Xjz3T+mkmXdLgJQi+ck1EMCrJBQQOLoB6OApOSc
         xNRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097262; x=1769702062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiBYDdwf7o92W92u31+mXbb6d9oGiuCDv1WeALnfb+I=;
        b=MvVWVA8nljsxdDySddEiaLMQ2f1SEf9zx5TOyuPXvx0a5mxG0QNSO10l1BPrELPDbl
         7HaMZreyppVgsgFrI2uyaFuOlNx67JsZok454XxTdsEx0tKh5I7ZgMmpE+LQMxYtDxE+
         qNyqbmT001AtZGanNuXjQpRTloq9S9mlGoOz92XnNng4u8c/G9qVJINM+R+cMKvAAkh9
         aSlWoQ2OfDo8YrbA3cWi4wHKCQq7ElTP+TXncAMskMK5i2jRwu65hXuid1EPKMsZnX3Q
         vGmOxvJTw9xzIBNEC6qlxzjNEbB7iCybYxmIS2kDwAIxNbdHbbvzd5P3gRhPekhU3t6p
         4Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097262; x=1769702062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiBYDdwf7o92W92u31+mXbb6d9oGiuCDv1WeALnfb+I=;
        b=Pha/SlOnmBy7Pb7atJNLyQYdBbKtV9YZLhQG32/o5dBYgV/FJp/qR4DntSPTyxm7m2
         Ke+jPtoBeeoM7dc72ezKm29S25ksokS6gT8Y/IUgfTDB0D3iaJsZq3P2czVWNWjiJ1Ax
         6OjtdvtaO1JWolDSUAAB+nroemcric/JCruTGRkuNgToTd5qMwOBCPBWuThMP1C11ruA
         l3tK+9ybT06vznj3ZX18t0cZVOnd8TnWXAqUbrEdiBZ38N/9rctj1H6SF2HWJf9cmFZC
         5hctYuCswRBgj8LhEfnK4oV6f7hb1CoskvENrf5oEkjDoPqLlCTubd+isj2tSjf5qaVA
         sw8w==
X-Forwarded-Encrypted: i=1; AJvYcCW4p4ibHt8i3ZWBTJ1GnZuoP57TqYTQSAuucxmSMnY3sayqaB+k8YMw1sE2J97xjP+0mJljNKjJTJ02sF25pORw@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYDlNGC/TX1C4XsZnzxrMjjxDIy0tDfOi9aYjjFL4WGZ1Dg4m
	9o0JltZ68ImMLaosU1e3Un4lUjouIn1P5fqQ+oss8BiUYBKwE8xKpiif/PWqVC/bCuGQKhwzjZj
	Q72e1XI1Rw7YSTn8bHKxZpAG6/PwR3/M=
X-Gm-Gg: AZuq6aITmXJ9IMO3AXPS0aE5itIq6fAXc7qOfRvCsYpbPl58WT0AY0omF8/c+EjM11W
	a2I8FZou1ufHidQ5Jpz1Ab5X+P5vNiHjgwjS7lIcHqS0nigs8eh4pWowETqqI73ugvT6L7RW5UY
	qoG4SbxTNWWvLMCzM0RvFQaoMv8fj9DYQgHtk4hwoiur/0/wGR9/tlYBOtShUZ7TElDqMSXHpIR
	0a2rOsV7nAzMmvezpof1X6B8Y8yaORDoaUWH6cB4bjZEX9f2oL4RvvYQv1/rSFnlbUXvfOrtonk
	l5bg05rgeAP4jc3lqF4Tv8tnntPw
X-Received: by 2002:a17:90b:3881:b0:32e:3c57:8a9e with SMTP id
 98e67ed59e1d1-35272fcb836mr19032172a91.35.1769097261943; Thu, 22 Jan 2026
 07:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20260122-b4-vexpress-config-v1-1-3f0c85bc4730@gmail.com> <aXImjNHQMeqMbcAu@e142607>
In-Reply-To: <aXImjNHQMeqMbcAu@e142607>
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 22 Jan 2026 23:54:09 +0800
X-Gm-Features: AZwV_Qi6Q9dL0Fitgz_IMok5VkTaCCdHNVapMoj_b9GgxMngUHM3kODnl8vCL7U
Message-ID: <CAN4SLj1z07jqJOuZQ3x-ND=-aViMUhZgaBf3n4k0-R_SryzNFg@mail.gmail.com>
Subject: Re: [PATCH] bus: vexpress-config: Fix device node reference leak in probe
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_075424_738289_59585154 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Liviu,
Thanks for the review.
I will remove the header file and send out V2.

Best regars,
Felix
On Thu, Jan 22, 2026 at 9:32=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> Hello,
>
> On Thu, Jan 22, 2026 at 08:33:04PM +0800, Felix Gu wrote:
> > In vexpress_syscfg_probe(), of_parse_phandle() is called inside a loop
> > but the returned device_node reference is never released.
> > Fix this by using the __free(device_node) cleanup handler to automatica=
lly
> > release the reference when the variable goes out of scope.
> >
> > Fixes: a5a38765ac79b ("bus: vexpress-config: simplify config bus probin=
g")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/bus/vexpress-config.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-confi=
g.c
> > index 64ee920721ee..a1fa583e9f5d 100644
> > --- a/drivers/bus/vexpress-config.c
> > +++ b/drivers/bus/vexpress-config.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (C) 2014 ARM Limited
> >   */
> >
> > +#include <linux/cleanup.h>
>
> Not sure this is needed. of.h includes cleanup.h, so we don't run the ris=
k of
> not getting the cleanup macros defined.
>
> >  #include <linux/err.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > @@ -390,9 +391,8 @@ static int vexpress_syscfg_probe(struct platform_de=
vice *pdev)
> >       }
> >
> >       for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
> > -             struct device_node *bridge_np;
> > -
> > -             bridge_np =3D of_parse_phandle(node, "arm,vexpress,config=
-bridge", 0);
> > +             struct device_node *bridge_np __free(device_node) =3D
> > +                     of_parse_phandle(node, "arm,vexpress,config-bridg=
e", 0);
> >               if (bridge_np !=3D pdev->dev.parent->of_node)
> >                       continue;
> >
>
> Otherwise, patch looks good to me. Thanks for the fix!
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Best regards,
> Liviu
>
> >
> > ---
> > base-commit: 053966c344dbd346e71305f530e91ea77916189f
> > change-id: 20260122-b4-vexpress-config-1d2051861d93
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >

