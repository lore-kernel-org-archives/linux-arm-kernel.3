Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9BCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhSkOie36LNjLhZ1e/3xKgbbnV6rCK0CBBCBJjtXEl4=; b=mT0lVfw9/97H53eq4W/kbD1tI5
	LdDMeGmJ2Zi665pOU3y23nhAM9fyZPB/5t/5j0VJCzfez7ZKhKWo6e6Yzgoi1MsgyT1v7WlN7wagz
	EdrNeL9xPXUu3DaDwsOcyKiIcceYc5EKIRtRHznTTtm8LoZ2eBY1Xds6FLQ/I1o/EuACrONRbYSOI
	Va4EiykAK7fDTfldSwblUbolN0XIvm4eDgggaoqtzjiCWuf3014b5FzSJ+NYBfLgAuwj9J/e0eEqd
	SUvgFdl37yfGHPmK0Zl72cAB1fWCzYgzvQJH+ZDwAE9OvTRBSmFKPSEdyI4Z5MGpeqNigP3hKAEZr
	trvRljFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJr-00000007pR0-3n8F;
	Sun, 21 Sep 2025 16:53:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJk-00000007pKJ-0hva;
	Sun, 21 Sep 2025 16:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 951E1600AE;
	Sun, 21 Sep 2025 16:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB25C4CEE7;
	Sun, 21 Sep 2025 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473619;
	bh=mhSkOie36LNjLhZ1e/3xKgbbnV6rCK0CBBCBJjtXEl4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nlYZlSPRA3rDVi0b9Jl1NP7yoCrtiWufi9T0NPvDbUYQIEeDzKC76OOanlNKGwm9G
	 rj4pGCUXYzQePp/DqDQCb8P3AB1Q/79U+4m7vHDvSHhBARqOG80HpeEN0uJAfpDLaf
	 7VDIvTnmgLmlhJzBznGrv/rhZgwQkfh/rw3VhKezofbZXNbB2kteoLUs+dvmRisrjC
	 URMKmVv6OyR1/RPynpnavFzyxK5p3F51mhwvMT9PMYIsbXH7UTHAOnTeKIUVVIgRMN
	 7UiKXcKf3W+FCRRuJZ3FvVyAOc+tPFcFgcxMT4c2v9K3GFFOi1Ivm4vRt8Ldf7UaR3
	 japFcjxedCUhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-8-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-8-laura.nao@collabora.com>
Subject: Re: [PATCH v6 07/27] clk: mediatek: clk-gate: Add ops for gates with HW voter
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:37 -0700
Message-ID: <175847361789.4354.2149769507345484400@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:27)
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

