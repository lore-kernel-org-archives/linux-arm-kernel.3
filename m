Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2060A1DAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WtfnPr+V;
	dkim=pass (1024-bit key, unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=m8cVUxk9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+8z6SUsF1e/REU3gcCFgmzFmcfdajlFQZ+TsooPdb2w=; b=WtfnPr+VZLzq2V
	pDRrMrCsCwjnV/tglqQsGv5Pqrxt8uaglqj3O6pkHVt4RZs88Af6C1W1MzQN4D8lSVDw9Z3aLmF9y
	e+4S78YosZwDBrAwmJPcBrw5/qq6j7aarDkY48EspHGwXmyJ+cXukgu277OHMBTi0P8enznXCOjsY
	wmIVSC2pGTIpWz/NnAx0Fx1Dbkp7/8RSHVgmUnPUoXVauUZrINJBTto2tQOxwY7zsoZ+VaRzsi9Ub
	CESi3Ip/8+1qsxL+CaDmK/ZSNgdi27Annxey+D5gYi0dj1ypvyIgAXoszWi96MkJ9TicRMfK4VlaH
	Bs7av4XMTMOrKCFr/jJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNv5C-0000000HJsi-2H0O;
	Mon, 02 Nov 2026 16:40:30 +0000
Received: from hutie.ust.cz ([2a03:3b40:fe:f0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNv59-0000000HJrh-1BgU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:40:29 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1793637619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8z6SUsF1e/REU3gcCFgmzFmcfdajlFQZ+TsooPdb2w=;
	b=m8cVUxk9LKNEPr3m/MR7d88NgB2/WgdRjvRmOB9r9o9ddnqU2g/Jc5PeRP+X+92RTHuEC0
	76ZngKKW8wXzobtKVmm0T+I94y/qsJuLY6033Nhy0cTHOxX0Xo81VfGCLYN4Je2dql/u3Q
	GW+69BEZsO9PmYrV6widckXt7OdWRxI=
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 17:40:09 +0100
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
Message-Id: <774174DF-C530-4BA5-93D5-879D3D4E27D9@cutebit.org>
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
 <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
To: Jacob Procee <sn125164@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_084028_090362_D7A7EF70 
X-CRM114-Status: GOOD (  19.43  )
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


> On 2. 11. 2026, at 10:45, Jacob Procee <sn125164@gmail.com> wrote:
>=20
> On 10/30/26 08:35, Jacob Procee wrote:
>> Thanks for the ack and the extra background info. I would love to =
take a
>> look at a race-free version of admac_cyclic_read_residue() as a =
separate
>> follow-up patch; v2 of this fix follows shortly.
> Hello Martin,
>=20
> I looked into this using REG_DESC_RING. It only contains descriptors
> that the hardware hasn't fetched yet, and its read slot is effectively
> the hardware's fetch pointer.
>=20
> Unfortunately, it isn't updated atomically with the residue reload
> either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
> DESC_RING still showed the old state even though the residue had =
already
> reloaded. In another case, DESC_RING had advanced while the residue =
was
> still 0 and no report had been posted. So I don't see a way to get a
> consistent, retry-free read from these registers.
>=20
> One could make the retry check more comprehensive by using three
> counters: outstanding =3D queued + playing + reported, with playing =
being
> 1 unless the residue is 0. This would also catch the reverse ordering,
> where the report is posted after the descriptor is loaded, which the =
v2
> check doesn't cover.
>=20
> However, I left the debug module running overnight (10.65 h, with =
music
> playing through the speakers), and never observed that reverse =
ordering.
> There were no XRuns or backward steps. The speaker channel had 96.6 M
> reads and 15,483 boundary hits; the second channel had 29.3 M reads =
and
> 86 hits.
>=20
> All 1,498 snapshots that failed the three-counter check were explained
> by read skew: 822 where DESC_RING was read before the fetch while the
> residue was already full, and 676 where it was read after the fetch
> while the residue was still 0. The positions returned to ALSA never
> stepped backwards.
>=20
> Given that the more complicated check would only handle a case I =
haven't
> observed, I'd prefer to stick with the simpler v2 retry.
>=20
> Unless you know something about the hardware ordering that these =
traces
> wouldn't show, I'd prefer to stick with the simpler v2 retry.
>=20
> Kind regards,
> Jacob

Hi Jacob,

I don=E2=80=99t think it=E2=80=99s worth doing the more complicated =
check either. Your v2 patch looks to be good enough given the available =
information. Perhaps there=E2=80=99s a way to do the residue read race =
free by involving additional features of the block incl. registers the =
driver currently ignores but until someone discovers it I support going =
with your patch.

Best regards,
Martin


