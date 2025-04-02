Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B79C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NToZlzG6/aP07T/JQskDRm708R9DlCdafL/lVEwMQc=; b=tqFBABB4nNpat1HIj7jgIuHm30
	uhpzax2AqhCJ/n0N7V0+DsDHgL2VdfAPHvXY260AhbfBlJO2ZYM1fe64JW/T2WAfqT8DfC+Vrfv2H
	fOwd8YzUdkEDoQjnVcYKSjI57krQ+qL2eHO2pMLg1umg7/Pc8kSuxoAx8WCOmi2WXjQGJ9/lgF9oB
	0EGG+oXZYMr6juaWxR8F1eCUl2eLXQQC6IuCOU4ZsaR4a6Ld5a8LO6s1X+NaelKWXLfDiV2c3P+ck
	gfBGUd7U8//uBRu/BPX59xPWPuatV22J4B9A3E0ShXTm+RzamIYzfLX5dJJmG6ossLO8TnT9vRLAS
	BEosbZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx0I-000000062O5-1BAm;
	Wed, 02 Apr 2025 12:15:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwyW-000000062DN-41XO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76F05A4461C;
	Wed,  2 Apr 2025 12:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D08C4CEDD;
	Wed,  2 Apr 2025 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743596022;
	bh=O7oesmgNvnpeMIG+T0CoO9IemBq179dATBp4McwmeYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q7Om3u2qOXHzmCKvzl9SNmhsvqIglkLX1PkahL07EHm7zSQpi6dW1zTwhYqk8ZHmM
	 x6DNred9+HEQYWmXIYOHr57SFmRQtzrdjLXlJc2Y3ZF7XTyZzR9fQ8Qr0nVyjZSudi
	 fIYtm0cRR3ac/1lGXMvT4+Dshb55UoAuLZCuQMD5IN6CoQhxVkZdoasZNNKrhhVVsB
	 ZHIGSvVXXRDIeNPo9ID0pIV9QF7ileqKyQh6PgZR+QkfI2Fl0tDeLupw7WGa1hpfs4
	 vYMgEh7qRm0ABFLDbep4yM9YdaC4sztiHoTMtcO+9omJ9MSyuODqGXQk54fyvoG0BV
	 m8KO/ji5p/lVA==
Message-ID: <a6f3b75c-2781-4d77-a5fb-ebf5d4a36c4a@kernel.org>
Date: Wed, 2 Apr 2025 15:13:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/3] net: ti: icssg-prueth: Fix kernel warning
 while bringing down network interface
To: Meghana Malladi <m-malladi@ti.com>, dan.carpenter@linaro.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 namcao@linutronix.de, javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 horms@kernel.org, jacob.e.keller@intel.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-2-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250328102403.2626974-2-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051345_069665_DC0C107D 
X-CRM114-Status: UNSURE (   9.49  )
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



On 28/03/2025 12:24, Meghana Malladi wrote:
> During network interface initialization, the NIC driver needs to register
> its Rx queue with the XDP, to ensure the incoming XDP buffer carries a
> pointer reference to this info and is stored inside xdp_rxq_info.
> 
> While this struct isn't tied to XDP prog, if there are any changes in
> Rx queue, the NIC driver needs to stop the Rx queue by unregistering
> with XDP before purging and reallocating memory. Drop page_pool destroy
> during Rx channel reset as this is already handled by XDP during
> xdp_rxq_info_unreg (Rx queue unregister), failing to do will cause the
> following warning:
> 
> warning logs: https://gist.github.com/MeghanaMalladiTI/eb627e5dc8de24e42d7d46572c13e576
> 
> Fixes: 46eeb90f03e0 ("net: ti: icssg-prueth: Use page_pool API for RX buffer allocation")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


