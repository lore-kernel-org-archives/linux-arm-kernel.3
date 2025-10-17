Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SE0GPjAFjItjLF86HET23/U9OrOIQ8cx/iNIr3s8Q8=; b=StaeeRAbKtGren13gymdipPZJ6
	Je8FbLwrWf87GMLY0swEjmmyIfOxuE8YqA8oyJUgMJ02tPMWwrzXsFTmL8rNVuS5Uo50o3bNPJQQb
	b18hApv06A2PWvnbGct34FuIN8kOygnorSMHmDYGwTtZ1sEM8mXiCW8N+XIVjO+COHbq4S7PeMY5z
	BprGlfK71LPV+hz9a4MVfxT9SgDrH0wgd7U8EkTeWC/re8C3nXH8hLIs/ldGS+iPn9eS/kfPXPYM0
	9isEsyw9fD+IuMFzEo6YqRCPpLpGOsoZXvIGa1PflPjADuZKlfdZECIeqEeArAY7v94o/wA8H4YmO
	/Bij5ZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uL1-00000009DpS-2Klu;
	Fri, 17 Oct 2025 23:58:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uKy-00000009DoH-021B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:58:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-27eec33b737so36659185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745498; x=1761350298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SE0GPjAFjItjLF86HET23/U9OrOIQ8cx/iNIr3s8Q8=;
        b=sMcLskLFl6YW10fYSO/7Dgn2l5OFF0XhC/+M7G089g75Bep3FtmoXITyNr3XUZJaDh
         KapVbVjaqPQKMfUbtR5+EznbOCxjsBlc15u2BAtoNW7uRUjrBfBBpxqUZv1Wob7sD4XA
         bmebEZyO9tpu35AngjgG84MSuE21mi6S+19zezv+oEQI21zFRg+oEfQMrGAauLhpszlf
         YmObZUAa0evu9oW9gIPMC6RyDAYJWaFG/XJK4Jh7in+PODiBp/LXfxOTrqoiGAP64k8q
         /zi3DhqeFSioL5jSNoPB3anJYjE8nf8MRwtHCY0fL9m0xVCKUQU8bdxHkfydAmnLNYl5
         LvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745498; x=1761350298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SE0GPjAFjItjLF86HET23/U9OrOIQ8cx/iNIr3s8Q8=;
        b=XTrhM6xysvel/ojcN1OWVGxU/B4bn+Id+FbQaMaVnBjMH5Ghl66V4XdgzRGTn9mj46
         ZIkjISJ9uHuN1YUYjkWLP/u0UA5vKWoBixPovnkPkU2B/5R2Z2IwK75NNst45YdjVYoz
         6MipKv1yJRnbQOf+Q6hvQb5Vz0G52l9ggWI/JImBgJAiCYqeJ/v8kCHzxhcOnK4iJBb1
         8IPlsdJwq731k4cVq71MKAGwAHJPDco4SCTv6nNZayFffUXuHcC63VsaNF9mokQ9FK4L
         0V2OiB280hlO+eWjm0+av3UjEB1T8YtHcJTIaRoPxD+CWrFJN+fHRnYsPdzbu7gAoYdr
         KzXg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2VpOJ9sLUFCy9L54q2BVeCraeH09tKexc0gAi3YSS639h3gup0QRPYAv2yEAuU5a038go168v8UWj/llGFJj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk36Ii45ZaeCVd9X3tV754xKlaDXEZm+Bv0ayFUuP9lJRH6WTj
	fjlaSHCvpu/is03IaczqkCoHc9HWj4sxGFd9WG+yvdhLFA3PMksoJhxrlAFZbPwgFTTxrCyPhOT
	j3/f/HLHFgwCP2HzrXWj+em/IwA738AFJO6s5snv1
X-Gm-Gg: ASbGncs47eRALrM36YGRd1rKNNlkddSc5zpUeh5gZ+GU8yvSIbow/4zk83bCw3f3FC7
	7BVhPKLAz9nJH0OnX266yWS9ZINahxUolyfK5coeNzEMljLOaZdeoorkM/KLJOxiim+wuWsJT+1
	rr3CuX8XYsAwfLHOVD+pqQhqDJ94PfuxqEnHsFVHNoaZtnLIIYHr4OxVH9aa4VTikzJZhzq3GeR
	bHQPQ6SmhMQHxMBa0gJLS7BgzFLHx0Si92i/R97Y4qyjl5NXoTG1AArtc6vN93kKC00AHEs95iA
	3i8fdFXXtWjAR5eG836TbNqc1A==
X-Google-Smtp-Source: AGHT+IHCANqLORIt+IrA+YkO6lwZel+K3VDA4WBemP44u6xPVrUe6fi1GWh3Pp23fq65Ylj7U7aD8xTBhXTINQfkvBY=
X-Received: by 2002:a17:902:d2c4:b0:250:bd52:4cdb with SMTP id
 d9443c01a7336-290ca216351mr67457005ad.32.1760745498073; Fri, 17 Oct 2025
 16:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org> <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
 <20251015130538.GA3214399-robh@kernel.org> <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
In-Reply-To: <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 17 Oct 2025 16:57:41 -0700
X-Gm-Features: AS18NWD5UlV7b-66BMMBU_l_HmLfx0ZDw13ZyAgDAmVkiOjEHLur9mcaNTje0Ak
Message-ID: <CA+zupgxx9VQ6Mh1=x7EiGSCWeAqf8LM-047fA99tyE0sHsTamQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251017_165820_045703_103C0B8F 
X-CRM114-Status: GOOD (  40.03  )
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

On Wed, Oct 15, 2025 at 11:57=E2=80=AFAM Roy Luo <royluo@google.com> wrote:
>
> On Wed, Oct 15, 2025 at 6:05=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> > > On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > >
> > > > On 10/10/2025 22:16, Roy Luo wrote:
> > > > > +  reg:
> > > > > +    items:
> > > > > +      - description: USB2 PHY configuration registers.
> > > > > +      - description: DisplayPort top-level registers.
> > > > > +      - description: USB top-level configuration registers.
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: u2phy_cfg
> > > > > +      - const: dp_top
> > > > > +      - const: usb_top_cfg
> > > > > +
> > > > > +  "#phy-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  resets:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  orientation-switch:
> > > > > +    type: boolean
> > > > > +    description:
> > > > > +      Indicates the PHY as a handler of USB Type-C orientation c=
hanges
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - reg-names
> > > > > +  - "#phy-cells"
> > > > > +  - clocks
> > > > > +  - resets
> > > > > +  - power-domains
> > > > > +  - orientation-switch
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    soc {
> > > > > +        #address-cells =3D <2>;
> > > > > +        #size-cells =3D <2>;
> > > > > +
> > > > > +        usb_phy: usb_phy@c410000 {
> > > > > +            compatible =3D "google,gs5-usb-phy";
> > > > > +            reg =3D <0 0x0c450014 0 0xc>,
> > > > > +                  <0 0x0c637000 0 0xa0>,
> > > >
> > > > You probably miss DP support and this does not belong here.
> > >
> > > This register space isn't solely for DP operation, a significant port=
ion
> > > manages the custom combo PHY. Consequently, this space is essential
> > > even for USB-only operation. We can expect more registers in the spac=
e
> > > to be utilized when DP support is added.
> > >
> > > While I acknowledge the current name is confusing, it directly reflec=
ts
> > > the hardware documentation. We can either adhere to the hardware
> > > documentation's naming or propose a more descriptive alternative.
> > > What's your preference?
> > >
> > > >
> > > > > +                  <0 0x0c45002c 0 0x4>;
> > > >
> > > > That's not a separate address space. I really, really doubt that
> > > > hardware engineers came with address spaces of one word long.
> > >
> > > I initially created this space to access the usb2only mode register,
> > > which must be programmed when the controller operates in high-speed
> > > only mode without the USB3 PHY initialized. Upon review, I now
> > > believe the controller driver is the better location for this configu=
ration,
> > > as the register logically belongs there and the controller can tell
> > > whether usb3 phy is going to be initialized.
> > >
> > > That is, I'm removing this register space in the next patch.
> >
> > You are missing the point. What exists from 0x0c450020-2c and
> > 0x0c450000-0x14 for that matter? Hardware blocks don't just start on
> > unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, no=
t
>
> Rob,
>
> Thanks for chiming in. Let me elaborate the register layout here:
> The register space 0x0c450000 - 0x00450043 is supposed to
> be assigned to the USB controller. However, the USB phy has
> to access a small portion of it, i.e. 0x0c450014 - 0x0c450020,
> in order to initialize usb2 phy. This is really unfortunate and
> makes things more complicated than it should've been.
>
> The current patch is addressing it by splitting the register space:
> - USB phy: <0 0x0c450014 0 0xc>
> - USB controller: <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x23>
>
> > just nodes of what a driver needs. So if the 0x2c register needs to be
> > accessed by the USB driver, that's fine, but the register doesn't go in
> > the USB controller node 'reg'. A property with a phandle to the node
> > defining all the 0x0c450000 registers and an offset (if needed) is
> > typically what we do there. Or you can just find that node by
> > compatible.
>
> Just to make sure we're on the same page, are you suggesting
> making the register space a syscon node [1]? something like this:
>
> usb_cfg_csr: usb_cfg_csr@c450000 {
>   compatible =3D "syscon";
>   reg =3D <0 0x0c450000 0x0 0x43>;
> };
>
> usb@c400000 {
>   ...
>   usb-cfg-syscon =3D <&usb_cfg_csr>;
>   ...
> };
>
> usb_phy@c637000 {
>   ...
>   usb-cfg-syscon =3D <&usb_cfg_csr>;
>   ...
> }
>
> [1] Documentation/devicetree/bindings/mfd/syscon.yaml
>
> Thanks,
> Roy Luo
>

Hi Rob,

I'm sending out a new version of the patchset.
Although this specific comment isn't fully resolved yet, I've integrated
enough new content and fixes into this and other patches that I believe
it's ready for another round of review.

I'm happy to continue the discussion on this specific point here or in
the new patchset. Here are the links to the new patches FYI:
- controller https://lore.kernel.org/linux-usb/20251017233459.2409975-1-roy=
luo@google.com
- phy https://lore.kernel.org/linux-phy/20251017235159.2417576-1-royluo@goo=
gle.com

Thanks,
Roy Luo

> >
> > Rob

