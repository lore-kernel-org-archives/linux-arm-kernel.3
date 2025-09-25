Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB011CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlO5HN86Kc6YrRTCW9kNidWKyaECOConDbUQtE/vSBs=; b=cXmt6JUavP2vxA
	CNfxDj1AXjxBtstZ5yGi+CfCPOGnZFV5lBdgBCkHGHGhErZAg5IZA6kDj9TtqIGNCyxUWFmkrkkOY
	xdce2bzlgjkBX8KdnSRY9ptiQvUONiABGOXcpChE1y0KxWNins1sgkFtlWRj3682xphVNsHcWcLM8
	9b2q35uM/fZPnLX7wSc5gI66iSYT++J2DzSiddDhEcE/piulQwtiCET2Yi0atFnABD3XPkELKdiK9
	FLceGz6ds3CxuPEgs+ey7rncRqMKzeU4Ymqozae3LPrl2r618Gr2wTpoV4kr4Dkwh0DuZM4tpMvBu
	qDUmNLjYUynDkA5jFeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nLH-0000000AHnC-00Pc;
	Thu, 25 Sep 2025 14:53:07 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nLF-0000000AHlC-0CFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:53:06 +0000
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3635bd94dadso9818991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758811979; x=1759416779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlO5HN86Kc6YrRTCW9kNidWKyaECOConDbUQtE/vSBs=;
        b=rFd77Bctj4u7ZjVzI3DyME/NLqC4S1gU3P6XSoavDhWOT7cHnxmL0nR7yNoyU9BS4X
         kUNpa7KpIlWjqsgJ/y7TdgPe4PEqBBeVfOzuj8spkhhkPNIaA6sayFQxycBICedw2Ry+
         4iwhVdjYaRsmjRfLAb+BleNRJrqTaGV1+h0xISQ/IogirVd8dzNvQDES34CcYyDwQ7nl
         Z4fjQjBFSMqY8HiF4keK+eQ910TJOv2ISNYCXggq4FCJUe0OIURcmUrpz2KxBHsFoV7P
         eYM/kH0bDZ8qzig0MliJcZh+Wn7YcGvSkgZZM+KXdyud/2jk/eG9TO5UIockfzQMDlVM
         OgVw==
X-Forwarded-Encrypted: i=1; AJvYcCWSUh1GrHJRODoOkYK/4EablUSJcAMvPr6OLDiTk5qHb9DUOk0QZdvn7sqvkaKVHPG6xV2WgksfgvEc+9nk1Nbf@lists.infradead.org
X-Gm-Message-State: AOJu0YzzL8UbWEVsidfPgMea/W67Pca+iLKVhMMUNBy+DlGJtOMirvJp
	DD47y0fcujrd6pQmaJCtjqLI1jou2wltuPt+dW4yXkn8Oy+z2Xr0aVs1otukDbb/
X-Gm-Gg: ASbGncuriS2RwdW4bbtEk1COY+/JsivdvUylTegQdMgQHiism34+8DlAd5kVkEaAt2j
	w5djjMRCmgDBVMlnPubkOm4yJsnD0quX3AXu5nTx+UMwJreWdx432uhrC56mKilTke2RY8a6mzQ
	0Y1sG12Fbk/FWAteVxzMKPA27TgqDEhhlgFDscOEg+9yU5rZZ8u93+eSzKmmVFYObINNLKhqRj9
	MxL0y4ID6UVJ0gVSQkH1Fl8Mm/XDhu4JqXlAxzzOpeDozEYumzVS0CJdhvMBbFYCTEC2JVt2yLD
	sXE3lF9RE1trKuF/GUBORi0YS7DTLg5GnnSWwE049RKEEpVsd+g5+0yzhLwfdQma35FLwMC6v++
	IivHGmYju3gMMnA+ld9r48+oUn4ffERT28c9gyrdD8+4p5OZFeugt3+E=
X-Google-Smtp-Source: AGHT+IHdwgcbMGir8rGC2FxcfR5FWuqBLW01X1uYgof+TxOCeYNTkQS2H4ziJD1ohj5msfa2iYpIUQ==
X-Received: by 2002:a05:651c:210c:b0:370:4d3e:7a7b with SMTP id 38308e7fff4ca-3704d3e7e6dmr5988631fa.22.1758811979221;
        Thu, 25 Sep 2025 07:52:59 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710249sm5876151fa.34.2025.09.25.07.52.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:52:57 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3635bd94dadso9817881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSxaLHlDRJ0E30rU0CJik9Aimq96DNQoBv9ktDzgoQyj3MUSfH/paLM3qRcvygCCEBW4XG3j5UUEXKjRX7sKKr@lists.infradead.org
X-Received: by 2002:a05:651c:150b:b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-36f7cecce7emr13436431fa.7.1758811976957; Thu, 25 Sep 2025
 07:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-2-andre.przywara@arm.com> <20250922181611.GA567602-robh@kernel.org>
In-Reply-To: <20250922181611.GA567602-robh@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 25 Sep 2025 22:52:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
X-Gm-Features: AS18NWC5SLylzS53NFTh78yeOtaf2DKHmvxRwMULDvXeTqI87y6sQlGtbhqXD2w
Message-ID: <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Add polyphased property
To: Rob Herring <robh@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_075305_103032_74549E0B 
X-CRM114-Status: GOOD (  29.11  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 23, 2025 at 2:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Sep 19, 2025 at 01:00:16AM +0100, Andre Przywara wrote:
> > Some X-Powers AXP PMICs can combine some of their DC/DC buck converter
> > outputs in a multi-phase fashion, to achieve higher currents and
> > decrease the output ripple. The datasheets call this poly-phase. This i=
s
> > programmable in the PMIC, although often set up as the PMIC's reset
> > default.
> >
> > Add the "x-powers,polyphased" property to the binding, to describe thos=
e
> > pairs or tuples of regulators that should work together. In the lead
> > regulator node, the property lists the phandles of the connected
> > regulators. Just an empty property means no poly-phasing.
>
> Don't we have a coupled regulator binding already?

That was my first thought as well.

Though on the driver side, I guess we would need to add a coupler to the
axp regulator driver to handle the polyphase case directly, or somehow
tell the regulator core to ignore this property.

Unlike separate regulators that are ganged together, in the AXP PMICs it
seems that when buck outputs are ganged, only the controls for the first
output have any actual effect. In such cases I don't know if we should
just ignore / leave out the secondary outputs from both the description
and the runtime state.


ChenYu


> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml=
 b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > index 45f015d63df16..260c4c0afc475 100644
> > --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > @@ -304,6 +304,15 @@ properties:
> >                noise. This probably makes sense for HiFi audio related
> >                applications that aren't battery constrained.
> >
> > +          x-powers,polyphased:
> > +            $ref: /schemas/types.yaml#/definitions/phandle-array
> > +            description:
> > +              A list of phandles pointing to other regulators that sho=
uld be
> > +              polyphased with this regulator. The linked regulators wi=
ll be
> > +              synchronised with this regulator, within the PMIC, but o=
nly if
> > +              supported by the PMIC. An empty list means this regulato=
r
> > +              should be configured in a single-phase setup.
>
> phandle-array is poorly named and is really a matrix because you can
> have arg cells. So you need:
>
> items:
>   maxItems: 1
>
> And is there an outer max for linked regulators?
>
> Rob
>

