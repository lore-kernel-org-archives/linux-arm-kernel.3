Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E0EE9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkQZRG8kkv/0JZ4QGiciA4Q1sGZEe0QvxA9mlMq1dYQ=; b=z0Sn/Fopq1lOdnq8lWHxE4jat2
	XYY/SQTELOINRUTXABrVJnYGM7VX/J7wiARpufiS4saSB3G658vDE+BB4qyhs3H7Y0us2oDyvzTmU
	ENKmQJl579ikyWzF6k7NE7HEBujnuXDHV6263dUaMrIG7uiuFavkKtmOSlCp9QLh9DT7ysbP6tDXH
	J+5Z8dNeHqbxOSnvvKbRx3phtxoosutSJn0mjsS5YDmsgPAXyzLq1Mqru6C+eJdBVTwsyTdPXoPpU
	qjHwqKKAihvTakqKnbTlcV9mi6/TNJSAPmLSJQ35QB21DtjjJb98UT0CJFjAJRX82vY316f4g/5pp
	qTlZCmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspiS-0000000AW2t-2UTR;
	Wed, 18 Feb 2026 22:08:16 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspiP-0000000AW2P-0Gs4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 22:08:14 +0000
Date: Wed, 18 Feb 2026 14:07:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771452485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkQZRG8kkv/0JZ4QGiciA4Q1sGZEe0QvxA9mlMq1dYQ=;
	b=TDCGGAmUvkAuX/mo0nag675svbXFq3hMs4EG1iduTdhKTQitfUntudSYxKpkvpLYMdrxE4
	I3BOIw7EFJqvAV16juvmCflQXUz5SOO8BYCfSSLKDwgQ6u+0dwRbWEsd5DXWxFxsfoDJiK
	UovwLqkE9q/FmQSixb8/OVlkrgEtedI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZY30X9bpsV-nPsm@linux.dev>
References: <20260215033944.16374-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215033944.16374-1-jszhang@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_140813_320049_69C93095 
X-CRM114-Status: UNSURE (   8.06  )
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

On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> It turns out the generic disable/enable irq this_cpu_cmpxchg
> implementation is faster than LL/SC or lse implementation. Remove
> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> 
> Tested on Quad 1.9GHZ CA55 platform:
> average mod_node_page_state() cost decreases from 167ns to 103ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 147494 lps to 150561 lps, improved by 2.1%
> 
> Tested on Quad 2.1GHZ CA73 platform:
> average mod_node_page_state() cost decreases from 113ns to 85ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 209844 lps to 212581 lps, improved by 1.3%
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Please note that mod_node_page_state() can be called in NMI context and
generic disable/enable irq are not safe against NMIs (newer arm arch supports
NMI).


