Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A4ACD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhlaZDRZBbSgZ35Pv7UwfknItxa5UFtsrwDg/KAyMTw=; b=YUkoxYYmoIQ1e/DsXhFk5UXx5n
	b+W7ScH3+W/F9/F9RviPUtOB1RdJnQgCBngeLfLNWtU6JwBx+K59V88aqcMxztoPLBtxPTSW0/ynd
	4deKneLC64VF8eMpb+Kw64gWMcENGxfTVtR3NWdvzzm8tdxCXH1yic26eTUMPrbs6yeY5QlDzC4wt
	48xOfVmfg1KdlisgmKgoYmoEfxTAQM8lRB72IsgJB+mK/sbAPfRna+hKGbpntwv73XK9lnZy2+jqm
	TVBMdaihbyhAsUW1zG0NixTfGPipOUeifqfWFncyUOn7qPP7QAyfjBm8efpxsqcqorHHtp7Y5Xers
	xRC4U5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsSD-000000028AZ-228E;
	Tue, 26 May 2026 14:08:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsSA-0000000289z-07g3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:08:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05EA3169C;
	Tue, 26 May 2026 07:08:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83C773F7B4;
	Tue, 26 May 2026 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779804496; bh=tBzhwHahomz6uwc8GUYFU3AAPX0bK9V3VDvg/q4LsYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgRQezl+HdnVQoGPfPLj94IQdXbQUmhV7d5+JWdu6CTZjWRZdbvvCvGdfbyOny9/D
	 wrI8S5M4+DcLB0jWV7YhiOE5vS9NK93pCOAJAB2POFgBsVg8SPNKXC4zUIbYfGE7J1
	 WDKyw59fgDaG1w+yC6evrBumz9TYjbI/qqVBd2dU=
Date: Tue, 26 May 2026 15:08:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <ahWpST4K3rbMbjWK@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-18-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_070818_254929_9D1B9680 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 21, 2026 at 02:25:55PM +0100, Mark Rutland wrote:
> +static inline void __sme_save_za(struct sme_state *state, unsigned long svl)
> +{
> +	/* The <Wv> argument to STR (array vector) can only encode W12-W15 */
> +	register unsigned long v asm ("12");

Sorry, I had meant to put "x12" here, but evidently GCC and LLVM accept
"12" on its own.

For clarity (e.g. to match the comment) I'll change that to "w12" and
make the type unsigned int. Likewise in __sme_load_za().

Mark.

