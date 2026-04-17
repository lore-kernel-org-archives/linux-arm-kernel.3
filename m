Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01D6F436BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc3r1qGYePa1HSg0tIR7M/rjUWPQEGZdbGUyWIvYyck=; b=rJRN0EKKfzVn8dMHKAdglYJpMZ
	cvWipwNL11pa7wHdsLjrtnPOmDLS9vg8xQIJFHgLd7F+U81ek1pkbrPkX93eBYMfp+89ta3w1ybK7
	OG0FkekQDzllzn7XQfcJGuY9MjIcYcM34OXVxeZoWjKYghDn53p3/fdq3V9q0ppZtSB+Fb5Gx6ORh
	mTelwC1tAwPePc9rmmslFYK9ALkgfYc9wExtRA2pPoezNOc7V5yHtZHI82Zh1H85FLzi6KpEu1cVW
	84S+ImZV2mjSHpDt1UBSm4Bdjw5AoCC7wIexFv42VT/uFQ/jvqJI6aYqcwKr7MLHjOGzEplT39ZnG
	oo3hro3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnCp-00000004KZK-336F;
	Fri, 17 Apr 2026 17:42:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnCn-00000004KYz-2oMT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:42:14 +0000
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id B551120B7128; Fri, 17 Apr 2026 10:42:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B551120B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776447732;
	bh=wc3r1qGYePa1HSg0tIR7M/rjUWPQEGZdbGUyWIvYyck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqp6HbX82MGPYm5sQBOX0TlOiyX88uXPl/LGHQSknVV9qi7u3dU2v75z8YbLy9BQJ
	 cSU32fpvvwT3zbTEUsiyjiwfNYcLqxLpCCMlqMKV1wg2aL4AW1JP7rEKohCFEeZSqi
	 +Aa7mxZyXLJmvMtdAE0hs1CohpomSxxN1wl5Np4E=
Date: Fri, 17 Apr 2026 10:42:12 -0700
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeff Barnes <jeffbarnes@linux.microsoft.com>,
	Paul Monson <paul.monson@capgemini.com>
Subject: Re: [PATCH] crypto: tstmgr - guard xxhash tests
Message-ID: <aeJw9I38heQRbbe6@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
 <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <aeCmk6LbLFT4Keo2@gondor.apana.org.au>
 <aeCnNsNrK5o2JcMu@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeCnNsNrK5o2JcMu@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_104213_806879_FC0548A0 
X-CRM114-Status: GOOD (  11.34  )
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

On Thu, Apr 16, 2026 at 05:09:10PM +0800, Herbert Xu wrote:
> On second thought, fips_allowed should not mean that an algorithm
> must be present.
> 
> So we should change it such that an -ENOENT is not fatal, or at least
> when it's called from tcrypt.
> 

It appears that commit 6318fbe26e67 ("crypto: testmgr - Hide ENOENT
errors better"), already does exactly that and it appears to resolve the
issue that I'm seeing. So, is there any reason it can't be backported to
stable?

