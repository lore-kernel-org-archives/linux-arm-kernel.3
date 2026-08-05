Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B380C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNRmrl2B/brOKHnxIA/lHQtuwZlyNTPIK3U8kLKpdDc=; b=v6WBfv+AVsXRrKirMUgLAy0lV8
	Gmu+WIYCigLL9NdQJm7o3a9Kz3Tk9oYX4Z0ASec/q5ZSSw4zHzN2TElGb0hmj6ZrS0ack2oX487E/
	D3rBMfOh4Z7tEWwHdmaus7S2V3XCHmINHz8FVE3vqvHdrvPf+F+UybUFjfA6GGk6zNW30n3BcNFb4
	obU0cfDjsMAuHKN/cfSb6fDyMy+h/cek2HDFDDsy3GU1Txr8YehRyd8fgx7kIRVKd/+khVDBjHltV
	Hkqt2gZEnGS7LofumJqhoxq6ftE2kVQgvlDa2BVfspI3XcAwXlOBFjXWRU6AAlb5rXSHE85/Z8KVG
	/u9JIrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdVY-00000004BKb-4713;
	Wed, 05 Aug 2026 15:26:16 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdVW-00000004BK7-0uir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:26:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so10546a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785943572; x=1786548372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hNRmrl2B/brOKHnxIA/lHQtuwZlyNTPIK3U8kLKpdDc=;
        b=NioUf3JvS3Z0sriHXc6DJk2oxMYiNxAPePkLVCeI9mBdIsk6lRQhXUjP0yqd+oKiUJ
         wrhRVqOuUbljjp+pj9XWNKdtl60fRgwsDALQ9aqMPaCPYD/eO0vsk7G04DVGNEARdNaD
         cRBDaW0iA+N+EAgzsTq+qThAonTrHSiGiDX0FsQCkpbnPiCaNJYj0gBJmGxPFBcIdIfZ
         1ogDkJDVEH9ucxoA6y47QAGDYHE8HdeERsLdPPtTpxEUvhTGr0MOHdVteLF97D7aa1+o
         Z71QJHhUlFwS7pW9ukdJoJTzSPstArUEqGlnz8nTg7kE5O7+pPEjEFJWK6uo2sUKwH7T
         LwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943572; x=1786548372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNRmrl2B/brOKHnxIA/lHQtuwZlyNTPIK3U8kLKpdDc=;
        b=g4+k8QLGEfnO79Va6aVxEs/QAtYaoE6OztZgIk6KGTL8j3/x/kXkBVE5RHeQ3Dfr9t
         C3Sx0dOsJUMot2Xd7G3o1HJgWUL763YnYXRXKsl98o5Mfto+bxJV0sVnYwdvBkdYIZlS
         GUmBpp6VDa6dLeYAMP3isVUlRxwYqW3BpnJY7/QORJ2H0AyHoAFevp9oTY9YOnxsXpCQ
         B0pf4eqYBZI61WzSYkbO8E5yoFd2hmnYLIvEmV1d2QWSFjPKRuNU57+8cD2Bsl8pdSJX
         LJcaytn6b7CZ8hfygWnQCED46FrSaVMDZEbgUyKYJAf093z2hB8f8nAWxYxfgqXDTLGV
         qiOQ==
X-Gm-Message-State: AOJu0YzHYUGZD0zJlCxsgaBTi7loSFL6JLVuprGlguN5Kv5bcq9N41vX
	9GU0kr1LiiPssXzzyBwRTpM4hOjy8k5OVeBGfX0/9FaGJWu+cnTdSMT+N32Oo4PKmg==
X-Gm-Gg: AR+sD114MmaS0u832Lweh0POYdVAJXFHflnOMc986FHyxtu+qty0Pjo8PPEYFBx4bLT
	A/bPPyT/keWg2giGE11xEIGqL3waDuA9VzUkhsaXh0NdVNnHcF41QXcnhK5P/QN8oInYlLOF9N5
	PHgNNGZ4LNqyRTwpAbrtZcvsqD5385dIpUtJjnLXuOLf6YvOy6YAx2bLp5QwWh2HzWf/CvRZ2gF
	lABBx4RTGEEMoeuq8dkcy9tf0PP7TNTeDdr3fDbnIG7KT8TOZO3yZi+u6bO0HrCK0CN7mCEmKcX
	ilg5qNSXHR2V1waPrqkzML5fBDUnK2pF3nBCRKxx8inXHuV4RFOKGj9qsDCz8Hc736/Bh7VGseX
	jozkAOdZSaWVb5cAJAYFVgMmZ3/MNm8Mz0+IhXbeytpv1M8jA4S0JsiF5VDSirryIPZwvV67Q8Z
	CH9TwTfsGn/ZaCA0FyTFUqOVBPATV++Jvn2kY9Xj5KS+DhXpuf6c/IF9M2Gk1N1zvi/zL3IydQx
	07PqdxfMAMI/M+uUoAvuMx0NiwXpA==
X-Received: by 2002:a05:6402:44c8:b0:697:7f69:48e3 with SMTP id 4fb4d7f45d1cf-6a14fc7db15mr77076a12.10.1785943571545;
        Wed, 05 Aug 2026 08:26:11 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a17c55aa21sm1309954a12.21.2026.08.05.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:26:10 -0700 (PDT)
Date: Wed, 5 Aug 2026 15:26:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <anNWDt4fNFNkbSdO@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
 <anMwxy9gEEt_Wu6M@google.com>
 <anM9sk_gXTt5F1Ie@google.com>
 <anNPPrjGd2Z2dSwc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anNPPrjGd2Z2dSwc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_082614_284888_3E27DCC0 
X-CRM114-Status: GOOD (  26.34  )
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

On Wed, Aug 05, 2026 at 02:57:02PM +0000, Sebastian Ene wrote:
> > > > +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > > > +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> > > > +unlock:
> > > > +	host_unlock_component();
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> > > 
> > > This function seems to only update the host stage-2 annotation but it
> > > doesn't destroy the hyp mapping.
> > 
> > Yes, as mentioned above there is no way to destroy it, and this was
> > not desgined for frequent use. Typicaly, __pkvm_host_donate_hyp_mmio()
> > is called at boot per area/device. And __pkvm_hyp_donate_host_mmio()
> > is only used for failures.
> > 
> 
> Yes, I saw that you only allow the call during the init pKVM calls, however it seems a bit fragile.

Why is it fragile? Nothing is wrong with leaking private mapping it's
not real memory and it's massive, and given that this shouldn't happen
and will cause KVM to fail on the system, it is not that bad. (as
mentioned all other callers do the same)

> 
> > > 
> > > I was looking to make use of this patch in an upcoming posting for the
> > > v2 ITS hardening but in my case I don't need the private VA range
> > > creation.
> > 
> > I believe if you need to map MMIO, private range is the right way to
> > do it as the linear map was mainly designed around system memory.
> 
> Is there a reason behind not having MMIO as part of the linear
> map in the hypervisor ? I would like to avoid holding the hva around and
> just do a simple addition to resolve the hyp_va.

When the linear is created it only considers the system memory layout
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/va_layout.c#n82

Which means that on some systems an MMIO address can be larger than the
linear map.
There is another comment about tha also in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/hyp/nvhe/mm.c#n420

Thanks,
Mostafa

> 
> > 
> > Thanks,
> > Mostafa
> >
> 
> Thanks,
> Sebastian

