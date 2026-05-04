Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C0FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYxFdRTU4h9RAKAcbt2Z1ljzhixMvqC+2yJI5MURaGc=; b=DAkkg796XO0aBs5YmtHeDTYDEu
	Y/VECvF5/ckkpvKIwr7w0bP2bZMy/rVaOC8ysmzqXgGdbSYcF/2p3jG7/9kL34KNhiZtzW3epzk9E
	2oGqEJ+B+fnJR4bAfNP5RsNHg/gwiKqJvjyxGfe8VuRox7MMjZYrCQeBmScIRmqmsISWxtPLeHO29
	JcA5hRmYvZjK+3MVD+x8We6pzbxMcLTYnywEsojVplMLSp/aE5tkntrii0aKvAbcjzQwb+QTlU9gz
	qjGrEMZNSSQVg+jkP8tQnnHtVZXeDDVCT+fdZsMoJCFY1TCK3F0t5eIw+VBdNA02z7se9HqdTfz0x
	fK/PBWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK310-0000000Edco-10qF;
	Mon, 04 May 2026 23:47:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK30z-0000000Edc3-0EZX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B46B600C3;
	Mon,  4 May 2026 23:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E0FC2BCB8;
	Mon,  4 May 2026 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777938471;
	bh=zlNl/31cJlXFe729EzijjaD7RKBh3+E2pVeQT84vO6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S0ODceSYBvsK2yl3SNJBAbm9Qcjrx9s51vrrGC+isk9qJjzgxDpr7dVrx9OKcls3q
	 3B+3b41MsxIVIRgz9zEasNIj/bxpKuerlgA4JuS34h9bdLlEPTlVUyCKaeAq87+mn5
	 Hyy1y8pYx+dXs60EY9As0tyrCNdF/1hQYxuSdcbb8tr1U2omib5OCRgT2AHXGn1rHv
	 F6JkT2s7s7zKTVJNdx9Ox8Mck31DKQ6rJ8vA3uWIaDZkccKhO9QkR55zLdewO2h4kZ
	 zX0mI2CBEHKKE7rynbQLRv2SWUCicE+1R0Bpw4pc+4h6V8XGINmpzpW9YrvKN9KXu6
	 gGEYWjPr3dMNg==
Date: Mon, 4 May 2026 16:47:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: MD Danish Anwar <danishanwar@ti.com>, Parvathi Pudi
 <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>, Mohan Reddy
 Putluru <pmohan@couthit.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew
 Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>, Felix Gu
 <ustc.gu@gmail.com>
Subject: Re: [PATCH net] i2c: sun6i-p2wi: fix of_node reference leak in
 probe
Message-ID: <20260504164750.5eb6c55a@kernel.org>
In-Reply-To: <20260504193834.3516862-1-shitalkumar.gandhi@cambiumnetworks.com>
References: <20260504193834.3516862-1-shitalkumar.gandhi@cambiumnetworks.com>
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

On Tue,  5 May 2026 01:08:34 +0530 Shitalkumar Gandhi wrote:
> Subject: [PATCH net] i2c: sun6i-p2wi: fix of_node reference leak in probe

This is obviously not something that should go via the networking tree 

