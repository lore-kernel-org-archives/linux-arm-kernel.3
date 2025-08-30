Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF0BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aFiX2cMTfwUXbsAoAK0RidRjQFd9bQG2zA2JxO1CdPM=; b=xvpv5f1sCHcRZn
	+7yirDiF1Q8JgTlSBWO0S+AL5iY/4H5q1fZpVH2nIASL3mWjrzbcWUFx1oQt69Xt1wYXp7UR/xfwq
	cjRz7QoAWrVq/pbjYld89dI+mSN1yW8WE4G2x+zyBhIquurqUdQOnRFx9PXIMoJ0gV3E697iQrIRg
	9TaY9+CgUbYMxz5py7KUSuCnBALDWtx5lmwUgnygmSbgNw32GSxnWVrDTOhYc6+H7oWdjjW5lmdlK
	7TWCA+ezGJp8PcVWXQQAoXyUEdnWkRhBuYO/mIqA5WaLXzwmvJLYUhQcoddxNF59li7ejQY93OGIY
	vhr0hvmELFrmm2rrYyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHKp-00000007dAK-0LcM;
	Sat, 30 Aug 2025 08:53:19 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHI6-00000007cp2-2SJt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 08:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aFiX2cMTfwUXbsAoAK0RidRjQFd9bQG2zA2JxO1CdPM=; b=JK97MzfZb4vhevaRyon2jcyOZr
	tgGFkLw1jjPHRrPD9/FDhk8VZ/1CWEsdQD+xYr6YpaN3y3uAyaXuZ6JXRmb4YwPSaivZk6QeNhAj5
	SjCM8DgJjj4/ugOEnI6G/PhDfR2+V1wjISxzyjzRIt3t+g0CSZJZQwb01D10sG/NaQCN3geY7i2Oj
	qQGIuh8NrSaO02iQj876s5gUv2XnninxnNaza5yUqnV7852bO8rkyuJPqy7NTDc5lHBVElTega6WF
	/cfnyz2EU6DtVpyeN2RTpcHaAM5PiqC+TNzPleH+/OG6jeciemiNY2qaJHPzXRdbkrp1U+sM3Lcqd
	0tVhMMQA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1usH2U-00179x-22;
	Sat, 30 Aug 2025 16:50:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 30 Aug 2025 16:50:19 +0800
Date: Sat, 30 Aug 2025 16:50:19 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ebiggers@kernel.org
Subject: Re: [PATCH] crypto: arm64/aes - use SHA-256 library instead of
 crypto_shash
Message-ID: <aLK7S3MK8Go2XYQg@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818224740.103925-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_015030_626182_D68918FB 
X-CRM114-Status: UNSURE (   9.32  )
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

Eric Biggers <ebiggers@kernel.org> wrote:
> In essiv_cbc_set_key(), just use the SHA-256 library instead of
> crypto_shash.  This is simpler and also slightly faster.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> arch/arm64/crypto/Kconfig    |  1 +
> arch/arm64/crypto/aes-glue.c | 21 +--------------------
> 2 files changed, 2 insertions(+), 20 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

