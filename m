Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A16D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UqjWK7oBLcZrh20BDC54sz2OeZlyVX9cKtnx5NbnNE=; b=d2DyLX7Vbh957cEFUJZZUshsGb
	oVYQEaKovUWU7L6PCyfRNPHU810KvbyUUc2umiCbXefZDL7JKQvAHKcPtbhZ/aPVCWGQum1VbvZJy
	NokiJQjhK0vayGUKw6EDMPcEcj9B5kCRQdqSCN82FOtiaxCmhdMtSRTC4tCCn0fyAKZV9OmOm5Gas
	0wVjEw/5TvEUPY49TF6oHYVun8eWGrBVnxhp+bw5oLOj+EcFYKKD4FXZl9zN7XgjHJ3S3LAnmT48W
	sTvNnScASerweSx3VU3SJPUV2mWy77CIxfEX77p3/RwDDV6Qw/I2kVQc5+hORUDEn2X6NJNWc/3U2
	0XFxuWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAbT-00000008AsA-0ExT;
	Thu, 18 Dec 2025 09:47:23 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAbQ-00000008ArS-02Hq;
	Thu, 18 Dec 2025 09:47:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5F6C441852;
	Thu, 18 Dec 2025 10:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1766051230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1UqjWK7oBLcZrh20BDC54sz2OeZlyVX9cKtnx5NbnNE=;
	b=iudcplOSX3AtnLLvOh3Jnas+BrNMsdrg50pEojgEtg7XMX9/Olz7HsTSiuBwem+B3/CFsB
	Ci4d3PX2umna6Un0JpVwclWwNGuzUyqDveFPX+GOVmqlv5WBebcjn0gI3NtBqtc4lswvCK
	N7pYjQbcyYnsWY8Udj4/eQxW5ubp9X5eEhxH9iXagp6NHQFVqRvV32ELPkeoMGDIz0HSVq
	1tl01uBJHxKTuHykI8k3E4izLUNdPkRzQEgS7RgLuBdJvnH10cuL9kCRBPe4kvdzFfDVDI
	MtnjnNUqZoWw0o1MUo7gj2c7aKN9GgBH2RoQdKYB/Ku6kSK183dfzjRHjLpHLw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <qncj72c3owrw7rvnj6jit2sbn4ojyr3kztcjailfxtdboan6sy@ddh5g7v4fcvt>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com> <qncj72c3owrw7rvnj6jit2sbn4ojyr3kztcjailfxtdboan6sy@ddh5g7v4fcvt>
Date: Thu, 18 Dec 2025 10:47:06 +0100
Cc: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: "Manivannan Sadhasivam" <mani@kernel.org>
MIME-Version: 1.0
Message-ID: <3ea8ac20-6332-0c0c-645b-36ca4231c109@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/4] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 limit RK3399 to =?utf-8?q?2=2E5?= GT/s to prevent damage
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_014720_275400_28C80A1C 
X-CRM114-Status: GOOD (  20.68  )
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

Heello Manivannan and Geraldo,

On Thursday, December 18, 2025 09:05 CET, Manivannan Sadhasivam <mani@k=
ernel.org> wrote:
> On Mon, Nov 17, 2025 at 06:47:05PM -0300, Geraldo Nascimento wrote:
> > Shawn Lin from Rockchip has reiterated that there may be danger in =
using
> > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT ch=
ange
> > from the default and drive at 2.5 GT/s only, even if the DT
> > max-link-speed property is invalid or inexistent.
> >=20
> > This change is corroborated by RK3399 official datasheet [1], which
> > says maximum link speed for this platform is 2.5 GT/s.
> >=20
> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK3399=
=5FDatasheet=5FV2.1-20200323.pdf
> >=20
> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC d=
river")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c=
21b@rock-chips.com/
> > Cc: stable@vger.kernel.org
> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/c=
ontroller/pcie-rockchip.c
> > index 0f88da378805..992ccf4b139e 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -66,8 +66,14 @@ int rockchip=5Fpcie=5Fparse=5Fdt(struct rockchip=
=5Fpcie *rockchip)
> >  	}
> > =20
> >  	rockchip->link=5Fgen =3D of=5Fpci=5Fget=5Fmax=5Flink=5Fspeed(node=
);
> > -	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2)
> > -		rockchip->link=5Fgen =3D 2;
> > +	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2) {
> > +		rockchip->link=5Fgen =3D 1;
> > +		dev=5Fwarn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
> > +	}
> > +	else if (rockchip->link=5Fgen =3D=3D 2) {
> > +		rockchip->link=5Fgen =3D 1;
> > +		dev=5Fwarn(dev, "5.0 GT/s is dangerous, set to 2.5 GT/s\n");
>=20
> What does 'danger' really mean here? Link instability or something el=
se?
> Error messages should be precise and not fearmongering.

I agree that the original wording is a bit suboptimal, and I'd suggest
to Geraldo that the produced warning message is changed to

  "5.0 GT/s may cause data corruption, limited to to 2.5 GT/s\n"

or something similar, to better reflect the actual underlying issue.


