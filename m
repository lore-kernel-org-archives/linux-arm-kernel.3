Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90020C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqV3lRwJwEi5A0n42n94rqiFtoc8WGmVMSwJFR2qgmU=; b=eXsPlztzBmpN9aOQHZZ+CRb4Ks
	WkAk/pOIlUfhmXh7Z2FNhJRMqrIdXzYcc0K/UJq6/nh2f97GyskDmMnxFmDs5MxsgJZ+hgkDXAP1c
	nO8SjCO8C7D8azyNrvb9knNqo3TrqlSUgNddE4hMt7tSXKRu6+VNfMJKBjkT8Wgw/7JhvoqPGLtlV
	8k6/uBaoOF1obigwDkqWySOQ8823LZznJl46kr0FRdKQT993F1BzWyZcEYt0uhr8qHTxssPpuvWsN
	e53ANvELzoz+FLC7slWF8qezrJPOzuc3krkdo0rJCrZNa3YhANzYstoJvOhkGJQxMo3910LH78J0+
	pULTBHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmYD-0000000GUaV-1a0r;
	Wed, 21 May 2025 16:44:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmW3-0000000GULy-1rbx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 16:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDDBB4496E;
	Wed, 21 May 2025 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C091C4CEE4;
	Wed, 21 May 2025 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747845721;
	bh=fNlJI98IRmJku5DUDB7KU0NTAR5l/AoBK5dNhkMKy3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5UxbfYHZeoYDuN5ngewjlWzVx7fvv+BRtndc80ovjhiG8g1I0PHO5ybTj6Lu6x7z
	 g36JHRBWYtNWkCBo4PMkcy0oVlBeyMphixat7L/44FREl/Q339WNexmioK64JLpHrr
	 ovP+rgZvQ9g6LwFcH/HDCu9vpS3tLCd/GJAcQWnttlw4kKAxt0ie+p9RLIYWYKjjhH
	 93rSYCm1Z1xfN5fXmFJkD1WSt0TC4uayOcstPRMB2i+aKB06sSd7LdyWxS+W5yFd8X
	 bdNdzs+Y/THmEK3YDLZn9UkbD1V8YTXfyH5h5kHwmICgedMJsRAjUNUWn2aXZj8rj/
	 RKYVBmYwmsZHw==
Date: Wed, 21 May 2025 19:41:57 +0300
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
Message-ID: <aC4CVUXpThAyKQdf@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC2nBCxkvWWz5y5E@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_094203_501134_440BD1D3 
X-CRM114-Status: GOOD (  16.50  )
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

On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > I tried, but the last patch (this one) is based on the series merged
> > on the tip tree, where I introduced tpm_svsm.
> > I can see that series in linux-next merged with commit
> > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > but I can't see it in your next tree [1].
> > 
> > How do we proceed in such cases?
> > 
> > Just to be sure, did I use the right tree?
> 
> Thanks for the remark. Lemme check tonight. Hold on doing
> anything ;-) We'll get there...

I just rebased my branches on top of latest from Linus. That is what I
need base PR also on, and:

$ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07

I'd use git cherry-pick on a range to take them from linux-next to a
mainline tip...

BR, Jarkko

