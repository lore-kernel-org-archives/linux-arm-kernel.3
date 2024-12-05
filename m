Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3349FE77178
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY2JQ1OUdq1nkq0OdGBKVLh8IN+KP3uYIHf4Esw6NRo=; b=sIAhz+4v8JBVc8Ytd/W63np+Yf
	nAlvJjIgrOs8WBLIKsyibrrOi84XZ3ZmrOYygP2MpCT0AHWM6US/YsRuZs4gH8FbzfLpm+3MH3D7f
	j2rUWOHdKsgecyzJJ2D4W8W/ymPcKHyt6cIl/JQMzoy85Emralx88nTQTIC9XvifyqDRjgTCs7X4P
	GFw83wQyltsT/93vlbbL/O71AvdbTVBKgb1rARUtoDYU4unhXWdT9oXhjosJMo6m1nQFq9rviH396
	25VYL4/9JCva1yA0caVbg+AlZwEudEaMne4aUYJLcrWPHVNT1LODu17AbbrGjMC27iuUaPNlLyMC9
	99ZL/+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFOk-0000000GtOS-2UCG;
	Thu, 05 Dec 2024 17:12:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJF8g-0000000GqNL-1I7c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28A5CA43798;
	Thu,  5 Dec 2024 16:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A48C4CED1;
	Thu,  5 Dec 2024 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417740;
	bh=EY2JQ1OUdq1nkq0OdGBKVLh8IN+KP3uYIHf4Esw6NRo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FsksfZd0UGkgpt4kFjDeehzYfX1wWHKpJRUTy8PStAUQmjAv0rzo+gYYiM0Kpv8gd
	 TwSsdqFrZdUqGcTCRan1r1FKO8vrCp3xTCeZpByPwNiIImHynYkIoUE+EYAIJ4TiNz
	 bwjQnhdE3oi9sBxJen7FRV3c2WxvzrwLpe72KQ11wIqcMcfG4mMefh9IZ0Yqg0XTD3
	 kz3Sh2R83u3gQU2cA+Cg0ujPk6IM6ih32Uiacv1lH0DKkfin+77+2M/fYrgAS6ZTCc
	 JxEM2KSVCnU9CkGK/K/Shy2FD3JouWHu0xfygwPBQZ4z9oQHwZqWtDeue+SIByIYFX
	 n8MdRot1Ly8YQ==
Date: Thu, 5 Dec 2024 08:55:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Jon Hunter
 <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unaligned DMA unmap for
 non-paged SKB data
Message-ID: <20241205085539.0258e5fb@kernel.org>
In-Reply-To: <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
	<Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_085542_421396_1246640C 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, 5 Dec 2024 16:43:22 +0000 Russell King (Oracle) wrote:
> I'm slightly disappointed to have my patch turned into a commit under
> someone else's authorship before I've had a chance to do that myself.
> Next time I won't send a patch out until I've done that.

Yes, this is definitely not okay. LMK if you dropped this from your
TODO already, otherwise I'm tossing this patch and expecting the fix
from the real author.

Side rant - the Suggested-by tag is completely meaningless, maybe we
should stop using it. The usage ranges from crediting people pointing
out issues in basic code review, to crediting authors when stealing
their code. What is the point.

