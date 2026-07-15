Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D05C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=; b=hm0Cv1gtVeBR0HwoU5BeE+nGjR
	zQWabQyWm1XkIJmsQ+KsRRZvwQkcmmNbBr99gUBMQjT2M3+V7Nll5gswuAAET7yHa2l+62GCIMfYb
	EEQPN69QHr3/sUUMc285LWz6EABzc0XNsOrm9Hyz4BJmFk9YFGc4NVc6U0yMyZlbpzzlQfqCTZ6lD
	wtCxjApfBWFRdAZ+ZQtS+EqdiqIIImeP5A6F6bHm6km60DN+u/YxvEmKz/mzn8m/iFNOrLqxwCb2+
	2sHMK/rsESHiwkESWQvKdC58oF41u65IDEddSmEU1i1FMVYZEzS8S6OtIG0nS+Fhx5j0hpKBkyeC0
	vFebgHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVO-0000000E5RN-2ldJ;
	Wed, 15 Jul 2026 07:58:10 +0000
Received: from mail-ed2-x01.google.com ([2a00:1450:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVE-0000000E5OG-3VwR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:58:02 +0000
Received: by mail-ed2-x01.google.com with SMTP id 4fb4d7f45d1cf-69850336c9cso647898a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 00:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784102279; cv=none;
        d=google.com; s=arc-20260327;
        b=UCkg+Xtf845phTp3gye3jITATqIdkBX8K0ctCAmzzD63bd/kxr3fD2S8OPpec75x1r
         zQjjAr1GDFjdQpXAMaTc4y+cPAO6OQYlPc/H0vNDL6QLErp59AYdMVR5bM/thmqD08El
         Fw0Ao5YY9PdL+ue/wv4kYa7IVu4/Zt2zwy8hbrPodxUyJDr2EC6ssCMNMj3mG0glK03z
         Nq9i9sw7EbzNA+Z2iZivAlxeXbxB3ataidCRQjEVhyN16oDoUHtL9xgPawMvNbE4K0La
         qK9l9wwj5+RbNMj8xQUIviNipKA+fI+63vSjKGxttS3TlhmDpqbcFO7dpZWDAg1DESqN
         qryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        fh=2k021D1tgn8WZd8QkKugIZ7uMAwJFNvo7r6iMI4LV1E=;
        b=fX6aw9HicBsWRNvHUOkwxtrZuGPLTc2N/8werHZE+u5ZvWrIyPe5HxDUJJlPh//GT7
         hi4n3ap7hwSo/MCZ8qDoj31ZxVDr2KSEvYcVjmElCmDBWhLm3K+ranmrMXLmKMlKY6J0
         4skCQ0JzkqCvx6cIdN2xRVCxxgrltGU1tSIfygTn4Fc+Tt4leWJDWODG7GwyVyq1kGsp
         mHMsDQG40LKvVefBhd2KYdJdh18QD6ZWKFQw+51FxaDhr+QAoWdaEhz5yrX829htVq/B
         VGzfl1yIWDr9Qq/VGpgYMHQgpgRgR5uefMcLUkO47wojkAJiZYW/M7iIzxaqfBRrh7pi
         nGyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102279; x=1784707079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        b=O2KajnGjPHGdDD2VkQBQsvc5hfm9Sr9W4JCKRpfx2w8aHxDEw6tzJvjFykv2uq2rLE
         qPFMssSk0A9nA32+HpopsUTmSdYN/iISWirwMuot23o9EWlhRqNKvC2uhSW1I+0UvRM1
         CydF1DnQM/l6JR1kXNTHSreAT6lo+hZdUjol/QZgHoWIBeedpufb6YSsP/B2Qkj0zTVO
         cseLzt2ELF3yn7KamkdW4AlUE14lu872AYCxdoeTv0e2/aR8Z7snpMZuYR0GWZQ7cEmu
         YjliYzSbs5ZtLCkWPiSPMj5vxVIe/OtJ1DFVOYbWXfiXNV19pVaSTLxhjK5KUq0QrSni
         pBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102279; x=1784707079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        b=dhb0eF4f3LrzeyfjRQ1qQvqqP6PmrgOiK8BydlNvEnrQh/bmgdVG8QNt5QZXbpC8c1
         RuVVAXVITd3B0+DDqM6C3c/N7nXkTiRu5d2S74MyqDlgtw0wvoZeVPCwjwVF7ffDgwGt
         fJXdAUmm7W/5rs9DigQElTGHHWPFVypRJ26m0+S3IZaYYiXcI5P9Z5q847Ei+QNNOmxA
         C66pnbHe3T7Ul5Y2DADXUQh3DkpW3Pcm+1n9I43OHt/e7it0+omwk0C+NN8dCsAEzxZT
         p/+E9SGdCs4P4otsWSfzCFGGzj5uDLfpyrwpW9Osi/0GyOSSTsPae8sM8je+r9/uwRRx
         uuKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkQjk56DSaScsBYZHvF1KpIwvf9CC+H/cO1fpgliwlynwno5Ex5I9ZRM3vnyXsKdLLsBkWnNFRmcJgeWlBqcRh@lists.infradead.org
X-Gm-Message-State: AOJu0YzOEz0bokN+Ep3S+zNXPv45POE1uxjPQMsuEqJcVsqMJ0H1ya9v
	Lw5MFp/Mwe5AANE7mmv5f5/gsdlNY/txg2mSqsEMT2vKU5RFZWznbv7B6+wTB9dSNk37D1Wn9VY
	Helnemb+cYZrwg29VQKwnJYSgqzLS93E=
X-Gm-Gg: AfdE7ckZ372n5zdjxCzjPJVWkQnzyfj8zWD/zv7YKBAGMJtkGBZYVIsJSNmxktLuxAk
	oQA67BadvMNQKf6rTI2i9HYYbIm24ojsHuCgB0QP99b9ci7d/ImibigZPJRQs8VhlVYYWPdWS/O
	IC3NkHcCtLVa4SZ2Hsgla7dqUbOxJmBXIElW4Qr74UjnshYQweq9uC7A1kimc9JPDfeECIg3kIO
	2hGdpBckFmp7FgOJ1QqY9HRl2u/hlpbOdOc7ipLq4S6AJVnWEX5qm1vUHohTkQm44s33kTmF3/Y
	YUs5pJShAablEClJAE3jDA==
X-Received: by 2002:a17:906:9fce:b0:c16:11b2:ae9b with SMTP id
 a640c23a62f3a-c161e98c3ecmr826018266b.17.1784102278649; Wed, 15 Jul 2026
 00:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com>
In-Reply-To: <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 15:57:47 +0800
X-Gm-Features: AUfX_mz1XbF_hj8SltUaP6VQCiYz735WcPjxUivwpVyatqEOGiO47eZKOAvcnaA
Message-ID: <CALj3r0h4cFd-tp9-UVxihL9-a1W7_4nvnKoXW_cP5WECKc66Hw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_005800_917131_AEDD52EC 
X-CRM114-Status: GOOD (  26.95  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B47=
=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 15:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 7/14/26 21:08, Coia Prant wrote:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that is accessed
> > via APB3 memory-mapped registers.
> > This driver provides the glue logic to make the XPCS accessible to
> > the generic pcs-xpcs core.
> >
> > The XPCS block contains four MII ports (0..3), each of which can be
> > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> > The hardware maps these ports to different MMDs:
> >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
> >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
> >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
> >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
> >
> > This driver creates a virtual MDIO bus that translates MDIO operations
> > to APB3 register accesses, with proper address remapping for each port.
> > The generic xpcs driver then creates a phylink_pcs instance on top of
> > this bus, allowing the MAC to use the PCS via the standard phylink API.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part2%20V1.1-20210301.pdf (Page 2078)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> [...]
>
> > +static int xpcs_rk_probe(struct platform_device *pdev)
> > +{
> > +     struct dw_xpcs_rk *pxpcs;
> > +     int ret;
> > +
> > +     pxpcs =3D xpcs_rk_create_data(pdev);
> > +     if (IS_ERR(pxpcs))
> > +             return PTR_ERR(pxpcs);
> > +
> > +     /*
> > +      * The XPCS may be attached to a power domain (e.g. PD_PIPE). The=
 domain
> > +      * must be powered on before any register access, otherwise the S=
oC will
> > +      * trigger a synchronous external abort (SError).
> > +      *
> > +      * Accessing the XPCS registers also requires a TX clock from the=
 SerDes,
> > +      * which is needed for the soft reset.
> > +      */
> > +     ret =3D xpcs_rk_serdes_phy_init(pxpcs);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D xpcs_rk_serdes_phy_poweron(pxpcs);
> > +     if (ret)
> > +             return ret;
> >
> There are 2 unusual things here.
>
> The first one is that you manage the serdes phy from the PCS driver, usua=
lly it's
> the MAC driver doing so. In stmmac, we have the serdes_poweron and serdes=
_poweroff
> callbacks to hook into for Serdes control.
>
> The second thing is that you're setting the serdes ON at probe time, ther=
e's no
> dynamic control of it. Usually we try to only power this on at admin-up t=
ime.
>
> Can you explain the rationale behind controlling the serdes here directly=
, and not
> from the MAC driver ? I don't see any mention of that in the commit log, =
and I'm not
> convinced this is the correct approach.
>
> Maxime

Hi Maxime,

Thanks for the review.

This is intentional. The SerDes is attached to the XPCS node because
on RK3568, a single SerDes serves all four XPCS MII ports in QSGMII
mode. If we managed it from dwmac-rk, we would need complex
refcounting across multiple MAC instances. Keeping it at the XPCS
level simplifies the design and prepares for future QSGMII support.

The probe-time power-on is a one-time initialization (mode selection),
not a runtime power toggle. The actual power is controlled by the
PD_PIPE domain via PM runtime. Also, phy_power_on() on this PHY is
effectively a no-op; only phy_init() is required.

I considered the stmmac serdes_poweron/serdes_poweroff callbacks, but
they do not handle shared SerDes well. I am happy to rework if the
community prefers otherwise, but this approach seems cleaner for
multi-port setups.

Thanks,
Coia

