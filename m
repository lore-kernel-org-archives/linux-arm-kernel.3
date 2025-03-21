Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1166C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 01:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBWdA7WaRpRligqzVWZDghkf07uA9NSD5bfUL4tGmkA=; b=bB/zN5Ns08KQfPQ4a6CfNdP74X
	AryPN4viBUO7frkW/F4MaP3034igLJTG8BYCn9al0Njs2Me+dFap4Rt1nNDqMcT78jPnNN52mBBJa
	4CwxIWBR25R7Z81kClXa+62T9EVwqoo6M1UOgqX1pZxaQ0bwF6RmBuYO7U94WV4vwzOZO9sG05Pi8
	wJExoT9+MpMt/XpG90ZyREAjjsHPbNiLIV78M0jJtGdp7l/fFWN4H3ZWn35RVbGpKgdVn4DOhhI4k
	jn1TRzetcjVbZ1nctBT1X7NhZ9M9hEVONu9K0Q5LUXm4J+Fw02t4iOiSgK7lWUXocoTwxRM+5bJgY
	2dPiNqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQkk-0000000DbYX-0j9v;
	Fri, 21 Mar 2025 01:00:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQKt-0000000DZAT-3GU9;
	Fri, 21 Mar 2025 00:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF1805C66FC;
	Fri, 21 Mar 2025 00:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EBEC4CEDD;
	Fri, 21 Mar 2025 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742517246;
	bh=yyQrlBhrG3F+CCOPI4mDErllZmAnSGt+UetzoQZbtuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbtkBtFAT2D4XbiiWv7EtfXCZHZmACPrbsp8E90MTGOBZa+L6qybBpWgWh+s/L/Pn
	 xAkvRRfYPgHesPEru6KNMpajOe8flK/60o7pqolcLN2Wgx0895H5clX114AecJIOhX
	 sG2p8e5sRtBWje45/o6WyWdQ3sb0WFKNcZ3CThJOTO9AhCeEae60lBU1JRDM5Dvwtj
	 JPxN7b6fcN6Zfa2rf7WiwcgJJMTeCeL73yItD+I1fFqTt6ppGO7d3vFVGnVscdAb4l
	 aFRAloY0t1b6BzB0sMdm0uAQYPaZ/uUL5jPXIV4VUKbDGScbSy7udzH1nggyPWtw/x
	 yBcFFsod1EzeA==
Date: Fri, 21 Mar 2025 01:34:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com, John Crispin <john@phrozen.org>
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <em2y3tkiwlxc45f4sjtzdd3oy4v5zpqgdpqfppyzah2ilzidg2@wn6cnrezygpl>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
 <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
 <Z9yR6pyg1mtqKynh@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9yR6pyg1mtqKynh@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_173407_871334_3A6EDF67 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Daniel,

On Thu, Mar 20, 2025 at 10:08:42PM +0000, Daniel Golle wrote:
> On Wed, Mar 19, 2025 at 12:34:53AM +0100, Andi Shyti wrote:
> > On Fri, Mar 14, 2025 at 10:53:43PM +0800, Zoie Lin wrote:
> > > Introduce support for runtime PM operations in
> > > the I2C driver, enabling runtime suspend and resume functionality.
> > > 
> > > Although in most platforms, the bus power of i2c is always
> > > on, some platforms disable the i2c bus power in order to meet
> > > low power request.
> > > 
> > > This implementation includes bus regulator control to facilitate
> > > proper handling of the bus power based on platform requirements.
> > > 
> > > Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> > 
> > merged to i2c/i2c-host.
> 
> the change causes a crash during boot on MT7988 which typically uses
> one of its I2C busses to connect a Richtek RT5190A PMIC.

Thanks a lot for testing it. I removed the commit.

Andi

