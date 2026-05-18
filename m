Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=; b=clNKXW8ZwgZLTXEZlWleN0F9bC
	fd+CAQWLpFIFesP1FW1zVjC6W9BxjdqmBtTvji9ytPturtwoEjF/6XTsC39VagZePLTEZlJB2TR4h
	pJcSrys8pqQteYxOxCVNKx/24Pf3R4gipTFQUG+6Os/YVJvk4tl72QSqoeDpqnSM3CS05QhZTwXOw
	UqGhygdi3LxGxuYo4kr0YlKinNKRigTDqYNZLSSDBCWejTSshj9pfFwKYpg7+6M191NexE4wp4SyT
	9mnAmtqWljeMQ2KzuNm24xqVt64mukDXb8rPFjXTfYd5uoYO0hhPEKK+LvqEHS5wa0IBU8i5Ursir
	IOZFK7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwAX-0000000FR40-2VVC;
	Mon, 18 May 2026 11:29:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwAV-0000000FR3D-28ZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:29:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48d146705b4so23186895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103794; x=1779708594; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=ntWHhVMgvHsXxz21bxuyTNrvDDSRy4gja33l03eyzXu/aWLekcWFE5k1VSxf0Yf6Ks
         48FTAiuJ84nVmFYgYbNCXCrGfk61qjPEmU9WcVfkW8C/1gb8h2UhK9nKJtwM5kzj8KJB
         jKaWdiMnCdn3BLUVPvgMO/QQQ8YFgap7R1wSd/p/L1gsBkaTyy/TL9c39VYU1YSYEjw7
         DW1bzxxg1s61LpGUD8yfGyyGyAE4SY62HII/+MaK0bqTRj3Wawz8S/bPWvP1VIe1Mb4O
         WCU0AoPHokRMyFWawD8pwx3f77ToA+QhyHnfQx17XADlf9XAqbGmffijFbnZmQ5R++RF
         UUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103794; x=1779708594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=UHIr1GFpCI7f2mT39Mkomg60beNFuRBzFlYje8yf7dldbsprWgLVBO6h/7ZrElvmlE
         jjdHJW50ke4Cm+W550caUi4WIXx2pe+q5F96GZeJqIHTaP+9soUrUUz7qG3f+kvdRo/d
         pYdTXU3E+bytRkPHSemAHbj/Qf6mv0SBmpDmTz8UWb+lfx8Fdlir130NkMSnOrMNzo/7
         tNAcbG6ycd6o6P31yyX1+qYT7OgKuQuSur4jWGhMfOSmkWbOEeHa/xNxdMUnes/vPYOZ
         vzjDdeF96Ox/6tb7n0vEvirBHh/P1KOWH/OAcZ28Ykd0sMrqOhq20t6KZzynx22yXb47
         krMA==
X-Forwarded-Encrypted: i=1; AFNElJ/EzKqJI86QkM1OY3xqXKiJEPQ0fxurCiyo28nX1qzGna8mCBI6DeScE9iLfIlAwFO4cdW+aEBSNt0cNK/xIRtY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9IG2uMeXAa41oRWi7LxCL85R3Bs4pH257Dr8k90JfIz7zphiC
	FaQmfwJmnw9beZp99txezCIuG7R1+bRiR3toawV05QGZwwTnBQLdqr/j
X-Gm-Gg: Acq92OFJo+2HOWdKdLBjErbTG980GCoTSh1ZwVCvuZSCUkPgzY7LkT3qk9ir2CD5TYA
	0KgBHNxUxSIfwAii6K3HFSJN7UIV84WkKozeywm0hziMdZIC047oKeF2liMfYThfwqfs8nsAGdF
	da0f7pizTBI/9MmTZ3y4B8LwtqZFQDqZYPGdQ4GqZwQ5xcMTumbS69CRLlyiVSFea1yvCuE8wq4
	tNVTYMzdZ9VPEJ2HCECZ7gBAFMQa9/DUTae04QM9bKrlYFYMyMRMuLZFR7S8x9nvj/ZklcPJOk0
	MU0bpdIrBNUEwqbr1p2PkY+0sPq1f4fFCkvBYn5U6cji4hpzgRvFyaCJntw+xUv+h5OIz2hO8pU
	s+xib31QUgBfYM2NZrjgpdCKfsFQYjlDB+c/nMBc21AYEQuVvigEFPdk3Equ/RjQnAMygSah2rb
	tWleVt+juzpbUac/rlTmkAWtt3RLqi/KwX37lm2jlaws4OH2RZOUIyT3jqjCDzEC73fj3gc3SPd
	o4=
X-Received: by 2002:a05:600c:8184:b0:48f:d1b8:9aa5 with SMTP id 5b1f17b1804b1-48fe60ecd7dmr220286485e9.8.1779103793402;
        Mon, 18 May 2026 04:29:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm80885505e9.13.2026.05.18.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:29:52 -0700 (PDT)
Message-ID: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 13:29:51 +0200
In-Reply-To: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_042955_553058_A2E3B99B 
X-CRM114-Status: GOOD (  17.59  )
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

Hi Andre,

On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
> > > And anyway, I see a *dual* USB-A socket on the pictures online, in
> > > addition to the USB-OTG port. So where does the third USB come from? =
The
> > > A133 only supports one host USB port plus the one OTG port. So is the=
re
> > > an USB hub chip on the board?
> >=20
> > There are two hubs, one on each usbphy. OTG side hub is even bus-powere=
d,
>=20
> What do you mean with OTG side hub, exactly? Is there a hub on USB0? How=
=20
> does this work, then?

the upstream port of this hub is wired to the USB-C connector, one port has
CH340E USB-UART on it for the console, the other port goes to the SoC usbph=
y 0.
So it would be "peripheral" only, I suppose.

--=20
Alexander Sverdlin.

