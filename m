Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E42CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXFnmmWcp+T86M4X7Xk/v6jPWKY4nv9UjyUBijcqLEQ=; b=PdqU5T+xGRaFaPWCernpizPABm
	lE/gnpSU+gFL5+3iwAxbnsU+W60q9VGP/A1UoluvAwoYTNLRgD1CZAdJn8C1mFkvwNs4liT6EUYIi
	WLborR186udWu+/QaObU47qxDgPkSGClkrY+BpITlGFM0ixtIvgWhs+NM+wNQNXsSkFLWdcTSAKr8
	nM1u4amb/+XJ0k+aabppCp5kX6AWU2ZbciLqMuNDRGNyubh8X8zKJosFl2lzwi5hR+neamRTps0YA
	++FMY9X5hItUwr0VRC9ACq42PqpcZWe9MxGAJjuFBtU8DZl73Z0NMXv0AR9DTH0czDHL7XZzw+eNF
	GLemHkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINzN-000000054O3-4523;
	Mon, 10 Nov 2025 09:15:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINzK-000000054Ml-1tLw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:15:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so5004773a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762766100; x=1763370900; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NXFnmmWcp+T86M4X7Xk/v6jPWKY4nv9UjyUBijcqLEQ=;
        b=d+Ad8cy9YlPZF2JyyPxDUqKEwpUrSIRta857d1X+qz1gs3tcXDQCFw0CBhJUpmSs/H
         tmssijk4dWc9S0l8hVOKTX2f+VO2J2xmx5yj95RmyaRlXwYjDrcSt0zSxUnjmmd5StvK
         SrYu904TgvzmBujrvlfkJiHN8hb3GoA0q3dSmzbG11PM3syyMlyZyAip/pb3v0qHpMjl
         z8hyE4yymsOqxR7Cc/CFzSnOYrq87HPuQv5ZQ+Iaussi40llSWBQF2ZTQBCedh/O5PAm
         BdMgsbbBHhx2Dxhw5zyYUKwyLN4midaqWlomlDb42nxuKJQU2j+5XdtLp5aPIsb6ckIQ
         0e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766100; x=1763370900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXFnmmWcp+T86M4X7Xk/v6jPWKY4nv9UjyUBijcqLEQ=;
        b=AyiluQbjMln05MaQr/uODiVkjhQEVUDpAPmdPtZfqTSaK4Z/qhYmcd8mdMrk3rrYmI
         q/H3vTpm2rksj9FLWDgqXAWjaARIRnmKLVlnoN+7YXgUkyDI6fZb2Kfa0d2J2tKqkhja
         PryG1MdnPz6RTffC3NYQ9kHrmNTK1iql59qzrzgo3WmYFTWjxszT/XiVJbj270bEFTG4
         nPrGMgsivZiIDnwubZRswLjv8uZ7S2vDpFv6Qf2wTjqtZ7UsxOQtG73UfJBLmYqM2RwZ
         fFYN8dl5DoUjPNf3A4uXWtayjbegF4z/V4MRim+HAzct+7NeTHBS5mYPwc1K6WkhqAaT
         nrNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDZPFDsYpw3WhnWSlFCsa50P6qtNFYLbYIWarrZ0aSjLcwBSx68puqkBmFz+68izafoHE4iXsvOEi93KmKn91e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1NYfnZzcwS7KCIv5NxpdT02BBCeo5r0yLKg+sM7GzzhBsVF95
	ddVWycbF4lNA+q62iecNRbLacsrDj6PjNExG2tUpS8/CY4lwceyvuOUkcwolUZ8FQCzy0+ofj6B
	nIamNwkvrUBCbiKhw/UHfdHGEWdiuPMnLgiPL/ASskw==
X-Gm-Gg: ASbGnct7JvUFHU2+Lz2graTTGXo182JdMhAFHRsGzO/jbjwlW+4jtQVAxMLZvg3cog7
	cj/IJDLJV11TajhrF14LZuVc+/ihtTaBxFZxoaliPogKXFtybub8gfzocPQ9xL/MTmSRD6/o+LW
	fm/MdeF8XAiILJjnoRpYbP3KZ13VfJdGZIdoW5hm4//nLOBc8UCWAfMZQwGNn5135sHePJToJwb
	ui5I0Y1MtcuGpUE5De1ez6YPpTuim38oq1qgzZi+d8psUIRGLodAuoFs4RzNGuR1ggSWyplnle1
	D3sAWzwfP9nbdB1Wbi7wOLW+fp9FLBQmXQo=
X-Google-Smtp-Source: AGHT+IG5jsntiKbL9XDoTScxbX6sK0/o8ty8iuXm+qmOqxUowPC2iS+ovEiKsBoSdXQkOeKy6r5NlaZELkfmqB0OJxc=
X-Received: by 2002:a05:6402:26d0:b0:640:cd2a:3cc1 with SMTP id
 4fb4d7f45d1cf-6415db564bbmr5934589a12.0.1762766100006; Mon, 10 Nov 2025
 01:15:00 -0800 (PST)
MIME-Version: 1.0
References: <CAKfTPtC87w7RVSDAXWXRX1sjgo4s=_Z_k62+mfTXrMZwmkEpFg@mail.gmail.com>
 <20251106173853.GA1959661@bhelgaas>
In-Reply-To: <20251106173853.GA1959661@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 10 Nov 2025 10:14:48 +0100
X-Gm-Features: AWmQ_bmdJnu871GRec3avwkB2KMRGJUSatF4zpeqoF6tG3-YU67MrrGvp-or-eI
Message-ID: <CAKfTPtD3UUXq=PwBJKx2q5VEBbAie-M1XgTbx3hmxZV1yQGBww@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org, Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_011502_538189_1FB89E50 
X-CRM114-Status: GOOD (  29.14  )
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

On Thu, 6 Nov 2025 at 18:38, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Senchuan]
>
> On Thu, Nov 06, 2025 at 09:09:01AM +0100, Vincent Guittot wrote:
> > On Thu, 6 Nov 2025 at 08:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > > > Describe the PCIe host controller available on the S32G platforms.
>
> > > > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > >
> > > PHY is a Root Port specific resource, not Root Complex. So it
> > > should be moved to the Root Port node and the controller driver
> > > should parse the Root Port node and control PHY. Most of the
> > > existing platforms still specify PHY and other Root Port
> > > properties in controller node, but they are wrong.
> >
> > Yeah, we had similar discussion on v1 and as designware core code
> > doesn't support it, the goal was to follow other implementations
> > until designware core is able to parse root port nodes.  I can add a
> > root port node for the phy and parse it in s32 probe function but
> > then If I need to restrict the number of lane to 1 instead of the
> > default 2 with num-lanes then I have to put it the controller node
> > otherwise designware core node will not get it.
>
> I think it's better to put the PHY info, including num-lanes, in Root
> Port DT nodes now even thought the DWC core doesn't explicitly support
> that yet because it's much easier to change the DWC core and the
> driver code than it is to change the DT structure.
>
> That will mean a little extra code in the s32g driver now, but we will
> be able to remove that eventually.  If we leave the PHY in the DT
> controller node, we may eventually end up having to support two s32g
> DT structures: the single RP style with PHY in the controller, and a
> multiple RP style with PHY in the RP.
>
> We'll likely have both structures for many existing drivers, but I
> think it will be simpler if new drivers can avoid the old one.

Okay, i will add a RP node

>
> The eic7700 driver is an example of num-lanes support in the driver:
> https://lore.kernel.org/linux-pci/20251030083143.1341-1-zhangsenchuan@eswincomputing.com/
>
> Bjorn

