Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E1CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRwPKnk8qfrHFphbSwARuokxhcbVBpznEGtVMYZ7BTU=; b=IVNv49BevHcAuEuX0aRF3zNRqz
	JHX5UgUz7Tuw/TMF8ji9uqrOYjSmvgmiGIpjBlNydf/VmcC7mLVMji3qWtC14WRzniY+g2Km4Hi6d
	aHv2Bw8EzYEogsLalT58bpAdaRbuOTf83kuOZHiC5IRv83B6//6lKE6wkdfgOS5tu4kEbjgUheItT
	4Hn8pnr1TBHSZVJ6A4Hol8tHOqosTYQJymghyeMqGaxdCBDazjL9V+HGakwfR1aY2USA1cTjO79EK
	EvtS9AJ6InivUJ+h4Jy2LUEZWnUEKiwqGTYCmWJAiCSgdLpPdtMlmfGZgy+kDb39dI7qofBYl5kAp
	nMHkfM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96hj-00000002fa2-30B0;
	Wed, 15 Oct 2025 18:58:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96hg-00000002fZ7-2oMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:58:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2897522a1dfso64913485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760554708; x=1761159508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRwPKnk8qfrHFphbSwARuokxhcbVBpznEGtVMYZ7BTU=;
        b=U7sGp2lgB4ndQVYYAVtm3l7xfCLKqHD4e4pNp1gupWPEso31KcDskhbJ0wnoh4DKjf
         NvTun1vj1/YvXGwg7rooBt49l+IXKylAwSNCZ0zAm/vbD4SgO0cznE9mGcySY5xtrn50
         h8FK13pL8Knu5BqCNYu5B9hxWmv/XkGgd5FJE6PHJSX4NL7Xw5/G8l+WjWfWsZWBxnxt
         RfJEqulVrckRNyIdbh38RJmrZRzLmJEBOI40uRBuE5Q6ztwEgNLhSiRxmP/PiRJCxpeV
         l4byNdpcdODBQirAEh/7kUz/76Um4nuWE7KXMYoWb4rIySCs2urAOVIy+mw1KOjc3XQn
         8NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554708; x=1761159508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRwPKnk8qfrHFphbSwARuokxhcbVBpznEGtVMYZ7BTU=;
        b=DX/mYphXzNpb0FqyurL4Og0hhOcmjNIF851wlgh2X30EWCYBXs2xKLCHnmM7uitxy1
         Y6NpoCmnD3/yoJa7QLq6GHRadpn0Lvx//VcTjXIg4gUwL9n3vZp1ezAZeSCubxO/qBrR
         IDcRPRvTBFuw1LuteGVoiqwlvHDfRZ9BC6aWb8jMPZSHbQjFtfqzoPmJiSP6zTIwXSO3
         JQa6YrE4XYetQmVs2/dxuUFu5oOYoCtEW4FNXYLq6XWmavVQEyx1bjevNCAaw4IJN17k
         bINl5BQU3V0GZTDyc4usWivBd+Ef0yDdNzT7LzPLSFUSO9O2qwiy81icgIid7hRhvXb+
         YWdw==
X-Forwarded-Encrypted: i=1; AJvYcCUJwg9AAmH2p+n+dcVsAARLIvFJOLmulyp45h5kZpa391Vh33Ot1eV2MP4coaLBL7N6OHirN8qPgt8tXv+a/ku+@lists.infradead.org
X-Gm-Message-State: AOJu0YzbRC4Kxp9fPjYMTwTOtv81L+HmeGZc+7uAo/73GgyulD7X7hhw
	SMdJHnrrtKSyevvSezpO3NHsoDakW5NGnIn+nbOVuiGO/kFmWw1bVyIoUWwYj7IA4IngnExginJ
	508NQ3dFv9V59GmSvzr150YJ6inImQurCMDbMGhE5
X-Gm-Gg: ASbGncv6spzaazlOcOyRWiaVKbLtCa1r0fhEjD+FthqvhXdAW2Qzpd+ZNLKeDvSu/tn
	YTI6gzTDWido3/vk8DVyeW6aSQmsnVh4dThcvebzuegrVn6IPgQ1WauZpaAF8+9wTANdNQ9YHYK
	Zgf0itG/F4vAYFCEtE/qiLrUh7YRd5mP7cCgRDYtwMyb/AwwYWNONPLApNkCxeUvbGpGQqCq2nX
	zcDeN3imrLDIcDkCIcrminJ3crsCcRCdpVFO8sxW2aAYT9TNv0mLWnZQl0webiX0to6x5uMUtfQ
	Jc5U+8Ui2iZTw9Q2FjzhIHFD
X-Google-Smtp-Source: AGHT+IFnYsW3w1gFetllx0+5CiL7Rf74v6cd4M6iTK6ClRMgKt3X+k4ZS1SInKpJctWdDoRuk+7QXEWu/txY1MI7yL0=
X-Received: by 2002:a17:903:37c7:b0:275:b1cf:6dd9 with SMTP id
 d9443c01a7336-290272f80dfmr360656995ad.52.1760554707274; Wed, 15 Oct 2025
 11:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org> <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
 <20251015130538.GA3214399-robh@kernel.org>
In-Reply-To: <20251015130538.GA3214399-robh@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 11:57:50 -0700
X-Gm-Features: AS18NWDABi6Rc7VHdjUz_InyfGjFdsf7Veklfegj5HRf0gGUj-mD1x86yUCd9pU
Message-ID: <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_115828_713936_0E4E9C57 
X-CRM114-Status: GOOD (  32.33  )
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

On Wed, Oct 15, 2025 at 6:05=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> > On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 10/10/2025 22:16, Roy Luo wrote:
> > > > +  reg:
> > > > +    items:
> > > > +      - description: USB2 PHY configuration registers.
> > > > +      - description: DisplayPort top-level registers.
> > > > +      - description: USB top-level configuration registers.
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: u2phy_cfg
> > > > +      - const: dp_top
> > > > +      - const: usb_top_cfg
> > > > +
> > > > +  "#phy-cells":
> > > > +    const: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  orientation-switch:
> > > > +    type: boolean
> > > > +    description:
> > > > +      Indicates the PHY as a handler of USB Type-C orientation cha=
nges
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - reg-names
> > > > +  - "#phy-cells"
> > > > +  - clocks
> > > > +  - resets
> > > > +  - power-domains
> > > > +  - orientation-switch
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    soc {
> > > > +        #address-cells =3D <2>;
> > > > +        #size-cells =3D <2>;
> > > > +
> > > > +        usb_phy: usb_phy@c410000 {
> > > > +            compatible =3D "google,gs5-usb-phy";
> > > > +            reg =3D <0 0x0c450014 0 0xc>,
> > > > +                  <0 0x0c637000 0 0xa0>,
> > >
> > > You probably miss DP support and this does not belong here.
> >
> > This register space isn't solely for DP operation, a significant portio=
n
> > manages the custom combo PHY. Consequently, this space is essential
> > even for USB-only operation. We can expect more registers in the space
> > to be utilized when DP support is added.
> >
> > While I acknowledge the current name is confusing, it directly reflects
> > the hardware documentation. We can either adhere to the hardware
> > documentation's naming or propose a more descriptive alternative.
> > What's your preference?
> >
> > >
> > > > +                  <0 0x0c45002c 0 0x4>;
> > >
> > > That's not a separate address space. I really, really doubt that
> > > hardware engineers came with address spaces of one word long.
> >
> > I initially created this space to access the usb2only mode register,
> > which must be programmed when the controller operates in high-speed
> > only mode without the USB3 PHY initialized. Upon review, I now
> > believe the controller driver is the better location for this configura=
tion,
> > as the register logically belongs there and the controller can tell
> > whether usb3 phy is going to be initialized.
> >
> > That is, I'm removing this register space in the next patch.
>
> You are missing the point. What exists from 0x0c450020-2c and
> 0x0c450000-0x14 for that matter? Hardware blocks don't just start on
> unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, not

Rob,

Thanks for chiming in. Let me elaborate the register layout here:
The register space 0x0c450000 - 0x00450043 is supposed to
be assigned to the USB controller. However, the USB phy has
to access a small portion of it, i.e. 0x0c450014 - 0x0c450020,
in order to initialize usb2 phy. This is really unfortunate and
makes things more complicated than it should've been.

The current patch is addressing it by splitting the register space:
- USB phy: <0 0x0c450014 0 0xc>
- USB controller: <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x23>

> just nodes of what a driver needs. So if the 0x2c register needs to be
> accessed by the USB driver, that's fine, but the register doesn't go in
> the USB controller node 'reg'. A property with a phandle to the node
> defining all the 0x0c450000 registers and an offset (if needed) is
> typically what we do there. Or you can just find that node by
> compatible.

Just to make sure we're on the same page, are you suggesting
making the register space a syscon node [1]? something like this:

usb_cfg_csr: usb_cfg_csr@c450000 {
  compatible =3D "syscon";
  reg =3D <0 0x0c450000 0x0 0x43>;
};

usb@c400000 {
  ...
  usb-cfg-syscon =3D <&usb_cfg_csr>;
  ...
};

usb_phy@c637000 {
  ...
  usb-cfg-syscon =3D <&usb_cfg_csr>;
  ...
}

[1] Documentation/devicetree/bindings/mfd/syscon.yaml

Thanks,
Roy Luo

>
> Rob

