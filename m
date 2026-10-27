Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E62E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8Lg42jy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFHnEIca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DfwYy0M+qVECWL1TzkqzBLLNn3NYK+vrlrVjMqGDA2w=; b=q8Lg42jymcbPS43wtyrkxua0aD
	3ZTtj2VBmQsftO42Csqw0kH5zz9W/mR1CBCHw30sG8n4hT4SpeoLwEvyTpJOxnThuamzfXOZAeg0A
	XpjQ8yG9Wmnna1bzWbqPhzxYGgQ6K11fW3FmfqL9DkzHgMhumV1qo+pcuU9XxAmfbMQTLe8KDP8Jy
	w2XR1/N+lZkxRMbsfbzC3ZcbmmXgbhfEo0pi26uvlroQ50pKkfYe65l7LcEafnS04UWwA1025LuSb
	lnIhhsSj5h0kA9XOKqvBAKAmyF6LRRddHTfB033uABoXF1LT1Y8bLNALM32exeVEykwfGySzhuJBj
	jDAaZxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkUJ-00000005QaU-1SVV;
	Tue, 27 Oct 2026 16:57:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkUH-00000005Qa5-1B7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:57:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCCDF403C3;
	Tue, 27 Oct 2026 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843C71F01828;
	Tue, 27 Oct 2026 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793120244;
	bh=DfwYy0M+qVECWL1TzkqzBLLNn3NYK+vrlrVjMqGDA2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lFHnEIcagsWWX97e17JRKkvqwfmSVVM0ksCWmW6cqQ4YdS1QBeh/wnxWBgopmNJTH
	 vaevCmx7bk1tb9G3e60v5W7fl5A+ezSdLm5nC7XJnVcdxHiTA3jrxMtQzTOXAxxl1X
	 Z5w31LUKFl7N8oRp9nXOHLNan3WWnwVHZpfF3QAWlEY8/XMffNxFDFFfG9TUHs9A55
	 oPAreXuUpIICWl///6EpsHPk5j5KS1tFow8bc7c/5o+FGssynSE66clm/IeuJs/3D0
	 Wzl46jZNz+v0Lgj/9RNFox5rQD9hUPUGsRJSqbqABVNHoiaK15tUBwo55vZ0JESTsd
	 NbpHdEME1bq1Q==
Date: Tue, 27 Oct 2026 16:57:20 +0000
From: Simon Horman <horms@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH net] net: lpc_eth: release the PHY device node reference
Message-ID: <20261027165720.GO257209@horms.kernel.org>
References: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:59:55PM +0800, Yige Jiang wrote:
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
> ---
> Based on net/main (305deb54c6c2).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
> Both allyesconfig and allmodconfig completed kernel and module builds
> on the unmodified baseline and with this patch. Unchanged objects were
> reused for the patched builds. No new warnings were found compared
> with the baseline, and the changed driver produced no warnings.
> Both configurations used CONFIG_WERROR=n and DEBUG_INFO_NONE=y;
> W=1 diagnostics remained enabled. CONFIG_LPC_ENET was y and m,
> respectively. The unmodified WERROR=y baseline reproduces the earlier
> arm64 syscall-table override-init failure.
> No LPC32xx hardware, runtime or fault-injection test was performed.

Given the absence of run-time testing,
I'm unsure if this is net or net-next material.

But I agree this change is correct.

Reviewed-by: Simon Horman <horms@kernel.org>


