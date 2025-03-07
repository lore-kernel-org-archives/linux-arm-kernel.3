Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED1DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kyh/EqafZh5PQLWdjIRt5VN4gh3W0cOZEz2DWuYVL3E=; b=GPboCpexuKQ6hD5I0B6YZmPDZA
	vdErvVI4nnGHFZIpG00+7CWPVfd6BIlBKaoi6nFPCKule0kHW8MmwPwdbAGuXiChhA00bQdG5bK1n
	t12FqWkUoTN+J5j9AuulkcOMBaVPjjoZ99Rte72NogyWEgC6UzgB3i4oU3hom5bv4ForWPOeJ9gjE
	bK1t/GA0e8TiUJoB20eji/DctIU5LV4WsZmh/S0beJSwEypnGuymSmDuJTE/iQ20/PgMTTalKfk3E
	IOUTlSzUprFIxlg4pzZ36YOsTYihsPe16F74e2kFTA/xPs5iYJ+SobeXMlz7V41s+ciAfGZVnjh7W
	4zrzBXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqd1M-0000000FHZz-1pX3;
	Fri, 07 Mar 2025 19:06:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqczj-0000000FHJL-145T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 19:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30CA15C5EAA;
	Fri,  7 Mar 2025 19:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FC4C4CED1;
	Fri,  7 Mar 2025 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741374265;
	bh=LZxlQy480B8XB9W2bL3qE02TAbT/sG5jtfYMZ1zrq+o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RyXqhtQZ5KUWy0AhGDI964MIE339CWMEPxfiMElmViRFSYblTU12jNzw1zu3p6wY9
	 oHok6mKCkgxMWYDEEkRVkfAgVHLn3M4X8YvEpl1BysA7aCj164Mwv6b6VifZXNdDj/
	 GUWojKq1i3mhDolSUK9Hw+DzaI/kK20wmPa8ag+GD06/sP3BQRF68WOcSnrZKyBOSR
	 mZe5N7gGZm5PZHQqaXu5PRJiGxTn8rxn3fxBdHcJJ5Mbb4qWfCX47CpWdW91GafZ72
	 icT+hCw9/wm4PcXL+HlmPF6OYT6GwOVUlytw/WkSJlP4eEFf0BaMhPmjXk4lrKoEUN
	 64eIPl4R+jWYw==
Message-ID: <725811bfa06a86f47a90f84ade2d1461.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org> <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
Subject: Re: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe() to avoid __refdata
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Mar 2025 11:04:23 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_110427_381772_6BC18EF3 
X-CRM114-Status: GOOD (  10.24  )
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

Quoting Andr=C3=A9 Draszik (2025-03-07 06:29:18)
>=20
> I've tried this on top of next-20250225, and it doesn't work on gs101
> either and OOPSes several times during boot in different places, but
> I can not dig deeper right now.
>=20
> [   11.502919][   T58] Unable to handle kernel paging request at virtual =
address ffffbfe2ab25cc30
> [   11.503128][   T58] Mem abort info:
> [   11.503202][   T58]   ESR =3D 0x0000000096000007
> [   11.503295][   T58]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [   11.503419][   T58]   SET =3D 0, FnV =3D 0
> [   11.503498][   T58]   EA =3D 0, S1PTW =3D 0
> [   11.503579][   T58]   FSC =3D 0x07: level 3 translation fault
> [   11.503695][   T58] Data abort info:
> [   11.503769][   T58]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x000000=
00
> [   11.503896][   T58]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [   11.504058][   T58]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D=
 0
> [   11.504288][   T58] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000=
00008208c000
> [   11.504570][   T58] [ffffbfe2ab25cc30] pgd=3D0000000000000000, p4d=3D1=
000000082a58003, pud=3D1000000082a59003, pmd=3D1000000082a5d003,
> pte=3D0000000000000000
> [   11.505079][   T58] Internal error: Oops: 0000000096000007 [#1] PREEMP=
T SMP
> [   11.505346][   T58] Modules linked in:
> [   11.505495][   T58] CPU: 6 UID: 0 PID: 58 Comm: kworker/u32:1 Tainted:=
 G                T  6.14.0-rc4-next-20250225+ #12
> [   11.505902][   T58] Tainted: [T]=3DRANDSTRUCT
> [   11.506061][   T58] Hardware name: Raven (DT)
> [   11.506230][   T58] Workqueue: events_unbound deferred_probe_work_func
> [   11.506477][   T58] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> [   11.506768][   T58] pc : __device_attach_driver+0x18/0x254
> [   11.506978][   T58] lr : bus_for_each_drv+0xfc/0x154
> [   11.507168][   T58] sp : ffff8000803abc00
> [   11.507321][   T58] x29: ffff8000803abc10 x28: ffff00ed403363d0 x27: f=
fff00ed40336400
> [   11.507620][   T58] x26: 0000000000000000 x25: ffff00ed4002380d x24: f=
fff00ed40028000
> [   11.507919][   T58] x23: ffffbfe2aba26000 x22: 0000000000000000 x21: f=
fff00ed409f8400
> [   11.508219][   T58] x20: ffff8000803abca8 x19: ffffbfe2a9a4cf4c x18: 0=
000000000000040
> [   11.508518][   T58] x17: 0000000000000001 x16: 0000000000000001 x15: 0=
000000000000010
> [   11.508817][   T58] x14: 0000000000000010 x13: 0000000000000093 x12: 0=
000000000000002
> [   11.509117][   T58] x11: ffffffffff6070d2 x10: 0000bef56a420260 x9 : 0=
000000100000000
> [   11.509416][   T58] x8 : 0000000100000000 x7 : ff7f7f7f7f7f7f7f x6 : 4=
55242436f53531d
> [   11.509715][   T58] x5 : 1d53536f43425245 x4 : 0000000000000000 x3 : e=
8c6e6e4bec6c65a
> [   11.510015][   T58] x2 : 0000000000000062 x1 : ffff8000803abca8 x0 : f=
fffbfe2ab25cc28
> [   11.510315][   T58] Call trace:
> [   11.510436][   T58]  __device_attach_driver+0x18/0x254 (P)
> [   11.510644][   T58]  bus_for_each_drv+0xfc/0x154
> [   11.510819][   T58]  __device_attach+0x100/0x1cc
> [   11.510996][   T58]  device_initial_probe+0x14/0x20
> [   11.511182][   T58]  bus_probe_device+0x94/0x100
> [   11.511359][   T58]  deferred_probe_work_func+0xa0/0xfc

platform_driver_probe() is incompatible with deferred probe. It
should have set drv->prevent_deferred_probe to true so the driver must
have gotten onto the deferred probe list somehow when it shouldn't have.

