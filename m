Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2641D64086
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weKmakq2lYFxIO7hjbTn3qhhnyYjQJJ8VDykTpvMCY8=; b=JAzJHpn0tcTaQiz4Ltboya3UnD
	K9tXWRw9pPxuRd88ZOpSKcKZ19nL8rnaZ7WgKm6gceSmrFBssZEIFTYjc+kHEZYRiZFZ/dt2whKLD
	wNuC7b8wXWfTx1jtQCXPQ9mAUjYutw29FrTreonk3wAN85YAt1pJ+3hoHZuTXY4jLaKaBhV/kaxLm
	7ZVHn/upiuD/8nHJg9fjdTaF2ZXU68l/c8MlmCPr1/eKAt0WI3tbXjK5TRqP8oLj9R2cl6DCEkQNu
	MafJd2FOwaEv/8LpoTOkZh2x27aQkFaRL1y1TM4pCMkupPuAfBZwIA1xCeV4RiR4kX62dBLJ3vgyU
	equ9tFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmO9-00000006JCo-0ghp;
	Wed, 17 Dec 2025 07:56:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmO6-00000006JCP-1Emx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 07:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C1A44435B;
	Wed, 17 Dec 2025 07:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B78C4CEF5;
	Wed, 17 Dec 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765958157;
	bh=Xo9c1qEYiQMSvCEooBFQkEOr2bYPsShQNIttr2X1DG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELlSPoe46Vp/wKpVK3LLNZx61ZRTeN9a8aiwZ+dBOq6JSgu8lT1rxJ3wY80rxeXhw
	 OZrPCLpEBFk6TLKFBA5pONUweIEe6/iPED+L08U/dXepE25vl89hRZiQ/FCns7UqdC
	 coya/6tg0ImJ/cGQDCryPzjE8vQi9Nqu3aUuHEAmYgRVp1m3qEkelGkvr/TPOrnFV9
	 yhPHmKfYuEbW8BihXNYfIx3rYzf4yaVAhlcte6H35pz0VG5SbKINKXAIGTAmOGvHIK
	 XqbbXlo5Mxru1Gcnu0BaAUfhCIDC3t50dTRFkXYmmP/w7QngJootP/5QLOgvwTke2k
	 Z91VDTNTIflIw==
Date: Wed, 17 Dec 2025 13:25:39 +0530
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
Message-ID: <aUJh--HGVeJWIilS@sumit-xelite>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_235558_404117_69CBA319 
X-CRM114-Status: GOOD (  41.35  )
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

On Tue, Dec 16, 2025 at 12:08:38PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> > On Mon, Dec 15, 2025 at 3:02 PM Uwe Kleine-König
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> > > > Feel free to make the tee_bus_type private as the last patch in the series
> > > > such that any followup driver follows this clean approach.
> > >
> > > There is a bit more to do for that than I'm willing to invest. With my
> > > patch series applied `tee_bus_type` is still used in
> > > drivers/tee/optee/device.c and drivers/tee/tee_core.c.
> > 
> > Oh I see, I guess we need to come with some helpers around device
> > register/unregister from TEE subsystem as well. Let's plan that for a
> > followup patch-set, I don't want this patch-set to be bloated more.
> 
> Don't consider me in for that. But it sounds like a nice addition.
>

No worries, the current cleanup is fine for now.

> > > Maybe it's
> > > sensible to merge these two files into a single one.
> > 
> > It's not possible as the design for TEE bus is to have TEE
> > implementation drivers like OP-TEE, AMD-TEE, TS-TEE, QTEE and so on to
> > register devices on the bus.
> 
> So only OP-TEE uses the bus for devices and the other *-TEE don't. Also
> sounds like something worth to be fixed.

The TEE bus is common for all the TEE implementation drivers which need
to support kernel TEE client drivers. I am aware there will be QTEE and
TS-TEE from past discussion that they will be exposing devices on the
TEE bus.

> 
> > > The things I wonder about additionally are:
> > >
> > >  - if CONFIG_OPTEE=n and CONFIG_TEE=y|m the tee bus is only used for
> > >    drivers but not devices.
> > 
> > Yeah since the devices are rather added by the TEE implementation driver.
> > 
> > >
> > >  - optee_register_device() calls device_create_file() on
> > >    &optee_device->dev after device_register(&optee_device->dev).
> > >    (Attention half-knowledge!) I think device_create_file() should not
> > >    be called on an already registered device (or you have to send a
> > >    uevent afterwards). This should probably use type attribute groups.
> > >    (Or the need_supplicant attribute should be dropped as it isn't very
> > >    useful. This would maybe be considered an ABI change however.)
> > 
> > The reasoning for this attribute should be explained by commit:
> > 7269cba53d90 ("tee: optee: Fix supplicant based device enumeration").
> > In summary it's due to a weird dependency for devices we have with the
> > user-space daemon: tee-supplicant.
> 
> From reading that once I don't understand it. (But no need to explain
> :-)
> 
> Still the file should better be added before device_add() is called.

Noted, let me see if I can get to fix this until someone jumps in before
me.

> 
> > >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
> > >    optee devices in its error path (optee_unregister_devices())?
> > 
> > This is mostly to take care of if any device got registered before the
> > failure occured. Let me know if you have a better way to address that.
> 
> Without understanding the tee stuff, I'd say: Don't bother and only undo
> the things that probe did before the failure.
> 

True, but this is special case where if there is any leftover device
registered from the TEE implementation then it is likely going to cause
the corresponding kernel client driver crash.

-Sumit

