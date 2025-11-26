Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F52D10F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3Pb48Eict5MIHFTWo5KBCPk+CLXMHDQJS2pecWv7U0=; b=MuteSMCbJUmuQzz0dvn19sv0dM
	cOJjAbbtCahOD1DV+gAfBDHWKMffxkpTt2f/hGGSMYcJptuTCXjpx2AQvnkiN8Atdb/6o4J5itJR/
	E+odxZb2IFsTsJDS0aKxXMN8XxNFUJ+rXA3lHnJJl01WHJCIs2W0tM9hJJqTXHdDTy6CQfupeQqtb
	Rp6uIW+9H9QMcjHyZQ9n9PeTsgNe63m0bGEaiwMCPbB0Nuq5ubc08B9Jc8WRRLIR0ETN9sz1sZjdB
	2Jq+vlIdts9I23VJFgWImRRzXDqL8apWJ2ULnmUYE+1XMjvAlUXqxhkhulDsAN6fwpVGtXUdzPprk
	3gl+tbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEzv-0000000F0zp-0ccn;
	Wed, 26 Nov 2025 12:51:51 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEzp-0000000F0xE-1iNf;
	Wed, 26 Nov 2025 12:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764161490; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TVw7O+xRO81xQKDOxL6b3InI4Tkrk5n982EQ1YzF4192HP0Jfizh9Q/Ql8HkKswJf6P27lUkKYmZriF7XbX9Xuke4EV9osC7ssDyV7kghvLmedE7QQajFG6EK+E4XE/19MfMgCVEnC21opNKaV2aupeEvhVn2Xjj4KywTPll6Gc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764161490; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q3Pb48Eict5MIHFTWo5KBCPk+CLXMHDQJS2pecWv7U0=; 
	b=i1a7vdxlI+8qmcB2okofPQQZCq971AAQbkriNnwC00eztMdI1bK/3bGPNCprZXXo5MZwNDjHoSXJX4yXQkWalDi8p3UdoKP8CkZCJNfC58LTR87r1uZBph3mLAlsaUSmxYOE8cX+gLJMG5ZzRsZkHS8ayYk+0++T6owD0aXL7Fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764161490;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Q3Pb48Eict5MIHFTWo5KBCPk+CLXMHDQJS2pecWv7U0=;
	b=W7GQD0z/SvUaIDKs8vlKz4H/4Mfizeh6EcozCtPUx8YrLe2ha0NkRCvD17Au7W8A
	aGTwJbF9718OhNX0YHHXLL+6v4XjI3SLU7OBOpPXKNoju8JA+ypfWICV4EOC3trunEc
	ncX55Yi0GDJU+wASgRo6B5RAqDBR0aiahpaNWrEs=
Received: by mx.zohomail.com with SMTPS id 1764161488066506.1829610871971;
	Wed, 26 Nov 2025 04:51:28 -0800 (PST)
Message-ID: <47cb520046a1dab6ea49abd402d3a9647aabf7b0.camel@collabora.com>
Subject: Re: [PATCH] pmdomains: mtk-pm-domains: improve spinlock recursion
 fix in probe
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, 	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Weiyi Lu <Weiyi.Lu@mediatek.com>, Jian Hui Lee
 <jianhui.lee@canonical.com>,  Irving-CH Lin <Irving-CH.Lin@mediatek.com>,
 conor@kernel.org, krzk@kernel.org, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,  MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 26 Nov 2025 13:51:23 +0100
In-Reply-To: <20251125105617.1564725-1-macpaul.lin@mediatek.com>
References: <20251125105617.1564725-1-macpaul.lin@mediatek.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_045145_756541_06049993 
X-CRM114-Status: GOOD (  24.64  )
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

Hi Macpaul,

On Tue, 2025-11-25 at 18:56 +0800, Macpaul Lin wrote:
> Remove scpsys_get_legacy_regmap() and update usages with
> of_find_node_with_property(). Use an explicit of_node_get(np) to
> ensure
> correct node referencing against of_node_put() and ensuring it is
> called
> in a safe context (i.e., not while holding devtree_lock).
>=20
> If fwnode_count_parents() obtains parent nodes via
> fwnode_for_each_parent_node() and this process requires device tree
> operations, it may result in repeated acquisition of devtree_lock in
> the same thread/context, leading to spinlock recursion errors.
>=20
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
> =C2=A0drivers/pmdomain/mediatek/mtk-pm-domains.c | 21 ++++++-------------=
-
> -
> =C2=A01 file changed, 6 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 80561d27f2b2..f64f24d520dd 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -984,18 +984,6 @@ static void scpsys_domain_cleanup(struct scpsys
> *scpsys)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static struct device_node *scpsys_get_legacy_regmap(struct
> device_node *np, const char *pn)
> -{
> -	struct device_node *local_node;
> -
> -	for_each_child_of_node(np, local_node) {
> -		if (of_property_present(local_node, pn))
> -			return local_node;
> -	}
> -
> -	return NULL;
> -}
> -
> =C2=A0static int scpsys_get_bus_protection_legacy(struct device *dev,
> struct scpsys *scpsys)
> =C2=A0{
> =C2=A0	const u8 bp_blocks[3] =3D {
> @@ -1017,7 +1005,8 @@ static int
> scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
> =C2=A0	 * this makes it then possible to allocate the array of
> bus_prot
> =C2=A0	 * regmaps and convert all to the new style handling.
> =C2=A0	 */
> -	node =3D scpsys_get_legacy_regmap(np, "mediatek,infracfg");
> +	of_node_get(np);
> +	node =3D of_find_node_with_property(np, "mediatek,infracfg");

with a kernel based on next-20251125 plus this patch, my Mediatek Genio
350, 510 and 1200 EVK boards booted OK.

About the patch itself, it looks that you try to balance the
of_node_put() done by of_find_node_with_property() on its `from`
parameter (np in this case):=20
https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/of/base.c#L1066

Your patch description is a bit unclear about that and could be
reworded.

I'm not sure if it is the proper way to use the
of_find_node_with_property API, seems a bit hacky. Though, I found=20
similar sequences for other of_find_* calls (like
of_find_compatible_node or of_find_node_by_name) in the `from is not
null` case but not all the times. Hope someone else can confirm if
using of_node_get before calling these API is OK.

Finally the patch also misses the Fixes tag since it is a follow up
one.

Regards,
Louis-Alexis

> =C2=A0	if (node) {
> =C2=A0		regmap[0] =3D syscon_regmap_lookup_by_phandle(node,
> "mediatek,infracfg");
> =C2=A0		of_node_put(node);
> @@ -1030,7 +1019,8 @@ static int
> scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
> =C2=A0		regmap[0] =3D NULL;
> =C2=A0	}
> =C2=A0
> -	node =3D scpsys_get_legacy_regmap(np, "mediatek,smi");
> +	of_node_get(np);
> +	node =3D of_find_node_with_property(np, "mediatek,smi");
> =C2=A0	if (node) {
> =C2=A0		smi_np =3D of_parse_phandle(node, "mediatek,smi", 0);
> =C2=A0		of_node_put(node);
> @@ -1048,7 +1038,8 @@ static int
> scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
> =C2=A0		regmap[1] =3D NULL;
> =C2=A0	}
> =C2=A0
> -	node =3D scpsys_get_legacy_regmap(np, "mediatek,infracfg-
> nao");
> +	of_node_get(np);
> +	node =3D of_find_node_with_property(np, "mediatek,infracfg-
> nao");
> =C2=A0	if (node) {
> =C2=A0		regmap[2] =3D syscon_regmap_lookup_by_phandle(node,
> "mediatek,infracfg-nao");
> =C2=A0		num_regmaps++;

