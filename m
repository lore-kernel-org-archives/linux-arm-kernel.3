Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9ADC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRbzzkyTb3jdfnCCyeAUeJJsqm0ppzhdGbvkGq0K/Zs=; b=ecrdidIRhNzNhFFunDy3+sCYDG
	EejLwRFEy+o4U1mTZuqzyenk+W9JlC25VuU8k/yhxfJs1o0mlpBG+wwFsIXHRMSUVGC3W+MK++8mF
	CNYY5MAVLW8SEu7yC3yOe4nkghZaTJ7EgtVHnwdkuePyA3k3XB2G31voP0UfR+v1wfOVwAMh0gyk0
	N/ajU6QN96YBDtSOPg9qLTRIYkNK8Cx0dRdoNUqiFFpk3qyRQAzGJgZF4ywaMamX8IjImOz87G5yV
	f8mwHr/oSR5Cj1aiTNdPTExcF7Uej8HQTQyqYbYBkOscicdd+r0wWDYfl+GHaMK7B7xltVZs+GFoC
	r6ZqJAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Ol-00000006QFq-3omp;
	Thu, 06 Aug 2026 18:00:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Oj-00000006QFJ-1UhG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 18:00:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49954b88fffso9485065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786039251; x=1786644051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRbzzkyTb3jdfnCCyeAUeJJsqm0ppzhdGbvkGq0K/Zs=;
        b=EQXoZz+7LmkSRFiW48FGcwBLEp3aL5OOoOADSPua8ORS9bK77t4g8KtoEAM12UEacV
         pQXDMsFPV2UvR2wjqrjzJSeO3wRJE5T2vM9gtc5WVZZHtcmpdW0AgMyRkIaLymzlsF1A
         97xNrTFp755zfufpJppkRdxYY1UN70a31iZgdfFjJvO3kSGr5Q+yJgfP90NZKIFf2fZ7
         QCq74odKh1xN2o4TuLr5KbHJgnt2ElEoX2CVZODYDzamigvQQHZRxSBKZ7wp5aC8KWYI
         +gibutAq7uzPV/k27dx/+wfRRHJP97YdtFJj6khsKDmkELuEzMiV7QkytFl+WJ/HcahP
         PLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786039251; x=1786644051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRbzzkyTb3jdfnCCyeAUeJJsqm0ppzhdGbvkGq0K/Zs=;
        b=gWmu8HtH9io0oHoGIwYslSfiI8EgDVYUpsRtQEpIewrT8mB+JTDdZTOBbCO2kDZzIC
         jdX+xnMr4fMUUNS0+Nn3SNy40ULlmF/V8+o6h1OemdaTsdbkhumXn4xOdwsOxJDtoxL/
         r5+oIPXn5wp2aZyJdV4XWna8Z5hSKP1aBwh0eSJPDU5hP9do97KJBffk+HFNd7hnC14/
         AUmfL8DTIwNmk5KhicpG2nVgdvZ/Z9QArffXlO4ME3ARg9c8r/gfHgKEulkkROyUf8cu
         77Sa56pAs8xM74cmAgd3xPInGpOQ5dTCK5/AC/pfcm5jCgLCPCk/Dfxx0plLA+yK09jG
         NEKg==
X-Forwarded-Encrypted: i=1; AHgh+RqobK92ac4Zj+GTqRJPvYhqAjxSOakt27fDAIu0S06l5Z8ZyPNnsdt7/DIq+tDqgvt/y7qpydbly82oouzNPLyE@lists.infradead.org
X-Gm-Message-State: AOJu0YxJUpJ9+H0Ly75hIOO/YK+wmeNVwaGjeyaGM9uURiWvZ2ki9Cha
	HFTLRe0W6j4/Nh9Ab/TzMnpA8JuvOZv7UjralAncm3oLTSaRon6siF0f
X-Gm-Gg: AR+sD13yqoTX/sJWnA2LMMzAa/F6aLcI85Jgjbm8cN+9FassVpxur+K9h9hDGKTS57U
	7IGrq1anPfUCAMDqmoYNSNbamk5SEXV/mcPY6OPs+s41RBTgI9HN8mlOqK97ce2Rrwtm5gpGp7i
	NWcjMzutpqTH8F0pn1MaykXZoL2TcsRUxjbLV2B6/p4FoKxrP+/cCq8NE5ASuGsCGPkgaspclH0
	Z8mE2spnpKuvSEMWdh8mEOc0rOHVJ/yjKkfbc/zElfqutgJuLOKEGxyi/+jeKWSGzaCkIVcN9N0
	yn3wddoAkTXJ7+3FbrL8IXAEIT3BS57aAT+B/VDvwWV09bbgL4KQXSEizzMym4v/nMkJL6hQNP2
	Zo0ztAbJmSwLS3V+WbUnR5V+bt2l0HmTPLfOCj2DOOKdZTqVjsI6uJJv9QRkCF/nyAtfWrw5kRO
	K+ltBUC0TH0+CeW1gM2YuE7FAqHpo7gTQ8MAcpwiSchWccv4xB6P1l6EtouzZEAKu4pqOFZJRcm
	5K1WiNbrc/CXesCAxE7FaVljAkAPq4OyxyR6DnF1A4FgSYkgvK3+GhSvuW7dBeVkSVKWqhfxvmO
	1qMEmX9bVl2Y+dVtF5EJIMHrmfpi2wxrsajKhGfRj5tUX8GXbtaeOP5Bl2639faqxDw7AyUq
X-Received: by 2002:a05:600c:3422:b0:496:c18c:f9a1 with SMTP id 5b1f17b1804b1-4994e7cb6abmr177384855e9.14.1786039251156;
        Thu, 06 Aug 2026 11:00:51 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499541b86f5sm78547805e9.0.2026.08.06.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:00:50 -0700 (PDT)
Date: Thu, 6 Aug 2026 20:00:49 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, grayhat@foxmail.com
Subject: Re: [PATCH v2] KVM: arm64: nv: Keep the shadow S2 MMUs at fixed
 addresses
Message-ID: <anTJa-VDvgCE-Ax7@gmail.com>
References: <20260806062352.93489-1-kmehltretter@gmail.com>
 <vhpuadbpqligv2pfol6wsxtwpdkdeorlq2k5ifurwgry5pbh5x@jdm5jqm57sp3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vhpuadbpqligv2pfol6wsxtwpdkdeorlq2k5ifurwgry5pbh5x@jdm5jqm57sp3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_110053_432904_55BDAD6F 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Aug 06, 2026 at 03:49:35PM +0100, Wei-Lin Chang wrote:
> 
> I felt the commit message needs to be tightened a bit, so I restructured
> it slightly and removed some information I found unneeded. Here is my
> attempt, feel free to use it if you find it better or further improve it:

Hi Wei-Lin,

Thanks for the review! This is clearer, I'll tighten the commit message.

> 
> > +	/* Allocate the fixed-size pointer table once per VM. */
> 
> This comment seems a bit redundant.
> 

Agreed, I will drop it.

> > -	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
> > -		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
> > +	write_lock(&kvm->mmu_lock);
> 
> Opportunity to use guard() or scoped_guard() here.
> 

Good point. I seem to forget about guard. I will use it and send v3.

Thanks,
Karl

