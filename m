Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FE7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsDTPwAGkRwwpSnZNZWAW7/2Ey62GVABiWtEKo287Ow=; b=3SE+DHIu5HpK8B3P8Yqf/BdMNy
	oo/UgrLnj/U6a2njtWTVUXBGrN+viHzJEesdmdv3Bt0srjehjWEUHR/cdlGYxnwPqmWNRHmO5OKJQ
	PI9s9tqEt656mBLk29qjihraSZuCBxqe9VQpTY/mCaOzd514MsMzzECXJ7oVYPecV7xPMGVUhiBqv
	PQINzA8qvXmS6fFQJhWaBRSspKGFlJu4vdO8Uz2VsgN3Aq8seTUopmugB58c0iKdeqxFIrYqWSN/g
	eBaJ0cvr2ErNNTUnFGqU0idhh+WXFLyGHa28LSlPUcaZEeB6llyCbUGWCHWQ/Hgy7yZ9MRoZ+4mxA
	EwMuqhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHUK-00000000d38-1wLQ;
	Thu, 18 Sep 2025 16:28:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHUI-00000000d2X-28Ec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D45860207;
	Thu, 18 Sep 2025 16:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350C5C4CEE7;
	Thu, 18 Sep 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758212881;
	bh=yGD3rd0ZgCpKN5/ib9YlnwYypPwsbITgq4CSUhmw/FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnarWw3FJUtrtOMP50yvc5UH8uSKNOmSqz96oPjewbjN4GGyf1nK0rJco3NxORKWA
	 ewrgOof32hIj+7IAMSc6GZr/1ZWAWTcwoRcllf1KW6VOc8NfoYRz60Lul0ZJG+Xv+0
	 QdBV4J4NTgPF/kM6/16lCvvH08fikSs5zC4QfozCk76r3XWKs+Ah0DE8qseg18A9ev
	 HJbLQNC5hcof4gBI1qwxKy25wR2ZOjeyXIu51Lgxvv2AHpJ++b8wbP0q6lpMyYyU7d
	 bXZs9QP7lJIhRCkucua/zIE+iD/ZrvZTSl3sEpdhH6iRmFc8YSeppuMypNSLjveZza
	 YyNNrS7pHs3OQ==
Date: Thu, 18 Sep 2025 17:27:56 +0100
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Roger Quadros <rogerq@ti.com>, MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Basharath Hussain Khaja <basharath@couthit.com>,
	"Andrew F. Davis" <afd@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in probe()
Message-ID: <20250918162756.GA394836@horms.kernel.org>
References: <aMvVagz8aBRxMvFn@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMvVagz8aBRxMvFn@stanley.mountain>
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

On Thu, Sep 18, 2025 at 12:48:26PM +0300, Dan Carpenter wrote:
> This error handling triggers a Smatch warning:
> 
>     drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
>     warn: 'prueth->pru1' is an error pointer or valid
> 
> The warning is harmless because the pru_rproc_put() function has an
> IS_ERR_OR_NULL() check built in.  However, there is a small bug if
> syscon_regmap_lookup_by_phandle() fails.  In that case we should call
> of_node_put() on eth0_node and eth1_node.
> 
> It's a little bit easier to re-write this code to only free things which
> we know have been allocated successfully.
> 
> Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan.

I'm pretty sure I reviewed this code at some point.
Sorry for not noticing this problem then.

Reviewed-by: Simon Horman <horms@kernel.org>

...

