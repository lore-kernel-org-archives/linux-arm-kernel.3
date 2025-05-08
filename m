Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B295DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcTOiqY3Q13roGwqiggNCr+ilIh5tTP+DT9I/IZ7qsE=; b=WC4TnfrzoQxV90dFu5kzbFIYDQ
	Mvb1DgCp9O9Rf3klpfMx7oj0rbAcdXTUr3M3H+5a5a8RRcgei37N35lq44MYgsUabwalASMzOhTR5
	/Q5Av0X0gH7NzyNJsJGWmZrMYDEDY1s4JxzRLJqbcnJkkAYSO+2tQjIp9wdvGR9Ss4LVMrS4yrGjK
	oxTSC9hvYofP0uRISJtAmCT5UOs7NwSR6iWravW/nw8CNs3EFd9xQDJ2xcXEpEeb73jZgv5dkNowc
	63STDV/iUNsWQf8xgIdq0e5CBYKB52vwJR6qTmJixNJbt1dscn12d/dOdCSWiIJ7QT8BJb46Ft4p0
	ogDupkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7SL-00000001izs-1hS9;
	Thu, 08 May 2025 20:02:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7QN-00000001ihE-29um
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 20:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE5E344ED2;
	Thu,  8 May 2025 20:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93FDC4CEE7;
	Thu,  8 May 2025 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746734454;
	bh=RkjjpKYG+r35+gc9d0tTnqu/pElbyqXWwGFn4pZKP4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5aKvbvoZXXzxoR08YFj5FH5BYBKSoSB5/P6wBMQaV75fDXFA7Zlnr2BGbwqroxU4
	 se3IIq+1q6ZCT6StAGKBgYyklxpO9vZqxh+7+j96coWFcBuJiRpQ9TzxENPmgeY1zi
	 L9dEOl/IE3bWTKodiCXQa1hmweDbecZLdE24AOlPAUmynQ+YnJzDM5bAvErNcQyElo
	 T0SYuZRCPAbKY1HY+B5LZmStBmb78AFhB5pGDL9NFTzQ3IJFJLK50MAhTJLyh8NVEs
	 1GbawfQ4AVJazKSphVFxJEhd4yNWLMmnDj44J7nR+KePu3+Ku/P+2NsX1MRg1YwLy9
	 MQMYF0SOMcLEQ==
Date: Thu, 8 May 2025 23:00:49 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <aB0NcS-LPZ8q-h5B@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-2-sgarzare@redhat.com>
 <aBJETstuSlBUMwj1@kernel.org>
 <o72kb2x2jjxyzgyixeva42sk3lr2wwphnyhkcdbxxgfevoqp3n@ir6rwldztmt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o72kb2x2jjxyzgyixeva42sk3lr2wwphnyhkcdbxxgfevoqp3n@ir6rwldztmt7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_130055_574511_5CED2FA6 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, May 06, 2025 at 02:56:54PM +0200, Stefano Garzarella wrote:
> On Wed, Apr 30, 2025 at 06:39:58PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Apr 14, 2025 at 04:56:50PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > 
> > > In preparation for the next commit, add a new `buf_size` parameter to
> > > the `.send` callback in `tpm_class_ops` which contains the entire buffer
> > > size. In this patch it is pretty much ignored by all drivers, but it will
> > > be used in the next patch.
> > 
> > So instead "in preparation for the next commit" just plain say why it
> > will be needed. "next commit" is a fuzzy reference :-)
> > 
> > Same goes for "next patch". Neither can be used to query any possible
> > information. That sort of makes the whole paragraph useless, once it
> > is in the commit log.
> 
> Got it! What about somethig like this:
> 
>    Add a new `buf_size` parameter to the `.send` callback in
>    `tpm_class_ops`. This parameter will allow drivers to differentiate
>    between the actual command length to send and the total buffer
>    size. Currently `buf_now` is not used, but it will be used to
>    support devices with synchronous `.send` callback to send the
>    command and receive the response on the same buffer.

definitely to right direction

> 
> Thanks,
> Stefano

BR, Jarkko

