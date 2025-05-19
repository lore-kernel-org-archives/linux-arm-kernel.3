Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B839C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Kju3FsnY+thKUhdFoN0W1nIETGgDAQsnSzsAx6S2Zw=; b=kadLv53FbSfWtrz4udeEB2NAY2
	HMqC7mC8fxPvnjuIkH5X/XtTnzqwuVRIluvrKXK6phkFAUHFTDOnqcuNs58eoqb1gH9TdmkkJcvRo
	8NteDSAsBEKmH+KP7Erfjrf1gpaQEaIlnococomFeO9ZYbEdgaZKNzYbc7XvTlzPNNeEt93H0gC2v
	ByQlQKw7P34UToM6oHtnqUA2LizKnv+BYQSMQGL90N+ivcj9hYj5lkJkV36Bz7+OgTjwWNz0qaoqx
	X220FvLP+Tlntn8Gt4ZCMHiUGtY9Ptdo2SYoA/z80RC4qDCWsbWDZJw4t97juVm6zZGBjHE1XMwdy
	jGxlakdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH50U-0000000A6qi-3tKE;
	Mon, 19 May 2025 18:14:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4K0-00000009yF7-1Kv5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:30:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6020053cbd5so866433a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747675838; x=1748280638; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Kju3FsnY+thKUhdFoN0W1nIETGgDAQsnSzsAx6S2Zw=;
        b=qld4+AEQL5KHCIvhD0KkK/hpnSplEZ7S79xQUDl2fdtO0u8VJuZN1N0voufwyRvzrW
         XMAe4kPDk9jncSqvjr2XkZvlcIddX7g/GvuYYyFpg7IE8jBCRCwtUUzCE9J+YlVMdqHY
         MvFr+cMPCTAxM+BhBr8uDUYqLTLFvB1D1nYdIB8Pko5M9Cp00nsruQfXEnNLETExsh9Z
         BWeqWIS/p9haDpCiJUEqXzuVSryYQe3KPIPRW/g63QLBP1hwl9ELGQpw7mrPBtXEB8ya
         tt1//ekzzFOCQrMRW9ArJPEvk/lYE4YjlWktNgnZqrBSn+UnZKRMaslB512eyKNqGqQR
         AwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675838; x=1748280638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kju3FsnY+thKUhdFoN0W1nIETGgDAQsnSzsAx6S2Zw=;
        b=qct9q8ZqtefYALDam4mqQLV8GqwtCoD0XEPjKH+LgPgfY1hZLiUZWKYnVf5k66uDmo
         4jFiR+1lwVxYJZOFHyYwkMnsQ8SuCxgf2lsQotaUoUgSYpJBwg6FqIW+lRqrTlAkgiQT
         fxmRd0ZBqeQp59Dtp7LMKuyxry6JmTVWjRIhebmmpmKHYlOTmIBQpKl/0qRgV2wim6aB
         rS9NXHqv4ko69R6vS0x4wz18Ub7ACM+BvntIXx3pIp1O62/E61VB6O6MgrnZr7P8knwg
         sBqn/zGpd9U/WBBJrp7zxa5tfecXm+m9GDaIq37qHA2tD6VGFFD3sSRNk2W70tQdIKyn
         mAtA==
X-Forwarded-Encrypted: i=1; AJvYcCW2kaO85UkV/SdsgAC85sVB8O7iJMHAcOfhm8iIWy1TYKEkmo3X97lr30hPtOj0sUW7s6jWbvHJexHZSIucDUvR@lists.infradead.org
X-Gm-Message-State: AOJu0YxPOuJ1zPTS/rDRhJHtDQJwCA6I/hFstvu9zXKNgPU3/sbFtVlP
	minrB+rl54KwsBNzK4gpPbE6b0TU1lELIkcveMhgOwy/eP0s5/e/t9UiZyDUQPZbBw==
X-Gm-Gg: ASbGnct2J2J67t0VdDZLTi1gf+zXmL4lps2erUE3QZgATlk88QwVG0FbM8YTR2g/JUE
	hMXB61U6ddHOccXJOvopqXrYQWPwS2EfCSA1+FC7kNTD47W9fdcFDyYZiKj7LHdRikK9JC6wOq7
	gMVbuy4btyp8bSFz/UuREHVj9CMoZBbk9AI3wL5wZCN2PgiVhNdVIHcDZKp00BTIX+vqs0KZATR
	OooKdnik7cUayrQ8B9LffUJrl7e7DVSevvJIcyMrUghMUod50YnTV6/js+7WWzMYli0dUN3eHBo
	c9r07O4HIOuhNcEenuPqM8YTxiYLb7JR8j4YKmJyvQlWCRAH2KxKL0zMJkX+yqEZem1uS/REyhe
	gPUlCkBURh7sx5khrRw7EwBYyVUpb6wS6oQ==
X-Google-Smtp-Source: AGHT+IFQdXd+uR03JzjdJ/zz2g+tjiE8hNNLW3q4qi5/22Vnca/ILj0cjruXvBC5L68agXPI5CtSjA==
X-Received: by 2002:a17:907:6d01:b0:ad5:58f7:6c8 with SMTP id a640c23a62f3a-ad558f74558mr760304166b.49.1747675838502;
        Mon, 19 May 2025 10:30:38 -0700 (PDT)
Received: from thinkpad (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382c0sm625083466b.90.2025.05.19.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:30:37 -0700 (PDT)
Date: Mon, 19 May 2025 18:30:36 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <y246ietlwyaix7q3wulviy7wysqkwczspgtj26gducxbay4qrl@im3iht4kvhuj>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
 <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
 <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
 <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_103040_358289_87A651A2 
X-CRM114-Status: GOOD (  27.59  )
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

On Mon, May 19, 2025 at 10:04:09AM -0500, Rob Herring wrote:
> On Thu, May 15, 2025 at 6:57 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, May 12, 2025 at 10:42:20PM +0200, Marek Vasut wrote:
> > > On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
> > > > On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> > > > > Document 'aux' clock which are used to supply the PCIe bus. This
> > > > > is useful in case of a hardware setup, where the PCIe controller
> > > > > input clock and the PCIe bus clock are supplied from the same
> > > > > clock synthesiser, but from different differential clock outputs:
> > > >
> > > > How different is this clock from the 'reference clock'? I'm not sure what you
> > > > mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
> > > > and the binding already has 'ref' clock for that purpose. So I don't understand
> > > > how this new clock is connected to the endpoint device.
> > >
> > > See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the controller
> > > side, CLK_DIF1 is the bus (or 'aux') clock which feeds the bus (or endpoint)
> > > side. Both clock come from the same clock synthesizer, but from two separate
> > > clock outputs of the synthesizer.
> > >
> >
> > Okay. So separate refclks are suppplied to the host and endpoint here and no,
> > you should not call the other one as 'aux' clock, it is still the refclk. In
> > this case, you should describe the endpoint refclk in the PCIe bridge node:
> >
> >                 pcie@... {
> >                         clock = <refclk_host>;
> >                         ...
> >
> >                         pcie@0 {
> >                                 device_type = "pci";
> >                                 reg = <0x0 0x0 0x0 0x0 0x0>;
> >                                 bus-range = <0x01 0xff>;
> >                                 clock = <refclk_ep>;
> >                                 ...
> >                         };
> >                 };
> >
> >
> > and use the pwrctrl driver PCI_PWRCTRL_SLOT to enable it. Right now, the slot
> > pwrctrl driver is not handling the refclk, but I can submit a patch for that.
> 
> There's another discussion about PCIe clocks here[1]. Seems there's a
> variety of options here with spread-spectrum layered on top.
> 

The other discussion is separate IMO. It just concerns how the endpoint detects
local clock vs supplied clock.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

