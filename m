Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAEFC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KjbeBkX0TUviFp654wJl78xlNao9GXDXJZEcc3NUTk=; b=gdBIk1G7i9gp0YMFsGUtM0GJcm
	yM7ldcNHNk0n21Czyx/OwW2yO5IwDd1kiVKo8ryQq8n5e2KkoiqY7BdXQbN0caqsjWllpAcnb4IEl
	Us6A6wwpYpFq8Nc5Nu+kgvnJA0Yl5mM0vSzTW/3QziXSczs8i2H0MOTMkG/egn5H0kfUwRG6xMh51
	HzoiZ6c4ku9vhDlC+wjg+/iu/Id2GqXfnjR2INpFInaBx+8R70h6SToJzW+Ls/82u67m7l+qeL7NT
	y7ZFOXKtpAkxMzExFQNHJyAPl5zoRoEyO0kOoN626eSgxIj/5x1HJPfUMCd66iODfujvCNT99BeQ8
	eS2aIRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txidc-0000000ASdw-468F;
	Thu, 27 Mar 2025 08:30:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txibp-0000000ASK3-0u8N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73F055C679A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 08:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29332C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743064144;
	bh=/KjbeBkX0TUviFp654wJl78xlNao9GXDXJZEcc3NUTk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rwog2qQjARFqB191XG5XnEPAhbZjGosUXmz76mUkNJYsCN8qTXy4M+slR2Z7Gn9sF
	 S04skBrh1C3X/+v0Xei69RUHKZOPXYguZRYzf9ibV9RVF1F35wjuBEmVSnd8xAvg1T
	 bs1z3hUKg12hJAjcTjfOnkCkEtvgPvgHz7548qgga4mGNHUvjT1LzALqPr4V6/8443
	 UIp21EQblZ5yUuIQDRA7tgzW4HJfs7TB99flTPeG/dNSwfTo8I9BHvNrE/0/7Zg4Ij
	 YynuIcEnwiHdTh+JTAOi2vGxpmfXmoGLoBJLhlEs9NqysdSZknDWPVYl2AlSPBB+ZV
	 /fwg9/PqhQFgw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54993c68ba0so723881e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg3L6/X2maKx8Os5CUP5Asj0q0u9GPVMP3uLoicl+dIuqrUb9neAOJmajbCWxzy5XmAUrRMw0lf0b0fKnziyAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeu+kbyWIOfvE0xcbPIBBdXaeovQ1yzAiyOckP+QB5NGI7CDnp
	vYjdBn1D40WPKyCqGyIHrmlI4LyOMvO73zLI8b9hJlxzP+A40XYS+Ary2/x3ZEbzla29k51pczI
	cE6HWLCRbj+Rg/KispWJsIbTKCyo=
X-Google-Smtp-Source: AGHT+IEEGieGBG8VFA8rb+y0tpCAmH/6HNPAEzzY/KEP4vlPOJPWtbUXUOj6CLdTYNNWvePwtsUVJkNrLekrEIj/18k=
X-Received: by 2002:a05:6512:2354:b0:549:91ab:54cd with SMTP id
 2adb3069b0e04-54b011ce529mr996187e87.4.1743064142537; Thu, 27 Mar 2025
 01:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250326200918.125743-1-ebiggers@kernel.org> <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
In-Reply-To: <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Mar 2025 09:28:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq-0MlPxa7VBpHCtJoChVZeqv4ZnDpsM8XlJmsmdinC5Ej7iKCpZ3JGon8
Message-ID: <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in crc_t10dif_arch()
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_012905_306560_9A6B0CD9 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, 27 Mar 2025 at 09:15, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 26 Mar 2025 at 21:09, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Fix a silly bug where an array was used outside of its scope.
> >
>
> Yeah - mea culpa.
>

Ehmm - tua culpa, actually :-)

