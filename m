Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38649C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKCj6FOnfKnqynF1p18ufhjCbVSDwmBzNnZjJrqA/Zs=; b=pqHrkJGmXOF72s1o8+msVZj5OP
	aPc4AHueLVLe42M9LTceA27UdFgesLP5U+l0UA2jb0HZ/c/GdPCEKprM4+ng9B2pSd7AIu66gEvvt
	wPPK49ZD0K/Bgf31SizfS+qqWJNXJ9ll4YUTRGyP3y7XICLNpPCBsVtqSStC7Dy7iz3nj9e4X/jN+
	rcwtK7cAYNsiMT7R31FhCVzh3hOCHzwlv7rcCruWVPUps6DZwL3hRiwIFis5A89DzQLWilSV7/oQL
	EI/8UyaV0y6LJtR0Vb+MrwDhiLcC7YkJaUDkoEYsHBAMbS+nIAfy1880EhlflA/t+q1XqZHl5C9mg
	X8+Hqzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiutx-0000000AU0g-1SIp;
	Mon, 04 Aug 2025 13:06:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuT2-0000000AOJf-1PC7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:39:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32128c1bf32so1592626a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 05:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754311143; x=1754915943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKCj6FOnfKnqynF1p18ufhjCbVSDwmBzNnZjJrqA/Zs=;
        b=KjKxqDVFtNeTSy7WOHo5/f3DM5OX62xdy+eEZSEju0CtXozYdTvh70LI0vXycVgofs
         +afVRMW3ugOGaXUd543xD/aA4rS84WgQMGhOvHyyUXa0+RPFWLsJtyh1E2zDAqkX9tBu
         yoZvBOXVXpdhNO2TAB78Fu6zj9hD22OFcsQwwCPkI+jCqgLo4PGmoXzc5BOWp304wZ45
         eeA2lnXReF2H68uUphZAb4ouL6w3X5JUe3+66IhUETrYyFuaQXks2D5z2EnnEC/NGqFZ
         rZl5ePPVo4J51ie8IJFqn0SbDkAadlW6OsUUk+8GP1dA+wSWj4xx0nBzxed91dOSrAOJ
         HKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311143; x=1754915943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKCj6FOnfKnqynF1p18ufhjCbVSDwmBzNnZjJrqA/Zs=;
        b=mYfcLLNEsTc3eqXWebVnvDK5UlBknkF+ovyUHWpXQGUit0V23pMem2E9VWyn9j4b9f
         t61epehsubbNfcrclnotl24AQcvIOKj4Pj1ArSW3BVIb1QLX019Sf+3ygeif1sGcgtJ9
         QKVpy87uUemVC20SOc5Uw0jLf+j7YHYgyMGuFGYhij8CJCw74iyN8fYK4ztnnPzb97w4
         +BydULQTyPErV6vAG4N2tO6kYrmNwKQzMcszuFC+zzXf32lXZZp3mGTCY1i9Elv/b7bi
         CrGWQhwMwKTRalQQ1KA5NGOACrW7IWoSQ7QHUyY0rTni8fEINdToiM7koLZd3c9JRHP8
         99fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQPgdjJ0/d4QoO0hkQTJENg8Uh/7sUsbX1y90vwI4v627FMTkCtyFOyupd2rMedDPpQtQzQN8pzBlb/xGw0c13@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4IVQ9jtEYSOV4SbDpynA7Q/UHZmS1YqZEwcRRmhf7Ltw8UrQD
	Pijw6eT7xpb2boepj5Di2TpAhxBIv0io2Fn03sqXs1j5mRG0Ld5RoQSpsHehOsKIQgyebOl1LG+
	WYqhscVBe4RB+zXOtQTLox5AzunwBelnU6I4ee2LbA38OphjPACpueycRavBRbY9SgjyFYg==
X-Gm-Gg: ASbGncua0sAr6u9+mmN6/DVNXWxNinZyqI71etPyxCShZz3ua5UQQ/agAs+2wPdMq1p
	eU3zBmy9+GPuw5poZ6t2RygFOHwB9kLryvr8MZdjBRihdzVAmDne0iGhNi8qZkvPFbXCGr3ZMZa
	YnEcUZAQ0avSdnu8007JS3lgWXcrqy2tZS6Q/kVNFor8m96g/V0YQTsbLlnj21PvVap+2/BMcHb
	+WMgkCRwA49U2EKMkt3dyZklyEol0iLD42HifWyhTElaGqa+0KDy1O4fDhnFDnVc1WZ/D74gd3i
	TXMkSWAWAmmOFzznwSWuSkQEwZ4fqfaVnDZlnlVDueW0vy9dJdCHlY1duD48MLLi3lBy/eOJpIL
	+XLR4wMEMTFWE8Cfs0vbbZrhCzGgu0QndsB0fZ98UzuD1kKqLh8xtM4W5zgXHcDzhD2ogtxE=
X-Google-Smtp-Source: AGHT+IFzfwXuQNe+jvCRtHRgBNrc6qR/ahRDyVponjDa59epA2QL+D64gAB3pXkW9DcRv6GRw24e4g==
X-Received: by 2002:a17:90b:1d8a:b0:313:1e60:584e with SMTP id 98e67ed59e1d1-321161ec88fmr13406605a91.9.1754311143029;
        Mon, 04 Aug 2025 05:39:03 -0700 (PDT)
Received: from zenbook (1-162-100-196.dynamic-ip.hinet.net. [1.162.100.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49e0sm14418422a91.24.2025.08.04.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:39:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 20:41:35 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: ptdump: Fix exec attribute printing
Message-ID: <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
References: <20250802104021.3076621-1-r09922117@csie.ntu.edu.tw>
 <d72b7928-8646-4616-a8f0-96b9d9bbaf09@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72b7928-8646-4616-a8f0-96b9d9bbaf09@arm.com>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_053904_377393_B7E7E82A 
X-CRM114-Status: GOOD (  20.34  )
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

Hi Anshuman,

On Sun, Aug 03, 2025 at 07:33:04PM +0530, Anshuman Khandual wrote:
> 
> 
> On 02/08/25 4:10 PM, Wei-Lin Chang wrote:
> > Currently the guest stage-2 page table dump has the executable attribute
> > printed in reverse, showing "X" for a non-executable region and showing
> > " " for an executable one. This is caused by misjudgement of which
> > string gets printed for the executable and non-executable case. Fix it
> > by swapping the two strings.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/ptdump.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > index 098416d7e5c25..99fc13f1c11fb 100644
> > --- a/arch/arm64/kvm/ptdump.c
> > +++ b/arch/arm64/kvm/ptdump.c
> > @@ -44,8 +44,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
> >  	}, {
> >  		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
> >  		.val	= PTE_VALID,
> > -		.set	= " ",
> > -		.clear	= "X",
> > +		.set	= "X",
> > +		.clear	= " ",
> >  	}, {
> >  		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> >  		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> 
> Is not KVM_PTE_LEAF_ATTR_HI_S2_XN already in the reverse semantics aka
> XN (Execute Never). Hence when KVM_PTE_LEAF_ATTR_HI_S2_XN macro is set
> that means the entry is not executable and vice versa.

Yes you are correct. However in dump_prot() we have:

if ((st->current_prot & bits->mask) == bits->val)
	s = bits->set;
else
	s = bits->clear;

Analysis:

1. region is executable:
    - st->current_prot == PTE_VALID (ignore other bits)
    - st->current_prot & bits->mask gets PTE_VALID
    - if condition is true (.val is PTE_VALID)
    - prints bits->set

2. region is not executable:
    - st->current_prot == KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID
    - st->current_prot & bits->mask gets (KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID)
    - if condition is false
    - prints bits->clear

Therefore we want .set = "X", and .clear = " ".

Thanks,
Wei-Lin Chang

