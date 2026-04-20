Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD193F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUJeKmZRdGaqomDdQMmprgcY1GzX8dqOVaq6UUXLVW0=; b=E8VdgSLWOtCTmS4Pi9QSnw+1iV
	zT2z9QqMvr3E9odCsB4/0BrckWNmKlggfEhTnL3ZHEw96xMXFulv0nklhfPFbZKT2IRKDk25i0rtF
	5G4q6P8ASYj4qYMQFk5SZz0wspGLz6zdFz3pEo7cHNg7Mw+w8Xfs7wUrNE51AWgaOsAhtumarS7TZ
	VVH0EmyA///pfcrMbo8UsSya7MGBuAX1waxDvipIg0GAPJUiBlSLivL+5bA4E2QHul4innEs4ppAg
	DQT+ss0/CItCYnzOwT/Kda9Ga/PBiJEEo7/uDBAOcoaxHspgkJX3jGmBobsdyc3wb5IlT14Eb+EW/
	p1NOHgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw4K-00000007iBs-13Sz;
	Mon, 20 Apr 2026 21:22:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw4H-00000007i5e-05YQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hUJeKmZRdGaqomDdQMmprgcY1GzX8dqOVaq6UUXLVW0=; b=cLT234+f+0c3FCnZqA9cYguFYa
	MCq+HyhMx+VUBQbfLR7gTgJop/NCuHrOwOuPo9c9dNk+YVflYQMpDVZDW24r/PS4g3NWf7SpfnxSL
	+IlKF9KgAcJCf7j6ajsbWZ5nRu2iGiIVvq2J+NzrfforMnteaKi8S4YXUjDBWmB5BFAElcMrPEy8i
	YD/omd67zZsdHOQoGhPd/raliDR1rZ6wSdiCjw5eO/JK3PbHBcitoQkLpZCbokBQDJfDFYCpSYA6v
	L+q4AxVvn9UqATrbOx4qmKsZmPfXdDstZNt6gLlLuLHGgHRtWSVPTpg5MXHkSYOtOQ45rMs5adtYU
	onXdqUYw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw4C-000000093nL-2VF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:22:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso11762375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720121; x=1777324921; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUJeKmZRdGaqomDdQMmprgcY1GzX8dqOVaq6UUXLVW0=;
        b=RikBK19RHTNNQndtgzxkt/VPeBkTt4ZPp8u2Fp4dvRe6eEPmtyoaNe23Bbi3S8/twM
         i1MdFCUpiVxnuz5XbiBqQxlWHrWwck6L6sMMhiK8nafWeBU6LeAO35oy/dTRLK6Pn5Ya
         g7NsVwysLlfikwLs9Fa6/MUpJQgo8S18H01igiSP70K7E5+N799OjnsAKZc9dd8VrfQq
         Lw5+E1+HIwfiJS6qEDcKsjtmOGS4WG8+HUk2Ty7Yf00ga91l+omw1EatWuEu8sfQBZU7
         vBFNO5Zyi/D2Yo/A5hoCJxiKLgujVMYb4+Xn6m3MRQlUMJeq87TI9HT46ww+7ORlSDUK
         gitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720121; x=1777324921;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUJeKmZRdGaqomDdQMmprgcY1GzX8dqOVaq6UUXLVW0=;
        b=dOA7x9Ou+S3xxmSqK33EMhreMJlnOUGl767v4nLZd9SvkgaCY6ZmH0eLusKIxO9BWK
         yYgQChWa1mglhnGEaCXX0OS7H4iHKh3ykvZsJH3/+pyk5Wt9xZivM4eXV1cJWNPJDMPr
         22WMkExc58YOcfAhQ+BLNnBj8lbfw/QNJQg9Y7k3vcrM1v0RRLndyqaviOnvUllmq18L
         o9Tt1uGfpVI7bnN0fMAyF6nQbn7SKS0ThJiE9T3IGonvn+WzbywBLRA1r/hSDb4ZEOMK
         4qLwPMcAVrvbM8jv8UKadVH+ebRY9nLmL/af0ZkzrH2hqygWWq/BLHJRMCKf5ZFULaYp
         XT6w==
X-Gm-Message-State: AOJu0Yzre2OQ3QA3nODviRGJ9q1Wjq8Xm4o4KTx6FCE+0I9pOxQzLx/A
	gYO3Y01OZKXvofFCFclyiJvYat6l4Mx82GJJKgtrOVGjzGPsO6Ldp3g6
X-Gm-Gg: AeBDieurg98yMdcqqPyOsWw1PcSMd0Bma+FjDyjSq297L+MphLl0f/ntXao+fI3zGRy
	ytWb6Qzk4Cne2EQ+9cK8b1pIdQY8hgu4j4psXa9sa6Axn2Pc3YjLLvV/AxOirnIoD+BxnJY8VG5
	dV10wTeSmLEjE0+pVbVNjE7D7b6fp2ZcYtEmt6dGcckp46IM1c1eU9GPwLRgIZVNq57BmHaxHhN
	CORrMTXStolVlDAqzTaVFJiWjyrS0N5ta0Xok2Udgsk0ld5g8Sg6C339q7NX2Bi2Jh1+ptW0EBr
	6g/c8LgQX9id9iabI04eRJudPYd+h96f3/KA4SF/uoLfcj4ivIny+pH5OhQwU4ezj63/AX7z5PD
	nTgMI+Ucf6bBIXHT5fYzksxohUSgAYow8ENRI66QMNjIseoaDs3K2WcM4Z4srxfsW86xEWUihuJ
	YNetvC8wWkHxkqSgidZJ9lXJDHfiuQs/KpCjm4rGGbQSm6tA==
X-Received: by 2002:a05:600c:64c8:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488fb7a0d24mr251225625e9.30.1776720121061;
        Mon, 20 Apr 2026 14:22:01 -0700 (PDT)
Received: from strix.localnet ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm125023055e9.13.2026.04.20.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:21:59 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/8] ARM: zte: Bring back zx29 UART support
Date: Tue, 21 Apr 2026 00:21:51 +0300
Message-ID: <5075672.GXAFRqVoOG@strix>
In-Reply-To: <CAD++jLkkV0h5R5=2sWNcPCV8h9vJHXCRsuaFxS7_bBZH0nZKUg@mail.gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
 <20260414211215.152850-7-stefandoesinger@gmail.com>
 <CAD++jLkkV0h5R5=2sWNcPCV8h9vJHXCRsuaFxS7_bBZH0nZKUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1964088.tdWV9SEqCh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222204_683118_FCF36965 
X-CRM114-Status: GOOD (  14.53  )
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

--nextPart1964088.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3 6/8] ARM: zte: Bring back zx29 UART support
Date: Tue, 21 Apr 2026 00:21:51 +0300
Message-ID: <5075672.GXAFRqVoOG@strix>
MIME-Version: 1.0

Am Montag, 20. April 2026, 16:00:24 Ostafrikanische Zeit schrieben Sie:
> Topic should be prefixed:
> "amba/serial: amba-pl011: ..."

I'll change it

> Interesting with the AMBA pseudo-ID, but I kind of like the idea.

It wasn't my idea. That's - as the description says - the code that was once 
upstream before it got removed in 89d4f98ae90d. This is also why the 
ZX_UART011_* defines still exist.

I re-checked if the device identifies itself in the mmio area in any way, and 
that I maybe got the size wrong - but that was not the case, everything past 
the ZX_UART011_* registers is zero until the next device starts.

> Things without bit 7 set such as ARMs 0x41 and Qualcomms
> 0x51 are kind of cowboy values however. LSI 0xb6 is the only
> vendor actually following the standard.

> You could use 0x7e.

Another idea I considered is using ZTE's 0x8c (assuming that "Microelectronics 
Institute ZTE" is the same ZTE that made the board), but then I would have to 
invent a device number, ideally without clashing with an existing ZTE device.

Thanks for the review,
Stefan

--nextPart1964088.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnmmO8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi2K4P/RICfG/HQyKWKAxne3oM
XRX2QVS36y8MQqqtkHqodZ+Ayy+pozZ2Va/TXqYkrel7adwEKXruYlUlWINfeLEL
bgtSAXROc2+bkP/AIl4UNFNYiNcMA3hffZP40PxGugRvKXYHSVsOJE7kzR5DeO5e
cB2daDoEHUcP1/mkT1ApIMrFsPBUY74cngQLKLAGRZ04JZJOWyM7hrU/y6h5WsEx
clH+hQmeG7R9t1JZzVn6Q6HR41s4AOz0GBAnkX7KcnnhmOvTEKgp3bzuFtKvprib
gQ2cGCMzxaSmBQOTyfTrm+M6QsWe9bS8ky4/81UXyQqu4vkKO6FjTsmv7L81QrPB
+qOnQAy2OkFXJpvlAFJUR6J7Et4xyc1luofnILUzh1TCkGlFHzaaU9CHTJgRUt1H
go/H01bivFpSNXG+3zzMfNr0RDDCzKSWH3LDMZ8F0ZHKHbDZCDvEbt051Z7k5bgZ
nsOtD/VSxv0iQI2Ja56pEO5w6o47b9fbLTZK74gGrCQujbbm5QxRZqFig+WZte4G
wL2uHgLcK5CYoQ/Vpch6SbhgJFPhXj3/2Bl44gQnfJe6aewgEarVuzQM3Sw048W/
hhZbjWaiq2S2F4Q2/lUy5Sca/kaMUyuEBeSbLOkR2KLqEJS4n83yuyx8sIRYtj7e
HbmuINc6TvTIEno2pOgsbkWg
=kdcD
-----END PGP SIGNATURE-----

--nextPart1964088.tdWV9SEqCh--




