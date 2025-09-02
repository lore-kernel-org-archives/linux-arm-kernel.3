Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5CCCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewiECIj9R9vVm6Y+i787jD1bqU8ur2ZJ4be1ZPJi15Q=; b=cJNMu2SBUh0WDdG1SXIgS7WUuH
	q9eLK5Hi1nrtW2KwgM0m1HtPsfkOXYSQWTrI6PfUVkaMN/BZLeVLbozl/d8iVx2/KRfv3AZXeT2Yl
	1gGrK9tp/rhRCwwpwr3iSuYW7hkyB5OPBiQCnwBNjwfhn0akBZDVjGc0wDZW1R1SXb225fJcj/VGr
	0QuZiFwLwF57hbvFNe+UDCk2yYObHxxmKme/yPvOr9O43DXliGaFelMXYv6S+GQtTq0WxU6aESK6H
	+P3LUHHHD9xw34+tPecEEf8z8p/PadBUJf0Zo8xDqzC0soMoup4YBNIU7dTIifL6qwzE5Km4cTT6F
	syEXg+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9J-0000000HHMI-0KQe;
	Tue, 02 Sep 2025 12:30:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNVm-0000000GRaR-16LP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 753B660202;
	Tue,  2 Sep 2025 09:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01923C4CEED;
	Tue,  2 Sep 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806069;
	bh=Qm/K82b1d7UeJV8s6u7mEozqLgeUaRfnTN/+70BlTuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4pf/fawM/Uz4jReejEjgNqalfniyoydZ7sLJ5fLRrYlwwJR6tP22jQl4/ZRABbkF
	 yUZhoZYnGboadF+FgDlO+e7NCZhAIcywyNNni7jP3cNlzTdRjvM+/EkNn2cundFd3S
	 ThuY+ylM8oNtX3g1LgDLGK3Sz5rsjJZcUTrlQdHVDdRQr1WN1JqrWZoQPcTr/Epygh
	 o1KlLxR7poQDmv+yIOZANhD3S+8K87xIuKY9BcD2HOsyecb7PhjuvQn0/xb2jJzabX
	 UvmOX8nZ51hkxL3pmWsdSYmjLQIMB28jfr1lWORthkhyQUVUu+v477Eit+UV+tyX0s
	 04mHKkqdwhdBA==
Date: Tue, 2 Sep 2025 10:41:04 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Daney <david.daney@cavium.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: thunder_bgx: add a missing of_node_put
Message-ID: <20250902094104.GZ15473@horms.kernel.org>
References: <20250901213018.47392-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901213018.47392-1-rosenp@gmail.com>
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

On Mon, Sep 01, 2025 at 02:30:18PM -0700, Rosen Penev wrote:
> phy_np needs to get freed, just like the other child nodes.
> 
> Fixes: 5fc7cf179449 ("net: thunderx: Cleanup PHY probing code.")

I wonder if this leak has existed since commit 4863dea3fab0 ("net: Adding
support for Cavium ThunderX network controller")

> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Otherwise, LGTM.

Reviewed-by: Simon Horman <horms@kernel.org>

