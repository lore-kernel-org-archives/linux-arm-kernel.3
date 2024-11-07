Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD94D5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is4AcHV+SYZzbL6LpQ+EwY2j+3oJw8i/feDsqKpf+2Y=; b=hKhxV+U8cHhzCOr6dzJyL4khyB
	xNS735XprQS0PnCVSvFTp7gi+/N3AJqao6hgLQ2CkEimYreW64o+YmwBIsuBtRHUhyy6J14gNq6hV
	oc8OK5dPGIdARGwVClA0oPnJoB5GUvhVlHMuDq9k+rl7qsk/bPKUk5qNxidFr5oeBCf0tRij/e+Fp
	/zijUdJ6+986YG7aiinJn+YdPWl1AgEBm5+q79vS07qrYW0lXnVnKjxtEy6HTuwXRuHn3UI4W+iio
	rPp5xQQU43oZhiounCat5hf0m2FssJSVUx8imvi8EZL9J51VnyXPWBIZ2ars8Vian+q6x7fiIviCv
	P8v+FmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98Rg-0000000882s-2RWp;
	Thu, 07 Nov 2024 19:45:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97yr-000000082wu-2dWm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3E72A44A17;
	Thu,  7 Nov 2024 19:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B5DC4CECC;
	Thu,  7 Nov 2024 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731006944;
	bh=AXeeQfete81ISpYgNwsN8kdIw/YYe8eDWp3sCIfbE68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dzEsujxiLm9jgs5KenIALt1j57ZJaqU3WMguX/GXwrFC6V8Uw/IDuxM00h+yqs5zR
	 Xk94+DsceskjHyO5WXJ6txnG5arhKh++b2ECRq1E62cDHuUwC7orSgrlfkCvUFkwXI
	 ofEiio+pzHdsrLZwzDqO9vWn6gF2HhGk1pdWtSOqtnqe8bxAws+N9EFYGhr5lVmQIi
	 TTwaEu2iQ2ZIdAmQtOemfZx+vNEO55Za+tVBxNGaD5sr614m9bIjnI+sZnR/jQyNHn
	 tjMIalXYaORr4KumgXAcbTXMiFbMHkZILqxgiAuSA+Mf+kq1dm21ueOsFARt/jDP+n
	 heKuYvUZLmaZw==
Date: Thu, 7 Nov 2024 11:15:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <vigneshr@ti.com>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
 <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net v4] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <20241107111542.19dc55e2@kernel.org>
In-Reply-To: <20241106072314.3361048-1-m-malladi@ti.com>
References: <20241106072314.3361048-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_111545_838324_7E2E7A49 
X-CRM114-Status: UNSURE (   6.30  )
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

On Wed, 6 Nov 2024 12:53:14 +0530 Meghana Malladi wrote:
> +static inline __u64 icssg_readq(const void __iomem *addr)

two nit picks:
 - since the function is now fairly special purpose I think a name less
   generic than readq would be appropriate. Maybe icssg_read_time() ?
 - __u64 is for uAPI, to avoid type name conflicts, in the kernel
   please use u64 without the underscores
-- 
pw-bot: cr

