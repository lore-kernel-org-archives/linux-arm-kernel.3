Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3976CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=627DvcBL/GTdPlpYYcEZZXWw06fe0YXL5NBPNlxZyAg=; b=ybGSj/WGbZj2ZJ9lIljWxK4jrz
	k/ayetyg7DhKLpPEVFEooecKTy0+wtq90g62cNxubUYhHXSGSsYlZ2o1e33reSgssra7eVATHtC6Z
	qDvkoltYdl0HyZkJxPF0A2ZG0idgbYOnI94aM6Ut20Sk/fE0zpLUuKkjsvJpns0p69ziGFa3Mn2PK
	KQHBIH3CepWu789tIYmEY+x6ZEKlYoN8O3vB2CO/uBZlBriAIaoDOKUMxWgW8EFnxC2rRrV9ASA/7
	M5cQq54P3rF9YrIYkiqwK7V9MEeam52kVTvIXAcDg19qxUdF7jESbGM52E3n52amBmDA/9rgwKYtn
	UQOjZU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjx3-0000000Gik3-370M;
	Wed, 17 Jun 2026 06:40:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjx0-0000000GijP-0YqL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:40:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b7866869so54652565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 23:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781678435; cv=none;
        d=google.com; s=arc-20240605;
        b=bHEOj/3kZrvcegobOSUoO+MOzpzRT9mqzXMvLPnwSlRmtXzHE1k3fhonW4QTmGKqKN
         U0uxM7KQrAhQlNmWlb/ZuOTEtK/zbbOg/upx/OUfcpgYi01IbLbuMx/PsPrzMMZoHT1Y
         ezyADaYMyAgylbGzdEQdVnrY5IvS4j0JBjM+MFA9/KQzp4JPjkyMl2kTLt3z9iwyqbI9
         RsLucOD1EE8DrX+GBtCx+eqNCZvvc/P4oJ2CRmxrImWVRpkNeM5YmYkIhYTm/E3ieSeS
         BjvO6ZSGTYxQWZQVIZnlBqTglYkoB/nOlbvpMYefbRIKPhaH255TJ7/gi8tK7FP646A/
         VXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=627DvcBL/GTdPlpYYcEZZXWw06fe0YXL5NBPNlxZyAg=;
        fh=Bxr9tEvNss2SJmoitKI8GxeXPRffwSRlmqN3oQTn3VQ=;
        b=lEu2g17PshVWKw5OQHP8Mropc6p1o9u93ScrI4oa6kQwJLCzM2aE9o5sy0DVcY4JJ9
         o7Koe6yqtbH/2GZZ1bPP05LlhCyvwVSMhocZPUi+3DBMIAMhD5N91AkugIO1ucD0rqGT
         qTZ4KseVKL3liJYPyPZ1Kx8M3yiYXW34jm7zcqgi585gkU7ADTaB5p9UpfqjwrOWmHc7
         AOfhc2yScNnHMKaJ82VoJdo8dGwtqGYociqlMgYNhA3BnAKlkdl3P2AFCI+6eFJfhcCb
         zw1GHs21UvMHJ7nEkrauxrUgsW2OnTUIKwAR2TdPp2tRuok9T9JF9y3ZxPFme37lxjP2
         xR/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781678435; x=1782283235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=627DvcBL/GTdPlpYYcEZZXWw06fe0YXL5NBPNlxZyAg=;
        b=fVqDl2QvqC9Q4U3mWkyNGS8Y+lqXFKhRa0kAOlI8Lg3V7E+2l8U5ZC8ecAK3TQUqJp
         lU9HAgEIkMuH2gqMQqSyGEJ7ekbC43SYoMzaWrWfA1RdpaEIo+tI1fSa8iphMIePXLOS
         K7rqAKD3NPlAHwUpyl9FrMzqnL9sjvQbhkaiTNrQRmfg9FlCUG/Gk/YwDpfDifc5rufq
         ATCEXEsP8kpzxC/uXgK0hlrb3WTasZFa/6f3TzoXHjNDFmDS+jB1TAosmm+ZX2LVh4Ij
         19KR+IX7iHY5mPBi0U8FTRHov1B+8WSZMPlzEZTmwcJdKkOKMrcaneTRN4TXt5QiqVvp
         r8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678435; x=1782283235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=627DvcBL/GTdPlpYYcEZZXWw06fe0YXL5NBPNlxZyAg=;
        b=DuCUq22PuCw5yDLf26IrQ82p4VSJZF89UnACdW+l0KuWuHDBLngXhBKPUwK1OwLiZ+
         icwqGh2y0+ZlzkLbDV83t6tT5cYx2wspZ7bipZ0od7HdWz5dXF9Uu159vAD+JaJ4C4Dz
         jFiJsFc09E9RgPydmdlHPIEr6lvpGzmEOXDgS/K2ReEVCgXkWDIME2yf+OpSIVZYDpRz
         5Shan/TIc5BDg5/z3U6V2J4QrEz84dYtySOT2zUPBQqChpblr7psDUcYPbjZTxrVCGfq
         VtfXpTwCxe6oX9OrhBWmvWDGhHjITurAfO9DA8K1UG0uSqhI2aWsmdZ88dPxEJ+bUHCk
         rteA==
X-Forwarded-Encrypted: i=1; AFNElJ9iHV8HBeObpjMAfMkg97g1F6rg78kdhHAgC/AOosCzMvCuS/hdSoF2AnDL/vUgaRRaqyAtBeuZ65Mx/TK97DEE@lists.infradead.org
X-Gm-Message-State: AOJu0YwpzpALLyenATc68+KEpaQm4jECbHDR2vFd6w2JiMkb3vQ1S7OF
	1vMOEN+ZQTx2lP32z1+uDmQ7qf/AWZ1gzOXcFTNsGYGSypu8tN/DDYcIVs4kDd208diaGPl2xSQ
	eeKAwXgmsGCqawxcF/u9hZxqB/M6CJYX5Ll55W1M1Lw==
X-Gm-Gg: Acq92OF1sdXFXLc7B5DBrawnfsduBreZGLrrUyYmm7rlBq4PJT0YvtP5jQs0K99kOJA
	XUVhkR6FsXRZkOs2KvmMiVcI6Opj4BGT9kqEDtzUpwXqaVKLIRDe8o0IZFL57ptsQqV9xgoAtQb
	flOrlqSz2TtO1KOXcd0KixhVT4+F0aS+n2tRmqAKzkVpRDP3u4SXjV9BZGYfXFPVLlNV0RMD/G2
	HgHrY6RSP4+jIMfhIYDkrzLbi4LgOmF7rD6Om2fqs2t0KpT+Uvvyz/BkVpW19oMzdMucvcAAZXb
	TLyeciJz2dLt+Lrk/pbTcDwfFsA8swdHKSw3yojpL1yinthNGlTftSrpsFIQBmVe5Se0
X-Received: by 2002:a05:600c:4503:b0:490:cdb2:fb5e with SMTP id
 5b1f17b1804b1-4923412792amr26171515e9.22.1781678435211; Tue, 16 Jun 2026
 23:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780929570.git.gregoire.layet@9elements.com>
 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
 <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
 <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
 <CAFi2wKanAH+ekKz3eVtdiz=pjEvmKwSh1XhE-Xo7p=CCiSWpEw@mail.gmail.com> <e5822b82e99f8c2f81deecfeaea2192b223dfbec.camel@codeconstruct.com.au>
In-Reply-To: <e5822b82e99f8c2f81deecfeaea2192b223dfbec.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 17 Jun 2026 08:40:22 +0200
X-Gm-Features: AVVi8Ce_fPNb_-dl2aHTctX4f_poGDs7t08FlXnmiOLbRzVBfN5Op5CBNbdSeAw
Message-ID: <CAFi2wKYgxKpp0ezzryYhFPDeqAeHhUq9Lhm67pVpnXRg+c2Vhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	anirudhsriniv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234038_441562_9EA17A18 
X-CRM114-Status: GOOD (  16.05  )
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

Hello Andrew,

> The concept sounds reasonable to me. There's probably some bikeshedding
> to do on the devicetree property though.

Yes, having looked at how it's done, I would say :
'aspeed,vuart-over-pci' and 'aspeed,kcs-over-pci' flags would be
better.

> Can you outline the duplication you're concerned about? I think it's a
> matter of resolving the SCU syscon to its regmap, then performing the
> necessary accesses?

Both drivers will need to set :
- Enable PCI BMC Device MMIO
- Enable PCI BMC Device IRQ
- Enable PCI BMC Device MSI rooting over PCI Device 1 (BAR1)
- Enable Host 2 BMC MSI interrupts
- PCI device class to 0xff000000 to be identified as a MFD device. The
reset default is 0x0C070100 which is an IPMI KCS device, but that
causes issues as it is detected by ipmi_si but can't be loaded because
of non default KCS address.

Sorry for my errors, there is not that much. But both drivers will do
almost the same initialisation. That was my code duplication concern.

> I think it's not as bad as you make it out to be. The SCU's regmap
> protects updates to individual registers under a lock, so concurrent
> modification isn't a concern. The hardware design choices make all of
> this slightly awkward for any related software design. As an
> alternative you could implement a mini subsystem that relevant drivers
> could call through to set the bits, but I currently think that's
> unnecessary work.

You are right it's not as bad as I thought.
For now, I will focus on the VUART until the solution has been
validated. Then I will easily do the same for the KCS over PCI.

So I'll do for the V3 of the BMC side driver:
- modify the device tree binding to have 'aspeed,ast2600-vuart' and
add the 'aspeed,vuart-over-pci' boolean flag, only for the ast2600.
- modify the '8250_aspeed_vuart' driver to add 'aspeed,ast2600-vuart' suppo=
rt.
- add vuart over pci enable and disable code to the '8250_aspeed_vuart' dri=
ver.

Regards,
Gr=C3=A9goire

