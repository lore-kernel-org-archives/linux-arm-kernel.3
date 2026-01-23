Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5CD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=; b=ZA3O0ob66ZxxGywZcanpX2r6jX
	tttoJoOLUKxOxWg/9K95O0YRz7MKOoZ06czJ8kv9YvwM16RssmICrAUR6rsEDx+iSjrRRgC+ZbFP+
	kVlJ1YcoXvvh5w4z4hJ6X87KPhbqjEYPzbDr1SGsAWogT6HALl4yvowXs4Wn9AM34raFT93amd8qG
	WBBZiwGSBe+zbN/zaUNDXmIMXAiLICLtBhwcWPAzB5IZrXYiaEs7nNNQW4d6ukABC0A2NfHbHkqv0
	qw4AUjW49UufNcr+HRcnmfV0OcsFpz+j1GHO3+IfbgErUNZOwDKWsODsNDWsQFZxPv5opTbI2PgF8
	hdmz4zjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6El-00000007zAz-2Yza;
	Fri, 23 Jan 2026 01:45:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ej-00000007z9w-2APT;
	Fri, 23 Jan 2026 01:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36EBB43691;
	Fri, 23 Jan 2026 01:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080AEC2BC9E;
	Fri, 23 Jan 2026 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132721;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NhENHPB5ww4MTDz+GSgWQrvVQlmm8vLjHi0m1XU6gUMIwMrOiFWB/NUytwI8IvE+y
	 erSmmJH7L7Lfql6j7XJmDFPyDeYn3JzpHWvuB4dfYDyQH+o9DfvjeQ0KsIzj+NNPs/
	 Fxd5uY/Db7Wa1UJAfNzSBTJ72mxWKAmH3fJkPgvaCdOKj7oV3atXQjsktQc9NY+zNK
	 aEXJ8jEWshAqH0qVUinuv3uYB/pz0Om+c6zH6l9P9eGPA7E4290y5IWOPKGSUXrOmu
	 h6Sqt0jdb79DqhtwvlFwZcSPil9OrTxoL1huIM7U97FPaDU3weAsHtByXDzCjHECBZ
	 mcaKFBdp8Iurw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 2/5] clk: mediatek: Refactor pll registration to pass device
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:19 -0700
Message-ID: <176913271924.4027.2857487573564767197@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174521_579650_18D09471 
X-CRM114-Status: UNSURE (   9.76  )
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

Quoting Nicolas Frattaroli (2025-12-15 03:23:59)
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>=20
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

