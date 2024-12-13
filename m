Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798C5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGQe7PrBLWKhr5aELxTpsrHE0Ho/kHt9ZqSvq1qJm/8=; b=dz3JJQlCbBVj7xBOVGMempyzgv
	+Ot9pBBBXASxBGIaXO0sHRwlzek4qK79c7jMRNDcspa2IMp6AZ+dsODPvzHUEMX+uc/l0u69kt9EZ
	cX3V3zaiNrHT35Xh0JxfYgV80eAISV8VAp992QBC6qXNTfAKIaR3+kSfErZy3jjVNCLsK7nNIAlWX
	+LWObZGcpSD3qvqEL8PcXSpdoIMrE2i6SuT9Y8TGLUPCDfsELHl8tmsNYbdHMXXOdvb73A1p2VQAS
	tT9MAAzoDUEZna+xNaNPHXnUQR+ezC9R2XwaCDNfzFqAYFsS1OpSDrHWa4cv6Hwhxg5wuu0YYebHg
	jl4yuYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM490-00000003cqr-0slI;
	Fri, 13 Dec 2024 11:47:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM47m-00000003cdb-39Ko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DE4BA42B35;
	Fri, 13 Dec 2024 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D7FC4CED0;
	Fri, 13 Dec 2024 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734090385;
	bh=1LJTjOx7kJx7q2mytF+grEPfxYG6mPmq7VZvVuE7Nzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ga6vJJy9Plt8rk1ZLRU0bSPuEEIFFP2NqMZ14P/0k78uOtrRzmJT9MR3QaA9haWSo
	 gUUXUPwAVnTYsPGiYkA8V6YjKyalKDhOIvkczNBD7KGwWGv5g/x5BbfXbRRSQszI1F
	 geoEG7xNXHypBybJOy49Thqk+6h/zux7VvR6IQLOuw+v1AE04G3zspHzqdrs2SDTka
	 PQ27MD+bupU6M46eKS7qz5ZPI5RCCBdsyqdUqTdUZnpogDyaVmIE+2nAo8J6drEgWr
	 DmbcHUFGaBT9QaDX65+w0C6gw0Cd7jFb1R9C6I83DglShv8SVKS5sf6gh1rm0gSE0Y
	 y9+1nfDq9wnNg==
Date: Fri, 13 Dec 2024 12:46:22 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Message-ID: <Z1wejvFpGLFMhLJ9@localhost.localdomain>
References: <20241211154035.75565-1-frederic@kernel.org>
 <20241211154035.75565-7-frederic@kernel.org>
 <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034626_849915_08488A90 
X-CRM114-Status: GOOD (  10.14  )
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

Le Fri, Dec 13, 2024 at 07:27:03AM +0000, LEROY Christophe a écrit :
> 
> 
> Le 11/12/2024 à 16:40, Frederic Weisbecker a écrit :
> > Use the proper API instead of open coding it.
> > 
> > However it looks like kthreads here could be replaced by the use of a
> > per-cpu workqueue instead.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks! Feel free to apply this patch to your tree as it's a pretty
standalone change.

