Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E754D185F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyRa40fh8YhmtwCdrRt6pdxxVr6ipd3YcrOg4WQdMeM=; b=c2rnOjNDOChQe5KjqE0di2auq2
	QtzBPcE+9+Ku0Ao6tZO0Be0XNuoGWtV9iAmO6ceP1f6IXcVcGOnheYVIZYMb8HEEhNinNtcFP7Eq3
	LTxIGjJbf9a0hnfTsuUqUtNcHkOEXZkmDnuBdTQl92PtQ2qVc9erxGTMMU+YhYmLCs9onPg947Hpc
	Aw7ntT7FRSh501lkxRYBDf1mJdQ3lT083COsMYQxhZfGGl9bG+zbdwP/CP3XIMkKs5ogVTZ1HhaTj
	N+0Q+8glc74Mndho3uATIwoNusZtxRyTVIsDPHptdNMshMMMQxtI/0bZWPlPrFOD+F9o6mWiLpnaE
	Cbx8lcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqK6-0000000HDay-0syH;
	Thu, 08 Jan 2026 13:45:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqK4-0000000HDaa-2loO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 13:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qyRa40fh8YhmtwCdrRt6pdxxVr6ipd3YcrOg4WQdMeM=; b=HE0XfFpwGOBGy+LyXouE3ttHBf
	6ZmEGxE0pavZCHX6eQI7GWvgdNEcTypQ5Rwta0hzOlk2UqXZf2xvz8SlTvM6v2/q1KyGvZL8G3hFy
	slSfAiY/M9bT8DXPN+xR8S3D5JvI1QWPnpSk1oe10VwQ3KA8MKnY2iAuF+n9Ex+rj3T5ODIm1GZb6
	pc32iwPH5eLCouSsFEowKqkYL/8XtTh0ofjJuVOCtSi10c+48XYgvLqSRokCzYxUG/+tsvVV3aAhP
	ual81AmoYcM5K6Yw5wTSWsm83V4p6RZ9E6zA57nNgt3sAcknuPH5inDVKXGJOXa5h/bcojn49tJiP
	dmr97h6w==;
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqK1-0000000DIQF-37rU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:45:07 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee147baf7bso962521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 05:45:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767879904; cv=none;
        d=google.com; s=arc-20240605;
        b=LlY6lX4WHjnGyLmiEK0pvKU4ydaYusO7L8S1yYtxBv/Y/BP2y6EYraOcce7yRQN8XF
         wQRgJELuhZOJamIUOrbp+k/lM4N+BTzgOWhUHzdlO6/E/kZGpfaoKOYAHsKeOLlRNCKO
         zzSzYh5zLzfb4OrDYKYQ1NNLaKKd9ReTkglZ5k/0WznkE40qLDu39rfHc6my7jGU07vM
         0g4Qs9mdh24yIPdoBjbHGbFaELCCkNGC6V8swQs7F16Y5T24+qhuE0uBs2QKyoWh+YK3
         4qsZsSgzP87mUdihlkX9CXxRkOD1qgxf/6O7MewjhAn0IYTLCJMkQs9DkK6FE17oiThM
         SQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qyRa40fh8YhmtwCdrRt6pdxxVr6ipd3YcrOg4WQdMeM=;
        fh=pXM1QItWtKntReJ+tE/eoCoEHetUfKQXiw6OLXPMwWs=;
        b=A6IFnq3a1A5JleutBn6blkATBHnem4QYZmGf9ONT/NskEGUHHuENh7x2dAHYNVIgFK
         +bUznqoDIemu6giyfiMf2d4KAfikXi0/jDxLWKNqq0yKtCFJFMnYUh7IGoA6OO90/sxK
         pYvn0aktjE7RM3xskL3yddp0sGrfpt/cvOloWM8soMgw7tMa6qnbhrGe96YY/+54TZ66
         SaWckWKP8c7pryt1ejkfBMvI07Q6WNXU36pPTWspUawh6yV7rLkvDtTdE1hgeOc3ehBe
         z6Yq84WKJhiJUjf4yNlFoFIIPHa9VuNADj1opbsmbmSJh/7+w5pI+tcEKH2esHHBNCDg
         IXsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767879904; x=1768484704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyRa40fh8YhmtwCdrRt6pdxxVr6ipd3YcrOg4WQdMeM=;
        b=WkocP7aD4cDg3lcx/sGWiFeDraQQiMegldh2UBAugZtVhEiLjmz0MfeQMqtWCJ0+Pn
         wK/WfLY9F0OU9nOUsPYandwJ6y80hLWNN2Z66dnq2W9Z0rskxYPgrOe57iJfC5wG3RGW
         xqaVQWrAyKuG27nN0+FNIOOR9hHi5Cn77ZylQrSDTKfyKofzC+W+XdKK2ijF37Sv/YNn
         DH3jj7tuIp7CsWJLXBAU40DOzffP/YgiVYFBcKfYUrSwZhCWEqJsQRwmz/l1RbWVf3xo
         vtWbQrAdxKEDIpuz50WJj4G4pU18pndu4BdEdFRzvKFhpYoFrdnu6ruLwt8MTN8gDi8Q
         UVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879904; x=1768484704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qyRa40fh8YhmtwCdrRt6pdxxVr6ipd3YcrOg4WQdMeM=;
        b=Puf7esk2la4lo6aDfNTJD4z5ChJJE5ezDIpNS80lvq3KSs2FnzRmZDdsctsGi3M2JT
         wP+S6n7oDjPFB9X6NgP+22wEQ2x0yj3Vu6ZT8FieVYujzXjin3kNciM2jMK6gHf7KSRj
         OGp7siOA7nP7Bh4Rd/gYnCjSgoJ7+aflAZTdgWIZdrxVwJmkGATo3ctDoCfItmB9gO21
         umdxsfakVTSZepxC8xCVotj4xdKL6ytYETXcJv314ShHH01CxrwInhwnz5N1Dc0KMeCp
         CpxaCtuqog/Zbu72uqDkN7Tql6unwErdt8pyZuYmI4Bhq9daTC/0sux/Sp4jtG4V9gNY
         DjbA==
X-Forwarded-Encrypted: i=1; AJvYcCUFu1zUoRZMUBm06kvwMPgcN4CBNC7AJ2BJ+0a2Gwv4jJxGFbWnpYtQWab50A5LTd0Yq2SvxvCHXWHywkMhnL8Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi55w9RBkXUZ/ENrjcfL7GRrEfY6FvTeDqNBqGIeMQgZAHeQgn
	fp/oOX7sa6cKOmyPEtp7KvwSUza247rMwAxkwDIxnKi5AKIC3G4BO3cTtHevTQYmJTI4pIpBwhu
	IhdgpYGZf+gwir1gxcPM+d7hfiukp5hsnhLje0fUmxvnoq9523pQ9QW8Km/I=
X-Gm-Gg: AY/fxX7+1K2+BTBdMN++9ccXsOL2hHyTxwIs4De4m8iFO3bmKRRI2CkYEpvl95VXwlg
	uqtPXFrtCSs/Bl1cSjdkYuseXcV6LkEzoE+TBbGzvD9s5esjOIH9WWzUoJo4bfYTqj+MkqIVm24
	moqL0BBHB74xnpIsS6Jcl3t0OeGC3uywg9EOkqtNbEO1cOKhDKXevs0oyjiWf8/upK1dtlQYbjM
	zsI7U3jd9/6X/79GqYadOSkmk4f4YUNul7d8oGQukFM/2MdXi/iQ5VtKA5rNs92Jq9y4jFw+le4
	oNELBU9pDy3tIqxCxOtyenaqAfTKJg==
X-Received: by 2002:a05:622a:290:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-4ffc094e8e8mr8332571cf.9.1767879903423; Thu, 08 Jan 2026
 05:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20260108113846.56179-1-smostafa@google.com> <20260108125934.GB545276@ziepe.ca>
 <CAFgf54ocNybHR_Mp1+i7cff-jkeMUV1QxBCt04jnKxwfwnyUfQ@mail.gmail.com>
In-Reply-To: <CAFgf54ocNybHR_Mp1+i7cff-jkeMUV1QxBCt04jnKxwfwnyUfQ@mail.gmail.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 8 Jan 2026 13:44:51 +0000
X-Gm-Features: AQt7F2qxCojV-Rkt2Q0oF4yYRt65modgBec2JKi-LjVwHS9mVz_oTorZ1Gh5S3k
Message-ID: <CAFgf54o+YZUyZTszFt-uBW4ZhjrAMsfPFUb9kKTK1uHWdS+++w@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org, 
	joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_134505_954962_1351B047 
X-CRM114-Status: GOOD (  21.75  )
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

On Thu, Jan 8, 2026 at 1:27=E2=80=AFPM Mostafa Saleh <smostafa@google.com> =
wrote:
>
> On Thu, Jan 8, 2026 at 12:59=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wr=
ote:
> >
> > On Thu, Jan 08, 2026 at 11:38:46AM +0000, Mostafa Saleh wrote:
> > > Jason pointed out that the DMA-API calls are not really needed [2].
> > >
> > > Looking more into this. Initially, the io-pgtable API let drivers
> > > do the CMOs using tlb::flush_pgtable() where drivers were using the
> > > DMA API (map/unmap_single) only to do CMOs as the low-level cache
> > > functions won=E2=80=99t be available for modules.
> >
> > This isn't what I ment at all, the iommu-pages.h could do the flush
> > inside itself using the already existing
> > iommu_pages_flush_incoherent() instead of open coding the dma api
> > calls everwhere, and maybe that could directly call the arch function
> > on arm (as x86 does) which would be easier to implement in pkvm's
> > hypervisor.
> >
>
> I see, so basically, we add the check for IOMMU_PAGES_USE_DMA_API in
> iommu_pages_flush_incoherent() with the DMA-API stuff and call it from
> the io-pgtable-arm instead.
>

iommu_pages_flush_incoherent() is also used to flush non-cacheable
pages in generic_pt from flush_writes_*(), so it might not be that
simple; We might need to add a new variant.

Thanks,
Mostafa

> > Then it is reasonable to have a pkvm version of the iommu-pages api
> > for the page table and drive rto use.
> >
>
> That makes sense, I will look it over and send another version if
> Robin is Ok with it.
>
> Thanks,
> Mostafa
>
> > Jason

