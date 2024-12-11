Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA124E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoxTFED1OV6IIvC50S+pNWi2oVo0JYbWqlKUFL/WbNs=; b=RoTTXqS1u4FlZ4/4knz1KKx3QP
	oxhVmP8P8EEWe2+Gs+95bImy6nNOpKMofQit9eGWKGXecSLPSL69MUUaVECdSFfIHk3J7ephO50ux
	KHg2/ddUTFW/e/VAi52S+5oPXTBj8cD1dCsz1bFfTGYud9dy7ozLaKANamkcFZ0z7WQrwmWaMauEx
	B3AVOwiAA1hoyehyWPOupnrj9cJrHrRVSbPSt9IhYDo07Jxmfd6TPGAGZ2ZlTcAFKx0STSMfZPErI
	Wk9By35nnoOqIvUF0yV94+p1QSyOFXMjnYpf0J9Hcp+U4/lKi23PYiGHUU4W5I3lBiWqDoI20VGUg
	JFKwPKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJV0-0000000EVYX-3kdm;
	Wed, 11 Dec 2024 09:59:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJTx-0000000EVRB-0miQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:58:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a68480164so953193666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 01:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733911091; x=1734515891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoxTFED1OV6IIvC50S+pNWi2oVo0JYbWqlKUFL/WbNs=;
        b=bDFX/xx/AJ1+Ap15fi/MSwuFixxodgUkiGZNqt3ssCIcRFodhWnQRD7ErvDAkYnL4b
         RCcO7FFMs43RCnsqbD9EZWzsUBNNju4Cj5o2+K/LpqMFxs3O/k2EtdScugT82I6c+UF/
         6gs6dmUtz3eIR6nyTDL7TcLt+GsdjNt+PNEZBrQuEdFPPOGvmI2/nb9saaD4iX1919g+
         YfdEo0T+Ju5p6cEKVR4oMRurD1KOGNOe5LlteuD8RUBfSNjQ/YaLa9tlssQeBL/qWflC
         Guir/TVE0dIWrxRM9qsa3jmZzRu/uFCzDVJ/k2hz3XblO+CJeRTo4tG8F2XAGsThtDID
         FMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911091; x=1734515891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoxTFED1OV6IIvC50S+pNWi2oVo0JYbWqlKUFL/WbNs=;
        b=Xf3greKU/AZPPG6k8OK/AU2pKbZzPaVr2MjUI5VHkiUxq4T75/xNBE+crnzoR6t7NU
         gGGYwkTHHCsscyUvLfMxk1kZ1B86k0C2UTE5bIbvOdb7spqg0KcNh8YYP1A6Nwke/9SA
         B5U7lfktXlKmaL+bZU7UXwoqL2caCQqXvWNJnzxiwbDVpGx7hXclQZwn4obT9TzXJxCX
         2SnXmmH322+mIoHTTKQnTc06ZzYKpoAi+zyFmE8B9CxEhyt61TIyvAXDjomWwPP37hc9
         rKf8mu1HMlpBSmQlUU9z+IUhG237UpBm4m5cJ9ASad99Z0CslI7hrnP0N5KE2pDG/pyO
         K8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUngEsNyc9Hc0YZ6zlzLZ6QN/13bFS2lMH/bb9BApEYnc5uVj/aVBe88ABAyv6PxfCbymBiHxLwPILr8kQiJFBi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0OFQP6GaWGDyr4fLe8lyeoqsTJgvNH6H4UY98sVcI3jgiGqcD
	zgtt+QcNyXuRvXh3+w5E+7Tn5NiYF9bK4dHdmMgfLKJ5FAjXQorDMfoCzRBKyw==
X-Gm-Gg: ASbGncu3WbJpPblKTHRFoQxDJ+5yMaE1T2LPa5oLZBfWUsYpOP+ba5rKcL8/0v23UZZ
	eL5LRAnMYJx7XJWFWF2VcGlq9wc+5f6eyF0U/YfSVHf1op81VoKHoFHzvpGxca5cqz27LA1enTq
	8ApZKyDtAiBzkYKR6LO09+nyhqYZdWpqSLN5sCz8ANZ5NM5xeKA0/dd8KcQlbdy3GQf/DiQBXcr
	3VD7XPNsn1Bnz3iATcMS/tGBndKD34TScnai8rxF/4wQsVmOqqPvY3+Wz2ybzrWGhE8jX0WZUap
	xLIUqdtt+0I5
X-Google-Smtp-Source: AGHT+IF/0ntKZsypMhJqLoHZz7Y4KeXzGESSzQOBIbmcxUlmHH3DEZpbKATmONAsAAvwZztD3FrYtg==
X-Received: by 2002:a17:907:7707:b0:aa6:79fa:b483 with SMTP id a640c23a62f3a-aa6b0f1f0c0mr192342966b.0.1733911090953;
        Wed, 11 Dec 2024 01:58:10 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68880b3f7sm432885166b.92.2024.12.11.01.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:58:10 -0800 (PST)
Date: Wed, 11 Dec 2024 09:58:07 +0000
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
Message-ID: <Z1liL3BtoPnSyvlh@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
 <Z1hhHRdpCZcLs046@google.com>
 <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_015813_222082_8459C7C3 
X-CRM114-Status: GOOD (  32.38  )
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

On Tuesday 10 Dec 2024 at 15:51:01 (+0000), Fuad Tabba wrote:
> On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
> > > Initially I thought the comment was related to the warning below,
> > > which confused me.
> >
> > It actually is about the warning below :-)
> >
> > > Now I think what you're trying to say is that we'll
> > > allow the share, and the (unrelated to the comment) warning is to
> > > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > > count.
> >
> > So, the only case where the host should ever attempt do use
> > __pkvm_host_share_guest() on a page that is already shared is for a page
> > already shared *with an np-guest*. The page->host_share_guest_count being
> > elevated is the easiest way to check that the page is indeed in that
> > state, hence the warning.
> >
> > If for example the host was trying to share with an np-guest a page that
> > is currently shared with the hypervisor, that check would fail. We can
> > discuss whether or not we would want to allow it, but for now there is
> > strictly no need for it so I went with the restrictive option. We can
> > relax that constraint later if need be.
> >
> > > I think what you should have here, which would work better with the
> > > comment, is something like:
> > >
> > >                 /* Only host to np-guest multi-sharing is tolerated */
> > > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > > +                       return -EPERM;
> > >
> > > That would even make the comment unnecessary.
> >
> > I would prefer not adding this here, handle___pkvm_host_share_guest() in
> > hyp-main.c already does that for us.
> 
> I understand now, and I agree that an additional check isn't
> necessary. Could you clarify the comment though? It's the word "only"
> that threw me off, since to me it implied that the check was enforcing
> the word "only". Maybe:
> 
> >                 /* Tolerate host to np-guest multi-sharing. */

I guess 'only' is somewhat important, it is the _only_ type of
multi-sharing that we allow and the check enforces precisely that. The
WARN_ON() will be triggered for any other type of multi-sharing, so we
are really checking that _only_ np-guest multi-sharing goes through.

Perhaps the confusing part is that the code as-is relies on WARN_ON()
being fatal for the enforcement. Would it help if I changed the 'break'
statement right after to 'fallthrough' so we proceed to return -EPERM?
In practice we won't return anything as the hypervisor will panic, but
I presume it is better from a logic perspective.

Cheers,
Quentin

