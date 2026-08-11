Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50BCC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWFHqHoDhwv3End6vOaA9Q9bQECLobuBCE6XcECOx5E=; b=gDtRBC5gk7CEjKzS+hDOunbDu7
	/hI65TR2OyyglEah3tzvZ9L9/NMvC4gky16DiQ+53FjWrV/fMaIEHkIbIzEaXlu0vSe3RPNFT11i1
	AauxY5I2oN26h2O4oYdCkkEvjUklHXUE+vckBPoXW1PB+IQF4B3t2YKGxSjUs/0Ua/QNJ/nqxRMeR
	Rmo35fP68MYb+XM5i8I5YMxz04nGZAH7xUfXVoYPVxtVDWnNh/cCCCYuKicCZBHKZCui+y/chVJ/a
	PKWwiRtMiSWBshB5fqhbbMQCaAmvJKGFp6AzWCV8RPqHwZbUrUzPDpTANlVkW1W6BS61i1DP87Sjp
	ItFD/oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtw6X-0000000F68F-2ZI9;
	Tue, 11 Aug 2026 23:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtw6V-0000000F687-3P4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:41:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD02C60A84
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C4C1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786491714;
	bh=rWFHqHoDhwv3End6vOaA9Q9bQECLobuBCE6XcECOx5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hsw1yCqIiK9PM+9LiC9i55v/7XqxN1vcbbVSsfSXSJCeMe6hNBCZ5iTyqexoi36sN
	 UvaBu3REmnni8sgpliNdKNQkCYqPPlwc3E6EOaUtWPD4d2zFFu4StOCrsvIIlmM8U5
	 I2U1fJqTNrY4ZsSYGqkuJvzhBFwtXW5BRoaJoAGQPWHmpA3RP0QNkHgaQrSFINi+/d
	 GB8t5A4VK7cvrUTmw9rJtlwpYMO8r7KCSMwjm7knEPHtOyaqPQb1KbflJCMG2myxbo
	 9I95iGalmEu3AzndKJUB1/uXwfYglCds4K7ZEdUAsPr8OTvCpJY/L8mrd5zjOzDDHH
	 uKydF8uc0NCKw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5b048375so9988185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:41:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgbvpyUyDtuqyrCFrCPCdjpBTf5rIX7EcJcdR6lKOI0XofQNGqmh3VN7Hf8WZwLYZxdPgYmVYOOXPUZ102d42h@lists.infradead.org
X-Gm-Message-State: AOJu0YwCCawu57dGEah3u8z6NCpcTHmFKV4tP/FRWmRLkmt3i5QdmpJO
	KiVvBtSR3X3Kci+n6DpCaRgSARX+S8NLJNNwKDK/X+XF6Ic1FOuAmozfQf0gyzfWb9UFYLknjHW
	4Yka1hlBdKUvYPsC8ZnvKkMCyh2Er0e0=
X-Received: by 2002:a05:620a:3902:b0:92e:6c15:24cd with SMTP id
 af79cd13be357-936b3a725b8mr99308985a.15.1786491713775; Tue, 11 Aug 2026
 16:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <13cec0336ae0e9ad4bd605bf34b1236de85d6243.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <13cec0336ae0e9ad4bd605bf34b1236de85d6243.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:41:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7NFEbrNHJ7WLitWZmoX0k4_=zL9MzzdzppLGtWOymoAg@mail.gmail.com>
X-Gm-Features: AUfX_myU0Cpe94E_C9w_Z6BblVsJt1QBk1Q5hgBLrpa5-RTlSAw_WF2sBWsttQ4
Message-ID: <CAPhsuW7NFEbrNHJ7WLitWZmoX0k4_=zL9MzzdzppLGtWOymoAg@mail.gmail.com>
Subject: Re: [PATCH v4 12/22] objtool: Ignore jumps to the end of the function
 for checksum runs
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
> Sometimes Clang arm64 code jumps to the end of the function for UB.  No
> need to make that an error for checksum runs, which are only run
> manually by klp-build, and for which caring about UB is out of scope.
>
> Such UBs are still reported for normal validate branch runs (for arches
> which do that).
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

