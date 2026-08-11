Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF5DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQFksCzI9ITgXg079LIF1ia95IZFV+xgemlTOZzX8Po=; b=2Bb42uODUfJngtlZOG7Gg/SVmt
	F72F3IO3P2EZGNuquoHdsE80DjR+vzVe1RrdQwXnqTf+71n1dei1ra/Pb/odUQKy7BhMBA6sgecw1
	aok02ufl0LsVHNCfMXpUYTskgAK4AtDB9SNWMLrqxViWp0jX+1kCme5Q7R5IrjlUNCvZAbCS75qQ9
	3i8IcdBWmIdGQtSYb8JbgxUUu8xjg6YZOA94ash48IX6W5vAUOEZAFxgILOELbxDZpBPZKXGggdng
	8Vd0OkRebQPf9SitlRp84Jf9nFnRBv0YH7r8uPb76FQfDgin+ONW0XrdGJqrHxQZJ/pWg1hirBDqT
	ydHre2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtw5A-0000000F60X-1dm5;
	Tue, 11 Aug 2026 23:40:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtw59-0000000F60F-1zLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB5B643596
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8291F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786491630;
	bh=oQFksCzI9ITgXg079LIF1ia95IZFV+xgemlTOZzX8Po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kYQ6PBbg4Wye2kBWqrUrJ0lFgIoR3UdrHYZI6b+78DkQHgNZ2YFYoaSe9rZnP+hBs
	 60r3jRYuz+a6wpCs8DXCWJb1ZmHI3CeymXhy3mMVMnpuXOxeG/oEmN+0ZYH8Aj4aal
	 Wj7v+loliIJ7G4Yx/HXWAXcPgOg/ANTl7Hs+igOl+eMwOQ0+c1a8WF7LSj4ZxqdLMn
	 LKKTJO4iSdKhrVbxJQbxhOYGHd5FpgFD+UdK3FTFqtkVagIHQkXi4sf6w/eap6Jlns
	 YDMfpjYPOny1/sfSRFGdaFy7pzgi9kheGWB8+7iih0FO2h6PCU/ME2367xdvtpjoAq
	 Ml9nPl7iRm+TQ==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e65e18969so34454285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:40:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqId0qJs4qRxDrmtHgjaEvWOZGwXyb2r3RqqMFatEPdCswYAGgFJDDlc7PgeN3oOP5gTgYgN2SfzykyEUGSNcsh@lists.infradead.org
X-Gm-Message-State: AOJu0YzFBg1vz0TNRhskf8KqVS2iFtqQ+zlJwoeODCHunWvDJJNUMv2e
	3kGsKQXr75W84trVpFU3CiAzUx6FjgI+8oQ2dUdtv+UAs+rf1kuhbuYuWG2jiJA4C3WO6sxfJpc
	GLIL8xBvA7DMYp4Hfq+GoFJz5nfvMnks=
X-Received: by 2002:a05:620a:21cc:b0:92e:551d:f1a3 with SMTP id
 af79cd13be357-936adcdcb43mr310015385a.8.1786491629947; Tue, 11 Aug 2026
 16:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <8adf966b340ea38ef1df845c7af0c794df3a7bce.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <8adf966b340ea38ef1df845c7af0c794df3a7bce.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:40:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4PRaUoJY-AV7A=Zj8trhUgNN-QGnN9JViDPMeNNuRvJw@mail.gmail.com>
X-Gm-Features: AUfX_mzfV5u94ssaoc1DwPzAKH0PnNP7yL6H3gKwaQ0xQ736PSRCu5sRlHc87ts
Message-ID: <CAPhsuW4PRaUoJY-AV7A=Zj8trhUgNN-QGnN9JViDPMeNNuRvJw@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] kbuild: Only run objtool if there is at least
 one command
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Split the objtool args into commands and options, such that if no
> commands have been enabled, objtool doesn't run.
>
> This is in preparation for enabling objtool and klp-build for arm64.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

