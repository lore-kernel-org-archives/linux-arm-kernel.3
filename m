Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD3606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTSXNWQG;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Kqh9JhAM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iEpvVq7FVEoozjtpZonOLgpLctwFwcvJ34eDuYmErQw=; b=OTSXNWQGg7HnXg
	SwBsgFJI4AlSiNXGFbyLCX65h+xW/NbUlrRYtLoZwkutN6lPeNISysetPJJsRpywmytT7JbejjBq8
	64ljnGAP7PPuLv4BuRKC8IJuPaknAfgZQLbe6BzbmwS01eaURBqIO3md4cxwMXe2vM3of2vS8VESL
	Oehi3KGMNTxoT2Qpk6wwE2qZbzBMd5/Wp05oe9Ev6OGtHRDCXLdJO7j42KaDqFnM9BnFSva3HMMuT
	hxZLmUpYDF0WwEQ787vY5OK87BwpUB5o19fanv2PVnyr5NlnPaBqAYMkfnKBaFbp2+CiD9MBo+8og
	+vxWp0tfu97I3uXXO3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZf-0000000C2m2-33Ag;
	Fri, 06 Nov 2026 10:53:35 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZY-0000000C2hh-0v7r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:53:34 +0000
Received: by chaosmail.tech (Postfix) id 567331C860C;
	Fri, 06 Nov 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793962404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEpvVq7FVEoozjtpZonOLgpLctwFwcvJ34eDuYmErQw=;
	b=Kqh9JhAMCaorwWAMgRue2BDo7gF5XvtgqRVnKhCuS5lMAmpwJ2b8OpG3hgpjumcTNdlELF
	3uZTqbFA/CUAU6nP13O8LbD0f/HKH7zVP5Zfd1kEG2B8jZjYSo8K4V528qL8dGxC8Au2y0
	4dIg3xd22gN3ERCuR/Quxclfz3qIhOY=
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261106113946.60c6c5f6@kait2en-mbp15-1>
Date: Fri, 6 Nov 2026 11:53:13 +0100
Cc: Myria Sarvay <myrialsarvay@gmail.com>,
 marcel@holtmann.org,
 luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 sven@kernel.org,
 j@jannau.net,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Yossef Osman <Yossef.Osman@proton.me>,
 Aditya Garg <aditya.garg@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks> <au1uH6uxtsw2vHfP@macbookair>
 <20261106083339.677cc75d@kait2en-mbp15-1>
 <CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
 <20261106113946.60c6c5f6@kait2en-mbp15-1>
To: =?utf-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025328_743195_462CD702 
X-CRM114-Status: GOOD (  13.57  )
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

On Nov 6, 2026, at 11:39, Andr=C3=A9 Eikmeyer <dev@deq.rocks> wrote:
>=20
> On Fri, 6 Nov 2026 10:40:58 +0100
> Sasha Finkelstein <k@chaosmail.tech> wrote:
>=20
>> You probably shouldn't, or at least base it on v2, not v3 (that one
>> ended up being a bad idea and caused firmware timeouts, so Asahi
>> downstream ships something more similar to v2).
>>=20
>> In addition - have your tests included entering and exiting stream
>> with an ACL link active? That part always caused problems for me.
>=20
> Hi Sasha,
>=20
> I tested both on the BCM4364 (15,1) with 2.4 ghz wifi under load.
> Your patch (668d849694ef) and mine, each with a reconnect, plenty of
> A2DP stream cycles and profile switches with the ACL link up.
>=20
> Mine sends 0xfc57 1 ms after connection complete, before AVDTP Open.
> Yours right after AVDTP Start. Both complete with success. Neither
> needs it again when the stream is left and entered, the priority stays
> on the handle. No timeouts with either. The short glitch at each
> suspend is the same on both, so it comes from the stream restart I
> would guess. Scratching my head now. How you wish me to proceed?=20
>=20
>=20
> Andre

Sleep. I intened to say sleep and I have no idea how I managed to typo
it as stream, but that is what I meant. Sorry.



