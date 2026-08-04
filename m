Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FCC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 01:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oic1r/RdJs0p25eYXITWGXQfTIlTGgREqOaY42+fH1s=; b=aStErL8w7b6lrdoLjKWVwFr2Sm
	+TPctT2Tm6ekW3sULcD0mAl14iSkpC6l8PKOQVqRbZtKx5zLQUdZCXqEf0jO3a0VQt9ADzCMtrJMT
	QCRiiUkc3QPA8onUU8GCOCbORHYTWKB2nji7est+RNKlCzhOtWrwIaEp++p9vVF61pnZfDqSVPqLh
	H9Fo8QmeNmG2d8PyBa//PO7vxZqTzvuAX2+YjsPfbiPQKJAfqClKxoihHFHrXTmULXLljx1F3SLZY
	fKTgGS/Q5e7tL5Zwg06MbkCLu0neOtMe0R9v8adkD8+/ZMWOdDKN4zDa04BxArDMiuGjAFGvORQ92
	v8XHQugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr49G-00000000nQp-1zFo;
	Tue, 04 Aug 2026 01:40:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr49E-00000000nQb-3jG3;
	Tue, 04 Aug 2026 01:40:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B780760A59;
	Tue,  4 Aug 2026 01:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4031F00A3A;
	Tue,  4 Aug 2026 01:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785807651;
	bh=Oic1r/RdJs0p25eYXITWGXQfTIlTGgREqOaY42+fH1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hG/L8wKAeNwmgVRj+GI45ZUdZMnvGSE3EOLe6ya7z5Ixxo3CHf2b8ZgXsa7BbUzcS
	 7co2spdP6CcXFrOSI/kBi6x+3iNMR1hljxbHS7VwJpUOsKi9R+rzt2SwGZC+pnCkiE
	 TkZb2VVT+eiwwKTfVqAYiCz+azb6exQObopo8xQ2wbczVTw5K6X21DIhkItLnY4eon
	 ZU//XShakHIQJcxxs7eMeGrS44Krc/Gu9Z1+RfB97+PsuFfncxfQYNMvx1u51LKQM5
	 GVC8QOB9u/XHGNiq73al5iynUFtPC6Uvb1DnCCIWTBt/NhN+pElxQPkY+8fc5gO05R
	 lXcuyMPPp82Fw==
Date: Mon, 3 Aug 2026 18:40:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
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
 <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>, "open
 list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:PTP HARDWARE
 CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH 00/32] clk: mediatek: Migrate to common probe/remove
 helpers and fix memory leaks
Message-ID: <20260803184047.4a8ec29a@kernel.org>
In-Reply-To: <anD518s51UBvJHj4@redhat.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
	<20260803125034.49055f62@kernel.org>
	<anD518s51UBvJHj4@redhat.com>
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

On Mon, 3 Aug 2026 16:28:07 -0400 Brian Masney wrote:
> Hi Jakub,
> 
> On Mon, Aug 03, 2026 at 12:50:34PM -0700, Jakub Kicinski wrote:
> > On Mon,  3 Aug 2026 23:16:27 +0900 Akari Tsuyukusa wrote:  
> > > This series migrates most MediaTek clock drivers to the common
> > > probe/remove helpers provided by the MTK clock framework.  
> > 
> > Why are you CCing netdev on this? None of it touches networking  
> 
> I saw that message from you about two different mediatek patch series
> from different submitters. This series has 38 files, all under
> drivers/clk/mediatek/. If I run get_maintainers.pl on each file path
> individuall like this:
> 
>   $ cat filelist | awk '{print $1}' | \
>   	xargs -iblah echo ./scripts/get_maintainer.pl blah
> 
> Then netdev list doesn't show up.
> 
> However, if I look at it as a whole, then it shows up:
> 
>     $ b4 am 20260803141659.559129-1-akkun11.open@gmail.com
>     $ ./scripts/get_maintainer.pl \
>     	./20260803_akkun11_open_clk_mediatek_migrate_to_common_probe_remove_helpers_and_fix_memory_leaks.mbx
> 
>     ...
>     netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))
> 
> I think it's matching on this entry in MAINTAINERS:
> 
> PTP HARDWARE CLOCK SUPPORT
> M:      Richard Cochran <richardcochran@gmail.com>
> L:      netdev@vger.kernel.org
> S:      Maintained
> W:      http://linuxptp.sourceforge.net/
> F:      Documentation/ABI/testing/sysfs-ptp
> F:      Documentation/driver-api/ptp.rst
> F:      drivers/net/phy/dp83640*
> F:      drivers/ptp/*
> F:      include/linux/ptp_cl*
> K:      (?:\b|_)ptp(?:\b|_)
> 
> I think it's the K: for the ptp that's matching.
> 
> $ grep ptp 20260803_akkun11_open_clk_mediatek_migrate_to_common_probe_remove_helpers_and_fix_memory_leaks.mbx
> -static const struct mtk_pll_data ptp_plls[] = {
> -	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
> +static const struct mtk_clk_desc ptp_plls = {
> +		PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
> 

I see, thanks for digging thru this!

Patchwork matching rules must be missing the PTP side because none of
the patches end up assigned to netdev. No big deal but going forward
I think you can drop this extra CC.

