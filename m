Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D71DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Cg2M5mdBA51WLv72+0nMAPShXd7ntb3KGFkfyKWP7w=; b=d2KzGdJsEv3i+CitAMlsAL3gRt
	QAubgoNONNyUMcw7N6jZ+vCPe93xfHiw8KWmcu5Bb+GJ686YKqBO0m8grl/aLI8rPcQr8XM7Gm7oY
	sFgHs9NYi+K3PsYzRbBFpe2awQAEOS6hFvLgNvVX1Ucpw4uY+vvLG2N444EBNt1S7GtEWVS6vlA1o
	+t7jBai/QvZoM7yQZ+KGyI4xUjKtU6imRA3PM6iKGtWC1B8pvtBIG703vL82qTiju4c9RJGbdM6hS
	ZXyKGmBdYFEOmvSmUG8zRPYq+HZaUTsNMSTVsNZPv/7s6UfJTP/w6TtfqPN1xBfdBiVqVQuZUjDSQ
	F11oPTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mzw-00000007nNN-04TH;
	Sun, 21 Sep 2025 16:33:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mzu-00000007nMh-0C1c;
	Sun, 21 Sep 2025 16:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57095437E6;
	Sun, 21 Sep 2025 16:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17712C4CEE7;
	Sun, 21 Sep 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472389;
	bh=5Cg2M5mdBA51WLv72+0nMAPShXd7ntb3KGFkfyKWP7w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q0qPF/YA7f02hqqMlRsC4NpyGBZzmjmEmqfaHItxf4QLx09JqCYD+7TKx6jcgislr
	 raDDQZhdtYgHEuADuCpqPPryWiIvZ3Sad++9rp+vh4sVarfAHVKkpC+9Keb+C4OSxn
	 xfJhnAyBEezvkXjc4+xvPbNKK5cnoOL45sob+91JWJf8m8moLlxvuzlEm3hmT1urxE
	 QwcTqyYj4SKww53v2oclEq7HA6bpk+Lde1PMW5Y51NoZjG4jXHZR41jZEcKPWKpQ/J
	 ucOBJVC0tQUHs+PTWTiUx+fXWXYYA9BmPhy/AO+AbVYZF8fpzfkM7W9Ue8wPRoj/7w
	 zDp8lm76RCTsA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825150932.3695931-1-wenst@chromium.org>
References: <20250825150932.3695931-1-wenst@chromium.org>
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Sun, 21 Sep 2025 09:33:07 -0700
Message-ID: <175847238786.4354.6043816943509142899@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093310_103416_F0952970 
X-CRM114-Status: UNSURE (   7.67  )
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

Quoting Chen-Yu Tsai (2025-08-25 08:09:31)
> The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
> Passing one to the other is wrong.
>=20
> Since there aren't any actual users adding CLK_MUX_* flags, just drop it
> for now.
>=20
> Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callb=
ack")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

