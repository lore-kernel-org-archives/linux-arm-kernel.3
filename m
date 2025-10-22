Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0440CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJdPu+39G4lB6AuXLRBW7mSkqYwO4pjl1bYy6jRlyTM=; b=JvHoG2CHjN782cVIU3TKyGJQkl
	1/rECv5dnKyOyxixqVmCA98MFQlu0o9+8NIVgxVK0AzZabfxeXbh/2YYSuquPbTnHXsIlr68/aTqn
	HYUOSFkUapyMUKjfJGX2MY0T6BTWmUVorc7m/fmesMubjO99SnjPuCNFXTMuN4JGqqZC65SgIdzlG
	gCkZenkXwDne06FzvOIjxVxfRH2thIhA2Ty2/V4S7iyfzUPu0/IcQ/wBX4HVzOOjDQxncqxc3FhBx
	KSryXVjzOLaXEqNrOjodzgfovRK75uSeQY+HUaLswYENPgjAWD0awMD8A6eSXdHG94LZLAZLuGG57
	iJMWK9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVIH-00000002HrS-3bSK;
	Wed, 22 Oct 2025 09:38:09 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVIF-00000002Hr9-0jYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:38:08 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4e8a9b35356so9862831cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761125886; x=1761730686; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJdPu+39G4lB6AuXLRBW7mSkqYwO4pjl1bYy6jRlyTM=;
        b=WhomTHpoKFHLzJTSyBdF6i+3/vulFtHWVxVj5qEGZYh9mKrn/z0MP86mb3lWEbDQJP
         pYKTLb86+jZiSitmfnmMsLFOaWBl6mQe0C0dK8dlSS6CLZJC2NIi1VZNIIfKF9IltuxD
         YPl996Xgv+/MWiIZxNAFJkb3aazRd/krv8i2wU0ihXZmjPCQ9a94/mZo68jNL+i5l9vL
         +5ijdXYPt/UTsY11sVs4WZafE/dFOUR2rGyqk3Ptbv5/6Dnleh+9tWHL4wai4zSyr/BE
         54crIqYZM1h/+41pAaCRTx90shRGmmI+6DXGFYhb67rqEn+rDNY7kXrwYU1maOVgjboI
         /M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125886; x=1761730686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJdPu+39G4lB6AuXLRBW7mSkqYwO4pjl1bYy6jRlyTM=;
        b=NmXhhvulObxLVwmg9idxvH0H9YEwbYocwoxgGJYLBSNjISkLpMbLiBABngQ1fx2Z+I
         GW3tJJ13XnXcywZ4lfsbJm+uYj4WDkOzhmnJstLpTuOj6pzaXOpBhdJNrdya5B64u4Xk
         twemYQoUwc9Bkwr+CZuGL/DAv7FPgGEqYLAH2YDyYo8tCGg4emhFRzqCsbRywSe7o0fI
         VqJow5XW946DSPRAtpxarhCGRSPhR2WATmsX8J8MniIMimeBVuZEFb/lzd/9mUt0SGeV
         lJs7CZDQI6sSiZ7etxH5E1ULmNnKkd90RDCLoCoKciXl/ikWhiUYP74h3tJaK0CKz5Du
         U4GA==
X-Forwarded-Encrypted: i=1; AJvYcCVp7R4Rpew1aNYYLXTqakr5fpOmPAzc2McqqZNH4oqYiq+ZrD5U5pO12wlWeeW9uqRLU7xhHJpKAzuPaKTpmBsb@lists.infradead.org
X-Gm-Message-State: AOJu0YzILHIkOZvjzgrJiOsfulTlh7eX8uAxJpDTOHooN/u3JXhG5eIe
	VII/KruVj/NOoL98n8b+ksfAZWQKnrNBUWoe6apfCIWgC0xJme+lA2ndUm27bP3EfVAcqOWaaLw
	/SkCfYS/e62NwuKyQBz0qFgnBuXKtRqk=
X-Gm-Gg: ASbGnctdQjX1URwLvq1keLL0Z4n9KZ1t85kT/jiWZ5WpMGh5kAWumSzQVwzkKQ/RFjX
	G+voUHS4UTtkLWcZwmoKK0rVuIWPnG8mEfUnCJBL111Zu2XuwqegzjZqziN4PwxKHPb6A1qJvUA
	PetaXLCkYSY6v87l91fbo2fUJqCZfEn5lbfim36R4Q0F4Egfg0yjYO7npoT7iK2sg07bmjFl4WM
	3HlG/JpDHnqftvn2MuZmq3vVxNK1Yf49+LRIU0e7zius/IyJmDnybsknyj1IcE+4Fr2xR8LDFmx
	rIPSi7MeJl43tXzFW+tcYBZFYCc=
X-Google-Smtp-Source: AGHT+IG7gcxDomeEPXSQvywf68coWtEHDrJFLjeKkKBNT49t32BEMq0zgoHm8kjhpWZ3V5AxfkOg+1IItd2+7snHvHM=
X-Received: by 2002:ac8:588d:0:b0:4e8:a2e8:3473 with SMTP id
 d75a77b69052e-4e8a2e8360amr228927981cf.13.1761125885712; Wed, 22 Oct 2025
 02:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
 <875xc78es0.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <875xc78es0.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 22:37:54 +1300
X-Gm-Features: AS18NWA2mUCn-m7yzg54mG9Xj4DEjFUtxQVduHJ8uk8kWT6HeuKAOvMULXrelik
Message-ID: <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Yin Fengwei <fengwei_yin@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_023807_282402_D09C6132 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

>
> With PTL, this becomes
>
> CPU0:                           CPU1:
>
> page fault                      page fault
> lock PTL
> write PTE
> do local tlbi
> unlock PTL
>                                 lock PTL        <- pte visible to CPU 1
>                                 read PTE        <- new PTE
>                                 do local tlbi   <- new PTE
>                                 unlock PTL

I agree. Yet the ish barrier can still avoid the page faults during CPU0's PTL.

CPU0:                                                                  CPU1:

lock PTL

write pte;
Issue ish barrier
do local tlbi;


    No page fault occurs if tlb misses


unlock PTL


Otherwise, it could be:


CPU0:                                                                  CPU1:

lock PTL

write pte;
Issue nsh barrier
do local tlbi;


    page fault occurs if tlb misses


unlock PTL


Not quite sure if adding an ish right after the PTE modification has any
noticeable performance impact on the test? I assume the most expensive part
is still the tlbi broadcast dsb, not the PTE memory sync barrier?

Thanks
Barry

