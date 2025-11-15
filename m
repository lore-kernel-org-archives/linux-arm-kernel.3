Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CF4CEB2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOYSOoZ7kZHsHMrtVsrNZvrMCn7UoqoHGgR3M03FgNs=; b=ORVOrJ6BVwpIsxUDdTR6DrkpWJ
	mAK/QlML8rpmD8phkXbs/e+4kku/aGwLZ9ASyIaokmj+51hmt4bj9i/IuamB2GAFQzPeJXJTRx88O
	GR8Gdn2U41toQV+tvhGlkniwiM5Ho57jrUccSD1QTMum/07ZTiWX7umB6lYGlhOKltkB/LSIEMudU
	buiUvXR5b5xrQPoBswS+DxPmWQHGartK1chU3W9CxB0QShbc7mot1vmr4rA3QU5Jpln9VFWw+/64S
	v+DulShpFmknAOOrSUFRLFAnLFy2EMFWcBrW9Gs5yIXlAoq3TDnFch2DbVb82FpupDqqmid6WAr2x
	w5hBFaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKAIu-0000000DYZx-3WAg;
	Sat, 15 Nov 2025 07:02:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKAIr-0000000DYZI-3YFu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 07:02:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b8d99ad095so2204233b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 23:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763190152; x=1763794952; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IOYSOoZ7kZHsHMrtVsrNZvrMCn7UoqoHGgR3M03FgNs=;
        b=AhDUQZsx8qeQRpwLxK0VjU4k1r6P9ZL+2AqXgCjxzbTcCdlTP9ZdCV79MgLGMscSdx
         5+Ki5/eFFQ46i3O/vpCl+vRphUDC/l7HCZdKB/fhgZ4P2Oea1vU6v8fXasFyKE3yQwet
         XYVD1q49OLGNNLRwj/6EoRM+KY+EA+12zgLYr7jr9JVytXT+i5am952IHRB9AGZfJ6Ii
         tgjGcmGGb5kke4lHsY34JZDQHJjU+aW5p60GREeizhFYsoaR6iheECuJD7yiHp2HNFQe
         xUDOJKvfmc8UfryjxUk4rNygAE+wtSlGxCZYbMQq6Uos3xXfyx+H+kZe4yg9CFxnDdaF
         LgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763190152; x=1763794952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOYSOoZ7kZHsHMrtVsrNZvrMCn7UoqoHGgR3M03FgNs=;
        b=eIu0ZW1oMLYzZxIBiCoYrIanV1HGzY7vJWzX5a/g7/sGpcHr8i0LH9OWtewdZhWLxq
         bjJxS5/VALPav9o5AUmYOW2JEOwxWMJH98csFUJ4HrclMqnjsT/6eEKmAvmARlUN0Fjk
         3fEqvVAj7m1uyLwA+62dqCXyXfLcxljX87IFOxdEYMWE7h+/v7ppPtBZvBa/slFUE1zh
         cNRLrCdiyB2MQrj2RrUsrtlHtAL2wq+LuVYQYk8bBTEUJ8gSa+ex8nWFYxJ4e4UXI0uK
         EzEZpr47jjBrTPVYzdKHlfgZoBEpu8crI+AsZ6wFXxjr2NTvEmZL3xr5/g6RX4hjXYJx
         VA+w==
X-Forwarded-Encrypted: i=1; AJvYcCVJZKaZRW53MxBFZ+KIuBMCk49syPDEAOYv8fSXWsIiwbTsWv2tjcxcNmhswtFRYMMk8h1ulHsyFRn40jv4xNPT@lists.infradead.org
X-Gm-Message-State: AOJu0YyAuxJwwh5ureZAkrpQzEwknCNqVkh4JwGnZDp1tB9l+DMeyGyK
	KaiA5zNbo7j716zzcWzKUTmEvPnaY4U2PDUB6cH7JIjYoKwdgHKJBBm0
X-Gm-Gg: ASbGncu9g/wI3zr5J3ORayA56afT8O6h2waioVsiqqajwLGsAj+lJE3amoudKBuSS7x
	eUWpm900bVI2VY3fdYw2nElvQfJvhRYEOldVDOacH+W/pcF2kS959f50NnYgz03XuogrmLN4INb
	SnIyWSap4kYQbde9H275HknHPGpI41Zo5qkFBHJg+dsXo4/+V5uCig6YIEoHZ4K8VgcZi043UG0
	xEvwyq/hyxzSQwlkxFsszx9DRW99qahVxKNYTBl5O15R5G4S73f5kNi4YC/HUj88cQm5a19QD8u
	aQcRhvu8rDsvSsdO/IU7LSE4ZSVk7MfOsTX8nFwZbQCYl+SC+i0omfBxOKTaOFD5lq3JkWc3kN7
	OXbsHcT/PL7eWATg4YSXApsnxfI0qxT8Is++FrSXI4OYBlYxyPtfjmUaqg8eBJplZaoXqqaZEHA
	avtda8zbd9
X-Google-Smtp-Source: AGHT+IF6Rm2Drf+1xlFmZRzPIXc1lSKc1tNyqq8bFT5+2d7X7z6WfhOem4D1nutU3J7fGxCS13ODNw==
X-Received: by 2002:a05:7022:b90c:b0:11a:4ffb:984f with SMTP id a92af1059eb24-11b411f05dcmr1444305c88.11.1763190151853;
        Fri, 14 Nov 2025 23:02:31 -0800 (PST)
Received: from geday ([2804:7f2:800b:a008::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b80fd6790sm4677580c88.10.2025.11.14.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 23:02:31 -0800 (PST)
Date: Sat, 15 Nov 2025 04:02:24 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Kever Yang <kever.yang@rock-chips.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	=?utf-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aRglgNL5eumu4XbS@geday>
References: <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <aRLEbfsmXnGwyigS@geday>
 <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
 <aRQ_R90S8T82th45@geday>
 <aRUvr0UggTYkkCZ_@geday>
 <aRazCssWVdAOmy7D@geday>
 <e8524bf8-a90c-423f-8a58-9ef05a3db1dd@rock-chips.com>
 <aReSPbRxCgdNRI9y@geday>
 <ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_230233_877134_605089EC 
X-CRM114-Status: GOOD (  22.32  )
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

On Sat, Nov 15, 2025 at 10:21:28AM +0800, Shawn Lin wrote:
> 
> 在 2025/11/15 星期六 4:34, Geraldo Nascimento 写道:
> >> Another thing I noticed is about one commit:
> >> 114b06ee108c ("PCI: rockchip: Set Target Link Speed to 5.0 GT/s before
> >> retraining")
> >>
> >> It said: "Rockchip controllers can support up to 5.0 GT/s link speed."
> >> But we issued an errata long time ago to announced it doesn't, you could
> >> also check the PCIe part of RK3399 datasheet:
> >> https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> > 
> > OK, I'm partly responsible for that as author of the commit in question.
> > 
> > First off let me say I do not intend to send any patches setting
> > max-link-speed to TWO for this platform.
> > 
> > I understand you issued an erratum, but are you absolutely sure about
> > that erratum? Because my testing shows otherwise:
> 
> Sure.
> 
> The reason is that Gen2 is merely functional, but this does not mean it 
> is 100% production-ready. It has some inherent issues that cannot be 
> resolved, which may lead to failures beyond imagination. Even if the 
> probability of occurrence is as low as 1 in 100,000. I cannot share 
> further details. Therefore, the official documentation should be your 
> primary reference, rather than relying solely on simple evaluations.

Hi Shawn,

indeed, the situation is not favorable and we should strive to make
amends. I'm sorry I based the commit on outdated information, I was
none the wiser.

What I propose is to add a comment to driver core saying that path
to 5.0 GT/s shouldn't be taken and users are strongly discouraged to
mess with the maximum link speed in DT.

We deal with corner case of helios64 in another patch and make sure
there are no DTs engaging 5.0 GT/s.

This should close the loop-hole.

Regards,
Geraldo Nascimento

