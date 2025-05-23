Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0CEC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV/pjlPBiCsCwTtFEFEknHpW0wdS4DsNlsekE5grkJQ=; b=v/4HVy4qNboJRXx4Vps2JefzUs
	7QZXc9IBQtQatDE7wgzoOMtHP/CGSaoxi37S9QWDIutYiiRzy8aXvrb1vDFpF/HUPVaoXYwmlWq6N
	gVan6o6Fkx/EE/dnim35lGgkTyyfJSa6mNnOcvvpkN6ZPCjluKZccjfMRzO/Nvyk+xSyM0fH32xDU
	r4x4NGXQvOb+xHAsYVK+Y84x5Z6paQrAaBIMl455b1k7lBmOMMNP1FlqaMyia3g/jTrUxwc+XFlNQ
	ql//b2ftiQqfSXSC8BpLDVTG2YzKB85wRLMlV3Ma+D8oP3/wtY9PxbvNt2V9mT6sQTwJgqde3OTLO
	2QUrK5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVks-00000004TYQ-1645;
	Fri, 23 May 2025 17:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUqf-00000004Krj-1jUG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 16:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uV/pjlPBiCsCwTtFEFEknHpW0wdS4DsNlsekE5grkJQ=; b=S2Ea4h3eAKJAck0lpGrstUOLkx
	8jZoghJrryOKc+DksVS9ok0JjAvcxt0q9IK31dD5b5G0kDbzVCI52P5D8aQRr1ur/alHtjjASD6Hw
	SG/L6Qcqk8IsS6YzD8LfeqG2Mn4YF3ZCTKuR03UJ5RJ91SV1IxL6LnpaZSd/rn4ingmLMo0ltVBiQ
	aoJoKYfL0G2eFjf8TbFfWCruzK6dvemG17+eMLrr/HbZTw9fBtwUo/ys4Zc7fwEqnZzQi36XmCVXO
	f6xmh7RdWprXKPBTSPoeCBs32+j0KLeRL5PuAftn1fG/qvBBFr1aSUtnraCwCX7YE7mK4rR5I3xpr
	V8B/GzoA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUqc-00000001LmG-0AuR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:02:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A93155C5A8F;
	Fri, 23 May 2025 15:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDF2C4CEE9;
	Fri, 23 May 2025 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748016128;
	bh=qgYSTT9XcSyqI+DBeYRkhP8s0z5sSZV+A60zwa1m+G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1cJjoD22VVrq7n3ZjtSjCKVoJHel3VRZawP05ZnRpXIj+3lQiQJUxTt1+DGwjiXj
	 qiD93PYBeFeRoR4Y3uogSidZFUVxB7MStQE+euuIHup4TCaudxawDUawpio9ybD3fV
	 AhaIZCgcDC/8VysRupdDwrUkEyvyKG0zpXtpASfDrEGSCKnxvivqTg5i0KP3P9b+FB
	 mmLwMGNrE7wvYDNWfWFIHneeun9Yry7a5r75iW1d1T3oepXmg2ZnV6I2Usv1sfwjVf
	 xTzDLnpyvW96MaSXDzQ9odJXIZZEAHIUziVTI2IlbG+IwS5CJij5MfbH4ZTOpxNbdp
	 qxaXWEl1wc40g==
Date: Fri, 23 May 2025 19:02:03 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aDCb-wkHGoLQ-IGg@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org>
 <aC4CVUXpThAyKQdf@kernel.org>
 <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_170214_306210_7CCB7958 
X-CRM114-Status: GOOD (  23.41  )
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

On Thu, May 22, 2025 at 10:26:34AM +0200, Stefano Garzarella wrote:
> On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > > I tried, but the last patch (this one) is based on the series merged
> > > > on the tip tree, where I introduced tpm_svsm.
> > > > I can see that series in linux-next merged with commit
> > > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > > but I can't see it in your next tree [1].
> > > >
> > > > How do we proceed in such cases?
> > > >
> > > > Just to be sure, did I use the right tree?
> > >
> > > Thanks for the remark. Lemme check tonight. Hold on doing
> > > anything ;-) We'll get there...
> >
> > I just rebased my branches on top of latest from Linus. That is what I
> > need base PR also on, and:
> >
> > $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> >
> > I'd use git cherry-pick on a range to take them from linux-next to a
> > mainline tip...
> 
> I see, let me know if I can help in some way.
> 
> We can also wait the next cycle if it simplifies your work, definitely
> no rush on my side.

Let's do it. At least it will then get a full round of testing before
ending up to a release.

Thank you!

> 
> Thanks,
> Stefano

BR, Jarkko

