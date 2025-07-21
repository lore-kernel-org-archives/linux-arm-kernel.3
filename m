Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5498DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Plfy83lHaQP2u1DomfTBngev2A9FCiEv/H4cmv5vTNU=; b=pek/RwWFsER6uJtY37WjSa7AGn
	c5ITPmhbBEVXungb28KDCJM8aNVoPvAQyzeyRgF1godYWnLng7XzMqwiBy0edPEksxQW8ybijBAvm
	N/UdIXLwYlDUNFMeTVcN3MukYN5+HdgURsYodQZ5wg5VFSQAL4tU6T6tpM7Klj7ctIUAf8xAt/EgY
	cX08aKy2bnVvHpkqQSubl/UJHguo3VuvRsHKCwGlstVq2MzWt/AVNda/P7RcpLlt2KuklUAoXPyvL
	eLuvGK2/AdzLU3XIsKEsL2TQVVYHWGYg+6w1OaVTwLi0zrxxnFLYVcKMnRU2V+TJPRRmMLSdxOkRK
	GIYb7ZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udub3-00000000M9w-1Sao;
	Mon, 21 Jul 2025 17:46:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udu6O-00000000Hz5-0iT5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 17:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3B4B45CAC;
	Mon, 21 Jul 2025 17:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D09C4CEED;
	Mon, 21 Jul 2025 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753118099;
	bh=c0l5eADL3DJiA5CLjuYvNt1KKuvoQU9z9pZBTTWVbtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWFF9F6IBAY5fFf2QnyIqqBC9pEYTodsSPjIt6odICY1lu7aiHBApakvbkoMmbuBJ
	 Ctqo22Mxyi4b7Mb7bw4/F/Qd22n0Otz45sDtH1lCFRECJCr4PTjw21Q7Zgi+Nei1L1
	 eJW0SXy4vZouNmcijmGUnRJEtkOC8sEGpXjrRZB3S9U34QIGbz0Bfwx/S7O792LNKv
	 7urlFTyOczxy/uqyTik9fch0fb1xtgVeK2lwEV/xcLjms7ALF5az6YwWecPJNWm0GW
	 zK63l93FlwLkjDCSSJuQG0MKMoNxxodrJsZlLVuF11nnSieQoQWaQeh4JM/kM5Lpuh
	 wFJ0YPyEtz+nQ==
Date: Mon, 21 Jul 2025 18:14:53 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jack Thomson <jackabt.amazon@gmail.com>, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@arm.com, arnd@arndb.de,
	wei.liu@kernel.org, romank@linux.microsoft.com,
	mhklinux@outlook.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, oliver.upton@linux.dev,
	kvmarm@lists.linux.dev, roypat@amazon.com,
	Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH] arm64: kvm, smccc: Fix vendor uuid
Message-ID: <aH51jfOmPfF3XEke@willie-the-truck>
References: <20250721130558.50823-1-jackabt.amazon@gmail.com>
 <86jz418rh3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jz418rh3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_101500_230488_C31E9625 
X-CRM114-Status: GOOD (  24.68  )
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

On Mon, Jul 21, 2025 at 04:59:36PM +0100, Marc Zyngier wrote:
> [+Will]
> 
> On Mon, 21 Jul 2025 14:05:58 +0100,
> Jack Thomson <jackabt.amazon@gmail.com> wrote:
> > 
> > From: Jack Thomson <jackabt@amazon.com>
> > 
> > Commit 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for
> > getting hypervisor UUID") replaced the explicit register constants
> > with the UUID_INIT macro. However, there is an endian issue, meaning
> > the UUID generated and used in the handshake didn't match UUID prior to
> > the commit.
> > 
> > The change in UUID causes the SMCCC vendor handshake to fail with older
> > guest kernels, meaning devices such as PTP were not available in the
> > guest.
> > 
> > This patch updates the parameters to the macro to generate a UUID which
> > matches the previous value, and re-establish backwards compatibility
> > with older guest kernels.
> > 
> > Fixes: 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID")
> > getting hypervisor UUID")
> > Signed-off-by: Jack Thomson <jackabt@amazon.com>
> > ---
> >  include/linux/arm-smccc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> > index 784ebe4607a4..50b47eba7d01 100644
> > --- a/include/linux/arm-smccc.h
> > +++ b/include/linux/arm-smccc.h
> > @@ -113,7 +113,7 @@
> >  
> >  /* KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74 */
> >  #define ARM_SMCCC_VENDOR_HYP_UID_KVM UUID_INIT(\
> > -	0xb66fb428, 0xc52e, 0xe911, \
> > +	0x28b46fb6, 0x2ec5, 0x11e9, \
> >  	0xa9, 0xca, 0x4b, 0x56, \
> >  	0x4d, 0x00, 0x3a, 0x74)
> >  
> > 
> 
> Irk. This is remarkably embarrassing, and needs to be addressed ASAP,
> before 6.16 ships. FWIW, I've just posted a quickly whipped selftest
> that shows the problem[1].
> 
> Will, is there a chance you can pick this up and ferry it to Linus?
> If you do, please add:
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Marc Zyngier <maz@kernel.org>

Sure, I'll grab it. Thanks!

Will

