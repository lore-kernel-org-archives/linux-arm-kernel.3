Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=; b=GrmQAxMRRwM0eWVVJey5uJHNov
	DnvMAHy+o69c3CvS9jKvq07b7I3U2jSCY+TXHilhbWu5+qXxyaJxPCkvbrJS3ZfTjfsQcvXKHfqb2
	//Ek8vQ6mG5mT5NTRJU9qlpO0OoaZIDyG/jkWHZckq0gD6/pSEJQB+65RqZzBYY3TqjPyveLIAkn4
	74m4erB0l1OemHCCqCdpE5WKhCRDfmSRFG9+hhqPb1DHGqQmrnHplkuVV1XlsrCR4xy6HTnE7Ss8T
	VDvA8Qq6KhdxXsDpRJbVvSA/L7fPVTmof2vpcSJdOB4/D2AMb6SBcYsSf07cO1L0mMHspKWGJmWwL
	CBr8z+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSU3-00000008J6Y-14hR;
	Mon, 26 May 2025 07:42:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSRs-00000008Itg-0tym
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 07:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748245238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	b=UsezSDSVqjXp49s/3GF19NhHXhrGBlue8iNnNWBdgfbpT8SogKzRtj/eTqv0zjC2SbouDX
	E8q/jqXG80/tOjZ4CprOzbdhzM/FppeejMZfQyhh3Yx+Z3pSATqd/lO1ULSGbvXt+JOy9O
	I7SG4ro/V3wscwlOqr5NToaKmZo5JCU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-LIOTTuMKMcSB8TDn6gCJGw-1; Mon, 26 May 2025 03:40:36 -0400
X-MC-Unique: LIOTTuMKMcSB8TDn6gCJGw-1
X-Mimecast-MFC-AGG-ID: LIOTTuMKMcSB8TDn6gCJGw_1748245236
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e7d90f2b129so2658783276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245236; x=1748850036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
        b=KdlX51Y6KdQYIOD4rnyaBJ/f//BNZnAXwz+34cjxfeD55/7ujbUURUQX0fKnBU8jSy
         /X7hFtBWcw8Pem/MTcI0+t34WqIyTyBeaQU+69dmM7NieHivaWc1iN2pR+XV3LImg5jj
         o3X/UlO/qIbwWyTizmcH/zEQy+Lqf+7mQaeAc+jODOdoA8ltBw0OYgx5Xf0awXkKASip
         t6JNeXDBA7oCmP46UYxsstck2/A/GYhzlnzLP5ulJ/mVqaxwxZTyZwPRpFplUkqmYR3+
         rPrMybbrx8Y9H/hQHN0CUHqFaeFN1PKdNFjD74FV7WYkaWFC+rAVPu9D/75ex5SUf6xD
         X3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Y4mx/2n+QQfH50bL+otJBsdgemEFLtjdQAYfzLrB6khu1dDPH8c7hAjbAW7jfbPghLBYS/xDR8fDTis68luZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxibBJwEtFXYpjjglaoyyVDU+D+baor4d3D8FGHyp9Budny1U+b
	QJVb8WS4KjZsC0oOPmodZY5lYe+laqOVub/BF/RAuTbriFi66giZmo8YI8vB6ZX98pLaQYHXGq7
	s7dfHLfOE0Bm3HeTUaIPs14lRwt0bBPyBup0gZ7BF1VRjqCGZuqL5gJ+1nwCETArcoipbufrWbL
	fS8WQrAIfncucc+qm5Ia89EZDF4KQVMJz4STfyxT32/mC3V0eCBe0=
X-Gm-Gg: ASbGncshVyQAJMb5sdDqHLoIVzjMhACxU6diReBpWZEQuxmNv4NreCu5u72CuTuAVJp
	bHXUibl64s9iiQzP1aH6CeAspRc/BBq9KMiLhRIAHIZg7/dKZ9//vrh0WfDz83IQB54M=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id 3f1490d57ef6-e7d919ff94bmr8974762276.3.1748245236235;
        Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7Pp/XoXNFVlvnyTUc1K1XXQydWSpcpTrFXtXpr4SnhnenRHHP8SHUydPH75wP5FH91MrTTW9j01EIYlJd6g=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id
 3f1490d57ef6-e7d919ff94bmr8974742276.3.1748245235915; Mon, 26 May 2025
 00:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
 <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com> <aDCb-wkHGoLQ-IGg@kernel.org>
In-Reply-To: <aDCb-wkHGoLQ-IGg@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 26 May 2025 09:40:23 +0200
X-Gm-Features: AX0GCFsNxPiQg4uBSQzNKiQ-b9RZogg3WHbWdCxyQyCynKE3SGVLrqvJ3a7shh4
Message-ID: <CAGxU2F7bS7LsUTVihKdFu2UE20-HfqGk+T8j5fUaX=wMu7R1OA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: s2n3vSXkTP_0ZGKKNx5w7YwgrZYvY_qJMQtAyOfVKn4_1748245236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_004040_337971_7A0ABB65 
X-CRM114-Status: GOOD (  27.00  )
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

On Fri, 23 May 2025 at 18:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Thu, May 22, 2025 at 10:26:34AM +0200, Stefano Garzarella wrote:
> > On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > >
> > > On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > > > I tried, but the last patch (this one) is based on the series merged
> > > > > on the tip tree, where I introduced tpm_svsm.
> > > > > I can see that series in linux-next merged with commit
> > > > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > > > but I can't see it in your next tree [1].
> > > > >
> > > > > How do we proceed in such cases?
> > > > >
> > > > > Just to be sure, did I use the right tree?
> > > >
> > > > Thanks for the remark. Lemme check tonight. Hold on doing
> > > > anything ;-) We'll get there...
> > >
> > > I just rebased my branches on top of latest from Linus. That is what I
> > > need base PR also on, and:
> > >
> > > $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > > fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > >
> > > I'd use git cherry-pick on a range to take them from linux-next to a
> > > mainline tip...
> >
> > I see, let me know if I can help in some way.
> >
> > We can also wait the next cycle if it simplifies your work, definitely
> > no rush on my side.
>
> Let's do it. At least it will then get a full round of testing before
> ending up to a release.

Sure, I'll send v6 after the merge window.

Thanks,
Stefano

>
> Thank you!
>
> >
> > Thanks,
> > Stefano
>
> BR, Jarkko
>


