Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAYNlgaGtbIb3faMoAC6BM9L0RPwmWJIn6sYTEEwFWM=; b=NDkOlvD/OnLgFIyx6UdvEP+9P4
	R4kN+tB2RTZe4l3jglgn/fybIDbDoOCvW/RgeToGcU3rWS721SVAEDmuCjNPsBIL9J3u0+DFm1Dk5
	CRKbqQrKAZNOV+jv0MDDZWKicD+bvdgIP6RSMvJgQMTjsknW6PWlkidMV99ghey5RYjOgUz8Q4ayj
	Fl9ReSGP7GgzkllidE+YWBpV0mQYloW30jwjDtOJS3qYmgqEfzj5eFB1oD5k1x4S0fleOaL6y7Huh
	G/kkWLbaeGtbbZ1iIW9V9xvkYw8FDOJoXkECHFMYTaGs5aeT3T2kkFht9U0fYDxRbLTREGmfAY+vB
	3b20uN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJlC-0000000EXmM-2G0i;
	Wed, 11 Dec 2024 10:16:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJk8-0000000EXTx-2lsr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:14:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa66ead88b3so698285566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733912095; x=1734516895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAYNlgaGtbIb3faMoAC6BM9L0RPwmWJIn6sYTEEwFWM=;
        b=W3lJzfJAXg+npikLPJwXPpUgBX4wVPK0hyq51OeizR4c33vVnlZVUdOwd22SlPUdbU
         hv9Q7ldTsl1HwG/R9V1hCbswIKA3Zf5kOoXxD3bMby5QM7fp8qRr6GSUNDr1VSep29YI
         TOFVVs3tnWx+pffR1BFy417GeDRyhiUN+nq4QaCxmhbtmI50a/T4ebGR6HMDKPCICyi2
         3U5DyOp2G+BiaSwnKTJ6CpY286WZVil6iW/ehzRWELehmfleNrsZzBS4Rx7xJaUsazYa
         vYFCXKgEGKQz/uKsCg28W3e7CK50M8kIJ4pRALNBoWbseA4NqLeXZZs5d/JpM8kfDsMh
         eG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912095; x=1734516895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAYNlgaGtbIb3faMoAC6BM9L0RPwmWJIn6sYTEEwFWM=;
        b=VFytml3peNnUtD8SfG1d9X1seZgea8eGWQ8s1njUPqdpTQOMjqHvaozhzkYDO2v/dT
         CiZ2xpdJBM2HvnWnb9hHqps2PpS1cGQnebCVPM2B1UW1oM+RXj3QyhnE0p58tEiMBjNL
         rlW7TzcHzGD2jBh28Mgj5k2gGDgnsxHkCLOeg4husC8pc2ThGg9282vkUvaa68bgHfdh
         GAeXT5Ist4v5qSywPbi7dAXp3LlJVQrmZdzCfrhBza3u++HIBsNw/6t+jZ0bYY1OqK/s
         zSR2lLsTOSXGonKF+qIXNUryr89pI0SgoBI2iL8ez+QUWhPVhqgtyiTEUtpEDgtTtucE
         mciA==
X-Forwarded-Encrypted: i=1; AJvYcCVmX179/NgXZ6d3o2HbjAjVF85vwwTUMkFgCCR//ZROaWE2wQQQcqjJOyB5f5fV2g8nTSjHcnvZBWlYujlP2zU9@lists.infradead.org
X-Gm-Message-State: AOJu0YxxHf8QBgg7tZyuiVcUZsqFeOMmWm82kCwDtwC13hR6k9YntZ1Y
	pvtLLjbenkJvYYFZr+VfzpFx5zT4g+NvwwoAPxmdlDhz0UI9JlBimWQlPc4dwg==
X-Gm-Gg: ASbGncste2S9fmqbxa4DSuM8xchBffXoG0OZg1ic9fSD2QRVnUYvuutqUI0wG163830
	uqpUTlmRPtnz4q8qMockNuhebHCoBxkI8smTeiV3xFGyket6g/DwSEDfREUojGxXnl+sc174oRt
	HdZPXQIaUS3JegRqyYJgx+YHeMxbd6l5awp8BXJbOqfpiVYon4eexdmVqBZJRWwqU7DiuU4BoOx
	AWVhn8OVtX3XopAaVxI/SwchysFdU/f13Lih3rNJSxYRkXaAU9pvVtyXXvK5AEgffc92BPRwiLU
	s8E2Idmy5NQv
X-Google-Smtp-Source: AGHT+IFMcTlkeGboQKqbrDdMcECPHEth8gqU16Ievc6ebB6cHKDKOmVuqDalLIEjr7JcNgbRfs9Dnw==
X-Received: by 2002:a17:907:1587:b0:aa6:6e02:e885 with SMTP id a640c23a62f3a-aa6b13b1375mr155243166b.47.1733912095003;
        Wed, 11 Dec 2024 02:14:55 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67557f0desm553688466b.144.2024.12.11.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:14:54 -0800 (PST)
Date: Wed, 11 Dec 2024 10:14:51 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
Message-ID: <Z1lmG-3KnOZrOCCa@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
 <Z1hhHRdpCZcLs046@google.com>
 <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
 <Z1liL3BtoPnSyvlh@google.com>
 <CA+EHjTw+3oAcp3ujjPmbcu42=95nw8WA=rZHYFL91ZK_Wfs_vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw+3oAcp3ujjPmbcu42=95nw8WA=rZHYFL91ZK_Wfs_vA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_021456_699255_01025869 
X-CRM114-Status: GOOD (  40.44  )
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

On Wednesday 11 Dec 2024 at 10:07:16 (+0000), Fuad Tabba wrote:
> On Wed, 11 Dec 2024 at 09:58, Quentin Perret <qperret@google.com> wrote:
> >
> > On Tuesday 10 Dec 2024 at 15:51:01 (+0000), Fuad Tabba wrote:
> > > On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
> > > > > Initially I thought the comment was related to the warning below,
> > > > > which confused me.
> > > >
> > > > It actually is about the warning below :-)
> > > >
> > > > > Now I think what you're trying to say is that we'll
> > > > > allow the share, and the (unrelated to the comment) warning is to
> > > > > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > > > > count.
> > > >
> > > > So, the only case where the host should ever attempt do use
> > > > __pkvm_host_share_guest() on a page that is already shared is for a page
> > > > already shared *with an np-guest*. The page->host_share_guest_count being
> > > > elevated is the easiest way to check that the page is indeed in that
> > > > state, hence the warning.
> > > >
> > > > If for example the host was trying to share with an np-guest a page that
> > > > is currently shared with the hypervisor, that check would fail. We can
> > > > discuss whether or not we would want to allow it, but for now there is
> > > > strictly no need for it so I went with the restrictive option. We can
> > > > relax that constraint later if need be.
> > > >
> > > > > I think what you should have here, which would work better with the
> > > > > comment, is something like:
> > > > >
> > > > >                 /* Only host to np-guest multi-sharing is tolerated */
> > > > > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > > > > +                       return -EPERM;
> > > > >
> > > > > That would even make the comment unnecessary.
> > > >
> > > > I would prefer not adding this here, handle___pkvm_host_share_guest() in
> > > > hyp-main.c already does that for us.
> > >
> > > I understand now, and I agree that an additional check isn't
> > > necessary. Could you clarify the comment though? It's the word "only"
> > > that threw me off, since to me it implied that the check was enforcing
> > > the word "only". Maybe:
> > >
> > > >                 /* Tolerate host to np-guest multi-sharing. */
> >
> > I guess 'only' is somewhat important, it is the _only_ type of
> > multi-sharing that we allow and the check enforces precisely that. The
> > WARN_ON() will be triggered for any other type of multi-sharing, so we
> > are really checking that _only_ np-guest multi-sharing goes through.
> >
> > Perhaps the confusing part is that the code as-is relies on WARN_ON()
> > being fatal for the enforcement. Would it help if I changed the 'break'
> > statement right after to 'fallthrough' so we proceed to return -EPERM?
> > In practice we won't return anything as the hypervisor will panic, but
> > I presume it is better from a logic perspective.
> 
> It would, but then we wouldn't be tolerating np-guest multisharing,
> but like you said, it's not like we're tolerating it now anyway.
> 
> I wonder if it would be better simply not to allow multisharing at all for now.

That would mean turning off MMU notifiers in the host and taking
long-term GUP pins on np-guest pages I think. Multi-sharing can be
caused by many things, KSM, the zero page ... so we we'd need to turn
all of that off (IOW, no MMU notifiers).

That's more or less the status quo in Android, but I vote for not going
down that path upstream. pKVM should ideally be transparent for np-guest
support if at all possible.

Thanks,
Quentin

