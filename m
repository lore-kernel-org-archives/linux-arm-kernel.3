Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1157FCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amIVj6Ks/T19JV0gGyF2jbDkQIb/QLUq7CyFhU9t8+g=; b=wm/r14KIRTDPcMdJaOQc2cbouR
	Vf1xJC0UR23bZLOBywp8G94pCEcwGH9984SSnVKNwWgyQ56ZjofzneqNfVKnRwEaRUSi8FLPlpuuj
	V8M8U/xIwwY2TYKUV6MAUZw7F2z9M6LI8ejbXNMQK4x04sOU8wWZyxTKGNh8tiWguK+DvY2NTktyI
	DND1GojLy8fp2eC28Z7b74ihMs4wJpo601gqr1YE+AVFReq3fdHKZlu34WLnPDF/zmh3U5nIuYzBT
	P/0OVdxvRHd3q1idWVRhtaN1/DPQuT+C0p1WRbdeHGQUYT4e26QKP7XvBW7G8spcAUeGG6TYcR2Lg
	JktGngsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVsa-0000000G4Js-3Gmy;
	Thu, 27 Nov 2025 06:53:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVsY-0000000G4J8-0Jjq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:53:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so848301a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 22:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764226400; x=1764831200; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amIVj6Ks/T19JV0gGyF2jbDkQIb/QLUq7CyFhU9t8+g=;
        b=Lu89Vj8y4GPgb1Z2kC/YQJgTu3YEQ5VGn9Mb5DkRkT7pv4aWJ/ORm0wUfAbIqMOUkb
         hA3eQKCwEWZnY6amR+bxwKZhC2ei+mr2Wx5FrLFWUNCJFjGiA4tPxicWgy5bjISpF6Sg
         vdqc2HtM8YkiOHXoZfWEam86on4mBjP0rwWmZdM/OwDSHoHg6Bfc20tJoC7WGJJ7wq5L
         jZsXJY4SO7VbxKjmahuTe+BPofJw//ScheNAUpxsoDGuELkMD2mXTTHKeSXiZuPTxOTy
         2UZlfhhgOANZnVhHqJOyC4QRAX/3O7tr4P6xAIyqx3CYm3j2m0JZpdIKSYwbhTLEpLGj
         dI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226400; x=1764831200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amIVj6Ks/T19JV0gGyF2jbDkQIb/QLUq7CyFhU9t8+g=;
        b=F6lMyw9jzEuoaWmg1M1b5qVzgAZHBBJO55r/pfSD/lFTwdltbTiMHz0S4KiXa8rhzY
         jeO5/szSPPoBi9nj/pPOSqdIwWH74TDbnqmBEpX6p77wnE9G9btcJv46LtN8/5asH9le
         ahaSPyycdF/uLLw5RP06DCkVrupnpsOANosNgPntoYLlX9u/xCmn5gIhCb7ULg76ugOI
         3swmbGOvgMyw+FvpmNlAPRDOmjRoHM9ig4wzKSAMhLijEDABETSFjPHl7oyYeasjdNQD
         IwWGz5YcZblpYqGmyhPvneU5Ksye3zLzQqvg40iu2tHtVN5WR7dVmT05AFHASosh1pV2
         ggMg==
X-Forwarded-Encrypted: i=1; AJvYcCVZCUsUmS4k5y7P4E68/68TspLH+6gmh34ZKHdWc6JZWqRnmYg8bOTT8SJb0lpXpDtJBcf5i7zXkda7Rzq9vSif@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+SEJKYyKtDht4OLcze15W+9dr+yvwj7HPLuvRuFT+HS+02GI3
	TWC+v7Kli7LJyY9bBYaiNSMiffCo439saiXaBwlCe9w1DXYXp4Qr4LDAsZ8WcNjCxR58JS+HTUR
	kyJ3tL1MmP1YUzlX8NiGf9jit2irEeaaEYQukbrvjVg==
X-Gm-Gg: ASbGncutQG/pT6aO6oz3YJ9Yy+i8YbpeY5kzXD23FoYjnpG0y+bpS0X0grWVaS6sSKL
	R+MHoq55bKyal9xmioMv2ZnWlzwugLjXpMV8gPv8XYioA0hKWIvqKk3zAZ29u3Y89ZeR96ArRVm
	XEt/sEB5LyJ4KrtIuAFe7jpQPcI4JIHrecEhfWP1j7/xe5oib1pTUR8h5jT8gABvEnpq7tJ1xop
	eKBR7v7OEKmrCHtbBQ1ZtZj7AoG3rsgRI+hXNA2hpFNgJjPQ6Z9hWecL9znZuqh9lCnFSxmFmnq
	OeNFv0MBaTtSy0ARSzIjIPPMo4r36HuBAJQ=
X-Google-Smtp-Source: AGHT+IFLIn/EUIu7OxWHRGKTwIMu44EVUbsDDWFBWHXN/a3JCflama3pukcsqP1OVrFxH+zuhs1CaG1bDZ8ufGMAHn4=
X-Received: by 2002:a05:6402:51c7:b0:643:c8b:8d30 with SMTP id
 4fb4d7f45d1cf-645546a3a94mr21339934a12.30.1764226398995; Wed, 26 Nov 2025
 22:53:18 -0800 (PST)
MIME-Version: 1.0
References: <f8170513-e08a-46ff-9fb2-310f3e9c1ba4@oss.nxp.com> <20251126220441.GA2853437@bhelgaas>
In-Reply-To: <20251126220441.GA2853437@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 27 Nov 2025 07:53:07 +0100
X-Gm-Features: AWmQ_bn9e_5hK3VL0q5IanUqFHYeiwridGkV71hmaSPq62Kxvcuwrn80xW_IyF0
Message-ID: <CAKfTPtD3EsD6yPfnE2nbnyuSfFeOEGyLm5jTQaEZP6Ro85e4JQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, chester62515@gmail.com, 
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_225322_142198_4D83883C 
X-CRM114-Status: GOOD (  19.93  )
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

Hi Bjorn,

On Wed, 26 Nov 2025 at 23:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Nov 26, 2025 at 03:47:46PM -0600, Ciprian Marian Costea wrote:
> > On 11/26/2025 3:41 PM, Bjorn Helgaas wrote:
> > > [+cc Ciprian @oss.nxp.com, see email addr question below]
> > >
> > > On Fri, Nov 21, 2025 at 05:49:20PM +0100, Vincent Guittot wrote:
> > > > Add a new entry for S32G PCIe driver.
> > > >
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >   MAINTAINERS | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e64b94e6b5a9..bec5d5792a5f 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -3137,6 +3137,15 @@ F: arch/arm64/boot/dts/freescale/s32g*.dts*
> > > >   F:      drivers/pinctrl/nxp/
> > > >   F:      drivers/rtc/rtc-s32g.c
> > > > +ARM/NXP S32G PCIE CONTROLLER DRIVER
> > > > +M:       Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> > >
> > > I'd be happy to change to
> > > Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > per https://lore.kernel.org/r/f38396c7-0605-4876-9ea6-0a179d6577c7@oss.nxp.com
> > >
> > > I notice that most nxp.com addresses in MAINTAINERS use "@nxp.com"
> > > addresses, not "@oss.nxp.com".
> > >
> > > Let me know your preference.
> > >
> > > Bjorn
> >
> > Hello Bjorn,
> >
> > I prefer "@oss.nxp.com".
>
> Done, thanks!

Thanks

>
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=c7533471578e

