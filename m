Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07A7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BWA0STOcqIUzpFQVaS5UHy7SE6OJhVfIhAfBgcIup8=; b=XSwhnEdhg3Qw+7pi1qEmpcoDoC
	2KYHM5FCjy+woThmbWsYrlq751I3I63CIh5sL3CNMjDwzGWHsWz9IojNHw45uCavYlKeybRsBdYR+
	6Aos0tYTG/9s1pYWCIzw4cCFc1w9wQiubvqGTQwbz+KeTgx/DaSFiyAzKqBD+U+5xl6Qnie/KdZb6
	HKx9Hke3gpFpCBFUEkFIicdZYmFy/c6vgWwhN75beY+BP1qIavpY1rdtLDP6uKzd2ahVBBxv/Bh5+
	CiqXrqvSS6c4RVAc/lzpXnDh5M3qxP8CTBlly8yaIUNZPtq24bJfyk2sD3ueSApZnLoPXu6nDyRCC
	KFXFhoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDad-0000000CIcz-285l;
	Tue, 05 Aug 2025 09:04:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujD5a-0000000CBPc-3mcq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 08:32:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-455b63bfa52so39225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754382725; x=1754987525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7BWA0STOcqIUzpFQVaS5UHy7SE6OJhVfIhAfBgcIup8=;
        b=V2vSctuKsLZKrwkt91aSvNTO7PAwDNCrabyLxVs1Xr1lIZAeiitBVXry8jas26KnBC
         S5wTIALHvxdd65OkUKl/VI3i/z54tixAo6xdfEVnEXhxWKzAo3iR7oXJkBDKhbyHYuw4
         Eh8KRLQ8tkrj1c8SxAekP+Lg7z0hkPJMbBmuNCp0WwAtUBxW60KAbwtCurH3zqPgsWJl
         ++pI0V/0SRYW44gpac/8EcEdUkZE+kaDnUmfHCAjBa6Z6kA3CNgGgXuFw8/eyg093V/h
         fk20VqfPAQzO5B3Us8NQW4D0JA4GViilz6xG/nQ2UJ1CfxklbcSBnSWnAEY3+JjzNkLt
         RtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754382725; x=1754987525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BWA0STOcqIUzpFQVaS5UHy7SE6OJhVfIhAfBgcIup8=;
        b=YIhSFxDSMmknwXOzEcDRyxR6hZH/Y1H6Ps0UMleOeXLWYdPEE5E6kIEkiE8lZ02Ra9
         jCLUqSIecqBDcHpd3Fe4lJNcrX1aIVYNuuG2PszYCBfM0avkIq+JwEFgSnU38YB26cq+
         aZqbMD8mDAI55KI0NwJU+WqI/MycX83r5pKvSkQ18NdF8rDs3uFZ9HEFpW/DR7yyO8ET
         gjERj2eR1Q2+Eed5jHtD/u+SwBc9uUjwYcuYAQ20eoplx9crOf33DyRBb0SRy81vBbbu
         MQ1V6YnLoGSEI4MqQf5nNh74Z/3+CfqSMDBZ+G9y0iWXlqWQPLmyhHxWKf/d0avkgXza
         oSng==
X-Forwarded-Encrypted: i=1; AJvYcCWrrKEFH5atnUfI3Pqoh8qe4rvUMgiNTTeDQumbKUSO8hH+bkKdvtX931SWnvNFBhTeLEoP9qnObgzElFpQAelH@lists.infradead.org
X-Gm-Message-State: AOJu0YwniSuaAf3ea95DjpdaGonJB3PvQYddAfvuAarrX9+rJlTl61kE
	s43S6d6N0yL3flOWa/V41orIjnG5Sqsow/NxsyV3Oaacn8P9S0cDVj2CN5y2f5c5IA==
X-Gm-Gg: ASbGnctZGwqXOW0G1+3PLMGsKG7SXmxuGURCFfvwN1s028f0d2qgSDee1hRODvlhzqt
	/uzKKwZylc6Hd3jaXsejSIAQTvpfygBQS0wWqdfJxVAz3YAXngNMww90SaS304/1twaerhw6kyE
	yoBbVKPYWiu6YexhXseqSZcGvMveRpykHTeTj6A4AQPFlVgOsD1hFa3q1vZ3g4koSql/tZUrLH5
	H39A95V4KBOpE5kUE1F+P4j8I/UrF0XeCAQs6e4KbfqVOw3gTP7XTcHP+qd6sBg+EeLL+Mq54LZ
	/4oQzUjgC6yHgE3Yx1KxC9o2k9W1kA1hQYC6mjQXND3uMWDlJEUpOZOPbaM+6zR9am4D5t6dMuF
	6WZV6oZ4nOM9wmiQevF/0IUinZeJoVMVr13buLXFbGmvqAkUrFDdzgnfMc5i64Pk=
X-Google-Smtp-Source: AGHT+IFKztsRYhYKwdwIDsCDgAVK6+r35a5h3+OYoOMO7aVdiPkoVmjrLzpy/fS3Hiy5FOXrT7eLpw==
X-Received: by 2002:a05:600c:888a:b0:439:8f59:2c56 with SMTP id 5b1f17b1804b1-459e269dbbamr469945e9.2.1754382724391;
        Tue, 05 Aug 2025 01:32:04 -0700 (PDT)
Received: from google.com (72.47.233.35.bc.googleusercontent.com. [35.233.47.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e075047fsm18416515e9.1.2025.08.05.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 01:32:03 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:31:59 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: ptdump: Fix exec attribute printing
Message-ID: <aJHBf4KCUPpWbyU5@google.com>
References: <20250802104021.3076621-1-r09922117@csie.ntu.edu.tw>
 <d72b7928-8646-4616-a8f0-96b9d9bbaf09@arm.com>
 <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_013206_943544_8C7FDCE5 
X-CRM114-Status: GOOD (  26.13  )
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

On Mon, Aug 04, 2025 at 08:41:35PM +0800, Wei-Lin Chang wrote:

Hi Wei-Lin,

> Hi Anshuman,
> 
> On Sun, Aug 03, 2025 at 07:33:04PM +0530, Anshuman Khandual wrote:
> > 
> > 
> > On 02/08/25 4:10 PM, Wei-Lin Chang wrote:
> > > Currently the guest stage-2 page table dump has the executable attribute
> > > printed in reverse, showing "X" for a non-executable region and showing
> > > " " for an executable one. This is caused by misjudgement of which
> > > string gets printed for the executable and non-executable case. Fix it
> > > by swapping the two strings.
> > > 
> > > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > > ---
> > >  arch/arm64/kvm/ptdump.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > > index 098416d7e5c25..99fc13f1c11fb 100644
> > > --- a/arch/arm64/kvm/ptdump.c
> > > +++ b/arch/arm64/kvm/ptdump.c
> > > @@ -44,8 +44,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
> > >  	}, {
> > >  		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
> > >  		.val	= PTE_VALID,
> > > -		.set	= " ",
> > > -		.clear	= "X",
> > > +		.set	= "X",
> > > +		.clear	= " ",
> > >  	}, {
> > >  		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > >  		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > 
> > Is not KVM_PTE_LEAF_ATTR_HI_S2_XN already in the reverse semantics aka
> > XN (Execute Never). Hence when KVM_PTE_LEAF_ATTR_HI_S2_XN macro is set
> > that means the entry is not executable and vice versa.
> 
> Yes you are correct. However in dump_prot() we have:
> 
> if ((st->current_prot & bits->mask) == bits->val)
> 	s = bits->set;
> else
> 	s = bits->clear;
> 
> Analysis:
> 
> 1. region is executable:
>     - st->current_prot == PTE_VALID (ignore other bits)
>     - st->current_prot & bits->mask gets PTE_VALID
>     - if condition is true (.val is PTE_VALID)
>     - prints bits->set
> 
> 2. region is not executable:
>     - st->current_prot == KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID
>     - st->current_prot & bits->mask gets (KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID)
>     - if condition is false
>     - prints bits->clear
> 
> Therefore we want .set = "X", and .clear = " ".


This seems correct but it will produce a different output than the
stage-1 ptdump. What if we drop the PTE_VALID from the mask & value as
Mark and Anshuman are suggesting and print NX when the bit is set and x
otherwise as the stage-1 ptdump does ?

> 
> Thanks,
> Wei-Lin Chang

Thanks,
Sebastian

