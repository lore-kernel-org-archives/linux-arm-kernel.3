Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDE103E2F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2Vb8WWsjbjLZLSdFcWe+vZrR4O/vGefxzNxxS6mHi4=; b=PgQKgmT9zJVA5CnfR9w/vVjWsS
	WhKeAFlilSTs915GPWAlWEFxw+p7/XlmHroDqdp9Zu7OsIkktgwnKIDJJqXxXIHoGaPHOfs/I8OcM
	HfbN2er7XI5iVxsJfB0DRsjxoyT0W1B7AWYSbjVtnnQZByM7uQoaLrLJZYEInIlXCoeJipJB4iusa
	ezo5P+aFFqKGpXycW6krFj8485rr+H8gZVY0QfLxzjshSCIQ/ek4ToT1NBoF32RnEsRbAnWCpsqQc
	BS69bkDeFSc8jYVzA0zgCRw7wh2vFT2Qu0HkRSF7o0omZI9RSj7qYjz3u/AhLEBSAT07u4AVK+cv6
	wMChZ41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SlP-0000000CmMv-1hPW;
	Wed, 11 Mar 2026 23:14:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SlO-0000000CmMN-2dV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A88AD60145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0A7C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270889;
	bh=L2Vb8WWsjbjLZLSdFcWe+vZrR4O/vGefxzNxxS6mHi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W8q0bowGnjemJX7uqLPgT1xLErcuBbqz/RuI4rneA5sbik4+m56tYlVnrlh/EFMOD
	 llim9Pk9OTCW+WsrgGb66XhOtC8Cz95CJXZCVgITdPDJ4dOIJli7WumygN8zBx0DWg
	 Q5Jf2L3fVMOhwDRGfwN9CKBlZ+Js0liycYogBE3TJ5NZxRy4K+zjvfk1yOea0uSNZ9
	 xfxCT+pPGKfN1v5P1txy0Sr+EAhaPChUOqq74lh9gGtRJM2Ca6QLMOifDq/aL6hZAc
	 ypN5g+X6QB7yHhRHpiwHXK23e36i+RqLaWS4IKB0Mwnk8PvdMrWXAM0l3QpvVh1/di
	 g/xEvy6xCG1sw==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509101189f1so3861231cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:14:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjxhThgEah2pTIdofk/RnHZ0YZvxuX9xZ0YLnUlAIdbJLE70Daw1SaQwXBbTZsIZRkmHkYMqmtQwYucFrwGzgW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wKNNOBhjkFcFyfVdz6Tj9iHoh+QaUSJ0J8PA9wvG8/w721yG
	7DSOi5ixhFCgO2YvHn/LPnEsfNNE0mpA+Q9iX4S8UBINSgMowpNNJ8rMVVhJEJuOS9f11l+3P82
	DhpYTwk+IZPnBRbr/aGaqFNn89fbKLms=
X-Received: by 2002:a05:622a:9cd:10b0:509:3f5d:4fb3 with SMTP id
 d75a77b69052e-5093f5d6100mr34675641cf.13.1773270888609; Wed, 11 Mar 2026
 16:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <4aaa59736860f593e18e5978ebd56e04e4deea9d.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <4aaa59736860f593e18e5978ebd56e04e4deea9d.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:14:36 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6pcHSWtz5DaVuv6rVsCvWYbKO11iTGsudnzw0Z95MYRQ@mail.gmail.com>
X-Gm-Features: AaiRm50QscE1g3DpmwkcVcm00gGImnuGoZRqYD-6Lqv8-ehUpmfzOfVXTOxYaiQ
Message-ID: <CAPhsuW6pcHSWtz5DaVuv6rVsCvWYbKO11iTGsudnzw0Z95MYRQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] objtool: Ignore jumps to the end of the function
 for non-CFG arches
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
> Sometimes Clang arm64 code jumps to the end of the function for UB.
> No need to make that an error, arm64 doesn't reverse engineer the CFG
> anyway.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

