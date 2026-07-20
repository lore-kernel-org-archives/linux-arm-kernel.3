Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF6C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=; b=XCMBnLW0kFA35xT2cmZ1nu9YGW
	DEfhbmi4/SxpPWhKTSM8S2e5Wk51Y53irH22L7rzWgOOHw5Mn1M+9WMbyCJAwYREg+GUb6c8ON9K6
	rKDCYgCHBUUvHk+8mWV7teaxQF2/J59qU7XiAqqhcnT6hS9MvY/tACXHMabuKUzpx/zOUxipyF2DF
	9a24RTmfjzObx30oqmjYbCJ0dDv35onYQBma7yuUmBW1raOrLF2SCRp5+NVoMVTFxE8/pI9IKOiRa
	oMOUUUnro8hjli5LV1OmODbFRmtdVwzbg0q/5kPwPaqPnSk+jMcWeH895uguGvWkUofQ7Su1TJf/F
	Lt2kl3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlquc-00000007OJN-3kFq;
	Mon, 20 Jul 2026 16:32:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqua-00000007OHD-2w89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:32:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so4948838f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784565128; cv=none;
        d=google.com; s=arc-20260327;
        b=CqQ9e8We0pTRnhWDArJ1ezCTmIPmhSSPRjtKmAiHwi1emnuAB3QjFcKOdCyVlPxXRv
         VGvioxwp/pqzbwgTejBur2mvQwM7fgFBddUUmdJ2nbqzZ3vOK3AWTN2Z861W8uRk4P2f
         ii8tvm206lsnklqU+3tPPECEfin9ECJPC+e1Y20vuoNMroqzD+jX76VNCvWID8yflK4L
         rn+Gs1RRZZ3hqhfr1gdx0R1zd9SQY182rKD9MmeSEp+8PxRty+ZT2dXi0xRbXCnLtYeo
         gEzvAHg3zCuBg40uWFqvBSaQer3I+G8uwcm+6gX0WFBOW51oE4oi27g/ZTMCU+KBWY8A
         7zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        fh=ExJZ+M63IZUNNurleC0nKVRDr83jsMJiR5efIE4gvZw=;
        b=UflASmjrZ4Bpx6wgNV9/gqKmQgWOCrXdXNSSUlwPFwMAphhDG4JuWoWDwmhlhW67y4
         ltz5C0Cyw9apGdmao8fZT3PrBrif06q0j886Lz5UM0boGx5qPksbZ1s5raHvLCBN5ySH
         gFudpGgsGVwGB3Lv+HbV2D/PFxXZT1BbTTry2FXb8piIu9IBDoo9PhHoMNsx/JjE0PmQ
         uo5JE81wISCayLZErwTnWhOimYYu9Be9J8ov9Nde5vGnABUjjlA6M05qE51Rf6jsiGk/
         gq4aAmiqbhbNGxXIaw1bZUGp1Sdb953UsTK057H4PFYnQPxdcZ9nJyfC0oIEoAcpB0aO
         IeQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784565128; x=1785169928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        b=CKyJkEKjWFZ9gLvJGVEIN/p8a28Tj9IU19ehRS9GHsIUfw4Yx7qw3aIPg2XFb+w/mm
         bXCxV9td3zSi3IuPkJA+9YGZgn1kwpgat6C0Jjm8fcZDsUuLAVVVkjxU4DdlUyCRj1A5
         xrxWASEtd314gCLrY9qY6RqvxviOL64WxGlNAH9wnVDhYbbosNhcPnPOJQyhxoURr2OZ
         FUMAOIbntbxfk520ZM4DIBUiIUYW3LgjvLlDyg6FcTX9B2erhtTGIFiwM9H5QNh7ptoS
         rIaMv6Okg87oEvu7b402iq90Cjf3xPwr3acqWFODIZSl+tywnEPcdh+Ix8vLiQ/bpgkO
         RFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565128; x=1785169928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        b=mJ2mP7BXhfMfMEtUZSEZEhOZMf/C/han9pcrtS8+LWzzouq3UzxsJTXuUjWK0ySrCy
         8hgdzT1OxzlpfbFPOx/r6lLUxc/aJ/0KBKMUY2rgsS83WBGPDbjntz4zzRpoXVI5JuOE
         fd6mH0ez/dbMINoxJLtq2MgDPp3qg9nYDcW23w0z/JIxxo+gVtX6dJsc2j3EakXxCoHD
         R/15f737uTyKvSYQP1L1RG5mzPfWYOYeZMHNqpldMDrsK670CV33nPBPVh+YqlHtn1tV
         cAGj5uDanetROJf1skFtcMLwpOAaoExeI4NhX9M/GAtNsLtMJlto77xE5vaI+5g3MT8o
         ZTBA==
X-Forwarded-Encrypted: i=1; AHgh+RpyMZe6CHdnHb3OCg93FwhrMhoDr/TB5Rd03XOvquKtDH/aD0EK4S/ck6NYiZq0c+BT7981jgrZfz+03IrYj0Vm@lists.infradead.org
X-Gm-Message-State: AOJu0YzQId0KsyceWqVGjv65zyuZ5SQFxbDLJgD2B9+gxEyaRCE3lIws
	XNhLKdeAwZvglOdeVP9X5HCV9dX/zp5ES2WCMqxGtzQRebU1V3OrewPT9ZATiKuXFvI2tDvRPxR
	soP0ctuYQGR0CeVinOebS261lqybcXrE+9yIwfIHsmA==
X-Gm-Gg: AR+sD126waz4XgOvH9FdS4Pua5kbqSe9v09g5TQNx+CNpFgfpq1sXC9oBB58w8ciTmX
	NC1g8g5H3GyeQUQEXTUV28mnNCaB2Arq4x5+qOtiPrgTdODfWK0SRucfDTaWbUlWv600w/2u5G1
	FNLPp70k71dLzWNsECos0QZMrCqZU5HZeSDvAWTNKTnk4hhRGdreShdumJQQmG1OwKnXb52J78C
	X4DSd5Ofh6Qu6ergDkXhNWspY8w10yX1RsESZFuf/9H5sMue1vICN8U7CBnzvLzP1RJ4FFO+gck
	uqFLQB1XUkT0P+ra8xz07XVlCpKAZXWq5Pk9aQ/k/PKQyIw=
X-Received: by 2002:a5d:584e:0:b0:47f:2bfd:853b with SMTP id
 ffacd0b85a97d-47f6231c4c7mr17158959f8f.29.1784565128076; Mon, 20 Jul 2026
 09:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
 <178412588365.243141.16731478852761544781.b4-review@b4>
In-Reply-To: <178412588365.243141.16731478852761544781.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Mon, 20 Jul 2026 18:31:57 +0200
X-Gm-Features: AUfX_mxLyiPGavSOWwXUG9eFwaMXBwlJv0WvqzHEORsF3kP_VRFIWjF3Kd9aWWM
Message-ID: <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_093212_855520_2F0A082F 
X-CRM114-Status: GOOD (  15.98  )
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

> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dt=
s/aspeed/aspeed-g6.dtsi
> > index 56bb3b0444f7..ac351f01048f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > @@ -658,6 +658,21 @@ ibt: ibt@140 {
> >                               };
> >                       };
> >
> > +                     pcie_lpc: pcie-lpc@1e789800 {
>
> lpc@1e789000 already maps 0x1e789000-0x1e78a000 and 0x1e789914 falls insi=
de it,

I agree that there is an overlap in address space in my patch.
I will fix this in a new revision.

> so you're describing a second `ast2600-lpc-v2` node which is unnecessary.
>
> Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. That=
 way
> you don't accidentally cause an overlap for the devices if you describe m=
ore in
> the future.

The 'kcs_bmc_aspeed' driver has the kcs channels address hard-coded.
If the 'reg' property does not contain the three addresses used by one
of the four channels, the driver returns -EINVAL.
So having a pcie-kcs4 with regs 0x914, 0x918 and 0x91c doesn't work.

This is why a second LPC node was added, for the pcie-kcs4 to have
regs 0x114, 0x118 and 0x11c;

I know we should write device tree sources based on hardware rather
than around driver limitations.
Changing how the driver behaves seems excessive for supporting KCS over PCI=
e.
I think a point can be made that the LPC over PCIe is a different LPC bus.

Regards,
Gr=C3=A9goire

