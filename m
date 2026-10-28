Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A1606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wh3IF52m;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYA5luYs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=airiPRPpuqyAkl18ksOwT7H/2GRUZL6k3C4fmXWBz90=; b=wh3IF52mWLQe+L4fHByxM6seBO
	tYwHTrERLc07UFzsVpWk7/K/1Me/DkwPaTLKwpUg6lk8MACWlVCtyOCGtCa6LYVNiZetdNW+nW0hp
	kLv2zO8ZNtj1arxjTTZ6vbggGAhKDoSsxOkJml6q+2dsNvaQ4djXO2yTIbHhuC0Wf7Qqj0E2DJF5F
	zKOT2aMmHS6Fh0tXtAmt05xf7OtJWGSgRAduyjlBN1jPuHuWyz4uyagWJd5BADmx5xOc31fWiIMwy
	VJUbwBIQ6/ridwiZt5f7wT6Wb7Kp+FDTOQKwuYYSgLSvIbofahHQfOpfuv3KWzZGGOn4eYK+LKZK9
	aPdTYOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLygZ-00000006Vn4-2NzU;
	Wed, 28 Oct 2026 08:07:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLygZ-00000006Vmr-07kl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:07:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AB43410BB;
	Wed, 28 Oct 2026 08:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACDD1F031E0;
	Wed, 28 Oct 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793174822;
	bh=airiPRPpuqyAkl18ksOwT7H/2GRUZL6k3C4fmXWBz90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYA5luYsWX5COUjONr/9aduLv234Wnz8XwLP3+qiIf5Bzc+E3dV26Px0QSluE9VeI
	 ooIb5mlRz6iOWo3SULHaNXYArpAvJsz/ddEhmzbSTkwWv6gvffJT2pqKsQrxyOxuVO
	 OFkw+1gGSEjFLrcKup2C5ELqqb1xR4MaUxXPdM549SKW/1Q3YwI3dUNqlVwn6mRrWm
	 4IwAiw+HhH8jZfnharzZ5og3XhsKOS2CF2C0l59lcXxZJJYJn2umkngWToLE5LrX28
	 6Rh5mCw/mCe9DG8kIH0WtNZCe4HZQ9qEgo1DMOhuhnsq0gCE9WIW5YimmfX9/xrEoc
	 Yw2x4aWUXkCYA==
Date: Wed, 28 Oct 2026 09:06:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 3/5] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
Message-ID: <20261028-durable-merciful-caribou-1f3da7@quoll>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:05:31PM -0600, James Hilliard wrote:
> The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
> component parameter register does not report the FIFO depth. Its optional
> register layout also differs from the generic DesignWare integration.
> 
> Add a specific compatible to identify this fixed configuration, retaining
> snps,dw-apb-uart as a fallback.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


