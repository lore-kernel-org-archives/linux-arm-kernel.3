Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA232606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z15Pj5E/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kk/fUAyJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=22ULUd3CSu+xvHleEXSSulHXhaBo3lSWI9UaZrU2MF8=; b=z15Pj5E/cbIXmY
	G5O4joQmpW6oi/nBRJ2ZXcDMVXN/ol1C+XkF0NV0P4LBETAH4Mo40yvJoIvga6mMr976/cB/x5GhT
	VBkna7+mzvadNLlSDEWQYPCHG4aOzbtTkEjcVtWqjApbe2yPzsdGfT7rpeFqfx39FDfmOu7e5DL79
	rak1omCXXkmx2tIAT2uiAhYk2FipnAXZTdKIMs7xaF2SdIq46fstFaam8EPSDOZKt4HqW6GafmGZc
	RcopfRzNlT/hlwjszZy1IcGIjJhms2nSq1CnFF2JJ49GfsKQZXw0yZoe/AUwBblpvzWwGPo8/hRFC
	Hw+cyoWgg6KSgKo9jBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Qy-00000006itV-42B4;
	Wed, 28 Oct 2026 09:59:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Qx-00000006isq-2HF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD5026022E;
	Wed, 28 Oct 2026 09:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBBA1F01829;
	Wed, 28 Oct 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181542;
	bh=22ULUd3CSu+xvHleEXSSulHXhaBo3lSWI9UaZrU2MF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kk/fUAyJ34QCYxcwMJXl2m7CliIyzgZfjPy7G6JwhCDM8xbN1o1a+XPtFRu+v3BCg
	 oP3XeEq1McsZeWwM7uoieGqHj3segBcVrwVQEg12ctXokcefklo3t9TltUf1UqWOos
	 D+6jmzisx5iyjJ90OVIIjpUMqfaB+jdlr3/kKQkoVKfuUVMNnxSAS3q1WLZH4lsDg5
	 ZoNtWsznbk+RSXeOaGueGlN8X59qpvIhL1wDBZcGPNwtvjP64RMx9D4ccTwdwu3Ekt
	 Tr2LLmeTRDWL+KfgUrKgNEtvJpAVIBhOQsupkE0a51yfccCiBjZEaQZshuIInDc3Zb
	 D4gUapcafq0og==
Message-ID: <f62962e6-6fa9-430c-bdf9-c15993ce334f@kernel.org>
Date: Wed, 28 Oct 2026 11:58:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: lpc_eth: release the PHY device node reference
To: Yige Jiang <yigejiang86@gmail.com>, netdev@vger.kernel.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ma Ke <make24@iscas.ac.cn>
References: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 18:59, Yige Jiang wrote:
> lpc_eth_drv_probe() obtains a reference to phy-handle and stores it in
> pldat->phy_node for lpc_mii_probe(). Neither PHY lookup nor connecting
> the PHY consumes that node reference. The probe error paths and driver
> removal discard the stored pointer without releasing the reference.
> 
> Put the node at err_out_dma_unmap, which is reached by both failure
> paths after the phandle lookup, and on remove after unregistering the
> network device and MII bus. Both puts run before free_netdev(), since
> pldat is stored in the netdev private area. Earlier probe failures do
> not pass the new error-path put.
> 
> The PHY device reference discussed in the linked review is a different
> reference. This patch only fixes the node reference, which was also
> mentioned in that discussion; it does not repeat the proposed PHY
> device cleanup.
> 
> LLM assistance was used for static ownership analysis and drafting of
> this change and its changelog. The review traced get/put pairs, error
> paths and teardown ordering. No runtime reproducer or hardware test
> is available.
> 
> Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
> Link: https://patchwork.kernel.org/patch/14502432/
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

The change is correct, thank you for the fix!

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

