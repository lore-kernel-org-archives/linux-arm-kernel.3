Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D3ECAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26YfjhR80XqVvp3T4GXiOY1ZVSaa9CIx9x33j2hmPnU=; b=MctvGVqzwvCj6IkHsfzaC5Cv9i
	qTOp7H7iSFcktTAZ/DzuX3oEmdzJyCfF5qxPmJE9EWZ0QUOR/5COha6BPa5YcFcPt6yuR7mHKcJpo
	cE7XmbO0Zt0smYU6YE7JGV9xGn5HkOepGVDXzVTflLZNzGuG3DSCL4CeFHmVty11rdNWQUjNJDME3
	hfxZ6Cp/NNGhZiAMkPkN/TQELtO+Th2P2Rhh9QYiKaBFPV3nnUjQDvp3kielGfY6Mz0ATYSjKIdop
	VfJEch5F7gJy6YelMyPEjMdOX8PqM4bwfPeHPqO8PPN8RuY5gs49ihC+kLODYB6xcY3okGXjo4UjO
	yarXIwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29RY-00000001zaD-2fYr;
	Fri, 26 Sep 2025 14:29:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29RW-00000001zYj-0PN9;
	Fri, 26 Sep 2025 14:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758896933; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LiL02BSGQZ5ytPMrAU7fzsgyGu004PQCrF+o3pkV49Gn0Naaaagx2MrWv8h17/ieZ++pzWEfHBvf/QnC+C2tT3Lqwdy8XJEmdpTIgk/xQZMvzFmAmuTDyr0ujrlEnijRtUQTEuHzXmHxHlbtwTYEewNRPkXAGCziAJ77cqhCoMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758896933; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=26YfjhR80XqVvp3T4GXiOY1ZVSaa9CIx9x33j2hmPnU=; 
	b=Arha/5GW8rJzpUz+TOpn+9ORBNoQxtxhJFG8vE5Gqzi3c40hk6jfC6gyiNNq922ZO7waYSY3++nyDIH4eFUp1ICjzqU4xjhQeXgx/VvyonGqoY5DWiWfot+uZ0UtAettFA1wFwjCC2KXKfIJMuqRQm2U6USOWeFUfomqE5kZPCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758896933;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=26YfjhR80XqVvp3T4GXiOY1ZVSaa9CIx9x33j2hmPnU=;
	b=FuugvlCaYubKjIun3Ml+KCPMgmQsDCkyyh/gcIASO2PnatTX1la4+bNybAn2e/MG
	Ol4fJBOMpEHcovpSXMfBvJvsmeTLv927ykfl4RNovCHrf/OZrR/I9UlFcgzWpdu651M
	KNKe2Utdu20BgSVudn6qATfOCn47yxZYm3wY6A9A=
Received: by mx.zohomail.com with SMTPS id 1758896931799989.2968902254092;
	Fri, 26 Sep 2025 07:28:51 -0700 (PDT)
Message-ID: <638b9565b90714f56caa9535b7b9b96cd86100d6.camel@collabora.com>
Subject: Re: Support for Rock PI-4b
From: Sjoerd Simons <sjoerd@collabora.com>
To: Mostafa Saleh <smostafa@google.com>, devicetree@vger.kernel.org, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Heiko Stuebner
	 <heiko@sntech.de>
Date: Fri, 26 Sep 2025 16:28:48 +0200
In-Reply-To: <CAFgf54oYjUEg9KkQUzneYTZH1Z8cX56va5M0853eWPFaYT+Z2A@mail.gmail.com>
References: <CAFgf54oYjUEg9KkQUzneYTZH1Z8cX56va5M0853eWPFaYT+Z2A@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_072902_373888_EED2D381 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, 2025-09-26 at 15:07 +0100, Mostafa Saleh wrote:
> Hi,
>=20
> I am trying to run Linux[1] on my Rock PI-4b, which I see is supported in
> the kernel in =E2=80=9Crk3399-rock-pi-4b.dts=E2=80=9D.
>=20
> However, compiling =E2=80=9Cdefconfig=E2=80=9D (ARM64) and flashing my Im=
age doesn=E2=80=99t
> work,
> It just hangs before any console (even with earlycon), I tried to also us=
e
> some of the vendor configs with no luck.
> I did some research and found that [2], which indicates that the upstream
> support has been broken for some years?

We've got the Rock 4b in our automated testing lab as part of kernelci and =
other
efforts. Upstream works just fine on those boards, so it's likely an issue =
in
your setup.

See e.g https://lava.collabora.dev/scheduler/job/19978558#L525 for a recent
upstream kernel boot.

Regards,
  Sjoerd


>=20
> Has anyone tried to flash a recent kernel successfully on it? or any
> tips are greatly appreciated.
> Otherwise, maybe it can be removed to avoid misleading other developers
> (I got this board to do some upstream kernel development on)
>=20
> [1] base: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
> [2] https://wiki.radxa.com/Rockpi4/dev/kernel-mainline
>=20
> Thanks,
> Mostafa
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

