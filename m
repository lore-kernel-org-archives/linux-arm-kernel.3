Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B21C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DAXmbrE8zqXTQAY6GkRCYerCmbin4dQaPstr9gxE8I=; b=0l7y89gbvxFErV2fq3dx9F5WO2
	YEzTAKd3Uy+GsM0bzpMBnb8mx9elwFlZvqBspRXN1+6aJPAEDF9hDDZpvwvUbZjVAZjch67U+LGJC
	yH+ADTRhngXyHWhPQ72nQLu0gSn9dY8UAfX1TsVm3zk8UYZsYVGMPYSyCCv6zKMTSf59l9BrEoNjt
	d1NgZGMawhwhDZA8RW6V5VpDhE+WsNxvClJrq1agQ2PkugWc9Xl3057yZQoPhnbYPITuHaroyfLri
	2hEkxISAqHmNElGCN8DrIFtgvxPM/jbmNKiYjf6aEsyA663uKxBpMeC70mzNqWncRclUw4cRdgSdd
	X4D3ejuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhzIG-00000006waV-3oVO;
	Fri, 01 Aug 2025 23:36:08 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhzFf-00000006wOK-39P7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 23:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754091196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fRDpJONf2JERzF+xDRjDiRp3hdfkZjeJXIkTdZXG3sMXQN28hvbBdF6IMEGCXWQJMvScVJzB3DlrgRV5me5U+dse416gPm5igVtICCE/wDaqQjyisR6JEoQkgwd7VvT0CcfsqKplIEHWiUaSpKUVdQ3pJUkxPd5vRUseEo0rxP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754091196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7DAXmbrE8zqXTQAY6GkRCYerCmbin4dQaPstr9gxE8I=; 
	b=CVchjrCW+0M8XwWIYaR+72cYjPwXapC1LrNJmeY2luRnJEMgQ2m5P3jGwTYr81FrXm85VkJj6b+5VKOagL+QoKnStu7h6bcGqb/cg3AbryrOp3QSJ3fQxC1C7vOmKuI8MKD/x38CPiHHKfyab4I6JPi0dONRJ2AujaHPpblBkSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754091196;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7DAXmbrE8zqXTQAY6GkRCYerCmbin4dQaPstr9gxE8I=;
	b=Yr6cH3Lhp8Pi4YRozFGQ1tK05GU8nrrXZvthLC0TzLV49md40KMBfDjpxpvie8iI
	fnzxoqwWY46sYmwYsG+wvYhgVY40Fai/TgysxsORTlhRZ90AHmszbiy/b+v8/ziDB0e
	CEnKK/lNdSWcf20kDIIHXYQTvMdLKz6QtT9WffGo=
Received: by mx.zohomail.com with SMTPS id 1754091194526854.8990153374416;
	Fri, 1 Aug 2025 16:33:14 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 69ED9180B4F; Sat, 02 Aug 2025 01:33:11 +0200 (CEST)
Date: Sat, 2 Aug 2025 01:33:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Message-ID: <havjh4auwxxnevxsfyepql4ovfivy36whldr6htlxo6akpen3d@qq535p6qbvmw>
References: <20250506130940.2621554-1-alexander.stein@ew.tq-group.com>
 <4669830.LvFx2qVVIh@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4669830.LvFx2qVVIh@steina-w>
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_163327_860199_1362DBA6 
X-CRM114-Status: GOOD (  15.08  )
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

Hi,

On Thu, Jul 31, 2025 at 11:25:03AM +0200, Alexander Stein wrote:
> Hi,
>=20
> Am Dienstag, 6. Mai 2025, 15:09:39 CEST schrieb Alexander Stein:
> > This driver is used on imx93-tqma9352-mba91xxca.dts.

You need to send this to the i.MX maintainers.

Greetings,

-- Sebastian

>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defcon=
fig
> > index 8691f0ee44e66..550b2505b5658 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -437,6 +437,7 @@ CONFIG_IWLMVM=3Dm
> >  CONFIG_MWIFIEX=3Dm
> >  CONFIG_MWIFIEX_SDIO=3Dm
> >  CONFIG_MWIFIEX_PCIE=3Dm
> > +CONFIG_MWIFIEX_USB=3Dm
> >  CONFIG_MT7921E=3Dm
> >  CONFIG_RSI_91X=3Dm
> >  CONFIG_WL18XX=3Dm
> >=20
>=20
>=20
> --=20
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, German=
y
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneide=
r
> http://www.tq-group.com/
>=20
>=20
>=20

