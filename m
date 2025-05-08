Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxrINe+dKCYR7ske9GiKvtihxfkQnfkQF4jb4kQthtA=; b=LktukUARUC18IphQgPjpdZTGYF
	FyFLHUFNkKSIo1YUxijPS/SAavfOYmrGdc1Gnebap1ER6aSC0Oi9CrEJ/GrtdaYdfadrQ6yZxFvRP
	eUQvum/rve2KyFKPsBHalKRDlhwHUdFe+I9DzEJG7PJSg6z8SoP+SKGNDH+00tKnIMdXhI877ud6y
	lBbqaWZKO/lS9slhatkYd0IpNrQXPaI3jIrCfNCg1IXyijNrEGuk2YbwLdD35dAAWmZHuAi7fBneq
	2c+QJl6dV9KFo0u1K7sgJ7zsIwXQAhGVv1XRPRgU5v7Rh9Hh2RAG87mkFlgvGs3YdUQqWU2uKkO+7
	L4U0+Qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2kI-000000011pk-1fJt;
	Thu, 08 May 2025 15:01:10 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD23U-00000000svu-43bn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:16:58 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d81ca1d436so8083425ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713816; x=1747318616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxrINe+dKCYR7ske9GiKvtihxfkQnfkQF4jb4kQthtA=;
        b=LSwXVe+C3R/15TdKmgIRWAXWI6af49OmI7j5rpOIo4i4ESWalItQ1ekRPcy7MpCUps
         GXQ0hUiogpmhFT2r0AYmJ9dGyBOLLpC3A0R79chMcfT0EHTK9jLuZC2jSzkcnO1Y3znc
         vbFv8VZ5Y+c20uvEeQbaJeX4X/rh6Sol+5bXNQMpRiQMwq/BOM11Ezi3hH3+XnYJOFGB
         is76jFJZ/b2m0NakjAPwYPrYIVZQSIGrVJ+eX7ZYVj10rJyCXs9H3Otg1KdM21UyGHuF
         Qj2BXIZQ13UBpoYWd0AjqA6pCEfeHvZ0Mwrk6Ey+WmmomAzGmvoBjKrS5w+pXAZOEGw7
         OiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713816; x=1747318616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxrINe+dKCYR7ske9GiKvtihxfkQnfkQF4jb4kQthtA=;
        b=uViGe4IqdeI5jH/lw76RFIsc12TNU9Tk8gqoVnDAoPNB5WDFaIfxYEr7S7la4Jjd8h
         2WGJhjoWKDfDCTpJhVfmCWOG+Z6Gr6RgC2iK4ao3tjfwVC/eapmPDFWFIrJRjraJdK0s
         cd5JWOsvRDBWfUAnS2x3TrIk1Of9H6KlwSYm6jN/VPy+qX57C+2wLT6dUBhlxdayMhM9
         avazSJGck2i1hfIfKMMKOPLAyDJx9LBDK5Y5AdOx3mdsLhtDbp7KZ/Qtmyt4X5EGuf/h
         nlTiiliyLFlHw/tP+/xmr58q0kfuTELaufyeKXw9yjL45BgMdJhVtq0MtE9ZGm5GJTzW
         3/9A==
X-Forwarded-Encrypted: i=1; AJvYcCW/bPhjzat1EGoHMCXhKEU+vLwZuwLpN3PdvL6OnP8MoVdwBjCRplpFoQL5iQM9TeHczWpr5BPyLOy/do2i4Jul@lists.infradead.org
X-Gm-Message-State: AOJu0YznYAhZEuLRNT7EWiPlIZFqkzIM4azeOZeiUs+Q/kly7VcHEUbZ
	uGZ9x2xcmckNdJjWcFTseiKBYrNOjmZEolFpTRKVzGWPecqc41++nl+VPFFdqtQFxMPryCMqqFJ
	67W8FSfGAyq9Cq9ktMzZnUP+gPkE=
X-Gm-Gg: ASbGnctjSv4JrM1cgPIgkkEpqghB+X1ViPWJKU9hogBho0n/IhVmAd71GSos4PNfIwA
	/Q3sOP/qa0NA9N2s1gukAA/GP5Y83bcJ37uXmwVWulpOgfHIqGPu8ZZwYvFeMbV2SB62KtLdQR0
	oc2yz/s9ioOdMQ8BXr7fzL
X-Google-Smtp-Source: AGHT+IGrmOWgSe9l71yWvuYjU8jpdPBXknaS0To8ptak9Rrr9Vr+gtzt2anfn7hR6oedXJfs2ADhScpzAwwWsA79JAE=
X-Received: by 2002:a05:6e02:12ef:b0:3d9:6cb5:3be4 with SMTP id
 e9e14a558f8ab-3da7392c8d3mr84631925ab.15.1746713815999; Thu, 08 May 2025
 07:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com> <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
 <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com> <20250508124047.xyhrabkxsbhceujv@skbuf>
In-Reply-To: <20250508124047.xyhrabkxsbhceujv@skbuf>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 22:16:19 +0800
X-Gm-Features: ATxdqUHTW_wHKCu6h5UnYiYBYEyS8_AYth_zQEjqWBotHa24eVPMHnpGl2Y6Vp0
Message-ID: <CAL+tcoBq_-COOvjk53oO1w=ReWQzMivAmQPF4F20vAF_Bd7sCg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software timestamp
 just before the doorbell
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, irusskikh@marvell.com, 
	andrew+netdev@lunn.ch, bharat@chelsio.com, ayush.sawal@chelsio.com, 
	UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com, 
	willemb@google.com, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071657_013996_D6235C5E 
X-CRM114-Status: GOOD (  16.40  )
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

On Thu, May 8, 2025 at 8:40=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com> =
wrote:
>
> On Thu, May 08, 2025 at 08:22:39PM +0800, Jason Xing wrote:
> > Thanks for the kind reply.
> >
> > It looks like how to detect depends on how the bpf prog is written?
> > Mostly depends on how the writer handles this data part. Even though
> > we don't guarantee on how to ask users/admins to write/adjust their
> > bpf codes, it's not that convenient for them if this patch is applied,
> > to be frank. I'm not pushing you to accept this patch, just curious on
> > "how and why". Now I can guess why you're opposed to it....
>
> The BPF program is not user-generated, it is run in the context of the
> function you're moving.
>
> skb_tx_timestamp()
> -> skb_clone_tx_timestamp()
>    -> classify()
>       -> ptp_classify_raw()
>          -> bpf_prog_run(ptp_insns, skb)

Right, I'll drop this patch from the series then.

Thanks,
Jason

