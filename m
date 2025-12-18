Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE27D68BDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylzd1ln6LrPrU5IC4uXLIKJ7Ql65APzUO/VNo8GxV7Y=; b=eVMzzozliJqHY89Rg0QStoaD+u
	Mwz5dliacP4EBMsT7DrKXLEU0n6pueT+S3QpFbaP6sG8989ATDLXzHxXVk+bDshiyhDAzoobpG0I6
	2/Nfa4wKLejMEun2+OUiXsGCeh/a6WncwhXZayAPL+xEgtSALqJZfLmhkcbY2X9aw7L3s1nKyHAOQ
	xNVVFXlvY7mVGjWgy/97XGUi59BxXk1ys1ttS6/sNjljreaY4n1cRp3ULqv0Cuqo0j9K/KMOGCd8g
	dos9zKliv3z9WfTKtq5y36TJfM/xwyNP54rxQvYB8bFUau/mwTSCjTZsgobS9EcybY1LEX5gMOUYS
	7YBbuHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWApc-00000008Btm-1uL2;
	Thu, 18 Dec 2025 10:02:00 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWApY-00000008BrM-3sNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:01:58 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1766052086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylzd1ln6LrPrU5IC4uXLIKJ7Ql65APzUO/VNo8GxV7Y=;
	b=j7kmck4wc7HHErDctdNIYTjlGojlUoIWOGFilkrn+iWBwzzoeGXFdYljq+AC/nyrWQeEo4
	FuApn/D8zehu9u+vDVqu1gXcL4dGdUScOPvJutpuvoLVnVhh6Wa1zuCqdHoTyiBxXUHhYS
	baDcjSx9OuDnWXRwxOkHRP/0ikmx2HvUcM/38dRSNOfEWOn+PPsJstF//fvYXZf5mkGVv1
	1db3oFD6ei9zOTET25TnB7E53ERZQc23kY8+vNJu20UBsaHFbKAdTJFSW791XqeD2Rt2Cb
	VggvMvhAnQlR1aQ2BP8YtgiIpG4DEDaI2tFmkjWBreWYe6e0Cqhx8JtiIAAIPg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:01:16 +0100
Message-Id: <DF197NIRHLIJ.3LIG9GJGJQLQX@cknow-tech.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to
 prevent damage
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Dragan Simic" <dsimic@manjaro.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>
Cc: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko
 Stuebner" <heiko@sntech.de>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>,
 <linux-rockchip@lists.infradead.org>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com> <qncj72c3owrw7rvnj6jit2sbn4ojyr3kztcjailfxtdboan6sy@ddh5g7v4fcvt> <3ea8ac20-6332-0c0c-645b-36ca4231c109@manjaro.org>
In-Reply-To: <3ea8ac20-6332-0c0c-645b-36ca4231c109@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_020157_107053_05A358C5 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu Dec 18, 2025 at 10:47 AM CET, Dragan Simic wrote:
> Heello Manivannan and Geraldo,
>
> On Thursday, December 18, 2025 09:05 CET, Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
>> On Mon, Nov 17, 2025 at 06:47:05PM -0300, Geraldo Nascimento wrote:
>> > Shawn Lin from Rockchip has reiterated that there may be danger in usi=
ng
>> > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT chang=
e
>> > from the default and drive at 2.5 GT/s only, even if the DT
>> > max-link-speed property is invalid or inexistent.
>> >=20
>> > This change is corroborated by RK3399 official datasheet [1], which
>> > says maximum link speed for this platform is 2.5 GT/s.
>> >=20
>> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Data=
sheet_V2.1-20200323.pdf
>> >=20
>> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driv=
er")
>> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b=
@rock-chips.com/
>> > Cc: stable@vger.kernel.org
>> > Reported-by: Dragan Simic <dsimic@manjaro.org>
>> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
>> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
>> > ---
>> >  drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
>> >  1 file changed, 8 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/cont=
roller/pcie-rockchip.c
>> > index 0f88da378805..992ccf4b139e 100644
>> > --- a/drivers/pci/controller/pcie-rockchip.c
>> > +++ b/drivers/pci/controller/pcie-rockchip.c
>> > @@ -66,8 +66,14 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *ro=
ckchip)
>> >  	}
>> > =20
>> >  	rockchip->link_gen =3D of_pci_get_max_link_speed(node);
>> > -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
>> > -		rockchip->link_gen =3D 2;
>> > +	if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
>> > +		rockchip->link_gen =3D 1;
>> > +		dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
>> > +	}
>> > +	else if (rockchip->link_gen =3D=3D 2) {
>> > +		rockchip->link_gen =3D 1;
>> > +		dev_warn(dev, "5.0 GT/s is dangerous, set to 2.5 GT/s\n");
>>=20
>> What does 'danger' really mean here? Link instability or something else?
>> Error messages should be precise and not fearmongering.
>
> I agree that the original wording is a bit suboptimal, and I'd suggest
> to Geraldo that the produced warning message is changed to
>
>   "5.0 GT/s may cause data corruption, limited to to 2.5 GT/s\n"
>
> or something similar, to better reflect the actual underlying issue.

s/limited to to/therefore limit speed to/ ?

Cheers,
  Diederik

