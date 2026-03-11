Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F276103E2F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17gqVcFLkX3yjKkYUMYvPyvLkt+z2IA/xfmuuDNf/zI=; b=ER3PRJbwiYrehbHZx5itTvmrD8
	z+FmuFVt9lXKrcYNIKtWnsVV/CYSwA8gaEbL7YC6Dc38E8jOGmQUEbZDh+wcypc2+5cnpZFtzRQNh
	fr8e8scRM8E69jShjWmBdWR/HOfkgHQUyqF7NuisQM+fu8ZK/L5Hyidbi5lVWLSmiOi/+rhURihbN
	Pvx96dnAADlvKAXtXgrrQPc+2UqugT4TH404TOzGa7LsxU3vg1xaHaS4VLVIMsjzaL1SQTWk1lBnV
	p/BTd4W3Yc1n1X7mahO8RB+MWeREY1p/HBeVG7CcOfeNG8YaHDqfdpEKdgXcs7ArFToRc0MMW9FiY
	jgj0d8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SuC-0000000CobI-3ZVI;
	Wed, 11 Mar 2026 23:23:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SuB-0000000CoaT-0gJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6869F60141
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18603C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773271434;
	bh=mdRHxPO65Zu0Xe+URvKXqIZJjEeUBJGZsZOu0DoJxXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SKY6CSiXkmd5NVqnMn0YpSndGJXaXHirNQvsimbB+qDU3ZX3ppA+PRf/L7OBZu8KZ
	 gtTJcc92H6MSaTEAmmCXqU/wM0Nm4xBY2QNF0vwpJcVGQlQDeevAck3gtt2P5GKXG/
	 SWGLXQWVSym2caQMAi307DnGXC6fActrYDVtjA5NhpmS75cmNYzvWp61OyjA/Xy4nj
	 xYvlFVz2qaJPEY/Eg/tsLS2+UJYdg2o4BXoLj9DBxgZ/zYZGi3zh17RAoCCNlmoJ8D
	 tfgdnWGNs1/byN22UELnRs3VpH6zJZV6vfv5ODbA7HYe2CdSvgIF9354/2iTUTkfut
	 ycJsbDb7CO8EA==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899ee491af3so4888286d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdJovnmMQ0iD03mB2J9PZlOlTKyG5VkitGRzCreOUT8gWXdPjoliiLmD8choj1b0gS/R3R4NoDA8aZvZWoo2gY@lists.infradead.org
X-Gm-Message-State: AOJu0YyfumVrjfh+NahYg2sODuMY5GOVBcMJ5SCq13E+g4NAQO09rE3n
	CPzzxsUgRzs5BsDdP6xpusJeB7FVciktpF4tYHwlSITRiz8/Y/Bi6bxhFSeNiItC//FiopfEeZm
	cD6HPLw+3P7aJGItpHD4X2dPoC4/Bx7s=
X-Received: by 2002:a05:6214:19cb:b0:89a:6353:ac1e with SMTP id
 6a1803df08f44-89a66a24d02mr64053016d6.11.1773271433195; Wed, 11 Mar 2026
 16:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:23:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5HRtBgz5F9nQs=VZK-fs++m=yk5KJxWHTag9Px49KRbg@mail.gmail.com>
X-Gm-Features: AaiRm51haeqPpuVb_a45rNDs0elojnpeLnlifdhIe3YBSUHOtrCBPshja6EG53M
Message-ID: <CAPhsuW5HRtBgz5F9nQs=VZK-fs++m=yk5KJxWHTag9Px49KRbg@mail.gmail.com>
Subject: Re: [PATCH 00/14] objtool/arm64: Port klp-build to arm64
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 4, 2026 at 7:31=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Port objtool and the klp-build tooling (for building livepatch modules)
> to arm64.
>
> Note this doesn't bring all the objtool bells and whistles to arm64, nor
> any of the CFG reverse engineering.  This only adds the bare minimum
> needed for 'objtool --checksum'.
>
> And note that objtool still doesn't get enabled at all for normal arm64
> kernel builds, so this doesn't affect any users other than those running
> klp-build directly.

I run this test [1] with this set on arm64. Everything works as expected.

Thanks for enabling this.
Song

[1] https://lore.kernel.org/live-patching/20260212192201.3593879-9-song@ker=
nel.org/

