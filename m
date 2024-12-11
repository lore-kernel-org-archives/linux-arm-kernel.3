Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B86E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xejb4B30VvRcDJwNO3f4C7XdZV+B2J5itS09MkCZKps=; b=S3axLc0oBnqvXt/vPhoYfLUeb5
	QddmngBTTEWW397Gc2FKdKOse7J2THzaWfWOgyh14czXSp1PI/ilxHudJb7WqQE3/oHOGIg4qJL7/
	Wz4EHybX3rX/YPi1MVdoBFNFbhgJJXlicam3uuCNL7xp3Un6iCVZCUhT3wGGhhy+6bsmzmuxuk9Zy
	HRbD78/asgK+DTzmPtk8QpOGESuntPPKOac58c3E33ocxZW3gbynWaI/ffFSkn+sgzJcYtmFBILzG
	KlwwNU7D0abqjkrUMnOUJRTV1GnqfWOsldNtYbM2OJ+Vppcj3HCWGQf6jSf1zxMW14w7NNT7WJCAT
	DU/VgYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLK3C-0000000Eatg-1hyj;
	Wed, 11 Dec 2024 10:34:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLK28-0000000Eak7-3EpC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:33:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so29285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733913211; x=1734518011; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xejb4B30VvRcDJwNO3f4C7XdZV+B2J5itS09MkCZKps=;
        b=JDiiJSreihKerpbfw9c2TjgoT1z/xyteaahYtPgNzH8iFArPgNYPw+XhrkcBkQBHSj
         rnn/J9OlGoP31sNu1lzoFJQrsJkVncWKIdLVLiJwOHiIswqzvz9mxNFEo2UPZ26DeewQ
         lEh6jzUecZRNKqGCbAWtnae/e7aBxk5bDwv3J/Xe6Gj0ZqUyJlx7Jdva5zV/emlOQMoh
         WXbNB+/t/FvEB1c2m88qCHBBLzbnps/YrqZyb1mq6sCQejkwZcXa6meaXExHOFIe+M5M
         BjR6wUsMLSFYjL7vH1KhIcQN5HkhgPUnPIbgjS3dDKkjqMDUeFZsYTvkFCJ0r4UVmEgq
         GnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733913211; x=1734518011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xejb4B30VvRcDJwNO3f4C7XdZV+B2J5itS09MkCZKps=;
        b=A4K3MZDMlhJn2SWgc4gAWiCTog/Rd+ar0HLXay/d5Bih9184mARLexdV7vOu55ITAy
         JugCTHXBR0HBbglKZUNXMh+IWdcg4hP0CH3xGrmm/vANnZPjsu/EB8BybesMrI9uYQ14
         QYD4CAYeTkv1iA2eK0CTdzG+JE5oKR66BUG7isPl3yD0cor7U9EUBqFwhvmSORFGsbmQ
         34fbudKQRqpqDDDmdfzDTOpTLR8P8z/M5UHZNWrGzHlsCyykcIYnpFCka7FqSSYdIhzi
         HpTp5iW/s5XSs7e9HewGv5IFO+muNP3FBE+0zVU7I97gkZxlA6WpGzekjVRSp44sbccN
         fZKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqhU6UMu8RNkEROqZ5LHrUKFqhNopOyItfsQuZpn8o6h2dFYSIGqFzfMRu65gW5EMDGwfIJhO+hObrjPf1Vosc@lists.infradead.org
X-Gm-Message-State: AOJu0YxKkeH0DCYmf9lv88T27BzUzlEFiA/HEs8YsFlf7ZJ3GrqPEH7P
	qKRsjX+K2fAmrVnSptAWzxz0eiyLA2vWdOslYKM4HMXwdQ7nxgst90+MXWAaHAlxgStnh7abkEr
	h74vZXUUrXU9jZ1xqurAqr5XLTFc2GHzgeYpM
X-Gm-Gg: ASbGncvHV0znrrcK797Pc/2V63sEN+SGOH1nFuByW7KxcGrq1WZgX643Z5JiCNsZMNs
	oVXAGXGZEaRuonDRHlQN0oVgkB+jcXDMj0eZkDN7iQraXcY/LdBnzQHXGuWUiBOZP
X-Google-Smtp-Source: AGHT+IEPQlrax4O3EDsziNcytBk/dvrQmghx9+yaCRsduLcL2uYnUAAv4LiQBh3FRM86KVDBUO7qSFBLmZPR9owFjyU=
X-Received: by 2002:a05:600c:490a:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-4361c0e320bmr1012235e9.2.1733913211090; Wed, 11 Dec 2024
 02:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
 <Z1hhHRdpCZcLs046@google.com> <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
 <Z1liL3BtoPnSyvlh@google.com> <CA+EHjTw+3oAcp3ujjPmbcu42=95nw8WA=rZHYFL91ZK_Wfs_vA@mail.gmail.com>
 <Z1lmG-3KnOZrOCCa@google.com> <Z1lnwZPrx9GzgFCG@google.com>
In-Reply-To: <Z1lnwZPrx9GzgFCG@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 10:32:54 +0000
Message-ID: <CA+EHjTzrL9v3DBGRht_-JPpfpd0eW1xYAMcbeNA83B1K64oPgg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241211_023332_808153_D656E043 
X-CRM114-Status: GOOD (  45.34  )
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

On Wed, 11 Dec 2024 at 10:21, Quentin Perret <qperret@google.com> wrote:
>
> On Wednesday 11 Dec 2024 at 10:14:51 (+0000), Quentin Perret wrote:
> > On Wednesday 11 Dec 2024 at 10:07:16 (+0000), Fuad Tabba wrote:
> > > On Wed, 11 Dec 2024 at 09:58, Quentin Perret <qperret@google.com> wrote:
> > > >
> > > > On Tuesday 10 Dec 2024 at 15:51:01 (+0000), Fuad Tabba wrote:
> > > > > On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
> > > > > > > Initially I thought the comment was related to the warning below,
> > > > > > > which confused me.
> > > > > >
> > > > > > It actually is about the warning below :-)
> > > > > >
> > > > > > > Now I think what you're trying to say is that we'll
> > > > > > > allow the share, and the (unrelated to the comment) warning is to
> > > > > > > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > > > > > > count.
> > > > > >
> > > > > > So, the only case where the host should ever attempt do use
> > > > > > __pkvm_host_share_guest() on a page that is already shared is for a page
> > > > > > already shared *with an np-guest*. The page->host_share_guest_count being
> > > > > > elevated is the easiest way to check that the page is indeed in that
> > > > > > state, hence the warning.
> > > > > >
> > > > > > If for example the host was trying to share with an np-guest a page that
> > > > > > is currently shared with the hypervisor, that check would fail. We can
> > > > > > discuss whether or not we would want to allow it, but for now there is
> > > > > > strictly no need for it so I went with the restrictive option. We can
> > > > > > relax that constraint later if need be.
> > > > > >
> > > > > > > I think what you should have here, which would work better with the
> > > > > > > comment, is something like:
> > > > > > >
> > > > > > >                 /* Only host to np-guest multi-sharing is tolerated */
> > > > > > > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > > > > > > +                       return -EPERM;
> > > > > > >
> > > > > > > That would even make the comment unnecessary.
> > > > > >
> > > > > > I would prefer not adding this here, handle___pkvm_host_share_guest() in
> > > > > > hyp-main.c already does that for us.
> > > > >
> > > > > I understand now, and I agree that an additional check isn't
> > > > > necessary. Could you clarify the comment though? It's the word "only"
> > > > > that threw me off, since to me it implied that the check was enforcing
> > > > > the word "only". Maybe:
> > > > >
> > > > > >                 /* Tolerate host to np-guest multi-sharing. */
> > > >
> > > > I guess 'only' is somewhat important, it is the _only_ type of
> > > > multi-sharing that we allow and the check enforces precisely that. The
> > > > WARN_ON() will be triggered for any other type of multi-sharing, so we
> > > > are really checking that _only_ np-guest multi-sharing goes through.
> > > >
> > > > Perhaps the confusing part is that the code as-is relies on WARN_ON()
> > > > being fatal for the enforcement. Would it help if I changed the 'break'
> > > > statement right after to 'fallthrough' so we proceed to return -EPERM?
> > > > In practice we won't return anything as the hypervisor will panic, but
> > > > I presume it is better from a logic perspective.
> > >
> > > It would, but then we wouldn't be tolerating np-guest multisharing,
> > > but like you said, it's not like we're tolerating it now anyway.
> > >
> > > I wonder if it would be better simply not to allow multisharing at all for now.
> >
> > That would mean turning off MMU notifiers in the host and taking
> > long-term GUP pins on np-guest pages I think. Multi-sharing can be
> > caused by many things, KSM, the zero page ... so we we'd need to turn
> > all of that off (IOW, no MMU notifiers).
> >
> > That's more or less the status quo in Android, but I vote for not going
> > down that path upstream. pKVM should ideally be transparent for np-guest
> > support if at all possible.
>
> And to clarify my suggestion above, we should fallthrough IFF
> host_share_guest_count is 0, but break otherwise to retain multi-sharing
> support. So it's not a simple s/break/fallthrough change, that needs a
> tiny bit of added logic.

I think this would make things clearer. Thanks.

/fuad

