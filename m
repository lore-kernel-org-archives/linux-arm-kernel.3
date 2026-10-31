Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WN4tMTnP;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xU8X59Xq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xOaXH4PEGmhU3k2OJSZ6CM7Z/muRblvptuHyGveShks=; b=WN4tMTnPcO/2ngiBn8tCfTbZEp
	85E34oPmQ+ZJfD6qbOHz8cNj6mQQ0nSWZLFvpijRhvYzRjb8OXQJ+/fqUcwOAUWDhZiNNekkMcEhi
	rbj/xfZzTfV7nC0Uu4NJOYjmkDfputJWS4P1ycqBpd5xPb8/jeMANpBGh2bifH6b8N9ZGapNT1eWo
	KdToTv9EBksavddCgib9DwFurw0FvrNymfzLoiRFw3CvOTE612DaP9U947XvQA/KIzcUDGfcPEZ4V
	i+K3x4uvLZ6kZDnmizlwydp73JP3HCpvDWpnT26fqX+gYVvQ5D2Y6jpXr8Ct3K6GwzXgpyihJT34m
	L49KdP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFjM-0000000DfLc-086k;
	Sat, 31 Oct 2026 20:31:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFjL-0000000DfLV-1i4k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:31:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86AC0600D4;
	Sat, 31 Oct 2026 20:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AC71F000C1;
	Sat, 31 Oct 2026 20:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793478670;
	bh=xOaXH4PEGmhU3k2OJSZ6CM7Z/muRblvptuHyGveShks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xU8X59XqFS9s9oMFP+Mmc4VXMicv9Ctg5b/6CRFpNACSy5sfp4YY/hbwrtCrYLinO
	 pDji2Wtwn3/ny/K6wbl7Enw8UqekxC65wexyyiTmkMCqRZHsahAQOugm4s45TMhMxy
	 gUqVsRzQKRRXg7DXYpQ4SwOxXoHgk6e119JZ9YNQ=
Date: Sat, 31 Oct 2026 21:28:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: tianci xie <xiex16070@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush
 race
Message-ID: <2026103142-shorten-shindig-bedc@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh>
 <20261031152656.1422-1-xiex16070@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031152656.1422-1-xiex16070@gmail.com>
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

On Sat, Oct 31, 2026 at 11:26:55PM +0800, tianci xie wrote:
> I do not have a Linux machine of my own.  The x86_64 build above was run
> on a rented Linux server, and the arm64 build was cross-compiled there
> with a no-libc aarch64 toolchain; that is as far as I can take testing
> without hardware.  There is no Exynos or Apple board available to me, so
> the model is what stands in for a runtime reproduction.  If you would
> rather have the flush modelled as a KUnit test in the tree, say so and I
> will send that instead.

Sorry, but stuff like this you are going to have to test on your own
system.  Why would you do linux kernel work without that?

greg k-h

