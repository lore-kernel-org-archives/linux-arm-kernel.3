Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5617606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3yxduHDG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ct3RZzN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OIX7l9JSAlMqQr0Ju+ts9cEQxL6n0uf9RUiDDUXeVNk=; b=3yxduHDGeXLlizCTEhUQUunoTb
	Pts+eQYKPod+ssVQ+kiTHURV0pNFAozzYYZslWLbMSK3FOzWh0t2hH74VJz2u4o6R3/fMYLfNTIkk
	iWME90tCpMKGkPxZr2Tsec6aiE39mV8jNpRnaoY6h7C8yCHZRii8nPvcliaOMrkKKiZc9hido9Z66
	u2qHI2drolFCcGXkc8ozlu9G9UneCRV9v2nN/PnunEsiXYzPzr/rm8F6zQp1GCgLL5I7xQQfrvQ+t
	15l1TeF25/2a3ypR2T46IviWE1ZWilxZxhCbSm65rr7oosI8yLj6rOCjqyTNGzWPOxtgJNvJU3k+O
	JPhfffMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9nW-0000000FmCr-3eR2;
	Fri, 23 Oct 2026 07:34:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9nT-0000000FmAs-1X3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:34:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2776602C5;
	Fri, 23 Oct 2026 07:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E3E1F01828;
	Fri, 23 Oct 2026 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740878;
	bh=OIX7l9JSAlMqQr0Ju+ts9cEQxL6n0uf9RUiDDUXeVNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ct3RZzN4FJzAgCV52jbDVDNq9GVv8I51XFFJHPXlHaFYSdf36kkOA5pWMm9a6Twnt
	 moism0coMV3XQTlXilR3+WnBaYjky98vNdZeH9T+VYV4NDmnKNoLl7BKOl3C5Xgvdr
	 xXnZRnhRvap+mS/jSkfMbC/4ld0F90kOYqOCTiTbuDn75BRT5KrT8sdEaXi5XYcgLJ
	 GIaiNccrKFRrgs2tHq2Rx5sly+0lGsa/tkkGUy16qXyv/mWv4dUtAUfSl19Eiit8Nr
	 JwcnEkQsKulvCRRSoOzy9yrTp37ptNuJuJW5WlKfAIFDuV4ozP2YAQEM+K1aSX76e+
	 NF1dRo6+GdNtw==
Date: Fri, 23 Oct 2026 08:34:33 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: sparx5/lan969x: do not read past skb->len when
 injecting a frame
Message-ID: <20261023073433.GG708417@horms.kernel.org>
References: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
 <20261021112533.m6fh7xoqp74uevho@DEN-DL-M70577.microsemi.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021112533.m6fh7xoqp74uevho@DEN-DL-M70577.microsemi.net>
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

On Wed, Oct 21, 2026 at 01:25:33PM +0200, Daniel Machon wrote:
> > sparx5_inject() writes the frame to the injection FIFO one 32-bit word
> > at a time, and pads frames shorter than 60 bytes with zero words.
> > 
> > Before this patch, the last word is loaded whole even when skb->len is
> > not a multiple of four, so 1 to 3 bytes past the end of the frame are
> > read. For a frame shorter than 60 bytes those bytes are also
> > transmitted, as VLD_BYTES marks the whole last word valid and the
> > padding starts at the next word.
> > 
> > Write the trailing bytes from a zeroed word. The number of words written
> > and VLD_BYTES are unchanged.
> > 
> > Found by an AI code review agent, and reproduced on lan969x and sparx5
> > with register injection: bytes 57 to 59 of a 57 byte frame were not
> > zero. With the fix they are zero, and traffic still passes on both
> > chips.
> > 
> > Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> I somehow forgot to include the target tree. This one goes to net.

Reviewed-by: Simon Horman <horms@kernel.org>


