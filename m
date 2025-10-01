Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FEFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADdI8rZ3dED0LAHfGAX7Eypvx5tHk6gQSwguldezleo=; b=m9s+U9iEQUvaFYGnDiyR4jUza7
	bN/jjLE6pYHTo1nUmHnT0x2UpPoaSGwdMAkTS9lqFKp2RD/JwvPeIeK07o80ExKIX4O7lxuANO0Q3
	08XLifKu88qQgCMydXbxSlgC6Pllh0ASzQ4iXLOKIw3EH64piUXC8e/ldaKQ8no6HWJcbBlW4FChD
	jcPzqE6W/Q7DEprYFNe2Mc82TyXMIs5BJjtVvLLh5pJNZ9QMjmL5gdeDHdMIIVabQIa3lses/kknu
	S/5jXRvOfH0E+DlwOKfOv3SNZI1FSFB3bYh1b7WpBBQxSr+WzLjFo6RUMRHangv6PHvDLISxdhgI5
	ll1A6kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wG1-00000007wOy-3Uw5;
	Wed, 01 Oct 2025 12:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wFy-00000007wOY-46s2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F0CD48DFB;
	Wed,  1 Oct 2025 12:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F792C4CEF4;
	Wed,  1 Oct 2025 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759322910;
	bh=kTs6Z6JUmuOjDeM8YvYF+Rgm2HCsCkkJEW8DnRFMBfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQCxd/Y1KPghQQf9s1Pk/uRQtOBdgFd+ddLRwVKQqTXmWl6lvSm1jzL55A9O6QFhK
	 DUB0/jaFSXWD/gu7tL4gcPaBVFFvp3uYYvXLaCv6Qf4kBTMhA7lgHWAbu14KTdUkjD
	 q12DBSXUDm1UXkUYZ1k1fkpIcjza+dUWGbF7CP/+S0kwpeaiRNpO6U18cNqFsIFLY/
	 yvmbaTVwqo+fHJWzrjs83JwyMjEiuADJJFEKupFLhKs2laavGHp9H9BKmaA8WDcg8W
	 xDnj5Zi49zmdek7QSZHQrlz3TkQ64s9LSNyz+wNtTJclUzX1pa+TpzW8qN8zTch65u
	 8umVk8PZPlIGA==
Date: Wed, 1 Oct 2025 13:48:25 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
Message-ID: <20251001124825.GR8757@google.com>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
 <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
 <20251001095505.GP8757@google.com>
 <0acf13d6-d63b-4079-93ba-d53910e624d7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0acf13d6-d63b-4079-93ba-d53910e624d7@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_054831_036991_EC816D55 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, 01 Oct 2025, Markus Elfring wrote:

> >>> Struct apple_smc's mutex was not initialized before use. Surprisingly
> >>> this only resulted in occasional NULL pointer dereferences in
> >>> apple_smc_read() calls from the probe() functions of sub devices.
> >>
> >> See also:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc7#n94
> > 
> > Provide some context in your own words.
> 
> Would contributors like to care more also for the usage of imperative mood
> in proposed commit messages?
> 
> 
> > Don't expect others to click random links.
> 
> Should the mentioned information source be better known since a while?

By all means, provide the link as well.

However, you must also provide your own context.

-- 
Lee Jones [李琼斯]

