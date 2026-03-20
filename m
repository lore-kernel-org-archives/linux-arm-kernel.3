Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1540109879E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znqrfBt9Tn+lS51VWDg228rSHnvTVRI9GSF6J2ioULA=; b=zy8s/8c+DNdQJJNwx2bvpI9SI/
	uon5uBUq4UxOVrltjkrVUiLeEJRHQL++xzIFFu3lKJP2qJDi/0kNZljiR+o0wXcvZR23NVhaaFP0i
	RX0ZDaJPjSf77Ue7ZHiX3SypYpH+HISk4mDj/rWzUAK0VC5kr0Fp8ju1ZYD05zpzaaHi5nAQGK+B3
	fFtuoKshKuZOmXXcO5Osk6xTCKLhWzqTMKLTy5MKfIUGLVggs2KUt9EY9mN6zjg38PUUp0rcdFiTG
	qCYNBEM7RzNFXOdDEHVD9wsXQ/YWlYgjhSldNzi9QO2iAoOqGR4AYHyXty/OBhvC3oiUkT1l5dtml
	YIgXY+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3byf-0000000D3Fx-1KXR;
	Fri, 20 Mar 2026 15:41:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3byd-0000000D3Fh-3fVA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 15:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=znqrfBt9Tn+lS51VWDg228rSHnvTVRI9GSF6J2ioULA=; b=h9woErj8ad5bLPk6g5Mjzg7JUF
	wNZ16aySe22LPlmxSAJYbAv1ODpngRD+ZRPQpQgognmcOQNT0TXMAnrzQMcRclQGibD/9DuC1acQ0
	MTqW885npqVAKjU8SpMVggkJbxm2qVOUo35rXBschEbC+unMoQnG7Ap29f4nhKXfn84Z6bV/dMc7t
	pXymtFtJgV4ejkUMQalJjmRmQ3yecISc957c0xV/lszSV3kYUloleMmyXzk7ILQxRR8x9qVONMTi6
	SAvRcdrkZvH8/50z1FHw9C5MebxTLlKX1TZSdS3uh7hVoyOj5YTgVJFveyfc7l6d+6LK5AZ94eQuE
	zR6b2Chg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3byb-0000000FsSt-2Dq0;
	Fri, 20 Mar 2026 15:41:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A2AE4301BDE; Fri, 20 Mar 2026 16:34:21 +0100 (CET)
Date: Fri, 20 Mar 2026 16:34:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <20260320153421.GM2872@noisy.programming.kicks-ass.net>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
 <87h5qak2uv.ffs@tglx>
 <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 02:57:37PM +0000, Mark Rutland wrote:

> I know that arm64 currently uses exit_to_user_mode_prepare_legacy(), and
> I want to go clean that up too. :)

This series; and this patch in particular:

https://lkml.kernel.org/r/20260320102620.1336796-10-ruanjinjie@huawei.com

seem to already take care of that.


