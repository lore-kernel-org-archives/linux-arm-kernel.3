Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C2DCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3KpDXgFCAnQkBfYlVPDB0FnslGkY39PA015X6zVYj0=; b=u3bLg6ANnWQ9B+ZQ/mSrxCF5Mt
	ywQUywWno9AazRD39frWguzk2cUXHi/Lk89krnylwn3JQYY50XwyjjsLq1X/eByUn1Lq+ADvEQITs
	8Tmkt2S6VOsTUy+VINxiCKBnQwma1OR9PNfNYuJrSfd9GRXXKLk73LU1ScIQjSPnafsLDh431eQrd
	0QgElHDEMUeaA823+4p6jK1TUh1SFrEao48Y9oPXY3X8/s2reURYHxw29agl3opDDgauFkQ+lKFR3
	4cEg6rKpWbTSZW4I3Ww30c78Q8jxm7VO5KcZHU+94Dt0UrDBE0SWyJ0JOrdSYlEzbYuWG5NmFg5kq
	rqH3b8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPbg-0000000DVKT-2zgR;
	Mon, 11 May 2026 12:19:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPbe-0000000DVJO-0KRp;
	Mon, 11 May 2026 12:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778501937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YzVK4hvLbtCl9NpyRB3GWuSOYS3kV0KUDNWZi9XZNTt2iYuf6UYHbbNYZWsRuDzQPEv/VsrcpLL9z5Mt+LPnfKEePnvt0MkjUaBLX1QgTQ3VjMwhyvBdGPLA8rh0gUDXGmAYp2ZW1Bh+CzSyeYElwWMmo1TofX2vVEbUY0GXc8A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778501937; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e3KpDXgFCAnQkBfYlVPDB0FnslGkY39PA015X6zVYj0=; 
	b=DzRpRTKFrXjL+nwK9M/yODt8RUaLXrvsopbDOLQydTLTMGODfKiTufvJqoRMsVBEOBllX08F58iglJwkykK5ZbIl3dDbW7JoW2sg5Xs8wAYAgpXJ8ZINBP0E9LLu9zqS1M0mFy4V0Xd8iIkPS2guQJz8cpd3xpNGWFkEmMd6lR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778501937;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=e3KpDXgFCAnQkBfYlVPDB0FnslGkY39PA015X6zVYj0=;
	b=kWM8oXpVV/vf2I9SOZYxwamB054/t0Z4fI6yzV92fBRgFDBs/r/2Io2pMytOw8En
	2jT5A8YJo1a0XlciPSxIQFMXy6T+9rVro6CrDIN9x95RkZLlVngsPB6srKULRi21ClG
	YESxMCb8hQowltd6AaESLw1zanniqhGuPXp5JtOg=
Received: by mx.zohomail.com with SMTPS id 1778501935318366.15850500485783;
	Mon, 11 May 2026 05:18:55 -0700 (PDT)
Message-ID: <c7349f39fd10feed71e1188bcbb24f348451ab75.camel@collabora.com>
Subject: Re: [PATCH net-next v2 3/4] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Heiner Kallweit	
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, 	kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 14:18:49 +0200
In-Reply-To: <d7580b92-f165-4135-85b9-ec89a2568949@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
	 <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
	 <3bd7803d-4c4a-4f61-9434-a6bf25627b58@lunn.ch>
	 <9f569ba00b959b701a7a51bcd7347c1a108a15ee.camel@collabora.com>
	 <d7580b92-f165-4135-85b9-ec89a2568949@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_051930_171653_61BD8FC7 
X-CRM114-Status: GOOD (  22.35  )
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

Hi Andrew,

On Thu, 2026-05-07 at 23:36 +0200, Andrew Lunn wrote:
> On Thu, May 07, 2026 at 02:11:54PM +0200, Louis-Alexis Eyraud wrote:
> > Hi=C2=A0Andrew,
> >=20
> > On Thu, 2026-03-26 at 13:30 +0100, Andrew Lunn wrote:
> > > > @@ -480,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct
> > > > phy_device *phydev)
> > > > =C2=A0{
> > > > =C2=A0	int ret, reg_value;
> > > > =C2=A0
> > > > -	ret =3D air_buckpbus_reg_write(phydev,
> > > > EN8811H_FW_CTRL_1,
> > > > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > > > EN8811H_FW_CTRL_1_FINISH);
> > > > +	ret =3D air_phy_buckpbus_reg_write(phydev,
> > > > EN8811H_FW_CTRL_1,
> > > > +				=09
> > > > EN8811H_FW_CTRL_1_FINISH);
> > >=20
> > > Is a rename required? Is the namespace air_buckpbus_ used
> > > somewhere
> > > else?
> > >=20
> > > 	Andrew
> > Sorry for the delay.
> >=20
> > The air_buckpbus_ namespace is only used in the air_en8811h driver.
> > It seemed better to me that in the new air_phy_lib, all functions
> > (the
> > buckpbus accessors and air_phy_read/write_page functions) started
> > with
> > the same prefix. That is the reason I renamed them, even if not
> > required.
> >=20
> > As an alternative, to avoid renaming those buckpbus function calls
> > on
> > air_en8811h driver and reduce this patch changes, I can add macros
> > at
> > the beginning of the file such as:
> > ```
> > #define air_buckpbus_reg_write(_phydev, _pbus_address, _pbus_data)
> > \
> > 	air_phy_buckpbus_reg_write(_phydev, _pbus_address,
> > _pbus_data)
>=20
> No don't do this.
>=20
> If you want to rename them, rename them. But do it in a patch which
> only contains a rename. That is easier to review, and more obviously
> correct.
I'll add in v3 a new patch to rename the functions and the calls in
air_en8811h.c then.

Best regards,
Louis-Alexis

>=20
> 	Andrew

