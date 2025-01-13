Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34271C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC+lZA6CIUr3QfVqqX5fUH5hE+F82w8gQyQghM5ki10=; b=wLmfMkVKpvAO/ab06h2aoeo2qd
	J8QMBo3ZLD+64uwU2jtTsI0OeQ95zvJGPquL/bckTARPS2jeOkrMFA0uZ7w3O1I5M2eg1yfRdF/j7
	VxGb+u/+zx8mh+U2pzgO3Qmpltap1sNfEqG0R5xPl1/zbg+Yqh10zhpVfd1TffesrAp4ebKdVwW5q
	PNBUWudhl2I4Po7NcN2QgpP7dmlpvBXPEdyHAOGv6hYvMkoqUtP8AQkFft8PYIfMwL0IS7rbr6KUb
	ri287SslnDLmPtpOM6okViSS8ZxBBX0BVlMqdy1fNpigRHrX5F7cVVP0Sq9d3MRuw5egKsg45bcuc
	QGYQwEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRmg-00000006eOJ-02WJ;
	Mon, 13 Jan 2025 21:15:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRlR-00000006e91-00GW;
	Mon, 13 Jan 2025 21:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFB67A41395;
	Mon, 13 Jan 2025 21:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730F8C4CED6;
	Mon, 13 Jan 2025 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736802863;
	bh=gDVjIyupViTpLPklirSL7vMmnWCg3s/D6lSP9P/hdQc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=G5oaJTcFq5M3jNV++eaOd54kuVJ5pQNfaTo89sE0C2bDs/iHFwjjYh0sevVzjSeNl
	 nYpcpOSj2KdnRFs6HhPbK67oomSYO+mH29A1GnH28Q+ITnIp4sXRz4xVyakAQBBPBw
	 3UrH7cewXKklCZJLb5YE7ejzrzh/4TQrOqC5AUA2H2NdKx1U1CGJ3DMX+ay0dWyllf
	 C6a6DiFFOMa0cmbaUidBkmBkqCtyIqft7y961ocZ6ydGTXSuzWztvkEgM5XlM8VaL+
	 DS3tJGaSSGLNM26YAQLATdTz7YKb0J9v0s/M3R7nwROkXeK9YOiVDdivDNMoYxGDNW
	 GORX2gXhkukgQ==
Date: Mon, 13 Jan 2025 22:14:21 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,
 Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
User-Agent: K-9 Mail for Android
In-Reply-To: <20250113192720.GA414640@bhelgaas>
References: <20250113192720.GA414640@bhelgaas>
Message-ID: <5EFEAC8C-6BAA-46BC-9EED-F0D89952D3E5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_131425_105479_19225B5F 
X-CRM114-Status: GOOD (  15.25  )
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



On 13 January 2025 20:27:20 CET, Bjorn Helgaas <helgaas@kernel=2Eorg> wrot=
e:
>On Mon, Jan 13, 2025 at 11:59:34AM +0100, Niklas Cassel wrote:
>> The Root Complex specific device tree binding for pcie-dw-rockchip has =
the
>> 'sys' interrupt marked as required=2E
>>=20
>> The driver requests the 'sys' IRQ unconditionally, and errors out if no=
t
>> provided=2E
>>=20
>> Thus, we can unconditionally set use_linkup_irq before calling
>> dw_pcie_host_init()=2E
>>=20
>> This will skip the wait for link up (since the bus will be enumerated o=
nce
>> the link up IRQ is triggered), which reduces the bootup time=2E
>>=20
>> Signed-off-by: Niklas Cassel <cassel@kernel=2Eorg>
>
>Thanks!  I was just reviewing the addition of your dll_link_up IRQ
>handler, and was about to ask whether you wanted to set use_linkup_irq
>to avoid the wait, but here's the patch already :)

:)

>
>I think I'll sort out the branches so the dll_link_up IRQ handler,
>this patch, and the corresponding qcom change go on the same branch as
>Krishna's patch to skip waiting if pp->use_linkup_irq=2E

That sounds like a good idea=2E

Thank you!


Kind regards,
Niklas

>
>> ---
>>  drivers/pci/controller/dwc/pcie-dw-rockchip=2Ec | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip=2Ec b/drivers/=
pci/controller/dwc/pcie-dw-rockchip=2Ec
>> index 1170e1107508bd793b610949b0afe98516c177a4=2E=2E62034affb95fbb965aa=
d3cebc613a83e31c90aee 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip=2Ec
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip=2Ec
>> @@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct rockch=
ip_pcie *rockchip)
>> =20
>>  	pp =3D &rockchip->pci=2Epp;
>>  	pp->ops =3D &rockchip_pcie_host_ops;
>> +	pp->use_linkup_irq =3D true;
>> =20
>>  	return dw_pcie_host_init(pp);
>>  }
>>=20
>> ---
>> base-commit: 2adda4102931b152f35d054055497631ed97fe73
>> change-id: 20250113-rockchip-no-wait-403ffbc42313
>>=20
>> Best regards,
>> --=20
>> Niklas Cassel <cassel@kernel=2Eorg>
>>=20

