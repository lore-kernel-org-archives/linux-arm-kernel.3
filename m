Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D3103E2F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie8XYRlriQElk+nqvTDTgTfBWDUIriQ64nsHMm3Lgg8=; b=IJTdzRxcEO5WfXVvQehCTe9vg4
	DBX5oX6Z8WdjoZjp5nj+EvEd/iNAceU1iXiXfczKUVQqU82d55PrTa6yYpmtmqYodkBv4eZTQGVop
	DtzAZ9XPiOGp4urpkgTBxmdnwDWhrDU+dc2j3rZsSKPtET4bSAox7avW5E7Ppan/+mDSPsjtNSlRe
	k6bsL/38FhgK2Zpe8HyN+nEUdWrjV27HHYnbsVp8wFSMOmbITsQZDYKMuLfUba4dNbeJnKajFrOgQ
	q0rVr8MUcDLbBi1Ulsyey0ZAYnaonRL8pbzlmX5x6FwruKKBMkFMya1OhUO9u8l1BawGx0j9ZZ4ss
	eabHpFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sjp-0000000Clmh-2hvM;
	Wed, 11 Mar 2026 23:13:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sjn-0000000CllP-1h1y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FC0E444C1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A760C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270789;
	bh=z9S5WF2FfgFwvi+OcGmF3o/5fI+CN4zoPI4lv1plycQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hDZDdcVv3vxy/CLRphubWQhqxuIHeZvpfdOKo4zNiz7qraMuiF7U89GtZyjsyfIEK
	 /onh46pvNlFAiGNiDe1nxiqscZWZCWYboXw6C3aF5kDQGadZeXPgOt+RG+Lv8UAOFu
	 rZihD1mJZnHtL4yNuoHz4pBoQ4hBVb9YSB6Vb2X+W6mQTKszQlZYl6U/0ryololMEz
	 AQCu6OUq6lwhf3d8vlkzmqasPpz0ZWod0oBP191Chq7DNr/lZ0sICjEvytTMYKbdnB
	 k28FeefNhe2HVITr8hwfgdZKkQElkUwBD+L1li4xoVoZUutCjYJSzt+Yw3WAiL61dK
	 0If7o3EiTMUVg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd81963e73so37883585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBuf2NkeqGaruUByPcihm7SXgdsHnj3YjeL63FA5BLmCcOWfiqbAPJ0vJOdVqYxyEDjS+LU4PkGx0k1kCiCmND@lists.infradead.org
X-Gm-Message-State: AOJu0YykTOvcHkHnrOwr7EUz9w7ekJ9kZeyLWDrW1Kd7KJ/mf/N278sp
	n7Z2Ffg+d4I7QB6QguSJAwIXEh5rSlVL4S9tD4NipIZ6CrsxYH9zDOwX0xdbx6FYoWTABF5xgZg
	zcq1U9S16APMgfNZqmVkAwi0Jr4hI9TQ=
X-Received: by 2002:a05:620a:4009:b0:8cd:79f2:dc3c with SMTP id
 af79cd13be357-8cda1956faamr568490185a.19.1773270788238; Wed, 11 Mar 2026
 16:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <f85416e754996eeaaf158143e43eea8a81003849.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <f85416e754996eeaaf158143e43eea8a81003849.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:12:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW67c7BZ9nxnXRVpO0_a9s4SXqZ84mq7aEA30i9-cAyAdQ@mail.gmail.com>
X-Gm-Features: AaiRm51bRfi-7rBVPnt15nYkLz8tBtB897wNTcIGViY4symm4KVh_nRMoC3NvQA
Message-ID: <CAPhsuW67c7BZ9nxnXRVpO0_a9s4SXqZ84mq7aEA30i9-cAyAdQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] arm64: Fix EFI linking with -fdata-sections
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161311_458658_33131043 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, Mar 4, 2026 at 7:31=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> When building with func-fdata-sections, the .init.bss section gets split
> up into a bunch of .init.bss.<var> sections.  Make sure they get linked
> into .init.data.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

