Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAEAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrCfd4LRI0YthoKkMgXgWQDEDfg201AKOzW91yg3140=; b=iMraVptfUFAGr7ohAe2GnRJTJq
	5f0il/RgvpC/TccgzEUMps0VHlzNQevmL6hr9EzoaCj8gwQiowRSQe3R6oWaJkfttuvi1JkOiUZvF
	OsmuLs7NusOXAl9PTLzzpZGML3ddx0GwVqKze6s1feiEzckyeeA3NqO7/GKLvMRa5BgDdByG8cPc7
	5jo7Vt7qBCHfiolQlsh9HQ0Va22gYM/2VYu89Dwf7wGYH1mHmFjXHsfv38I42Hw9xPJN01DF/Pjpq
	lfBT0UB3OAVWqzbvDCCV1haRDXt6TML8x1pT597wMrhZ+rMWtPQcxru/mVUG9q6pz8t2Zo31gEzR1
	N2UB0niw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAP9-00000006n90-15wi;
	Tue, 24 Jun 2025 20:38:07 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Zk-00000005tne-0XN7;
	Tue, 24 Jun 2025 14:24:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750775065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FtqdH5fHsxD5tdO7RpQju9z7Kg83NOATY3cl0059rNyGDnnP3b9v5JTOlHY6/urmd5nUxZXc5cMU39UUrlA0hWZXJpWRMyKMEIiiJydahC6TEBGh01wTwYzKfZc9tM47Yv7ZorSRTjazwYMRLA06vjhSiZ11hNJyrRlsxIsIBNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750775065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RrCfd4LRI0YthoKkMgXgWQDEDfg201AKOzW91yg3140=; 
	b=ACM7SGKNrUHcbiaQDC0GYK/KK410dR4iCIUK8yPanKSUsXcJp94qDBrO+V9ftpLE50I7K1WyacmNirQxm7/ubHcs85iZMTb/f815+arXp/x/bnTPg2TATcQTUADIyJjJD6TtmoNrnBM8zrI6ey6j0Z8kS8BmBfee6gT2iW1uRVw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750775065;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=RrCfd4LRI0YthoKkMgXgWQDEDfg201AKOzW91yg3140=;
	b=Y9Db3CJu+WCNT9IPnm9GUXLw/oPeRGGIdJ9OZByccR8anQcerUNem9jDBQpmBSh3
	fsEYbTHqEY6/DS4vW0m35Mv3iNeztEuw6kqgWK1dg/nKqVabW6tRDbfUm3XKQIHqKof
	3/O+sJ5oh376h1WzFmpK2W7xZXuOhXJkH5D7VTzw=
Received: by mx.zohomail.com with SMTPS id 1750775063297142.35232576576414;
	Tue, 24 Jun 2025 07:24:23 -0700 (PDT)
Message-ID: <2762e08674df39b79dc169ef3791eaeeaff17d17.camel@collabora.com>
Subject: Re: [PATCH v1 00/13] pmdomain: Partial refactor, add MT8196 support
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, 
 y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, 
 matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org
Date: Tue, 24 Jun 2025 10:24:21 -0400
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_072440_202487_D871160D 
X-CRM114-Status: GOOD (  17.39  )
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

On Mon, 2025-06-23 at 14:01 +0200, AngeloGioacchino Del Regno wrote:
> This series refactors the bus protection regmaps retrieval to avoid
> searching in all power domain devicetree subnodes for vendor
> properties
> to get syscons for different busses, and adds a new property which is
> located in the power controller root node containing handles to the
> same.
>=20
> Retrocompatibility is retained and was tested on multiple SoCs in the
> Collabora lab - specifically, on Genio 350/510/700/1200, and manually
> on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
> Chromebooks.
>=20
> This was tested *three times*:
> =C2=A0- Before the per-SoC conversion in drivers/pmdomain/mediatek
> =C2=A0- With per-SoC conversion code but with *legacy* devicetree
> =C2=A0- With per-SoC conversion code and with *new* devicetree conversion
>=20
> All of those tests were successful on all of the aforementioned SoCs.
>=20
> This also adds support for:
> =C2=A0- Modem power domain for both old and new MediaTek SoCs, useful for
> =C2=A0=C2=A0 bringing up the GSM/3G/4G/5G modem for both laptop and smart=
phone
> use
> =C2=A0- RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity
> 9400
> =C2=A0- Hardware Voter (MT8196/MT6991), allowing ATF, remote processors
> and
> =C2=A0=C2=A0 the AP (Linux) to manage the same power domains through a vo=
ter
> MCU,
> =C2=A0=C2=A0 avoiding power racing
> =C2=A0- Directly controlled power domains for MT8196
> =C2=A0- Voted power domains for MT8196
> =C2=A0- Multimedia (voted) power domains for MT8196.
>=20
> Note that all of the power domains for MT8196 should also work on
> MT6991
> but since I have no Dimensity 9400 boards, even though I'm 99.5% sure
> that
> it will simply work as those are the same, I avoided to add
> compatibles
> for 6991 as it's impossible for me to test.
>=20
> AngeloGioacchino Del Regno (13):
> =C2=A0 dt-bindings: power: mediatek: Document mediatek,bus-protection
> =C2=A0 pmdomain: mediatek: Refactor bus protection regmaps retrieval
> =C2=A0 pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
> =C2=A0 pmdomain: mediatek: Move ctl sequences out of power_on/off
> functions
> =C2=A0 pmdomain: mediatek: Add support for modem power sequences
> =C2=A0 pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
> =C2=A0 pmdomain: mediatek: Add support for Hardware Voter power domains
> =C2=A0 pmdomain: mediatek: Add support for secure HWCCF infra power on
> =C2=A0 pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
> =C2=A0 arm64: dts: mediatek: Convert all SoCs to use mediatek,bus-
> protection
> =C2=A0 dt-bindings: power: Add support for MT8196 power controllers
> =C2=A0 pmdomain: mediatek: Add support for MT8196 SCPSYS power domains
> =C2=A0 pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains

For the entire series,

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I've reviewed this internally before submission)

--=20
Thanks,

N=C3=ADcolas

