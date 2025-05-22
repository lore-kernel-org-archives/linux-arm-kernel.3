Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F3C54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=; b=vgc/Fo/270q+D2fyaiU3qmr9eK
	IDvUrprvrhrrKDHKfRhvZ/p77b5cg5mI9CxpDryy/WeebawgpX2Gj/zLtcfz2wFSL0CCT40BPKRLJ
	QhIV0B3kIzq/8pUpgucZ7JjGaqxofGJ68MsCwwMMq2cy6ydqM7OvCjJyodgYpw3L7FxEg/x8obI+T
	IlT+BRiIHBtfrvH7yrk8NxRkb6Jzc/LGXSq8Sx47g0VRN5Vix3NYV7NAJkov7QFQOKprUeSk4iRNO
	8wXKEDWdX27RfOya31/tYh6OfP/NsXusQUEGCVJ/v8onl/5H72s8RU2jl8OHDi393uF+RHmYnNOQM
	BY3LRi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Ve-00000000K7R-08na;
	Thu, 22 May 2025 08:42:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1GO-00000000HKU-07IE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747902409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	b=TJ7lNqo1DCu4f0ff2lNPf5w1a7wRXEBZJ+9m01TWuYMNAVvV9P2GxwVQKj6cnokXnafitt
	kCsi+2CP0oDNFxloD/L2dS3EDy/N/R/Q7DYg+j4gQ00R/3QFiGjjimpihp5dAglYXzRzZV
	zo6lmZQEovGcpfGEAWnaKJKqkSDsink=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-J7Q0TchiPUmAtigK49GScw-1; Thu, 22 May 2025 04:26:46 -0400
X-MC-Unique: J7Q0TchiPUmAtigK49GScw-1
X-Mimecast-MFC-AGG-ID: J7Q0TchiPUmAtigK49GScw_1747902406
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70ad3a91ab2so102109597b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 01:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902406; x=1748507206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
        b=iyQxjKjTY6+uLoxv1pqjkjhYD5i4qbGS2uzVk+ZYAEP9ZgG+U2aBulpgwQkXrcne9u
         q7DfYjTJlNXEFk4BZWFs+EXJSnNcawbH2etQEyYqZnZuI6rv2ZrRg4AnXXgbAeYQNLa3
         7RvYTiFT110ZS5IVPfWDtQM5kDceiGY7hD/vbAyjnpPvrlKf1OjLc6mCc0u8nIPTVe3Y
         EX9YgI5MlVyHvMlGUFD+zo0oOOdhYMW7uVLRL2fdqEniQbmBsIR3zRoCa1HjPgDqhofr
         ufQ9ehZw6S8vRkwtHnhM0Fl3mKtEQVyQuhxh9ZbJ0J6pTNz6r2atExrpnTaRCGPYRNuB
         FIyA==
X-Forwarded-Encrypted: i=1; AJvYcCXL8+UGHhjBpFBGSPmgeXp1zjBtgdZV5xIs4d+F6tmgEQ/dCguT1pJttYvxMPD4RFQhNL/KncxO2plkNa1iogem@lists.infradead.org
X-Gm-Message-State: AOJu0YyCOE8XaJanSnnwgjEde4JKHcnejTeUJAczg7PVPqvVi+hjvr2K
	VgDi34k+ZBpK7j3YMmbraW1BZOvWlAHZGzYvGJOb0EvNsk1K7MgliaLPlRxL3B7Qf7CJ9/HJxWU
	epGa/TS+P7o6kCVcoiIb6FqbqpfedZn/5PW6z5ZqT5gMOgKvB3t9bWpIK/yzYVs4JVLQzWGSYMm
	jgOScHjaULgQISwEbpcVqXNy1s3P8mPodw5NJgQeOR+eo2+KrtafI=
X-Gm-Gg: ASbGnctASHhZjYHW8GkkwuFpoe8oTJsRYSfEGY2CTVY2IWEqNLgnLZGQIxZ7QeDwWmm
	e2m/IuC758vu1iOCLAMfVfwBiwz/bMgscmUQS5wRKgJLn068RBwifaepC16nEPO10oGM=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id 00721157ae682-70df3bba868mr78205617b3.9.1747902405932;
        Thu, 22 May 2025 01:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhVj8JhGJCK+zc7RP834KN5Eve5FMdd9QufZUZBEqDbkQHG8Gr0Mr3Ft0fdQAFQnebVlVVoTvKHtpXaHPSYY=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-70df3bba868mr78205367b3.9.1747902405539; Thu, 22 May 2025
 01:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
In-Reply-To: <aC4CVUXpThAyKQdf@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 22 May 2025 10:26:34 +0200
X-Gm-Features: AX0GCFvwBrY1Wuz2vdIMhJw7TkALKpOFZS5DJd8t4bfvvVGz5MJKErKjPBRbZJg
Message-ID: <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J_pEbzcXPrRf2WR_OTENn-lfviqqU25D3XSmhB6kSI4_1747902406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_012652_147021_38F0262C 
X-CRM114-Status: GOOD (  21.46  )
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

On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > I tried, but the last patch (this one) is based on the series merged
> > > on the tip tree, where I introduced tpm_svsm.
> > > I can see that series in linux-next merged with commit
> > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > but I can't see it in your next tree [1].
> > >
> > > How do we proceed in such cases?
> > >
> > > Just to be sure, did I use the right tree?
> >
> > Thanks for the remark. Lemme check tonight. Hold on doing
> > anything ;-) We'll get there...
>
> I just rebased my branches on top of latest from Linus. That is what I
> need base PR also on, and:
>
> $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
>
> I'd use git cherry-pick on a range to take them from linux-next to a
> mainline tip...

I see, let me know if I can help in some way.

We can also wait the next cycle if it simplifies your work, definitely
no rush on my side.

Thanks,
Stefano


