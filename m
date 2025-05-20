Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FB9C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waKLIQkYaWCBpdgBoR5/9FlrJ27z2r4fX7MeV8jSSuc=; b=3k396e+RQDuRMzrdJN9NAm4fR0
	yKabV1W9c0fFtgJEJ+hWSOoz94g4LK2ktkKzXJl8m8uhNirFyhdTwC7XRRyyv0q3Mhbk+x6O6sXYd
	eNkAaV83Ykux+SfASyeewsC6bv3F4kyDyozJkcuWxyhXcRdV3MAmguPqGXpjTTDdHMMLyvAbR5511
	xN+0paRdBZPGZjQb0x/L0Y8mkn+5r1If+VOknmBUiELU/z6Z2OyjEJnlceBoP94LcjbTM5ANDx1cW
	cbbgzRnoAHRck9ekKG6SSloH8lr/E//t5YY4+A2qGr2lzXjv1QkV9xlE3n2YORmzZoijPuL4M/20X
	m6r3Pv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPTR-0000000DS3f-1qLz;
	Tue, 20 May 2025 16:05:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP0G-0000000DN0a-0GJB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38C67A4EC01;
	Tue, 20 May 2025 15:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DFEC4CEE9;
	Tue, 20 May 2025 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755338;
	bh=fCwS5f6sTZqQ+a6z9g0Xx+sH5gACbVRMIIr2p3PM8V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUET9wxAp6R0VYkFNldSl3k81H+HPUgCCdZI0sx5VCYlSUVJQNXObCW1Xq/rTJ1B7
	 +n1J90Br0qU5ydxMnSjQWFjTH/31QNGsPm6TnBuCQjNP+nBXMMuQVZAksloekGi8Pj
	 aY2MYmYXbDDrBOcq4QebvNFlvAeumBra7fVdH1EGmL00NIDv8tbp5MoBHUcE1GdbOY
	 27zq7zDfGRjnoP0j55gBuFVEM8qXtLYx4TwyUQxW3bIXgG8wvvPBL6iw9Pm3KAm4Ag
	 Fa1Wlt94iJ3Yb+tDe7RgMUfYON2Y3832A0RPIg+F92o2pcAG8z4LNyCzQzAQLkFnIA
	 ru528iTdK9qdg==
Date: Tue, 20 May 2025 16:35:34 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 01/11] arm64: debug: clean up single_step_handler logic
Message-ID: <20250520153533.GA18901@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-2-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-2-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083540_171850_F9A29DB8 
X-CRM114-Status: GOOD (  19.07  )
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

On Mon, May 12, 2025 at 06:43:16PM +0100, Ada Couprie Diaz wrote:
> Remove the unnecessary boolean which always checks if the handler was found
> and return early instead.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/kernel/debug-monitors.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..676fa0231935 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -241,8 +241,6 @@ static void send_user_sigtrap(int si_code)
>  static int single_step_handler(unsigned long unused, unsigned long esr,
>  			       struct pt_regs *regs)
>  {
> -	bool handler_found = false;
> -
>  	/*
>  	 * If we are stepping a pending breakpoint, call the hw_breakpoint
>  	 * handler first.
> @@ -250,10 +248,10 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  	if (!reinstall_suspended_bps(regs))
>  		return 0;
>  
> -	if (!handler_found && call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> -		handler_found = true;
> +	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> +		return 0;
>  
> -	if (!handler_found && user_mode(regs)) {
> +	if (user_mode(regs)) {
>  		send_user_sigtrap(TRAP_TRACE);
>  
>  		/*
> @@ -263,7 +261,7 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  		 * to the active-not-pending state).
>  		 */
>  		user_rewind_single_step(current);
> -	} else if (!handler_found) {
> +	} else {

Crikey, this code is totally bizarre! Thanks for cleaning it up.

Will

