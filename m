Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF229D6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY4/2c8C+DeLPYZmSS72l0HDYcRT8AK2R4LsC3Dy15Y=; b=ZEiD5t4HNhKIy17ZZDu1tai0fa
	Vnki4ErESFpuORtkF5XHqM37ZySupAgGdBsii6vRn+2v1JKQwoK6TUxlhL1p0ECoCkkngN0aqGfrU
	Xu3JtcVRHaU8WFRJBDb861k8/sxY66+H+RfPuzy0zBtyhPueFz5v0zPgy5XFdV4vg2VDTr76wWkf/
	B8wTUgf+Bms27+pvJzXRQv4Nz0xmtRK7+cmBCrTwBu3K4oSJB7Y5nprsb4E+rXcuR6ItWk+4VVllC
	FzXiI7o9p0pHPfny8R430L8p6pBL9XhYj///T/A8GmswGk7mgw0b4x8xOhvQKplcJNADMSq+IlbnQ
	Qbiv034A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ed-00000007z6B-04sE;
	Fri, 23 Jan 2026 01:45:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ea-00000007z5F-0rm8;
	Fri, 23 Jan 2026 01:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57A8E60018;
	Fri, 23 Jan 2026 01:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0251BC116C6;
	Fri, 23 Jan 2026 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132711;
	bh=sY4/2c8C+DeLPYZmSS72l0HDYcRT8AK2R4LsC3Dy15Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OP2tzqpr3RzeOOos1pyEkrshJ6SxS8YupTvMFbSp50IMcStUP9IbeznNaSUyV6Ion
	 fsMrmRP3fD3y3GfEb5cxlmbPfPTdp2EMB0o8t9cKS7c5WwH3TV9R1+r/wdfTgbu3On
	 fOqxMBgKwy+V6Dk4fvDwthqwsOJT4SWLU23GP7sETmzAusrLxxaVxyS5pjWRRJM7BV
	 BFbdnHjEOaPEva9mNY8LwwndXwRokEfwu7sfdaG9nQpd+sk24uRhLKG3b2+2HhVTNs
	 iNq14oZoeErw/PgAVDRcwjbEYLF6jWNQnxa4ZN/J37l7QyJER8h25ICXs/QwWlwdje
	 fncW8NgJIaklQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-4-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-4-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 4/5] clk: mediatek: Refactor pllfh registration to pass device
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:09 -0700
Message-ID: <176913270925.4027.3070477572441104376@lazor>
User-Agent: alot/0.11
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

Quoting Nicolas Frattaroli (2025-12-15 03:24:01)
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
>=20
> Do this refactor and move all of the pllfh users to pass the device as
> well.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

