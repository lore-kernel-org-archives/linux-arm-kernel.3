Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C474CFEDA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDtCe3LceEcTvZgVRnSV+Ai0+k6YQhIrsW+ZS7xIqgg=; b=4r3W9ArliwT/+i3NYw9PEh/yTK
	WQFx7Y7BO/YOeC7VJerdQrgWj94BjUvM/lU3Yj8cs133RUOESR+1mZQhCj9JyMkaGjEP+F9qZ8n8d
	kP78yYbCXTFCN3tJoo00nOEdYqIxdBkIm9srOQ4XHhBjeqDPHKg8LX5guR2UKiLJUl3q64dVVui3H
	PXWMyVn3hwVC16YpPskBatRR65W/U5PLFMUyPSPhQvv0iUPRnfPwJP39wqsXlg7trOB/hXkNGI4U7
	OazBrpjtJ1jWppODnFAnozlVwAZLdJEu/lRpQpNkwS/dxBVJkXjjcsXD64h0Jk4j7sZVf7FpGxGLu
	QNiUQfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Zcj-000000075rv-0bdd;
	Tue, 17 Mar 2026 18:58:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Zch-000000075rp-0Z4D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A5B660018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 18:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20D6C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773773913;
	bh=0MWUHSAwpDtTZhkoB0VGBEBQP7iB0D0FC4PVbwLZma4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hTWxHE6r669cdqqPr/P8Rx9IKoqnMICPCwP4q6DypB0vIxI6KblJmuncDJTkiuB/t
	 R3cK5boMjOTqq6SCAunmJ3meYGLIeJAmCAv5uYXl+eadjoLWEy4kQd2UxWuegMUFE5
	 QKPFaViZQqCHg0JluGBhdSDxqWkefi2uZqq5OeQkQvG4KTdS2g62TwUDIkGk+fe8SA
	 t/Eg96egMdmwn1hfOsAhfgNs+pwp3i6BetrpmIBfFJDkH8CxBcPO3LQofQUkUnCxXy
	 w69BIW24l0GqcE/Q5PnyBW875Juy9+ET+KEVW+kz2aAeqfwi1iqvDvfC9cqcTfxGZi
	 KYNDrLb5IOyXQ==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a05955720so73399826d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2BEKJ7WSc1ROB6J0ycOnKS9Ul9sqdromTbV+ZNn6YrUHZdDr1nfPCNv+1JLrRVvqzWEHSeaWM4m/dloDDOoQx@lists.infradead.org
X-Gm-Message-State: AOJu0YzyRqa3nU4Y5IlBYGAfSijPGNYfCk3AGgS8YPUMjRwCCYoKCX8u
	+1QLkLKf9t12boqjCaDuStIFiEE2YwCHJvkgfy/hIy0tBPxt4Hk7t5WxCF+WLPqRUbvcwR8vnK4
	9kKWbD9JGkoltEcZefraRXRtz6ESBKz8=
X-Received: by 2002:a05:6214:248a:b0:89c:4c6b:4615 with SMTP id
 6a1803df08f44-89c6b4eab88mr10421846d6.8.1773773912991; Tue, 17 Mar 2026
 11:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
 <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
 <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql>
 <e2yxamlxwif5kxur7thr4x7yp7ppbde6awzm6vomdfkg6auxeq@aaahh3aclf2e>
 <CAPhsuW6SsDTDCJ8-w9OP3FeS2d0Rj6jgP7gYbzD3pZhAmK5nAg@mail.gmail.com> <74fwwcyggggcnh7pj2i7nhglhagltkqeth4ykhtqs4izx4dtig@lzyai66d2vn6>
In-Reply-To: <74fwwcyggggcnh7pj2i7nhglhagltkqeth4ykhtqs4izx4dtig@lzyai66d2vn6>
From: Song Liu <song@kernel.org>
Date: Tue, 17 Mar 2026 11:58:20 -0700
X-Gmail-Original-Message-ID: <CAPhsuW72qYhR0xNfsx8jhrA+P4EmZrB3j+ezG=JOkfKh0vmopw@mail.gmail.com>
X-Gm-Features: AaiRm52jPD_LPP04lC-wsy0kauFeBENhLM0ZkkRmw5VscAMPgFc8WtFAeLbaxic
Message-ID: <CAPhsuW72qYhR0xNfsx8jhrA+P4EmZrB3j+ezG=JOkfKh0vmopw@mail.gmail.com>
Subject: Re: [PATCH 14/14] klp-build: Support cross-compilation
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

On Tue, Mar 17, 2026 at 11:53=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
[...]
> >
> > Do we need ARCH when CROSS_COMPILE is set? I was
> > under the impression that CROSS_COMPILE doesn't require
> > ARCH.
>
> If CROSS_COMPILE is used without ARCH, it will just try to use the host
> arch.  I'm not sure if that's considered cross-compiling?   I suppose it
> should use the CROSS_COMPILE version of objcopy in that case?  Though in
> practice it probably doesn't matter.
>
> I guess the original version of the function is probably fine and we
> don't need to complicate matters.

Agreed that the original version works fine. Thanks for bearing with my
nitpick on this.

Song

