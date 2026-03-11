Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18486103E2F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw77Fu9uCW7WzjUGO0gC0Hm/lU4b37N+pnvJ53xAacY=; b=ciRqTPgEhpxZYJ9N5Pp4ejLuGT
	8ijsjc+QTJb4NYrFNPUk2wrs8ysXdHU35GscZ/E7qJhlhk9DAkzrI7UzgT+xHj5t5GtR0xlpauXl+
	Loar/0r+WXKyzbAKutk377dwpmV4PeHUFJaVqHPc551+oirjo1BpM8LkGmSlCb2ONAlolwXD8FHe1
	cF0xWPvoePdEH9kejh6VY1mRgzl4nWgFFQIjhPKskq/FYOEDsFQi02PBAJqVq8kiZH10FCRBNtHsY
	Q+v1KUuMsDf0R6PBGsiPFjXMQx8dvpsjA+9TzpcDJrGyggZsb/JbGc/oqK+NFrXx2EIlp706yU2Cl
	CHATbdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SkL-0000000ClyP-44An;
	Wed, 11 Mar 2026 23:13:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SkK-0000000ClxZ-12eE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD4E8404F4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCC6C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270823;
	bh=+fnd8GyqNif8heEveaiUaU5hVAJSMaWTWNUQxsBz62E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aNd3/ivzSpKsXILkEa6pWkM9T+0ceORI8IsbXSsjpjnU7YGIzeXaBUyw7vP1GVGBP
	 a9Yiynl9793uKXoFNGHbJWMDXpE8X0Fa7bUakWm0FpaanPmDjs3+Ole7tHrhBdxcuQ
	 NNtd0zRO/xhNsjcXYaO3Bp262jt+GBkQ2hGQ6a3CKDqwIq8onKaLfEWdSSQ1Nk/+Ix
	 Rvg+UgshtP/CDNnwbY7KW1Zei/DjmFo/pnc68MNBG4ME/HOkQL2sG2x+qu7mcmdDbd
	 4aFcUCH46+7k0ZeX8E/v6swA1332LaFxxePjkInLfV+/nQYs/EGNnY7oV8UlhGgD3I
	 uoCsq5b8CRCMA==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899ed41208fso7121466d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/Zdo+adzPJK9Fn2x5lL++exFGMTYdZQC+D3g07ecxZ1uIUV+qrX3MLEQay50eH/m7ACCAdn/1v7sXNrujbxU8@lists.infradead.org
X-Gm-Message-State: AOJu0YxmWInMKbPm+W/3+Rqhcofkz92H97S/3ZR4/8ov5kBfSoq81m3A
	LZ8P5Ahs0h3GOhrAwbcubyZcnlwnAyJpjdxhN5bAcJND08Cf07jrfrBetO1KE6FNMzS+qN3cocO
	0qTpNorCRpabcBBpnPGSSiBGq9ecRinM=
X-Received: by 2002:a05:6214:2483:b0:894:6b9e:253e with SMTP id
 6a1803df08f44-89a66b60bf3mr61486446d6.52.1773270822999; Wed, 11 Mar 2026
 16:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <696aeb326a797e97b87c7657b5b3d0ada958cc5f.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <696aeb326a797e97b87c7657b5b3d0ada958cc5f.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:13:31 -0700
X-Gmail-Original-Message-ID: <CAPhsuW52kX13KuQqHuq9CReksaV=GTMPoSB3PU8ZOfU-Quo88g@mail.gmail.com>
X-Gm-Features: AaiRm508Or0sfnUqrHy7DAM78r2-dTNuvOfnqws0FNtwIKi1zmJ50NKIsPn7YHc
Message-ID: <CAPhsuW52kX13KuQqHuq9CReksaV=GTMPoSB3PU8ZOfU-Quo88g@mail.gmail.com>
Subject: Re: [PATCH 08/14] objtool: Allow setting --mnop without --mcount
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
X-CRM114-CacheID: sfid-20260311_161344_314337_7EB77DBC 
X-CRM114-Status: UNSURE (   8.53  )
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
> Instead of returning an error for --mnop without --mcount, just silently
> ignore it.  This will help simplify kbuild's handling of objtool args.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

