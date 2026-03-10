Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3525AF41808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+sKkqEen+FTZVcatdq7BWmJBRObIwAqW8MBSeFsbCg=; b=fHITspOJUhH+ymLN/ZUONQAGNn
	VMVeiiuDwiST9IN7d9reKLGhFFi/xGh80HgfHPERLtTvKLTkICNN6Z9c4HSEzrTTe9wS5oz+nN54t
	tlkK000uxma3azRCOlf7UNTTTdUSmVkpBJZXUVrNiB3Fdt6xwwLDvDM8DA7OEC9FH+ALcEpJTRJ/L
	WDkq2wHR9Vu7uI0GvQG2wcdTBF9YXiGwIrWZbHFp86zgBf5sLuTxPeslbtFNimAOeKGLegvwqjo13
	xnKfT+VZ62e/e0LXj2oJYIiQCc99Qg6jgI65DGs3/5lu7U6lTLpEtu10dLjSC3ef6kvpgjEwORkZy
	oaF1Tlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4h-000000092VJ-27uz;
	Tue, 10 Mar 2026 09:08:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4e-000000092T7-0tTH;
	Tue, 10 Mar 2026 09:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=x+sKkqEen+FTZVcatdq7BWmJBRObIwAqW8MBSeFsbCg=; b=2P8w16KW4mcJ4VoQcD9GwW+Aaw
	LPnWPTjV+iBSgpGU8VvlZBgivFQ41jbbUv9xPLTe0UGiC2O/TtxW9n87YjtaKXtEvok+d9X3m90n3
	88MyVWdnk4KdCug4lCgmQ65VmF5YA3tIEvuVR5jNAJV+kyyiI3aJ/12D7cJW361aI64t62QfKt+G8
	DpRgtf8aKTCqaf2K91HStN6cfzfIMJzfn16r4ZEdGteuKTcM5375CxPjFb+Zcjq9TyhP53oWNANrb
	QG5VUTphEsm3do+5av7k096Uzt/+LkiRWIWXHy5//oKgMhx3VYbZAmsubGNimoJORazjXzWfE9QP0
	iOm5zq+A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Tue, 10 Mar 2026 10:08:07 +0100
Message-ID: <2772778.X9hSmTKtgW@phil>
In-Reply-To: <20260310083752.ms6u4qpy3snl4h6w@skbuf>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <2218670.OBFZWjSADL@phil>
 <20260310083752.ms6u4qpy3snl4h6w@skbuf>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020820_252540_E1A53DBC 
X-CRM114-Status: GOOD (  20.56  )
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

Am Dienstag, 10. M=C3=A4rz 2026, 09:37:52 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Vladimir Oltean:
> On Tue, Mar 10, 2026 at 09:24:43AM +0100, Heiko Stuebner wrote:
> > Am Montag, 9. M=C3=A4rz 2026, 20:08:28 Mitteleurop=C3=A4ische Normalzei=
t schrieb Vladimir Oltean:
> > > The dw_hdmi-rockchip driver validates pixel clock rates against the
> > > HDMI PHY's internal clock provider on certain SoCs like RK3328.
> > > This is currently achieved by dereferencing hdmi->phy->dev.of_node
> > > to obtain the provider node, which violates the Generic PHY API's
> > > encapsulation (the goal is for struct phy to be an opaque pointer).
> > >=20
> > > Refactor dw_hdmi_rockchip_bind() to perform a manual phandle lookup
> > > on the "hdmi" PHY index within the controller's DT node. This provides
> > > a parallel path to the clock provider's OF node without relying on the
> > > internal structure of the struct phy handle.
> > >=20
> > > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > ---
> > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> > > Cc: Andy Yan <andy.yan@rock-chips.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > >=20
> > > v1->v3: none
> > > ---
> >=20
> > [...]
> >=20
> > > @@ -588,13 +589,17 @@ static int dw_hdmi_rockchip_bind(struct device =
*dev, struct device *master,
> > >  		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
> > >  	}
> > > =20
> > > -	if (hdmi->phy) {
> >=20
> > nit: a comment would be nice here. I.e. hdmi->phy being an opaque point=
er
> > so checking hdmi->phy !=3D NULL is not possible.
> >=20
> > With that being a "goal", I assume that information is not widely spread
> > so this would prevent the next developer trying to change it back to
> > "if (hdmi->phy)" while that handling change trickles down.
>=20
> Testing the NULL quality of "struct phy *phy" is still possible and legal.
> It means that you called an "optional" variant of phy_get(), and there
> was no PHY.

ok, I'll keep that in mind :-)


Heiko



