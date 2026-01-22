Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC3DD6CFAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 23:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAz0VE0aOXkTcnMsKZPcPLkEBbWRFSQ9zoUsrO3JsFA=; b=yBx2vDRezCu8aHDNgH7gs6hXC3
	WOYxewG3dHneVJxQqZ3LaboQBTxeD+wgQLbENRuiazyvWwTsxsdgNTl5EhYfhbQmM71CL0Ue10OYc
	9CUxGX+NWQtRoKlvM/6xFEgduscf05ShtEDKtkh2hDWz9u2//MKRYqBDsTxxlCejLF1OoOVE0+CCn
	rGvCmG77azVoj0mOBwdv2RQIsVo2TTPN2ewmDpAAIj7qQhnpoNNTHJSLOl+Zo7a4LTd1T6NHEXoKA
	xQLJseGvCvgDclXNV7zJv9NExgiw2YrRfC9X2Bl9bgvv/KNERhXPxdBVBJuDQ7pYG8PMX8ye6Ke2K
	wEtpPjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj46Y-00000007suy-31dO;
	Thu, 22 Jan 2026 23:28:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj46X-00000007suZ-0pVR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 23:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4936A6001A;
	Thu, 22 Jan 2026 23:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21401C116C6;
	Thu, 22 Jan 2026 23:28:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gZQ8voLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAz0VE0aOXkTcnMsKZPcPLkEBbWRFSQ9zoUsrO3JsFA=;
	b=gZQ8voLNqP2wWMPrgAFFPQqM3dQtnQELPH8RWkZqlFaRd3tnhApMvte4sd3nU0Ql3XOzkx
	r7O/0h1mHbk5Z3LpYrJJT2rTcscRugiMW5k6hm1nduek7IWmiVHOrg8UD9fwD1yWt9p+cc
	JKaaRYWQ9EN9tFsCeDd2mcNJ+9jcJjQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 325b9127 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:28:39 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:28:32 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH 09/15] random: vDSO: Add explicit includes
Message-ID: <aXKyoETSE7G4PqmE@zx2c4.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
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

On Wed, Jan 14, 2026 at 09:01:41AM +0100, Thomas Weißschuh wrote:
> Various used symbols are only visible through transitive includes.
> These transitive includes are about to go away.
> 
> Explicitly include the necessary headers.

Please lowercase the subject line. Otherwise,

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

