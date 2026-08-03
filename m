Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5797C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLQmoT0Qm+InB+muH0SCnb4r1bw0bnjyIeYCMj4nTDU=; b=Brfmsl0qV9JHiKFvlD/9UDW4lb
	4mGv2E+3jzb3fXtVh9F7LXrhSPLNx7zCjhAppttZNXBKmDH6CMCYSRZ2JXiHXDjC8bga7z/CPLxBD
	4VJV47NO4izB2tNNeyLvYnjsbiDAym7aTaQ7pCZxKfgEFjV4XjBV9rWZzyTf5NF4/RoHV6fRPloce
	n7840gAi5dW5blFo6yo204wJilVHIMYkSanuEAYNjXJ54eJq1dzhL7meqD+E6gqRemMilkB1W+Meu
	NTV/hrhXB5R/rv6Nd7vyDfsOZkujm69qs8ayd95Tkd226OlY3jhrH6Ak90IYAnlCiwLP6ZLzuTN5/
	9pOI2Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqygH-00000000Sfh-0IhS;
	Mon, 03 Aug 2026 19:50:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqygG-00000000SfX-2iln;
	Mon, 03 Aug 2026 19:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 141E560A9C;
	Mon,  3 Aug 2026 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8311F000E9;
	Mon,  3 Aug 2026 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786635;
	bh=qLQmoT0Qm+InB+muH0SCnb4r1bw0bnjyIeYCMj4nTDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F+9ke+lqECruVGOxyMzEozXERA+qhYXA6J56xw74Ett7xKQf+GPhWNgK7tAb8ZDko
	 l+4m+fFhhG3hgilmqsZ8GVquUE5tbB8+FzBNaW5gVRWurTt90AOhy466ndC0bNOGnx
	 PFoFIASClfvOVrSdNEQ9hk7RwDsb6ij2dlHxhfcI83qxUHzb5BHpfdSy2nnSGwu0Cl
	 1Xysqpi06aCkNZyS/SxlFFwafYytawHNoqQaoQmzeGqbIHQ0Qa78NVf8DxprASxcyj
	 JGUaeDq9YQ734+pJ/JrOkKhWBIAfF3SOx7ThH0UiUYL3i6UqCxYahNCdKGaJKRD7X8
	 qdTRaLOzSDn6w==
Date: Mon, 3 Aug 2026 12:50:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yassine Oudjana
 <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Laura Nao <laura.nao@collabora.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R. A.
 Prado" <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo
 Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook
 <kees@kernel.org>, Miles Chen <miles.chen@mediatek.com>, Daniel Golle
 <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
 linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
 SoC support), netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK
 SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)), stable@vger.kernel.org
Subject: Re: [PATCH 00/32] clk: mediatek: Migrate to common probe/remove
 helpers and fix memory leaks
Message-ID: <20260803125034.49055f62@kernel.org>
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  3 Aug 2026 23:16:27 +0900 Akari Tsuyukusa wrote:
> This series migrates most MediaTek clock drivers to the common
> probe/remove helpers provided by the MTK clock framework.

Why are you CCing netdev on this? None of it touches networking

