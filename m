Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BA1CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xls8epCz9Eh9Dj6gwTjfqKKY5gFaZNqvZ8MA83RxZGc=; b=no3ODAM1fQmsOtUqhiJKU8RfQ8
	n4GEqHIHrSPDQzmvWEFyVlXjNYDIRIu1fxA6k/ozc2DbizJ+3IeryHURQJ1ybm2CjnBLujjg0B11N
	Em0DFGa6daAtKEqEPfRWlOC9NHefm34nTcR1muCb2MrDD8qnAMjHAS4bYhjKdgxUmr1J9ZGFabV6g
	l39ENdM+kj6kB+WUb0azuyKw5S7qF1jqRLpeCpKDBPOl6xyjYQ/NLlz9c72kbbjUdBzuwhNPDnIHm
	F8gkjCcsGU47h1z4KfNtBbnAI9SkV+shRmkxbP9aftzMYQrmkL5/aEZHI67I6PmJ7h4cOLUY5mAU7
	1C5HhNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcS9j-00000008Cov-0Hr4;
	Wed, 24 Jun 2026 18:16:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcS9h-00000008Com-3nqs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 18:16:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E345C600C3;
	Wed, 24 Jun 2026 18:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA13A1F000E9;
	Wed, 24 Jun 2026 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782325016;
	bh=xls8epCz9Eh9Dj6gwTjfqKKY5gFaZNqvZ8MA83RxZGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oG6UZAJWNoZeyPneAL76f/xmotrBI5IsW5FU6h6ulrPghXDNhRXsXitBUwzTe0P2Q
	 hyal4TKlYaEIW8M7YmqXXsoCHbtr4wafAf5rMygxrcggr9wKOkGfez+DdYiq9gWjKM
	 DZkDb5J8VbWOZEvcGT4MHTKhBrdZwvWQN1nUm/FVS+PwE+9UBXlItk0GiNOwycPNM4
	 OO17HXbEge9bWuH6/5XBUzMv97MTtYjNBJh0Utq2KUSa4EYvDTJ08DwpU5wH0W9L97
	 feOopsCXYoJBnzbgCF81WVIsV2ssSIoouHqbbO3JBV5qvJ+qtWaldx0y80LN4Qi1ob
	 Kiknqm1HQcliQ==
Date: Wed, 24 Jun 2026 19:16:51 +0100
From: Simon Horman <horms@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	kees@kernel.org, bjarni.jonasson@microchip.com,
	lars.povlsen@microchip.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: sparx5: unregister blocking notifier on init failure
Message-ID: <20260624181651.GC1131256@horms.kernel.org>
References: <20260623115714.2192074-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623115714.2192074-1-haoxiang_li2024@163.com>
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

On Tue, Jun 23, 2026 at 07:57:14PM +0800, Haoxiang Li wrote:
> sparx5_register_notifier_blocks() registers the switchdev blocking
> notifier before allocating the ordered workqueue. If the workqueue
> allocation fails, the error path unregisters the switchdev and netdevice
> notifiers, but leaves the blocking notifier registered.
> 
> Add a separate error label for the workqueue allocation failure path and
> unregister the switchdev blocking notifier there.
> 
> Fixes: d6fce5141929 ("net: sparx5: add switching support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Simon Horman <horms@kernel.org>


