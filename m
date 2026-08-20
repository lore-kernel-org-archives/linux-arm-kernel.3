Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB6FC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmgch1bLAP5Yi9CKDLAKFoSYCSxauhaysBNZLyIqTyg=; b=SwuKWx5zXKT4LwF4WbQT6aLeqk
	cFvHisJIqvpOg6ZMWNhr0mY746s6P1b0iRuWBmP56FCFMQi3KJKdKX1/T3atxBYJotNt88YV/gyBr
	/eL3tj1ziDQSKp5FQA06CSWbmgBN1LGvJvTM3ThQotXDiep/yQCviXiMpJz18aNirfYtjj/ThkDmE
	UOInywoI5ngENgSa3qHJBl6JiPm9Y5+SEhOFtWbAD/h9G733skmTCnkeuMGxzkOeP81gBZkww7Y28
	iBisf7XXjeHotYaKJ7cjg+ZLA1Xt/kkeQ/Gd7rCyjxqOZ/Ejbvj7QrqcFueHtPj3U44bLhcl/MbTc
	H2xvECDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0yS-0000000BSSx-02Uk;
	Thu, 20 Aug 2026 11:30:20 +0000
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0yO-0000000BSQs-3nce
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:30:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OqIF4LDj3J7ikjkeCVzQqcDHvIZZRrdzH89ljTD8g20=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787225412; v=1; x=1787830212;
 b=kgjn3lpaQT1HWM9FlZlXowYq6CYcO1S9KjWs+UisZllpyLIKpl+kv/J5UW1n3MvdFlt0CqDS
 uQWnW1AE9/POt8SA5K3xdvq2mowIoUUjaujj6P6CkhRi2u01jxy1/80vvNOg05jrumm1tkyXDWW
 lLI5dG3tYsj5tKfJmyfbXIwo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f44.google.com (209.85.167.44)
	by smtp.migadu.com with ESMTPS id b3f0bf956410747e;
	Thu, 20 Aug 2026 11:30:12 +0000
X-Mizu-Trace-ID: b3f0bf956410747e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso8598e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqkXRVL00/bVkfsXuC5OrcSeqX4Pi19pD6gOyP4EVWjNIZ8DoyHFjmX33io9rX7Q5FZdiyl0Xm/AO9KObyWP56k@lists.infradead.org
X-Gm-Message-State: AOJu0YxCCv2kxS3JP2MQb1na3MwJXcJgHd7RroTt3GVb4wQcOUMfUL53
	gy+/5STmurwZcAbI1w1jDa7NtNHCP6i40oVTNYvPaZesXGJxGZVpqptrj0wnNDa4KVrokCD9YmA
	jXHQL1eYOTHtGjFC2Pr/QmErLngjwqTBG4i+kzkCe
X-Received: by 2002:a05:6512:3b88:b0:5a8:6646:d7b4 with SMTP id
 2adb3069b0e04-5b47dd877a7mr146343e87.1.1787225406760; Thu, 20 Aug 2026
 04:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260819102809.310708-1-fuad.tabba@linux.dev> <20260819102809.310708-2-fuad.tabba@linux.dev>
 <78d60d96-d0c7-4eaa-b425-ca4f75263b12@redhat.com> <871pbtoz7m.wl-maz@kernel.org>
In-Reply-To: <871pbtoz7m.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 20 Aug 2026 12:29:30 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxbhoa6140-EWQhXXjC=8DZkVSpGDSOYFrhybnQrdcsQQ@mail.gmail.com>
X-Gm-Features: AcwNN1W2LDdE_Byp_W3eAl_A609Io6u9cE21Rn601gKsnfbMx6Lgh7NQOHAxHyg
Message-ID: <CA+EHjTxbhoa6140-EWQhXXjC=8DZkVSpGDSOYFrhybnQrdcsQQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eauger@redhat.com>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Will Deacon <will@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_043017_725123_73D80380 
X-CRM114-Status: GOOD (  29.53  )
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

Hi Eric, Marc,

On Thu, 20 Aug 2026 at 11:34, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Eric,
>
> On Thu, 20 Aug 2026 11:09:06 +0100,
> Eric Auger <eauger@redhat.com> wrote:
> >
> > Hi Fuad,
> >
> > On 8/19/26 12:28 PM, Fuad Tabba wrote:
> > > A guest that disables the ITS and re-points or shrinks GITS_BASER<n>
> > > with VALID still set keeps the devices and collections it mapped
> > > against the old table, as KVM frees them only when VALID is cleared.
> > > The table format is not architected, so a write with a different value
> > > is allowed to lose what it describes. Free the list whenever the
> > I don't really get "a write with a different value is allowed to lose
> > what it describes". A write at which place, in the collection table?
>
> A write to the GITS_BASERn register describing the pointer to the
> collection table.
>
> The additional clarification is that because the *content* of the
> table is IMPDEF, if you point the ITS to a different location or size
> in memory, then there is no guarantee that the caches (the KVM
> internal data structures) are up to date. In this case, the proposed
> course of action is to invalidate the caches and start afresh.

My sentence should have said what the write was to. I'll spell it out
in v2 along the lines of your reply.

...

> > One question: There is no vgic_its_invalidate_cache() in the function.
> > Is it OK?
>
> Probably not. We should make sure that the translation cache is gone
> as well so that we retranslate and avoid signalling LPIs that have
> undergone such invalidation. Thanks for spotting this.

I'll add it in v2. The device branch already gets it through
vgic_its_free_device(), but the collection branch doesn't.

Thank you both,
/fuad

> > Besides out of curiosity, why don't we go further and remove ite entries
> > that refer to removed collections in vgic_its_free_collection()?
>
> The current policy is to keep the LPI alive as long as it is
> mapped. The only thing is that we can't signal it, obviously. But it
> would be legal to drop them altogether, only more work.
>
> An additional question is whether we should consider doing a reload of
> the collection table or not. I'm not keen on it, but I can also see
> how a guest could want to do this. Feels a bit over the top though.
>
> Thanks,
>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.

