Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201FEC54E92
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhJHdXYshRD74blT0tjNUs/oT2DyVbyz0TuZi98jhZw=; b=pgfBnDmT7mQg9Dicyh9HrHpsMU
	Fc6eU7UsYuRHrIkha2rNSCUKywEUxqd3WpQUaQOtqmAJm0DmzC7NKSRKDtEsxJB9aXsrUvwJM5zmi
	s5REhQS7q/OGNBQ4JudlkDGdgjJwoouZduOJnZTKkcI67n6+0JFKVCMoX9cR7F1W32bTajFJlVEtR
	G3DNsKhO87DhfGOczEfba5uwmw36H1N5erWv2Ux4YmJVdx7BIKUYLrlDvngVgGEkkQwbKKW+mdpEp
	s1hGn+U1dJCi+7NL5zm7PVxdFHk6CC7pu+gozU6K7ms5nLD/xBuHTHrpKxUlzB9k48btr3bHnPhTm
	Dapn4zJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghz-0000000FT8O-2gmW;
	Wed, 21 May 2025 10:29:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgQz-0000000FPmV-2fyf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A815C629E2;
	Wed, 21 May 2025 10:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7E2C4CEED;
	Wed, 21 May 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747822344;
	bh=21cNdzYwUJJBEkAHlt7+sFsml8d7DmKbNlD2kUZGKoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLXOzE9HyCy+kC79+nUGLtvp+0cxfR2TUqkZ6h0MDnnvdFk9pskQlEjRl/46ec7W2
	 TH/x2jlNbam+Us8NSZrtDSx/HbFXHChCs8KdGoSNvyu+6GIK/tABEAfZ5EIJ9jmwiU
	 W1JLhNCmMAminpUveLFmvUvUzyFGZbmBJ7QRISsH67ON2Eldjw5CzZuxmWFFKjhaMG
	 5hnpVMxcr0ovTQjUkq13+jJoGGK4Rsio37/Sc3vS01CWAzkYtLStJsFev+cYzyIB6D
	 cA1Q961SLiRbMcoD6c9XC2jiHOXhz5nQrAyKFReCRaKuiywBNVKDMxR59cSAmmioWM
	 B1TrXzju+oOcQ==
Date: Wed, 21 May 2025 13:12:20 +0300
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
Message-ID: <aC2nBCxkvWWz5y5E@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
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

On Wed, May 21, 2025 at 09:13:34AM +0200, Stefano Garzarella wrote:
> On Tue, 20 May 2025 at 22:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> > > On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > >
> > > > > This driver does not support interrupts, and receiving the response is
> > > > > synchronous with sending the command.
> > > > >
> > > > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > > > ->send() already fills the provided buffer with a response, and ->recv()
> > > > > is not implemented.
> > > > >
> > > > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > > > it for each command. We need the buffer to have the header required by
> > > > > the SVSM protocol and the command contiguous in memory.
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > ---
> > > > > v5:
> > > > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > > > v4:
> > > > > - reworked commit description [Jarkko]
> > > > > ---
> > > > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > > > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > > > >
> 
> [...]
> 
> > > >
> > > > I can pick this for 6.16.
> > >
> > > Great, thanks!
> >
> > Can you rebase this on top of my next branch and send one more version
> > of the series (fake ancestor crap)?
> 
> I tried, but the last patch (this one) is based on the series merged
> on the tip tree, where I introduced tpm_svsm.
> I can see that series in linux-next merged with commit
> 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> but I can't see it in your next tree [1].
> 
> How do we proceed in such cases?
> 
> Just to be sure, did I use the right tree?

Thanks for the remark. Lemme check tonight. Hold on doing
anything ;-) We'll get there...

> 
> Thanks,
> Stefano
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next
> 
> 

BR, Jarkko

