Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F88C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9zeJ4WnqwFH5BMqvuX+OeeKVaWRigfICDw1jtDlC48=; b=fZc104O7GsWUHFjOl6hoXuazVc
	n/8DSacLOnzFPDlS8ddXxjWSZ1iSeIvRPKNJ6NXqrrOfetejZBvfM35jpq5QcwR32sqdmAb4w/x8a
	v9/+FdKzSDnMpyEQ9BFgVxT++FRyIc2wEqKZqAVTsV3YjkFRaxCtrr+vTusjADYYD0jdnUP4VkcXo
	FIqfGVGbfdC3r0vYdaBh1gjMZnA4UYNcXeEEreNOg1hSTPoYis+pHEvff0XvKfHzXsxXHMDgi0P2+
	TQKHQ+yALerLkUafZAmuwg+tnE8LNo50dnzNIg9lNVMhSwRy8BgXP36yhMfxD80stB648h2Hs6Sa0
	NoeIzuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEWq-00000002MwL-0Hqa;
	Mon, 30 Jun 2025 13:26:36 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEOx-00000002Lg0-19uO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:18:28 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0df6f5758so370319766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751289505; x=1751894305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9zeJ4WnqwFH5BMqvuX+OeeKVaWRigfICDw1jtDlC48=;
        b=VgruTOw2bW7wnW7VvTGXbONG5a2stg86ZkfDEH5Bt4IZZ5ZfHOBsDtfzl/s1dfPzB2
         VlcXEc226Wi9dQOhUmFoBvV4P27TbrC8W/VTPzyLYemGCTDfR5RSNFwv4NyoeKr/Vkrf
         xEb6xEMt0HfjxDNZBtGwqNh8cBdqEkA6+PXwJxu1m/WnIaC2M70Mfj+1RnsxHyFA5TPZ
         JQyX2rMoSsW3BeGMnsQL6GEvHscda9X1f+LTYNaaStgRbh0Mt/BD+0WcsG7c0K06hXYV
         wbhftU9DacJLK9Oo9Ck76NVk90tcNyENgKDZigdGP2eecXmkkRkrANRV2G48DVkFJHfm
         0Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289505; x=1751894305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9zeJ4WnqwFH5BMqvuX+OeeKVaWRigfICDw1jtDlC48=;
        b=aYJ2e1SdbInZby4z+geNoWk/kkY/pvcQ1yBbOXp4/CWVRWi6r6iodBxDJorqj+R4ap
         nO0+ziOvCae19RpUbw0yNiz8fQCZq8c9wxEvPf/qfjqNROL9CXqPhRgvglGNbM7Cnfti
         VPZzu25mD6MyPhi1gcLBREwkoH2U9+JUgTBPtQGpB671SPyyJkub1p1ChGNNDcaBsx6E
         4417jrQz1TY0r2ZKjPgoGsk4NgEZMErCU2BQwb+Il9w6ygsXTNFPDhpaPD+ebhY9dFA4
         U8gyseG+MCoGUjIKEUDv6uvjITtnjd6kdV6R2KVuDE/nyQLNS/Tsmq/yaprWJIKVCTtu
         /SJg==
X-Forwarded-Encrypted: i=1; AJvYcCXSYd0cyv3nU5JqGqlWL8fodzhXlhLwwmktg9nEf5hw3JGmut8SokqN0SRqL4bOrOyqOJQSmG2SqV+2iIFz6xPP@lists.infradead.org
X-Gm-Message-State: AOJu0YwTnsg9fHZ/UYKF+PNNG+axMWT/IFppizdNUKGmIToI+JRaFuZK
	kLP+JdX+M1H/oRwpSNf3Meg7eSP55s+GFbVUGOz4wPgvthm9cjuCjIkvsZCpa6VKmcwjLuTqzir
	NKmaNYBwVgc9rPr1KZh5uLsjKTWm1+jUWnvhSuJpWfg==
X-Gm-Gg: ASbGnctd/LYUHwtCRxU95UhwfXOKhuaR7Ht2f7PWOVKJNrMBqWoII909BNj7crwyowY
	cMfMp9hUMuONG/wPoDy83WX9JDYX0+g5Um2gDmVdLuY3NzDYH9v/M7d+YyrC11h6IXXFm32foqI
	9UZJdXJnk3OqI+EyoaaASydZmTSH4cTFrEQd2xIPU5SA==
X-Google-Smtp-Source: AGHT+IEawzH6slgwqh8lMlGexpCFs5UFNCtQJR4Lc0uD06pbIw6jclmGMPNliNKtJ0yxh9f1sHZF7joTilZ8ACzkvCc=
X-Received: by 2002:a17:907:75c8:b0:ade:36e4:ceba with SMTP id
 a640c23a62f3a-ae35018e67cmr951593466b.52.1751289505046; Mon, 30 Jun 2025
 06:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-2-robert.marko@sartura.hr> <20250616102103.faoc5tqp22we67zl@DEN-DL-M70577>
In-Reply-To: <20250616102103.faoc5tqp22we67zl@DEN-DL-M70577>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 30 Jun 2025 15:18:14 +0200
X-Gm-Features: Ac12FXweyWpZVaFd_k9KiyWdnFDxPWGB4lbqdU7LoxWxkr8ipI5ijfQoLUWnGLg
Message-ID: <CA+HBbNGWSA8QNzcN1HRosSd7qibM8G0u05cxiia6grGJJ0meoQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x SoC
To: Daniel Machon <daniel.machon@microchip.com>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, broonie@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, kernel@pengutronix.de, 
	ore@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_061827_325461_FE042EB8 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, Jun 16, 2025 at 12:21=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> > This adds support for the Microchip LAN969x ARMv8-based SoC switch fami=
ly.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Acked-by: Daniel Machon <daniel.machon@microchip.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index a541bb029aa4..834910f11864 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -133,6 +133,20 @@ config ARCH_SPARX5
> >           security through TCAM-based frame processing using versatile
> >           content aware processor (VCAP).
> >
> > +config ARCH_LAN969X
> > +       bool "Microchip LAN969X SoC family"
> > +       select PINCTRL
> > +       select DW_APB_TIMER_OF
>
> The lan969x SoC uses the clk-lan966x driver. Would it not make sense to s=
elect
> it here?

HI Daniel,
To me it made more sense to select individual drivers directly in the
config, cause we need pinctrl
etc as well and I dont think it scales selecting it directly via ARCH.

Regards,
Robert
>
>   +       select COMMON_CLK_LAN966X
>
> > +       help
> > +         This enables support for the Microchip LAN969X ARMv8-based
> > +         SoC family of TSN-capable gigabit switches.
> > +
> > +         The LAN969X Ethernet switch family provides a rich set of
> > +         switching features such as advanced TCAM-based VLAN and QoS
> > +         processing enabling delivery of differentiated services, and
> > +         security through TCAM-based frame processing using versatile
> > +         content aware processor (VCAP).
> > +
> >  config ARCH_K3
> >         bool "Texas Instruments Inc. K3 multicore SoC architecture"
> >         select PM_GENERIC_DOMAINS if PM
> > --
> > 2.49.0
> >
>
> /Daniel



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

