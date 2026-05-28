Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD2CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=; b=foIKqnrNeLFS6t2lTfySQRBY/F
	PlSeYAMTsR1OckzcxoQV3DhDeJyHvIx/yjlvmkRQUNfxnWFRRO7CmzNyuGb3mkqgC5r/PXNh6WDOx
	DAf0Zo6qMP6LQp0uoGQESpdAiK4WXzT+WpsTfTv0ZbrFXT483XndNyMgZyX+bCsKr0uH7Af1HsJHm
	/vSiao+hNDrEl/640l/DaTM2LNaYeXyjzCCD83wHex5A57wQ+VulwR2IwRc/D7MLJSR67Z0mr7aNh
	+LFYMCPUrA84eE3Q2F1w8MEW8lMPD+1nORDeeB46r88hnyCy69a3ISUY1YziH/sSIwDo3B4/DtvgV
	f1460i3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWHg-00000005PkB-1qpr;
	Thu, 28 May 2026 08:40:08 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWHd-00000005PjK-3TyE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:40:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a4113ab355so7623603e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957604; cv=none;
        d=google.com; s=arc-20240605;
        b=CZaq3QKntihfG+wsEkWgN5ePe/gi8tCsdc3VDE0yRvQx5sQh/pEF8FMxrRFQAyzlDj
         CAbYIn9ETfA5gclVKaIJMYIsClaxTRnEN10goNPMcFT8pOsm3GQRhufYBno5HCC8uUqA
         uc5upJKtX8Q5tPoO6NYlBcbzDuDSuPJlWDSQ+OI9n94wcjg2hFdJcflS3If+zVFcx2Xd
         P1z+Ab5wCdYhbEnDJJ6XFip7SgJ+l/cOuXsQOYnMyLXKK2/A5f3+00CEZPSt2UeNuLtw
         RWUrbOHkq21fl5j5BLJwGSPhTTOJ+DZLiQ+U1cxH0ncwTHH8AIXN79iJaIiYCrBCblEw
         QTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        fh=G4YKUhr6Ef02xsRVtbJLFNTzuz0WoNo0efSJ2gUMbwI=;
        b=br4+ZLKeEJvF7sicUrdPUytktBM39Atwjl2SZOcEkeaf7sVLKAlgQAnwG2flZ0dCnM
         eHBcz1WrBrrjXyBSs/OlEvmfm+OjvRO7Crr8f9/baMFRz2AdTxQBCBdHq2kGAUJStPpS
         g8qAXD10i4dEVzsM11AToG3yfjrSRZM1VDhAM6pAZS0xbZmWsg/Jj9X0wZ5J4Kd1k2m5
         jRflEiurdTqTTTK7aETXsSOr0SCYVT9Mt3C4K+HQbM/gq/vE45E2txidsJ+/qcs7uA73
         rzSQZn4fOio5hXqpBUe3YAyHib9o8DPRHtcxpDs+LQcOo7CISkIi+1Dl3e76Gn5WmcCF
         Fqsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779957604; x=1780562404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=eIx3J1iUcJeitFyUDrUzqgFxwmmV6OwANs612+LyQzN03eyKP215Ye1JoP1JWXfChJ
         xeMevVR8NPvxzyH2ykjv3ZFbDh8mNhIkn0Lo9ct+WwpJb7Q4n05HoZW3oqqN006VlUYC
         TyHbnnyG+hAaHRASwLqozbBtDJVfJbdWQmy+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957604; x=1780562404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=QzY8bgpGuFzLUlwNPmcTfK4OIAoar2w+rzyNj1dtBjx02MLPv0i8mBA8f9le2e3Bk+
         /NVNLtBp984rH9gT/7oeQP/NaiaAqm1IUZOnQjdoNUzyVn/pjo6PeiYs0Mh9M42u776O
         WqoelkjLT6Qd69E07o9vmmR8u62LtnXKBDq3ZBZ3BRzeG8h5L8O3TMsczBL3z/+XUIa8
         onXlen0p5mYVsK7uP8p/BByMM78j+sTjl42cbneZYS4/r8Mfpu1jKwqaZL2ThhexDZLy
         +TYphVCUMZ1HRwJW+KoxD83f0ixatETbXYXybJMe5cjJDKNfKvo7pKS2py/mwhLjLY5J
         fNyA==
X-Forwarded-Encrypted: i=1; AFNElJ9ootOmkITrNgDfe6ZjFVuiOEjogLL9jkByQ8XTklSH7BpfCLgCFuoCzCma7W8FrzyKAVzUcqIceZLMS0EBMn4d@lists.infradead.org
X-Gm-Message-State: AOJu0YxlzIFy1fFOwSoDD18Hti6ioYhzDC8H+VJllIaAPfn+oaaN4DP5
	17d+XKQ0B8f9HBKAzCA2bfK2HGrc9mIbqcqwDuYs+Qb3cR9U7Gc7qbtqqpd4CbgGlnibFXcojgw
	tKi2kYCnxlUfXNlWRVTYIQR32leCAIKpEzgu5AvfJ
X-Gm-Gg: Acq92OH1KhAqQmlssp9JSefA3ERvC3ZQWMV+m46glc7xYJq6MZ2+iZDGMTW8EBA3qLi
	5biw9tVh6rrPlNwhe1A8eF1AVL2tIV4KTH1x+hjPIgojNqE5yzjwcQEkpyBLX77W0XibAtL7CIX
	u/6knu+590iZICqOzQyNdyMuZU90C84keiNkh/pCmAkNE80YggBc7ECfegaeT3S/ouJolp0EziL
	hpEDdZjIbtCXiI4ThF5jkcXRZazXUoLIa5RtytrSUu0hF/jjERKBNOV1458UtcV9gbuDgvdWyGc
	hhVchHPulpPXJehGY/hZh/HT1lTJ
X-Received: by 2002:a05:6512:3ca9:b0:5a8:afc8:c37 with SMTP id
 2adb3069b0e04-5aa32369fccmr7817435e87.4.1779957603539; Thu, 28 May 2026
 01:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
 <2026052710-flagship-unsmooth-ce82@gregkh> <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
In-Reply-To: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 May 2026 10:39:52 +0200
X-Gm-Features: AVHnY4ImlKiDtiu3PtJAJE_NOkB4Apdo_R0OjsOkU3xKzZOWZm2qt_u0g9B3V2M
Message-ID: <CAGXv+5HKxhfZuAHTZECsVFp4S9yTN2rXW_Nps2TcoV=r9KgfEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_014005_935374_038A69C8 
X-CRM114-Status: GOOD (  33.10  )
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

On Thu, May 28, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> said:
> > On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
>
> ...
>
> >>
> >> However this seems to completely decouple the power sequencing from th=
e
> >> USB core. Take the USB A connector for example, it was recently added =
to
> >> the onboard USB devices driver. However the connector has a device nod=
e
> >> that is not a child node of any USB host controller or hub; it is conn=
ected
> >> through OF graph. At the same time, since it typically sits at the top
> >> level of the device tree, a platform device is directly created and th=
e
> >> driver subsequently binds to that device. This is totally different fr=
om
> >> how the hub and other directly connected onboard USB devices work. In
> >> the onboard device case, the device node is a child node of the USB hu=
b
> >> or controller, and the corresponding platform device only gets created
> >> when the USB hub driver probes, thereby sort of tying it into the USB
> >> device topology.
> >
> > Hm, did we mess this up?  If so, we can always change it if you think
> > this should be done differently.
> >
> > Hubs should be dealing with the power issues for their ports, so maybe
> > rethinking this might be wise.  I'm just loath to add hardware-specific
> > hacks to the hub common code for obvious reasons.  Anything we can do t=
o
> > pull it out to a separate driver is best so it doesn't affect the 99% o=
f
> > the users that don't have that crazy hardware :)
> >
>
> IIUC what we discussed with Chen-Yu yesterday, the only thing that needs =
to be
> done in the USB hub driver is attaching the port firmware nodes (if prese=
nt) to
> the port devices we instantiate. The rest can be handled elsewhere.
>
> Chen-Yu: correct me if I'm wrong.

The above, plus adding pwrseq_get(), pwrseq_power_on(), pwrseq_power_off()
calls to the appropriate places in the hub driver.


ChenYu

