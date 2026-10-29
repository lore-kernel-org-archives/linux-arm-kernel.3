Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BeqQGcoM;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=tL/+CULX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=td6kaJNap5lHOA9xLjt4KXsEHf+nBxgRWvMp6ArrgKI=; b=BeqQGcoM6sUIpr
	o3xwDhPBi5Mnx4qw7HWPiK/GzZj3KHMTgSFDHd3QySsuD9l15Yc8K+aaN7SuMuXnXZlasXfgNVIrH
	E5NdaY1W+qh9x6dYFayDFYbFjqpBLD4KRYUhhZD0PpZu+/N2CMuOEc4tx8S+1J51N/WOE7l+O+4rq
	FRL2CZ7wH2RuDKFqPCdlV+sObh/jvn7Dg/HE4NSYHD1HUmAvIomtXKHc+HQ2WiiGEe8jIPpsK5D/u
	/TjvMjPSPWbyEKPOi3UgQuirvLjB2IX0kQaI7LOPUnvXta9+JW21MYsePuxqRWByPvlVkYvmnt3Is
	+jWRlnGlT8n6xlQt0djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRr7-00000009cdI-1Vvx;
	Thu, 29 Oct 2026 15:15:53 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRr4-00000009cch-2jsK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:15:51 +0000
Received: by chaosmail.tech (Postfix) id 7FC7D1C8AAF;
	Thu, 29 Oct 2026 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793286948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=td6kaJNap5lHOA9xLjt4KXsEHf+nBxgRWvMp6ArrgKI=;
	b=tL/+CULXm43sCFkOeTj/6pOJMpJqM+SrXqGQN/lG5c1NotoRgLocFxXZybYiBa6TEIYZkl
	qrjWSgqlqV3nQrMCkNZkoOcKcka1/qV7c+7n+tewMo315IC+h6wiHtS9WryxeT4khZnxkt
	oR2XYqh1WZ17KeFPuVd6RVg5Vss13ns=
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
Date: Thu, 29 Oct 2026 16:15:36 +0100
Cc: Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <53D3B33F-4B52-4782-B88B-B8ADA29523F5@chaosmail.tech>
References: <20261029105908.22809-1-sn125164@gmail.com>
To: Jacob Procee <sn125164@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_081550_851692_52BE1ACF 
X-CRM114-Status: GOOD (  10.84  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Oct 29, 2026, at 11:59, Jacob Procee <sn125164@gmail.com> wrote:
> 
> - residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
> + /*
> + * The residue drops to zero when a descriptor finishes, before the
> + * next one is loaded. If the finished descriptor's report is already
> + * in the ring at that point, the position below comes out one period
> + * ahead: with residue2 == 0 directly, with residue1 == 0 through the
> + * residue2 > residue1 branch. The next read is then behind it, which
> + * ALSA takes for a wrap of the whole buffer. Re-read until the next
> + * descriptor is loaded; the limit covers a stopped or starved channel,
> + * whose residue stays zero.
> + */

This wall of text belongs in the commit message, not in a comment.


