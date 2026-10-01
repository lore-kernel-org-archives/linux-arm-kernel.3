Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5173BCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqK3hC9Nnu6tS6Qq7DR0DTc8nfHUCBenUfxDCC5HWfY=; b=hLhc2kjQJ3wRuk
	I9HhPAWj8XO8NJvehbcbV5Ce1Y6+VRkSpGHs9E2Vv9bJDjZSnChFRUKqUp2t/NFLmmPnXJcbMx06U
	VSKOXXdSXGCd8JiR2wK8V8aLVvbY9Wr7K+l3MT0MQP35h/2Jju96xxvAJMr00KTC8JlCh6MknyIMZ
	ET6fUlFSoprIpBALIoT/GuzkK5kQ6Oc3eSbtzhq7QH80FcrpxkSdj791U44N1I7vpeXJk5aSEhhbv
	M5W8oYQnNKRx1MEXnXT04CnGPNC/qpH7uqn1dJH3LmgNaRJuOIe8OIuTYHIBNjRtqaaxArOpg/irl
	LIdplkxqvmV/PkG3YK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOBl-0000000AFpY-0Jtb;
	Thu, 01 Oct 2026 21:19:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOBk-0000000AFpG-1u2Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:19:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCC5840659
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B8B1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889575;
	bh=zqK3hC9Nnu6tS6Qq7DR0DTc8nfHUCBenUfxDCC5HWfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nVALaAZkKoxjGuYBs7z2CLBKhcv2QN0Vh0IW4RiryfD+Xh+nqacUQUSke4pfbDws2
	 Zw9Zk3nGzgfoXXVVbtB5Bj0dhOWflrOIgR3eMM7M5nuj2H2QX+G1fUXjVP00ZrQGyJ
	 NZVMn+AkjYZVquE25YNwfUoNp+y6fRVRVPkYIaDr7dNjmSbXsclK5UcmKJvTJtn+ZH
	 Yml95f2QsRAQJSinv+/6V+H1HLmdDsI/qW0JFuEDfz4qEnPPhj2XRwO42B4bC3062C
	 gY8kayGE4toBSq9ei5cOGKue28hUnCrBnZSnqyV936KO1dfsD94kBdtDDY8ACGkIEl
	 c4X8bXKmEPP1g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba43157c71so1610882e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4SuVIGkNwYFK0W2dop/EMxZpyb3G+mzvJ1g5GceoY1+JZhGXyx7Egbs7UVDw7rXrK8uqyzUY8j8W5CMICPugS@lists.infradead.org
X-Gm-Message-State: AFq9FYIi4fO8AVX0CYH6OCwDAhUEJlTFpmDSFGxSPzB0vXS00QlZu01Z
	3EVuK6Jy5KYOh/zpfOS6xuFPM5Zsi094v1VEoDl2yA1gUnt0ScBobof1HtF1XShz6fsleOuqIxK
	MHsKv5idY47IdlsFrfWTyzK3n5oOV05E=
X-Received: by 2002:a05:6512:36c2:b0:5b7:66e6:f5c2 with SMTP id
 2adb3069b0e04-5bb9bb20e7amr107379e87.31.1790889574520; Thu, 01 Oct 2026
 14:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
 <ar4KD6FTZzw2Wq6w@willie-the-truck> <15549877-85ad-49ad-b2f2-843dd506ba0a@arm.com>
In-Reply-To: <15549877-85ad-49ad-b2f2-843dd506ba0a@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:19:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLn7Hc3w5VitqfvVrA96kaDnOYgWKm6NfuKbjAPshcR5mA@mail.gmail.com>
X-Gm-Features: AclHuK93OXySQf9irZkdeoUGXwWmC2nbBaDFJmy0pSBCfDth3OhTplJf0dnY0fs
Message-ID: <CAD++jLn7Hc3w5VitqfvVrA96kaDnOYgWKm6NfuKbjAPshcR5mA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
To: Muhammad Usama Anjum <usama.anjum@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 1, 2026 at 11:01=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@arm.com> wrote:
> On 01/10/2026 8:21 am, Will Deacon wrote:
> > On Wed, Sep 30, 2026 at 11:42:51PM +0200, Linus Walleij wrote:

> >> Hopefully Usama can test just that part and see if it has a lesser
> >> performance impact as well.
> >
> > I'd like to see those numbers at various points during the series, tbh,
> > so we can rule out any stack-protector changes etc.
>
> Sure, I can trigger runs on different points if you can mention which wou=
ld be
> more valuable.

I would say comparison after applying 1 thru
- patch 12
- patch 14
- patch 18 and
- all patches

would be interesting to see. Will do you agree?

Yours,
Linus Walleij

