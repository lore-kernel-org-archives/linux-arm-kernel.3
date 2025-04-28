Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89133C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHvvHhceHa8plRP4xtRJKiJR0MG9BOvLLfDUR5Tau4U=; b=tJ4MRd4N/oSwM/X2uJcXpEcVfL
	aJ6XGV1vCYy3KuibJ2KNJNHTXEnFbSX+2YnQMVauQpdvxWNvkJG+GOQxT7SxrtyPCUOrg3me1T0lt
	VrOJP1MTdneHWnFMx2pOcwlMM/EysBS9fAx4wlWRV3PJPBGqIXEe6JRKyFo+W349s2aR9OdyBd8bi
	3yKyv0cQ+JmN1Yp8jdkZkm0kpI8+pGLTvfDfLRsF1tSXzMenL2ASULE9RVE2BuadGOJ90+GlEN7xN
	IZoonyh87TNu+yX/Cdi9Pahmc+ltKOYSLX4DPRbVVU6+6flUnCt6Bv5VIP/9gQNTk+/oe4rc6d+lL
	riav4vWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JYl-00000005MOq-45oW;
	Mon, 28 Apr 2025 08:09:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JF7-00000005JFo-468A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3F1C5C5FAA;
	Mon, 28 Apr 2025 07:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BD6C4CEEC;
	Mon, 28 Apr 2025 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826572;
	bh=gz3v87ioQs5PO0ngRoziti1AQO3BGFw3wZSaC9CSs8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPximnopkAxrgRV655KCEfhvJ1fjCkHn8Cnxg5LGMEmrjp+Wb0hcUOj1p00wqeqUO
	 dzJlkTJF0OCpYhqD3T2sHusjTHmrV8HhuFPzeYoC9V6RUTrTkB/0j/UJBuE23ZJbIK
	 TWcyt2JNxEdwdo7bsUjYx8qw7JVCoLMq6jNtjD7NTLAdkRqg7c9ooybXK1uMDVJDlo
	 vfCdlKGblIlmWtEeht8ssisgKsw3pxrKias4RnPnfsZtslh2PmIMouwpR316bapMvJ
	 8JhEytjwyJYy+Vj9ezr4IpLOfyTyA3Y3d6rwFgAw1qPRi8CXbojTuvkhgv2nhhkGjH
	 iQMcp72gl2QeA==
Date: Mon, 28 Apr 2025 13:19:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <aA8zBP6h8oG5m4w9@sumit-X1>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-4-sgarzare@redhat.com>
 <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_004934_057392_BA2F97F2 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, Apr 14, 2025 at 04:59:47PM +0200, Stefano Garzarella wrote:
> On Mon, 14 Apr 2025 at 16:57, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> >
> > So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> > return responses in the same buffer used for commands. This way we
> > don't need the 4KB internal buffer used to cache the response before
> > .send() and .recv(). Also we don't need to implement recv() op.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v2:
> > - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> > - removed Jens' T-b
> 
> @Jens @Sumit can you test/review this patch again since from v1 we
> changed the core a bit adding TPM_CHIP_FLAG_SYNC instead of
> send_recv() op?

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

