Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59182C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRVbSKooV5q3Z4t54uJjI032LrLl8u3rgOm1tgXb0/8=; b=nqa+Fbg0wwGIQwoDxKvWn5YUzM
	PvHo9Mls/gk1vnIU1K1JidM1b4NuLC1fv4dEPgs2TEEjPIMw4OcXogbWgblGAEsO2e4XKDqDZePCq
	YDX7FvVrjqkRUgjfJ+s4d31/qzQCmSk/FcFmwMq2GU+u9d4IP2gLJAL+phtPwQGvcqYxEpbthcwxY
	VCbigcjNnus4SWCQ7eOFOwlqTvk1Rc6eu3bljF7GXvF5rw0B6Xwdjk+SzpDQvR7BoZ9sqx8+rpEe0
	1saevoKq0n0LXODWGAgBZ91wXKGSSxvQoUV+tZalFZa1f4yVzCJVlijZQvCkBNOghzlrh3xZGKMNa
	Cd6ZC9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wyy-00000004wn9-006z;
	Tue, 22 Sep 2026 09:40:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wyx-00000004wmo-0MXW;
	Tue, 22 Sep 2026 09:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D37D74378E;
	Tue, 22 Sep 2026 09:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6039F1F000FF;
	Tue, 22 Sep 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070010;
	bh=nRVbSKooV5q3Z4t54uJjI032LrLl8u3rgOm1tgXb0/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gttJZJIBPU6yu49JQW497DsdD8cozyJ6vUM3kJULoUGE2U6C5TBBOiLDcgTXzoW5s
	 r54ouAgn/p1PiAu/M8BLBtn9v22T2gk60BUpP9H1UT8Jnw+HCTCcslu0Vsjx3kh2PQ
	 I/ajRu55o/ja688x5llRyteWYPbzAVxKyDBSZahp5KNUjh69KPPyW5w8DKt11R9wAL
	 fxoijxvB1W+e9DBJOvD+jN2CD9C2Jrl4O57ze6rk/egwUn4r6ptQUhNX4CyXReELrp
	 ZGuf1MZPx6CA8o45CANtck5zr5LC60m1XA7/y1Wooil53FhqFztVkyOYbcZyF2Ve73
	 lfR05hyPldLAA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E0A4C1AC56BF; Tue, 22 Sep 2026 10:40:06 +0100 (BST)
Date: Tue, 22 Sep 2026 11:40:06 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
Message-ID: <arJM9sXdWfwG8pTH@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rq4GwTtm5EILK4PO"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.
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


--Rq4GwTtm5EILK4PO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 20, 2026 at 02:53:54PM +1000, James Calligeros wrote:
> Setup V/ISENSE on codec probe rather than doing so on every hw_params
> or TDM slot call so that it is configured at the same time as the
> rest of the codec.

> +	if (tas2764->v_sense_slot != -1 || tas2764->i_sense_slot != -1) {
> +		ret = tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i_sense_slot);
> +		if (ret < 0)
> +			return ret;
> +	}

What might set the slots to -1?

--Rq4GwTtm5EILK4PO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyTPYACgkQJNaLcl1U
h9A8Dgf/YVxxeDNgI8TYSdUtT7k8WyvNOdz9s9sSy/9K9LFtGc457BfdNkxhMOwk
BwRLKLqWCYtxLE6kA/pJ8BUUD0a4xZxtY8UwzDlBPYMiYoNhD6eKizxRlGxC8VJ0
6QG0qKj9EYAspe2MJkeuT9CjkGiYwPHmTNd11L+bgNbEJRJQvVDKq0Ge16dGwQsf
/uZr/G9wABPzJ04wvZD25hNy+IFHM7bcZkjkw7camfmIZBCcldUpPJ0IT4aGqDTs
zNB1cxG6WBB/qdz9bCt2xMyBBXw66bzVsZZ2un4XXtm4xV2LSzZq13G4IMiahJ/j
aGqvygWw91+YFiO2Oo8tiyNTWKqltA==
=5PVF
-----END PGP SIGNATURE-----

--Rq4GwTtm5EILK4PO--

