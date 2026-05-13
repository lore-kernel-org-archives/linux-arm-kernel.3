Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577A9CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0E17z7r+LYNRSdvyWdyqZP/kUEcYvbbo/0Srhey10I=; b=KKpKCkzDJUEJ+NikiHY/i4faYi
	ci2pD072+sn5EcIexVQZsN2kp6HEa9LOL2CgoD/x/YUeMn7bmgLcrzrGOIklX8DqZYgxdeh8tc5BO
	B082oW9h7k6gSajX2E3/8UMz+vWz92gHoAfEBqY91zwVFGNJvFWohPGJPHDLbPViQMYAKydcRtmmu
	wOwxvCA9YqmQ0ujHOROfWcqefqQP/eDrv09/mToQebn8a2+gBbo0yFGDHnunXwJFe2nwxUCyTRf4c
	WnEwir+Xbre1QhrC/AOB3Xp8jUsrJGo3d+DpDdq6VrChR7WVWIfwNXkHlBaCsyfK5r10ji+5MyQjG
	qW1FB2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN64X-00000001xAV-467s;
	Wed, 13 May 2026 09:40:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN64V-00000001x9S-21zC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:40:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so69554465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778665205; x=1779270005; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R0E17z7r+LYNRSdvyWdyqZP/kUEcYvbbo/0Srhey10I=;
        b=WucoOtz0lgTvvM11MOvuUEt5SlcHFJndNaoBvwaEFymh8rRwwBJvV7pbz/cRuinu+i
         EQLvPygUzjML5hA9jY5CXcUEkaLKMWOZ3pkT8anlZ0oYMwVp38j/emSaNZt9x9lSe6Lo
         pMHViO99M6CutatQcCf3GHgQyh76ZZZexaZzaMTiYF280RnMyGLGPUeyo8/WWLB9IyiE
         5JEJ1Uq9AsRPi0l2R2ignpfqvicH1Rk+Ft0V2XfhFHUQTAaH2TNZcMvaJaeUfl3XIU0A
         bLEE6uvJWiLLgIgEp38PhESv3/e+lRtiGnPHjNjGyX5EOYw+Lcss5eLZoy/6Kj1x2+RF
         WdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665205; x=1779270005;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0E17z7r+LYNRSdvyWdyqZP/kUEcYvbbo/0Srhey10I=;
        b=Ue60AJNbEAsJ22RqxeIfPucFR2XGAWr5poEuKS/6vTQAQF5ERjh20xT3W+kE8jNEvA
         n2CIdFf8W1Amm7bZQde769z2XGf5yp0K7FjLy1XjhoNGBm4SyB9wHiDQaNcINSU31p10
         WUllCyPuDFVhhPLf93vIRK/W35VxXWVAwnOyXB3PXdL7f7kps6yl32PJXcecqd4zk1ar
         ZQAZ68X1g1jgMXODKlpNIKRNVnRuZ96oGZg1aMuEWYIXhBBX5HdTBjYmBeklc5lRUtrF
         SIf+k3x+2QTn91lvbYEo9w3Xx2M5jOXOyEZwh5FQgWSH7ZjVgoQnLmwLMwPBisE35kms
         lRug==
X-Forwarded-Encrypted: i=1; AFNElJ9yoMOo55QV7ddN7C+U9U632u1W+UJ2PI3e+FwzRZ6rzUQ0j8ZQX7+RI9CuGVHkRa2SWBLM9T36QB0TGoMr3RBX@lists.infradead.org
X-Gm-Message-State: AOJu0YzNc4sTFIgDBxJwOPueFewNiYxm1Cs7+t372i/bH9Zy8fnnMxGj
	bOm0uAZDyeFjnNDTZrWSOvlkT2uQIl1IUZWzStec+Pztdx9w+VfEUPrC
X-Gm-Gg: Acq92OGMd/LdisOw3avV9C1lxTQACxVLGYkTo4f/JgTesK+fM5odBCXiyjz8NFCKc3H
	sBeJJ5MeaEBKDVm2sQZqGUKA1YNnctcI8iRh8Jz3vQfi1c8YqbKsIoLgdbEdIeqtTXfL40S9Nn+
	DGiJqRUumXZDL76lKwsbtaV15cLlaxTRNOrzn8qnlG+ywhwHFLoKMTcPOix9FPWQHl2xZ0DYpSN
	m/hlqCJFTauVnj/GfB80AFqWx7BqLG6sPrlxEjcWmAptUWMjVkzkxCpY8uhxMyuoHrLgbSwjM/N
	qC0s4/OIb7tMJlv+eT+U6NwZIOD8SkMu9qtSsbtP1MjjrQms6ni+vvJGLak99Tk6igt61ZK3xwH
	MoCSlaxMB/+DN9wkeGgixrUMcWV5cBXLZLOi9PO1HWbT3/SACPVSnaB5bPPeqFiyiNkHq+dMn/M
	1AZKgdxBf45UFA7mmnXXlLcOnF7lXU68rZgF5Kwjl3Lf24YuD4
X-Received: by 2002:a05:600c:8b12:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48fc9a3ba11mr39073755e9.19.1778665205077;
        Wed, 13 May 2026 02:40:05 -0700 (PDT)
Received: from vitor-nb.Home (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b308sm65629665e9.10.2026.05.13.02.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:40:03 -0700 (PDT)
Message-ID: <17e3511e4bf46f83c91088bd4e081d4323e1bd93.camel@gmail.com>
Subject: Re: [PATCH] pmdomain: ti_sci: add wakeup constraint to parent
 devices of wakeup source
From: Vitor Soares <ivitro@gmail.com>
To: Kendall Willis <k-willis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>,  Dhruva Gole <d-gole@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 tomi.valkeinen@ideasonboard.com, sebin.francis@ti.com, devarsht@ti.com, 
 vigneshr@ti.com, vishalm@ti.com, vitor.soares@toradex.com
Date: Wed, 13 May 2026 10:40:02 +0100
In-Reply-To: <20260512161737.pflweaz2r3q3nrfl@uda0506412>
References: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
	 <becb54adc0bea88578c8fe4c7c1b7b68bf5cc6d4.camel@gmail.com>
	 <20260512161737.pflweaz2r3q3nrfl@uda0506412>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_024007_544027_F70407AB 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, 2026-05-12 at 11:17 -0500, Kendall Willis wrote:
> On 17:51-20260511, Vitor Soares wrote:
> > Hi Kendall,
> >=20
> > On Wed, 2026-05-06 at 22:16 -0500, Kendall Willis wrote:
> > > Set wakeup constraint for any device in a wakeup path. All parent dev=
ices
> > > of a wakeup device should not be turned off during suspend. This ensu=
res
> > > the wakeup device is kept on while the system is suspended.
> > >=20
> >=20
> > Thanks for the patch.
> >=20
> > I tested it on our Verdin AM62P. As expected, suspend now fails cleanly=
 with
> > "-
> > 19" when an SDIO WiFi module is registered as a wakeup source, instead =
of
> > crashing on resume:
> >=20
> > ti-sci 44043000.system-controller: PM: failed to suspend: error -19
> >=20
> > I did not test the IO daisy chain wakeup path, since that is out of sco=
pe
> > for
> > this patch.
> >=20
> > Best regards,
> > Vitor Soares
> >=20
>=20
> Hi Vitor,
>=20
> Thanks for testing the patch! Could you add your Tested-by tag?
>=20
> Best,
> Kendall

Hi Kendall,

Sure:
Tested-by: Vitor Soares vitor.soares@toradex.com

Best regards,
Vitor

