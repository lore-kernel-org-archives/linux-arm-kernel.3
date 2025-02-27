Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022DAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FWwGoJ7epQNWqdDrQS9AM/XSZAntL4HGMy7Yq/jBwk=; b=GChkFBci0EynFfG/9lD954ue7M
	lOHfOmG2SF4DTj8cylnGPuWRzzBEAVLLr1KLuyrhEd+8F/0gDFnPBzu7GJ4W+QT0hRVDFGMGVY5OO
	uxr9maX1NiSwfgyRCDFsHYq8vIBMibcVQFNPkROYjd2vOE4w+5J3OrShwTU0+2v4l/9RnYeqFM5Cw
	4KDXOjWYq5X5eGif90MZ7oN7f+jN8w6bCn6uOpfrYNH9A+2TlkPsN7j3baKYV0CjRbrEu4Is52R9J
	7ymG5IO3HZgR1Otv/GJRtTe0uH2yXzCSF6UXC6REcg2OAxX+EJBCPawLNKH+YR6XlQMnKOGeoeRpr
	GN7IWbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncxv-00000007MXS-34wh;
	Thu, 27 Feb 2025 12:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncdD-00000007HlP-1bQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6812261528
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 12:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F81C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740657886;
	bh=6FWwGoJ7epQNWqdDrQS9AM/XSZAntL4HGMy7Yq/jBwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gV4rp0BCbXcPMqceIDXJqkfdjxwiT6GV+Ezo/gbexPWSVl5gECR+NNUVvi0PsXh4D
	 YQVZbD57JeTuUaBva8+c9qj/+1neTWMLrLn5MjQoqLRpMSvQqfuYk+EO9hrrEzEHCJ
	 amInlPngk0xMyAFhAUZnk2iGOUGqoZrwC9kiZtb457a/Cvl7HSUYUFZG06v45EHx+R
	 pi4Ogv2Dl8eMSIXonSWDgBakSJikd6rMsaeSkDRi7d1WrlDk1N8DekcmgyydT8bcPt
	 2kcm6WFMNQEpqJ669vh3bY+DR1UR1tHdStsh6C29vupRAwkpBZ71zX/6iREaLpZR3o
	 CQTy3vrhV52rg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a440effcfso21372911fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 04:04:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9/ZTM0Ms4vodwfg8PBD+9t4CavHDnyBLy0IMWrsZ5JJDSrSwDP/z73MqeNLlMlz1FoEy/SSJ80g47ERf4c3BD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4TBIYSPmgAOuZzEqLY9VfgsT7Drft7STPwSbfRkqgnxOxbcQC
	fV2BjEvUv4m95jq1hsKqvsrD8WHUu7LPdA4MpIzi9g4XQ1jiWaZAa9yHwbiv8/hJm+QqnEyQ49/
	pF0TYG5FkY8KzNhZWxKyDLVoI95k=
X-Google-Smtp-Source: AGHT+IHOWEG0AwNDnxkuV2B0EiyvKGcNM0HJ9W+omMGkeK0JN2w29/qxIjapvjqPv5QDt3WC9EC3aFmjF4za2pjLvC0=
X-Received: by 2002:a2e:b602:0:b0:308:e521:591 with SMTP id
 38308e7fff4ca-30b8469f9ffmr10979031fa.16.1740657884393; Thu, 27 Feb 2025
 04:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20250225164216.4807-1-arnd@kernel.org> <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com> <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com> <Z8All3G80gGXzfaU@gondor.apana.org.au>
 <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
In-Reply-To: <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Feb 2025 13:04:32 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHo56DhW=W=WW6cjGjYJuH-peMJaOzZGwRtD-aDPCn4VA@mail.gmail.com>
X-Gm-Features: AQ5f1Jr-uffN3tS-ijQnZ1d7avnvovRKGHuy1gPUBmz3_2vnL-45BxBh92ztQcU
Message-ID: <CAMj1kXHo56DhW=W=WW6cjGjYJuH-peMJaOzZGwRtD-aDPCn4VA@mail.gmail.com>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
To: Arnd Bergmann <arnd@arndb.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Eric Biggers <ebiggers@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Feb 2025 at 12:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
..
>
> An unrelated issue I noticed is that CRYPTO_LIB_CHACHA20POLY1305
> depends on CRYPTO in order to pull in CRYPTO_ALGAPI, this
> looks like a mistake and could be resolved by moving
> crypto/scatterwalk.c into lib/crypto/ with its own symbol.
> That should be a separate patch of course.
>

The only use of the scatterwalk API in lib/crypto is from
chacha20poly1305_crypt_sg_inplace(), and it occurs on a cold path
where the digest buffer is covered by a separate scatterlist entry.
I'll look into whether we could just use the sg_miter API there
instead, which is what the rest of the code already uses.

