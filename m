Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B9EFB811
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iizpfzio0v/iDnU/1NLHbWCsyqKgQ3UFSP5S6pHOju8=; b=ACCboG0/FfpmQi
	6mt1WCPu7AhVb7Rir1UU6l87fYB9nRDK3iSc6ay7WX5jrFWHQ4SuTwM5MtlAA4nQzPE5PXvfRwuHg
	qbpJJn+Opt+BOqTOiPaMaOzX43AVrGl0ZbJAHb4UtkoPQCUB8d4qrTv2ddMUoG4RGZKBYSvqywIph
	vvWsQH5vjrx2VOIAn0NLoBmsH66jg88NeiutXPCKqUW7R2dgYlAaRCefqLsJPODrnsYnAf+9Cf++3
	G7ga2SMKSrdrlYnpaNoB/RnmKw7+4/TuC5l4HwvFrfeswd9xzrHcOIafqpeMOgxcFB7ARPUZUVy1k
	1ZeA5tDPCImJQ/BXp2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunhv-00000001dZR-48jT;
	Tue, 24 Feb 2026 08:23:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunhu-00000001dZH-2x7h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5E40600CB;
	Tue, 24 Feb 2026 08:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E176C116D0;
	Tue, 24 Feb 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771921429;
	bh=yW/XdX7C6OB/JJmDVlyglpXhjr79lcN8BLHSEqmvmuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cpx6cgZql3OwQ/HJCQrsGktvOyjDIU47oLrJ4zVE+Ubk8lQBV/R9eo0107OvLJmIT
	 roM6sWuHUryAPLCGIugNxqV4ptPnsT5YEcnOTsruUM9QWg0zkXwVPlCO/zdKfJniQ5
	 yEWn5ketwoDlGyBemeLEemHxdcQssoZhutw8nN1PitISkwNx+rAnFQWmqbQ1xTPARH
	 5znb2xfgDnRI94BHc77IG6Exdx46ShMh914oWmr8Tjvuz2hGe8UK0zZFQS3Gtu5QmH
	 cQznkVTt0t1t10c0gFdoUA/+E1DWEVEosXP0M6yIdK3e0Tzsqip84sWbdFOW2fqhrH
	 6Iz53NCvwyDtg==
Date: Tue, 24 Feb 2026 17:23:46 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Message-Id: <20260224172346.9f094cffc58ce7e013a4d7c2@kernel.org>
In-Reply-To: <aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
	<aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, linux-arm-msm@vger.kernel.org, yang@os.amperecomputing.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 17 Feb 2026 16:57:08 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Feb 17, 2026 at 07:08:55PM +0530, Khaja Hussain Shaik Khaji wrote:
> > NOP is already handled via instruction emulation and does not require
> > single-stepping. Drop it from aarch64_insn_is_steppable_hint().
> > 
> > Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> > ---
> >  arch/arm64/include/asm/insn.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> > index e1d30ba99d01..9429f76906e0 100644
> > --- a/arch/arm64/include/asm/insn.h
> > +++ b/arch/arm64/include/asm/insn.h
> > @@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
> >  	case AARCH64_INSN_HINT_BTIC:
> >  	case AARCH64_INSN_HINT_BTIJ:
> >  	case AARCH64_INSN_HINT_BTIJC:
> > -	case AARCH64_INSN_HINT_NOP:
> >  		return true;
> >  	default:
> >  		return false;
> 
> The intent is that aarch64_insn_is_steppable_hint() says whether an
> instruction is safe to step, not whether it *must* be stepped. I think
> we can leave NOP here unless this is causing some functional problem?

Agreed. I think we should keep this as it is.

Thank you,

> 
> Mark.
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

