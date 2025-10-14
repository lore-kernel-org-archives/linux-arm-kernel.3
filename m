Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BDFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=; b=yo+yyhmkxBwlTB2Fx+O9cbrPJW
	y7syt1tilu7dxvBWxOBcGJlBsn/LpaFG9g6GdM0/Vu3OchYVThbgPjJr6CPs+AmDng0x+c2mex3R4
	Kg4IjrGtAjUjs4U8I8nXeH7vIWU92EI2bnjttud0EF3RcuM/bfsS4AEhu1br8evllxgUGNaD/HTbo
	i6/XbBxe6CURHBx3Gpfwey53cV67SV8fRflALQd8A6EvbZ+PgW6v6/yaa9otxLHMsImAGmduW9Ipl
	o/8Qwrc58Wz5ZYS0OWPAPVnte03UsuOn4r5KOv/PoKsA4pKMmQZL1/5iiZIJjj1Sq3jXnCoUZfsXa
	4YEDUQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8U8G-0000000EuyM-4B1N;
	Tue, 14 Oct 2025 01:47:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8U8D-0000000EuxX-1OLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 01:47:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-26983b5411aso32676025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406436; x=1761011236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=16xLe/hqHfwsHltBpjWbupZHDQl07HoAdkUOA4ujloZEiuAzPLpghMZZW0B4LiA6Nd
         qTN74t1t7jT9fdenOOIqW40yL2s0LaDkV/58xUKKq6d9cvXfnB78ufpY+A4ISDV9gd8b
         tkj+4HoxZPIX561+vOa4htjtDK8b65MW1f0U/gVttRNHFspNWHAYaJDDpze99zJkM/eZ
         ceqKEY/QfZatoSYBFet2SLYbLqt9VrqmfQ3+qdmwUfCjfJkdnyq/dibX97K/HlBxQxpy
         UoOpSBxvMn8AQqCoAoFvhq9cNGgDMNde7KUsXVdvxINM6fDNgoq/swar/bfVxtoKFo2T
         5Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406436; x=1761011236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=XbhQ/AhWl8gT8ptyRO+1yMpFlLu9D6CE291XJuHYLhY0accF0ld6W7HeYsxFA52Ltg
         9mEl16w5p8O7iW+ryUyh/30JrnOc5VWsVg4VdVa9xP6intyiUN4KXRvJ8MY08qMJrWkL
         +DNMlUvnkMYfIsnWnwvbN7NP2yzp8yCJTEAdy34jtgTIdgyua1j0lgnrmKmCXEYxHyUp
         mVZBBg4Binb2QHxmF5Ig+Md/2BnUaSFMlPIr4iu5j527AUI1AZ5ZKxvLkUHfQPF+WmaM
         RtX0ov1nZKwSk/6QXek+7tZta6GzoJtP9Usnj0Q+mG7WIbGRYwDf1l9VLbReR0POwFwG
         xuLA==
X-Forwarded-Encrypted: i=1; AJvYcCX2WabCQnl39DwMOq/eFHID3VE7TrL1ad5BtMoEHW4GSfjMbdLs1pz2b9Ad2hfbXRJU4yto3P4T6y9mk1Nyq3cd@lists.infradead.org
X-Gm-Message-State: AOJu0YzlLoHnBCTHcLbfgtBNKJh0pgSgEgU3dq9XnzqzNIur/eLiYqae
	XlsQb1fLEmvE60aORqYT+832nB59rQK1+9Ge0Nv/kMZUOGkXbaYff9FXaXH3uYr89fM/wlc/XeK
	XLER23SEicpSZ063Mji3jNXVz5+p2d9ufKjVW5bhk
X-Gm-Gg: ASbGnct+8Ls2tKYiwPvfa+jtmb1KaOJNFOuZlc+iJQ7rW0BAmOEQCSf+SMw5FfIKQwO
	Z3ZuJTC49tLEjCvjwwWSaqiEBDSaaqDuRWkliTZojMtHavBxBJmcbn1JqtbqQywfeKBnqnNJ8qM
	M9C/5q4Oix2yjncNm7EnShayIgNl6sGYLrTQafG6ZuihPW8G6BFE7JmnouHkHahvi80FP2LhYrY
	HIq0ktsc6BDgNky3NxlGedRHWgyXx45uahI3oCq2gDGtcpsRE6nzY7HsZMBO8N9ZqvOP+G4d4oP
X-Google-Smtp-Source: AGHT+IFfPTj8w4BDR5D6JCsus2aD4rztuewWvMbCmVCgUqrOKGYsSJJX4teAZRKcnFjdoRF0OnNBqOS96lWMLzstGuY=
X-Received: by 2002:a17:902:e952:b0:262:4878:9dff with SMTP id
 d9443c01a7336-290273567a8mr277763005ad.12.1760406436203; Mon, 13 Oct 2025
 18:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org>
In-Reply-To: <75756635-b374-4441-8526-175210e01163@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:46:39 -0700
X-Gm-Features: AS18NWCzy6Gx5qemaFGw2t6jXb-2epsDNHczVHslksbyWgF7Radr-Z781gw06UU
Message-ID: <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_184717_391196_D06382A6 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > +  reg:
> > +    items:
> > +      - description: USB2 PHY configuration registers.
> > +      - description: DisplayPort top-level registers.
> > +      - description: USB top-level configuration registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: u2phy_cfg
> > +      - const: dp_top
> > +      - const: usb_top_cfg
> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description:
> > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - orientation-switch
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb_phy: usb_phy@c410000 {
> > +            compatible =3D "google,gs5-usb-phy";
> > +            reg =3D <0 0x0c450014 0 0xc>,
> > +                  <0 0x0c637000 0 0xa0>,
>
> You probably miss DP support and this does not belong here.

This register space isn't solely for DP operation, a significant portion
manages the custom combo PHY. Consequently, this space is essential
even for USB-only operation. We can expect more registers in the space
to be utilized when DP support is added.

While I acknowledge the current name is confusing, it directly reflects
the hardware documentation. We can either adhere to the hardware
documentation's naming or propose a more descriptive alternative.
What's your preference?

>
> > +                  <0 0x0c45002c 0 0x4>;
>
> That's not a separate address space. I really, really doubt that
> hardware engineers came with address spaces of one word long.

I initially created this space to access the usb2only mode register,
which must be programmed when the controller operates in high-speed
only mode without the USB3 PHY initialized. Upon review, I now
believe the controller driver is the better location for this configuration=
,
as the register logically belongs there and the controller can tell
whether usb3 phy is going to be initialized.

That is, I'm removing this register space in the next patch.

Thanks,
Roy Luo
>
> > +            reg-names =3D "u2phy_cfg", "dp_top", "usb_top_cfg";
> > +            #phy-cells =3D <1>;
> > +            clocks =3D <&hsion_usb2_phy_reset_clk>;
> > +            resets =3D <&hsion_resets_usb2_phy>;
> > +            power-domains =3D <&hsio_n_usb_pd>;
> > +            orientation-switch;
> > +        };
> > +    };
> > +...
>
>
> Best regards,
> Krzysztof

