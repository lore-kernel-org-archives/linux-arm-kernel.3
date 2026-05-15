Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY1y/tNdnxCqvCuYMSlbXrj4NmjiYIYzfxdvgPG2Xl4=; b=aNQRgs2TmjtKd0K7J6qU0Dn0xB
	6D8SAhSkcH6cRIHMdWcaSSxtGEEidWM5wOjisxkFrqs4frC8WHvR6cbkKRoGvSJbebAkxFkUcjz/x
	BNVHbTrxR5k8IaMeUJn8VfR3AtmtdE8q4puIT9122LUzGX0gOeb72uGrO7vfVXmfPBKGSKvVS9kBZ
	Kwt7kuYf9hgPkfkHhsJgebjdjAAzBcRJiirTQ4cDaw9xtD8cEIPEUKXNF+2o/ju/yaY2l9KIFcleD
	NabtdRT04OK1Dccy0PJaEa64b74eyQ9X6TiMxCpMvb786vzVGx948Pr+QXwvBKMn1A/g5Dk1HUCy1
	xfHa+zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzxW-00000009VIL-22qx;
	Fri, 15 May 2026 21:20:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzxU-00000009VHk-17WX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89FF644508
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A68C2BCFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778880035;
	bh=pdmef4fBgIAbfqgK4jVS0fI/dYehx2orZtpEc9nD0JU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYOY24OWX6ceCGsHtAjp6Wvo1cIMp9hgQ/9aKGF7NTGTeSz+QxXtMpRfNtF+8N/1I
	 vbfJWf+yHy6VoG7E08uKcdz3YUDN4bO4jZpTE8K11oT2TYwPEvqXzBzVcZgqU+WTuI
	 ZpgOTuV8+6ulfK6z12BiiWZo0kuz3otSiPECpO/hi1xFbYnt5b5ouBQk0Dm28nYjRz
	 dG5UGYsyPjrvLcwkkmTg7QMNTks54KjV5yeUIddpFeY9cXZ8BNydEWpo997iIYOxqb
	 nrkHuKZ/qyZyrT0khwC+bxD+uW1227kxfE6N+so/vdHdjAHlFppic5OSEotpaKKGVl
	 XOqBC7HsVZuqw==
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b4298d271fso6480756d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 14:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jwOajHV1qs9aBPiFSYzoj73FCheeYqcLtoeWmMsKL3VqugNdTR0iQRJ0BGzVWv+ZECcEKmWBulN6nShyHjw5z@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ7pKCgaRZ0ThJcVzMequKYwOA5XUB7vPSJTSK9hW7QLPuyjR5
	RdxpnyBVKxwwyVvFyu3c7R0WrbGYuyNs6wtJQHuAD9gYY1c30YON8gU8qSpkasMeIqk+07hVLkh
	lu6+rdDZWw4miJxdQkEd3gcMSmwkkG44=
X-Received: by 2002:a05:6214:5c42:b0:8ca:16fd:7297 with SMTP id
 6a1803df08f44-8ca16fd752cmr63903586d6.30.1778880034532; Fri, 15 May 2026
 14:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778642120.git.jpoimboe@kernel.org> <236050080db7b2462fdb13a03ed48a8efb2415a4.1778642120.git.jpoimboe@kernel.org>
In-Reply-To: <236050080db7b2462fdb13a03ed48a8efb2415a4.1778642120.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 15 May 2026 14:20:23 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7ZrmF+5kPn=SqSvG_9hMYg90Oxp=JNZyEGXvU0KvJQbA@mail.gmail.com>
X-Gm-Features: AVHnY4L9sdxUgUXVbcL56ZDtdzvOBRji1QMIemxm16TDxuJg2SXmVG3dhNfVWn8
Message-ID: <CAPhsuW7ZrmF+5kPn=SqSvG_9hMYg90Oxp=JNZyEGXvU0KvJQbA@mail.gmail.com>
Subject: Re: [PATCH v3 16/21] objtool/klp: Filter arm64 mapping symbols in find_symbol_by_offset()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_142036_331417_D68A689E 
X-CRM114-Status: UNSURE (   8.83  )
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

On Tue, May 12, 2026 at 8:34=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> ARM64 ELF objects contain $d/$x mapping symbols (STT_NOTYPE) at offset 0
> in data/text sections.  These aren't "real" symbols so filter them from
> find_symbol_by_offset(), consistent with the existing section symbol
> filter.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

