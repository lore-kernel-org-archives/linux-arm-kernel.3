Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE1EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLnPIEKOGpSD1woPg4dqhaXDe/GqQUAN1jPeBvp6i6c=; b=jFeXgu1yrYx0FIYKmFEh0a/scr
	rEBK98PmUPO7tKAgVvkyCHGC1rFmv+b26JU7VPsn8nhK06Dz65nGFtAI8FEuV0p1HMGsaqvmiRNWy
	1d2sBL2oxcbolfIypruLOHu3/q4K59kY2vN46nQYe5Qu76zm38ZJgwUXlZsfmqKN/O/Gx4MXt4Btv
	qC5H3XSZXnr/u5y4+gFusC4diePv50HBv9fhbeV+q6QKw/x/QBpOaqi/nSxg0Yi6AFCiWuFb7LPsK
	ERmzeQ9LaDzAT147sMTzOnr5EIt8EHdomgAFsliCJ8DqGAF9NF5lpXDbF2thcNmsTU5pWQD5qHeLw
	FeLDcmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe1M-0000000EiyU-10Ka;
	Tue, 17 Dec 2024 20:18:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdzN-0000000EiXr-3gtN;
	Tue, 17 Dec 2024 20:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69F42A40B0B;
	Tue, 17 Dec 2024 20:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFCAC4CED3;
	Tue, 17 Dec 2024 20:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466576;
	bh=hLnPIEKOGpSD1woPg4dqhaXDe/GqQUAN1jPeBvp6i6c=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=QSuipB6xBm5J2bIalVSnyKaZAfqIkDB5+zc1RT/QeaCe0gHiz5nacGEEsj9DnN4My
	 QdF7ATUBLQ/DciEmJOF0yUOQElVhYLYAOP7D1SB7gktAdWc6OFaZscY2nhDzf6FC9H
	 n0I7zpONKAhbc0oGYOqnidWtcTdXQX1MjdO+ysTTVCu9xqILzbFYJloezju2IBncjP
	 DGwK/BIuhgg+mDxnMY/HQZK68DTSfRTuCiN2/ntdamHVJtOgy7v+3IQJC1FyWI3XdK
	 P+7iD53Ma0RSX22im9AqUnMo9mFFalxo0cnkTd1/4qVhFyvH//4Rv9K+tXRKlvsje1
	 uWiDzhjmgvSIQ==
Message-ID: <6e302efdddee29149a324562ea2b9972.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a07584d803af57b9ce4b5df5e122c09bf5a56ac9.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org> <a07584d803af57b9ce4b5df5e122c09bf5a56ac9.1734300668.git.daniel@makrotopia.org>
Subject: Re: [PATCH 2/5] clk: mediatek: mt2701-aud: fix conversion to mtk_clk_simple_probe
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Geert Uytterhoeven <geert+renesas@glider.be>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Tue, 17 Dec 2024 12:16:13 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121617_986319_993FE3AB 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Quoting Daniel Golle (2024-12-15 14:14:11)
> Some of the audio subsystem clocks defined in clk-mt2701.h aren't
> actually used by the driver. This broke conversion to
> mtk_clk_simple_probe which expects that the highest possible clk id is
> defined by the ARRAY_SIZE.
>=20
> Add additional dummy clocks to fill the gaps and remain compatible with
> the existing DT bindings.
>=20
> Fixes: 0f69a423c458 ("clk: mediatek: Switch to mtk_clk_simple_probe() whe=
re possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

