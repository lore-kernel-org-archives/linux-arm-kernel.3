Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB713CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phT+DHoysNWQXxNfwF1VwCkmU+81TcuQcDWK4+B3r0k=; b=tkN4qGpQ/34mpmuh5cYhGaiZzA
	zA0E2qMbrS6AtdIVhP5nCXCZSriKQ2r9adm8/upZi1DhR/I0sGNa863SKJulpvOSfI6g/lu1qH7NR
	966N9HK7GTJSxiciU6bnYJPw8uBzYamPRtbrTlOL06pR7Lrqyw27NLXpMzx+OCRzDmdKDG6G0rnQh
	rn2JG8OdHaMO0Z3PC8ggcsGXOk3TC8AH3Ta7ye6qlc6gcVDNd9gKL6MCJG/Am7jyPJx2jvJgNtJPx
	pydH5HqJeLILNDnSuymQpkwjXR54DYHr+ue5vX4EJVjaUjJKrosCOGByu/aIEtvIKSSEajnyMlVl2
	7eGJEkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuBG-00000006eF4-1np0;
	Fri, 31 Oct 2025 18:48:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuBE-00000006eEh-2J56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9793060253;
	Fri, 31 Oct 2025 18:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86429C4CEE7;
	Fri, 31 Oct 2025 18:48:54 +0000 (UTC)
Date: Fri, 31 Oct 2025 18:48:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: LAK <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Question] mprotect() can't clear PROT_MTE
Message-ID: <aQUEk6a_3OWapRbE@arm.com>
References: <04ea9978-e6aa-4498-b899-76d56e19b084@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04ea9978-e6aa-4498-b899-76d56e19b084@os.amperecomputing.com>
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

Hi Yang,

On Wed, Oct 29, 2025 at 03:41:17PM -0700, Yang Shi wrote:
> Our customers have usecase to untag memory w/o unmapping it, but mprotect
> can't do it. It seems like an intended behavior because I saw MTE doc
> explicitly says PROT_MTE flags can't be cleared by mprotect().
> But I don't see why mprotect() can't do it if I don't miss anything. So I'd
> like to know why it behaves in this way.

It would be interesting to know more about the use-case. At the time,
clearing PROT_MTE got in the way. The theory was that an allocator
controls the tags and the PROT_MTE property but if that range is used by
something like a JIT, toggling between PROT_WRITE and PROT_EXEC would
inadvertently clear PROT_MTE. I'm not sure whether this would happen in
practice though but it's ABI already, so we can't change it.

I'm happy to add support for this if there's a concrete use-case but it
will need to be gated by a prctl() flag to keep the current ABI. A
weirder approach would be to add a PROT_MTE_CLEAR flag (I think I prefer
the prctl).

-- 
Catalin

