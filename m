Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044A3C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3UW6p735sL0uDpuTdjeAlDlTVS5KOHJnqXmFJV22mw=; b=aaDOYYDbX+xMVm8+jGFqX/f/Ed
	OgV6cHES6H10jBKKAC8an0dbXubj4cgCgwdH9T6dBlxFspU16mlo2yu4f/HiODc6ItWVdMDm2K//e
	fibnnvF+8e1W0ViyeVKCFjjmnSMam8UEWdeXEkrC+/eNIUpyeDI2DTUvhiWrJtO5yL5yVTprJ7bwu
	SJFZBOevunLescyEmISpSjK2btN36QiUl+pTeOYFLuk3xBcyFOgXr+1yNBVwKY3ctOS4/EAu+VF4R
	ZIVRiLwtU70PdDzzrLki4hNitHfWPDy+Yh1tYbrygSzqBbO4oCmOjq0PSnvWuBXYPg+JSOfeU57Wh
	8Zj2/h6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t8G-0000000DYVl-14Lz;
	Thu, 24 Apr 2025 09:44:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sQA-0000000DQv3-0Uvg;
	Thu, 24 Apr 2025 08:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745485127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jaV0x3qj/eqBLIwubtgE8KUAQn2b86GxCDmo0XTJPYmIQTCRZbHHx0dxGpQTlkucxhzTG8QN0tqyWNwbybF2orNap/vE+IniaHZmVhYTKUglVdEtAjxrRAN0Wl+Bo3LED2AF7NTBBIMkwPo5qwWvSn9acvulMqHIjcwXx+oew/Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745485127; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J3UW6p735sL0uDpuTdjeAlDlTVS5KOHJnqXmFJV22mw=; 
	b=PmhFNP+E145dBDrIHOeTs0XSN9iyyy8OMNz0BuUQwX46Mkf5FxF5MGKd1dBTFthSHwJf8+8aQ1joZbq8rqJyIebtkFxVGo+yWMl41irPEGix+JVYVESlFrASouINYXD3iWsUFA59uxtpFr0t6XJGkr9ib8FZLt/yza5kr2Hk5C8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745485127;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=J3UW6p735sL0uDpuTdjeAlDlTVS5KOHJnqXmFJV22mw=;
	b=PVQCVxDx9e3a/r7iDgv31fTD2bXDL/+qSkeZBxJWbJ8zNwiBRVfcuBefy6RXabAe
	Sc2ek7+pOwcCZIEVeI1Yum4rlDFRBOahhVZqOXaRDYlQ0yK0R+/u04vJf80yQSppVeh
	WMk3rWdafvd4LohpsEpBvGwUy/zpt8OxbD86yNf4=
Received: by mx.zohomail.com with SMTPS id 1745485124022311.75237554150374;
	Thu, 24 Apr 2025 01:58:44 -0700 (PDT)
Message-ID: <fd4f9f760c4860216aeb58a91a75c24dda64919c.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"
	 <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 24 Apr 2025 10:58:39 +0200
In-Reply-To: <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
	 <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
	 <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_015902_195925_B8D40B35 
X-CRM114-Status: GOOD (  37.46  )
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

Hi Angelo,

On Thu, 2025-04-24 at 09:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/04/25 22:48, N=C3=ADcolas F. R. A. Prado ha scritto:
> > On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud
> > wrote:
> > > On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2
> > > controller is
> > > one but has two ports: one is routed to the M.2 slot, the other
> > > is on
> > > the RPi header who does support full OTG.
> > > Since Mediatek Genio 700-EVK USB support was added, dual role
> > > mode
> > > property is set to otg for ssusb2. This config prevents the M.2
> > > Wifi/Bluetooth module, present on those boards and exposing
> > > Bluetooth
> > > as an USB device to be properly detected at startup, so configure
> > > for
> > > the ssusb2 dr_mode property as host instead.
> > >=20
> > > Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add
> > > USB, TypeC Controller, MUX")
> > > Signed-off-by: Louis-Alexis Eyraud
> > > <louisalexis.eyraud@collabora.com>
> > > ---
> > > I've tested this patch on Mediatek Genio 510-EVK board with a
> > > kernel
> > > based on linux-next (tag: next-20250331).
> > > ---
> > > =C2=A0 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8
> > > +++++++-
> > > =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-
> > > common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-
> > > common.dtsi
> > > index
> > > 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551
> > > dfe7272f242345138 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > > @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 &ssusb2 {
> > > -	dr_mode =3D "otg";
> > > +	/*
> > > +	 * the ssusb2 controller is one but we got two ports :
> > > one is routed
> > > +	 * to the M.2 slot, the other is on the RPi header who
> > > does support
> > > +	 * full OTG but we keep it disabled otherwise the BT on
> > > the M.2 slot
> > > +	 * USB line goes obviously dead if switching to gadget
> > > mode.
> > > +	 */
> > > +	dr_mode =3D "host";
> >=20
> > Hi,
> >=20
> > while I agree with this change, now that this controller is fixed
> > to host mode,
> > the connector child node here which is supposed to probe with
> > driver
> > usb-conn-gpio, which would monitor the ID and VBUS lines and change
> > the USB role
> > as needed, will fail to probe with:
> >=20
> > =C2=A0=C2=A0 platform 112a1000.usb:connector: deferred probe pending: u=
sb-
> > conn-gpio: failed to get role switch
> >=20
> > as indeed there no longer is a role switch registered.
> >=20
> > For that reason, I believe as part of this commit you should also
> > disable the
> > connector. Since role switching is no longer supported by this
> > controller,
> > there's no sense in even trying to probe this driver.
> >=20
> > Thanks,
> > N=C3=ADcolas
>=20
> Can we instead go for role-switch-default-mode =3D "host", with a big
> comment
> in the devicetree saying that the controller is shared between BT and
> the other
> port? :-)
>=20
> Cheers,
> Angelo
Using role-switch-default-mode property (set to host) does work as an
alternative fix in order to keep the dr_mode set to otg and also not
having a error about the connector too.
But I also needed to change the associated GPIO polarity, otherwise the
role mode would remain device and the BT module would not still be
detected.
I'll make those changes in the v2 patch.=20

Regards,
Louis-Alexis

