Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB6CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlNE8647W1oXM8pmslkXYsAQTxFMdYzSDM4CLpScHtQ=; b=lcj/Pd3CxvPiPCAq+IFIXY6yQB
	hjGYe8gIObTFRgsUqqNTjhT5UgwCPIfOD+QMZoFTG4QWCcJ7/vUO8GKLmpmOW/eMoSLNTdt7hUS0G
	mwMdXfR/0LbmJDn1bbDwSemclkGLstwid62G9BNZUoT5BaQ9SxqJjcD+q5Mu0C09Arju6dbTI+dcy
	UAVQkJ2mBg5GEZLVSzWTgMRneQFYlAIyVh1H4h8iE+Gcvoz9bcmVDPrrCfJIinF5qEiGiW6HV72fK
	bqyBNLg0BBXTmgWYiERE6NzYc0LbzVw5HrZ3/wL6C2nz0dQCAYqPzdZ1YObUHH2kor5OSfFZOw53Y
	uQqq4paA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwQ0-0000000F7Zr-1gv7;
	Wed, 12 Aug 2026 00:02:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwPt-0000000F7Yw-0sbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:01:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30921601E0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED9A1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492915;
	bh=tlNE8647W1oXM8pmslkXYsAQTxFMdYzSDM4CLpScHtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g71xhYkcBqiEAXjI0pUJc5IKys9x2zUQWNtogGpjpTV7PVgRSBu3VYrB52FeySmvL
	 lIXFmtXKxxFQ6tP4vS5LipnfZKLspRk7NWzzw0tipOIH3f3T/EH+WzFTjAmpVQ7WXx
	 aOFjDE+nKLZAHRRQXi088OCE8j2NRYb+wfTIx5gYMu5VbI6XDKkzW9ALQiG3pDMN7Q
	 m7cE/ITNxNRv4wNrm0GT3jIZNPI+NsZiD7fcfJs8BBk12zlzL77wYDfwJfLGdmghpi
	 ysLIvFP6sTJGgqPFUoV0UZ7bS8D7mKNfjlIDgXQQNhEOwoFZnvCv7POBdbtzenNn/L
	 YhEx6NH+5RDlQ==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e67555e24so27460185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoFNmbijknQrotSk1nC7TDbAu2XVFGn4VU0swSwxLIOL18BE2SA2kASNpPqGaQ1NOZMtiDkrBKbHIrbSVjrl6W3@lists.infradead.org
X-Gm-Message-State: AOJu0YxfKlOHk9QfoHFK7iPOiOmK6LO9zUZ7ASYEnft2QmbFvw3dOjZ8
	LSdNjkveFa2gcn1WV22j3P7WEI0BXbSLSiq27reGNp1bFtWpk1Bjqj4c7you5lbLsgFs6bj9Qnm
	PkPbbSeEXaNtWJ0k4AMuFahJrIhdkRBg=
X-Received: by 2002:a05:620a:608d:b0:92e:603f:1f20 with SMTP id
 af79cd13be357-936b39e0d3dmr131620585a.2.1786492915065; Tue, 11 Aug 2026
 17:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 17:01:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Coa50sXixg5dsbEf9QLTqM6F80wB2x_jE4KWsYsH-_g@mail.gmail.com>
X-Gm-Features: AUfX_mw7frV7K8Eb4zKvm7fI_9V3cTVMMpTJJxIT8TK0kJzqq-L4YeXq89sPw64
Message-ID: <CAPhsuW6Coa50sXixg5dsbEf9QLTqM6F80wB2x_jE4KWsYsH-_g@mail.gmail.com>
Subject: Re: [PATCH v4 20/22] objtool/klp: Introduce objtool for arm64
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
> Add basic support for arm64 on objtool.  Only "objtool klp" subcommands
> are currently supported.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

