Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7DBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 05:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sAVigVgDhL1JSY5chQ12s3pJ0ZlvIEA62gvASI+X+Q=; b=lXkCscTJ1JZ0l9mM6NwNRd5L3d
	1zHZEOABHL3ZEep6zAy/zvEfqk+rzxhlnzCJW5+Vk4GxAQUewbXCtIHkNn/hGdMKx2TsDFsTVJYMx
	+vR3HcoP+M+Ig9zm6KmYA3y9aOc76vFNuHU0IrMtwo7ai5AyQM4rwEszyVWJuv6IEGCcc4qomB9HS
	zMAtuuaw+9PNN2lOLY7KPeBaSKq2YJ85yYdgmj5yFz9MiP5vnmeeUDaTAVqOZWJOuFYSO4uBJRT+L
	Z+UbyqA5QFrV5m6RG9VWaTHR8gFWSTrjMNyGxwre4r+kPIkuDMVGcQTRgpz6gPI7ZNJjvV3R8WFZf
	yU+4mbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmap-000000051WM-3EZh;
	Wed, 30 Sep 2026 05:10:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBman-000000051W5-3nki
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/sAVigVgDhL1JSY5chQ12s3pJ0ZlvIEA62gvASI+X+Q=; b=kC4XLiv3WlGABmQHoWdAaLDekg
	fWoxVIBBghnnP5K2w7KRcDdvQr6zMAKOXwP4o6hVdpMdKrwQfOJCusW68paxGqwNWJtNN6R/1RVE+
	Ui+3FGQVSCIh1GONXeLnqYCVHnE25mwCb86hcEqiqiBnxD2rxvxLMMUWGLzfyNYRTKEaQRaFCeW0u
	qK0t5vOWNtdml43egBE+FM/11YeO9il0oIdUh6oXaEJrCN2WkNRN95qZd/g/A7ttO30o8EUh0EgEW
	br4PqBec0HqxaZMaqiVXp47Dz7zSh/zSom0HGd+wSZMZYZjcs+J9LYLWm+PCxUk+ZDRYozon6sm42
	iShZSr7w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBmak-00000003Mu4-2Zmn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 05:10:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963E71477;
	Tue, 29 Sep 2026 22:10:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D6F3F763;
	Tue, 29 Sep 2026 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790745050; bh=XNgz6d/OZjziPvSkUOUSXbumTXkkojRGtXQXxfoLR5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj3iOJpBJSgE1UgTtkfspHIrPqJXBq3eMgxYVBo8phSDlGxBx08q9zHfcQem6c5o/
	 CymR7GfymTQKKLxSO7tbMnMliPVLUpoTN6HoOSdA0DkzggSf3AuxzXu80fr9ERid8e
	 dHyKwn9FOUbhHKUQrFpIlscNlyN828VqueuMANWI=
Date: Wed, 30 Sep 2026 06:10:46 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
Message-ID: <aryZ1lODdPGgKT2w@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
 <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_061055_006393_EC0438EA 
X-CRM114-Status: GOOD (  22.08  )
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

On Wed, Sep 30, 2026 at 11:39:36AM +0900, Kohei Enju wrote:
> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add macro definitions for the hash algorithm identifiers, as
> > specified in the Realm Management Monitor (RMM) specification.
> > 
> > Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> > ---
> >  include/linux/arm-smccc-rsi.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> > index fddb77986f70..a83df2655808 100644
> > --- a/include/linux/arm-smccc-rsi.h
> > +++ b/include/linux/arm-smccc-rsi.h
> > @@ -144,6 +144,13 @@ struct realm_config {
> >  
> >  #endif /* __ASSEMBLER__ */
> >  
> > +/*
> > + * The RSI definition of the Hash Algorithm (as specified by the Secure
> > + * Hash Standard) returned in the realm_config data structure.
> > + */
> > +#define RSI_HASH_SHA_256	0
> > +#define RSI_HASH_SHA_512	1
> 
> Is it intentional to omit RSI_HASH_SHA_384 here? I realize it might not
> be implemented in RMM yet, but would it be worth adding the constant now
> for future support?

Acked. Thanks!

[...]
-- 
Sincerely,
Yeoreum Yun

