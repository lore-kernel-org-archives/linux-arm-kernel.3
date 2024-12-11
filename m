Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69568E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1c2ofmQLNeYYeju/JrDqhCfX9sIwSgC4rLZyCHsseg=; b=MpylaVqjLsCJvLmYym8CNP1FRi
	nBAzUu2ybrcwgqSIqr7Sl2wJTrcOsNv/V3HDAA6oW7ZHq9xUkPzEmsNkFPUmeey5zGjO84rAhVUZS
	BB+8jt0Rez3CB814sdalVC2H0fnpzAlSjCIpGIjGjFSkHq/mcNVWOoAR0qGadWsYNHp9PW0vn/od5
	/y3rDp01q3jIUkD+QVMXd3v6lPF6aZeL7Pfw+zzoHxNRvYbiOI3wyvQSGR8ZENL0HMCnXMjnGOyQr
	bYaA//u6mGIltaRtuzIZ/iO0BjlhiQFrxtQBHIGo8S4PmPDgMeHSHioNSFpcIGj/agUvEXLCkgY04
	LY6pXgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJeP-0000000EWqh-1uBO;
	Wed, 11 Dec 2024 10:09:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJdK-0000000EWiW-2l6O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:07:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso28425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733911673; x=1734516473; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x1c2ofmQLNeYYeju/JrDqhCfX9sIwSgC4rLZyCHsseg=;
        b=yR/PZ8hNyMqQ9aCmtmHG6ewUSYgAPJTQ2/t7lYmnFYTAmuWd5FUjX4c6FfasliJJzc
         caMciBeqkdRgrqhVRPNhOi7kx4GLVMnuAHueiCinc+NmVxeD02whQm9vp3YfjGYtmSJY
         t/b5NnzOXhhflQXJe2vqjNqzoD58ljLrUlRLybjX+49QUe4Udk2RvAji14mBvAw1IhGt
         wcekORUAqe4Jh6/BI09rX9B1vF8v/wH7ljVjhGOyWqE4esd9q3nquoCSEgc+R4CWzFCx
         uujzpgnOFaWQ7wgGe6o7k0tOuj9GgN6GLupzpDN7LdHetgGg7KmDE+eaWMqN21Lc6wsy
         DGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911673; x=1734516473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1c2ofmQLNeYYeju/JrDqhCfX9sIwSgC4rLZyCHsseg=;
        b=HNGfxQmIup5IHOPVQlP8BClfJyTTWILoh2Dl7MhpBy4v++AqC4nKM6B6RhSo8indW7
         yeq2lfR8scAC/PNReCBtjqTlfFCO3PNvG0Cxv0cXle9tEKxzbGDQsZLOc/9a4zEUzpjH
         Y698Fz0ABH8cp/vKcUI4MuIc00MydqFp4Ac9iqLsNYLO2cDi2SIeL6Tif8iI4vQ0ASxY
         sPDt4E/A71G4KOxwpp0dc64u65SCQG+pTKPWAvUM8syv1jjE1UNz+IpnfS/h1TQH1AdZ
         olQvTV+9NBbcGGg7R8WUjZmPULRCoQeZrLwhDb+dFaXF5NFCufixEth3BAXJb5qvBwwn
         7PAg==
X-Forwarded-Encrypted: i=1; AJvYcCUFYaUdv0I+lDsZ8bqWP4DSOWG8pshqfQohVsiix3Q42HLeLUhakGBlMLqlr7Gpo14rUSGVbC4ek8IWDDkCxKLN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvk9jxUCOmqG663/SFRNb/iHnOzA4Ofrph7RkD3ygS2NOeW9HD
	Arn0ueUzJdvy3rzBgnu5slbzanYjTZTrxFuU/D0aDEPN4D4RB68EOS5rJfTwWsyGPfeYHPX18Yi
	ggO75UsAhjZG91cmjSQwmawJDoaEPQ7IbEaUq
X-Gm-Gg: ASbGnctGtEdw0rNC/A4Fc1og/jYtVB6MRtHMkYTmcPSDfMUtw+3OUJXA/FfQHPhcwS+
	M6VlcIu/fZHLtCa5J5LarXGQwHZdne5vW+kdjxjJQipbP5eMoRhcsNF3PZCCTdb4x
X-Google-Smtp-Source: AGHT+IGEK/kmaBbvJg7dQQuM7x7JBMiV8OyKxexKpfiXpXx2u22fSrw6Y0U2iME6zU8KhU7EMyWrc0PbCi5O2GMxpU4=
X-Received: by 2002:a05:600c:2105:b0:434:9fac:3408 with SMTP id
 5b1f17b1804b1-4361c0f4f80mr1026945e9.2.1733911672546; Wed, 11 Dec 2024
 02:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
 <Z1hhHRdpCZcLs046@google.com> <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
 <Z1liL3BtoPnSyvlh@google.com>
In-Reply-To: <Z1liL3BtoPnSyvlh@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 10:07:16 +0000
Message-ID: <CA+EHjTw+3oAcp3ujjPmbcu42=95nw8WA=rZHYFL91ZK_Wfs_vA@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_020754_695214_99BF341D 
X-CRM114-Status: GOOD (  34.74  )
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

On Wed, 11 Dec 2024 at 09:58, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 10 Dec 2024 at 15:51:01 (+0000), Fuad Tabba wrote:
> > On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
> > > > Initially I thought the comment was related to the warning below,
> > > > which confused me.
> > >
> > > It actually is about the warning below :-)
> > >
> > > > Now I think what you're trying to say is that we'll
> > > > allow the share, and the (unrelated to the comment) warning is to
> > > > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > > > count.
> > >
> > > So, the only case where the host should ever attempt do use
> > > __pkvm_host_share_guest() on a page that is already shared is for a page
> > > already shared *with an np-guest*. The page->host_share_guest_count being
> > > elevated is the easiest way to check that the page is indeed in that
> > > state, hence the warning.
> > >
> > > If for example the host was trying to share with an np-guest a page that
> > > is currently shared with the hypervisor, that check would fail. We can
> > > discuss whether or not we would want to allow it, but for now there is
> > > strictly no need for it so I went with the restrictive option. We can
> > > relax that constraint later if need be.
> > >
> > > > I think what you should have here, which would work better with the
> > > > comment, is something like:
> > > >
> > > >                 /* Only host to np-guest multi-sharing is tolerated */
> > > > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > > > +                       return -EPERM;
> > > >
> > > > That would even make the comment unnecessary.
> > >
> > > I would prefer not adding this here, handle___pkvm_host_share_guest() in
> > > hyp-main.c already does that for us.
> >
> > I understand now, and I agree that an additional check isn't
> > necessary. Could you clarify the comment though? It's the word "only"
> > that threw me off, since to me it implied that the check was enforcing
> > the word "only". Maybe:
> >
> > >                 /* Tolerate host to np-guest multi-sharing. */
>
> I guess 'only' is somewhat important, it is the _only_ type of
> multi-sharing that we allow and the check enforces precisely that. The
> WARN_ON() will be triggered for any other type of multi-sharing, so we
> are really checking that _only_ np-guest multi-sharing goes through.
>
> Perhaps the confusing part is that the code as-is relies on WARN_ON()
> being fatal for the enforcement. Would it help if I changed the 'break'
> statement right after to 'fallthrough' so we proceed to return -EPERM?
> In practice we won't return anything as the hypervisor will panic, but
> I presume it is better from a logic perspective.

It would, but then we wouldn't be tolerating np-guest multisharing,
but like you said, it's not like we're tolerating it now anyway.

I wonder if it would be better simply not to allow multisharing at all for now.

Cheers,
/fuad


> Cheers,
> Quentin

