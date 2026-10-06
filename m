Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4EDCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLeP6VbIpX/VuWrTCoAx460K0ej6i0vT/OpWHB37wEw=; b=mbPv7wNtL1oHgvkn5VfabhHS50
	ugQRj5ShWhysv+R4zba/X7GUOIoXyRLjd17ztRjju0bq62kw1sXCnfFSpS6k94YXrLz2Hq55IIZgD
	z2UWOp/zy7FzS7EZgrf6qcl1EUfsHgnPCwtP7/Ft4qYCqUlOLkivFsD2Y40UcueWNWhki4uFSXuoi
	dFHCyv7HdVkVSB3UcKGxRzZgtanaOu6AiAm8EIAe+om5WvDTa+RraiGN1pX1vsFQiCkENxEolKZbK
	0gFuqsjYOzvgezSAYnIylvs8P3gcQ5xU43jr5A6C+imIEOFUiAWn3Ek0JICczaejVRwou1ZOT7y8q
	HnHmFBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuH3-0000000HTPq-0vAC;
	Tue, 06 Oct 2026 01:47:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuH1-0000000HTPb-3ff0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 01:47:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7F3340641;
	Tue,  6 Oct 2026 01:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567061F000FF;
	Tue,  6 Oct 2026 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791251238;
	bh=eLeP6VbIpX/VuWrTCoAx460K0ej6i0vT/OpWHB37wEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M5y6xKyIcc20JZpQCCnt8n3d+ZwVpEVGQ2jZ7Gk/5fukaoXLhRmWTnC1e8yjmzBEh
	 kmEQhm4Szy/LFQQMH/2hTkZGLgec5T8ipFbmimtKFqaF3aOJV3psTKfFNBZOGaaDr9
	 puAIDoJpkG1yAQo6HH9Q9dPZrjuG9eIXO1jwKTNOKLqunIARHGEGk8w14M0Lhg+F0q
	 ORnj3hcSFiJPkdwlXVIQ9a3zS9md5//ED2gBN4dzH93T2UCH76tYh4dxLWqWBYV6/c
	 8TrVxr4+LBEnh32jsvDGN76KM5LPQ83njpjtTmc3GYFU8kdKe9UMWHQ0Ox4jfAu4SD
	 vcOHNboUqm+QA==
Date: Mon, 5 Oct 2026 18:47:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christian Marangi <ansuelsmth@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
Message-ID: <20261005184717.6c9a7f22@kernel.org>
In-Reply-To: <179082977927.31693.14994198839172125816@kernel.org>
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
	<179082977927.31693.14994198839172125816@kernel.org>
MIME-Version: 1.0
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2026 04:42:59 +0000 netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

James, you have to reply to these.

