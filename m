Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF72D2F339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YW3/cPoutnCooMdmymtn+e337rPX1kRy4+1I4m7VUA=; b=JTbvHepWdild+MHURn4+38b1+i
	Zn06xqonJid/H3FSLnXcqw0eM9yWLEB2hl4e1iCix1Gvrb91UvsB5A9ZKWPtnZ07PKk5kusmb+Qin
	WeKbO+FRS/n5VtVzOTqCwbIxAr55p9+4KpJcUZfp//FmoKY3HnVt1saTo6Ct+b0yO6cNkoTZfH29R
	xsVNffwzFSEM8wPbKkXrvbkokF1fzm6EQw3dAl2DEPXaINuKfAbO+BNS5EbKCy+lrDQWI4Yr8x+ec
	kZTgr0Be81+Kfg42uHnCks3MzM/RsacYMS6tle4SBRGarKLqDE65yGGhnf0hQBe7aB87wXYPP7riO
	0qKiTp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfh2d-00000007S4p-1uAe;
	Tue, 13 Jan 2026 16:14:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfh2X-00000007S4R-0bMB;
	Tue, 13 Jan 2026 16:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768320877;
	bh=2YW3/cPoutnCooMdmymtn+e337rPX1kRy4+1I4m7VUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XedH2MOIpcd6couG9mkaZ4Fl8l1e6a/voT52yGUm+RbFki8MzaViyLD2P3g7qPjDD
	 tDvsMWRGJ8dC+8k5JUSGj3OPlznZYkNQ3xieiywt0vRgMsp4ei+lgwiAW2SdQfrRr8
	 dzkMuZMni1oKf4vUbwrk5jJREv6nK4NC19VAo9e4yw4x/dpOOpTMKhO40f+dqiWHNK
	 W4u3azu/3vUxT00CHgMUi3zqKNjx3qNxdk25MNXpN79BzBWPmDL881sBX99IPAEksG
	 QU9HJ+mlKHkW73qzZYnVvnvFtt283W4CIgVXw6mXepsTETn9vAt/XryQk6zh8RznWh
	 SJuXhhC/JE1wQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:366f:770f:eaa8:d3d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 388A017E0B8E;
	Tue, 13 Jan 2026 17:14:36 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: sjoerd@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	stable@vger.kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH] clk: mediatek: Drop __initconst from gates
Date: Tue, 13 Jan 2026 17:14:16 +0100
Message-Id: <20260113161416.1256164-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
References: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_081441_376341_CBE9F6C2 
X-CRM114-Status: UNSURE (   5.91  )
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

On 12/23/25 12:05, Sjoerd Simons wrote:
> Since commit 8ceff24a754a ("clk: mediatek: clk-gate: Refactor
> mtk_clk_register_gate to use mtk_gate struct") the mtk_gate structs
> are no longer just used for initialization/registration, but also at
> runtime. So drop __initconst annotations.
>
> Fixes: 8ceff24a754a ("clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Reviewed-by: Laura Nao <laura.nao@collabora.com>


