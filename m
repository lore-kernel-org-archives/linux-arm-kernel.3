Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C813D64099
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UthLIec/cwIuktVfa9EqyXI2OpVuqNJjlw1hhbbSLgE=; b=NM3HuravE7HJqYc+31eHPKlHs+
	ck/NLrHX8KSNk6WTXbCFLGIJTmMPNJ8F6FM6phJdDHpyn1HIHl9PyHlsjEnTtylzdhKpmdNZwOj5u
	/PtdJnNoHfzn4AyjuQmdjrgb/pde3FR9QKXPa7ldxIf3c1rqYika9DhzRoCOheVxAhOc/Kfv5xY+s
	41wDB3NJ61YRjM4sSyLjhvuMCe/hHwwCF3jC3qWI1CYIvfxmru5TcTrYTfSI7SZYu152ZDJ+bVAPG
	V7uXfOrMKwPivZ2z92i34WOsWnBB6relT6RZCer5ATxH4/0Fp3br3LRslD4JOvABVrzkNNbR9/7c/
	ZScQyr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnQN-00000006Nvn-31it;
	Wed, 17 Dec 2025 09:02:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnQL-00000006Nue-1Tvw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 496236018C;
	Wed, 17 Dec 2025 09:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8E2C19421;
	Wed, 17 Dec 2025 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765962140;
	bh=TqhCN05lIjCwKdoNH7O27Ib5W/fzrsm853qYAbg7qEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvAWqDTYEQLPIjasUrs0D/Ze97eatlfyL0mi6O0MGmE1SvVn8YHYiQ1hDIZZ4oE8K
	 aFHFHT2tvqpmtTdxeiwwsKJeoEVwVelMoe4qdWjAQvcLtXTPchbIZ+ReSJGYbTCzr1
	 qqsGRlLlswi0jMZNei2mTasXnvX0lpJbqMF7UmTpaAoqX1N9T1UOPYMMpKw8Gfqhqh
	 UjNPCvimUrrUtTiIKv9N5Ccmev+XKHhu1cfOPYdPmfSUBm4ahYUsPiFyqCCGB8H6UA
	 JpzEUlNfSO+k+Tl5V8osBsBwXeYIjSzePF5a/zlMumvvZfIBKHX3GrTd0HYyuz9UeN
	 OzpkhIbfzPmTw==
Date: Wed, 17 Dec 2025 14:32:02 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <aUJxiioKnDVSC34H@sumit-xelite>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
 <aUJh--HGVeJWIilS@sumit-xelite>
 <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
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

On Wed, Dec 17, 2025 at 09:21:41AM +0100, Uwe Kleine-König wrote:
> Hello Sumit,
> 
> On Wed, Dec 17, 2025 at 01:25:39PM +0530, Sumit Garg wrote:
> > On Tue, Dec 16, 2025 at 12:08:38PM +0100, Uwe Kleine-König wrote:
> > > On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> > > > On Mon, Dec 15, 2025 at 3:02 PM Uwe Kleine-König
> > > > <u.kleine-koenig@baylibre.com> wrote:
> > > > >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
> > > > >    optee devices in its error path (optee_unregister_devices())?
> > > > 
> > > > This is mostly to take care of if any device got registered before the
> > > > failure occured. Let me know if you have a better way to address that.
> > > 
> > > Without understanding the tee stuff, I'd say: Don't bother and only undo
> > > the things that probe did before the failure.
> > 
> > True, but this is special case where if there is any leftover device
> > registered from the TEE implementation then it is likely going to cause
> > the corresponding kernel client driver crash.
> 
> You are aware that this is racy? So if a driver crashes e.g. after
> teedev_close_context() it might happen that it is registered just after
> optee_unregister_devices() returns.
> 

I see your point about the unavoidable race. Maybe it's better to not
try anything and let the kernel client driver fail.

-Sumit

