Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E53606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDaDdIEm;
	dkim=pass (1024-bit key, unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=EEnDX0BS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=; b=uDaDdIEmLVboSj
	kQEnj2YsN9+FBeSaKcjMHRJdzTC0RVslvX1MU4NXnG7PEiQMqiGeo/+LHgmIAmVpvTgDxxLVwdr6m
	1VK9vaTV+8losB5Hvjf+aoHjBMfs9d7Ix5onz1bYWcuHDX0aIVFdEESPVHzQNb2FoYigjSu63T0kN
	yrLeh2iNDLuUglwosxY5X0JE/4H5PR8xuF8GroSeq4qPIb6J1ZF4ujOASVhsWmS4l4kWHgQ/H58PW
	FEqwdsiGy8nAyepRtsXgsPuU28O7W2Mp8SeCjfitPyCkBBH4jxcSC/EG681RREWoVziKCq2bOpPvK
	UqEkk/t6YYbPz1nJap1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVK8-0000000ABqu-2tc3;
	Thu, 29 Oct 2026 18:58:04 +0000
Received: from hutie.ust.cz ([2a03:3b40:fe:f0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVK4-0000000ABqX-3e6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:58:03 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1793300274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=;
	b=EEnDX0BSYpOpB7ttnQvTF5RTelXI9oJqBT5f7zLI1630qhiiHldNhXesO3+y5lTPTo1Lgh
	zoOk057PwCWEPRJM3LMuu2cRGwr9o/Fa0FD5UXy4Rk02bD9wtPqYS5huuyjetR2hKdF1sD
	c+fZrxJzhrdmSMidrW8Idt6WzI20Vjc=
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
Date: Thu, 29 Oct 2026 17:10:21 +0100
Cc: Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
References: <20261029105908.22809-1-sn125164@gmail.com>
To: Jacob Procee <sn125164@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_115801_640166_94D7EBA2 
X-CRM114-Status: GOOD (  11.02  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> On 29. 10. 2026, at 11:59, Jacob Procee <sn125164@gmail.com> wrote:
>=20
> Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
> irregular intervals, audible as a tick: 8 times in 3.7 hours of
> playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
> jumped by one buffer size while about 70 ms of audio was still queued,
> and a kernel trace showed the DMA position stepping back by exactly =
one
> period at each of the 6 underruns it covered.
>=20
> admac_cyclic_read_residue() derives the position from the report ring
> (periods finished but not yet reclaimed) and REG_RESIDUE (bytes left =
in
> the current descriptor). When a descriptor finishes, the residue first
> drops to zero, then the report is posted and the next descriptor is
> loaded. Usually the last two happen together, but occasionally the
> report comes first.

Hi Jacob,

this is an interesting change. I agree with your assessment that this =
boils down to assuming REG_REPORT_RING and REG_RESIDUE get updated in =
one atomic transaction after completion of each descriptor. To my =
recollection, the driver is written assuming this behavior as a guess. I =
have reverse engineered the block's interface by looking at MMIO traces =
and by direct experimentation, neither gives certainty on this point.

Rewriting admac_cyclic_read_residue to avoid the race altogether would =
be best but until then, your change looks to be a strict improvement.

Feel free to add
Acked-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Best regards,
Martin


