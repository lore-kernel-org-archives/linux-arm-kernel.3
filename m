Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C72EE9B364
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDPdb9l408UW2dK8RDYDN3+fzmDd+VUlaz23BOiaXGU=; b=sa+EmYxZ3+m2u/SftetmOZiAOr
	vzqngcfT73SWNyzlCeZrwugCuBwBZTBuwc5vSYqAkWZ6n3E9W9/lK/o+CRRgPmq6BGFXn9xZvxz4t
	7AkYAebq/B2kNsnIycaxzg0420qxkRq51WU11KCleKROTh3nzKyB/CMqVM9LzLjAuk5iU4ycfFcte
	KqW3/nteY47USrfBvbpJ5sK+mW7x8c2bdS6z5y9fd6j79TezY2GI7kxdEMreCUQXpnYzaOXGHiDb0
	33G7gPPkSAqfPcSrtb+ii9eW+psP8dTNao+M3ZxYgELXvLdgPDwHgOSzyR6bScFF6bNJChP4uC9iN
	k4nIQyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0ug-0000000Cky2-1fBr;
	Mon, 02 Mar 2026 10:54:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0ue-0000000CkwF-0e1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:54:09 +0000
Date: Mon, 2 Mar 2026 11:54:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772448846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uDPdb9l408UW2dK8RDYDN3+fzmDd+VUlaz23BOiaXGU=;
	b=jD3oAQejbS+X4o7pXnOD9SU0N080OPn7NoiIA9oVFHBYkL4elZGd5JIb5yRSblXDwckUow
	1S+rNs/cRLzHUueRZu5TWe3J8FSoOFtO7C7BPSad0UMoSI9DVuH9LTQoT3vbwRDLUUelNK
	xbwLeDlbcPNOeQKmlkGlvHzpcIyhCkvSAyEb6hTc1DJlrXiFIJ+7RMgNxdhs4JfCkq+KKa
	HIH9k4vidPvk51PjussL3GkBZEKi9HhmWiW4rrlR6viyGVywKIQmo7W8CU+z3C5aAQyM2H
	q/JwNoN+783EXenoci3P7MD14nbdF0DS0uKp5RZxG7FUEBejbeBCw9L8TYHkLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772448846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uDPdb9l408UW2dK8RDYDN3+fzmDd+VUlaz23BOiaXGU=;
	b=TexzpHjFRCZAya2R5oiE1nlJRjCVIQFKzu0QNDERBwrBW6jl/8qwmLwPC4nAG2KW1Fn9fj
	oOvKy83hJh14X4BQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 6/6] ARM: provide individual is_translation_fault() and
 is_permission_fault()
Message-ID: <20260302105405.zTTpLiRj@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcs-0000000AwoO-03iq@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzcs-0000000AwoO-03iq@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025408_434728_09CE83A0 
X-CRM114-Status: UNSURE (   5.73  )
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

On 2026-02-27 15:19:34 [+0000], Russell King (Oracle) wrote:
> Provide individual LPAE and non-LPAE definitions for both these
> functions, rather than having ifdefs inside the function body. This
> places the functions closer to their associated definitions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

