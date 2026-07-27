Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C2C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrI3AWor3wjL+wY/8pscrVbRp8o4aDq+lBAl9Kk3kws=; b=lgSbc0i6Je1dS5ztDy8MrgKa2F
	x0XJ5aOFn0RdIUVz3y1ZJ1Jiaq+RwVc/d06VP3bTUSCvkTJplM7jwQPrV/sE+zVUrdu1FWZrZS80d
	pcO2IyPRDL4Xlk5btfoSiRQOca0zfe2xPnUjjUrZwbN0DH0UsoGHvzGIq7vTbYK2flNIDwS+RsSl2
	dBMo8lh1xJn9Iih9/f7A0YdkzaUViyjrxdSY8rIFrHkSJPmXf8VYIEkaPzzHMDHrZr/WRCGTVIFl/
	BX0bc5Il4OtXR+sylzEir8Uyll0FBmPQRayNSjj+aczkGnzRLILF0xI3FqDZuJt2pptQwyaIazC/l
	m1Di0P2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUzf-0000000462k-0orf;
	Mon, 27 Jul 2026 23:44:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUzZ-0000000461n-1pVh;
	Mon, 27 Jul 2026 23:44:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 061CC43741;
	Mon, 27 Jul 2026 23:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821591F000E9;
	Mon, 27 Jul 2026 23:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785195856;
	bh=OrI3AWor3wjL+wY/8pscrVbRp8o4aDq+lBAl9Kk3kws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OkuzGnVxCi5zd/JSH3d6lodW5e1QFIjZAj5fdbLRtk3hgfaAs+MntPiNxZrgZZTi1
	 mPeJIO6ipA/VVVONQGCxxI9dadixhq1VmljlfOidfFzMJHaLAw4eIEo4OSn1hDZ3B1
	 bTGRIIT84Z+xwYxFtKgKbTUkoSP3Qk7ATvrm80YHoWkYSxR789BLmbxcTeI/YE7xro
	 N470L0tU1TFKs8gD9O09yKU+MB7dCVFY99kWEbRd2L3+PcORvN5rHsy7jjaaZTjoBA
	 eYXeZYla80P2I4RSO+cLWXR8AeyUBSIchpedc6lVxVj13ZYAk9xTIHx11xHphzWHNP
	 1srZrPMcMwziQ==
Date: Mon, 27 Jul 2026 16:44:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 0/8] net: dsa: mt7530: modernise register
 access and add two DSA ops
Message-ID: <20260727164415.7181b193@kernel.org>
In-Reply-To: <cover.1784481922.git.daniel@makrotopia.org>
References: <cover.1784481922.git.daniel@makrotopia.org>
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

On Sun, 19 Jul 2026 18:33:45 +0100 Daniel Golle wrote:
> v4:
>  * rebase onto current net-next
>  * 5/8: zero the read-back buffer in mt7530_regmap_read() instead of
>    initialising the result variables at every call site, as suggested
>    by Jakub
>  * 6/8: keep MT753X_CTRL_PHY_ADDR() as plain address arithmetic rather
>    than converting it to FIELD_PREP() as suggested in review: the macro
>    computes the MDIO bus address of the switch PHYs, used as the addr
>    argument of bus->read/write and as an iterator base in
>    mt7530_setup_mdio(), not a hardware register field

Looks like this needs another rebase

BTW Sashiko is still complaining about corner cases of patch 5:
https://sashiko.dev/#/patchset/16c17477dc9eea8054455ef0e444a687336ced70.1784481922.git.daniel@makrotopia.org

