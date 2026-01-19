Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D293CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kzaz1i9qc6G7xsP+1FC5njEiUedEPzYKnb9i6e2a56w=; b=cudRoRvB2Sl0OVLNYEW0cEk1mn
	O8r/aEbIFkwKqkRGDf3NI3wdVMpxpQb/JqsDz2ujrZA9nU99LENqpOXzRfv5Bh1hUff4GQmeZcQ0d
	o7Go7r3F5evKearBlaeubCcj7G/Q2zMOrgfGwtWMbYonpUt0EHFKXgmUiRZxdF03DDx7QO2oqeqBp
	TJ+kIFxfDbpEDCOAfu+MAaTQGNadsNkTdmJun7JAw9XwYVRVdS+iWEr36KlHaAug4erhffRdujUGp
	D1zCMs792TTyE7DkW2oHVX2GLc29z2PKtlCEy/dY+tZFv4K4+xnT/2t083TWXpNhFs2tw6RVGdxxi
	PjBCHuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnys-00000001wWB-3JpX;
	Mon, 19 Jan 2026 12:03:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnyo-00000001wUk-1Iqm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:03:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso28760665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768824212; x=1769429012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzaz1i9qc6G7xsP+1FC5njEiUedEPzYKnb9i6e2a56w=;
        b=aBRqLTj1x4oh7GdSPlj+Pjn95QLwuQcFGOm63JRcTiZsPWwBLPMNWk0vOQGa0vzDpX
         iybVmRyQeLx4LODkfGDhSRI2T//w+SUwvhUrmEnBbUQ+Rvxtm0EsDDBgjYtIZqqSnRYG
         Qc7on/44HUksR1tnvuJYf3VjAxlOZ3rZzG2RDW3GAZzqmP3VeXGPi4y3eExPk/9afa27
         94XcyPDg0e4S783aIc/ANuNgEaEmJerz7x9IQth8LjexGGfHTgfE0+MsSif5NzBqop1t
         24P0VB30Z9XHDIxArPbC2nTUFG0DzLTPDowIlnqyfwbfrVP9COkmZQfNmtVw3ZnCBWBl
         GezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824212; x=1769429012;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzaz1i9qc6G7xsP+1FC5njEiUedEPzYKnb9i6e2a56w=;
        b=PUL91sfxHa/ompziUSO6ZnIAn+X3gQT04DivSsu56iG5LQb4AgmPmxOVg60MT3XflO
         /1DVnbavSF3qI004y4OPEDoPcFK2M94wk+Irh7CtaJdZiPWQq7ebYlgpIwh4mCu47x8g
         UMizF6DqACvIb5dhkwdIvP4C/P+BUo3ULVNXirnqD9tYsoJPz9lUJTqr+apxLywvpD9y
         guOBeUqcslQpfLTw4hGZrabPVyLWcoFfwK0VhyN8E7FjiYlWoxk50YvnLyaNjAsVZqhm
         0M67AefHINsb/7L7QqxauCBOan/rerlT/1wXbAxNF17mJg4WlV5kQlNKjtZJrauhcwia
         wLlA==
X-Forwarded-Encrypted: i=1; AJvYcCWUpeerV3u68yoqAplNToKjvxJlGWCLLe6zKu+pkW+FuIHgW3aITqmw+TL4FJojxRBCvjN1WOhXB3a52RafbrDv@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLTzBHkvijgR7rvIgSB2Aky7q1oelLkIsflEO85GbzAuCLEBA
	WJV2LLTcWqEh/t+qGBgsLmS930z7tXHDCWWQ30/q2+k1BlrozBXwNOX5
X-Gm-Gg: AY/fxX6Xi+kRNe86EP6ZNTKuLl/H3VibM/Uwkdyy6Z77WvJSu6M7Jp1+o09dfpKKbXJ
	IAi6INhWGruzHiE6vAd0QtdcXdKBks49GKc9pHDMev5VlIPbxZ95op1aYX+QXfmjBY34uTZ1LZ8
	NymKumiKvKlOc7pH3Vh6WeV4YF6CWhdhKhz61gmkOnoss7a0P9TxHyGy0QUR1bcujjB/dxIA0lr
	y10xGOdkubkUwVdE3gKMVh+SOPkyrLBdFNSozVtoJRFJrMgV2IZII3aj05/fzxq6xojMtA19ptL
	sioijJceYZhk5tnML7eQZ527AdF3PYupctoWXhamuLnCkFeq9oErc7SdfyXPuyLqY+bMNKQGlaM
	P2FJO1poz3EsbQvdzbVOwFpw4JB5yL40lNM7Zq2tB32OC0VqwAeprpmBmzcuv/ruZgnXyUttcjg
	Y3fuk+8Djt8BT/9z16ThkiaRH5O4cZU1oYpdEetS0=
X-Received: by 2002:a05:600c:1f12:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4801e2fc37bmr117353555e9.3.1768824211594;
        Mon, 19 Jan 2026 04:03:31 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe3b01csm83250955e9.5.2026.01.19.04.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:03:31 -0800 (PST)
Message-ID: <696e1d93.050a0220.7cbaa.5b25@mx.google.com>
X-Google-Original-Message-ID: <aW4dkcDb8LikqH-y@Ansuel-XPS.>
Date: Mon, 19 Jan 2026 13:03:29 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
References: <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
 <aWgaHqXylN2eyS5R@lore-desk>
 <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
 <aWoAnwF4JhMshN1H@lore-desk>
 <aWvMhXIy5Qpniv39@lore-desk>
 <30f44777-776f-49b1-b2f5-e1918e8052fd@lunn.ch>
 <aW4QixwAJHaHWBBc@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW4QixwAJHaHWBBc@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040334_376737_1EA01268 
X-CRM114-Status: GOOD (  48.85  )
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

On Mon, Jan 19, 2026 at 12:07:55PM +0100, Lorenzo Bianconi wrote:
> > > Airoha folks reported the NPU hw can't provide the PCIe Vendor/Device ID info
> > > of the connected WiFi chip.
> > > I guess we have the following options here:
> > > - Rely on the firmware-name property as proposed in v1
> > > - Access the PCIe bus from the NPU driver during probe in order to enumerate
> > >   the PCIe devices and verify WiFi chip PCIe Vendor/Device ID
> > > - During mt76 probe trigger the NPU fw reload if required. This approach would
> > >   require adding a new callback in airoha_npu ops struct (please note I have
> > >   not tested this approach and I not sure this is really doable).
> > 
> > What i'm wondering about is if the PCIe slots are hard coded in the
> > firmware.  If somebody builds a board using different slots, they
> > would then have different firmware? Or if they used the same slots,
> > but swapped around the Ethernet and the WiFi, would it need different
> > firmware?
> 
> As pointed out by Benjamin, the NPU is a generic Risc-V cpu cluster and it is
> used to move packets from/to ethernet DMA rings to/from WiFi DMA rings without
> involving the host cpu (similar to what we have for MTK with WED module).
> I think the PCIe slot info is not necessary for the NPU to work since it is
> configured by ethernet (airoha-eth) and wireless drivers (mt76) with DMA ring
> addresses to use via the airoha npu ops APIs, NPU just moves data between the
> DMA rings according to my understanding.
> 
> > 
> > So is the firmware name a property of the board?
> 
> We need to run different binaries on the NPU based on the MT76 WiFi chip
> available on the board since the MT76 DMA rings layout changes between MT76 SoC
> revisions (e.g. Egle MT7996 vs Kite MT7992). In this sense, I agree, the
> firmware name is a board property.
> 
> > 
> > If the PCIe slots are actually hard coded in the NPU silicon, cannot
> > be changed, then we might have a different solution, the firmware name
> > might be placed into a .dtsi file, or even hard coded in the driver?
> 
> IIUC what you mean here, it seems the solution I proposed in v1 (using
> firmware-name property), right?
> In this case we can't hard code the firmware name in the NPU driver since
> we can't understand the MT76 WiFi chip revision running on the board at
> the moment (MT76 would need to provide this info during MT76 probe,
> please take a look to the option 3 in my previous email).
> 
> > 
> > > What do you think? Which one do you prefer?
> > 
> > I prefer to try to extract more information for the Airoha folks. What
> > actually defines the firmware? Does the slots used matter? Does it
> > matter what device goes in what slots? Is it all hard coded in
> > silicon? Is there only one true hardware design and if you do anything
> > else your board design is FUBAR, never to be supported?
> 
> I think the firmware is defined by the board hw configuration (e.g. MT76
> SoC revision) and not by the specific PCIe slot used.
> I do not think we have these info hardcoded in the silicon since NPU is a
> generic RiscV cpu (this has been confirmed by airoha folks).
> 

Just to make sure everything is clear and talking on this in very
simple words, there isn't anything ""hardcoded"" or strange.

For """""""reasons""""""" (I assume space constraints or NPU CPU
limitation) it's not possible to have a single NPU firmware to support
both WiFi card.

The NPU do simple task like configuring WED registers and handling DMA
descriptor/some WiFi offload. Such configuration is specific to the WiFi
card and it's not the same between MT7996 and MT7992.

This is why specific firmware is needed. The specific NPU firmware have
support for only ONE of the 2 WiFi card and doesn't support configuring
and handling stuff for the other. (the code is not built in the
firmware)

From the kernel side (in the MT76 code) we just instruct the NPU to
start offloading stuff (if present) and all the SoC feature for WiFi
offload are used. (WED, special DMA path, ...)

The possible combination that NPU can be used currently are the
following:
- Ethernet offload (all NPU firmware)
- Ethernet offload + WiFi MT7996 (NPU firmware with MT7996 support)
- Ethernet offload + WiFi MT7992 (NPU firmware with MT7992 support)

The NPU makes use of feature already present in the SoC and makes use of
reserved space in RAM for DMA handling so it really don't care of where
the WiFi card is present (this is what I mean with nothing is hardcoded)

I hope we are not getting annoying with insisting on the firmware-names
solution.

My personal taste on this is that hardcoding the name in the driver
seems a bit wrong and creating a way to dynamically select the firmware
based on what is present in the hardware would be great but would
introduce LOTS of COMPLEXITY for WiFi router that ship with a single
WiFi card and would have their own dedicated .dts

To make this generic enough an idea might be to have simple .dtsi with
prefilled firmware names.

- en7581-npu-mt7992.dtsi
- en7581-npu-mt7996.dtsi

But they would only contain a single node with a single string.

Hope this more practical explaination clears any doubt of the
implementation.

-- 
	Ansuel

