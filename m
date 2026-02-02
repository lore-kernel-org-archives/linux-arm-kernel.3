Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E2CE7FDF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddf2ioH2Ktuyztsu5afd6+uqRjbgML42099HAKIrcNg=; b=WD5K8gXrhV4wllq9Scf6u8bIo6
	VYi8y4F6+AUv9g3CB21W8gTwpur4hOsfjTVoYH0tU/nfnsZX42BmYdQTYOg7uq9lLjSwm8WElEhzy
	DUo6RRqQGMguLTtO5fgSXJpboSf9yVwkRxGQpv5m4mepJXzhKlSmhrjZI/iCkPfTqqe9tnQGj9Edw
	b3u3WH+urnqm/ei31gUaEa+YEQJD4lnvfsTDgwhiNbKpaBnbNymhzSgOlLLMDezMZtkXjq8QOh9YJ
	Mzv2b1u1qPvwBs/stNBTPGeWD7We81WfQ3l6QvIuzkE3z/TNKuzvoxjE8PMfN6Q4H6FtpKSVo6VOV
	S5GNUs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn38Y-00000005kRI-00vR;
	Mon, 02 Feb 2026 23:15:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn38W-00000005kRC-43AQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 23:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8281600AA;
	Mon,  2 Feb 2026 23:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA2DC116C6;
	Mon,  2 Feb 2026 23:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770074115;
	bh=1XwHPN4AupLXvP+bN6kH/Ou8DAfIc/Ke4SzidTUEdR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acfQ42a8kNzQpUvKE3nNJtuaqyG9amvuJG30UTwrzTlbtNbQEGu43n7K4ukBgExnR
	 fJEVD2y9wCADtuQYLA0md/3egtYljsk83cj+VnaEjhcPrNfXypxALKrWQ1g+Pcltuj
	 U5AGuhaw7lLkR6wmXrZqn+C/Io5/B4jjnZh9K9ge8bSew/OweBx5TR6NlEW1SiXy+b
	 TottQoB9xPLK5jvysSnZ/js5cXxQU8u8jsULAsFeiJFzfceV1YFhxS4m5kAwxOspny
	 1Be+K49shZdkgkHFKasAAD4qeW5YJo8ucGy9+MLpMpEHgKImdd98b6Zwe2F0QGDeHP
	 QIembv1zbS5Tg==
Date: Mon, 2 Feb 2026 16:15:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Naman Jain <namjain@linux.microsoft.com>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Message-ID: <20260202231508.GB2319189@ax162>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
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

On Mon, Feb 02, 2026 at 03:15:30PM +0100, Thomas Weißschuh wrote:
> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
> > I am trying to implement reproducible builds for one of my product
> > kernel. I referred https://reproducible-builds.org/docs/build-path/
> > and tried to use both -fdebug-prefix-map=OLD=NEW and
> > -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
> > binary reproducibility without overwriting build-id to none. 
> > If I move the kernel to same path in other setup, I was able to create
> > same binary hash, however, without it, there is some difference in
> > build-id hash values.
> 
> Can you force the same build path during package building?
> That should avoid this issue.

Yeah, I think that it would be better to document this in
Documentation/kbuild/reproducible-builds.rst, as opposed to adding a
hack to disable the build ID altogether. It seems easy enough to make
the paths consistent between machines and environments by using a
container or such. The new scripts/container in -next could help there.

Cheers,
Nathan

