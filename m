Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35197CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyJX7Gue7jTmQgrHmAmUJXWeCl83H7hC9whtHsXhlpM=; b=X8YUDeQLrrbM65nPdvTZhybzMt
	Qu/gCdZL2Y11qI2nsDMqwM3IQiwMunt7YJiKMlnsEqsZcBD5Gp1sOe0zOhurdzqNwRJQJo9mGZgDY
	PCeki5lA/YTEgneg3wXMQm6qV/gmKKKpRX54BE/CyZCHK7ZXqa5hQ1nPp9V5vbDbRdGvdGGLVTOKL
	mZyXzP0R+6azmel4tD1a+Vf6nAuiouT/bTsROPwrNfLhTwiw7XcHPqvU1Iw6ZOALkGA9UTzXFD66a
	VZT996CCOGar6OrtNevNN9v4z801z4JXK8IBYQNAqtP4WdZvIVVC196HunvsUdOm0curDoqlgfDbq
	XNNrT1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGqE-00000004TTz-1Xri;
	Wed, 27 May 2026 16:10:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGqB-00000004TTZ-3YuK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:10:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4444F35B9;
	Wed, 27 May 2026 09:10:36 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C90B3F905;
	Wed, 27 May 2026 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898241; bh=CRZjbl06fUz+NEERLDHhxVn2KAs7qXdskL38TVAJirw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGZmsNrOA98FCZxR4M/Nfxq5JQKZUjFgUqgKWOBdjYTN+JCSVc3kJ37C/3BIwZl8i
	 Z6ZtIxLysZX6bFhsMFGagWewz0gJUh5bNQl4OCGJMF15q8iH5G68vef/w9stOrq673
	 wPutH8J/D6XWO5ZOwWD4Wcs+OQxaWP6XLGav0A8s=
Date: Wed, 27 May 2026 17:10:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 07/18] arm64: fpsimd: Use assembler for SVE instructions
Message-ID: <ahcXfSz7pNugiWjj@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-8-mark.rutland@arm.com>
 <46c5ae49-e59c-4014-91d3-f00124897d20@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46c5ae49-e59c-4014-91d3-f00124897d20@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091043_934527_57A19EA1 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, May 27, 2026 at 01:58:09PM +0100, Vladimir Murzin wrote:
> On 5/21/26 14:25, Mark Rutland wrote:
> >  /* STR (vector): STR Z\nz, [X\nxbase, #\offset, MUL VL] */
> 
> Nitpick:
> 
> all these comments now redundant and just repeat the code... I know they are gone by
> the end of the series :)

Yep; if I weren't deleting them later I'd remove them here.

> >  .macro _sve_str_v nz, nxbase, offset=0
> > -	_sve_check_zreg \nz
> > -	_check_general_reg \nxbase
> > -	_check_num (\offset), -0x100, 0xff
> > -	.inst	0xe5804000			\
> > -		| (\nz)				\
> > -		| ((\nxbase) << 5)		\
> > -		| (((\offset) & 7) << 10)	\
> > -		| (((\offset) & 0x1f8) << 13)
> > +	.arch_extension sve
> > +	str	z\nz, [X\nxbase, #\offset, MUL VL]
> >  .endm

[...]

> >  /* WRFFR P\np.B */
> >  .macro _sve_wrffr np
> > -	_sve_check_preg \np
> > -	.inst	0x25289000			\
> > -		| ((\np) << 5)
> 
> Missing ".arch_extension sve"?
> 
> > +	wrffr p\np\().b
> >  .endm

Sorry about that; fixed now.

Mark.

