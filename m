Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A19C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wapsLc22ONFRxIRycJZzk7R5X/Jl+Q8VimnPKtX4Qo=; b=T/G1myyCahmQSMr2fCFd76KGGn
	s4IKTz7+EA4eizzMiY7oNlvBhPyRcygBBCJ04uYMgPqAhYG5RMpH61mKuNy1HCAa0i7hjSphcZ7HB
	fcTw2+snhEncTC/69g79zqEPXyy83hjQMCSRA/93qbeC+eq1H78wDapbz95nlTeQ1UmIBlYIElRPC
	cJWcV4C547udche0YcK08JP/+s43bnZdEp65N1yi8+TC/Z87M5THrM0oNc2jixkhJ3rN2b1zRpyJe
	O43Ni0XGwj6VcEZKSmhTlRIXyloG0ZxGrR05cRQluOY+MxcHIMDWrm46x/EB4/a3Y1Ej9Z09eb6IX
	QGXlhZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtB9n-0000000C4bD-3iLv;
	Thu, 19 Feb 2026 21:01:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtB9m-0000000C4ai-16xh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3D2044750
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 21:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E68AC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771534906;
	bh=3wapsLc22ONFRxIRycJZzk7R5X/Jl+Q8VimnPKtX4Qo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dZWfRvEQSnoKkP5BWRuq22jGRXlMys6xVa7+B0mWiAdHP1SjmtvMx/En7i5hFX0cf
	 +55AAdo6b2yCiSJfIWnBBkVHWjJVC7TNAvRBaAqIId+50eE0FJ4u6iTxuwK4gRY5Hw
	 oCsIbeag5ugzfFtNaIIDQeSBZF8dylW6Ug5sEmZf8rTNpZ3+GJDoxhS7leK/1W4ERl
	 rPZWRIerSYMfIdpkNNCXeYuF3UqYP9mKWDbJyHRSdu9YY7Pcw2Kemce72HWGNLIrOG
	 +V0JpoUQ2Mkj0G+wcDZlO06OVzvQR/GdOWq+ZkUEBGxOI4oXesmKFcATCYe+gMlBDb
	 Fs8wdbz05bL4Q==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4bc6a8021so1083788a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHI5u1JdJayVmiTuKMUZUmqTkiY38ADYBSe/nUyHRTIBUmKbxMwsJ82a7S5S2lvVyXxt4EdjbyQWNs1pQcjfV0@lists.infradead.org
X-Gm-Message-State: AOJu0YwQxspdnFm7tgzaWfwNCe6bhISeGVEFORr3aSgE6gsXCQSSKQ6q
	zv5ML8cGr+ymxHkQtBEWbw5sHcD9bbjpvf6rHLVCL3V6oPGU4U3hjaMOfaO/tBrOwwSy72FKlUb
	Ar51sct49jowwLI99zHzoUKi65Ald0cM=
X-Received: by 2002:a05:6808:168a:b0:457:a9bc:dbe5 with SMTP id
 5614622812f47-463b40dacefmr9135659b6e.42.1771534905152; Thu, 19 Feb 2026
 13:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20260209124757.554032-1-ulf.hansson@linaro.org> <CAJZ5v0iZ0YS+JTMWAzmdUihgO3C5VT6Ch0UwzftskzaUqkzQ6Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0iZ0YS+JTMWAzmdUihgO3C5VT6Ch0UwzftskzaUqkzQ6Q@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 19 Feb 2026 22:01:34 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jFFXBUGjgveU=N4feMyQkQ45_1Rto6pYiPLjSO6WbSpw@mail.gmail.com>
X-Gm-Features: AaiRm52keu7IbEej1nW5XaCwGZuZ1oSoD6sXz4wEtwNFyQp-MBbZ5FcrzKdXIH4
Message-ID: <CAJZ5v0jFFXBUGjgveU=N4feMyQkQ45_1Rto6pYiPLjSO6WbSpw@mail.gmail.com>
Subject: Re: [GIT PULL] pmdomain updates for v7.0
To: Ulf Hansson <ulf.hansson@linaro.org>, Linus <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_130154_353769_7A4767A1 
X-CRM114-Status: GOOD (  15.66  )
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

On Thu, Feb 19, 2026 at 1:17=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Mon, Feb 9, 2026 at 1:48=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > Hi Linus,
> >
> > Here's the pull-request with pmdomain updates for v7.0. Details about t=
he
> > highlights are as usual found in the signed tag.
> >
> > Please pull this in!
>
> This hasn't been merged so far AFAICS, so I'm wondering if it has
> fallen through cracks.
>
> My particular vested interest in it is that it updates the last piece
> of code preventing pm_runtime_put() from being turned into a void
> function.

In the meantime, it has been pointed out to me that this was not
merged due to a problem with the MMC pull request, also from Ulf.
Sorry for the noise.

