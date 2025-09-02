Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A484CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=; b=zhyuoKbJ5Yc8jfEXG9pKrgEWNH
	UpPTs+aFOtSOaYmmLiwble0M/hANHJ8HwJCwNefAThzM7Ohvbnqu6i6MWyl7RPqftdGsXX9mO2ZST
	dMzCsIWTX9xtpH7iGTSESDJN5tngkTTspe9LuQ94TDqWSjpJyVxg4uDqs2gfeAJFTIvYsgGDyM2HC
	ffOZyQlYYeHgRKbV1y0d3TSpzGvQJmqdguiGSdkzLJ4rJarc0//+d1tQ4WAUQEfGedywhd2zgi62g
	rf8qgE0OPamBX+G+XNV5hDcIJqyN19XMZJfP9dNLUbwwxT3s4f4PADDEVJQrs7FrzD/V6IAcw8NYe
	J+5FomDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnJ-00000002CFH-2R1B;
	Tue, 02 Sep 2025 21:44:01 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTAt-00000000kOB-1McX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:44:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afede1b3d05so923655666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827838; x=1757432638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
        b=PSY3YCkBEzdjvw+u/hKZfwADAoLL2BWCbPo7N2TKU9Q3u6gjcRBegtVHE6yhbyRvju
         0oHK8ZFfxKbBZAKvNR3nZJT+lZbNZj9zqFGQ8oYYQMPkQf+8tJ86bfJG/ocxjQXTfula
         CdaPE5oqz+78WGOG70b2sJJDs3eI7AIiEfVS8ArKoGoltLK+Cqq/SIV0lTksqxZfTD1Z
         E2DMkDiCf6QrfkYS3lg89XmNiSRIQBSaitRIRkF1mt707Gd3maKYSgdKCuUEremdpF0l
         tIUfAmmQs01w3dOp3ScB0fvwEDGZvW+6eYL5dey3BRaqByoAiYDR/0Maqz6PmxvLhYqn
         Mlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827838; x=1757432638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
        b=Js7g5PI9XyWAyjkM2ReMSb71r8JO5mRb8oBMpCRijfGzAENHCZfU3Gx18DbTj5ptWz
         hwBPGUoJC2BXpBXz3E1w5jWwZYax24XICBRE90+uKHIvVy0/sR48JdMlgVuwHCXwlrhN
         XhFX2Du/GDmQR8FgIRMPRLqkmupYvIADQina0NiIdZE2/HNsUkNtAko1ig123lxe0acO
         u0raP7d/C+16OohuP8VIeYS95lSrhFbIwU+wehmq2qhjaHQlZM7dqfe6wNS+sQQXF1th
         YDkMGauWWX6nQPRAqfSoem5C8Rf+AysY1L4OJ1auKbiseV31+nQlMaAV0fjJZag3XjTJ
         HwUw==
X-Forwarded-Encrypted: i=1; AJvYcCWO1JdPrsRiiNWn32asFxa+JYnfwWuP+uEwgY+/Dkw9FVPUYT7B/mX29TGEJMItIivH/UwQj+YLAsA0xscjBKYX@lists.infradead.org
X-Gm-Message-State: AOJu0YwAaVyqH1Sius9zaQdt0fnU1ctlE6E5QkRCSp1ujBYYuhj6rLkG
	tFBBkehW8Gw5spREMvnpSGKzviTLd2fY9h3As/PJnjqfC5AHJ058pTTL+dmsdskV4TbWyqMnAXO
	AKUzJjwZ/NgugMzrWucBwFZrG/jGbPB0=
X-Gm-Gg: ASbGncs81StuS87MWnFDJk+7J4iSQCsJfO2+IZ1T1gQoyX+ERzwTa13V9stK1n+e62d
	2vVJ71P6+O75C7mjTH+5qiQPuIclKCf76DJakwiggvyKBlhVcELfz4dxmVQlYX83gnxtHFejlHF
	HTkLfvQoYGc5/Sz/g4DRkAaltOu6HSAzayAN+SdU8yA6aVX32GVPeyFqJksUGjTDq9x17ieIPtE
	XH/KPpXq/KnLITWtVHqAz4DWv38SHLyRtBW4mz2NW5KQwsWxHk=
X-Google-Smtp-Source: AGHT+IGjVz9zqn8BbtmRC26R4QSkX6A4Q84g3hbk2BHW4+6JnnTvFG+jS17Ww+dxP48t8AY/g3mKnA0lZtUe2mcohUY=
X-Received: by 2002:a17:906:4786:b0:afe:e7f1:28a2 with SMTP id
 a640c23a62f3a-b01d8c7835emr1258659066b.23.1756827837577; Tue, 02 Sep 2025
 08:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902-spirited-congenial-stingray-f8aff7@kuoka>
In-Reply-To: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:43:31 +0100
X-Gm-Features: Ac12FXzIsq1sQ-x5uMFEMxBzln58PfPIlzCTK000OG7RlVhFny-x7C12oPVK8qY
Message-ID: <CA+V-a8uy++vzYh5956X2Dpv2Low5uAK+FRTONaP4Nc3FMty6Bw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase 'maxItems'
 for 'interrupts' and 'interrupt-names'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084359_377968_502241B0 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Krzysztof,

Thank you for the review.

On Tue, Sep 2, 2025 at 9:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Sep 02, 2025 at 01:12:59AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Increase the `maxItems` value for the `interrupts` and `interrupt-names=
`
> > properties to 19 to support additional per-channel Tx/Rx completion
> > interrupts on the Renesas RZ/T2H SoC, which features the
> > `snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.
>
> This alone makes no sense. Why would we need more interrupts here if
> there is no user of it at all? Squash patches.
>
Ok, I will squash the changes.

> You also need to constrain other devices, because now one Renesas
> binding gets 19 interrupts without any explanation. Please rethink how
> you split your patches...
>
I see you have already taken care of this, thank you.

Cheers,
Prabhakar

