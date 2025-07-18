Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AAFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHrqihAXBWbkD+hNJe9QmyuvcRfGQMrrS8l0OHyFvmc=; b=lsozWPHPknRIJxPdj58Qn5GSn9
	6okoFN+Z4rJFTKRr25Wp6Yv6/i4xOy702INr7Y4V31lXxWxdvox6qb7B6mZksRpMvqc3RJGMByyhf
	3zODIXrR1c0s1TiThJF0bR/06nMUu7O9KcLmY8LNssVh6SBNMtvsiuPZxewUaJrVYbA5iN8WBG+aH
	MidX28lVyCJp6pnuSZQFUxArmofkg6hS0khyOYm9x5us9NofYFHcn8Bx9z4aTbMVNff2hx/pF/Rlb
	hSjOQ7lN8EP08zcNq7Bfh+9WrVBfhaI3gxRoBKFlabBYLwIUyC2P7KdVIo9GTiTjeMGnzmb/ilGre
	mki3ovxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjpL-0000000CXjh-3ldw;
	Fri, 18 Jul 2025 12:04:35 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucioT-0000000CNXm-2S9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rHrqihAXBWbkD+hNJe9QmyuvcRfGQMrrS8l0OHyFvmc=; b=HEAgY0Rlaa4bpR/jWfqfLLuZn3
	M2+ATfYOBUC9Ml8x5+NSI5LHinIZtAv/YyP3GyUr/pOSmosNGnR1JThvkVtFGQfjiKKLURBEW+JIm
	L0MKAZAtatL8cHfZSG43b+5SniVMEkXM36/5qvmdxvQKi3DtPHb5FzvW7sdITUeHv2qf4xZQ6Qyy/
	70TQrd1VfRUzKR87JxKnzAhJYnp/nW1hqytsA9KTVfp3J2BlNrca/+M0JCDyHpGvaD/JfyizW+Vp8
	qIyf9XJ07SECEpAO+WPd2aO7SnUNFBboMMnAODtKUX2GRwAleVuu7M9CPtBqyibSMeX+E8Sv3v646
	FEmmY7Uw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uciYX-007yZy-0x;
	Fri, 18 Jul 2025 18:59:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Jul 2025 20:59:05 +1000
Date: Fri, 18 Jul 2025 20:59:05 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>,
	"David S. Miller" <davem@davemloft.net>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/80] crypto: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aHoo-dQpHxX-Lqbf@gondor.apana.org.au>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075402.3217279-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075402.3217279-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035937_623761_0FCF7A21 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, Jul 04, 2025 at 10:54:02AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/crypto/ccree/cc_pm.c      | 1 -
>  drivers/crypto/hisilicon/qm.c     | 1 -
>  drivers/crypto/omap-aes-gcm.c     | 1 -
>  drivers/crypto/omap-aes.c         | 1 -
>  drivers/crypto/omap-des.c         | 1 -
>  drivers/crypto/omap-sham.c        | 1 -
>  drivers/crypto/stm32/stm32-cryp.c | 1 -
>  drivers/crypto/stm32/stm32-hash.c | 1 -
>  8 files changed, 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

