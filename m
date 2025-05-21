Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F197C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=; b=uLuC4AkOChs8rlkv4TX62S5kCY
	CjYQUq3delOyhQDdp7rD/DGj5+TCcyGNi3GQ04tiSk7bvuqXHj1Q/60U2ol7g7MsM/0QAT/dI+biF
	o1VxTD0/rTcY9cb6bYZDJkzctoVNKpZIyHnFMA61w03NB7B8s4uzCK7XXHtF4no7yhfozbd6F4pi3
	GKEg5ccIhKYtQp5dFgVP1u967LcUK2TqYdourjXssT0qNBK8WJDGlzsCSmptWYWLOoJvyvfgloFRc
	SwVrv3YbKx5g7iY1Qmc1Fn0mNF676q0G4E45XjVV2361hLFUoDBJDm0/ThUNNcwTPLMkfxBG+Mhxc
	/buMcstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdoZ-0000000F3Gz-34aY;
	Wed, 21 May 2025 07:24:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdeB-0000000F1zx-1CiF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 07:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
	b=QgMLgfBmW1+7+BilbdnkP98ESJMUCgsdabLQeTiCDcKl0QxdM+WOnmrh3kkHbm0amLJhxl
	INKxQ3ZUdbpGdgYB4pt28gHhMKeiri+Mc7QdlL6cEWNys0oMT4kHsZ7mWiRMih8IKLvc/s
	skgQEZ7vixDNoGrJW8wt2ImOHwmoE9c=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-vrOzb0isO8ytSBmfXAIGRg-1; Wed, 21 May 2025 03:13:46 -0400
X-MC-Unique: vrOzb0isO8ytSBmfXAIGRg-1
X-Mimecast-MFC-AGG-ID: vrOzb0isO8ytSBmfXAIGRg_1747811626
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e7b9440f2bbso4089773276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811626; x=1748416426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
        b=Ml3by+UHPlvmeiUG8ulWOplRGuhfF7Gq/51yfKS0zmK7Vjb85+AXOyvod+TxrsR8Zc
         KVaIPCrzLEgXIGDzlwghrqCzQD4hHHIjoQswmMPrkJtlHhhUWf5UJTo3VOYS6TwZdFvh
         t3i0te+uho7H4iz/qzdBmEmDFcJCA02V8HByOEXmS2uCWRn3Vvj9IOzKve1MCzWi5hMY
         E4YLkmcQKPAEKg5P+ZKOPaLBfi6styPk6RMX/HrWGOF6ZHDlxePoFdlmei66UCQTCmMZ
         GdMkUs4K2+3lX45KDfEWyUAOZwUNfGmMhUSIRuBm3Ue5OjJ8eYs4tKm6deIF25SgOaf1
         grZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW1zN5yzQbVgR7wzaI30ET02zF2rOzKV+vALZbAATJHObS9SRRpdU57UIpGch5sJ5DItV1esC+cP9pXeuOoc0r@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Tw0HJfuVKXVKYx+Xbs715/s6F3c0uZYhYYcML7HS7/vxuO6G
	vBrZ3+uO0nyP5sRW4PFUVSWebzDNGV+hKtd8Cg+KjUdyQQXgmtDQEUEauu0y9AVAeryOjIxg9p3
	mXqjjrWR+M/pOQx+baZm5ZGSJ+zG78gx88Q34ip+Gt3zC8ygT4OIo/3jw7i5bMsruKCjw+nZ0m1
	/oEqOyEyyqBTDuzPQ9ep+eU9nWO8OsT+x7KWsCoqItGcxl/q60sDo=
X-Gm-Gg: ASbGncsfSV586Rs0t9l2YFf4hqPGbZMdPUuananUrCPALsX2Wr75/K+wgIs3vFZDjqT
	CLLnqdK9P3W8XFKyI1P7d5WTjo4Tg7xzBtIXz4IZ/Y/c4pkte1v3i40AeWgatz7MQJl8=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id 3f1490d57ef6-e7b6a08f421mr26886344276.21.1747811626132;
        Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKNo15Oi/QZ/k66bSnuQxE6bf08k4qaU0blNDQ7dnxZLVMy+YcQ+rT1+Lvnu8ha0WE5sLFghYmv/ZaOBdZByk=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id
 3f1490d57ef6-e7b6a08f421mr26886312276.21.1747811625773; Wed, 21 May 2025
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
In-Reply-To: <aCzf6aoJAC-IdS_n@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 21 May 2025 09:13:34 +0200
X-Gm-Features: AX0GCFtXE4dDeCn9cUTuVG4Gx57oa8NEQ7aSl0jUrOWZcTyJncPcrt8z6mYPIQQ
Message-ID: <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: kh8XJTuBsNKLzwL87cOoKslfHI5rqj5Lfl7_Ev6hDP0_1747811626
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_001351_394744_3753FF33 
X-CRM114-Status: GOOD (  29.08  )
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

On Tue, 20 May 2025 at 22:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> > On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > This driver does not support interrupts, and receiving the response is
> > > > synchronous with sending the command.
> > > >
> > > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > > ->send() already fills the provided buffer with a response, and ->recv()
> > > > is not implemented.
> > > >
> > > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > > it for each command. We need the buffer to have the header required by
> > > > the SVSM protocol and the command contiguous in memory.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > > v5:
> > > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > > v4:
> > > > - reworked commit description [Jarkko]
> > > > ---
> > > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > > >

[...]

> > >
> > > I can pick this for 6.16.
> >
> > Great, thanks!
>
> Can you rebase this on top of my next branch and send one more version
> of the series (fake ancestor crap)?

I tried, but the last patch (this one) is based on the series merged
on the tip tree, where I introduced tpm_svsm.
I can see that series in linux-next merged with commit
16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
but I can't see it in your next tree [1].

How do we proceed in such cases?

Just to be sure, did I use the right tree?

Thanks,
Stefano

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next


