Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A4D73EB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PARnfAmO8TS3qYl2afHb4aIaOUKMPPe+CbKLTktcDqM=; b=zbGE8Re9YCUXdcJfsQGCU8nSxp
	msSY0ZKFGCXk0iZ4DRCJUcRn06z5UrhlewGfxokFQzSZjGBfjjRMcCdo1F7QL1iOnCjGw6BH2lP7m
	bkiYkEetyKQH2gBwNjka18q8xSCrzYI0YDTCB1z6uspdW7Kq4gxyLsaMgnTbyS48DS8mrC8Xl+p/d
	kpeuiZjbLMzhjQoyAHgBh6lmsBNT8PBNdBSqRS2inHDTR3YVz/ziEQ/kGsmeFlDlJriqyzWRwSr4G
	zKgnS04mbdfVHdHCHDmcNS1GHnHwWhpnsklGmLonDCrVKl/paRSMA1Cx9TYOID85/WcH+V/8a2K8x
	JAs4XmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm191-00000002FhI-1dzt;
	Sat, 31 Jan 2026 02:55:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm18z-00000002Fgv-0Vj9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 02:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PARnfAmO8TS3qYl2afHb4aIaOUKMPPe+CbKLTktcDqM=; 
	b=ssxFzetOSSB93G/sh3CKAllOFkdW+kQt5lLgf812PrjAHbaKyYx/ruV/td2SyK6S3LmVmX76ooq
	YagM7Xw4pe5mg1cSm0tjfR4aBPlL2HJ9776nbzi1Oou3q40WWTkMlFnVMhG2KaKQW4tkKUreXl+E0
	ayt8+bpPWdTMyF2ME/rInx9/EuTRKujxESoL+z0pOzWaaW//7R9ikj3BOljCI9t9NPAE6YNxABc2V
	A+rfC2CMMBgkoO0rcU7k1Ecgg0BI8vvMFOTPtwCS8ghB7+HIakI3H/edxlxuFADYreMlSpJud6nLF
	gv+gse+4s9jNyTtlkhTzbvkjmf3zR37YX6ng==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vm18X-003S0A-1M;
	Sat, 31 Jan 2026 10:55:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 31 Jan 2026 10:55:01 +0800
Date: Sat, 31 Jan 2026 10:55:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	Eric Biggers <ebiggers@google.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: stm32 - Replace min_t(size_t) with just min()
Message-ID: <aX1vBYvzyxT4zdBK@gondor.apana.org.au>
References: <20260113083130.790316-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113083130.790316-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_185529_163891_BFECADEA 
X-CRM114-Status: UNSURE (   9.34  )
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

On Tue, Jan 13, 2026 at 09:31:28AM +0100, Thorsten Blum wrote:
> In most cases, min_t(size_t) and explicit casting are unnecessary
> because the values ->hw_blocksize, ->payload_{in,out}, and ->header_in
> are already of type 'size_t'. Use the simpler min() macro instead.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

