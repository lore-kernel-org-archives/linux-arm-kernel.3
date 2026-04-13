Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10574F531C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/odhzOyY4u9jxQVl+cLzSh5Fv0Ivs0VjeFmOgiUJ4c=; b=gs07HhoT2W7cJI77413Va8rzlP
	Byq4m2YPPN7sGDdFjUxWKGoDtPu3+bW0KjPP5q6uF1dJD0HekhbZ4DCIRfrh4icvCFGkoS+moBPGF
	8c/WH3QZ8u5p9lqWjyl3oVsYChOhZFUUnEJRTXIyj1R3bTVy+Pgr//UHzsBGPptSUUH6k/EZzzcN8
	nuIUViwvsrxvMs7hLLxzrSj66rX2ss6Vt73owza0rDnRyLrvVVuwkLvVWTJrBlxp5K959aaOvX+wI
	SjC6BmXEttfyRdTe24o9FncnSNxRCMKyABaqWhawX/BpjU/Uz0p1+bjBLzr7S1hv7s4NT8LoDOlG+
	tP0Vsz8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLcO-0000000GAAZ-0Lh0;
	Mon, 13 Apr 2026 18:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLcL-0000000GAA4-0zoz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20461440F2;
	Mon, 13 Apr 2026 18:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3380CC2BCAF;
	Mon, 13 Apr 2026 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776103356;
	bh=y/odhzOyY4u9jxQVl+cLzSh5Fv0Ivs0VjeFmOgiUJ4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cVfocMwdyXN75O40vh2aviLbRfsNcR6ghCnkwG6CFs9QxrxJif/5SPdtBcZZAInBn
	 TxDBIXbwbS7XQal0SyoEvp9bRshJ6baJ1ncPzczMFOhu9uise4O2TY/+QRWRR9p8Ub
	 4Bik94Gs8qbQyAg8ZuLzxDVPhXhynaK+VEpki3gvibw39LxAtisn1/qioS6VQa7vfZ
	 UwJUxvzTd0yidOavhs888yS6qoKORpt3/HQ1zJmGxFRbyZuH1IeoRsdkiGbdVQi6kp
	 I3158vi3cu86S5Wqz+e99wen4X1/900UQnVYl9utxWxYg3pe8gAHBVHg7YnSlfo3rK
	 i9zTEiAQnQlUQ==
Date: Mon, 13 Apr 2026 11:02:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <20260413110222.49fc3759@kernel.org>
In-Reply-To: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_110237_304286_487EE868 
X-CRM114-Status: GOOD (  10.49  )
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

On Fri, 10 Apr 2026 14:07:51 +0100 Russell King (Oracle) wrote:
> Since we are seeing receive buffer exhaustion on several platforms,
> let's enable the interrupts so the statistics we publish via ethtool -S
> actually work to aid diagnosis. I've been in two minds about whether
> to send this patch, but given the problems with stmmac at the moment,
> I think it should be merged.

Sorry for a under-research response but wasn't there are person trying
to fix the OOM starvation issue? Who was supposed to add a timer?
Is your problem also OOM related or do you suspect something else?

Firing interrupts when Rx fill ring runs dry (which IIUC this patches
dies?) is not a good idea.

