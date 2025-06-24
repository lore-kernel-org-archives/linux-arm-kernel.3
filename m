Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C2FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+XTKpEiNYrYrQNEx7zBBd9tGAKVmroU4kJyUaRvTlY=; b=ewOi1n3KbAVGrqpfyonncaEU7i
	fLO9JrVtsK6WYN6SJUqhtHUpTHO/SSYtjsPifRFOlSFnO4jNubIEjx4b/Z55ituFFhkAklXJeuKiz
	lVTf8OgwnU1FLHTVDcqBcJcQbqp62DLrmbPi9kWwS+afMWeGB4mYEfTF3zlNIduechrm2kBAZ2fG2
	3SWnHdUkNVxlp2LWvJoP9VeH5NnS6/TvC4TDFjtvsCIzRJZs2FK7l6jpLaIebKA/Bho0czj7Mn6VG
	YDOddLQrTkS67hqpnWF4tF6E6/WULwKhExzPhNhbpBXKtqK8PXnwZ6UuJLlGAKIpQFiu+LJvN0ocM
	CEEBz9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAzQ-00000006r4w-3s9k;
	Tue, 24 Jun 2025 21:15:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5ti-00000006BdC-1nEW;
	Tue, 24 Jun 2025 15:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750780152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nhM6xzFKQLignkPZ/NGXslADyUBs01OBDRtEGhcYbEZLQGf8X++La8SK8bC4+Ep+pG4NDeBk7ldt/PmAcUwHLQAhHIBkrJl+G2icqEjZGA88um/8uXeLESnCeveaO2Sqlx2ssV+EZHeA04IQK4nTIlbJQ+7JJzoWL2lDvcLidTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750780152; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3+XTKpEiNYrYrQNEx7zBBd9tGAKVmroU4kJyUaRvTlY=; 
	b=fslOD0wYoTicBABQ5dKJGop85WUGIP8Gf7QKyA66Q36NNT+f9XEPfE6a9cQpNesBZuqe2kgLSDPkO+dfvDn5u9qbPyRpHBivsWb0QxEAVyKVGmpCEzrib0a75B05/cYjHkJhNxrq1JkFsVCMmbClNIhuL/wQtsLnpwLAcWK3ocE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750780152;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=3+XTKpEiNYrYrQNEx7zBBd9tGAKVmroU4kJyUaRvTlY=;
	b=Mf+1u2nZer5UaeOmVDDAG1ecTp+wTtSEGZa9C3cYt9i/q4ByEvX5DGQq90zHOwAn
	2/GOLXkRK5exFiNuHju7XzqZIHCmL20orHuNSEIRGWVBLR9FlyMSJlOokbhtLDnXggx
	bYiEGIiz6n8lHpUWi/XVRSNEguEbKc1oG0rnjXyc=
Received: by mx.zohomail.com with SMTPS id 1750780149757734.6410007359632;
	Tue, 24 Jun 2025 08:49:09 -0700 (PDT)
Message-ID: <c05ff44f1df5276a0a548cbfc7589d45520a54bb.camel@collabora.com>
Subject: Re: [PATCH v2 00/29] Add support for MT8196 clock controllers
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  netdev@vger.kernel.org,
 kernel@collabora.com
Date: Tue, 24 Jun 2025 11:49:07 -0400
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_084922_510906_C8BF219E 
X-CRM114-Status: GOOD (  14.70  )
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

On Tue, 2025-06-24 at 16:31 +0200, Laura Nao wrote:
> Add support for MT8196 clock controllers
>=20
> This patch series introduces support for the clock controllers on the
> MediaTek MT8196 platform, following up on an earlier submission[1].
>=20
> MT8196 uses a hardware voting mechanism to control some of the clock
> muxes
> and gates, along with a fence register responsible for tracking PLL
> and mux
> gate readiness. The series introduces support for these voting and
> fence
> mechanisms, and includes drivers for all clock controllers on the
> platform.
>=20
> [1]
> https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek=
.com/
>=20
> Changes in v2:
> - Fixed incorrect ID numbering in mediatek,mt8196-clock.h
> - Improved description for 'mediatek,hardware-voter' in
> mediatek,mt8196-clock.yaml and mediatek,mt8196-sys-clock.yaml
> - Added description for '#reset-cells' in mediatek,mt8196-clock.yaml
> - Added missing mediatek,mt8196-vdisp-ao compatible in
> mediatek,mt8196-clock.yaml
> - Fixed license in mediatek,mt8196-resets.h
> - Fixed missing of_match_table in clk-mt8196-vdisp_ao.c
> - Squashed commit adding UFS and PEXTP reset controller support
> - Reordered commits to place reset controller binding before
> dependent drivers
> - Added R-b tags
>=20
> Link to v1:
> https://lore.kernel.org/all/20250623102940.214269-1-laura.nao@collabora.c=
om/
>=20
> AngeloGioacchino Del Regno (1):
> =C2=A0 dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
>=20
> Laura Nao (28):
> =C2=A0 clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable
> control
> =C2=A0 clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and
> FENC
> =C2=A0 clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and
> =C2=A0=C2=A0=C2=A0 FENC
> =C2=A0 clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
> =C2=A0 clk: mediatek: clk-mux: Add ops for mux gates with HW voter and
> FENC
> =C2=A0 clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use
> =C2=A0=C2=A0=C2=A0 mtk_gate struct
> =C2=A0 clk: mediatek: clk-gate: Add ops for gates with HW voter
> =C2=A0 clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
> =C2=A0 dt-bindings: clock: mediatek: Describe MT8196 peripheral clock
> =C2=A0=C2=A0=C2=A0 controllers
> =C2=A0 clk: mediatek: Add MT8196 apmixedsys clock support
> =C2=A0 clk: mediatek: Add MT8196 topckgen clock support
> =C2=A0 clk: mediatek: Add MT8196 topckgen2 clock support
> =C2=A0 clk: mediatek: Add MT8196 vlpckgen clock support
> =C2=A0 clk: mediatek: Add MT8196 peripheral clock support
> =C2=A0 clk: mediatek: Add MT8196 ufssys clock support
> =C2=A0 clk: mediatek: Add MT8196 pextpsys clock support
> =C2=A0 clk: mediatek: Add MT8196 adsp clock support
> =C2=A0 clk: mediatek: Add MT8196 I2C clock support
> =C2=A0 clk: mediatek: Add MT8196 mcu clock support
> =C2=A0 clk: mediatek: Add MT8196 mdpsys clock support
> =C2=A0 clk: mediatek: Add MT8196 mfg clock support
> =C2=A0 clk: mediatek: Add MT8196 disp0 clock support
> =C2=A0 clk: mediatek: Add MT8196 disp1 clock support
> =C2=A0 clk: mediatek: Add MT8196 disp-ao clock support
> =C2=A0 clk: mediatek: Add MT8196 ovl0 clock support
> =C2=A0 clk: mediatek: Add MT8196 ovl1 clock support
> =C2=A0 clk: mediatek: Add MT8196 vdecsys clock support
> =C2=A0 clk: mediatek: Add MT8196 vencsys clock support

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I internally reviewed it before submission)

--=20
Thanks,

N=C3=ADcolas

