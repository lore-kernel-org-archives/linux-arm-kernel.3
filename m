Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v8x6qbo/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ObgOMNj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1LoOI02nUgf322enYv05Hw1vZImTbwLOdnlR5QXFbCU=; b=v8x6qbo/MYFHnR
	WC7vagpYnf5kKo7stVenbvDNUXXhsmWETjtmVPGo3WxdYKYLuo6wqK5yGT0VouwMtW7uHGiIGUf1E
	sKEEjNlM4QitEqM/kbxR1h2tPnMExnflIlvjaqeURiCJrN1tahUo4TVrtrr7bT6prwra7bmF7z+I8
	AumhG3o1GRQFPWOnNrjgjLZXpZSvNLi8wyBlyrC/oAueSSiaPI0qa9Jwfc5+5rNVqTtTVZJM+0pV/
	6r+SU1DxtRkBcTe/1+c4LDAv159sgEC46JTYMu6e7z4637XknNwYvIjq9WoLQZeG0wjU6h98ToFO1
	TyC3mfJHLAKd0O8JRvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Lf-00000000XfP-3TWc;
	Mon, 02 Nov 2026 22:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Le-00000000Xez-0hI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 22:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D4D4600D1;
	Mon,  2 Nov 2026 22:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43001F00A16;
	Mon,  2 Nov 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657868;
	bh=1LoOI02nUgf322enYv05Hw1vZImTbwLOdnlR5QXFbCU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ObgOMNj5Lbd3V13//0LFm+utOm/JdVKk7AxgGFlxRn9SX1kIYeKyER2zPJe58+5XQ
	 ViXIdVRafeXa46tlIjLul/LH+U6Ul5GI+w/XunHpEIo5vCsjwSPUA807unl2WMxoqU
	 4l1HPGgjK/4Zyzs97BO/kAGr6KLrnOet/GT4vsZeIBsQT4EMFiEhRuChIuy//f3Mie
	 X08I1Qu/SZc8e5znS4ck/mQSOyJTDXaZFANax1+bymxWpu6iGPWi+AeWQbABWOibSd
	 iLtJg2zv7JVP31v0DmlEpG/z39iav5Jg8N9gs/+O/Y2G4h+EIa2kGCHzqFEEDBLb3X
	 UA0tO/6O2ynZA==
Date: Mon, 2 Nov 2026 22:17:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cwweng@nuvoton.com
Subject: Re: [PATCH v3 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <20261102221744.4bd13ae6@jic23-hlaptop>
In-Reply-To: <81173139-a43c-48a4-97c7-0a82de158b3e@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
	<20261030031501.130290-3-cwweng.linux@gmail.com>
	<20261101005312.1ec5e393@jic23-hlaptop>
	<81173139-a43c-48a4-97c7-0a82de158b3e@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> >   
> 
> Hi Jonathan,
> 
> Thank you for the detailed review.
> 
> I will address these comments in v4.
Hi,

A couple of process things.

Most of this didn't need a reply at all.  When you agree with feedback
and plan to modify the code, keep any description of that for
the change log of v2.

Also, reply inline to individual comments. The reviewer has probably 
forgotten most of the details of what they commented on and so
has to do the tiresome step of reading their own reply and then correlating
that with what you have at the end.  If you reply inline as I did during
the review, the context they need is right there.  Keep to tight
focused comments where you want further feedback or disagree with the
review.

...

> 
> Regarding the one-hot scan-mask handling, the MA35D1 hardware itself is
> not limited to one sample module at a time. The EADC has one SAR
> converter shared by multiple sample modules. Multiple sample modules can
> be triggered together, after which the hardware priority arbitrator
> performs their conversions sequentially.
> 
> The initial driver, however, currently uses only sample module 0 and
> performs one voltage conversion for each buffered trigger. Therefore
> the buffered interface exposed by this version of the driver supports
> one active voltage channel per scan. I will make this limitation
> explicit using the standard one-hot scan-mask validation callback and
> use iio_for_each_active_channel() when selecting the active channel.
> Support for using multiple sample modules for multi-channel buffered
> scans can be added separately in the future.

This part would have been helpful inline next to the comment it is addressing.

> 
> Since the scan layout is therefore fixed to one u16 sample plus an
> optional timestamp, I will replace IIO_DECLARE_BUFFER_WITH_TS() with a
> fixed scan structure containing one u16 sample and an aligned timestamp.

Jonathan


